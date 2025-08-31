spool nikira-DML-sp-st-rule.log
set feedback off ;
set serveroutput off ;

delete from record_configs_rules where rule_id in (
		select id from rules where name like '%Statistical Rule Template For%' and parent_id = 0 ) ;

delete from networks_rules where rule_id in (
		select id from rules where name like '%Statistical Rule Template For%' and parent_id = 0 ) ;

delete from rules where name like '%Statistical Rule Template For%' and parent_id = 0 ; 

--Adding Smart pattern templates for statistical rules
DECLARE
	cursor fp_entities is select id, description, record_config_id from fp_entities ; 
    record fp_entities%ROWTYPE;
    network_count number(20) ;
BEGIN
	 select count(*) into network_count from networks;
	     open fp_entities;
	     loop
	         fetch fp_entities into record;
	         exit when fp_entities%NOTFOUND;

			 insert into rules 
			 	select rules_seq.nextval, 0, rules_key_seq.nextval, 'Statistical Rule Template For ' || record.description, 0, record.id, 
						(select ACCUMULATION_FIELD_ID from pseudo_functions where id = 45) as ACCUMULATION_FIELD,
						(select ACCUMULATION_FUNCTION_ID from pseudo_functions where id = 45) as ACCUMULATION_FUNCTION_ID,
						45, 1, sysdate, sysdate, 100, 'radmin', 'Dummy Statistical Rule Template', 1, '', 1, 0, 0, 0, 0
					from dual ;

	 if (network_count = 1) then
		INSERT INTO networks_rules (rule_id, network_id)
											(select rules_seq.currval, id from networks) ;
	
	 else 
		if (network_count > 1) then
		INSERT INTO networks_rules (rule_id, network_id)
											(select rules_seq.currval, id from networks where id != 999) ;
	end if ;
	end if ;

			insert into record_configs_rules (rule_id, record_config_id) (select rules_seq.currval, record.record_config_id from dual) ; 

	    end loop;
	    close fp_entities;
EXCEPTION
	    when others then
	    dbms_output.put_line('Error while creating statistical rule template ' || sqlerrm);
END ;
/


commit ;

