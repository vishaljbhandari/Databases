spool nikira-DDL-i2-db.log
set feedback off ;
set serveroutput off ;

CREATE SEQUENCE ALARMLINK_PRECHECK_FIELDS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE ALARMLINK_PRECHECK_FIELDS (ID number(20), RECORD_CONFIG_ID number(20), FIELD_ID varchar2(20)) ;

create sequence tmp_table_for_i2_seq increment by 1 start with 1 minvalue 1 maxvalue 100000 cycle cache 20 order ;
commit;
