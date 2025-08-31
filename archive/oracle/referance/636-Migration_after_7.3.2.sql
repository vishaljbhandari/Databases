set feedback off ;
set serveroutput on ;
spool Migration_after_7.3.2.log

-- nikira-DDL-db-demo-subscriber.sql
CREATE OR REPLACE VIEW SUBSCRIBER_V 
(
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

-- nikira-DDL-db-demo-GSM.sql

CREATE TABLE TEMP_OFFLINE_CDR 
(
	ID							NUMBER(20,0)					NOT	NULL,
	NETWORK_ID					NUMBER(20,0)					NOT	NULL,
	CALLER_NUMBER				VARCHAR2(80),
	CALLED_NUMBER				VARCHAR2(80)					NOT	NULL,
	FORWARDED_NUMBER			VARCHAR2(80),
	RECORD_TYPE					NUMBER(20,0)					NOT	NULL,
	DURATION					NUMBER(20,0)					NOT	NULL,
	TIME_STAMP					DATE							NOT	NULL,
	EQUIPMENT_ID				VARCHAR2(40),
	IMSI_NUMBER					VARCHAR2(40),
	GEOGRAPHIC_POSITION			VARCHAR2(32),
	CALL_TYPE					NUMBER(20,0)					NOT	NULL,
	SUBSCRIBER_ID				NUMBER(20,0)					NOT	NULL,
	VALUE						NUMBER(16,6)					NOT	NULL,
	CDR_TYPE					NUMBER(20,0)					NOT	NULL,
	SERVICE_TYPE				NUMBER(20,0)					NOT	NULL,
	CDR_CATEGORY				NUMBER(20,0)	DEFAULT	1		NOT	NULL,
	IS_COMPLETE					NUMBER(20)						NOT	NULL,
	IS_ATTEMPTED				NUMBER(20)						NOT	NULL,
	SERVICE						NUMBER(20,0)	DEFAULT	2047,
	PHONE_NUMBER				VARCHAR2(80),
	DAY_OF_YEAR					NUMBER(20,0)	DEFAULT	0,
	HOUR_OF_DAY					NUMBER(20,0)	DEFAULT	0,
	OTHER_PARTY_COUNTRY_CODE	VARCHAR2(32),
	VPMN						VARCHAR2(40)
) ;

CREATE INDEX IX_TMP_OFFL_CDR_PH_NU ON TEMP_OFFLINE_CDR("PHONE_NUMBER") ;
CREATE INDEX IX_TMP_OFFL_CDR_CLR_NU ON TEMP_OFFLINE_CDR("CALLER_NUMBER") ;
CREATE INDEX IX_TMP_OFFL_CDR_CLD_NU ON TEMP_OFFLINE_CDR("CALLED_NUMBER") ;

CREATE TABLE TEMP_SWAP_OFFLINE_CDR COMPRESS AS SELECT * FROM OFFLINE_CDR WHERE 1=2 ;
CREATE INDEX IX_TE_SW_CDR_PH_NU_0 ON TEMP_SWAP_OFFLINE_CDR("PHONE_NUMBER") COMPRESS ;
CREATE INDEX IX_TE_SW_CDR_CLR_NU_0 ON TEMP_SWAP_OFFLINE_CDR("CALLER_NUMBER") COMPRESS ;
CREATE INDEX IX_TE_SW_CDR_CLD_NU_0 ON TEMP_SWAP_OFFLINE_CDR("CALLED_NUMBER") COMPRESS ;

-- nikira-DDL-db-demo-recharge.sql
CREATE TABLE TEMP_OFFLINE_RECH_LOG 
(
	ID						NUMBER(20)						NOT	NULL,
	TIME_STAMP				DATE							NOT	NULL,
	PHONE_NUMBER			VARCHAR2(32),
	AMOUNT					NUMBER(16,6)					NOT	NULL,
	RECHARGE_TYPE			NUMBER(16,6)					NOT	NULL,
	STATUS					NUMBER(20)						NOT	NULL,
	CREDIT_CARD				VARCHAR2(80),
	PIN_NUMBER				VARCHAR2(40),
	SERIAL_NUMBER			VARCHAR2(40),
	NETWORK_ID				NUMBER(20)		DEFAULT	999		NOT	NULL,
	ACCOUNT_ID				NUMBER(20)						NOT	NULL,
	SUBSCRIBER_ID			NUMBER(20)						NOT	NULL,
	DAY_OF_YEAR				NUMBER(20,0)	DEFAULT	0,
	HOUR_OF_DAY				NUMBER(20,0)	DEFAULT	0
) ;

CREATE INDEX IX_TM_OFF_RECH_LOG_PH_NU ON TEMP_OFFLINE_RECH_LOG("PHONE_NUMBER") ;

CREATE INDEX IX_TM_OFF_RECH_LOG_PIN_NU ON TEMP_OFFLINE_RECH_LOG("PIN_NUMBER") ;

CREATE TABLE TEMP_SWAP_OFFLINE_RECH_LOG COMPRESS AS SELECT * FROM TEMP_OFFLINE_RECH_LOG WHERE 1=2 ;
CREATE INDEX IX_TE_SW_RH_PH_NU_0 ON TEMP_SWAP_OFFLINE_RECH_LOG("PHONE_NUMBER") COMPRESS ;
CREATE INDEX IX_TE_SW_RH_PIN_NU_0 ON TEMP_SWAP_OFFLINE_RECH_LOG("PIN_NUMBER") COMPRESS ;

-- nikira-DDL-db-demo-gprs.sql
CREATE TABLE TEMP_OFFLINE_GPRS_CDR	
(
	ID							NUMBER(20,0)					NOT	NULL,
	NETWORK_ID					NUMBER(20,0)					NOT	NULL,	
	RECORD_TYPE					NUMBER(20,0)					NOT	NULL,
	TIME_STAMP					DATE							NOT	NULL,
	DURATION					NUMBER(20,0)					NOT	NULL,
	PHONE_NUMBER				VARCHAR2(32)					NOT	NULL,
	IMSI_NUMBER					VARCHAR2(32),
	IMEI_NUMBER					VARCHAR2(32),
	GEOGRAPHIC_POSITION			VARCHAR2(32),
	CDR_TYPE					NUMBER(20,0)					NOT	NULL,
	SERVICE_TYPE				NUMBER(20,0)					NOT	NULL,
	PDP_TYPE					VARCHAR2(32),
	SERVED_PDP_ADDRESS			VARCHAR2(32),
	UPLOAD_DATA_VOLUME			NUMBER(20,6)					NOT	NULL,
	DOWNLOAD_DATA_VOLUME		NUMBER(20,6)					NOT	NULL,
	SERVICE						NUMBER(20,0)	DEFAULT	2047,
	QOS_REQUESTED				NUMBER(20,0)					NOT	NULL,
	QOS_NEGOTIATED				NUMBER(20,0)					NOT	NULL,
	VALUE						NUMBER(16,6)					NOT	NULL,
	ACCESS_POINT_NAME			VARCHAR2(64),
	SUBSCRIBER_ID				NUMBER(20,0)					NOT	NULL,
	DAY_OF_YEAR					NUMBER(20,0)	DEFAULT 0,
	CAUSE_FOR_SESSION_CLOSING	NUMBER(2,0),
	SESSION_STATUS				NUMBER(2,0),
	CHARGING_ID					VARCHAR2(26)					NOT	NULL,
	ANI							VARCHAR2(32),
	HOUR_OF_DAY					NUMBER(20,0)	DEFAULT	0,
	VPMN						VARCHAR2(40)
) ;

CREATE INDEX IX_TMP_OFFL_GPRSCDR_PH_NU ON TEMP_OFFLINE_GPRS_CDR(PHONE_NUMBER) ;

CREATE TABLE TEMP_SWAP_OFFLINE_GPRS_CDR COMPRESS AS SELECT * FROM OFFLINE_GPRS_CDR WHERE 1=2 ;
CREATE INDEX IX_TE_SW_GPRS_PH_NU_0 ON TEMP_SWAP_OFFLINE_GPRS_CDR("PHONE_NUMBER") COMPRESS ;

-- nikira-DDL-db-demo-isp.sql
CREATE TABLE TEMP_OFFLINE_IPDR                                                                                    
(                                                                                                                 
    ID                      NUMBER(20,0)                    NOT NULL,                                             
    NETWORK_ID              NUMBER(20,0)                    NOT NULL,                                             
    TIME_STAMP              DATE                            NOT NULL,                                             
    DURATION                NUMBER(20,0)                    NOT NULL,                                             
    PHONE_NUMBER            VARCHAR2(40),                                                                         
    FRAMED_IP_ADDRESS       VARCHAR2(32),                                                                         
    IPDR_TYPE               NUMBER(4,0)                     NOT NULL,                                             
    UPLOAD_DATA_VOLUME      NUMBER(20,6)                    NOT NULL,                                             
    DOWNLOAD_DATA_VOLUME    NUMBER(20,6)                    NOT NULL,                                             
    ISP_QOS                 NUMBER(20,0)                    NOT NULL,                                             
    VALUE                   NUMBER(16,6)                    NOT NULL,                                             
    SUBSCRIBER_ID           NUMBER(20)                      NOT NULL,                                             
    USER_NAME               VARCHAR2(256)                   NOT NULL,                                             
    SESSION_ID              VARCHAR2(10)                    NOT NULL,                                             
    SESSION_STATUS          NUMBER(2)                       NOT NULL,                                             
    DAY_OF_YEAR             NUMBER(20,0),                                                                         
    HOUR_OF_DAY             NUMBER(20,0)    DEFAULT 0                                                             
) ;                                                                                                               
                                                                                                                  
CREATE INDEX IX_TMP_OFFL_IPDR_PH_NU ON TEMP_OFFLINE_IPDR(PHONE_NUMBER) ;                                          
CREATE TABLE TEMP_SWAP_OFFLINE_IPDR COMPRESS AS SELECT * FROM TEMP_OFFLINE_IPDR WHERE 1=2 ;                       
CREATE INDEX IX_TE_SW_IPDR_PH_NU_0 ON TEMP_SWAP_OFFLINE_IPDR("PHONE_NUMBER") COMPRESS; 

-- nikira-DDL-db.sql
DROP TABLE ALARM_RECORD_LOADER_SYNC ;
ALTER TABLE NETWORKS ADD (CURRENCY	VARCHAR2(256)) ;
ALTER TABLE ACCUMULATION_FIELD_UNITS ADD (IS_NETWORK_SPECIFIC NUMBER(1) DEFAULT 0) ;
ALTER TABLE OFFLINE_READINESS ADD (IS_SWAPPED NUMBER(2) DEFAULT 0) ;
ALTER TABLE AUDIT_TRAILS MODIFY(ENTITY_VALUE VARCHAR2(256)) ;
ALTER TABLE SUSPECT_VALUES ADD(END_VALUE VARCHAR2(40)) ;
ALTER TABLE SUSPECT_VALUES ADD(IS_RANGE	NUMBER(20)) ;

ALTER TABLE TABLE_NAMES ADD(SCRIPT_NAME VARCHAR2(512)) ;
UPDATE TABLE_NAMES SET SCRIPT_NAME = 'default_loader.sh' ;
ALTER TABLE TABLE_NAMES MODIFY SCRIPT_NAME NOT NULL ;

CREATE OR REPLACE VIEW ALARM_VIEWS
AS
(
        SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID as USER_ID, A.OWNER_TYPE as OWNER_TYPE,
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yyyy'), to_date('','dd-mm-yyyy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE,
        CAST(FieldUtil.normalize(S.ACCOUNT_NAME) as varchar2(40)) ACCOUNT_NAME,
		CAST(LTRIM(FieldUtil.normalize(S.FIRST_NAME)||DECODE(S.MIDDLE_NAME,NULL,'',' '||FieldUtil.normalize(S.MIDDLE_NAME))||DECODE(S.LAST_NAME,NULL,'',' '||FieldUtil.normalize(S.LAST_NAME))) as varchar2(125)) SUBSCRIBER_NAME,
                S.GROUPS, C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, S.ACCOUNT_ID AS PARENT_ID
                , decode(A.REFERENCE_ID,4,4,2,2,0,0,AC.HIERARCHY_ID) AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				ROUND(DECODE(A.ASSIGNED_DATE, NULL,0,(CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END))) AS ANALYSIS_DURATION, 
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
                FROM ALARMS A, SUBSCRIBER_V S, ACCOUNT_CREDIT_DETAIL C, ACCOUNT AC
                        WHERE A.REFERENCE_ID = S.SUBSCRIBER_ID
                                AND S.ACCOUNT_ID = C.ACCOUNT_ID(+)
								AND S.ACCOUNT_ID = AC.ID
							AND AC.ACCOUNT_TYPE in (0,1)
                            AND (A.REFERENCE_ID > 1024 OR  A.REFERENCE_ID in (2,4))
                            AND A.IS_VISIBLE = 1
                            AND A.REFERENCE_TYPE IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID = 3)
                            AND A.STATUS NOT IN (7)
UNION ALL
        SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID as USER_ID, A.OWNER_TYPE as OWNER_TYPE,
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yyyy'), to_date('','dd-mm-yyyy'),A.PENDING_TIME) AS PENDING_TIME,
        A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE, CAST(FieldUtil.normalize(AC.ACCOUNT_NAME) as varchar2(40)) ACCOUNT_NAME,
		CAST(LTRIM(FieldUtil.normalize(AC.FIRST_NAME)||DECODE(AC.MIDDLE_NAME,NULL,'',' '||FieldUtil.normalize(AC.MIDDLE_NAME))||DECODE(AC.LAST_NAME,NULL,'',' '||FieldUtil.normalize(AC.LAST_NAME))) as varchar2(125)) SUBSCRIBER_NAME,
                '', C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, AC.PARENT_ID AS PARENT_ID, AC.HIERARCHY_ID AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				ROUND(DECODE(A.ASSIGNED_DATE, NULL, 0, (CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END))) AS ANALYSIS_DURATION, 
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
                FROM ALARMS A, ACCOUNT AC, ACCOUNT_CREDIT_DETAIL C
                        WHERE A.REFERENCE_ID = AC.ID
                            AND AC.ID = C.ACCOUNT_ID(+)
							AND AC.ACCOUNT_TYPE in (0,1)
                            AND (A.REFERENCE_ID > 1024 OR  A.REFERENCE_ID in (2,4))
                            AND A.IS_VISIBLE = 1
                            AND A.REFERENCE_TYPE IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID = 4)
                            AND A.STATUS NOT IN (7)
