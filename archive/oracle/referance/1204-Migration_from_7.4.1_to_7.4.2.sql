
set serveroutput on ;
spool Migration_after_7.4.2.log ;

---  Change the following values accordingly
-- DBWRITER_CONFIGURATIONS  ENABLE_RECORD_LOADER 
-- DBWRITER_CONFIGURATIONS  MAX_LOADER_THREADS       
-- COUNTER_DETAILS  NO_OF_THREADS_FOR_CLEANUP               
-- COUNTER_DETAILS  SUM_GRANULARITY                        
-- COUNTER_DETAILS  SUM_ROW_COUNT_THRESHOLD                 
---  Majore tables altered are thresholds , counter_details and smart pattern tables.
--- Reschedule the following jobs ( Smart patttern related cleanup scripts  )

create table thresholds_Mig742 as select * from thresholds ;
commit ;

--- nikira-DDL-db-demo.sql.parse.in 

alter table ARCHIVED_ALARMS modify ( USER_ID  VARCHAR2(64) ) ;
alter table ARCHIVED_ALARMS add ( DECLARED_FRAUD_VALUE    NUMBER(20, 6) ) ;
update ARCHIVED_ALARMS set DECLARED_FRAUD_VALUE = value where status = 2 ;
update ARCHIVED_ALARMS set DECLARED_FRAUD_VALUE = 0 where status = 2 ;


--- nikira-DDL-precheck.sql.in
alter table MANUAL_PRECHECK_SEARCHES modify ( USER_ID  VARCHAR2(64) ) ;
alter table MANUAL_PRECHECK_SEARCHES ADD ( PID            NUMBER(20) ) ;

--- nikira-DML-rtf-exec.sql.parse.in

delete from translations where tr_id = 201 ;
insert into translations(id, tr_id, key,value) values(translations_seq.nextval, 201, -176, 'select key as key, name || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as value from rules r where version=(select max(version) from rules where r.key=key) and (rule_mode in (2,3) or (rule_mode=0 and category is null)) and parent_id != 0 and id > 1024') ;

insert into user_options (id, option_id, user_id, value, role_id, is_read_only, is_enabled) values (user_options_seq.nextval,'128.chosenFieldSortOrder','nadmin','1',1,0,1);
insert into user_options (id, option_id, user_id, value, role_id, is_read_only, is_enabled) values (user_options_seq.nextval,'128.chosenFieldSortOrder','nadmin','1',2,0,1);

--** Change the IP address according to site.

 delete configurations where config_key = 'RTF.OFFLINE.TEST_RUN_PROCESSOR_URL';
 delete configurations where config_key = 'RTF.OFFLINE.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS';
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.OFFLINE.TEST_RUN_PROCESSOR_URL','TCP://[127.0.0.1]:22000') ;
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.OFFLINE.TEST_RUN_PROCESSOR_URL','TCP://[::1]:22000') ;
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.OFFLINE.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS','-w TCP://[127.0.0.1]:20000 -c "20:TCP://[127.0.0.1]:50020 22:TCP://[127.0.0.1]:50022" -s TCP://[127.0.0.1]:20003 -R TCP://[127.0.0.1]:21000 -l TCP://[127.0.0.1]:91090 -F 2 -C 4 -k NO -P') ;
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.OFFLINE.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS','-w TCP://[::1]:20000 -c "20:TCP://[::1]:50020 22:TCP://[::1]:50022" -s TCP://[::1]:20003 -R TCP://[::1]:21000 -l TCP://[::1]:91090 -F 2 -C 4 -k NO -P') ;

 delete configurations where config_key = 'RTF.ONDEMAND.TEST_RUN_PROCESSOR_URL';
 delete configurations where config_key =  'RTF.ONDEMAND.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS' ;
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.ONDEMAND.TEST_RUN_PROCESSOR_URL','TCP://[127.0.0.1]:22001') ;
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.ONDEMAND.TEST_RUN_PROCESSOR_URL','TCP://[::1]:22001') ;
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.ONDEMAND.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS','-w TCP://[127.0.0.1]:20000 -c "20:TCP://[127.0.0.1]:50020 22:TCP://[127.0.0.1]:50022" -s TCP://[127.0.0.1]:20003 -R TCP://[127.0.0.1]:21000 -l TCP://[127.0.0.1]:91091 -F 2 -C 4 -k NO -P') ;
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval,'RTF.ONDEMAND.TEST_RUN_PROCESSOR_ADDITIONAL_PARAMS','-w TCP://[::1]:20000 -c "20:TCP://[::1]:50020 22:TCP://[::1]:50022" -s TCP://[::1]:20003 -R TCP://[::1]:21000 -l TCP://[::1]:91091 -F 2 -C 4 -k NO -P') ;


--- nikira-DML-functions.sql

-- ==Multiple Function
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(32, 'Multiple Function', '', 1) ;

-- ==Per Session Function
insert into functions values (33, 'Per Session', '49,50,51', 1);

-- ==Functions

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (50, 'Multiple Function', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 32, 0) ;

-- ==Per Session Function Pseudo Functions
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (51, 'Per Session Download Data Volumne', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 33, 49) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (52, 'Per Session Upload Data Volumne', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 33, 50) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (53, 'Per Session Data Volumne', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 33, 51) ;

--- nikira-DML-gprs.sql.parse.in

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 7 from pseudo_functions where id = 50)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (51, 7) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (52, 7) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (53, 7) ;

--- nikira-DML-field-categories-isp.sql

@ISP@update field_categories set category= 'ACCUMULATION_FIELD AGGREGATION_TYPE NEGATIVE_RULE_AGG_TYPE NICKNAME HOTLIST MANUAL_ALARM PROFILE_SPECIFIC ONDEMAND_OFFLINE_TEST STATS_RULE_AGG_TYPE' ,  regular_expression_id = 8 , data_type = 3 where id = 225 and name = 'User Name' ;

--- nikira-DML-record-config-demo.sql

--** Remove these if the Static Rule lookback is not needed. Updated for all the aggregations. Selectively remove it if not needed for site specific aggregation
update aggregation_types set DURATION_TYPE_IDS = DURATION_TYPE_IDS || ',-5' ;

--- nikira-DDL-db-file3.sql.parse.in

ALTER table FMS_LOG modify ( USER_ID 	VARCHAR2(64) ) ;
ALTER TABLE TABLE_NAMES ADD (RELOAD_CODE        NUMBER(10)) ;


--- nikira-DML-aggregation-isp.sql

--** ISP is enabled 
@ISP@insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 50 ) ;
@ISP@insert into pseudo_functns_record_configs values(50, 83);



--- nikira-DML-statistical-counter-entries.sql.parse.in


--- nikira-DML-nrtrde.sql

update basic_filter_configs set operator_id = 8 where record_config_id = 42 and record_view_config_id = 49 and field_id = 5 ; 


--- drop-nikira-DDL-db-file7.sql.in
DROP TABLE RSAGE_TEMP_GROUPS_COUNT ;
DROP SEQUENCE QUERY_JOBS_ADDITIONALS_SEQ ;
DROP TABLE QUERY_JOBS_ADDITIONALS CASCADE CONSTRAINTS ;

---nikira-DDL-db-file1.sql.parse.in
ALTER TABLE RANGER_USERS MODIFY (NAME VARCHAR(64));
ALTER TABLE PASSWORDS MODIFY (RANGER_USER_NAME   VARCHAR(64)) ;
ALTER TABLE RULES	MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE AUDIT_TRAILS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE ALARMS	 MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE ALARM_COMMENTS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE IGNORED_ENTITIES MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE ARCHIVED_ALARM_COMMENTS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE USER_OPTIONS            MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE CASES MODIFY     (OWNER_ID        VARCHAR2(64));
ALTER TABLE CASES MODIFY    (CREATOR_ID      VARCHAR2(64));

--** Migration for Auto Threshold yet to be handled

CREATE SEQUENCE AUTO_THRESHOLDS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 3500 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE AUTO_THRESHOLDS (
       ID                                      NUMBER(20)              NOT NULL,
    THRESHOLD_ID        NUMBER(20)      NOT NULL,
    REFERENCE_ID        NUMBER(20),
    AGGREGATION_VALUE   VARCHAR2(40),
    VALUE               NUMBER(16,6)    NOT NULL,
    THRESHOLD_VERSION   NUMBER(20)      NOT NULL,
       EXPIRY_DATE             DATE,
       MODIFIED_DATE           DATE,
       IS_ACTIVE                       NUMBER(20,0)    DEFAULT 1 NOT NULL,
       CHANGED_STATUS          NUMBER(3)       DEFAULT 0 NOT NULL,
       CONSTRAINT PK_AUTO_THRS_ID PRIMARY KEY (ID)
       ) ;
CREATE INDEX IX_AUTO_THRESHOLDS_AGG_VAL ON AUTO_THRESHOLDS(AGGREGATION_VALUE, REFERENCE_ID, THRESHOLD_ID) ;

alter table AUTO_THRESHOLDS add ( rule_key      number(20) ) ;
alter table AUTO_THRESHOLDS add ( rule_version      number(20) ) ;


insert /*+append nologging*/ into AUTO_THRESHOLDS ( id , THRESHOLD_ID , REFERENCE_ID , AGGREGATION_VALUE , value , THRESHOLD_VERSION , EXPIRY_DATE , MODIFIED_DATE , IS_ACTIVE , CHANGED_STATUS, RULE_KEY, rule_version ) select  AUTO_THRESHOLDS_SEQ.nextval , ID , REFERENCE_ID , AGGREGATION_VALUE , VALUE , VERSION , EXPIRY_DATE , MODIFIED_DATE , IS_ACTIVE ,  CHANGED_STATUS , RULE_KEY, rule_version  from thresholds where AGGREGATION_VALUE is not null and  IS_ACTIVE = 1 ;
commit ;
update AUTO_THRESHOLDS tat set THRESHOLD_ID = ( select id from thresholds t where t.rule_version = tat.rule_version and t.rule_key = tat.rule_key and t.aggregation_value is null and is_active = 1) where exists ( select id from thresholds t where  t.rule_version = tat.rule_version and t.rule_key = tat.rule_key and   t.aggregation_value is null and is_active = 1 ) ;
commit ;

alter table AUTO_THRESHOLDS drop column rule_key ;
alter table AUTO_THRESHOLDS drop column rule_version ;

