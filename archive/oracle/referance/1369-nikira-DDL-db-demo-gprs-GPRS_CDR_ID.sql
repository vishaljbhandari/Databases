spool nikira-DDL-db-demo-gprs-GPRS_CDR_ID.log
set feedback off ;
set serveroutput off ;



CREATE SEQUENCE GPRS_CDR_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;

commit;
spool off