UNION ALL
        SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID as USER_ID, A.OWNER_TYPE as OWNER_TYPE, 
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yyyy'), to_date('','dd-mm-yyyy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE,
                A.IS_VISIBLE, 'Not Applicable', 'Not Applicable', 'Not Applicable', 0.0, A.DISPLAY_VALUE, A.RULE_IDS,0 AS PARENT_ID,4 AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				ROUND(DECODE(A.ASSIGNED_DATE, NULL, 0,(CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END))) AS ANALYSIS_DURATION, 
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
                FROM ALARMS A
                        WHERE (A.REFERENCE_TYPE NOT IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID IN (3, 4)) OR A.REFERENCE_ID = 0)
							AND A.IS_VISIBLE = 1
                            AND A.STATUS NOT IN (7)
) ;

CREATE OR REPLACE VIEW PREPAID_SUBSCRIBER_V (
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
    ACCOUNT_TYPE,
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
    MODIFIED_DATE,
    SUBSCRIBER_TYPE,
    VOUCHER_EXPIRY_DATE,
    GRACE_PERIOD_EXPIRY_DATE,
    CURRENT_BALANCE,
    PREVIOUS_BALANCE,
    LAST_RECHARGE_DATE,
    LAST_CDR_TIME,
    DIFF_BALANCE_PERCENTAGE
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
    A.ACCOUNT_TYPE,
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
    S.MODIFIED_DATE,
    S.SUBSCRIBER_TYPE,
    R.VOUCHER_EXPIRY_DATE,
    R.GRACE_PERIOD_EXPIRY_DATE,
    R.CURRENT_BALANCE,
    R.PREVIOUS_BALANCE,
    R.LAST_RECHARGE_DATE,
    R.LAST_CDR_TIME,
    R.DIFF_BALANCE_PERCENTAGE
FROM ACCOUNT A, SUBSCRIBER S, ACCOUNT_RECHARGE_DETAIL R
WHERE A.ID = S.ACCOUNT_ID
  AND A.ID = R.ACCOUNT_ID
  AND S.PRODUCT_TYPE = 2 ;

CREATE OR REPLACE VIEW SUSP_VAL_HOTLIST_GRP_NETWRK_V
AS
(
		SELECT DISTINCT HGSV.SUSPECT_VALUE_ID AS ID, SV.VALUE AS VALUE,SV.END_VALUE AS END_VALUE, SV.HOTLIST_KEY_ID, SV.ENTITY_TYPE AS ENTITY_TYPE, SV.SOURCE AS SOURCE,  SV.REASON AS REASON,
				SV.USER_ID AS USER_ID, SV.EXPIRY_DATE AS EXPIRY_DATE, 
		JOINMANYROWSIN1UNIQ(HG.NAME) 
				AS GROUPS,
		JOINMANYROWSIN1UNIQ(HGN.NETWORK_ID)
				AS NETWORK_ID ,
				SV.CREATED_DATE, SV.CREATED_BY, SV.MODIFIED_DATE, SV.MODIFIED_BY 
		FROM HOTLIST_GROUPS_SUSPECT_VALUES HGSV, HOTLIST_GROUPS_NETWORKS HGN, SUSPECT_VALUES SV, HOTLIST_GROUPS HG
		WHERE HGSV.HOTLIST_GROUP_ID = HGN.HOTLIST_GROUP_ID 
			  AND HGSV.SUSPECT_VALUE_ID = SV.ID 
			  AND HG.ID = HGN.HOTLIST_GROUP_ID
			  AND HG.IS_ACTIVE = 1
		GROUP BY (HGSV.SUSPECT_VALUE_ID, SV.VALUE,SV.END_VALUE, SV.HOTLIST_KEY_ID, SV.ENTITY_TYPE, SV.SOURCE, SV.REASON, SV.USER_ID,SV.EXPIRY_DATE, SV.CREATED_DATE, SV.CREATED_BY, SV.MODIFIED_DATE, SV.MODIFIED_BY) 
);

CREATE OR REPLACE VIEW FP_ELEMENTS_V AS
(
	SELECT
            FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID, FC.NAME AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, ROUND(T.DURATION / 86400, 6) AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
    	FROM
            FP_ELEMENTS FE, FIELD_CONFIGS FC, RULES R, THRESHOLDS T
    	WHERE
            FE.FIELD_ID = FC.FIELD_ID AND FE.RECORD_CONFIG_ID = FC.RECORD_CONFIG_ID AND FE.FIELD_ID IS NOT NULL AND FE.IS_ACTIVE = 1
	    AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE =1 AND T.RULE_KEY = R.KEY AND T.RULE_VERSION = R.VERSION 
		AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
    UNION ALL
	SELECT
            FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID,  ' ' AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, ROUND(T.DURATION / 86400, 6) AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
    FROM
            FP_ELEMENTS FE, RULES R, THRESHOLDS T
    WHERE
	    FE.FIELD_ID IS NULL AND FE.IS_ACTIVE = 1
	    AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE = 1 AND T.RULE_KEY = R.KEY  AND T.RULE_VERSION = R.VERSION
		AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
);

CREATE SEQUENCE XDR_OFFLINE_TEMP_MAPS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
CREATE TABLE XDR_OFFLINE_TEMP_MAPS
(
 ID NUMBER(3) ,
 RECORD_CONFIG_ID NUMBER(20) NOT NULL UNIQUE,
 TEMP_TABLE_NAME VARCHAR2(40),
 SWAP_TABLE_NAME VARCHAR2(40)
);

CREATE OR REPLACE VIEW OFF_XDR_INDEX_MAP_V  AS ( SELECT U1.INDEX_NAME TEMP_INDEX, U2.INDEX_NAME SWAP_INDEX, U1.COLUMN_NAME COLUMN_NAME, U1.TABLE_NAME TEMP_TABLE, U2.TABLE_NAME SWAP_TABLE FROM  USER_IND_COLUMNS U1 , USER_IND_COLUMNS U2 WHERE U1.COLUMN_NAME = U2.COLUMN_NAME AND U1.TABLE_NAME IN ( SELECT TEMP_TABLE_NAME FROM XDR_OFFLINE_TEMP_MAPS ) AND U2.TABLE_NAME IN ( SELECT SWAP_TABLE_NAME  FROM XDR_OFFLINE_TEMP_MAPS )) ;

-- nikira-DDL-db-gprs.sql
UPDATE CAUSE_FOR_SESSION_CLOSING SET DESCRIPTION = SUBSTR(DESCRIPTION, 1, 40) ;
ALTER TABLE CAUSE_FOR_SESSION_CLOSING MODIFY (DESCRIPTION  VARCHAR2(40)) ;

--- nikira-DDL-workflow.sql
ALTER TABLE ALARM_ACTIVITY_LOGS MODIFY(ACTIVITY_DESCRIPTION VARCHAR2(1000)) ;
ALTER TABLE ARCHIVED_ALARM_ACTIVITY_LOGS MODIFY(ACTIVITY_DESCRIPTION VARCHAR2(1000)) ;

UPDATE workflows SET description = SUBSTR(description, 1, 256) ;
ALTER TABLE WORKFLOWS MODIFY(DESCRIPTION VARCHAR2(256)) ;

-- nikira-DDL-rater.sql
CREATE TABLE FREE_NUMBERS_TMP
(
	FREE_NUMBER varchar2(64),
	DESCRIPTION varchar2(64),
	NETWORK varchar2(64)
) ;

CREATE TABLE RATER_SPECIAL_NUMBERS_TMP
(
	DESCRIPTION VARCHAR2(64),
	SPECIAL_NUMBER VARCHAR2(64),
	SERVICE_CATEGORY VARCHAR2(64),
	MIN_CHARGEABLE_UNIT NUMBER(20),
	MIN_CHARGE NUMBER(16,6),
	PULSE NUMBER(20),
	RATE NUMBER(16,6),
	PSTN_MIN_CHARGEABLE_UNIT NUMBER(20),
	PSTN_MIN_CHARGE NUMBER(16,6),
	PSTN_PULSE NUMBER(20),
	PSTN_RATE NUMBER(16,6),
	EXTRA_CHARGE NUMBER(16,6),
	CALL_TYPE VARCHAR2(64),
	PMN VARCHAR2(64),
	MATCH_TYPE VARCHAR2(10),
	NETWORK varchar2(64)
) ;

CREATE TABLE SDR_RATES_TMP
(
        ID                  NUMBER (20),
        START_DATE          DATE,
        END_DATE            DATE,
        SDR_VALUE           NUMBER(10,3),
		NETWORK				varchar2(64)	
) ;

alter table default_rates add constraint FK_DEF_RATES_RT_TY foreign key (RATE_TYPE) references service_categories(CODE) ;

update default_rates set PULSE = 1.0 where PULSE = NULL;
update default_rates set RATE = 1.0 where RATE = NULL;

alter table default_rates modify PULSE       NUMBER(20) default 1 NOT NULL;
alter table default_rates modify RATE        NUMBER(16,6) default 0 NOT NULL;

alter table RATE_PER_CALLS add CONSTRAINT CONS_RT_PER_CAL_SER_PRO check (service_provider in ('Y','N')) ;
alter table RATE_PER_CALLS add CONSTRAINT FK_RT_PER_CAL_SER_CAT foreign key (SERVICE_CATEGORY) references service_categories(CODE) ;
alter table RATE_PER_CALLS add CONSTRAINT CONS_RT_PER_CAL_MAT_TY check (match_type in ('EM','PM')) ;
alter table RATE_PER_CALLS add CONSTRAINT UK_RATE_PER_CALLS UNIQUE (SERVICE_NUMBER,CALL_TYPE,SERVICE_CATEGORY,SERVICE_PROVIDER,SERVICE_BAND,MATCH_TYPE) ;
update rate_per_calls set SERVICE_NUMBER = '+123' where SERVICE_NUMBER = NULL;
update rate_per_calls set DESCRIPTION = 'Default Description' WHERE DESCRIPTION = NULL;
update rate_per_calls set CALL_TYPE = 'V' where CALL_TYPE = NULL;
update rate_per_calls set SERVICE_CATEGORY = 'PF' where SERVICE_CATEGORY = NULL;
update rate_per_calls set SERVICE_PROVIDER = 'Y' where SERVICE_PROVIDER = NULL;
update rate_per_calls set SERVICE_BAND = 'I' where SERVICE_BAND = NULL;
update rate_per_calls set AIR_AMOUNT_PER_CALL = 0.0 where AIR_AMOUNT_PER_CALL = NULL;
update rate_per_calls set PSTN_AMOUNT_PER_CALL = 1.0 where PSTN_AMOUNT_PER_CALL = NULL;
update rate_per_calls set EXTRA_CHARGE = 0.0 where EXTRA_CHARGE = NULL;

alter table  RATE_PER_CALLS modify SERVICE_NUMBER VARCHAR2(64) NOT NULL ;
alter table  RATE_PER_CALLS modify DESCRIPTION VARCHAR2(64) NOT NULL ;
alter table  RATE_PER_CALLS modify CALL_TYPE VARCHAR2(2) NOT NULL;
alter table  rate_per_calls modify SERVICE_CATEGORY VARCHAR2(64) NOT NULL;
alter table  rate_per_calls modify SERVICE_PROVIDER VARCHAR2(2) NOT NULL;
alter table  rate_per_calls modify SERVICE_BAND VARCHAR2(64) NOT NULL;
alter table  rate_per_calls modify AIR_AMOUNT_PER_CALL NUMBER(16,6) NOT NULL;
alter table  rate_per_calls modify PSTN_AMOUNT_PER_CALL NUMBER(16,6) NOT NULL;
alter table  rate_per_calls modify EXTRA_CHARGE NUMBER(16,6) NOT NULL;

alter table  rater_special_numbers add CONSTRAINT FK_RT_SPE_NUM_SER_CAT foreign key (SERVICE_CATEGORY) references service_categories(CODE) ;
alter table  rater_special_numbers add CONSTRAINT CONS_RT_SPE_NUM_MAT_TY check (match_type in ('EM','PM')) ;

update rater_special_numbers set DESCRIPTION = 'Default Description' where DESCRIPTION = NULL;
update rater_special_numbers set SPECIAL_NUMBER = '+111' where SPECIAL_NUMBER = NULL;
update rater_special_numbers set SERVICE_CATEGORY = 'PF' where SERVICE_CATEGORY = NULL;
update rater_special_numbers set MIN_CHARGEABLE_UNIT = 0.0 where MIN_CHARGEABLE_UNIT = NULL;
update rater_special_numbers set MIN_CHARGE = 0.0 where MIN_CHARGE = NULL;
update rater_special_numbers set PULSE = 1.0 where PULSE = NULL;
update rater_special_numbers set RATE = 0.0 where RATE = NULL;
update rater_special_numbers set PSTN_MIN_CHARGEABLE_UNIT = 0.0 where PSTN_MIN_CHARGEABLE_UNIT = NULL;
update rater_special_numbers set PSTN_MIN_CHARGE = 0.0 where PSTN_MIN_CHARGE = NULL;
update rater_special_numbers set PSTN_PULSE = 0.0 where PSTN_PULSE = NULL;
update rater_special_numbers set PSTN_RATE = 1.0 where PSTN_RATE = NULL;
update rater_special_numbers set EXTRA_CHARGE = 0.0 where EXTRA_CHARGE = NULL;
update rater_special_numbers set CALL_TYPE = 'V' where CALL_TYPE = NULL;
update rater_special_numbers set MATCH_TYPE = 'EM' where MATCH_TYPE=NULL;

alter table  rater_special_numbers modify DESCRIPTION VARCHAR2(64) NOT NULL;
alter table  rater_special_numbers modify SPECIAL_NUMBER              VARCHAR2(64) NOT NULL;
alter table  rater_special_numbers modify SERVICE_CATEGORY            VARCHAR2(64) NOT NULL;
alter table  rater_special_numbers modify MIN_CHARGEABLE_UNIT         NUMBER(20,0) default 1 NOT NULL;
alter table  rater_special_numbers modify MIN_CHARGE                  NUMBER(16,6) default 1 NOT NULL;
alter table  rater_special_numbers modify PULSE                       NUMBER(20,0) default 1 NOT NULL;
alter table  rater_special_numbers modify RATE                        NUMBER(16,6) default 1 NOT NULL;
alter table  rater_special_numbers modify PSTN_MIN_CHARGEABLE_UNIT    NUMBER(20,0) default 1 NOT NULL;
alter table  rater_special_numbers modify PSTN_MIN_CHARGE             NUMBER(16,6) default 1 NOT NULL;
alter table  rater_special_numbers modify PSTN_PULSE                  NUMBER(20,0) default 1 NOT NULL;
alter table  rater_special_numbers modify PSTN_RATE                   NUMBER(16,6) default 1 NOT NULL;
alter table  rater_special_numbers modify EXTRA_CHARGE                NUMBER(16,6) default 1 NOT NULL;
alter table  rater_special_numbers modify CALL_TYPE                   VARCHAR2(64) NOT NULL;
alter table  rater_special_numbers modify MATCH_TYPE                  VARCHAR2(10) NOT NULL ;
alter table  time_zone_rate_types add CONSTRAINT CONS_TI_ZO_RT_TY_NA_FL check (NATIONAL_FLAG IN ('Y','N'));
alter table  time_zone_rate_types add CONSTRAINT FK_TM_ZON_RT_TY foreign key (SERVICE_CATEGORY) references service_categories(CODE);

update time_zone_rate_types set DAY_TYPE = 'SU' where DAY_TYPE=NULL;        
update time_zone_rate_types set START_TIME ='11:00:00' where START_TIME=NULL;
update time_zone_rate_types set END_TIME='12:00:00' where START_TIME=NULL;
update time_zone_rate_types set SERVICE_CATEGORY='PF' where SERVICE_CATEGORY=NULL;
update time_zone_rate_types set NATIONAL_FLAG='Y' where NATIONAL_FLAG=NULL;

alter table  time_zone_rate_types modify DAY_TYPE                VARCHAR2(64) NOT NULL;
alter table  time_zone_rate_types modify START_TIME              DATE NOT NULL;
alter table  time_zone_rate_types modify END_TIME                DATE NOT NULL;
alter table  time_zone_rate_types modify SERVICE_CATEGORY        VARCHAR2(64) NOT NULL;
alter table  time_zone_rate_types modify NATIONAL_FLAG           VARCHAR2(64) NOT NULL;

alter table  rate_plans add CONSTRAINT FK_RT_PL_ORG_NUM_TYPE foreign key (org_number_type) references service_categories(CODE);
alter table  rate_plans add CONSTRAINT CONS_RAT_PLN_RM_FL check (ROAMER_FLAG IN ('Y','N'));
alter table  rate_plans add CONSTRAINT UK_RATE_PLANS UNIQUE (RATE_PLAN_ID,ORG_NUMBER_TYPE,DEST_NUMBER_TYPE,ZONE_CODE,RATE_TYPE,CALL_TYPE,SERVICE_BAND,CALL_CATEGORY,ROAMER_FLAG);

update rate_plans set EXTRA_CHARGE=0.0 where EXTRA_CHARGE=NULL;
update rate_plans set CALL_CATEGORY='1' where CALL_CATEGORY=NULL;
update rate_plans set DEST_NUMBER_TYPE='GSM' where DEST_NUMBER_TYPE=NULL;
update rate_plans set FF_PSTN_RATE=0.0 where FF_PSTN_RATE=NULL;
update rate_plans set FF_PSTN_PULSE=1.0 where FF_PSTN_PULSE=NULL;
update rate_plans set FF_PSTN_MIN_CHARGE=0.0 where FF_PSTN_MIN_CHARGE=NULL;
update rate_plans set FF_PSTN_MIN_CHARGEABLE_UNIT=1.0 where FF_PSTN_MIN_CHARGEABLE_UNIT=NULL;
update rate_plans set FF_RATE=0.0 where FF_RATE=NULL;
update rate_plans set FF_PULSE=1.0 where FF_PULSE=NULL;
update rate_plans set FF_MIN_CHARGE=0.0 where FF_MIN_CHARGE=NULL;
update rate_plans set FF_MIN_CHARGEABLE_UNIT=0.0 where FF_MIN_CHARGEABLE_UNIT=NULL;
update rate_plans set PSTN_RATE=0.0 where PSTN_RATE=NULL;
update rate_plans set PSTN_PULSE=1.0 where PSTN_PULSE=NULL;
update rate_plans set PSTN_MIN_CHARGE=0.0 where PSTN_MIN_CHARGE=NULL;
update rate_plans set PSTN_MIN_CHARGEABLE_UNIT=0.0 where PSTN_MIN_CHARGEABLE_UNIT=NULL;
update rate_plans set RATE=0.0 where RATE=NULL;
update rate_plans set PULSE=1.0 where PULSE=NULL;
update rate_plans set MIN_CHARGE=0.0 where MIN_CHARGE=NULL;
update rate_plans set MIN_CHARGEABLE_UNIT=0.0 where MIN_CHARGEABLE_UNIT=NULL;
update rate_plans set SERVICE_BAND='I' where SERVICE_BAND=NULL;
update rate_plans set CALL_TYPE = 'V' where CALL_TYPE=NULL;
update rate_plans set ROAMER_FLAG='Y' where ROAMER_FLAG=NULL ;
update rate_plans set RATE_PLAN='default' where RATE_PLAN=NULL ;

alter table  rate_plans modify  RATE_PLAN                       VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  ROAMER_FLAG                     VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  RATE_PLAN_ID                    VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  ORG_NUMBER_TYPE                 VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  DEST_NUMBER_TYPE                VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  ZONE_CODE                       VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  RATE_TYPE                       VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  CALL_TYPE                       VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  SERVICE_BAND                    VARCHAR2(64) NOT NULL;
alter table  rate_plans modify  MIN_CHARGEABLE_UNIT             NUMBER(20,0) default 0 NOT NULL;
alter table  rate_plans modify  MIN_CHARGE                      NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  PULSE                           NUMBER(20,0) default 1 NOT NULL;
alter table  rate_plans modify  RATE                            NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  PSTN_MIN_CHARGEABLE_UNIT        NUMBER(20,0) default 0 NOT NULL;
alter table  rate_plans modify  PSTN_MIN_CHARGE                 NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  PSTN_PULSE                      NUMBER(20,0) default 1 NOT NULL;
alter table  rate_plans modify  PSTN_RATE                       NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  FF_MIN_CHARGEABLE_UNIT          NUMBER(20,0) default 0 NOT NULL;
alter table  rate_plans modify  FF_MIN_CHARGE                   NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  FF_PULSE                        NUMBER(20,0) default 1 NOT NULL;
alter table  rate_plans modify  FF_RATE                         NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  FF_PSTN_MIN_CHARGEABLE_UNIT     NUMBER(20,0) default 0 NOT NULL;
alter table  rate_plans modify  FF_PSTN_MIN_CHARGE              NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  FF_PSTN_PULSE                   NUMBER(20,0) default 1 NOT NULL;
alter table  rate_plans modify  FF_PSTN_RATE                    NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  EXTRA_CHARGE                    NUMBER(16,6) default 0 NOT NULL;
alter table  rate_plans modify  CALL_CATEGORY                   NUMBER(2) NOT NULL;

alter table org_dest_links add CONSTRAINT CONS_ORG_DES_LNK_NA_FL check (NATIONAL_FLAG IN ('Y','N')) ;
alter table org_dest_links add CONSTRAINT UK_ORG_DEST UNIQUE (ORG_GEO_CODE,DEST_GEO_CODE,ZONE_CODE,NATIONAL_FLAG,LETTER_CODE) ;

update org_dest_links set ORG_GEO_CODE='+91' where ORG_GEO_CODE = NULL;
update org_dest_links set DEST_GEO_CODE='+91' where DEST_GEO_CODE = NULL;
update org_dest_links set NATIONAL_FLAG='Y' where NATIONAL_FLAG = NULL;

alter table org_dest_links modify ORG_GEO_CODE            VARCHAR2(64) NOT NULL;
alter table org_dest_links modify DEST_GEO_CODE           VARCHAR2(64) NOT NULL;
alter table org_dest_links modify ZONE_CODE               VARCHAR2(64) NOT NULL;
alter table org_dest_links modify NATIONAL_FLAG           VARCHAR2(64) NOT NULL;
alter table org_dest_links modify LETTER_CODE             VARCHAR2(64) NOT NULL;

update free_numbers set DESCRIPTION='default' where DESCRIPTION=NULL;
update free_numbers set FREE_NUMBER='+111' where FREE_NUMBER=NULL;
alter table free_numbers modify DESCRIPTION               VARCHAR2(64) NOT NULL;
alter table free_numbers modify FREE_NUMBER               VARCHAR2(64) NOT NULL;

update zone_codes set DESCRIPTION='default' where DESCRIPTION=NULL;
alter table zone_codes modify DESCRIPTION     VARCHAR2(64) NOT NULL;

update country_codes set DESCRIPTION='default' where DESCRIPTION=NULL;
alter table country_codes modify DESCRIPTION  VARCHAR2(64) ;

-- nikira-DML-field-categories-isp.sql
update field_categories set regular_expression_id = 8 where id = 225 ;

-- nikira-DML-field-categories-nrtrde.sql
insert into field_categories(id, name, category, data_type) values(4000, 'Previous VPMN Sequence ID','', '') ;

-- nikira-DML-new-record-config.sql
update field_configs set name = replace (name, ' (' || (select value from configurations where config_key like '%CURRENCY%') || ')', '') where name like '%(' || (select value from configurations where config_key like '%CURRENCY%') || ')%' ;

update field_configs set name = 'Entity Start Value' where id=2430 and record_config_id =15 and database_field = 'VALUE' ;
update field_configs set field_id = field_id + 1, position = position + 1 where record_config_id = 15 and field_id between 2 and 9 ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2439, 15, 'Entity End Value', 'END_VALUE',2,2,3,1,'','',40,null,1,0,1) ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2000, 'Active Subscriber Details', 15, 'END_VALUE', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2001, 'IMSI Subscriber', 15, 'END_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2002, 'IMEI Subscriber', 15, 'END_VALUE', 3, 'IMEI', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2003, 'Account Name Subscriber', 15, 'END_VALUE', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');