CREATE SEQUENCE ARCHIVED_THRESHOLDS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 3500 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE ARCHIVED_THRESHOLDS (
       ID                                      NUMBER(20)              NOT NULL,
    THRESHOLD_ID        NUMBER(20)      NOT NULL,
    REFERENCE_ID        NUMBER(20),
    AGGREGATION_VALUE   VARCHAR2(40),
    VALUE               NUMBER(16,6)    NOT NULL,
    THRESHOLD_VERSION   NUMBER(20)      NOT NULL,
       EXPIRY_DATE             DATE,
       MODIFIED_DATE           DATE,
       IS_ACTIVE                       NUMBER(20,0)    DEFAULT 1 NOT NULL,
       CHANGED_STATUS          NUMBER(3)               DEFAULT 0 NOT NULL,
       DAY_OF_YEAR             NUMBER(3)               GENERATED ALWAYS AS (to_char(MODIFIED_DATE,'DDD')),
       CONSTRAINT PK_AR_THRS_ID PRIMARY KEY (ID)
       ) ;
CREATE INDEX IX_ARCHIVED_THRESHOLDS_AGG_VAL ON ARCHIVED_THRESHOLDS(AGGREGATION_VALUE, REFERENCE_ID, THRESHOLD_ID) ;

alter table ARCHIVED_THRESHOLDS add ( rule_key  number(20) ) ;
alter table ARCHIVED_THRESHOLDS add ( rule_version  number(20) ) ;

insert /*+append nologging*/ into ARCHIVED_THRESHOLDS ( id , THRESHOLD_ID , REFERENCE_ID , AGGREGATION_VALUE , value , THRESHOLD_VERSION , EXPIRY_DATE , MODIFIED_DATE , IS_ACTIVE , CHANGED_STATUS ,rule_key, rule_version   ) select  ARCHIVED_THRESHOLDS_SEQ.nextval , id , REFERENCE_ID , AGGREGATION_VALUE , VALUE , VERSION , EXPIRY_DATE , MODIFIED_DATE , IS_ACTIVE ,  CHANGED_STATUS, rule_key, rule_version    from thresholds where AGGREGATION_VALUE is not null and  IS_ACTIVE = 0 ;
commit ;
update ARCHIVED_THRESHOLDS tat set THRESHOLD_ID = ( select id from thresholds t where t.rule_version = tat.rule_version and t.rule_key = tat.rule_key and t.aggregation_value is null ) where exists ( select id from thresholds t where t.rule_version = tat.rule_version and t.rule_key = tat.rule_key and t.aggregation_value is null )  ;
commit ;

alter table ARCHIVED_THRESHOLDS drop column rule_key ;
alter table ARCHIVED_THRESHOLDS drop column rule_version;

delete  from thresholds where AGGREGATION_VALUE is not null and REFERENCE_ID is not null  and aggregation_type  is not null ;

alter table analyst_actions add (CONTROLLER_NAME         VARCHAR2(40));


--** Change the value according to site load

ALTER TABLE DBWRITER_CONFIGURATIONS ADD ( ENABLE_RECORD_LOADER                            NUMBER(2) DEFAULT 0 ) ;
ALTER TABLE DBWRITER_CONFIGURATIONS ADD ( MAX_LOADER_THREADS                                      NUMBER(5) DEFAULT 1 ) ;

CREATE SEQUENCE DBWRITER_LOADER_METADATA_SEQ START WITH 100 NOMAXVALUE ;
CREATE TABLE DBWRITER_LOADER_METADATA
(
       ID                                              NUMBER(20) NOT NULL,
       RECORD_TYPE                             NUMBER  NOT NULL,
       LOADER_KEY                              VARCHAR2(50) NOT NULL,
       LOADER_TYPE                             VARCHAR2(50) ,
       HAS_MORE_FILES                  NUMBER(10),
       OFFLINE_LOAD_STATUS             NUMBER NOT NULL,
       PARTITION_KEY                   NUMBER(10) DEFAULT 0,
       SUB_PARTITION_KEY               NUMBER(10) DEFAULT 0,
       TOTAL_COUNT                             NUMBER(20) NOT NULL,
       PARTITION_DATE                  DATE DEFAULT SYSDATE,
       ONLINE_LOAD_STATUS              NUMBER(5)
) ;
CREATE INDEX IX_DB_LOADER_METADATA_ID ON DBWRITER_LOADER_METADATA(ID) ;

CREATE SEQUENCE DATA_LOADER_FILE_NAMES_SEQ START WITH 1 CYCLE MAXVALUE 99999999 ;
CREATE TABLE DATA_LOADER_FILE_NAMES
(
 ID                                    NUMBER(20) NOT NULL,
 FILE_NAME                             VARCHAR2(256) NOT NULL,
 DAY_OF_YEAR                   NUMBER(5) NOT NULL,
 NO_OF_RECORDS                         NUMBER(20) NOT NULL,
 RECORD_TYPE                   NUMBER,
 LOADER_META_DATA_ID   NUMBER DEFAULT 0,
 TIME_STAMP                    DATE,
 SUBPARTITION_KEY              NUMBER DEFAULT 0
) ;
CREATE INDEX IX_DATA_LOAD_FILE_NAME_ID ON DATA_LOADER_FILE_NAMES(ID) ;
CREATE INDEX IX_DATA_FILE_NAME_META_ID ON DATA_LOADER_FILE_NAMES(LOADER_META_DATA_ID) ;

ALTER TABLE PASSWORD_CONFIGURATIONS add ( REUSE_PASSWORD_COUNT                    NUMBER(20, 0)    DEFAULT 0 NOT NULL ) ;
ALTER TABLE RANGER_USERS ADD (LOGIN_EXPIRY            DATE ) ;
ALTER TABLE ALARMS ADD ( DECLARED_FRAUD_VALUE    NUMBER(20, 6) ) ;
update ALARMS set DECLARED_FRAUD_VALUE = value where status = 2 ;
update ALARMS set DECLARED_FRAUD_VALUE = 0 where status = 4 ;


CREATE TABLE COUNTER_CLEANUP_DETAILS
(
    COUNTER_ID NUMBER(20) NOT NULL,
    THREAD_ID  NUMBER(20) NOT NULL,
    CONSTRAINT PK_CO_ID_TH_ID PRIMARY KEY(COUNTER_ID,THREAD_ID)
);

ALTER TABLE SCHEDULER_COMMAND_MAPS ADD  ( IS_MANDATORY                   NUMBER(1) ) ;

update SCHEDULER_COMMAND_MAPS set is_mandatory = 1 where job_name in 
(
'Alarm Cleanup',
'Archive Alarms',
'Archived Alarm Cleanup',
'Record Cleanup',
'Audit Log Cleanup',
'Smart Pattern Cleanup',
'Alarm Closure Action For Bulk Subscriber',
'Hotlist Cleanup',
'Revoke Pending Cases',
'Revoke Pending Alarms',
'Disconnected Subscribers Cleanup',
'Subscriber Auto Grouping',
'Account Auto Grouping',
'Run Summary',
'Update ASN For All ASN Numbers',
'Threshold Calculator',
'Subscriber Group Summary',
'High Risk Destination Summary',
'Counter Cleanup',
'Counter Cleanup - Multi Field',
'System Usage',
'Script Logs Cleanup',
'Alarm Flooding Summary Script',
'InMemory CallCollision/Velocity Data Cleanup',
'User Login Expiry Notification',
'In Memory Data Cleanup',
'Archived Threshold Cleanup',
'Cumulative Record Generator',
'eFingerprint Profile Generation For Subscriber',
'Bitmap Index Rebuild',
'Bitmap Index Cleanup',
'Auto Threshold Data Cleanup',
'eFingerprint Profile Generation For Internal User',
'RTF Entity Summary',
'RTF Run Cleaner',
'Disable Online Test Rules',
'Archive RTF Data'
); 

--** Chenge to appropriate values based on the site ( per counter )

ALTER TABLE COUNTER_DETAILS ADD (       NO_OF_THREADS_FOR_CLEANUP               NUMBER(20) DEFAULT 2 NOT NULL ) ;
ALTER TABLE COUNTER_DETAILS ADD (       SUM_GRANULARITY                         NUMBER(20) DEFAULT 1800 NOT NULL) ;
ALTER TABLE COUNTER_DETAILS ADD (       SUM_ROW_COUNT_THRESHOLD                 NUMBER(20) DEFAULT 2 NOT NULL) ;

update COUNTER_DETAILS set SUM_GRANULARITY = ( select to_number(value) from configurations where config_key = 'DEFAULT_SUMMARIZATION_GRANULARITY' ) ;
update COUNTER_DETAILS set SUM_ROW_COUNT_THRESHOLD = ( select to_number(value) from configurations where config_key = 'DEFAULT_SUMMARIZATION_ROW_COUNT_THRESHOLD' ) ;

CREATE TABLE CLEAR_RULE_HISTORY_DETAILS
(
 AGGREGATION_TYPE            NUMBER(20) ,
 AGGREGATION_VALUE           VARCHAR2(40) ,
 RULE_ID                     NUMBER(10),
 RELOAD_TIME                 DATE,
 INSTANCE_ID                 NUMBER(10),
 THREAD_ID                   NUMBER(10),
 REFERENCE_ID                NUMBER(20),
 COUNTER_ID                 NUMBER(20)
);

CREATE INDEX IX_CL_RL_HIS_DE_AGG_VALUE on  CLEAR_RULE_HISTORY_DETAILS (AGGREGATION_VALUE) ;
CREATE INDEX IX_CL_RL_HIS_DE_REF_ID on  CLEAR_RULE_HISTORY_DETAILS (REFERENCE_ID) ;

insert into fraud_types_rules (rule_id, fraud_type_id) values( ( select id from rules where name = 'AI Rate of Change Voice Profiling') , 13 ) ;
insert into fraud_types_rules (rule_id, fraud_type_id) values( ( select id from rules where name = 'AI Rate of Change Data Profiling') , 13 ) ;


--- nikira-DML-field-categories.sql.parse.in

update regular_expressions set expression =  '^[\w\.\-\''][\w\.\-\@\'']*[a-zA-Z]+[\w\.\-\@\'' ]*[\w\.\-\'']$' where description = 'User Name Regular Expression' and id = 16 ;

