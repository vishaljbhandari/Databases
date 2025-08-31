SPOOL ml_hmm_iaq_stats_package.log
set serveroutput off ;
create table analyst_picked_order_table_t 
(
    alarm_id        number (20, 0),
    status          number (1, 0),
    created_date    date,
    picked_date     date
) ;

create table current_day_picked_order_in_t 
(
    alarm_id        number (20, 0),
    status          number (1, 0),
    created_date    date,
    picked_date     date
) ;
create table picked_order_table_in_t 
(
    alarm_id        number (20, 0),
    status          number (1, 0),
    created_date    date,
    picked_date     date
) ;

CREATE SEQUENCE hmm_alarm_stack_table_t_seq   INCREMENT BY 1 START with 1  NOMAXVALUE MINVALUE 1 NOCYCLE  ;
create table hmm_alarm_stack_table_t 
(
 	id                number(20),
    investigation_date  date,
    day_of_year         number (20, 0),
    alarms_on_stack     number (20, 0),
    alarms_picked       number (20, 0)
) ;

CREATE SEQUENCE fraud_run_time_table_t_seq  INCREMENT BY 1 START with 1  NOMAXVALUE MINVALUE 1 NOCYCLE  ;
create table fraud_run_time_table_t 
( 
 	id                      number(20)  ,	
    frauds_selected         number (20, 0),
    frauds_left_on_stack    number (20, 0),
    runtime_selected        number (20, 0),
    runtime_total           number (20, 0)
) ;

CREATE SEQUENCE fraud_run_time_out_table_t_seq INCREMENT BY 1 START with 1  NOMAXVALUE MINVALUE 1 NOCYCLE  ;
create table fraud_run_time_out_table_t 
( 
 	id                      number(20),  	
    frauds_selected         number (20, 0),
    frauds_left_on_stack    number (20, 0),
    runtime_selected        number (20, 0),
    runtime_total           number (20, 0)
) ;
create or replace view hmm_iaq_alarm_v as
    select a.id, trunc(a.created_date) created_date, a.status, trunc(c.comment_date) comment_date
    from
        alarms a,
        (
            select alarm_id, comment_date
            from
                (
                    select alarm_id, comment_date,
                    count(*) over (partition by alarm_id order by comment_date rows unbounded preceding) cnt
                    from alarm_comments
                )
            where
                cnt = 1
        ) c,
        (
            select distinct id
            from ml_aq_alarm
        ) m
    where
        a.status in (2,4) and
        c.alarm_id = a.id  and
        m.id = a.id ;
/
create or replace package ml_hmm_iaq_stats
is
	procedure CompareFraudRunTimes ;
end ml_hmm_iaq_stats ;
/

create or replace package body ml_hmm_iaq_stats
is
	procedure GetAnalystPickedOrder 
	is
	begin
	insert into analyst_picked_order_table_t(alarm_id,created_date,status,picked_date) select id,created_date,status,comment_date from hmm_iaq_alarm_v;
	
	end GetAnalystPickedOrder ;
	procedure GetAnalystFraudRunTime  
									
	is
		StartDate			date ;
		NoOfDays			number ;
		ClosedFraudRunTime	pls_integer ;
		RunTimeTemp	pls_integer ;
		cursor AnalystFraudRunTimeCursor is select id,runtime_selected,runtime_total from fraud_run_time_table_t ;
		analyst_fraud_run_time AnalystFraudRunTimeCursor%ROWTYPE;
	begin
		select 
			min (picked_date) - 1, 
			max (picked_date) - min (picked_date) + 1
		into
			StartDate,
			NoOfDays
		from  analyst_picked_order_table_t ;
		insert into hmm_alarm_stack_table_t (investigation_date,day_of_year,alarms_on_stack,alarms_picked)
			select
					e.current_day investigation_date,
					to_char (e.current_day, 'ddd') day_of_year,
					count (*) alarms_on_stack,
					sum (decode(a.picked_date, e.current_day, 1, 0)) alarms_picked
			from
			analyst_picked_order_table_t a,(select StartDate + rownum as current_day
				from all_objects
				where rownum <= NoOfDays) e
			where
				e.current_day between a.created_date and a.picked_date
			group by e.current_day 
			order by day_of_year ;

		insert into fraud_run_time_table_t(frauds_selected,frauds_left_on_stack,runtime_selected,runtime_total)
		select
			sum (decode(status, 2, decode(a.picked_date, e.current_day, 1, 0), 0)) frauds_selected,
			sum (decode(status, 2, decode(a.picked_date, e.current_day, 0, 1), 0)) frauds_left_on_stack,
			sum (decode(status, 2, decode(a.picked_date, e.current_day, a.picked_date - a.created_date, 0), 0)) runtime_selected,
			sum (decode(status, 2, e.current_day - a.created_date, 0)) runtime_total
		from
			analyst_picked_order_table_t a,( select StartDate + rownum as current_day from all_objects where rownum <= NoOfDays) e
		where
		e.current_day between a.created_date and a.picked_date
		group by e.current_day; 
