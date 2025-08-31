spool nikira-DDL-db-demo-alarm-denormalizer.log
set feedback off ;
set serveroutput off ;


SPOOL nikira-DDL-db-demo-alarm-denormalizer.log 
SET FEEDBACK OFF ;
set serveroutput off ;


CREATE TABLE TEMP_ID_1(
        ID                                              NUMBER(20,0) NOT NULL,
        ALERT_ID                                NUMBER(20,0) NOT NULL,
        REC_TYPE_IDENTIFIER             NUMBER(20,0) NOT NULL,
        AGGREGATION_TYPE                NUMBER(20,0) NOT NULL,
        AGGREGATION_VALUE               VARCHAR2(40) NOT NULL
);

CREATE TABLE TEMP_ID_2(
        ID                                              NUMBER(20,0) NOT NULL,
        ALERT_ID                                NUMBER(20,0) NOT NULL,
        REC_TYPE_IDENTIFIER             NUMBER(20,0) NOT NULL,
        AGGREGATION_TYPE                NUMBER(20,0) NOT NULL,
        AGGREGATION_VALUE               VARCHAR2(40) NOT NULL
);

CREATE TABLE TEMP_ID_3(
        ID                                              NUMBER(20,0) NOT NULL,
        ALERT_ID                                NUMBER(20,0) NOT NULL,
        REC_TYPE_IDENTIFIER             NUMBER(20,0) NOT NULL,
        AGGREGATION_TYPE                NUMBER(20,0) NOT NULL,
        AGGREGATION_VALUE               VARCHAR2(40) NOT NULL
);
CREATE TABLE TEMP_ID_CDM(
        ID                                              NUMBER(20,0) NOT NULL,
        ALERT_ID                                NUMBER(20,0) NOT NULL,
        REC_TYPE_IDENTIFIER             NUMBER(20,0) NOT NULL,
        AGGREGATION_TYPE                NUMBER(20,0) NOT NULL,
        AGGREGATION_VALUE               VARCHAR2(40) NOT NULL
);

commit ;

