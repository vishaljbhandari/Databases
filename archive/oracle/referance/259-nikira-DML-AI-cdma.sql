spool nikira-DML-AI-cdma.log
set feedback off ;
set serveroutput off ;

--nikira-DML-AI-exec.sql.parse.in

update configurations set value=1 where config_key ='AI.ENABLE_ROC_VOICE_PROFILE';
----Translation Entries for CDMA
insert into translations(id, tr_id, key, value) values (26, 5, '2', 'CDMA') ;
commit ;

