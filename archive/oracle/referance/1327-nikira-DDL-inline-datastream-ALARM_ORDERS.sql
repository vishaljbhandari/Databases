
spool nikira-DDL-inline-datastream-ALARM_ORDERS.log
set feedback off ;
set serveroutput off ;

CREATE TABLE ALARM_ORDERS
(
    ID                      NUMBER(20,0)    NOT NULL,
    ORDER_NUMBER            VARCHAR2(40)    NOT NULL,
    UNIQUE_ID_NO            VARCHAR2(40)    NOT NULL,
    FIRST_NAME              VARCHAR2(40),
    MIDDLE_NAME             VARCHAR2(40),
    LAST_NAME               VARCHAR2(40),
    ADDRESS_LINE_1          VARCHAR2(256),
    ADDRESS_LINE_2          VARCHAR2(256),
    ADDRESS_LINE_3          VARCHAR2(256),
    CITY                    VARCHAR2(40),
    POST_CODE               VARCHAR2(20),
    COMMENTS                VARCHAR2(512),
    ORDER_DATE              DATE            NOT NULL,
    HOME_PHONE_NUMBER       VARCHAR2(40),
    OFFICE_PHONE_NUMBER     VARCHAR2(40),
    CONTACT_PHONE_NUMBER    VARCHAR2(40),
    NETWORK_ID              NUMBER(10)      NOT NULL,
    ALERT_ID                NUMBER(20,0)    NOT NULL,
    DAY_OF_YEAR             NUMBER(20)
);

CREATE TABLE ARCHIVED_ORDERS
(
    ID                      NUMBER(20,0)    NOT NULL,
    ORDER_NUMBER            VARCHAR2(40)    NOT NULL,
    UNIQUE_ID_NO            VARCHAR2(40)    NOT NULL,
    FIRST_NAME              VARCHAR2(40),
    MIDDLE_NAME             VARCHAR2(40),
    LAST_NAME               VARCHAR2(40),
    ADDRESS_LINE_1          VARCHAR2(256),
    ADDRESS_LINE_2          VARCHAR2(256),
    ADDRESS_LINE_3          VARCHAR2(256),
    CITY                    VARCHAR2(40),
    POST_CODE               VARCHAR2(20),
    COMMENTS                VARCHAR2(512),
    ORDER_DATE              DATE            NOT NULL,
    HOME_PHONE_NUMBER       VARCHAR2(40),
    OFFICE_PHONE_NUMBER     VARCHAR2(40),
    CONTACT_PHONE_NUMBER    VARCHAR2(40),
    NETWORK_ID              NUMBER(10)      NOT NULL,
    DAY_OF_YEAR             NUMBER(20)
);

CREATE TABLE ARCHIVED_ALARM_ORDERS AS SELECT * FROM ALARM_ORDERS ;
CREATE INDEX IX_AR_ALM_ORD_ALT_ID ON  ARCHIVED_ALARM_ORDERS("ALERT_ID") ;

commit;
spool off
