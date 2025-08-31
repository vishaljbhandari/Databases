--Generated from ./nikira-DDL-db-demo-gprs-2.sql.parse.in by setup.sh at Mon Oct 24 20:20:41 IST 2011
spool nikira-DDL-db-demo-gprs-2.log
set feedback off ;
set serveroutput off ;




CREATE INDEX IX_AR_GPRSCDR_PHONE_NUMBER ON ARCHIVED_GPRS_CDR(PHONE_NUMBER) ;

CREATE OR REPLACE VIEW ALARM_GPRS_CDR_V AS SELECT * FROM ALARM_GPRS_CDR ;
CREATE OR REPLACE VIEW ARCHIVED_ALARM_GPRS_CDR_V AS SELECT * FROM ARCHIVED_ALARM_GPRS_CDR ;

commit;
spool off