update field_configs set is_filter = 0 where record_config_id = 76 and database_field = 'DESCRIPTION' ; 

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
		category) values (expandable_field_maps_seq.nextval, 'Phone Number Blacklist Subscriber', 15, 'END_VALUE', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

update record_view_configs set order_by = 'NAME ASC' where id = 132 and record_config_id = 112 and name = 'Standard Nickname' ;

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,10,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,21,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,16,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,11,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,20,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,8,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,9,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,2,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,9,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,12,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,17,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,18,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,23,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,64,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,59,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,59,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,6,59,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,7,69,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,22,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,23,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,24,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,109,'IS_CURRENCY',1);

-- nikira-DML-new-record-config-gsm.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,101,'IS_CURRENCY',1);

-- nikira-DML-new-record-config-recharge.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,60,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,60,'IS_CURRENCY',1);

-- nikira-DML-new-record-config-isp.sql
update record_view_configs set is_advanced_query_enabled = 1 where id = 104 and record_config_id = 83 and name = 'IPDR' ; 
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,83,'IS_CURRENCY',1);

update agg_type_granularity_maps set PRIORITY=3 where AGGREGATION_TYPE=225 ;                       
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 225,3600, 2, 'PROFILE_FIELD') ; 

-- nikira-DML-new-record-config-nrtrde.sql
update field_configs set reg_exp_id = 18 where id in (1501, 1505) and record_config_id = 42 ;
update field_configs set reg_exp_id = 10, translation_id = 41 where id = 1504 and record_config_id = 42 ;
update field_configs set reg_exp_id = 15 where id = 1508 and record_config_id = 42 ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 4000, 42, '514.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 42, '1') ;

