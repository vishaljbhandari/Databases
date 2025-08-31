spool migrations_after_7.0.2.0.log

-- FTCT Changes - START

DROP TABLE MISSED_XDR_ENTRIES ;
DROP TABLE TEMP_ID_1 ;
DROP TABLE TEMP_ID_2 ;
DROP TABLE TEMP_ID_3 ;
DROP TABLE INSERTED_XDR_ENTRIES_1 ;
DROP TABLE INSERTED_XDR_ENTRIES_2 ;
DROP TABLE INSERTED_XDR_ENTRIES_3 ;
DROP TABLE NO_DENORMALIZATION_TYPES ;

DROP TABLE ALARM_CDR CASCADE CONSTRAINTS ;
DROP TABLE ARCHIVED_ALARM_CDR CASCADE CONSTRAINTS ;
@GPRS@DROP TABLE ALARM_GPRS_CDR ;
@GPRS@DROP TABLE ARCHIVED_ALARM_GPRS_CDR ;
DROP TABLE ALARM_RECHARGE_LOG  CASCADE CONSTRAINTS ;
DROP TABLE ARCHIVED_ALARM_RECHARGE_LOG  CASCADE CONSTRAINTS ;
DROP TABLE ALARM_XDR_MAPS ;
DROP SEQUENCE ALARM_XDR_MAPS_SEQ ;
DROP TABLE ALARM_ADJUSTMENT_LOGS ;
DROP TABLE ARCHIVED_ALARM_ADJUSTMENT_LOGS ;

DROP TABLE ALARM_CRM_LOGS ;
DROP TABLE ARCHIVED_ALARM_CRM_LOGS ;

DROP TABLE ALARM_IPDR ;
DROP TABLE ARCHIVED_ALARM_IPDR ;

--- RUN id sequence for alert_cdr ---
DROP SEQUENCE ALERT_CDR_RUN_ID_SEQ ;

-- Table to store missed id entries during a run of alarmdenormalizer
CREATE TABLE MISSED_XDR_ENTRIES(
	ID						NUMBER(20,0) NOT NULL,
	REC_TYPE_IDENTIFIER		NUMBER(20,0) NOT NULL,
    DAY_OF_YEAR				NUMBER(20,0) NOT NULL,
    ALERT_ID 				NUMBER(20,0) NOT NULL,
    AGGREGATION_TYPE		NUMBER(20,0) NOT NULL,
	AGGREGATION_VALUE		VARCHAR2(40) NOT NULL
);

-- Temp table creations for AlarmDenormalizer slave threads
CREATE TABLE TEMP_ID_1(
	ID						NUMBER(20,0) NOT NULL,
	ALERT_ID				NUMBER(20,0) NOT NULL,
	REC_TYPE_IDENTIFIER		NUMBER(20,0) NOT NULL,
	AGGREGATION_TYPE		NUMBER(20,0) NOT NULL,
	AGGREGATION_VALUE		VARCHAR2(40) NOT NULL
);

CREATE TABLE TEMP_ID_2(
	ID						NUMBER(20,0) NOT NULL,
	ALERT_ID				NUMBER(20,0) NOT NULL,
	REC_TYPE_IDENTIFIER		NUMBER(20,0) NOT NULL,
	AGGREGATION_TYPE		NUMBER(20,0) NOT NULL,
	AGGREGATION_VALUE		VARCHAR2(40) NOT NULL
);

CREATE TABLE TEMP_ID_3(
	ID						NUMBER(20,0) NOT NULL,
	ALERT_ID				NUMBER(20,0) NOT NULL,
	REC_TYPE_IDENTIFIER		NUMBER(20,0) NOT NULL,
	AGGREGATION_TYPE		NUMBER(20,0) NOT NULL,
	AGGREGATION_VALUE		VARCHAR2(40) NOT NULL
);

CREATE TABLE INSERTED_XDR_ENTRIES_1 AS SELECT * FROM MISSED_XDR_ENTRIES ;
CREATE TABLE INSERTED_XDR_ENTRIES_2 AS SELECT * FROM MISSED_XDR_ENTRIES ;
CREATE TABLE INSERTED_XDR_ENTRIES_3 AS SELECT * FROM MISSED_XDR_ENTRIES ;

--- Table entries to exclude out the record types which donot need denormalization 
CREATE TABLE NO_DENORMALIZATION_TYPES
(
		ID NUMBER(10),
		RECORD_CONFIG_ID NUMBER(20) NOT NULL,
		DESCRIPTION VARCHAR(50)
) ;

INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(1,3,'SUBSCRIBER') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(2,69,'OBSERVATION_SUMMARY_RECORDS') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(3,29,'DEVIATED_CUM_VOICE_ROC_RECORDS') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(4,30,'DEVIATED_CUM_DATA_ROC_RECORDS') ;

-- New Column added in functions table and settings values for IP, Per Call and AI Rules
alter table functions add  IS_COUNTER_RESPONSE_REQD NUMBER(1,0) DEFAULT 1 ;
update functions set IS_COUNTER_RESPONSE_REQD = 0 where FUNCTION_NAME in ('Per Call','IP Duration','IP Value','AI ROC Voice','AI ROC Data', 'Suspicious Recharge','Bitmap Match Function','Other Party Country Code','Alarm Link Match Function','Match Function','Odd Value topup','Count Changes','QoS Violation', 'Service Violation', 'Invalid Subscriber','Called To Called By Function','No Function','Negative Rule Function') ;

-- Configured Queue Sizes for the threads brought in for threaded architecture
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'DEFAULT_MAX_SENDER_QUEUE_SIZE','2000') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'DISPATCHER_THREAD_QUEUE_SIZE','2000') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'COUNTER_THREAD_QUEUE_SIZE','300') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'VIOLATION_THREAD_QUEUE_SIZE','100') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'VIOLATION_THREAD_MAP_SIZE','100') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'FILTER_THREAD_QUEUE_SIZE','200') ;

-- Entry for querying temp_xdr for AlarmDenormalizer
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ALARMDENORMALIZER.QUERY_TEMP_XDR','0') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ALARMDENORMALIZER.TRIGGER_AFTER_SLEEP','1') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ALARMDENORMALIZER.TRIGGER_FROM_ALARM_GNTR','0') ;

-- Entry for storing last run id for AlarmDenormalizer
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ALARMDENORMALIZER.RUN_ID','0') ;

--- Error Tolerance Configurations
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ERROR_TOLERANCE_CHECK','1') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'DATA_TYPE_VALIDATION','0') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'FIELD_COUNT_VALIDATION','1') ;

-- Entry for queue sizes for AlarmDenormalizer Threads
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'SLAVE_THREAD_QUEUE_SIZE','100') ;

-- Configurations entries to handle cleanup of alarm_xdr tables
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.ALARM_CDR.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.ALARM_GPRS_CDR.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.ALARM_ADJUSTMENT_LOGS.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.ALARM_CRM_LOGS.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.ALARM_RECHARGE_LOG.OPTIONS', '1970/01/01 00:00:00,30') ;

insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_CDR_DAY_TRUNCED','');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_GPRS_CDR_DAY_TRUNCED','');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_RECHARGE_LOG_DAY_TRUNCED','');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_ADJUSTMENT_LOGS_DAY_TRUNCED','');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_CRM_LOGS_DAY_TRUNCED','');
 
-- Configuration for Summarizing counters that spill multiple rows
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'DEFAULT_SUMMARIZATION_GRANULARITY', '900');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'DEFAULT_SUMMARIZATION_ROW_COUNT_THRESHOLD', '5');

update configurations set value='1' where config_key = 'NO_OF_RECORDS_PER_TRANSACTION_FOR_RSAGE' ;

update actions_rules set action_id=7 where action_id=8;
 
CREATE SEQUENCE ALERT_CDR_RUN_ID_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
DROP INDEX IX_ALERT_CDR_RUN_ID ;
ALTER table alert_cdr add RUN_ID NUMBER(20) ; 
ALTER table alert_cdr add AGGREGATION_TYPE NUMBER(20) ;
ALTER table alert_cdr add AGGREGATION_VALUE VARCHAR2(40) ;
ALTER table alert_cdr add TIME_STAMP DATE ;
ALTER table alert_cdr add IS_CALLED_TO_CALLED_BY number(1) default 0 ;
CREATE INDEX IX_ALERT_CDR_RUN_ID ON  ALERT_CDR ("RUN_ID") ;

ALTER table archived_alert_cdr add RUN_ID NUMBER(20) ;
ALTER table archived_alert_cdr add AGGREGATION_TYPE NUMBER(20) ;
ALTER table archived_alert_cdr add AGGREGATION_VALUE VARCHAR2(40) ;
ALTER table archived_alert_cdr add TIME_STAMP DATE ;

CREATE TABLE ALARM_CDR AS SELECT * FROM CDR where 1=2 ;
ALTER TABLE ALARM_CDR ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_ALARM_CDR_ALRT_ID ON ALARM_CDR(ALERT_ID) ;

CREATE TABLE ARCHIVED_ALARM_CDR AS SELECT * FROM ALARM_CDR   where 1=2 ;
CREATE INDEX IX_AR_ALM_CDR_ALRT_ID ON ARCHIVED_ALARM_CDR(ALERT_ID) ;
 
@GPRS@CREATE TABLE ALARM_GPRS_CDR AS SELECT * FROM GPRS_CDR where 1=2 ;
@GPRS@ALTER TABLE ALARM_GPRS_CDR ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
@GPRS@CREATE INDEX IX_ALARM_GPRS_CDR_ALRT_ID ON ALARM_GPRS_CDR(ALERT_ID) ;

@GPRS@CREATE TABLE ARCHIVED_ALARM_GPRS_CDR AS SELECT * FROM GPRS_CDR where 1=2 ;
@GPRS@ALTER TABLE ARCHIVED_ALARM_GPRS_CDR ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
@GPRS@CREATE INDEX IX_AR_ALM_GPRS_CDR_ALTID ON ARCHIVED_ALARM_GPRS_CDR(ALERT_ID) ;

CREATE TABLE ALARM_RECHARGE_LOG AS SELECT * FROM RECHARGE_LOG where 1=2 ;
ALTER TABLE ALARM_RECHARGE_LOG ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_ALM_RCHRG_LOG_ALT_ID ON ALARM_RECHARGE_LOG(ALERT_ID) ;

CREATE TABLE ARCHIVED_ALARM_RECHARGE_LOG AS SELECT * FROM RECHARGE_LOG where 1=2  ;
ALTER TABLE ARCHIVED_ALARM_RECHARGE_LOG ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_AR_ALM_RHRG_LOG_ALTID ON ARCHIVED_ALARM_RECHARGE_LOG(ALERT_ID) ;

CREATE SEQUENCE ALARM_XDR_MAPS_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 ORDER ;
CREATE TABLE ALARM_XDR_MAPS
(
    ID              NUMBER(20)               NOT NULL ,
    LOOKUP_TABLE_NAME VARCHAR2(30) NOT NULL,
    RECORD_CONFIG_ID NUMBER(20) NOT NULL,
    CONSTRAINT PK_ALR_XDR_MAP PRIMARY KEY(ID),
    CONSTRAINT FK_ALXDR_MAP_CFG_REC_CFG_ID FOREIGN KEY (RECORD_CONFIG_ID) REFERENCES RECORD_CONFIGS(ID)
) ;

-- Archive Map ----
@GSM@update archive_maps set ARCHIVE_NAME = 'ARCHIVED_ALARM_CDR', LOOKUP_TABLE_NAME = 'ARCHIVED_ALARM_CDR' where RECORD_CONFIG_ID = 1;
@GPRS@update archive_maps set ARCHIVE_NAME = 'ARCHIVED_ALARM_GPRS_CDR', LOOKUP_TABLE_NAME = 'ARCHIVED_ALARM_GPRS_CDR' where RECORD_CONFIG_ID = 7;
@RECHARGE@update archive_maps set ARCHIVE_NAME = 'ARCHIVED_ALARM_RECHARGE_LOG', LOOKUP_TABLE_NAME = 'ARCHIVED_ALARM_RECHARGE_LOG' where RECORD_CONFIG_ID = 2;
@INTERNAL_USER@update archive_maps set ARCHIVE_NAME = 'ARCHIVED_ALARM_ADJUSTMENT_LOGS', LOOKUP_TABLE_NAME = 'ARCHIVED_ALARM_ADJUSTMENT_LOGS' where RECORD_CONFIG_ID = 71;
@INTERNAL_USER@update archive_maps set ARCHIVE_NAME = 'ARCHIVED_ALARM_CRM_LOGS', LOOKUP_TABLE_NAME = 'ARCHIVED_ALARM_CRM_LOGS' where RECORD_CONFIG_ID = 72;

-- Alarm XDR map ---
@GSM@insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_CDR',1);
@GPRS@insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_GPRS_CDR',7);
@RECHARGE@insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_RECHARGE_LOG',2);

insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_IPDR',83);
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'OBSERVATION_SUMMARY_RECORDS',69);
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'AR_OBSERVATION_SUMMARY_RECORDS',93);
@INTERNAL_USER@insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_ADJUSTMENT_LOGS',71);
@INTERNAL_USER@insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_CRM_LOGS',72);

CREATE TABLE ALARM_ADJUSTMENT_LOGS AS SELECT * FROM ADJUSTMENT_LOGS  where 1=2 ;
ALTER TABLE ALARM_ADJUSTMENT_LOGS ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_ALM_ADJST_LOG_ALT_ID ON ALARM_ADJUSTMENT_LOGS(ALERT_ID) ;

CREATE TABLE ARCHIVED_ALARM_ADJUSTMENT_LOGS AS SELECT * FROM ALARM_ADJUSTMENT_LOGS where 1=2 ;
CREATE INDEX IX_AR_ALM_ADJ_LOG_ALT_ID ON ARCHIVED_ALARM_ADJUSTMENT_LOGS(ALERT_ID) ;

