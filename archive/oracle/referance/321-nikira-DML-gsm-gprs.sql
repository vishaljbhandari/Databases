spool nikira-DML-gsm-gprs.log
set feedback off ;
set serveroutput off ;

--Profiling Pseudo Field Functions and Record Config map     
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 40)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 7 from pseudo_functions where id = 40)  ;
commit ;