update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =514 ;

-- nikira-DML-record-config-demo.sql
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 15, 'END_VALUE',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;

-- nikira-DML-record-config-demo-gsm.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,1,'IS_CURRENCY',1);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (2005, 'Geographic Position CDR', 15, 'END_VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');

-- nikira-DML-record-config-demo-gprs.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,7,'IS_CURRENCY',1);

-- nikira-DML-record-config-demo-recharge.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,2,'IS_CURRENCY',1);

-- nikira-DML-record-config-demo-isp.sql
insert into filter_index_fields(record_config_id, field_id) values(83, 12) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 83, '254.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2071, 83, '254.35') ;

update aggregation_types set RECORD_CONFIG_IDS= RECORD_CONFIG_IDS || ',83' where id = 16 ;  

-- nikira-DML-record-config-demo-gsm-nrtrde.sql
update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =121 ;

-- nikira-DML-record-config-demo-gprs-nrtrde.sql
update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =125;

-- nikira-DML-stat-rule-agg-type-subscriber.sql
update profile_field_entities set element_datastream_ids='1,2,7' where id=2; 

-- nikira-DML-exec.sql
delete from configurations where config_key = 'SYNC_KEY_FOR_ALARM_AND_RECORDLOADER' ;

insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'UPDATE_PREPAID_BALANCE.INTERVAL', '0');
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'LOADER.DB_ERROR_RETRY_SLEEP_SECONDS', '30');
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'LOADER.DB_ERROR_RETRY_ATTEMPTS', '10');

insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'SHOW_ASSOCIATED_INFO_FOR_ALL_ALARM_TABS','0',0);
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'DEFAULT_ACTIVE_ALARM_TAB','1',0);

insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'DURATION_IN_SECONDS', 0) ;

insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (64,'Update Data Record',0);

delete from list_configs_networks where list_config_id in (1,2);                                         
insert into list_configs_networks (network_id, list_config_id ) (select n.id, s.id from list_configs s , networks n where n.id!=999 and (select count(*) from networks) != 1 and s.id not in (1024,1025,1026,1027,1028)) ;
insert into list_configs_networks (network_id, list_config_id ) (select n.id, s.id from list_configs s , networks n where n.id=999 and (select count(*) from networks) = 1 ) ; 

delete from basic_filter_configs  where record_config_id =15 and field_id in (3,7,6);                       
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 2, 0, 2, 0) ;                                       
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 4, 0, 3, 0) ;                                       
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 8, 10,4, 0) ;                                       
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 7, 8, 5, 0) ; 

insert into audit_log_event_codes values (895,'Workflow Exported', 'Workflow ''$1'' was exported', 44) ;
insert into audit_log_event_codes values (896,'Workflow Imported', 'Workflow ''$1'' was imported', 44) ;

insert into audit_log_event_codes values(900,'Reset Workflow','Workflow ''$1'' reset',44);

