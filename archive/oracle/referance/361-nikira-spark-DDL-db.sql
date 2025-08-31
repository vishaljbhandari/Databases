
CREATE TABLE SPARK_CONFIGURATIONS (
    ID          NUMBER(20,0) NOT NULL,
    CONFIG_KEY  VARCHAR2(64) NOT NULL,
    URL         VARCHAR2(128) NOT NULL,
    METHOD_USED NUMBER(20) NOT NULL,
    STATIC_PARAMETERS   VARCHAR2(512),
    STATIC_PARAMETER_VALUES VARCHAR2(512),
    DYNAMIC_PARAMETERS  VARCHAR2(512) ) ;


CREATE TABLE SPARK_USERS(
    ID          NUMBER(20,0) NOT NULL,
    USER_NAME   VARCHAR2(64) ,
    PASSWORD    VARCHAR2(64) ) ;

CREATE SEQUENCE CURR_PART_INFO_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE CURR_PART_INFOS(
    ID                  NUMBER(20,0) NOT NULL,
    RECORD_CONFIG_ID    NUMBER(20,0) NOT NULL,
    PARTITION_INFO      VARCHAR2(64) NOT NULL
    ) ;

CREATE TABLE SPARK_SYNONYM_MAPS (
		    TABLE_NAME      VARCHAR2(40),
			    SYNONYM_NAME    VARCHAR2(40)
	) ;

CREATE TABLE SPARK_DATA_TYPES(
    ID          NUMBER(20,0) NOT NULL,
    DATA_TYPE   VARCHAR2(64) NOT NULL) ;


create table cust_task_input (
 KEY          VARCHAR2(255) NOT NULL,
 VAL          VARCHAR2(2048)
);

create table lsp_subscriber (phone_number VARCHAR2(40), subscriber_id NUMBER(20)) ;

CREATE TABLE SP_ALARM_GPRS_CDR(
    NETWORK_ID                  NUMBER(20,0)    NOT NULL,
    RECORD_TYPE                 NUMBER(20,0)    NOT NULL,
    TIME_STAMP                  DATE            NOT NULL,
    DURATION                    NUMBER(20,0)    NOT NULL,
    PHONE_NUMBER                VARCHAR2(32)    NOT NULL,
    SERVICE_TYPE                NUMBER(20,0)    NOT NULL,
    CDR_TYPE                    NUMBER(20,0)    NOT NULL,
    UPLOAD_DATA_VOLUME          NUMBER(20,6)    NOT NULL,
    DOWNLOAD_DATA_VOLUME        NUMBER(20,6)    NOT NULL,
    QOS_REQUESTED               NUMBER(20,0)    NOT NULL,
    QOS_NEGOTIATED              NUMBER(20,0)    NOT NULL,
    VAL                     NUMBER(16,6)    NOT NULL,
    SUBSCRIBER_ID               NUMBER(20,0)    NOT NULL,
    CHARGING_ID                 VARCHAR2(26)     NOT NULL,
    SERVICE                     NUMBER(20,0)    DEFAULT 2047,
    IMSI_NUMBER                 VARCHAR2(32),
    IMEI_NUMBER                 VARCHAR2(32),
    SESSION_STATUS              NUMBER(2,0),
    ACCESS_POINT_NAME           VARCHAR2(64),
    GEOGRAPHIC_POSITION         VARCHAR2(32),
    CAUSE_FOR_SESSION_CLOSING   NUMBER(2,0),
    PDP_TYPE                    VARCHAR2(32),
    SERVED_PDP_ADDRESS          VARCHAR2(32),
    VPMN                VARCHAR2(40),
    DAY_OF_YEAR                 NUMBER(20,0),
    HOUR_OF_DAY                 NUMBER(20,0) DEFAULT 0,
    XDR_ID                          NUMBER(20,0)    NOT NULL,
    ALERT_ID NUMBER(20,0)    NOT NULL ,
    REC_TYPE_IDENTIFIER NUMBER(20,0)    NOT NULL,
    AGGREGATION_TYPE NUMBER(20,0)    NOT NULL,
    AGGREGATION_VALUE VARCHAR2(40)    NOT NULL);