--		order by day_of_year ;	

		ClosedFraudRunTime := 0 ;
		open AnalystFraudRunTimeCursor;
		loop
		begin
		fetch AnalystFraudRunTimeCursor  into analyst_fraud_run_time; 
		exit when AnalystFraudRunTimeCursor%NOTFOUND ;
		RunTimeTemp:=0;
		update   fraud_run_time_table_t set runtime_total=analyst_fraud_run_time.runtime_total + ClosedFraudRunTime where id = analyst_fraud_run_time.id;
		select 	runtime_selected into RunTimeTemp from fraud_run_time_table_t where id = analyst_fraud_run_time.id;
		ClosedFraudRunTime := ClosedFraudRunTime + RunTimeTemp;
		end;
		end loop;
		close AnalystFraudRunTimeCursor;
	end GetAnalystFraudRunTime ;

	procedure GetHMMIAQPickedOrder 
							
	is
		RecCount		pls_integer ;
	 	cursor AlarmStackDetailsCursor is select * from hmm_alarm_stack_table_t;
		alarm_stack_detail AlarmStackDetailsCursor%ROWTYPE;
	begin

		open AlarmStackDetailsCursor;
		loop
		begin
		fetch AlarmStackDetailsCursor into alarm_stack_detail;
		exit when AlarmStackDetailsCursor%NOTFOUND;
		insert into current_day_picked_order_in_t(alarm_id, status, created_date)