insert into entity_types(id, entity_description) values (15000, 'Report Scheduler') ;
insert into entity_types (id,entity_description) values (9021,'Import');
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval, 'FILE_UPLOAD_EXTENTIONS', '*.txt;*.csv');

insert into XDR_OFFLINE_TEMP_MAPS values ( 1 , 1 , 'TEMP_OFFLINE_CDR' , 'TEMP_SWAP_OFFLINE_CDR' ) ;
insert into XDR_OFFLINE_TEMP_MAPS values ( 2 , 2 , 'TEMP_OFFLINE_RECH_LOG' , 'TEMP_SWAP_OFFLINE_RECH_LOG' ) ;
insert into XDR_OFFLINE_TEMP_MAPS values ( 3 , 7 , 'TEMP_OFFLINE_GPRS_CDR' , 'TEMP_SWAP_OFFLINE_GPRS_CDR' ) ;
insert into XDR_OFFLINE_TEMP_MAPS values ( 4 , 83 , 'TEMP_OFFLINE_IPDR' , 'TEMP_SWAP_OFFLINE_IPDR' ) ;

-- nikira-DML-nrtrde.sql
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'TRUNCATE_VPMN_INFO_FOR_BULK_LOAD', '0' );

-- nikira-DML-exec-sp.sql
insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(225, 225, 225, 225) ; 
insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 225, 1, 1) ;