CREATE TABLE ALARM_CRM_LOGS AS SELECT * FROM CRM_LOGS where 1=2 ;
ALTER TABLE ALARM_CRM_LOGS ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_ALM_CRM_LOG_ALT_ID ON ALARM_CRM_LOGS(ALERT_ID) ;

CREATE TABLE ARCHIVED_ALARM_CRM_LOGS AS SELECT * FROM ALARM_CRM_LOGS  where 1=2 ;
CREATE INDEX IX_AR_ALM_CRM_LOG_ALT_ID ON ARCHIVED_ALARM_CRM_LOGS(ALERT_ID) ;

CREATE TABLE ALARM_IPDR AS SELECT * FROM IPDR where 1=2 ;
ALTER TABLE ALARM_IPDR ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_ALARM_IPDR_ALT_ID ON ALARM_IPDR(ALERT_ID) ;

CREATE TABLE ARCHIVED_ALARM_IPDR AS SELECT * FROM IPDR  where 1=2 ;
ALTER TABLE ARCHIVED_ALARM_IPDR ADD ALERT_ID NUMBER(20,0)    NOT NULL ;
CREATE INDEX IX_AR_ALM_IPDR_ALT_ID ON ARCHIVED_ALARM_IPDR(ALERT_ID) ;

ALTER TABLE CDR_COUNTER ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0;
ALTER TABLE CDR_COUNTER MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

ALTER TABLE STATISTICAL_COUNTER ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0 ;
ALTER TABLE STATISTICAL_COUNTER MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

ALTER TABLE CALL_COLLISION_COUNTERS ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0;
ALTER TABLE CALL_COLLISION_COUNTERS MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

ALTER TABLE INVALID_SUBSCRIBER_COUNTERS ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0;
ALTER TABLE INVALID_SUBSCRIBER_COUNTERS MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

ALTER TABLE PROFILE_COUNTER ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0;
ALTER TABLE PROFILE_COUNTER MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

ALTER TABLE GEO_POS_COUNTER ADD IS_SUMMARIZED NUMBER(1) DEFAULT 0 ;
ALTER TABLE GEO_POS_COUNTER MODIFY IS_SUMMARIZED  NUMBER(1) NOT NULL ;

insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (field_record_config_map_seq.nextval,74,50,'2');

insert into data_types(id, data_type) values(11, 'Float') ;

insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (29,2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (30,2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (2, 2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (7, 2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (42,200) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (51,74) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (50,74) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (26,2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (27,2) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (10,1) ;
@ISP@insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (83,2) ;

-- FTCT Changes - END


-- Delete entry from field_record_config_maps for CRM Logs(which was mapped wrongly) ------
delete field_record_config_maps where field_category_id=17 and record_config_id=72 ; 

-------Configuration Entry for I2 look back days----
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'I2_LOOK_BACK_DAYS', '30') ;

-- Update rule prioritied for Subscriber Store rules which adds blacklist profile options on Account Cancellation --
update rule_priority_maps set priority=2031 where rule_id = (select id from rules where name='Update Subscriber') ;
update rule_priority_maps set priority=2032 where rule_id = (select id from rules where name='Adding Sub to Blacklist Profile Options') ;
update rule_priority_maps set priority=2033 where rule_id = (select id from rules where name='Close Alarm as FRD') ;

-------Regular Expressiong i18n Changes ------
alter table regular_expressions add (LANGUAGE_KEY  VARCHAR2(256)) ;

alter table field_configs drop constraint FK_REG_EXP_ID ;
alter table field_categories drop constraint FK_FLD_CAT_RE_ID ;
alter table notification_types drop constraint FK_NOT_TYP_REG_EX_ID ;
alter table regular_expressions drop CONSTRAINT PK_REG_EXP ;
alter table regular_expressions add (CONSTRAINT UK_REG_EXP_ID_LANG_KEY UNIQUE (ID, LANGUAGE_KEY)) ;

update regular_expressions set expression='^[\w\.\-]*[a-zA-Z]+[\w\.\-]*$' where description='User Name Regular Expression' and id=16 ;
update regular_expressions set description='Name Regular Expression', expression = '^[\w\$\s_\-\.%?\+\(\)<>=\&]*[a-zA-Z]+[\w\$\s_\-\.%?\+\(\)<>=\&]*$' where description='Case Name Regular Expression' and id=18 ;
--Duplicate address regular expression removed
delete from regular_expressions where id = 20 and description = 'Address Regular Expression' ;
--New Regular expressions used in form validation
insert into regular_expressions(id, expression, description) values(27, '[\w\s\-.@%?,#$&()\[\]/\\<>;:\+\*]*$', 'Description Regular expression');
insert into regular_expressions(id, expression, description) values(28, '^[\w\s_\-\.]*[a-zA-Z]+[\w\s_\-\.]*$', 'Simple Name Regular Expression' ) ;
insert into regular_expressions(id, expression, description) values(29, '[a-zA-z]+', 'Alphabet Regular Expression to test characters' ) ;
insert into regular_expressions(id, expression, description) values(30, '^([A-Za-z0-9][A-Za-z0-9]*[-.,]?[A-Za-z0-9])+$' , 'IP and Hostname validation regex to support multiple entires with commas' ) ;
insert into regular_expressions(id, expression, description) values(31, '\w', 'Alphanumeric Regular Expression for character input' ) ;

-------End of Regular Expressiong i18n Changes ------

--Migration entry for standalone setup for AI
@STANDALONE@update configurations set config_key = replace(config_key,'0','999') where  config_key='AI.CUMREC_%_LAST_PROCESSED_DAY_OF_YEAR_0' ;

-------------------- Revoke Pending Alarms in My Team Alarms: Changes--------------------
UPDATE BASIC_FILTER_CONFIGS SET TRANSLATION_ID=38 WHERE RECORD_CONFIG_ID=21 AND RECORD_VIEW_CONFIG_ID=116 AND FIELD_ID=8;
UPDATE RECORD_VIEW_CONFIGS SET WHERE_CLAUSE='STATUS IN (0,1,3,5,6)' WHERE ID=116;

delete from alarm_tasks where id=11;
insert into alarm_tasks(id, name) values(11, 'Revoke Pending Alarm') ;


DELETE FROM RANGER_GROUPS_TASKS where TASK_ID = (SELECT ID FROM TASKS WHERE NAME='Revoke Pending Alarms' AND LINK='/alarm_stack/revoke_pending_alarms/116');
DELETE FROM TASKS WHERE NAME='Revoke Pending Alarms' AND LINK='/alarm_stack/revoke_pending_alarms/116';
INSERT INTO TASKS (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM )
	VALUES (TASKS_SEQ.NEXTVAL, '0,1,2,3,4', GetParentID('My Team Alarms', 'Alarm Management'), 'Revoke Pending Alarms',
		'/alarm_stack/revoke_pending_alarms/116', 0, 0) ;
--
-- NOTE: Please update all the require roles' ids below, for which this task can be assigned
--
INSERT INTO RANGER_GROUPS_TASKS (SELECT ID, TASKS_SEQ.CURRVAL FROM RANGER_GROUPS WHERE id in (0,1,2,999)) ;


--------Closed alarm view to show nikira user in filters--------------------
update translations set value='select * from (select name as key, name as value from RANGER_USERS where id > 1 and is_active = 1 union select name as key, name||'' (Team)'' as value from teams where is_active = 1) order by value' where tr_id=514;

----------Account name regular expressions in manual alarm creation is changed--------------------
update field_categories set regular_expression_id=8 where id=7;

-- Renamed the Negative rule's field_categories name --
update field_categories set name='IMSI - Query Rule' where id=205 ; 
update field_categories set name='Account Name - Query Rule' where id=206 ; 

------Grous made hidden for aggregation type VPMN ----------
update aggregation_types_maps set GROUP_RECORD_CONFIG_ID = null where SOURCE_AGGREGATION = 200 ;

------Ranger User field name made consistent-------------------
update field_configs set name='Contact Number' where record_config_id=40 and field_id=11;
update field_configs set name='Email ID' where record_config_id=40 and field_id=13;
update field_configs set name='Password Validity (days)' where record_config_id=40 and field_id=15;
update field_configs set name='Permissible Machines (ip/hostname)' where record_config_id=40 and field_id=19;

----Translation for Function in Statistical Rule Elements --------------
insert into translation_indices (id, DESCRIPTION, IS_DYNAMIC) values (154, 'Statistical Rule Element Functions', 0 ) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 154, '-176', 'select id as Key, name as Value from
pseudo_functions where category like ''%PROFILE_FIELD%''' ) ;
update field_configs set translation_id=154 where translation_id=66 and record_config_id=79 and field_id=8 ;



insert into fraud_types_rules (rule_id, fraud_type_id) ( select id, 1 from rules where category='CalledToCalledBy' and is_active=1 ) ;

delete SCHEDULER_PARAMETERS where job_name='High Risk Destination Summary' ;
update SCHEDULER_COMMAND_MAPS set is_parameter_required=0 where job_name='High Risk Destination Summary' ;


-------Configuration Entry for text format file delimiter----
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'TEXTFILE.DELIMITER', '-') ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'MAX.RECORD.IN.TEXT.FILE', '-1') ;


----Adding display_name column in Operators table -------------
alter table operators add display_name varchar2(30) ;

update operators set display_name='Invalid' where id=-1 ;
update operators set display_name='Like' where id=0 ;
update operators set display_name='Not Like' where id=1 ;
update operators set display_name='Less Than or Equal to' where id=2 ;
update operators set display_name='Greater Than or Equal to' where id=3 ;
update operators set display_name='Less Than' where id=4;
update operators set display_name='Greater Than' where id=5;
update operators set display_name='Equal' where id=6 ;
update operators set display_name='Not Equal' where id=7 ;
update operators set display_name='In' where id=8 ;
update operators set display_name='Not In' where id=9 ;
update operators set display_name='Between' where id=10 ;
update operators set display_name='Empty' where id=11 ;
update operators set display_name='Non Empty' where id=12 ;
update operators set display_name='Less Than or Equal to' where id=13 ;
update operators set display_name='Greater Than or Equal to' where id=14 ;
update operators set display_name='Less Than' where id=15 ;
update operators set display_name='Greater Than' where id=16 ;
update operators set display_name='Equal' where id=17 ;
update operators set display_name='Between' where id=18 ;
update operators set display_name='Less Than or Equal to' where id=19 ;
update operators set display_name='Greater Than or Equal to' where id=20 ;
update operators set display_name='Less Than' where id=21 ;
update operators set display_name='Greater Than' where id=22 ;
update operators set display_name='Equal' where id=23 ;
update operators set display_name='Between' where id=24;
update operators set display_name='Not Equal' where id=25 ;
update operators set display_name='Not Equal' where id=26 ;
update operators set display_name='Association Present' where id=27 ;
update operators set display_name='Association Not Present' where id=28 ;

alter table operators modify display_name varchar2(30) not null ;

---------------Rule Name regular Expression changed to 14 from 9 for Alarm Exclation/notification/assignment and grouping  rules------
update field_configs set REG_EXP_ID=14 where RECORD_CONFIG_ID in (78,80) and field_id = 2 ;
update field_configs set REG_EXP_ID=14 where RECORD_CONFIG_ID = 88 and field_id = 1 ;


------------------ Pending time is displayed as 01 Jan 1970 00:00:00 for alarms------------
CREATE OR REPLACE VIEW ALARM_VIEWS
AS
(
        SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID as USER_ID, A.OWNER_TYPE as OWNER_TYPE,
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yy'), to_date('','dd-mm-yy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE,
		FieldUtil.normalize(S.ACCOUNT_NAME) ACCOUNT_NAME,
LTRIM(FieldUtil.normalize(S.FIRST_NAME)||nvl2(S.MIDDLE_NAME,' '||FieldUtil.normalize(S.MIDDLE_NAME),'')||nvl2(S.LAST_NAME,' '||FieldUtil.normalize(S.LAST_NAME),'')) SUBSCRIBER_NAME,
                S.GROUPS, C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, S.ACCOUNT_ID AS PARENT_ID
                , decode(A.REFERENCE_ID,4,4,2,2,0,0,AC.HIERARCHY_ID) AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS
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
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yy'), to_date('','dd-mm-yy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE, FieldUtil.normalize(AC.ACCOUNT_NAME) ACCOUNT_NAME, 
LTRIM(FieldUtil.normalize(AC.FIRST_NAME)||nvl2(AC.MIDDLE_NAME,' '||FieldUtil.normalize(AC.MIDDLE_NAME),'')||nvl2(AC.LAST_NAME,' '||FieldUtil.normalize(AC.LAST_NAME),'')) SUBSCRIBER_NAME,
                '', C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, AC.PARENT_ID AS PARENT_ID, AC.HIERARCHY_ID AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS
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
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yy'), to_date('','dd-mm-yy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE,
                A.IS_VISIBLE, 'Not Applicable', 'Not Applicable', 'Not Applicable', 0.0, A.DISPLAY_VALUE, A.RULE_IDS,0 AS PARENT_ID,4 AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS
                FROM ALARMS A
                        WHERE (A.REFERENCE_TYPE NOT IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID IN (3, 4)) OR A.REFERENCE_ID = 0)
							AND A.IS_VISIBLE = 1
                            AND A.STATUS NOT IN (7)
) ;



CREATE OR REPLACE VIEW THRESHOLDS_V
AS
(
 SELECT DISTINCT T.ID AS ID, R.ID AS RULE_ID, R.KEY AS RULE_KEY, R.DESCRIPTION AS RULE_DESCRIPTION,
   T.RULE_VERSION AS RULE_VERSION, JOINMANYROWSIN1(NR.NETWORK_ID) AS NETWORK_ID, T.THRESHOLD_ID,
   T.VERSION AS THRESHOLD_VERSION, T.VALUE AS THRESHOLD_VALUE, DECODE(INSTR(FC.CATEGORY,'NO_DURATION',1,1),0,T.DURATION,'') AS THRESHOLD_DURATION,
   T.CHANGED_STATUS AS THRESHOLD_CHANGED_STATUS, T.EXPIRY_DATE AS THRESHOLD_EXPIRY_DATE,
   T.MODIFIED_DATE AS THRESHOLD_MODIFIED_DATE, T.AGGREGATION_TYPE, T.AGGREGATION_VALUE, T.IS_ACTIVE AS IS_ACTIVE
      FROM RULES R, THRESHOLDS T, NETWORKS_RULES NR,FIELD_CATEGORIES FC
       WHERE R.KEY   = T.RULE_KEY 
             AND R.AGGREGATION_TYPE = FC.ID
             AND   R.VERSION  = T.RULE_VERSION
             AND   R.ID = NR.RULE_ID
             AND  (R.CATEGORY IS NULL OR R.CATEGORY IN ('SMART_PATTERN', 'MANUAL_ALARM_RULES'))
           GROUP BY T.ID, R.ID, R.KEY, R.DESCRIPTION, T.RULE_VERSION, T.THRESHOLD_ID, T.VERSION, T.VALUE,
             T.DURATION, T.CHANGED_STATUS, T.EXPIRY_DATE, T.MODIFIED_DATE, T.AGGREGATION_TYPE,
             T.AGGREGATION_VALUE, T.IS_ACTIVE,FC.CATEGORY
);


---------Translations for account groups ------------------
insert into translation_indices (id,description,is_dynamic) values (516,'Account Groups',1);
insert into translations values(translations_seq.nextval,516,'-176','select key as Key, key as Value from subscriber_groups where record_config_id=4');
update field_configs set translation_id = 516 where record_config_id=4 and field_id=20;

-------------Archived Alerts order by is chaged--------------
update record_view_configs set ORDER_BY = 'ID ASC' where RECORD_CONFIG_ID =20;

---------------- CEPM - Statistical Rule changes : Start ---------------------
alter table formula_expressions add (HIERARCHY_PATH_ID VARCHAR2(40)) ;
update record_configs set tname='PREVEA_PROFILE_FIELDS' where id = 84 ;
---------------- CEPM - Statistical Rule changes : End ---------------------

-----------Pulse validation with Non Zero Integer ------------------------
insert into regular_expressions(id, expression, description) values(32, '^[1-9]+[0-9]*$', 'Rating Pulse Validation' ) ;

-----------Enabling Filter Audit Log for Autu Threshold ---------------
update record_view_configs set is_logging_enabled=1 where id in (39,43) ;

--Audit Log For Assigning Subscriber Groups-----------
insert into audit_log_event_codes values (746, 'Subscriber Group appended for Selected Records', 'Group(s) ''$1'' are appended for $2(s) ''$3''' , NULL) ;
insert into audit_log_event_codes values (747, 'Subscriber Group overwritten for Selected Records', 'Group(s) ''$1'' are overwritten for $2(s) ''$3''' , NULL) ;
insert into audit_log_event_codes values (748, 'Subscriber Group appended for Filtered Records', 'Group(s) ''$1'' are appended for $2 (Filter Condition: ''$3'')' , NULL) ;
insert into audit_log_event_codes values (749, 'Subscriber Group overwritten for Filtered Records', 'Group(s) ''$1'' are overwritten for $2 (Filter Condition: ''$3'')' , NULL) ;

update audit_log_event_codes set action='Group(s) ''$1'' are appended for $2(s) ''$3''' where id=60;
update audit_log_event_codes set action='Group(s) ''$1'' are overwritten for $2(s) ''$3''' where id=61 ;
update audit_log_event_codes set action='Group(s) ''$1'' are appended for $2 (Filter Condition: ''$3'')' where id=703;
update audit_log_event_codes set action='Group(s) ''$1'' are overwritten for $2 (Filter Condition: ''$3'')' where id=704;


-----Changed action for Download option to show the filtered condition instead of query----------------
update audit_log_event_codes set action='Data Exported for $2, Applied Filters: $3' where id=660; 

------- Making Data Volume enties to display value in two decimal places --------------
update field_category_configs set VALUE='2' where FIELD_CATEGORY_ID in(49,50,51) ;

spool off;

-----Select all in customize view not getting selected for GPRS even every fields are selected at first time-------
update user_options set value =  replace(value,'14,') where option_id = '7.SelectedFields';

--for scheduling
ALTER TABLE SCHEDULER_PARAMETERS ADD (IS_MANDATORY    NUMBER(2) DEFAULT 1, TRANSLATION_ID   NUMBER(20)) ;

CREATE OR REPLACE VIEW RATE_V 
AS
( 
	SELECT R.ID AS RULE_ID, R.KEY AS RULE_KEY, AUR.AGGREGATION_TYPE, AUR.LOWER_RANGE, AUR.HIGHER_RANGE,
		AUR.TOLERANCE, AUR.ID, AUR.IS_CHECKED, JOINMANYROWSIN1(NR.NETWORK_ID) AS NETWORK_ID
			FROM AUTOTHRESHOLD_USAGE_RANGES AUR, RULES R, NETWORKS_RULES NR
			WHERE AUR.RULE_ID = R.ID
				AND R.ID = NR.RULE_ID
				AND R.IS_ACTIVE = 1 
				AND R.IS_ENABLED = 1 
				AND R.ACCUMULATION_FUNCTION IN (1, 2, 6)  
				AND EXISTS (SELECT FC.ID FROM REFERENCE_TYPES_MAPS RTM, REFERENCE_TYPES RT, FIELD_CATEGORIES FC
                             WHERE FC.ID = R.AGGREGATION_TYPE
                             AND RTM.AGGREGATION_TYPE = FC.ID
                             AND RTM.REFERENCE_TYPE = RT.ID
                             AND RT.RECORD_CONFIG_ID IS NOT NULL)
			GROUP BY R.ID, R.KEY, AUR.AGGREGATION_TYPE, AUR.LOWER_RANGE, AUR.HIGHER_RANGE, 
				 AUR.TOLERANCE, AUR.ID, AUR.IS_CHECKED
);
ALTER TABLE RANGER_USERS ADD (LAST_LOGGED_IN_TIME  VARCHAR2(30)) ;
CREATE TABLE RECORD_VIEW_CONFIGS_REPORTS
(
    RECORD_VIEW_CONFIG_ID   NUMBER(20)  NOT NULL,
    REPORT_ID               NUMBER(20)  NOT NULL
);

DROP TABLE TEMP_SUBS_THRESHOLDS ;

CREATE TABLE TEMP_SUBS_THRESHOLDS (
    REF_AGGREGATION_TYPE    NUMBER(20),
    REF_AGGREGATION_VALUE   VARCHAR2(40),
    AGGREGATION_VALUE       VARCHAR2(40),
    REFERENCE_ID            NUMBER(20),
    THRESHOLD_VERSION       NUMBER(20) DEFAULT 0,
    VALUE                   NUMBER(16,6),
    TIME_SLOT               NUMBER(20)
) ;

--For Charging ID
update field_categories set category='AGGREGATION_TYPE NICKNAME AUTO_THRESHOLD NO_DURATION' where id=54;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 4, '60.12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 4, '60.32') ;

delete from scheduler_command_maps where job_name='Threshold Calculator' ;
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Threshold Calculator For NFR', 'thresholdcalculatorfornfr.rb,thresholdcalculatorfornfrPID',0,0) ;
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Threshold Calculator For All', 'thresholdcalculatorforall.rb,thresholdcalculatorforallPID',1,1) ;
insert into scheduler_parameters (job_name, parameter, data_type, display_name,translation_id) values ('Threshold Calculator For All', 'AggregationField', 3, 'Monitor Field',115) ;
insert into scheduler_parameters (job_name, parameter, data_type, display_name,is_mandatory) values ('Threshold Calculator For All', 'Expression', 3, 'Additional Condition',0) ;

--For Archiving Report 
----Alarm Details report--

insert into reports (id,name,display_name,category,is_long_running) values (reports_seq.nextval,'AlarmDetails','Alarm Details Report','Record View',0) ;

insert into record_view_configs_reports(record_view_config_id,report_id) values(10, reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(16 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(17 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(18 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(26 ,reports_seq.currval) ;

insert into reports (id,name,display_name,category,is_long_running) values (reports_seq.nextval,'ArchivedAlarmDetails','Archived Alarm Details Report','Record View',0) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(19, reports_seq.currval) ;
 
--Action for add phone number to hotlist
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible, is_reload_signal_required) values (37, 'Add Phone Number to Hot List','ALARM_CLOSER_ACTION', 'add_phone_number_to_hotlist','',1, 1,0) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(41, 2, 37, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(40, 2, 37, 3) ;
update analyst_actions set category='ALARM_CLOSER_ACTION' where id=29 ;

update regular_expressions set expression='^[A-Za-z0-9][A-Za-z0-9_\-]*$' , description='Hostame Validation' where id=30 ;

---Changes for getting the translated values of networks in Hotlist Groups View Applied Filters-------------
CREATE OR REPLACE VIEW HOTLIST_GROUPS_V
AS
(
	select HG.ID ID,HG.NAME NAME, HG.DESCRIPTION DESCRIPTION, HG.IS_PER_KEY IS_PER_KEY, HG.IS_ACTIVE IS_ACTIVE, HGN.VALUE
	NETWORKS from HOTLIST_GROUPS HG, HOTLIST_GRP_NETWRK_V HGN where HGN.KEY=HG.ID
);

CREATE OR REPLACE VIEW HOTLIST_GRP_NETWRK_V
AS
(
	select HOTLIST_GROUP_ID KEY,JOINMANYROWSIN1(ID) VALUE from HOTLIST_GROUPS_NETWORKS,NETWORKS where NETWORK_ID=ID GROUP BY
	HOTLIST_GROUP_ID
);

update record_configs set tname='HOTLIST_GROUPS_V' where id=14 ;
update field_configs set translation_id=10, database_field='NETWORKS' where record_config_id=14 and field_id=3 ;
update field_configs set database_field='ID' where record_config_id=14 and field_id=4 ;
update basic_filter_configs set field_id=3 where record_config_id=14 and field_id=4 ;  



CREATE OR REPLACE VIEW FP_ELEMENTS_V AS
(
	SELECT
            FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID, FC.NAME AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, T.DURATION / 86400 AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
    	FROM
            FP_ELEMENTS FE, FIELD_CONFIGS FC, RULES R, THRESHOLDS T
    	WHERE
            FE.FIELD_ID = FC.FIELD_ID AND FE.RECORD_CONFIG_ID = FC.RECORD_CONFIG_ID AND FE.FIELD_ID IS NOT NULL AND FE.IS_ACTIVE = 1
	    AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE =1 AND T.RULE_KEY = R.KEY AND T.RULE_VERSION = R.VERSION 
		AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
    UNION ALL
	SELECT
            FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID,  ' ' AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, T.DURATION / 86400 AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
    FROM
            FP_ELEMENTS FE, RULES R, THRESHOLDS T
    WHERE
	    FE.FIELD_ID IS NULL AND FE.IS_ACTIVE = 1
	    AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE = 1 AND T.RULE_KEY = R.KEY  AND T.RULE_VERSION = R.VERSION
		AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
);


update FIELD_CONFIGS set name='Closure Type' where record_config_id=23 and database_field='DISPLAY_VALUE' ; 

--**************** translations for FRD & NFR Fraud Types
insert into translation_indices(id, description,is_dynamic) values (119, 'FRD and NFR Fraud Types',1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 119, '-176', 'select name as Key, name as Value from fraud_types where is_active = 1 and fraud_type in (2,4)') ;

update field_configs set translation_id=119 where database_field='DISPLAY_VALUE' and record_config_id in (10,16,23) ;
update basic_filter_configs set record_config_id=23, field_id=17, translation_id=119 where record_view_config_id=17 and field_id=23;
update basic_filter_configs set record_config_id=16, field_id=25, translation_id=119 where record_view_config_id=19 and field_id=22;


-- Brought in Status column in FP elements record view & Added coloring rule for the same.
update field_configs set field_id=10 where record_config_id=45 and database_field='FUNCTION';
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Status', 'STATUS', 6, 1, 3, 8, 1, 41, 10) ; 
insert into record_configs_rules (select id, 45, 0 from rules where category='COLORING_RULES' and name like '%Rule Status Equal Disabled%');


CREATE OR REPLACE VIEW STATRULES_V 
AS
(
	SELECT PF.ID, PF.NAME, PF.DESCRIPTION, PF.ENTITY_ID, PF.RECORD_CONFIG_ID, PF.TIME_WINDOW, PF.RULE_KEY,
		R.PSEUDO_FUNCTION_ID AS FUNCTION, R.VERSION, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
	FROM PROFILE_FIELDS PF, RULES R
	WHERE PF.RULE_KEY = R.KEY AND R.IS_ACTIVE = 1
);

update field_configs set field_id=9 where record_config_id=79 and database_field='FUNCTION';
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 79, 'Status', 'STATUS', 6, 1, 3, 8, 1, 41, 10) ; 
insert into record_configs_rules (select id, 79, 0 from rules where category='COLORING_RULES' and name like '%Rule Status Equal Disabled%');


-------------pending time in basic filter for My Alarms and My Team Alarms---------
update basic_filter_configs set position =position + 1 where record_view_config_id=96 and position > 5 ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (BASIC_FILTER_SEQ.nextval, 21, 96, 26, 10, 6, 0, 01-01-1970, 31-12-9999, null) ;

update basic_filter_configs set position =position + 1 where record_view_config_id=116 and position > 5 ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (BASIC_FILTER_SEQ.nextval, 21, 116, 26,  10, 6, 0, 01-01-1970, 31-12-9999, null) ;

@ ../alarm_closure_actions.sql ;
@ ../utility_package.sql ;
@ ../archiver_package.sql ;
@ ../cleanup_package.sql ;

create or replace view alarm_rule_user_maps_v as
(
	select r.id as id, r.name as rule_name, RU.NAME as user_id, arm.owner_type as owner_type, arm.workflow_id as workflow_id, rp.priority as priority, joinmanyrowsin1(nr.network_id) as networks, DECODE(r.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS status
	from rules r, alarm_rule_user_maps arm,rule_priority_maps rp,networks_rules nr, ranger_users ru
	where r.id = arm.rule_id 
	and r.is_active = 1
	and r.id = rp.rule_id
	and nr.rule_id = r.id
	and arm.user_id = ru.id
	and arm.owner_type = 0
	group by rp.priority, r.id, r.name, arm.workflow_id, ru.name, arm.owner_type, r.IS_ENABLED 
UNION ALL	
	select r.id as id, r.name as rule_name, t.NAME as user_id, arm.owner_type as owner_type, arm.workflow_id as workflow_id, rp.priority as priority, joinmanyrowsin1(nr.network_id) as networks, DECODE(r.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS status
	from rules r, alarm_rule_user_maps arm,rule_priority_maps rp,networks_rules nr, teams t
	where r.id = arm.rule_id 
	and r.is_active = 1
	and r.id = rp.rule_id
	and nr.rule_id = r.id
	and arm.user_id = t.id
	and arm.owner_type = 1
	group by rp.priority, r.id, r.name, arm.workflow_id, t.name, arm.owner_type, r.IS_ENABLED 
) ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 78, 'Status', 'STATUS', 7, 1, 3, 8, 1, 41, 10) ; 
insert into record_configs_rules (select id, 78, 0 from rules where category='COLORING_RULES' and name like '%Rule Status Equal Disabled%');

alter table REMINDER_RULE_USER_NOTIF add ( IS_ENABLED NUMBER(20) DEFAULT 1 ) ;

------------Changed Module Name to Job Name in the case of schedulers----
update field_configs set NAME = 'Job Name' where record_config_id = 47 and field_id = 2;


----------- Report changes : To add network_id column  in subscriber_group_summary table ---
----------- Add My alarm & My Team alarm reports to record_view_configs_reports ---

ALTER TABLE subscriber_groups_summary ADD ( network_id NUMBER(20)) ;
INSERT INTO record_view_configs_reports(record_view_config_id,report_id) VALUES(96 ,reports_seq.currval) ;
INSERT INTO record_view_configs_reports(record_view_config_id,report_id) VALUES(116 ,reports_seq.currval) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5000, 4, '37') ;

---- Adding extra column for client to display both normal and summarized records
ALTER TABLE ALERTS ADD SUMMARIZATION_TYPE  NUMBER(3) ;
UPDATE ALERTS set SUMMARIZATION_TYPE = 0;
UPDATE ALERTS set SUMMARIZATION_TYPE = 1 where ID in (select ALERT_ID from OBSERVATION_SUMMARY_RECORDS);
ALTER TABLE ALERTS MODIFY SUMMARIZATION_TYPE NUMBER(3) NOT NULL ;

ALTER TABLE ARCHIVED_ALERTS ADD SUMMARIZATION_TYPE  NUMBER(3) ;
UPDATE ARCHIVED_ALERTS set SUMMARIZATION_TYPE = 0;
UPDATE ARCHIVED_ALERTS set SUMMARIZATION_TYPE = 1 where ID in (select ALERT_ID from OBSERVATION_SUMMARY_RECORDS);
ALTER TABLE ARCHIVED_ALERTS MODIFY SUMMARIZATION_TYPE NUMBER(3) NOT NULL ;

update rule_action_parameters set parameter_3=203 where rule_id = (select id from rules where name='Copy Previous Account Group') ;

----- Removing Subscriber-ActiveAccount from expandables in Statistical Rules--------------
update expandable_field_maps set category='RECORD_VIEW' where id=58 ;

---------------Bringing advanced filter options in archived alarm --
update field_configs set is_filter = 1 where record_config_id = 16 and field_id in (4,5,6,7,8,10,11,12,14,15,17,18,20);
@NOTSTANDALONE@ update field_configs set is_filter = 1 where record_config_id = 16 and field_id = 1;

--Removing configuration entry as copy alarm cdr script no longer used
delete from configurations where config_key = 'MAX_WAIT_TIME_FOR_COPY_ALARM_CDRS' ;

---------Filter entity was changed to Nikira from Ranger--
update record_configs set description = 'Nikira Users' where id =  40;
update record_configs set description = 'Nikira Groups' where id = 41;
update record_configs set description = 'Nikira Users Online' where id = 49;

-- Subscriber Precheck view - Expandable Fields map changes
update expandable_field_maps set name='Subscriber-Account Precheck list' where id=199 ;

---Adding Alarm Flooding Script in Scheduler List---------
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Alarm Flooding Summary Script', 'alarms_flooding_details.rb,AlarmFloodingDetailsPID',0,1) ;

CREATE OR REPLACE VIEW ALARM_RULE_NOTIFICATION_MAPS_V AS
(
	SELECT R.ID AS ID, R.NAME AS RULE_NAME, R.CATEGORY AS CATEGORY, R.DESCRIPTION AS DESCRIPTION, RNM.NOTIFICATION_PACK_ID AS PACK_NAME,RNM.RULE_GROUP AS RULE_GROUP, JOINMANYROWSIN1(NR.NETWORK_ID) AS NETWORKS, DECODE(r.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS status
	FROM RULES R, RULE_NOTIFICATION_MAPS RNM,NETWORKS_RULES NR
	WHERE R.ID = RNM.RULE_ID 
	AND R.IS_ACTIVE = 1
	AND NR.RULE_ID = R.ID
	AND R.CATEGORY in ('ALARM_ESCALATION_RULE','ALARM_NOTIFICATION_RULE')
	GROUP BY R.ID, R.NAME,R.CATEGORY,RNM.NOTIFICATION_PACK_ID,RNM.RULE_GROUP,R.DESCRIPTION,R.IS_ENABLED
) ;


insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 80, 'Status', 'STATUS', 8, 1, 3, 8, 1, 41, 10) ; 
insert into record_configs_rules (select id, 80, 0 from rules where category='COLORING_RULES' and name like '%Rule Status Equal Disabled%');

---Corrected Regular Expression for aplhabets-----
update regular_expressions set expression='[a-zA-Z]+' where id=29 ;

--Clear rule history and Move to profile match list for reference type=3 and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 36, 3) ;

----Default Profied fields for statistical rule Expression----------
update field_configs set ds_category=ds_category||'ENTITY_DATA' where record_config_id=3 and field_id=33;
update field_configs set ds_category=ds_category||'ENTITY_DATA' where record_config_id=4 and field_id in (29,12);
update field_configs set ds_category=ds_category||'ENTITY_DATA' where record_config_id=5 and field_id=3;
update field_configs set ds_category=ds_category||'ENTITY_DATA' where record_config_id=6 and field_id=3;

----Remove fax/print option from notification types---------
delete from notification_types where id in (3,4) ;

-- Added 'Clear Rule History' alarm closure action for 'IMEI' & 'CELLSITE'
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 4) ;

----Updating Float Reg Exp to accept values like .9 etc ------------
update regular_expressions set expression='^[0-9]+$|^[0-9]+(\.[0-9]+)$|(\.[0-9]+)$' where id=12 ;


-- File Upload Log path
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'FILE_UPLOAD_LOG_PATH', '@prefix@/LOG/FileUploadLogs');

-- Entry added to handle percall function for internal user
@INTERNAL_USER@insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval, 2, 71, 6, 1) ;
@INTERNAL_USER@insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval, 2, 72, 6, 1) ;


-------Configuration Entry for to show headers in exports ----
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'SHOW_HEADER_IN_ALL_EXPORTS', '1') ;