update field_categories set category = category || ' AUTO_THRESHOLD' where id in ( 3 , 14 ) ;

insert into translation_indices(id, description,is_dynamic) values (24,'All Rule Name',1) ;

--***************** translation indices for auto thresholds *******************
insert into translation_indices(id, description) values (558,'Auto threshold Engine') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 558,'ALL', 'Calculator For All') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 558,'NFR', 'Calculator For NFR') ;

insert into translation_indices(id, description) values (559,'Auto threshold Is Active') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 559, '1', 'Enabled') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 559, '2', 'Disabled') ;


update translations set value = 'select key as Key, name || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category is null) and parent_id != 0 and id > 1024' where tr_id = 68  ;

update translations set value = 'select key as Key, name || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%MANUAL.PRECHECK%'' or category is null or category like ''TEST%'' or category like ''%INLINE_RULES%'') and parent_id != 0 and id > 1024 and rule_mode<>1' where tr_id = 69 ;
update translations set value = 'select key as Key, name  || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r  where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%''or category is null) and parent_id != 0 and id > 1024' where tr_id = 87 ;

insert into duration_types(name, type_id, duration_threshold_in_days, priority) values ('Static Rule Lookback', -5, 1, 4) ;

update translations set value = 'select key as Key, name || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r  where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%MANUAL.PRECHECK%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%'' or category is null or rule_mode in (1,2,3)) and parent_id != 0 and id > 1024' where tr_id = 547 ;

update translations set value = 'select key as Key, name as Value from rules r where (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%''or category is null) and parent_id != 0 and id > 1024 and rule_mode=0' where tr_id = 24 ;


---nikira-DML-demo-gprs-nrtrde.sql

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 50);


--- nikira-DDL-AI-SUB_NE_PRO_INDEX_PH_NU.sql

CREATE INDEX IX_SUB_NEURAL_PROFILE_SUB_ID ON SUBSCRIBER_NEURAL_PROFILE("SUBSCRIBER_ID")
@PARTITIONED_DBSETUP@INITRANS 4 STORAGE(FREELISTS 16)
@PARTITIONED_DBSETUP@LOCAL
@PARTITIONED_DBSETUP@INDEX_PARTITION_CLAUSE 5 2
;

CREATE INDEX IX_BLK_NEURAL_PROFILE_SUB_ID ON BLACKLIST_NEURAL_PROFILE("BLACKLIST_ID")
@PARTITIONED_DBSETUP@INITRANS 4 STORAGE(FREELISTS 16)
@PARTITIONED_DBSETUP@LOCAL
@PARTITIONED_DBSETUP@INDEX_PARTITION_CLAUSE 5 2
;


--- nikira-DML-gsm.sql

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 50)  ;

---nikira-DDL-db-file3.sql.parse.in
ALTER TABLE FMS_LOG	MODIFY (USER_ID     VARCHAR2(64));

--- nikira-DDL-workflow.sql.parse.in
ALTER TABLE ALARM_ACTIVITY_LOGS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE WORKFLOW_TRANSACTIONS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE ARCHIVED_WORKFLOW_TRANSACTIONS MODIFY (USER_ID     VARCHAR2(64));
ALTER TABLE ARCHIVED_ALARM_ACTIVITY_LOGS   MODIFY (USER_ID     VARCHAR2(64));

update field_configs set width = 64 where name = 'User Name'  and RECORD_CONFIG_ID in ( 40 , 49 , 113 , 114 , 115 ) ;
update field_configs set width = 64 , translation_id = 514 where name = 'Owner Name'  ;
update field_configs set width = 64 where name = 'Owner'  ;
update field_configs set width = 64 where name = 'Creator ID'  ;
update field_configs set width = 64 where name = 'User ID'  ;

update field_configs set translation_id = 514 where name = 'Owner' and record_config_id in (16,17,97,22,23,24,10,21) ;

update field_configs set is_expandable = 1 where name = 'Address Line 1' and record_config_id = 3 and field_id = 7;
update field_configs set is_expandable = 1 where name = 'Address Line 2' and record_config_id = 3 and field_id = 8;
update field_configs set is_expandable = 1 where name = 'Address Line 3' and record_config_id = 3 and field_id = 9;

update field_configs set is_expandable = 1 where name = 'Address Line 1' and record_config_id = 4 and field_id = 7;
update field_configs set is_expandable = 1 where name = 'Address Line 2' and record_config_id = 4 and field_id = 8;
update field_configs set is_expandable = 1 where name = 'Address Line 3' and record_config_id = 4 and field_id = 9;

update field_configs set is_expandable = 1 where name = 'Address Line 1' and record_config_id = 99 and field_id = 7;
update field_configs set is_expandable = 1 where name = 'Address Line 2' and record_config_id = 99 and field_id = 8;
update field_configs set is_expandable = 1 where name = 'Address Line 3' and record_config_id = 99 and field_id = 9;


--- nikira-DML-inline-exec.sql.parse.in
--** IP Address need to ne changed based on site
delete from configurations where config_key = 'INLINE_IRM_LISTEN_URL' ;
@NOTIPV6@insert into configurations values(configurations_seq.nextval, 'INLINE_IRM_LISTEN_URL','TCP://[127.0.0.1]:51001',1) ;
@IPV6@insert into configurations values(configurations_seq.nextval, 'INLINE_IRM_LISTEN_URL','TCP://[::1]:51001',1) ;

--- nikira-DML-demo-gprs.sql

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 50);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 54, id from pseudo_functions where id = 50);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 54, id from pseudo_functions where id = 51);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 54, id from pseudo_functions where id = 52);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 54, id from pseudo_functions where id = 53);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 50);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 50);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 50);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 50);


--- nikira-DML-rule-called-to-called-by.sql

insert into analyst_actions_rules(rule_id, analyst_action_id) (select (select id from rules where name = 'Called To' ) , a.id from analyst_actions a where a.category like '%RECOMMENDED_ACTION%') ;
insert into analyst_actions_rules(rule_id, analyst_action_id) (select (select id from rules where name = 'Called By' ), a.id from analyst_actions a where a.category like '%RECOMMENDED_ACTION%') ;

--- nikira-DML-help-files.sql

update help_files_maps set HELP_FILE = 'home_page_rules_hpgs.htm' where HELP_FILE = 'home__page_rules_hpgs.htm' ;
update help_files_maps set HELP_FILE = 'homepage_record_view_ipdr_hpgs.htm' where HELP_FILE = 'homepage_record_view-ipdr_hpgs.htm' ;

--- nikira-DML-exec.sql.parse.in
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'FUNCTIONS.MULTIPLE_FUNCTION','libmultiplefunction');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'FUNCTIONS.PERSESSION', 'libpersessionfunction');

insert into configurations values (configurations_seq.nextval,'LOGIN_IDLE_DAYS_FOR_EXPIRY','30',1) ;
insert into configurations values (configurations_seq.nextval,'USER_ACCOUNT_EXPIRY_NOTIFICATION_START','3',1) ;
insert into configurations values (configurations_seq.nextval,'USER_LOGIN_EXPIRY_NOTIFICATION_EMAIL','admin@subex.com',1) ;

delete from configurations where config_key = 'COUNTER_CLEANUP_PARALLEL_THREADS_COUNT' ;

--** Change the IP as per site
delete from configurations where config_key = 'NOTIFICATION_MANAGER_HOST' ;
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'NOTIFICATION_MANAGER_HOST', '127.0.0.1');
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'NOTIFICATION_MANAGER_HOST', '::1');

delete from configurations where config_key = 'ACTIVITY_EXECUTOR_HOST' ;
@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ACTIVITY_EXECUTOR_HOST', '127.0.0.1');
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ACTIVITY_EXECUTOR_HOST', '::1');


--** Check if all the users are required 
update user_options set value = '1,4 ,5,6,7,8,9,10,11,12, 14,15,18,19,20,21,27,28,29,30,17,31' where option_id = '17.SelectedFields' ;
update user_options set value = '1,4,5,6,7,8,9,10,11,12,14,15,17,18,19,20,25,26,27,28,29,30' where option_id = '19.SelectedFields' ;
update user_options set value = '1,2,3,4,5,6,7, 8, 9 ,10 ,11,12 ,13, 14' where option_id = '104.SelectedFields' ;

insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 51) ; 
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 52) ; 
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 53) ; 

update basic_filter_configs set position = 14 where record_config_id= 21 and record_view_config_id = 17 and field_id = 24 ;
update basic_filter_configs set position = 15 where record_config_id= 21 and record_view_config_id = 17 and field_id = 9 ;
update basic_filter_configs set position = 16 where record_config_id= 21 and record_view_config_id = 17 and field_id = 20 ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, translation_id) values(BASIC_FILTER_SEQ.nextval, 23, 17, 23, 8, 13, 0, 60) ;

update basic_filter_configs set translation_id = 24 where record_config_id= 16 and record_view_config_id = 19 and field_id = 21 ;

update basic_filter_configs set position = 14 where record_config_id= 16 and record_view_config_id = 19 and field_id = 23 ;
update basic_filter_configs set position = 15 where record_config_id= 16 and record_view_config_id = 19 and field_id = 9 ;
update basic_filter_configs set position = 16 where record_config_id= 16 and record_view_config_id = 19 and field_id = 24 ;
update basic_filter_configs set position = 17 where record_config_id= 16 and record_view_config_id = 19 and field_id = 20 ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, translation_id) values( BASIC_FILTER_SEQ.nextval, 16, 19, 22, 8, 13, 0, 60);

update basic_filter_configs set translation_id = 44 where record_config_id= 31 and record_view_config_id = 39 and field_id = 7 ;

insert into audit_log_event_codes values (52, 'Alarm Status Changed with Action', 'Alarm raised on $2 (''$1'') changed its status from ''$3'' to ''$4'' -- Actions Performed : $5' , 1) ;
update audit_log_event_codes set action = 'Manual Alarm created on $2 (''$1'') $3' where ID = 56 and DESCRIPTION = 'Manual Alarm Created' ;

delete from scheduler_command_maps where job_name = 'Smart Pattern Cleanup' ;
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('Smart Pattern Cleanup', 'sp_data_cleanup.rb,SmartPatternCleanupPID', 0, 0,1);


delete from scheduler_command_maps where job_name = 'Threshold Calculator For NFR' ;
delete from scheduler_command_maps where job_name = 'Threshold Calculator For All' ;
--Threshold calculator--
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('Threshold Calculator', 'thresholdcalculator.rb,thresholdcalculatorPID',1, 0, 1) ;

