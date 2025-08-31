spool nikira-DDL-db-demo-subscriber-file2.log
set feedback off ;
set serveroutput off ;




CREATE OR REPLACE VIEW SUBSCRIBER_V (
        ACCOUNT_ID,
        ACCOUNT_NAME,
        ACCOUNT_DOA,
        NETWORK_ID,
        FIRST_NAME,
        MIDDLE_NAME,
        LAST_NAME,
        ADDRESS_LINE_1,
        ADDRESS_LINE_2,
        ADDRESS_LINE_3,
        CITY,
        POST_CODE,
        CREDIT_LIMIT,
        RATE_PLAN,
        MODIFIED_DATE,
        SUBSCRIBER_ID,
        PHONE_NUMBER,
        SUBSCRIBER_DOA,
        HOME_PHONE_NUMBER,
        OFFICE_PHONE_NUMBER,
        CONTACT_PHONE_NUMBER,
        MCN1,
        MCN2,
        IMSI,
        IMEI,
        CONNECTION_TYPE,
        GROUPS,
        SERVICES,
        STATUS,
        QOS,
        PRODUCT_TYPE,
        SUBSCRIBER_TYPE
        )
AS SELECT
        A.ID as ACCOUNT_ID,
        A.ACCOUNT_NAME,
        A.ACCOUNT_DOA,
        S.NETWORK_ID,
        A.FIRST_NAME,
        A.MIDDLE_NAME,
        A.LAST_NAME,
        A.ADDRESS_LINE_1,
        A.ADDRESS_LINE_2,
        A.ADDRESS_LINE_3,
        A.CITY,
        A.POST_CODE,
        A.CREDIT_LIMIT,
        A.RATE_PLAN,
        S.MODIFIED_DATE,
         S.ID as SUBSCRIBER_ID,
        S.PHONE_NUMBER,
        S.SUBSCRIBER_DOA,
        S.HOME_PHONE_NUMBER,
        S.OFFICE_PHONE_NUMBER,
        S.CONTACT_PHONE_NUMBER,
        S.MCN1,
        S.MCN2,
        S.IMSI,
        S.IMEI,
        S.CONNECTION_TYPE,
        S.GROUPS,
        S.SERVICES,
        S.STATUS,
        S.QOS,
        S.PRODUCT_TYPE,
        S.SUBSCRIBER_TYPE
FROM ACCOUNT A, SUBSCRIBER S
WHERE  A.ID = S.ACCOUNT_ID
AND S.SUBSCRIBER_TYPE in (0,1)
AND A.ACCOUNT_TYPE in (0,1)  ;
        
CREATE OR REPLACE VIEW SUBSCRIBER_ACCOUNT_V AS
SELECT
        A.ID AS ACCOUNT_ID,
        A.HIERARCHY_ID,
        A.PARENT_ID,
        A.ACCOUNT_TYPE,
        A.ACCOUNT_NAME,
        A.ACCOUNT_DOA,
        A.NETWORK_ID AS ACCOUNT_NETWORK_ID,
        A.FIRST_NAME,
        A.MIDDLE_NAME,
        A.LAST_NAME,
        A.ADDRESS_LINE_1,
        A.ADDRESS_LINE_2,
        A.ADDRESS_LINE_3,
        A.CITY,
        A.POST_CODE,
        A.CREDIT_LIMIT,
        A.RATE_PLAN,
        A.FRD_INDICATOR,
        A.COMMENTS,
        A.GROUPS AS ACCOUNT_GROUPS,
        A.MODIFIED_DATE AS ACCOUNT_MODIFIED_DATE,
    S.ID AS SUBSCRIBER_ID,
    S.SUBSCRIBER_TYPE,
    S.PHONE_NUMBER,
    S.SUBSCRIBER_DOA,
    S.HOME_PHONE_NUMBER,
     S.OFFICE_PHONE_NUMBER,
    S.CONTACT_PHONE_NUMBER,
    S.MCN1,
    S.MCN2,
    S.IMSI,
    S.IMEI,
    S.CONNECTION_TYPE,
    S.GROUPS AS SUBSCRIBER_GROUPS,
    S.SERVICES,
    S.STATUS,
    S.QOS,
    S.PRODUCT_TYPE,
    S.MODIFIED_DATE     AS SUBSCRIBER_MODIFIED_DATE,
    S.NETWORK_ID AS NETWORK_ID,
    S.FIRST_CALL
FROM    
        ACCOUNT A, SUBSCRIBER S
WHERE   
        A.ID = S.ACCOUNT_ID ;
 
CREATE SEQUENCE ARCHIVED_SUBSCRIBER_ID INCREMENT BY 1 START WITH 1025 NOMAXVALUE NOMINVALUE NOCYCLE CACHE 20 ORDER;
CREATE TABLE ARCHIVED_SUBSCRIBER (
        ID                                              NUMBER(20,0) NOT NULL,
        SUBSCRIBER_TYPE                 NUMBER(20,0) DEFAULT 0,
        ACCOUNT_ID                              NUMBER(20,0) NOT NULL,
        ACCOUNT_NAME                    VARCHAR2(40),
        PHONE_NUMBER                    VARCHAR2(40) NOT NULL,
        SUBSCRIBER_DOA                  DATE DEFAULT SYSDATE,
        HOME_PHONE_NUMBER               VARCHAR2(40),
        OFFICE_PHONE_NUMBER             VARCHAR2(40),
        CONTACT_PHONE_NUMBER    VARCHAR2(40),
        MCN1                                    VARCHAR2(40),
        MCN2                                    VARCHAR2(40),
        IMSI                            VARCHAR2(40),
        IMEI                                    VARCHAR2(40),
        CONNECTION_TYPE                 NUMBER(20,0) NOT NULL,
        GROUPS                                  VARCHAR2(256),
        SERVICES                                NUMBER(20,0) DEFAULT 2047,
        STATUS                                  NUMBER(20,0) NOT NULL,
        QOS                                             NUMBER(1,0)  DEFAULT 0,
        PRODUCT_TYPE                    NUMBER(20,0) NOT NULL,
        MODIFIED_DATE                   DATE DEFAULT SYSDATE,
        NETWORK_ID                          NUMBER(21,0) DEFAULT 999
) ;

CREATE INDEX IX_ARCH_SUBSCRIBER_PH_NU ON ARCHIVED_SUBSCRIBER("PHONE_NUMBER") ;
CREATE INDEX IX_ARCH_SUB_ACCOUNT_NAME ON ARCHIVED_SUBSCRIBER("ACCOUNT_NAME") ;
CREATE INDEX IX_ARCH_SUB_ID ON ARCHIVED_SUBSCRIBER("ID") ;



COMMIT;
spool off
