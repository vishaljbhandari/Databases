spool nikira-DML-AI-gsm.log
set feedback off ;
set serveroutput off ;

--nikira-DML-AI-exec.sql.parse.in

insert into rules_tags values ((select id from rules where name = 'AI Rate of Change Voice Profiling') , (select id from tags where name='CDR')) ;
update configurations set value=1 where config_key ='AI.ENABLE_ROC_VOICE_PROFILE';

commit ;