-- nikira-DML-task.sql
DECLARE
		AlarmId  NUMBER(10,0) ;
BEGIN
		SELECT id INTO AlarmId FROM tasks WHERE NAME = 'Alarm Management' ;
		UPDATE tasks SET PARENT_ID = AlarmId, NAME = 'Workflow Execution'
				WHERE LINK = '/alarm/show_initiate_workflow;/alarm/show_change_workflow' and NAME = 'Workflow for alarm' ;
END ;
/

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Workflows'), 'Import Workflow', '/workflow/import_workflow/90', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Workflows'), 'Export Workflow', '/workflow/export_workflow', 0, 0) ;

insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 96, id from tasks where link like '%/alarm_stack/alarms_for_user%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 116, id from tasks where link like '%/alarm_stack/alarms_for_my_teams%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 16, id from tasks where link like '%/alarm_stack/open_alarms%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 17, id from tasks where link like '%/alarm_stack/closed_alarms%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 18, id from tasks where link like '%/alarm_stack/assigned_alarms%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 19, id from tasks where link like '%/alarm_stack/archived_alarms%') ;

-- nikira-DML-task-isp.sql
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Record View'), 'Filter on Non Indexed Fields', '/non_index_filtering/83', 0, 0) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'IPDR', '/global_exceptions/list/83?show_enrichment=true',  0, 1) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/83', 0, 0) ;

declare                                                                                                     
  list_task_id number;                                                                                      
  modify_task_id number;                                                                                    
begin                                                                                                       
  select ID into list_task_id from tasks where LINK = '/global_exceptions/list/83?show_enrichment=true' ;   
  select ID into modify_task_id from tasks where LINK = '/global_exceptions/edit/83' ;                      
  insert into ranger_groups_tasks values(0, list_task_id);                                                  
  insert into ranger_groups_tasks values(1, list_task_id);                                                  
  insert into ranger_groups_tasks values(2, list_task_id);                                                  
  insert into ranger_groups_tasks values(0, modify_task_id);                                                
  insert into ranger_groups_tasks values(1, modify_task_id);                                                
  insert into ranger_groups_tasks values(2, modify_task_id);                                                
end ;                                                                                                       
/ 

-- nikira-DML-task-nrtrde.sql
update tasks set LINK='/vpmn_info/list/49?fetch_records=false' where LINK= '/record_view/list/49?fetch_records=false' ; 

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Add NRTRDE Partner', '/vpmn_info/new/49', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Modify NRTRDE Partner', '/vpmn_info/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Show NRTRDE Partner', '/vpmn_info/show', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Delete NRTRDE Partner', '/vpmn_info/destroy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Multiple Delete NRTRDE Partner', '/vpmn_info/multiple_delete/49', 0, 0) ;

insert into entity_types (id,entity_description) values (10013,'NRTRDE Partner');

insert into audit_log_event_codes values (897,'NRTRDE Partner(s) Added', 'NRTRDE Partner ''$1'' added', 22) ;
insert into audit_log_event_codes values (898,'NRTRDE Partner(s) Updated', 'NRTRDE Partner ''$1'' updated', 22) ;
insert into audit_log_event_codes values (899,'NRTRDE Partner(s) Deleted', 'NRTRDE Partner ''$1'' deleted', 22) ;