select alarm_id, status, created_date from 
(
			 	select 
					alarm_id, status, created_date,alarm_stack_detail.investigation_date,
					count (*) over (order by score desc, created_date desc rows unbounded preceding) cnt2
				from
					(
					 	select a.alarm_id, m.score, a.status, a.created_date,
						count (*) over (partition by m.id order by trunc(m.gen_date) desc, m.score desc rows unbounded preceding) cnt1
						from 
							ml_aq_alarm m,
							analyst_picked_order_table_t a
						where
						trunc (m.gen_date) between a.created_date and alarm_stack_detail.investigation_date and
						m.id = a.alarm_id and
						m.id in 
							(
								select id from ml_aq_alarm 
								minus 
								select alarm_id from  picked_order_table_in_t 
							)
					
			
					)
				where cnt1=1 
				) 
				where 
					cnt2 <= alarm_stack_detail.alarms_picked ;
				

		end;
		end loop;
	insert into picked_order_table_in_t select alarm_id,status,created_date,picked_date from current_day_picked_order_in_t; 
	end GetHMMIAQPickedOrder ;


	procedure GetHMMIAQFraudRunTime 
								
	is
		ClosedFraudRunTime	pls_integer ;
		RunTimeTemp pls_integer;
		TableCount	number(20) ;
		cursor AnalystFraudRunTimeOutCursor is select id,runtime_total,runtime_selected from fraud_run_time_out_table_t ;
		analyst_fraud_run_time_out AnalystFraudRunTimeOutCursor%ROWTYPE;
	begin
		insert into fraud_run_time_out_table_t(frauds_selected,frauds_left_on_stack,runtime_selected,runtime_total) 
		select 
			sum (decode(h.status, 2, decode(h.picked_date, a.investigation_date, 1, 0), 0)) frauds_selected, 
			sum (decode(h.status, 2, decode(h.picked_date, a.investigation_date, 0, 1), 0)) frauds_left_on_stack,
			sum (decode(status, 2, decode(h.picked_date, a.investigation_date, h.picked_date - h.created_date, 0), 0)) runtime_selected, 
			sum (decode(status, 2, a.investigation_date - h.created_date, 0)) runtime_total
		from
			picked_order_table_in_t h,
			hmm_alarm_stack_table_t a
		where
			a.investigation_date between h.created_date and h.picked_date
		group by
			a.investigation_date ;

		ClosedFraudRunTime := 0 ;

		open AnalystFraudRunTimeOutCursor;
		loop
		begin
			fetch AnalystFraudRunTimeOutCursor  into analyst_fraud_run_time_out  ;
			exit when AnalystFraudRunTimeOutCursor%NOTFOUND ;
			update   fraud_run_time_out_table_t set runtime_total=analyst_fraud_run_time_out.runtime_total + ClosedFraudRunTime where id = analyst_fraud_run_time_out.id;

		select 	runtime_selected into RunTimeTemp from fraud_run_time_table_t where id = analyst_fraud_run_time_out.id;
		ClosedFraudRunTime := ClosedFraudRunTime + RunTimeTemp;
		end;
		end loop;
		close AnalystFraudRunTimeOutCursor;

	end GetHMMIAQFraudRunTime ;


	procedure CompareFraudRunTimes 
	is

	cursor AlarmStackDetailsCursor  is select * from hmm_alarm_stack_table_t;
	cursor AnalystFraudRunTimeCursor is select * from fraud_run_time_table_t ;
	cursor AnalystFraudRunTimeOutCursor is select * from fraud_run_time_out_table_t ;
		alarm_stack_detail AlarmStackDetailsCursor%ROWTYPE;
		analyst_fraud_run_time AnalystFraudRunTimeCursor%ROWTYPE;
		analyst_fraud_run_time_out AnalystFraudRunTimeOutCursor%ROWTYPE;

	begin

	execute immediate 'truncate table analyst_picked_order_table_t';
	 execute immediate 'truncate table current_day_picked_order_in_t'; 
	 execute immediate 'truncate table picked_order_table_in_t'; 
	 execute immediate 'truncate table hmm_alarm_stack_table_t'; 
	 execute immediate 'truncate table fraud_run_time_table_t'; 
	 execute immediate 'truncate table fraud_run_time_out_table_t'; 
 	GetAnalystPickedOrder  ;
 	GetAnalystFraudRunTime  ;

 	GetHMMIAQPickedOrder  ;
 	GetHMMIAQFraudRunTime  ;

 	dbms_output.put ('Date,Day Of Year,Alarms On Stack,Alarms Picked,') ;
 	dbms_output.put ('Fraud Selected, Fraud Left On Stack,Run Time For Frauds Closed, Cumulative Run Time, ') ;
 	dbms_output.put_line ('HMM Fraud Selected, HMM Fraud Left On Stack,HMM Run Time For Frauds Closed, HMM Cumulative Run Time,') ;

 	open AlarmStackDetailsCursor;
 	open AnalystFraudRunTimeCursor;
 	open AnalystFraudRunTimeOutCursor;
 	loop
 	begin
 	fetch AlarmStackDetailsCursor into alarm_stack_detail;
 	fetch AnalystFraudRunTimeCursor  into analyst_fraud_run_time ;
 	fetch AnalystFraudRunTimeOutCursor  into analyst_fraud_run_time_out ;
 	exit when AnalystFraudRunTimeOutCursor%NOTFOUND ;
 		
 		dbms_output.put_line (
 				to_char (alarm_stack_detail.investigation_date, 'dd/mm/yyyy') || ',' || 
 				alarm_stack_detail.day_of_year || ',' ||
 				alarm_stack_detail.alarms_on_stack || ',' ||
 				alarm_stack_detail.alarms_picked || ',' ||
 				analyst_fraud_run_time.frauds_selected || ',' ||
 				analyst_fraud_run_time.frauds_left_on_stack || ',' ||
 				analyst_fraud_run_time.runtime_selected || ',' ||
 				analyst_fraud_run_time.runtime_total || ',' || 
 				analyst_fraud_run_time_out.frauds_selected || ',' ||
 				analyst_fraud_run_time_out.frauds_left_on_stack || ',' ||
 				analyst_fraud_run_time_out.runtime_selected || ',' ||
 				analyst_fraud_run_time_out.runtime_total || ',' 
 				) ;
 	
 	end;
 	end loop;

end CompareFraudRunTimes;
end ml_hmm_iaq_stats ;
/

