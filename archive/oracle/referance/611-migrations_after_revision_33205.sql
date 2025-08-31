spool migrations_after_revision_33205.log

alter table archived_alarms drop column CASE_ID ;
alter table archived_alarms add CASE_NAME  VARCHAR2(32) ;

update field_configs set database_field = 'CASE_NAME' , data_type = 3 , reg_exp_id = 18 where record_config_id = 16 and name = 'Case Name' ;

@ ../rangerdefs.sql
@ ../archiver_package.sql
@ ../cleanup_package.sql

--For Slower Systems
update configurations set value = '60' where config_key = 'CLIENT_CONNECTION_TIMEOUT' ;

commit ;
spool off ; 
quit ;
