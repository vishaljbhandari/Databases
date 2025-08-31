set feedback off ;
set serveroutput on ;
spool migrations.log
	insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_WORKFLOW_POLLING_TIMEOUT', '50') ;
commit;
