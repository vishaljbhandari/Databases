spool test_cleanup_setup.log;
set feedback off;
set serveroutput on;
DROP TABLE CDR
/
CREATE TABLE CDR (
	ID                  NUMBER(20,0)    NOT NULL,
	NETWORK_ID          NUMBER(20,0)    NOT NULL,
	CALLER_NUMBER       VARCHAR2(40),
	CALLED_NUMBER       VARCHAR2(40),
	FORWARDED_NUMBER    VARCHAR2(40),
	RECORD_TYPE         NUMBER(20,0)    NOT NULL,
	DURATION            NUMBER(20,0)    NOT NULL,
	TIME_STAMP          DATE        	NOT NULL,
	EQUIPMENT_ID        VARCHAR2(40),
	IMSI_NUMBER         VARCHAR2(40) ,
	GEOGRAPHIC_POSITION VARCHAR2(32),
	CALL_TYPE           NUMBER(20,0)    NOT NULL,
	SUBSCRIBER_ID       NUMBER(20,0)    NOT NULL,
	VALUE               NUMBER(16,6)    NOT NULL,
	CDR_TYPE            NUMBER(20,0)    NOT NULL,
	SERVICE_TYPE        NUMBER(20,0)    NOT NULL,
	CDR_CATEGORY        NUMBER(20,0)    DEFAULT 1 NOT NULL,
	IS_COMPLETE         NUMBER(20)      NOT NULL,
	IS_ATTEMPTED        NUMBER(20)      NOT NULL,
	SERVICE             NUMBER(20,0) 	DEFAULT 2047,
	PHONE_NUMBER        VARCHAR2(40),	
	DAY_OF_YEAR         NUMBER(20,0) 	DEFAULT 0,
	HOUR_OF_DAY         NUMBER(20,0) 	DEFAULT 0,
	OTHER_PARTY_COUNTRY_CODE	VARCHAR2(32),
	VPMN                        VARCHAR2(40)
) ;
delete from record_subpartitions where table_name = 'CDR'
/
	drop table CDR_TEST ;
	drop table OFFLINE_CDR_TEST ;

spool off;