-------------------- Configuration entry for field length validattion
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'FIELD_LENGTH_VALIDATION','0') ;



---------- field config change for error tolerance
update field_configs set width =2 where id = 160 ;  
update field_configs set width =20 where record_config_id = 3 and database_field='FIRST_CALL' ;  
update field_configs set width =20 where id in (138,157,159,161,167,198,206,168,169,171,212) ;  
update field_configs set width =40 where id in (136,153,154,196,199,200,201,205) ;  
update field_configs set width =256 where id in (202,203,204,215, 158) ;  
update field_configs set width =38 where id= 213;  
update field_configs set width =512 where id= 216;  


update field_configs set width =80 where id in (3,4,5,22,30);  
update field_configs set width =20 where id in (18,20);  
update field_configs set width =64 where id in (319);  
update field_configs set width =32 where id in (89,26,305,316,317,322,323);  

-- Entries for record type for field length validations
CREATE TABLE LENGTH_VALIDATION_REC_TYPES
(
RECORD_TYPE             NUMBER(10),
TABLE_NAME              VARCHAR2(50)
);

insert into LENGTH_VALIDATION_REC_TYPES values(1,'CDR') ;
insert into LENGTH_VALIDATION_REC_TYPES values(2,'RECHARGE_LOG') ;
insert into LENGTH_VALIDATION_REC_TYPES values(3,'SUBSCRIBER') ;
insert into LENGTH_VALIDATION_REC_TYPES values(4,'ACCOUNT') ;
insert into LENGTH_VALIDATION_REC_TYPES values(7,'GPRS_CDR') ;


