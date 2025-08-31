spool nikira-DML-sparkBugFix.log
set feedback off ;
set serveroutput on ;
delete from scheduler_command_maps where job_name='Cleaning of Partial Record Temporary Table' and not exists (select 1 from record_configs where id = 1 and is_spark_support=1) ;
update record_configs set is_partitioned = 1 where is_spark_support=1 ;

update field_configs set position = 27, derivative_function=null where database_field ='OTHER_PARTY_COUNTRY_CODE' and record_config_id=1 and exists (select 1 from record_configs where id=1 and is_spark_support=1) ;

commit ;
/
