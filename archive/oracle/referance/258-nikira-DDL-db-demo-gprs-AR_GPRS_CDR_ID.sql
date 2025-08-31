
spool nikira-DDL-db-demo-gprs-AR_GPRS_CDR_ID.log
set feedback off ;
set serveroutput off ;



CREATE SEQUENCE AR_GPRS_CDR_ID INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
commit;
spool off

