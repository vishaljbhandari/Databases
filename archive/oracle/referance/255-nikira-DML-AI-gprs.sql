spool nikira-DML-AI-gprs.log
set feedback off ;
set serveroutput off ;

--nikira-DML-AI-exec.sql.parse.in

insert into rules_tags values ((select id from rules where name = 'AI Rate of Change Data Profiling'), (select id from tags where name='GPRS')) ;

update configurations set value=1 where config_key ='AI.ENABLE_ROC_DATA_PROFILE';

commit ;