-- nikira-DML-AI-exec.sql
CREATE OR REPLACE PROCEDURE PopulateSubscribers(neural_prof_type IN NUMBER, nwk_ids IN VARCHAR) AS
BEGIN
    INSERT INTO subscriber_neural_profile (subscriber_id, phone_number, network_id, profile_type)
	    (SELECT id, phone_number, network_id, neural_prof_type FROM subscriber WHERE id > 1024
   		 AND (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0')
         AND status IN (1,2)
       	 AND EXISTS (SELECT aig.name FROM ai_groups aig WHERE CompareCSV(aig.name, subscriber.groups) > 0)
         MINUS
         SELECT subscriber_id, phone_number, network_id,profile_type FROM subscriber_neural_profile WHERE
   		 (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0'));
     COMMIT ;
END ;
/

--- nikira-DML-vpmn-rules.sql
declare
	rule_seq number ;
begin
	--- Rule for setting Previous Processed VPMN ID
	select s_rule_seq.nextval into rule_seq from dual ;
	insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function,
					   is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
			values
								(rule_seq, 999, rule_seq, 'Before Updating VPMN Copy VPMN ID', 0, 200, 0, 0, 1,
															sysdate, sysdate, 100, 'radmin', '', 1, 'DISPATCHER.VPMN.STORE') ;
	insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 42) ;
	insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
	insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 4000, 1, 0) ;
	insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 3000) ;
								
	insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 42, 1, 999) ;
	insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, s_rule_seq.currval) ;
	insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '514.2', '0', 1024, 26) ;
	insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;

	--- Rule for Updating an existing VPMN Record
	select s_rule_seq.nextval into rule_seq from dual ;
	insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function,
					   is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
			values
								(rule_seq, 999, rule_seq, 'Update VPMN Record', 0, 200, 0, 0, 1,
															sysdate, sysdate, 100, 'radmin', '', 1, 'DISPATCHER.VPMN.STORE') ;
	insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 42) ;
	insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 64) ;
	insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 0, 0, 42) ;
	insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 3000) ;
								
	insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 42, 1, 999) ;
	insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, s_rule_seq.currval) ;
	insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '514.2', '0', 1024, 26) ;
	insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;
end ;
/

--- nikira-DML-internal-user-exec.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,71,'FLOAT_PRECISION',2);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,71,'IS_CURRENCY',1);

--- nikira-DML-rtf-exec.sql
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,103,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,7,105,'IS_CURRENCY',1);

--- nikira-DML-aggregation-isp.sql
delete from counter_maps where category = 'PROFILE_FIELD' and aggregation_type = 225 
	and function_id in (1,2) and record_config_id = 83 and counter_type = 201 ;

--- nikira-DML-update-features.sql 
---- Note : GDO has to take care of the network level currency setting if required
update networks set currency=(select value from configurations where config_key like '%CURRENCY%') ;

--- nikira-DML-help-files.sql
delete from help_files_maps where key = 'ALARM_CHANGE_FRAUD_TYPE' ;
delete from help_files_maps where key = 'EXECUTE_ACTIVITY_TEMPLATE' ;
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT','homepage_activity_inputs_hpgs.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT_CREATE','add_activity_inputs_wmgmt.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT_EDIT','add_activity_inputs_wmgmt.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT','homepage_activity_outputs_hpgs.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT_CREATE','add_activity_outputs_wmgmt.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT_EDIT','add_activity_outputs_wmgmt.htm');
insert into help_files_maps values(help_files_maps_seq.nextval,'GLOBAL_EXCEPTION_IPDR','homepage_ipdr_hpgs.htm');

-- workflow-db-exec.sql
delete from TEAMS_USERS_ALARM_TASKS where ALARM_TASK_ID = 3;
DELETE FROM ALARM_TASKS WHERE ID = 3 ;

/*
Doubtful entries from Original Migration File

--  Files       :  nikira-DDL-db.sql.parse.in
--  Bug Details :  Bug 33516 -  Not accepting user name as phone_number for phone number when IPDR is selected Bringing Advanced Query Framwork, Finger Print,Smart Pattern Rules support for IPDR Data Stream
--  Comments    :  ISP Related Entries

 update expressions set RIGHT_FIELD='%' where LEFT_FIELD='12' and RIGHT_FIELD='+%' and 
	RIGHT_FIELD_INDICATOR=1024 and OPERATOR_ID=1 and id in (select expression_id from filter_tokens 
	where system_filter = 1);

--  Files       :  nikira-DML-task-nrtrde.sql,nikira-DML-new-record-config-nrtrde.sql  
--  Comments    :    Brought in GUI for NRTRDE Partners 

 insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 49, id from tasks 
	where link like '%record_view/list/49?fetch_records=%') ;

--  Files       :   nikira-DML-new-record-config-gsm.sql,nikira-DML-rtf-exec.sql.parse.in,nikira-DML-exec.sql.parse.in,nikira-DML-new-record-config.sql, nikira-DML-new-record-config-recharge.sql,nikira-DDL-db.sql.parse.in,nikira-DML-new-record-config-isp.sql,nikira-DML-record-config-demo-recharge.sql,nikira-DML-internal-user-exec.sql,nikira-DML-record-config-demo-gsm.sql,nikira-DML-record-config-demo-gprs.sql
--  Bug Details :   CR-NIK-523 - Multiple currency support in Nikira UI based on network
--  Comments    :   Now the currency will depend on network table, currency field
--  Impacts     :   All record views will now show the currency in their field name based on the network chosen.

insert into field_configs_additionals(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) (select 
	FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,FIELD_ID,RECORD_CONFIG_ID,'IS_CURRENCY',1 from field_configs 
	where name like '%(INR)%');
*/

-- packages 
@ ../dbutils.sql
@ ../fieldutil.sql
@ ../utility_package.sql
@ ../archiver_package.sql
@ ../cleanup_package.sql
@ ../cdr_summary_package.sql
@ ../highriskdestination_summary_procedure.sql
@ ../mismatch_summary_procedure.sql
@ ../alarm_closure_actions.sql
@ ../fraudlossavoidancesummary.sql
@ ../rule_performance_package.sql
@ ../asn_cdr_population.sql
@ ../group_summary_procedure.sql
@ ../delete_rule.sql
@ ../generateRTFEntitySummary.sql
@ ../subscriber_cleanup.sql
@ ../report_utility.sql
@ ../import-functions.sql

@ Additional_first_Migration_after_7.3.2.sql

-- Due to a change in the Order of execution of files in 7.3.2.0 DB Setup, entries corresponding to 
-- aggregation type "Otherparty Number" get deleted. This results in countermanager failure during
-- starting (for Otherparty Number) and hence the Program Manager comes out. You will face this issue
-- if the 7.3.2.0 DBSetup revision is >= 82303. If the same happens, please uncomment the 
-- following line to correct the issue.
-- @ Additional_second_Migration_after_7.3.2.sql

@ Additional_third_Migration_after_7.3.2.sql

@ Additional_fourth_Migration_after_7.3.2.sql

@ Additional_fifth_Migration_after_7.3.2.sql                                                                      

commit ;
spool off ;
quit ;
