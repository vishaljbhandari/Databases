set feedback off ;
set serveroutput on ;
spool migrations.log
	update CONFIGURATIONS set value = '1970/01/01' WHERE value IS NULL AND CONFIG_KEY like '%CLEANUP.RECORDS.%DAY_TRUNCED' ;
commit;