delete from scheduler_command_maps where job_name = 'Smart Pattern Counter Cleanup' ;

delete from scheduler_parameters where job_name in ('Threshold Calculator For All' , 'Threshold Calculator For All' ) ;
insert into scheduler_parameters (job_name, parameter, data_type, display_name,translation_id, is_mandatory) values ('Threshold Calculator', 'Type', 1, 'Type',558,1) ;

update table_names set RELOAD_CODE = 14 where name = 'cell_site_geo_positions' ;

insert into configurations(id, config_key, value) values(configurations_seq.nextval,'DBWITER_LOADER_REJECT_PER_FILE_THRESHOLD', '1') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'DBWITER_RETAIN_LOADER_LOG_FILES', '0') ;

-- DBWriter Sleep Thread Frequencey Interval ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'DB_WRITER.TIMER_SLEEP_INTERVAL', '10') ;

-- DBWriter Direct Load Option Kick Threshold ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'DBWRITER.DIRECT_LOAD_INITIATE_THRESHOLD', '70') ;

-- DBWriter Files Pickup Batch Size 
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'DBWRITER.MAXFILE_QUEUE_SIZE', '1000') ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'DBWRITER.LOADER_BATCH_FETCH_SIZE', '500') ;



insert into query_statuses(ID,DESCRIPTION) values(7,'Repeat Schedule') ;



 ---InMemory Stats Rule configurations-- 
delete from configurations where config_key = 'INMEMORY_STATS_RULE_DATA_RETENTION_IN_DAYS' ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'INMEMORY_DATA_RETENTION_IN_DAYS', '7');
delete from configurations where config_key = 'INMEMORY_STATS_RULE_DATA_ARCHIVE_RETENTION_IN_DAYS' ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'INMEMORY_DATA_ARCHIVE_RETENTION_IN_DAYS', '12');

---Configuration entries for Counter Clear Rule History 
insert into configurations values (configurations_seq.nextval,'COUNTER_CLEAR_RULE_HISTORY_TIMEOUT','86400',0) ;
insert into configurations values (configurations_seq.nextval,'COUNTER_CLEAR_RULE_HISTORY_TRANSACTION_COUNT','1',0) ;

--Configuration for alarm regeneration control
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval, 'ALARM_RESTRICT_REGENRATION', '0', 1) ;
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval, 'ALARM_RESTRICT_REGENRATION_INTERVAL_IN_SECONDS', '10', 1) ;

--Configuration for Release info 
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval, 'RELEASE_INFO', 'Nikira 7.4', 1) ;

--Scheduler entries Auto threshold / Statistical rule element cleanup--
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('In Memory Data Cleanup', 'cleanup_in_memory_cache_dmps.rb,CleanUpInMemoryCacheDeltaAndDumpPID', 0, 0, 1) ;

--ATE configuration -

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('Archived Threshold Cleanup', 'cleanup_archived_thresholds.rb,CleanUpArchivedThresholdsPID', 0, 0, 1) ;

insert into configurations values (configurations_seq.nextval, 'CLEANUP.RECORDS.ARCHIVED_THRESHOLDS.OPTIONS','1970/01/01 00:00:00,30', 0) ;

--Multiple Login configuration -

insert into configurations values(configurations_seq.nextval,'MULTIPLE_LOGINS',0,1);

--CSRF configuration -

insert into configurations values(configurations_seq.nextval,'IS_CSRF_FEATURE_ENABLED',0,1);
-- Default Localhost

@NOTIPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_LOCAL_HOST', '127.0.0.1');
@IPV6@insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_LOCAL_HOST', '::1');

--Case insensitive sort configuration -

insert into configurations values (configurations_seq.nextval, 'IS_CASE_INSENSITIVE_STRING_SORTING_ENABLED',  '1', '') ;



--- nikira-DML-new-record-config.sql
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 40, 'Login Expiry Date','LOGIN_EXPIRY',21,21,4, 0, 0,'','',20,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 49, 'Login Expiry Date','LOGIN_EXPIRY',21,21,4, 0, 0,'','',20,null,1,null,1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Summary End Time', 'SUMMARY_END_TIME', 10, 10, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 69, 'Rule Name', 'RULE_KEY',11, 11, 1, 1, 1, 1, 0, 69) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Summary End Time', 'SUMMARY_END_TIME', 10, 10, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 93, 'Rule Name', 'RULE_KEY',11, 11, 1, 1, 1, 1, 0, 69) ;

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(172,'OBSERVATION_SUMMARY_RECORDS','Observation Summary Records', 0, '', 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(154,'Observation Summary Records', 172, '', 'SUMMARY_START_TIME DESC', 1, 1, 1, 1) ;

insert into translation_indices values (557, 'Stats Obs Summary Rule Name', null, 1);
insert into translations values (translations_seq.nextval, 557, '-176', 'select key as Key, substr(name, 1, instr(name, ''_Profile_Field_v'')-1) as Value from rules r where is_active = 1 and (category like ''%PROFILE_FIELD%'') and parent_id != 0 and id > 1024 and rule_mode=0') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Aggregation Value', 'AGGREGATION_VALUE', 2,        2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Summary End Time', 'SUMMARY_END_TIME', 5, 5, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Record Config ID', 'RECORD_CONFIG_ID', 6, 6, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Measured Data', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id)  values (field_configs_seq.nextval, 172, 'Statistical Element', 'RULE_KEY', 9, 9, 1, 1, 1, 1, 0,557) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'ID', 'ID', 10, 0, 1, 0, 0, 0, 0) ;

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(173,'AR_OBSERVATION_SUMMARY_RECORDS','Archived Observation Summary Records', 0, '', 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(155,'Archived Observation Summary Records', 173, '', 'SUMMARY_START_TIME DESC', 1, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Aggregation Value', 'AGGREGATION_VALUE', 2,    2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,     is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Summary End Time', 'SUMMARY_END_TIME', 5, 5, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Record Config ID', 'RECORD_CONFIG_ID', 6, 6, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Measured Data', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 173, 'Statistical Element', 'RULE_KEY',9, 9, 1, 1, 1, 1, 0, 557) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'ID', 'ID', 10, 0, 1, 0, 0, 0, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 105, 'Summary End Time', 'SUMMARY_END_TIME', 10, 10, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 105, 'Rule Name', 'RULE_KEY',11, 11, 1, 1, 1, 1, 0, 69) ;

--  RATE view inactive thresholds
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(35,'INVALID_THRESHOLDS_V','Invalid Auto Thrshold View',0,'',1) ;

update record_view_configs set is_logging_enabled = 1 where name = 'Archived Alarms' and id = 19 ;

 --  RATE view thresholds Record 

update record_view_configs set where_clause = 'AGGREGATION_VALUE is NOT NULL' , order_by = 'THRESHOLD_MODIFIED_DATE DESC' , is_pagination_enabled = 1 , is_visible = 1 , is_primary_view = 1 , is_logging_enabled = 1 , is_cell_specific = 1 where id = 43 and name = 'View Active Autothreshold' ;

update record_view_configs set where_clause = 'AGGREGATION_VALUE is NOT NULL' , order_by = 'THRESHOLD_MODIFIED_DATE DESC' , is_pagination_enabled = 1 , is_visible = 1 , is_primary_view = 1 , record_config_id = 35 , is_logging_enabled = 1 , is_cell_specific = 0 where id = 44 and name = 'View Inactive Autothreshold' ;

update field_configs set is_filter = 1 , is_visible = 1 where record_config_id = 16 and name = 'Fraud Types' and database_field = 'FRAUD_TYPES' ;

update field_configs set is_filter = 1 where record_config_id = 16 and name = 'Closure Type' and field_id = 25 ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 16, 'Declared Fraud Value', 'DECLARED_FRAUD_VALUE', 30, 0, 2, 0, '', '', 20, null, 1, null, 0, '');


 ---------------Field Configs for Closed Alarms

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 23, 'Declared Fraud Value', 'DECLARED_FRAUD_VALUE', 31, 0, 2, 0, '', '', 20, null, 1, null, 0, '');

update field_configs set is_filter = 1 ,is_visible = 1 where record_config_id = 23 and name = 'Fraud Types' and database_field = 'FRAUD_TYPES' ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (3659, 33, 'Is Active', 'IS_ACTIVE', 16, 16, 3, '', 0, '', '', 20, 559, 1, null, 1) ;

update  field_record_config_maps set field_association = '5.1' where field_category_id = 7 and record_config_id = 3 and field_association = '1' ;

update field_configs set is_visible = 0 where record_config_id = 111 and name = 'Record Count' and database_field = 'RECORD_COUNT' ;

update field_configs set is_visible = 0 where record_config_id = 111 and name = 'Network' and database_field = 'NETWORK_ID' ;
update record_view_configs set where_clause = 'QUERY_STATUS_ID IN(4,7)' where id = 135 and name = 'Scheduled Queries' ;

-- RATE view invalid thresholds

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2765, 35, 'ID', 'ID', 1, 1, 8, '', 0, '', '', 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2766, 35, 'Rule Name', 'RULE_KEY', 2, 2, 3, '', 1, '', '', 40, 25, 1, 9, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2767, 35, 'Rule Id', 'RULE_ID', 3, 3, 8, '', 0, '', '', 40, 25, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2768, 35, 'Rule Description', 'RULE_DESCRIPTION', 4, 4, 3, '', 0, '', '', 256, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2769, 35, 'Rule Version', 'RULE_VERSION', 5, 5, 1, '', 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2770, 35, 'Rule Network ID', 'NETWORK_ID', 6, 6, 7, '', 0, '', '', 20, 10, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2771, 35, 'Threshold ID', 'THRESHOLD_ID', 7, 7, 8, '', 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2772, 35, 'Threshold Version', 'THRESHOLD_VERSION', 8, 8, 1, '', 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2773, 35, 'Threshold Value', 'THRESHOLD_VALUE', 9, 9, 2, '', 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2774, 35, 'Threshold Duration', 'THRESHOLD_DURATION', 10, 10, 1, '', 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2775, 35, 'Threshold Status ', 'THRESHOLD_CHANGED_STATUS', 11, 11, 1, '', 0, '', '', 20, 48, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2776, 35, 'Expiry Date', 'THRESHOLD_EXPIRY_DATE', 12, 12, 4, '', 0, '', '', 40, null, 1, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2777, 35, 'Modified Date', 'THRESHOLD_MODIFIED_DATE', 13, 13, 4, '', 0, '', '', 40, null, 1, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2778, 35, 'Aggregation Type', 'AGGREGATION_TYPE', 14, 14, 1, '', 0, '', '', 20, 115, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2779, 35, 'Aggregation Value', 'AGGREGATION_VALUE', 15, 15, 3, '', 0, '', '', 40, null, 1, 0, 1) ;



