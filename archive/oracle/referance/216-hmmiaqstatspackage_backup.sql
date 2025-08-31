SPOOL ml_hmm_iaq_stats_package.log
set serveroutput off ;


create type ml_hmm_picked_order_t as object
(
    alarm_id        number (20, 0),
    status          number (1, 0),
    created_date    date,
    picked_date     date
) ;
/

create type ml_hmm_picked_order_table_t as table of ml_hmm_picked_order_t ;
/

create type ml_hmm_alarm_stack_t as object
(
    investigation_date  date,
    day_of_year         number (20, 0),
    alarms_on_stack     number (20, 0),
    alarms_picked       number (20, 0)
) ;
/

create type ml_hmm_alarm_stack_table_t as table of ml_hmm_alarm_stack_t ;
/

create type ml_hmm_fraud_run_time_t as object
(
    frauds_selected         number (20, 0),
    frauds_left_on_stack    number (20, 0),
    runtime_selected        number (20, 0),
    runtime_total           number (20, 0)
) ;
/

create type ml_hmm_fraud_run_time_table_t as table of ml_hmm_fraud_run_time_t ;
/

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

create or replace package ml_hmm_iaq_stats
is
	procedure CompareFraudRunTimes ;
end ml_hmm_iaq_stats ;
/

create or replace package body ml_hmm_iaq_stats
is
	procedure GetAnalystPickedOrder (outAnalystPickedOrder out ml_hmm_picked_order_table_t)
	is
	begin
		select
			ml_hmm_picked_order_t (id, status, created_date, comment_date)
		bulk collect into outAnalystPickedOrder 
		from
			hmm_iaq_alarm_v ;
	end GetAnalystPickedOrder ;

	procedure GetHMMIAQPickedOrder (inAlarmStackDetails in ml_hmm_alarm_stack_table_t, inAnalystPickedOrder in ml_hmm_picked_order_table_t, 
										inoutHMMIAQPickedOrder in out ml_hmm_picked_order_table_t)
	is
		RecCount		pls_integer ;
		CurrentDayHMMIAQPickedOrder ml_hmm_picked_order_table_t := ml_hmm_picked_order_table_t () ;
	begin
		for i in 1..inAlarmStackDetails.count
		loop
			CurrentDayHMMIAQPickedOrder.delete ;

			select ml_hmm_picked_order_t (alarm_id, status, created_date, inAlarmStackDetails(i).investigation_date)
			bulk collect into CurrentDayHMMIAQPickedOrder
			from
			(
			 	select 
					alarm_id, status, created_date,
					count (*) over (order by score desc, created_date desc rows unbounded preceding) cnt2
				from
					(
					 	select a.alarm_id, m.score, a.status, a.created_date,
						count (*) over (partition by m.id order by trunc(m.gen_date) desc, m.score desc rows unbounded preceding) cnt1
						from 
							ml_aq_alarm m,
							table (cast(inAnalystPickedOrder as ml_hmm_picked_order_table_t)) a
						where
						trunc (m.gen_date) between a.created_date and inAlarmStackDetails (i).investigation_date and
						m.id = a.alarm_id and
						m.id in 
							(
								select id from ml_aq_alarm 
								minus 
								select alarm_id from table (cast(inoutHMMIAQPickedOrder as ml_hmm_picked_order_table_t))
							)
					) 
				where 
					cnt1 = 1 
				)
			where
				cnt2 <= inAlarmStackDetails (i).alarms_picked ;

			RecCount := inoutHMMIAQPickedOrder.count ;
			inoutHMMIAQPickedOrder.extend (CurrentDayHMMIAQPickedOrder.count) ;

			for j in 1..CurrentDayHMMIAQPickedOrder.count 
			loop
				inoutHMMIAQPickedOrder (j + RecCount) := CurrentDayHMMIAQPickedOrder (j) ;
			end loop ;

		end loop ;
	end GetHMMIAQPickedOrder ;

	procedure GetAnalystFraudRunTime (inAnalystPickedOrder in ml_hmm_picked_order_table_t, outAlarmStackDetails out ml_hmm_alarm_stack_table_t, 
										outAnalystFraudRunTime out ml_hmm_fraud_run_time_table_t)
	is
		StartDate			date ;
		NoOfDays			number ;
		ClosedFraudRunTime	pls_integer ;
	begin
		select 
			min (picked_date) - 1, 
			max (picked_date) - min (picked_date) + 1
		into
			StartDate,
			NoOfDays
		from table (cast(inAnalystPickedOrder as ml_hmm_picked_order_table_t)) ;

		select 
			ml_hmm_alarm_stack_t (investigation_date, day_of_year, alarms_on_stack, alarms_picked),
			ml_hmm_fraud_run_time_t (frauds_selected, frauds_left_on_stack, runtime_selected, runtime_total)
		bulk collect into
			outAlarmStackDetails,
			outAnalystFraudRunTime
		from
		(
			with enum_days as
			(
				select StartDate + rownum as current_day
				from all_objects
				where rownum <= NoOfDays
			)
			select
					e.current_day investigation_date,
					to_char (e.current_day, 'ddd') day_of_year,
					count (*) alarms_on_stack,
					sum (decode(a.picked_date, e.current_day, 1, 0)) alarms_picked,
					sum (decode(status, 2, decode(a.picked_date, e.current_day, 1, 0), 0)) frauds_selected,
					sum (decode(status, 2, decode(a.picked_date, e.current_day, 0, 1), 0)) frauds_left_on_stack,
					sum (decode(status, 2, decode(a.picked_date, e.current_day, a.picked_date - a.created_date, 0), 0)) runtime_selected,
					sum (decode(status, 2, e.current_day - a.created_date, 0)) runtime_total
			from
				table (cast(inAnalystPickedOrder as ml_hmm_picked_order_table_t)) a,
				enum_days e
			where
				e.current_day between a.created_date and a.picked_date
			group by e.current_day 
		) 
		order by day_of_year ;	

		ClosedFraudRunTime := 0 ;
		for i in 1..outAnalystFraudRunTime.count
		loop
			outAnalystFraudRunTime (i).runtime_total := outAnalystFraudRunTime (i).runtime_total + ClosedFraudRunTime ;
			ClosedFraudRunTime := ClosedFraudRunTime + outAnalystFraudRunTime (i).runtime_selected ;
		end loop ;
		
	end GetAnalystFraudRunTime ;

	procedure GetHMMIAQFraudRunTime (inHMMIAQPickedOrder in ml_hmm_picked_order_table_t, inAlarmStackDetails in ml_hmm_alarm_stack_table_t, 
										outHMMIAQFraudRunTime out ml_hmm_fraud_run_time_table_t)
	is
		ClosedFraudRunTime	pls_integer ;
	begin
		select 
			ml_hmm_fraud_run_time_t (frauds_selected, frauds_left_on_stack, runtime_selected, runtime_total)
		bulk collect into outHMMIAQFraudRunTime
		from
		(
		 	select 
				sum (decode(h.status, 2, decode(h.picked_date, a.investigation_date, 1, 0), 0)) frauds_selected, 
				sum (decode(h.status, 2, decode(h.picked_date, a.investigation_date, 0, 1), 0)) frauds_left_on_stack,
				sum (decode(status, 2, decode(h.picked_date, a.investigation_date, h.picked_date - h.created_date, 0), 0)) runtime_selected, 
				sum (decode(status, 2, a.investigation_date - h.created_date, 0)) runtime_total
			from
				table (cast(inHMMIAQPickedOrder as ml_hmm_picked_order_table_t)) h,
				table (cast(inAlarmStackDetails as ml_hmm_alarm_stack_table_t)) a
			where
				a.investigation_date between h.created_date and h.picked_date
			group by
				a.investigation_date
		) ;

		ClosedFraudRunTime := 0 ;
		for i in 1..outHMMIAQFraudRunTime.count
		loop
			outHMMIAQFraudRunTime (i).runtime_total := outHMMIAQFraudRunTime (i).runtime_total + ClosedFraudRunTime ;
			ClosedFraudRunTime := ClosedFraudRunTime + outHMMIAQFraudRunTime (i).runtime_selected ;
		end loop ;
			
	end GetHMMIAQFraudRunTime ;

	procedure CompareFraudRunTimes 
	is
		AnalystPickedOrder		ml_hmm_picked_order_table_t := ml_hmm_picked_order_table_t () ;
		HMMIAQPickedOrder		ml_hmm_picked_order_table_t := ml_hmm_picked_order_table_t () ;

		AlarmStackDetails		ml_hmm_alarm_stack_table_t := ml_hmm_alarm_stack_table_t () ;
		AnalystFraudRunTime		ml_hmm_fraud_run_time_table_t := ml_hmm_fraud_run_time_table_t () ;
		HMMIAQFraudRunTime		ml_hmm_fraud_run_time_table_t := ml_hmm_fraud_run_time_table_t () ;
	begin
		GetAnalystPickedOrder (AnalystPickedOrder) ;
		GetAnalystFraudRunTime (AnalystPickedOrder, AlarmStackDetails, AnalystFraudRunTime) ;

		GetHMMIAQPickedOrder (AlarmStackDetails, AnalystPickedOrder, HMMIAQPickedOrder) ;
		GetHMMIAQFraudRunTime (HMMIAQPickedOrder, AlarmStackDetails, HMMIAQFraudRunTime) ;

		dbms_output.put ('Date,Day Of Year,Alarms On Stack,Alarms Picked,') ;
		dbms_output.put ('Fraud Selected, Fraud Left On Stack,Run Time For Frauds Closed, Cumulative Run Time, ') ;
		dbms_output.put_line ('HMM Fraud Selected, HMM Fraud Left On Stack,HMM Run Time For Frauds Closed, HMM Cumulative Run Time,') ;

		for i in 1..AlarmStackDetails.count
		loop
			dbms_output.put_line (
					to_char (AlarmStackDetails(i).investigation_date, 'dd/mm/yyyy') || ',' || 
					AlarmStackDetails (i).day_of_year || ',' ||
					AlarmStackDetails (i).alarms_on_stack || ',' ||
					AlarmStackDetails (i).alarms_picked || ',' ||
					AnalystFraudRunTime (i).frauds_selected || ',' ||
					AnalystFraudRunTime (i).frauds_left_on_stack || ',' ||
					AnalystFraudRunTime (i).runtime_selected || ',' ||
					AnalystFraudRunTime (i).runtime_total || ',' || 
					HMMIAQFraudRunTime (i).frauds_selected || ',' ||
					HMMIAQFraudRunTime (i).frauds_left_on_stack || ',' ||
					HMMIAQFraudRunTime (i).runtime_selected || ',' ||
					HMMIAQFraudRunTime (i).runtime_total || ',' 
					) ;
		end loop ;

	end CompareFraudRunTimes ;
end ml_hmm_iaq_stats ;
/

show error ;