@STANDALONE@update SCHEDULER_COMMAND_MAPS set is_network_based=0 where is_network_based=1 ;

--To make suspicious recharge and odd value top up for recharge log to use percall counter  
update counter_maps set COUNTER_TYPE=6 where RECORD_CONFIG_ID=2 and FUNCTION_ID in(12,13) ;


-- Changing data type of columns in SUSPECT_VALUES table - START --

update suspect_values set created_by=2 where created_by='nikira' ;
update suspect_values set modified_by=2 where modified_by='nikira' ;

ALTER TABLE suspect_values ADD created_by_bk NUMBER(20) ;
ALTER TABLE suspect_values ADD modified_by_bk NUMBER(20) ;

update suspect_values set created_by_bk=created_by ;
update suspect_values set modified_by_bk=modified_by ;

ALTER TABLE suspect_values drop column created_by ;
ALTER TABLE suspect_values drop column modified_by ;

ALTER TABLE suspect_values RENAME COLUMN created_by_bk TO created_by ; 
ALTER TABLE suspect_values RENAME COLUMN modified_by_bk TO modified_by ; 

-- Changing data type of columns in SUSPECT_VALUES table - END --

@ ../alarm_closure_actions.sql ;


CREATE OR REPLACE VIEW HOTLIST_PER_KEY_NETWORK_V
AS
(
    SELECT HPK.ID AS ID,HPK.KEY_CATEGORY AS KEY_CATEGORY,HPK.VALUE AS VALUE,SV.ENTITY_TYPE AS ENTITY_TYPE,
    JOINMANYROWSIN1UNIQ(HGN.NETWORK_ID) AS NETWORK, SV.USER_ID AS USER_ID, HPK.CREATED_DATE, HPK.CREATED_BY,HPK.MODIFIED_DATE, HPK.MODIFIED_BY
    FROM HOTLIST_PER_KEY HPK,SUSPECT_VALUES SV,HOTLIST_GROUPS_SUSPECT_VALUES HGSV,HOTLIST_GROUPS_NETWORKS HGN
    WHERE HPK.ID = SV.HOTLIST_KEY_ID AND SV.ID = HGSV.SUSPECT_VALUE_ID AND HGSV.HOTLIST_GROUP_ID = HGN.HOTLIST_GROUP_ID
    GROUP BY (HPK.ID, HPK.KEY_CATEGORY, HPK.VALUE, SV.USER_ID,SV.ENTITY_TYPE, HPK.CREATED_DATE,HPK.CREATED_BY,HPK.MODIFIED_DATE, HPK.MODIFIED_BY)
);