--- nikira-DML-recharge.sql.parse.in
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 2 from pseudo_functions where id = 50)  ;

--- nikira-DML-task-precheck.sql
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Management'),'On Demand Precheck','/alarm/complete_precheck', 0, 0 );
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'On Demand Precheck'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'On Demand Precheck'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'On Demand Precheck'),2 from dual) ;

--- nikira-DML-task.sql.parse.in

insert into tasks (id, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, PACKAGE_IDS ) values (tasks_seq.nextval, GetParentID('Test Rules'), 'Copy Test Rules', '/test_rule/copy', 0,0,'0,2,3,4');
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Copy Test Rules'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Copy Test Rules'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Copy Test Rules'),2 from dual) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Add Custom Nick Name', '/custom_nickname/new/131', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Modify Custom Nick Name ', '/custom_nickname/edit', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Delete Custom Nick Name', '/custom_nickname/destroy', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Multiple Custom Delete Nick Name', '/custom_nickname/multiple_delete/131', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Add Custom Nick Name Details', '/custom_nickname/add_value', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Custom'), 'Delete Custom Nick Name Details', '/custom_nickname/destroy_detail', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Add Custom Nick Name Details'), 'Add Contained Custom Nick Name', '/custom_nickname/addcontainednickname', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Add Custom Nick Name Details'), 'Upload Custom Nick Name Details', '/custom_nickname/upload_file', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Add Custom Nick Name Details'), 'Delete All Values', '/custom_nickname/destroy_detail_and_custom_value', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

delete from ranger_groups_tasks where task_id in ( select id from tasks where name = 'Import' ) ;
delete from tasks where name = 'Import' ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Server Configurations'), 'Import', '/import/list', 0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Import'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Import'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Import'),2 from dual) ;

-- New task entry for google street view
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval,'0,1,2,3,4', GetParentid('Tasks'), 'Google Street View', '/record_view/street_view', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Google Street View'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Google Street View'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Google Street View'),2 from dual) ;


-- New task entry for My favorites
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval,'0,1,2,3,4', GetParentid('Tasks'), 'My Favorites', '/menu/my_favorites', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'My Favorites'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'My Favorites'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'My Favorites'),2 from dual) ;

insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval, '0,1,2,3,4', GetParentid('Scheduler'), 'Unscheduled Jobs','/scheduler/list_unscheduled_jobs/56',0,0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Unscheduled Jobs'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Unscheduled Jobs'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Unscheduled Jobs'),2 from dual) ;

--- nikira-DDL-db-file7.sql.parse.in
CREATE TABLE RSAGE_TEMP_GROUPS_COUNT (
        GROUPCOUNT                             NUMBER(20),
        TYPE                                   NUMBER (20) ,
        STATUS                                 NUMBER(20) ,
        GROUPS                                 VARCHAR2(20)
       );

alter table OBSERVATION_SUMMARY_RECORDS add ( SUMMARY_END_TIME        DATE            NOT NULL ) ;
alter table OBSERVATION_SUMMARY_RECORDS add ( RULE_KEY                                NUMBER(20) ) ;
alter table OBSERVATION_SUMMARY_RECORDS DROP CONSTRAINT PK_OBS_SUMM_REC ;
alter table OBSERVATION_SUMMARY_RECORDS ADD CONSTRAINT PK_OBS_SUMM_REC PRIMARY KEY(AGGREGATION_TYPE, AGGREGATION_VALUE, ALERT_ID, SUMMARY_START_TIME, RECORD_CONFIG_ID, CDR_ID, RULE_KEY) ;

DECLARE
    days number(20) ;
BEGIN
select to_number(value)/(3600 * 3600 * 24) into days from configurations where config_key = 'DEFAULT_SUMMARIZATION_GRANULARITY' ;
update observation_summary_records ob set rule_key = ( select EVENT_INSTANCE_ID from alerts a where a.id = alert_id), SUMMARY_END_TIME = SUMMARY_START_TIME + days where exists ( select EVENT_INSTANCE_ID from alerts a where a.id = alert_id) ;
END ;
/

alter table AR_OBSERVATION_SUMMARY_RECORDS add ( SUMMARY_END_TIME        DATE            NOT NULL ) ;
alter table AR_OBSERVATION_SUMMARY_RECORDS add ( RULE_KEY                                NUMBER(20) ) ;
alter table AR_OBSERVATION_SUMMARY_RECORDS DROP CONSTRAINT PK_ARCH_OBS_SUMM_REC ;
alter table AR_OBSERVATION_SUMMARY_RECORDS ADD CONSTRAINT PK_ARCH_OBS_SUMM_REC PRIMARY KEY(AGGREGATION_TYPE, AGGREGATION_VALUE, ALERT_ID, SUMMARY_START_TIME, RECORD_CONFIG_ID, CDR_ID, RULE_KEY) ;

DECLARE
    days number(20) ;
BEGIN
select to_number(value)/(3600 * 3600 * 24) into days from configurations where config_key = 'DEFAULT_SUMMARIZATION_GRANULARITY' ;
update ar_observation_summary_records ob set rule_key = ( select EVENT_INSTANCE_ID from archived_alerts a where a.id = alert_id), SUMMARY_END_TIME = SUMMARY_START_TIME + days where exists ( select EVENT_INSTANCE_ID from archived_alerts a where a.id = alert_id) ;
END ;
/

alter table RTF_OBS_SUMMARY_RECORDS add ( SUMMARY_END_TIME        DATE            NOT NULL ) ;
alter table RTF_OBS_SUMMARY_RECORDS add ( RULE_KEY                                NUMBER(20) ) ;
alter table RTF_OBS_SUMMARY_RECORDS DROP CONSTRAINT PK_RTF_OBS_SUMM_REC ;
alter table RTF_OBS_SUMMARY_RECORDS ADD CONSTRAINT PK_RTF_OBS_SUMM_REC PRIMARY KEY(AGGREGATION_TYPE, AGGREGATION_VALUE, ALERT_ID, SUMMARY_START_TIME, RECORD_CONFIG_ID, CDR_ID, RULE_KEY) ;

DECLARE
    days number(20) ;
BEGIN
select to_number(value)/(3600 * 3600 * 24) into days from configurations where config_key = 'DEFAULT_SUMMARIZATION_GRANULARITY' ;
update RTF_OBS_SUMMARY_RECORDS ob set rule_key = ( select RULE_KEY from rtf_alerts a where a.id = alert_id), SUMMARY_END_TIME = SUMMARY_START_TIME + days where exists ( select RULE_KEY from rtf_alerts a where a.id = alert_id) ;
END ;
/


delete from configurations where config_key = 'DEFAULT_SUMMARIZATION_GRANULARITY' ;
delete from configurations where config_key = 'DEFAULT_SUMMARIZATION_ROW_COUNT_THRESHOLD' ;


alter table TEMP_RULE_STAT add (TOTAL_DECLARED_FRD_VALUE            NUMBER(10,2)) ;

 CREATE OR REPLACE VIEW ALERT_OBSERVATION_SUMMARY_V
 AS
 (
                       SELECT A.ALARM_ID, OS.SUMMARY_START_TIME, OS.RECORD_CONFIG_ID,
                       SUM(decode((select category from rules where key = os.rule_key and rownum <2), 'STATISTICAL_RULE', 0, OS.VALUE)) AS VALUE,
                       SUM(OS.COUNT) AS COUNT
                       FROM OBSERVATION_SUMMARY_RECORDS OS, ALERTS A
                       WHERE A.ID = OS.ALERT_ID
                       GROUP BY A.ALARM_ID, OS.ALERT_ID, OS.SUMMARY_START_TIME, OS.RECORD_CONFIG_ID
 ) ;





CREATE SEQUENCE QUERY_JOBS_ADDITIONALS_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 10000 MINVALUE 1 CYCLE CACHE 20 ORDER ;

CREATE TABLE QUERY_JOBS_ADDITIONALS
(
       QUERY_JOB_ID NUMBER(20)          NOT NULL,
       DAY_OF_WEEK                             VARCHAR2(50),
       DAY_OF_MONTH                            VARCHAR2(100),
       MONTH_OF_YEAR                           VARCHAR2(50),
       RESULTS_STORED                          NUMBER(20) NOT NULL,
       ID                                                      NUMBER(20) NOT NULL,
       SCHEDULE_TYPE                           NUMBER(20),
       STR_TIME                                        VARCHAR2(50),
       LAST_UPDATE_TIME                        DATE
) ;

CREATE SEQUENCE FAVORITES_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 200 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE FAVORITES (
        ID      NUMBER(20, 0) NOT NULL,
        NAME    VARCHAR2(256) NOT NULL,
        IMAGE   VARCHAR2(256),
        URL     VARCHAR2(500)
);


--- nikira-DML-internal-user-exec.sql
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 70 from pseudo_functions where id = 50)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 50)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 72 from pseudo_functions where id = 50)  ;

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 213, id from pseudo_functions where id = 50);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 214, id from pseudo_functions where id = 50);

--Internal user adjustment log record view selected fields.

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'nadmin', 2, '1, 2 ,3 ,4 ,5 ,9', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'radmin', 1, '1, 2 ,3 ,4 ,5 ,9', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'default', 1, '1, 2 ,3 ,4 ,5 ,9', 0, 1) ;

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','nadmin', 2, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','radmin', 1, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','default', 1, '4', 0, 1);

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','nadmin', 2, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','radmin', 1, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','default', 1, '1', 0, 1);

--Internal user CRM log record view selected fields.

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '85.SelectedFields', 'nadmin', 2, '1, 2 ,4 ,5', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '85.SelectedFields', 'radmin', 1, '1, 2 ,4 ,5', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '85.SelectedFields', 'default', 1, '1, 2 ,4 ,5', 0, 1) ;


insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','nadmin', 2, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','radmin', 1, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','default', 1, '4', 0, 1);

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','nadmin', 2, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','radmin', 1, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','default', 1, '1', 0, 1);



-- ALARM_VIEWS , RANGER_USERS_ONLINE_V , RATE_V , THRESHOLDS_V , RULES_V , ACTIONS_RULES_V , ALERT_OBSERVATION_SUMMARY_V , ALERT_OBSERVATION_SUMMARY_V 


CREATE OR REPLACE VIEW ALARM_VIEWS
AS
(
        SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID as USER_ID, A.OWNER_TYPE as OWNER_TYPE,
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yyyy'), to_date('','dd-mm-yyyy'),A.PENDING_TIME) AS PENDING_TIME,
		A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE,
	FieldUtil.normalize(S.ACCOUNT_NAME) ACCOUNT_NAME,
	LTRIM(FieldUtil.normalize(S.FIRST_NAME)||DECODE(S.MIDDLE_NAME,NULL,'',' '||FieldUtil.normalize(S.MIDDLE_NAME))||DECODE(S.LAST_NAME,NULL,'',' '||FieldUtil.normalize(S.LAST_NAME))) SUBSCRIBER_NAME,
                S.GROUPS, C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, S.ACCOUNT_ID AS PARENT_ID
                , decode(A.REFERENCE_ID,4,4,2,2,0,0,AC.HIERARCHY_ID) AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				ROUND(DECODE(A.ASSIGNED_DATE, NULL,0,(CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END))) AS ANALYSIS_DURATION, 
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE, A.DECLARED_FRAUD_VALUE
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
	A.REFERENCE_TYPE, A.REFERENCE_VALUE, A.IS_VISIBLE, FieldUtil.normalize(AC.ACCOUNT_NAME) ACCOUNT_NAME, 
	LTRIM(FieldUtil.normalize(AC.FIRST_NAME)||DECODE(AC.MIDDLE_NAME,NULL,'',' '||FieldUtil.normalize(AC.MIDDLE_NAME))||DECODE(AC.LAST_NAME,NULL,'',' '||FieldUtil.normalize(AC.LAST_NAME))) SUBSCRIBER_NAME,
                '', C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS, AC.PARENT_ID AS PARENT_ID, AC.HIERARCHY_ID AS HIERARCHY_ID,
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				ROUND(DECODE(A.ASSIGNED_DATE, NULL, 0, (CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END))) AS ANALYSIS_DURATION, 
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE, A.DECLARED_FRAUD_VALUE
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
				A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE, A.DECLARED_FRAUD_VALUE
                FROM ALARMS A
                        WHERE (A.REFERENCE_TYPE NOT IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID IN (3, 4)) OR A.REFERENCE_ID = 0)
							AND A.IS_VISIBLE = 1
                            AND A.STATUS NOT IN (7)
) ;



CREATE OR REPLACE VIEW RANGER_USERS_ONLINE_V
AS
(
	 SELECT
		ID,
		USER_NAME,
		JOINMANYROWSIN1UNIQ(GROUP_NAME) AS GROUP_NAME,
		DEFAULT_ROLE,
		JOINMANYROWSIN1UNIQ(NETWORK) AS NETWORK,
		HASHED_PASSWORD,
		DESCRIPTION,
		FIRST_NAME,
		MIDDLE_NAME,
		LAST_NAME,
		CONTACT_NO,
		CONTACT_ADDRESS,
		EMAIL_ID,
		PASSWORD_DATE,
		DAYS_TO_EXPIRE,
		IS_LOCKED,
		IS_ACTIVE,
		IP_BOUNDED,
		PERMISSIBLE_IPS,
		IS_ONLINE,
		SESSION_EXPIRY,
		LOGIN_EXPIRY
	FROM
	(
		SELECT
			RU.ID AS ID,
			RU.NAME AS USER_NAME,
			RG.name AS GROUP_NAME,
			(select name from ranger_groups RG where RG.id = RU.DEFAULT_ROLE) AS DEFAULT_ROLE,
			N.id AS NETWORK,
			PA.HASHED_PASSWORD AS HASHED_PASSWORD,
			RU.DESCRIPTION AS DESCRIPTION,
			RU.FIRST_NAME AS FIRST_NAME,
			RU.MIDDLE_NAME AS MIDDLE_NAME,
			RU.LAST_NAME AS LAST_NAME,
			RU.CONTACT_NO AS CONTACT_NO,
			RU.CONTACT_ADDRESS AS CONTACT_ADDRESS,
			RU.EMAIL_ID AS EMAIL_ID,
			PA.PASSWORD_DATE AS PASSWORD_DATE,
			PA.DAYS_TO_EXPIRE AS DAYS_TO_EXPIRE,
			RU.IS_LOCKED AS IS_LOCKED,
			RU.IS_ACTIVE AS IS_ACTIVE,
			RU.IP_BOUNDED AS IP_BOUNDED,
			RU.PERMISSIBLE_IPS AS PERMISSIBLE_IPS,
			NVL((select distinct(1) from ranger_sessions where ranger_user_id = RU.id and expires_on > sysdate ), 0) AS IS_ONLINE,
			RU.SESSION_EXPIRY AS SESSION_EXPIRY,
			RU.LOGIN_EXPIRY AS LOGIN_EXPIRY
		FROM
			ranger_users RU,
			ranger_groups RG,
			ranger_groups_ranger_users RGRU,
			networks_ranger_users NRU,
			networks N,
			passwords PA
		WHERE
			RGRU.ranger_user_id = RU.id AND
			RGRU.ranger_group_id = RG.id AND
			RU.id=NRU.ranger_user_id AND
			NRU.network_id = N.ID AND
			RU.id IN (SELECT RANGER_USER_ID FROM RANGER_SESSIONS WHERE EXPIRES_ON > SYSDATE) AND
			PA.ranger_user_name = RU.name AND
			PA.is_active = 1
	)
	GROUP BY
		ID,
		USER_NAME,
		DEFAULT_ROLE,
		HASHED_PASSWORD,
		DESCRIPTION,
		FIRST_NAME,
		MIDDLE_NAME,
		LAST_NAME,
		CONTACT_NO,
		CONTACT_ADDRESS,
		EMAIL_ID,
		PASSWORD_DATE,
		DAYS_TO_EXPIRE,
		IS_LOCKED,
		IS_ACTIVE,
		IP_BOUNDED,
		PERMISSIBLE_IPS,
		IS_ONLINE,
		SESSION_EXPIRY,
		LOGIN_EXPIRY
);

CREATE OR REPLACE VIEW RATE_V 
AS
( 
	SELECT R.ID AS RULE_ID, R.KEY AS RULE_KEY, AUR.AGGREGATION_TYPE, AUR.LOWER_RANGE, AUR.HIGHER_RANGE,
		AUR.TOLERANCE, AUR.ID, AUR.IS_CHECKED, 
	JOINMANYROWSIN1(NR.NETWORK_ID) 
		AS NETWORK_ID
			FROM AUTOTHRESHOLD_USAGE_RANGES AUR, RULES R, NETWORKS_RULES NR
			WHERE AUR.RULE_ID = R.ID
				AND R.ID = NR.RULE_ID
				AND R.IS_ACTIVE = 1 
				AND R.IS_ENABLED = 1 
				AND R.ACCUMULATION_FUNCTION IN (1, 2, 6)  
				AND R.RULE_MODE = 0
				AND EXISTS (SELECT FC.ID FROM REFERENCE_TYPES_MAPS RTM, REFERENCE_TYPES RT, FIELD_CATEGORIES FC
                             WHERE FC.ID = R.AGGREGATION_TYPE
                             AND RTM.AGGREGATION_TYPE = FC.ID
                             AND RTM.REFERENCE_TYPE = RT.ID)
			GROUP BY R.ID, R.KEY, AUR.AGGREGATION_TYPE, AUR.LOWER_RANGE, AUR.HIGHER_RANGE, 
				 AUR.TOLERANCE, AUR.ID, AUR.IS_CHECKED
);

CREATE OR REPLACE VIEW THRESHOLDS_V
AS
(
 SELECT DISTINCT AT.ID AS ID, R.ID AS RULE_ID, R.KEY AS RULE_KEY, R.DESCRIPTION AS RULE_DESCRIPTION,
   T.RULE_VERSION AS RULE_VERSION,
	JOINMANYROWSIN1(NR.NETWORK_ID)
   AS NETWORK_ID, T.THRESHOLD_ID,
         AT.THRESHOLD_VERSION AS THRESHOLD_VERSION, AT.VALUE AS THRESHOLD_VALUE, DECODE(INSTR(FC.CATEGORY,'NO_DURATION',1,1),0,T.DURATION,0) AS THRESHOLD_DURATION,
         AT.CHANGED_STATUS AS THRESHOLD_CHANGED_STATUS, AT.EXPIRY_DATE AS THRESHOLD_EXPIRY_DATE,
         AT.MODIFIED_DATE AS THRESHOLD_MODIFIED_DATE, T.AGGREGATION_TYPE, AT.AGGREGATION_VALUE, AT.REFERENCE_ID, AT.IS_ACTIVE AS IS_ACTIVE
           FROM RULES R, THRESHOLDS T, AUTO_THRESHOLDS AT, NETWORKS_RULES NR,FIELD_CATEGORIES FC
           WHERE R.KEY   = T.RULE_KEY AND R.AGGREGATION_TYPE = FC.ID
			 AND T.ID = AT.THRESHOLD_ID
             AND   R.VERSION  = T.RULE_VERSION
             AND   R.ID = NR.RULE_ID
             AND  (R.CATEGORY IS NULL OR R.CATEGORY IN ('SMART_PATTERN', 'MANUAL_ALARM_RULES'))
			 AND T.IS_ACTIVE = 1
           	 GROUP BY AT.ID, R.ID, R.KEY, R.DESCRIPTION, T.RULE_VERSION, T.THRESHOLD_ID, AT.THRESHOLD_VERSION, AT.VALUE,
             T.DURATION, AT.CHANGED_STATUS, AT.EXPIRY_DATE, AT.MODIFIED_DATE, T.AGGREGATION_TYPE,
             AT.AGGREGATION_VALUE, AT.REFERENCE_ID,AT.IS_ACTIVE,FC.CATEGORY
);

