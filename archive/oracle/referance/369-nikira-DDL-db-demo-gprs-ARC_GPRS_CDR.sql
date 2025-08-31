spool nikira-DDL-db-demo-gprs-ARC_GPRS_CDR.log
set feedback off ;
set serveroutput off ;




CREATE TABLE ARCHIVED_GPRS_CDR (
        ID                                                      NUMBER(20,0)    NOT NULL,
        NETWORK_ID                                      NUMBER(20,0)    NOT NULL,
        RECORD_TYPE                                     NUMBER(20,0)    NOT NULL,
        TIME_STAMP                                      DATE                    NOT NULL,
        DURATION                                        NUMBER(20,0)    NOT NULL,
        PHONE_NUMBER                            VARCHAR2(32)    NOT NULL,
        IMSI_NUMBER                                     VARCHAR2(32),
        IMEI_NUMBER                                     VARCHAR2(32),
        GEOGRAPHIC_POSITION                     VARCHAR2(32),
        CDR_TYPE                                        NUMBER(20,0)    NOT NULL,
        SERVICE_TYPE                            NUMBER(20,0)    NOT NULL,
        PDP_TYPE                                        VARCHAR2(32),
        SERVED_PDP_ADDRESS                      VARCHAR2(32),
        UPLOAD_DATA_VOLUME                      NUMBER(20,6)    NOT NULL,
        DOWNLOAD_DATA_VOLUME            NUMBER(20,6)    NOT NULL,
        SERVICE                                         NUMBER(20,0)    DEFAULT 2047,
        QOS_REQUESTED                           NUMBER(20,0)    NOT NULL,
        QOS_NEGOTIATED                          NUMBER(20,0)    NOT NULL,
        VALUE                                           NUMBER(16,6)    NOT NULL,
        ACCESS_POINT_NAME                       VARCHAR2(64),
        SUBSCRIBER_ID                           NUMBER(20,0)    NOT NULL,
        DAY_OF_YEAR                                     NUMBER(20,0),
        CAUSE_FOR_SESSION_CLOSING       NUMBER(2,0),
        SESSION_STATUS                          NUMBER(2,0),
        CHARGING_ID                                     VARCHAR2(26)     NOT NULL,
        ANI                                                     VARCHAR2(32),
        VPMN                                            VARCHAR2(40),
        HOUR_OF_DAY                     NUMBER(20,0) DEFAULT 0,
        CONSTRAINT AR_GPRS_CDR_CHARGING_ID check (CHARGING_ID between 0 and 4294967295)
        );
commit;
spool off