CREATE OR REPLACE VIEW SUSP_VAL_HOTLIST_GRP_NETWRK_V
AS
(
		SELECT DISTINCT HGSV.SUSPECT_VALUE_ID AS ID, SV.VALUE AS VALUE, SV.HOTLIST_KEY_ID, SV.ENTITY_TYPE AS ENTITY_TYPE, SV.SOURCE AS SOURCE,  SV.REASON AS REASON,
				SV.USER_ID AS USER_ID, SV.EXPIRY_DATE AS EXPIRY_DATE, 
				JOINMANYROWSIN1UNIQ(HG.NAME) AS GROUPS,
				JOINMANYROWSIN1UNIQ(HGN.NETWORK_ID) AS NETWORK_ID ,
				SV.CREATED_DATE, SV.CREATED_BY, SV.MODIFIED_DATE, SV.MODIFIED_BY 
		FROM HOTLIST_GROUPS_SUSPECT_VALUES HGSV, HOTLIST_GROUPS_NETWORKS HGN, SUSPECT_VALUES SV, HOTLIST_GROUPS HG
		WHERE HGSV.HOTLIST_GROUP_ID = HGN.HOTLIST_GROUP_ID 
			  AND HGSV.SUSPECT_VALUE_ID = SV.ID 
			  AND HG.ID = HGN.HOTLIST_GROUP_ID
			  AND HG.IS_ACTIVE = 1
		GROUP BY (HGSV.SUSPECT_VALUE_ID, SV.VALUE, SV.HOTLIST_KEY_ID, SV.ENTITY_TYPE, SV.SOURCE, SV.REASON, SV.USER_ID,SV.EXPIRY_DATE, SV.CREATED_DATE, SV.CREATED_BY, SV.MODIFIED_DATE, SV.MODIFIED_BY) 
);


-- Entry for Maximum char length of Subscriber Groups 
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'SUBSCRIBER_GROUP_MAX_LENGTH','30') ;

commit;
quit;
/