CREATE OR REPLACE VIEW INVALID_THRESHOLDS_V
AS
(
 SELECT DISTINCT AT.ID AS ID, R.ID AS RULE_ID, R.KEY AS RULE_KEY, R.DESCRIPTION AS RULE_DESCRIPTION,
   T.RULE_VERSION AS RULE_VERSION,
	JOINMANYROWSIN1(NR.NETWORK_ID)
   AS NETWORK_ID, T.THRESHOLD_ID,
         AT.THRESHOLD_VERSION AS THRESHOLD_VERSION, AT.VALUE AS THRESHOLD_VALUE, DECODE(INSTR(FC.CATEGORY,'NO_DURATION',1,1),0,T.DURATION,0) AS THRESHOLD_DURATION,
         AT.CHANGED_STATUS AS THRESHOLD_CHANGED_STATUS, AT.EXPIRY_DATE AS THRESHOLD_EXPIRY_DATE,
         AT.MODIFIED_DATE AS THRESHOLD_MODIFIED_DATE, T.AGGREGATION_TYPE, AT.AGGREGATION_VALUE
           FROM RULES R, THRESHOLDS T, ARCHIVED_THRESHOLDS AT, NETWORKS_RULES NR,FIELD_CATEGORIES FC
           WHERE R.KEY   = T.RULE_KEY AND R.AGGREGATION_TYPE = FC.ID
			 AND T.ID = AT.THRESHOLD_ID
             AND   R.VERSION  = T.RULE_VERSION
             AND   R.ID = NR.RULE_ID
             AND  (R.CATEGORY IS NULL OR R.CATEGORY IN ('SMART_PATTERN', 'MANUAL_ALARM_RULES'))
           GROUP BY AT.ID, R.ID, R.KEY, R.DESCRIPTION, T.RULE_VERSION, T.THRESHOLD_ID, AT.THRESHOLD_VERSION, AT.VALUE,
             T.DURATION, AT.CHANGED_STATUS, AT.EXPIRY_DATE, AT.MODIFIED_DATE, T.AGGREGATION_TYPE,
             AT.AGGREGATION_VALUE, AT.IS_ACTIVE,FC.CATEGORY
);



CREATE OR REPLACE VIEW RULES_V AS
(
	SELECT
		R.ID AS ID,
		R.NAME AS NAME,
		R.KEY AS KEY,
		R.AGGREGATION_TYPE AS AGGREGATION_TYPE,
		R.PSEUDO_FUNCTION_ID AS FUNCTION,
		R.USER_ID AS USERNAME,
		DECODE(R.PARENT_ID,999,'-',(SELECT NAME FROM RULES WHERE ID=R.PARENT_ID)) AS PARENT_TEMPLATE,
		DECODE(R.IS_ENABLED,0,'Disabled',1,'Enabled') AS STATUS,
		R.IS_ACTIVE AS IS_ACTIVE,
		(SELECT JOINMANYROWSIN1UNIQ(TAG_ID) FROM RULES_TAGS where RULE_ID=R.ID) AS TAGS,
		CAST( RN.NETWORKS AS  varchar2(256)) NETWORK_ID,
		( SELECT JOINMANYROWSIN1UNIQ(RECORD_CONFIG_ID) FROM RECORD_CONFIGS_RULES WHERE RULE_ID = R.ID) AS  DATA_STREAMS,
		R.VERSION AS VERSION,
		R.CATEGORY AS CATEGORY,
		R.DESCRIPTION AS DESCRIPTION,
		R.MODIFICATION_TIME AS MODIFICATION_TIME,
		CAST(RUDT.TAGS AS varchar2(4000)) USER_DEFINED_TAGS,
		R.RULE_MODE,
		'-' AS ENTITY_TYPE
	FROM
		RULES R,
		RULE_USER_DEFINED_TAGS_V RUDT,
		RULE_NETWORKS_V RN
	WHERE
		R.KEY >= 1024 AND
		R.PARENT_ID not in (0,999) AND
		R.SMART_PATTERN_ID = 0 AND
		(
			R.CATEGORY IS NULL OR
			R.CATEGORY LIKE 'TEST_%_RULE' OR
			R.CATEGORY IN ('INLINE_RULES','SMART_PATTERN','CalledToCalledBy','FINGERPRINT_RULE','STATISTICAL_RULE')
		) AND
		R.ID = RN.RULE_ID AND
		R.ID=RUDT.RULE_ID(+)
UNION ALL
	SELECT
		R.ID AS ID,
		R.NAME AS NAME,
		R.KEY AS KEY,
		R.AGGREGATION_TYPE AS AGGREGATION_TYPE,
		R.PSEUDO_FUNCTION_ID AS FUNCTION,
		R.USER_ID AS USERNAME,
		DECODE(R.PARENT_ID,999,'-',(SELECT NAME FROM RULES WHERE ID=R.PARENT_ID)) AS PARENT_TEMPLATE,
		DECODE(R.IS_ENABLED,0,'Disabled',1,'Enabled') AS STATUS,
		R.IS_ACTIVE AS IS_ACTIVE,
		(SELECT JOINMANYROWSIN1UNIQ(TAG_ID) FROM RULES_TAGS where RULE_ID=R.ID) AS TAGS,
		CAST( RN.NETWORKS AS  varchar2(256)) NETWORK_ID,
		( SELECT JOINMANYROWSIN1UNIQ(RECORD_CONFIG_ID) FROM RECORD_CONFIGS_RULES WHERE RULE_ID = R.ID) AS  DATA_STREAMS,
		R.VERSION AS VERSION,
		R.CATEGORY AS CATEGORY,
		R.DESCRIPTION AS DESCRIPTION,
		R.MODIFICATION_TIME AS MODIFICATION_TIME,
		CAST(RUDT.TAGS AS varchar2(4000)) USER_DEFINED_TAGS,
		R.RULE_MODE,
		PFE.description ENTITY_TYPE
	FROM
		RULES R,
		RULE_USER_DEFINED_TAGS_V RUDT,
		RULE_NETWORKS_V RN,
		PROFILE_FIELD_ENTITIES PFE
	WHERE
		R.KEY >= 1024 AND
		R.PARENT_ID != 0 AND
		R.SMART_PATTERN_ID = 0 AND
		(
			R.CATEGORY IS NULL OR
			R.CATEGORY LIKE 'TEST_%_RULE' OR
			R.CATEGORY IN ('INLINE_RULES','SMART_PATTERN','CalledToCalledBy','FINGERPRINT_RULE','STATISTICAL_RULE')
		) AND
		R.PARENT_ID = 999 AND
		R.ID = RN.RULE_ID AND
		R.ID=RUDT.RULE_ID(+) AND
		R.AGGREGATION_TYPE = PFE.ID(+)
) ;

-- Views Created for RuleList report
CREATE OR REPLACE VIEW ACTIONS_RULES_V
AS
(
        SELECT 
	JOINMANYROWSIN1(A.ACTION_NAME) 
		AS ACTION_NAME, R.ID AS RULE_ID
                FROM ACTIONS A, ACTIONS_RULES AR, RULES R
                        WHERE   R.ID = AR.RULE_ID
                                AND     A.ID = AR.ACTION_ID
								AND A.ACTION_NAME != 'Violation Capture Action'
                GROUP BY R.ID
);

 CREATE OR REPLACE VIEW ALERT_OBSERVATION_SUMMARY_V
 AS
 (
			SELECT A.ALARM_ID, OS.SUMMARY_START_TIME, OS.RECORD_CONFIG_ID,
       		SUM(decode((select category from rules where key = os.rule_key and rownum <2), 'STATISTICAL_RULE', 0, OS.VALUE)) AS VALUE,
       		SUM(OS.COUNT) AS COUNT
   			FROM OBSERVATION_SUMMARY_RECORDS OS, ALERTS A
   			WHERE A.ID = OS.ALERT_ID
   			GROUP BY A.ALARM_ID, OS.ALERT_ID, OS.SUMMARY_START_TIME, OS.RECORD_CONFIG_ID
 ) ;




--- nikira-DDL-workflow.sql.parse.in

alter table ALARM_ACTIVITY_LOGS add (CLOSURE_ACTION_ID                       NUMBER(20)) ;
alter table ARCHIVED_ALARM_ACTIVITY_LOGS add (CLOSURE_ACTION_ID                       NUMBER(20)) ;


-- nikira-DML-record-config-demo-gprs.sql

update field_categories set category = 'AGGREGATION_TYPE NICKNAME NO_DURATION' where name = 'Charging ID' ;

--- Smart Pattern Related Changes
--- nikira-DDL-sp-db.sql.parse.in

--- Migration of ALERT_REPEAT_COUNT_MAPS , ALERT_REPEAT_COUNT_RECORDS , AR_ALERT_REPEAT_COUNT_MAPS , AR_ALERT_REPEAT_COUNT_RECORDS , SMART_PATTERN_ALERT_DATA , SMART_PATTERN_BLOCK_RECORDS , SP_COUNTER_VIOLATION_MAPS , SP_RELATION_PRIORITIES , SP_RULE_RELATIONS 

CREATE TABLE SP_AGGREGATION_TYPE_MAPS
(
	PARENT_AGGREGATION		NUMBER(20) NOT NULL,
	CHILD_AGGREGATIONS		VARCHAR2(20) NOT NULL
) ;

--CREATE SEQUENCE SP_BLOCKS_SEQ INCREMENT BY 1 START WITH 50 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;

alter table SP_CONNECTIONS drop column INPUT_RELATION_ID ;
alter table SP_CONNECTIONS drop column OUTPUT_RELATION_ID ;


--CREATE SEQUENCE SP_CONNECTIONS_SEQ INCREMENT BY 1 START WITH 50 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;

CREATE OR REPLACE VIEW SP_CONNECTIONS_V AS
(
	SELECT DISTINCT
		C1.ID,
		C1.TEMPLATE_ID,
		C1.SOURCE_BLOCK,
		NVL
		(
			(
				SELECT DISTINCT
					C2.TARGET_BLOCK
				FROM
					SP_CONNECTIONS C2,
					SP_BLOCKS B1
				WHERE
					C2.SOURCE_BLOCK = C1.TARGET_BLOCK AND
					C2.SOURCE_BLOCK = B1.BLOCK_ID AND
					B1.BLOCK_TYPE = 'SPDurationBlock' AND
					C1.TEMPLATE_ID = C2.TEMPLATE_ID AND
					C2.TEMPLATE_ID = B1.TEMPLATE_ID
			),
			C1.TARGET_BLOCK
		) TARGET_BLOCK,
		C1.DURATION
	FROM
		SP_CONNECTIONS C1,
		SP_BLOCKS B2
	WHERE
		B2.BLOCK_TYPE != 'SPDurationBlock' AND
		B2.BLOCK_ID = C1.SOURCE_BLOCK AND
		C1.TEMPLATE_ID = B2.TEMPLATE_ID
);

