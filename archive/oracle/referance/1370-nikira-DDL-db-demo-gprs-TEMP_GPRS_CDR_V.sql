spool nikira-DDL-db-demo-gprs-TEMP_GPRS_CDR_V.log
set feedback off ;
set serveroutput off ;



CREATE OR REPLACE VIEW TEMP_GPRS_CDR_V AS SELECT * FROM TEMP_GPRS_CDR_0 ;
commit;
spool off