CREATE TABLE SP_ALARM_CDR(
       OTHER_PARTY_COUNTRY_CODE VARCHAR2(32),
       NETWORK_ID              NUMBER(20,0)    NOT NULL,
       CALLER_NUMBER           VARCHAR2(80),
       CALLED_NUMBER           VARCHAR2(80),
       FORWARDED_NUMBER        VARCHAR2(80),
       RECORD_TYPE             NUMBER(20,0)    NOT NULL,
       DURATION                NUMBER(20,0)    NOT NULL,
       TIME_STAMP              DATE                    NOT NULL,
       EQUIPMENT_ID            VARCHAR2(40),
       IMSI_NUMBER             VARCHAR2(40) ,
       GEOGRAPHIC_POSITION     VARCHAR2(32),
       CALL_TYPE               NUMBER(20,0)    NOT NULL,
       SUBSCRIBER_ID           NUMBER(20,0)    NOT NULL,
       VAL                   NUMBER(16,6)    NOT NULL,
       CDR_TYPE                NUMBER(20,0)    NOT NULL,
       SERVICE_TYPE            NUMBER(20,0)    NOT NULL,
       CDR_CATEGORY            NUMBER(20,0)    DEFAULT 1 NOT NULL,
       IS_COMPLETE             NUMBER(20)      NOT NULL,
       IS_ATTEMPTED            NUMBER(20)      NOT NULL,
       SERVICE                 NUMBER(20,0) DEFAULT 2047,
       PHONE_NUMBER            VARCHAR2(80),
       VPMN                     VARCHAR2(40),
       DAY_OF_YEAR             NUMBER(20,0) DEFAULT 0,
       HOUR_OF_DAY             NUMBER(20,0) DEFAULT 0,
       XDR_ID                      NUMBER(20,0)    NOT NULL,
       ALERT_ID NUMBER(20,0)    NOT NULL ,
       REC_TYPE_IDENTIFIER NUMBER(20,0)    NOT NULL,
       AGGREGATION_TYPE NUMBER(20,0)    NOT NULL,
       AGGREGATION_VALUE VARCHAR2(40)    NOT NULL);

CREATE TABLE SP_RTF_ALARM_GPRS_CDR(
    NETWORK_ID                  NUMBER(20,0)    NOT NULL,
    RECORD_TYPE                 NUMBER(20,0)    NOT NULL,
    TIME_STAMP                  DATE            NOT NULL,
    DURATION                    NUMBER(20,0)    NOT NULL,
    PHONE_NUMBER                VARCHAR2(32)    NOT NULL,
    SERVICE_TYPE                NUMBER(20,0)    NOT NULL,
    CDR_TYPE                    NUMBER(20,0)    NOT NULL,
    UPLOAD_DATA_VOLUME          NUMBER(20,6)    NOT NULL,
    DOWNLOAD_DATA_VOLUME        NUMBER(20,6)    NOT NULL,
    QOS_REQUESTED               NUMBER(20,0)    NOT NULL,
    QOS_NEGOTIATED              NUMBER(20,0)    NOT NULL,
    VAL                     NUMBER(16,6)    NOT NULL,
    SUBSCRIBER_ID               NUMBER(20,0)    NOT NULL,
    CHARGING_ID                 VARCHAR2(26)     NOT NULL,
    SERVICE                     NUMBER(20,0)    DEFAULT 2047,
    IMSI_NUMBER                 VARCHAR2(32),
    IMEI_NUMBER                 VARCHAR2(32),
    SESSION_STATUS              NUMBER(2,0),
    ACCESS_POINT_NAME           VARCHAR2(64),
    GEOGRAPHIC_POSITION         VARCHAR2(32),
    CAUSE_FOR_SESSION_CLOSING   NUMBER(2,0),
    PDP_TYPE                    VARCHAR2(32),
    SERVED_PDP_ADDRESS          VARCHAR2(32),
    VPMN                VARCHAR2(40),
    DAY_OF_YEAR                 NUMBER(20,0),
    HOUR_OF_DAY                 NUMBER(20,0) DEFAULT 0,
    XDR_ID                          NUMBER(20,0)    NOT NULL,
    ALERT_ID NUMBER(20,0)    NOT NULL ,
    REC_TYPE_IDENTIFIER NUMBER(20,0)    NOT NULL,
    AGGREGATION_TYPE NUMBER(20,0)    NOT NULL,
    AGGREGATION_VALUE VARCHAR2(40)    NOT NULL);