CREATE TABLE SP_BLOCK_ALERTS
(
	ID					NUMBER(20)		NOT NULL,
	SMART_PATTERN_ID	NUMBER(20)		NOT NULL,
	REFERENCE_ID		NUMBER(20)		NOT NULL,
	AGGREGATION_VALUE	VARCHAR2(40)	NOT NULL,
	MODIFIED_DATE		DATE			NOT NULL,
	SERIAL_NUMBER		NUMBER(20)		NOT NULL,
	ALERT_COUNT			NUMBER(20)		NOT NULL,
	ALERT_LIST			RAW(2000)
) ;

CREATE SEQUENCE SP_BLOCK_ALERTS_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE INDEX IX_SP_BL_AL_ID ON SP_BLOCK_ALERTS(ID) ;
CREATE INDEX IX_SP_BL_AL_RFID_AGVL_SPID ON SP_BLOCK_ALERTS(REFERENCE_ID, AGGREGATION_VALUE, SMART_PATTERN_ID) ;

CREATE TABLE SP_BLOCK_RECORDS
(
	SP_BLOCK_ALERTS_ID	NUMBER(20)		NOT NULL,
	ALERT_ID			NUMBER(20)		NOT NULL,
	CREATED_DATE		DATE			NOT NULL,
	SERIAL_NUMBER		NUMBER(20)		NOT NULL,
	RECORD_COUNT		NUMBER(20)		NOT NULL,
	RECORD_LIST			VARCHAR2(4000)	NOT NULL
) ;

CREATE INDEX IX_SP_BL_REC_SP_BL_AL_ID ON SP_BLOCK_RECORDS(SP_BLOCK_ALERTS_ID) ;
CREATE INDEX IX_SP_BL_REC_ALT_ID ON SP_BLOCK_RECORDS(ALERT_ID) ;

drop table SP_COUNTER ;

CREATE TABLE SP_COUNTER
(
    SMART_PATTERN_KEY   NUMBER(20)		NOT NULL,
	REFERENCE_ID		NUMBER(20)		NOT NULL,
    AGGREGATION_VALUE   VARCHAR2(40)	NOT NULL,
    VIOLATION_TIME      DATE			NOT NULL,
	RUN_ID				NUMBER(20)		NOT NULL,
	ALERT_IDS			VARCHAR2(1024)	NOT NULL
) ;

CREATE SEQUENCE SP_COUNTER_RUN_ID_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE INDEX IX_SP_CNTR_AGVL_RFID_SPKEY ON SP_COUNTER(REFERENCE_ID, AGGREGATION_VALUE, SMART_PATTERN_KEY) ;

CREATE TABLE SP_VIOLATIONS
(
    SMART_PATTERN_KEY   NUMBER(20)		NOT NULL,
	REFERENCE_ID		NUMBER(20)		NOT NULL,
    AGGREGATION_VALUE   VARCHAR2(40)	NOT NULL,
	CREATED_DATE            DATE                    DEFAULT SYSDATE         NOT NULL,
	RUN_ID				NUMBER(20)		NOT NULL,
	SERIAL_NUMBER		NUMBER(20)		NOT NULL,
	RECORD_LIST			VARCHAR2(4000)	NOT NULL
) ;

CREATE INDEX IX_SP_VI_AGVL_RFID_SPKEY ON SP_VIOLATIONS(REFERENCE_ID, AGGREGATION_VALUE, SMART_PATTERN_KEY) ;
CREATE INDEX IX_SP_VI_RU_ID ON SP_VIOLATIONS(RUN_ID) ;

CREATE TABLE AR_SP_VIOLATIONS
(
    SMART_PATTERN_KEY   NUMBER(20)		NOT NULL,
	REFERENCE_ID		NUMBER(20)		NOT NULL,
    AGGREGATION_VALUE   VARCHAR2(40)	NOT NULL,
	CREATED_DATE            DATE                    DEFAULT SYSDATE         NOT NULL,
	RUN_ID				NUMBER(20)		NOT NULL,
	SERIAL_NUMBER		NUMBER(20)		NOT NULL,
	RECORD_LIST			VARCHAR2(4000)	NOT NULL
) ;

CREATE INDEX IX_AR_SP_VI_AGVL_RFID_SPKEY ON AR_SP_VIOLATIONS(REFERENCE_ID, AGGREGATION_VALUE, SMART_PATTERN_KEY) ;
CREATE INDEX IX_AR_SP_VI_RU_ID ON AR_SP_VIOLATIONS(RUN_ID) ;

CREATE TABLE ALERT_SP_VIOLATIONS_MAPS
(
	ALERT_ID				NUMBER(20)      NOT NULL,
	REPEAT_COUNT			NUMBER(20)      NOT NULL,
	SP_VIOLATIONS_RUN_ID	NUMBER(20)      NOT NULL
) ;

CREATE INDEX IX_AL_SP_VI_MA_AL_ID ON ALERT_SP_VIOLATIONS_MAPS(ALERT_ID) ;

CREATE TABLE AR_ALERT_SP_VIOLATIONS_MAPS
(
	ALERT_ID				NUMBER(20)      NOT NULL,
	REPEAT_COUNT			NUMBER(20)      NOT NULL,
	SP_VIOLATIONS_RUN_ID	NUMBER(20)      NOT NULL
) ;

CREATE INDEX IX_AR_AL_SP_VI_MA_AL_ID ON AR_ALERT_SP_VIOLATIONS_MAPS(ALERT_ID) ;

CREATE TABLE SYNCHRONOUS_CLEANUP_CONFIGS
(
	ID						NUMBER(20)		NOT NULL,
	PROCESSOR_NAME			VARCHAR2(50)	NOT NULL,
	ENTRY_TYPE				VARCHAR2(50)	NOT NULL,
	INSTANCE_COUNT			NUMBER(20),
	LAST_POLL_TIME			DATE
) ;

CREATE SEQUENCE SYNCH_CLEANUP_CONFIG_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE MINVALUE 1 NOCYCLE ;

CREATE TABLE SP_CLEANUP_IDS
(
	SP_BLOCK_ALERTS_ID		NUMBER(20)
) ;


--- ranger-sp-exec.sql

delete from sp_rule_relations ;
delete from sp_relation_priorities ;

delete from configurations where config_key='SP_COUNTER_IDIncrement' ;
delete from configurations where config_key='SP_ALERT_DATA_IDIncrement' ;

--- nikira-DML-sp-exec.sql

insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(2, '4,2,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(3, '3') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(4, '4,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(7, '7,4,2,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(14, '14') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(44, '44') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(54, '54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(213, '213') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(225, '225') ;
 
delete from configurations where config_key='SP_BLOCK_ALERTS_SEQ_INCREMENT' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SP_BLOCK_ALERTS_SEQ_INCREMENT', '1');

delete from configurations where config_key='SMART_PATTERN_THREAD_QUEUE_SIZE' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_THREAD_QUEUE_SIZE', '200');

delete from configurations where config_key='SMART_PATTERN_ALERTS_PER_TRANSATION' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_ALERTS_PER_TRANSATION', '1');

delete from configurations where config_key='SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS', '30');

delete from configurations where config_key='SP_BLOCK_ALERTS_RAW_COLUMNS_COUNT' ;
insert into configurations(id, config_key, value)
        values(configurations_seq.nextval, 'SP_BLOCK_ALERTS_RAW_COLUMNS_COUNT', '2');
 
--** Take these changes only if it is really required. If a site is guranteed to get called number do not run the called_number alter command. In standard db setup not null condition is removed.
/*
--- nikira-DDL-db-demo-GSM-2.sql.parse.in 
alter table ARCHIVED_CDR modify ( CALLED_NUMBER null ) ;

--- nikira-DDL-db-demo-GSM-OFF_CDR.sql.parse.in
alter table cdr modify ( CALLED_NUMBER null ) ; 
alter table temp_cdr_0 modify ( CALLED_NUMBER null ) ;
alter table temp_cdr_1 modify ( CALLED_NUMBER null ) ;
alter table temp_cdr_2 modify ( CALLED_NUMBER null ) ;
alter table offline_cdr modify ( CALLED_NUMBER null ) ; 
--- nikira-DDL-db-demo-GSM-TEMP_OFF_CDR.sql.parse.in
alter table TEMP_OFFLINE_CDR modify ( CALLED_NUMBER    null ) ;
--- nikira-spark-DDL-db.sql
alter table SP_ALARM_CDR modify ( CALLED_NUMBER    null ) ;
alter table SP_RTF_ALARM_CDR modify ( CALLED_NUMBER    null ) ;
*/

-- ==AutoThreshold  Related entries 
@../nikira-DML-Auto-Threshold-counter-entries.sql
@../nikira-DML-Auto-Threshold-counter-entries-for-AccountName.sql
@../nikira-DML-Auto-Threshold-counter-entries-for-IMEI.sql
@../nikira-DML-Auto-Threshold-counter-entries-for-IMSI.sql
@../nikira-DML-Auto-Threshold-counter-entries-for-Cellsite.sql
@../addautothresholdpackage.sql
@../report_utility.sql
@../rule_performance_package.sql
@../summary_package.sql

@../nikira-DDL-db-not-ldap.sql
@LDAP@ @../nikira-DDL-db-ldap.sql

--** Remove the below update if the path has to be retained
update configurations set value = replace ( value , 'RangerData' , 'FMSData' ) where value like '%RangerData%' ;
update configurations set value = replace ( value , '/Ranger/' , '/FMS/' ) where value like '%/Ranger/%' ;

@../cleanup_package.sql
@../cdr_summary_package.sql
@../group_summary_procedure.sql
@../custom_nickname.sql
@../pkg_country.sql
@../disable_rule.sql
@../highriskdestination_summary_procedure.sql
@../utility_package.sql
@../archiver_package.sql

commit ;
quit ;
