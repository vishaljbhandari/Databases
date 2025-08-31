set serveroutput off
SET FEEDBACK OFF 

alter table expressions add NAME VARCHAR2(256);
alter table feature_status drop column parent_id;
drop sequence xdr_offline_temp_maps_seq ;
create sequence xdr_offline_temp_maps_seq increment by 1 nomaxvalue start with 6  minvalue 1 nocycle cache 20 order;

CREATE OR REPLACE PROCEDURE expression_bc
as
	num number:=0;
	cursor cur1 is
	(select name ,id from filters);	


	cur cur1%ROWTYPE;
BEGIN
	
	update expressions
	set name=NULL;

	open cur1 ;
	loop
		fetch cur1 into cur ;
		exit when cur1%NOTFOUND ;

		num := 0;

		for rec in (select expression_id from filter_tokens where filter_id=cur.id)
		loop

			num :=num+1;
			update expressions
			set name='EXP_'||cur.name||'_'||num
			where ID=rec.expression_id;	
			
		end loop; 

		update expressions
		set name =id
		where name is null;

	end loop ;
	close cur1 ;

commit;
END expression_bc ;
/

CREATE OR REPLACE PROCEDURE filters_bc
as

	cursor cur1 is
	(select 'RULE_'|| r.key||'_'||r.version||'_'||f.record_config_id  as value , f.id  as id from rules r, filters f, filters_rules  fr where f.id = fr.filter_id and r.id = fr.rule_id);
		
	cur cur1%ROWTYPE;
BEGIN
	
	update filters
	 set name =NULL;
   


	open cur1 ;
	loop
		fetch cur1 into cur ;
		exit when cur1%NOTFOUND ;

		update filters 
		set name= cur.value
		where id =cur.id;
		dbms_output.put_line('cur.id: '||cur.id||' and value: '||cur.value) ;
		
		update filters
		set name =id
		where name is null;

	end loop ;
	close cur1 ;

commit;
END filters_bc ;
/


--drop table MULTIPLE_THRESHOLDS;
--drop table PROFILE_COUNTER;

--drop sequence CDR_SEQ;
--drop sequence GPRS_CDR_SEQ;
--drop sequence IPDR_SEQ;
--drop sequence LTE_SEQ;
--drop sequence MULTIPLE_THRESHOLDS_SEQ;
--drop sequence RECHARGE_LOGS_SEQ;

drop sequence counter_maps_seq;
create sequence counter_maps_seq increment by 1 nomaxvalue minvalue 15 nocycle cache 20 order ;