CREATE TABLE SP_RTF_ALARM_CDR(
       OTHER_PARTY_COUNTRY_CODE VARCHAR2(32),
       NETWORK_ID              NUMBER(20,0)    NOT NULL,
       CALLER_NUMBER           VARCHAR2(80),
       CALLED_NUMBER           VARCHAR2(80),
       FORWARDED_NUMBER        VARCHAR2(80),
       RECORD_TYPE             NUMBER(20,0)    NOT NULL,
       DURATION                NUMBER(20,0)    NOT NULL,
       TIME_STAMP              DATE                    NOT NULL,
       EQUIPMENT_ID            VARCHAR2(40),
       IMSI_NUMBER             VARCHAR2(40) ,
       GEOGRAPHIC_POSITION     VARCHAR2(32),
       CALL_TYPE               NUMBER(20,0)    NOT NULL,
       SUBSCRIBER_ID           NUMBER(20,0)    NOT NULL,
       VAL                   NUMBER(16,6)    NOT NULL,
       CDR_TYPE                NUMBER(20,0)    NOT NULL,
       SERVICE_TYPE            NUMBER(20,0)    NOT NULL,
       CDR_CATEGORY            NUMBER(20,0)    DEFAULT 1 NOT NULL,
       IS_COMPLETE             NUMBER(20)      NOT NULL,
       IS_ATTEMPTED            NUMBER(20)      NOT NULL,
       SERVICE                 NUMBER(20,0) DEFAULT 2047,
       PHONE_NUMBER            VARCHAR2(80),
       VPMN                     VARCHAR2(40),
       DAY_OF_YEAR             NUMBER(20,0) DEFAULT 0,
       HOUR_OF_DAY             NUMBER(20,0) DEFAULT 0,
       XDR_ID                      NUMBER(20,0)    NOT NULL,
       ALERT_ID NUMBER(20,0)    NOT NULL ,
       REC_TYPE_IDENTIFIER NUMBER(20,0)    NOT NULL,
       AGGREGATION_TYPE NUMBER(20,0)    NOT NULL,
       AGGREGATION_VALUE VARCHAR2(40)    NOT NULL) ;


CREATE TABLE SP_ALARM_RECHARGE_LOG
(
    TIME_STAMP              DATE                            NOT NULL,
    PHONE_NUMBER            VARCHAR2(32),
    AMOUNT                  NUMBER(16,6)                    NOT NULL,
    RECHARGE_TYPE           NUMBER(16,6)                    NOT NULL,
    STATUS                  NUMBER(20)                      NOT NULL,
    CREDIT_CARD             VARCHAR2(80),
    PIN_NUMBER              VARCHAR2(40),
    NETWORK_ID              NUMBER(20)      DEFAULT 999     NOT NULL,
    ACCOUNT_ID              NUMBER(20)                      NOT NULL,
    SUBSCRIBER_ID           NUMBER(20)                      NOT NULL,
    SERIAL_NUMBER           VARCHAR2(40),
    DAY_OF_YEAR             NUMBER(20,0)  				    DEFAULT 0,
    HOUR_OF_DAY             NUMBER(20,0)  				    DEFAULT 0,
    XDR_ID					NUMBER(20)                      NOT NULL,
    ALERT_ID                NUMBER(20,0)                    NOT NULL,
	REC_TYPE_IDENTIFIER NUMBER(20,0)  						NOT NULL,
	AGGREGATION_TYPE NUMBER(20,0) 						    NOT NULL,
	AGGREGATION_VALUE VARCHAR2(40)   						NOT NULL
) ;


CREATE TABLE SP_RTF_ALARM_RECHARGE_LOG
(
    TIME_STAMP              DATE                            NOT NULL,
    PHONE_NUMBER            VARCHAR2(32),
    AMOUNT                  NUMBER(16,6)                    NOT NULL,
    RECHARGE_TYPE           NUMBER(16,6)                    NOT NULL,
    STATUS                  NUMBER(20)                      NOT NULL,
    CREDIT_CARD             VARCHAR2(80),
    PIN_NUMBER              VARCHAR2(40),
    NETWORK_ID              NUMBER(20)      DEFAULT 999     NOT NULL,
    ACCOUNT_ID              NUMBER(20)                      NOT NULL,
    SUBSCRIBER_ID           NUMBER(20)                      NOT NULL,
    SERIAL_NUMBER           VARCHAR2(40),
    DAY_OF_YEAR             NUMBER(20,0)  				    DEFAULT 0,
    HOUR_OF_DAY             NUMBER(20,0)  				    DEFAULT 0,
    XDR_ID					NUMBER(20)                      NOT NULL,
    ALERT_ID                NUMBER(20,0)                    NOT NULL,
	REC_TYPE_IDENTIFIER NUMBER(20,0)  						NOT NULL,
	AGGREGATION_TYPE NUMBER(20,0) 						    NOT NULL,
	AGGREGATION_VALUE VARCHAR2(40)   						NOT NULL
) ;

CREATE TABLE COUNTS ( COUNT NUMBER(20)) ;
