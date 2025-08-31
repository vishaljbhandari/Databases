spool nikira-DDL-db-demo-subscriber-file1.log
set feedback off ;
set serveroutput off ;


CREATE SEQUENCE SUBSCRIBER_ID INCREMENT BY 1 START WITH 1025 NOMAXVALUE NOMINVALUE NOCYCLE CACHE 20 ORDER;

COMMIT;
spool off
