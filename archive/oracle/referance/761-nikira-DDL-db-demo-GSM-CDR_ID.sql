spool nikira-DDL-db-demo-GSM-CDR_ID.log
set feedback off ;
set serveroutput off ;

CREATE SEQUENCE CDR_ID INCREMENT BY 1000 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
commit;
spool off

