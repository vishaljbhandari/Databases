set feedback off ;
set serveroutput on ;
spool migration_for_workflow.log
--<START>
    --  Files       :   nikira-DDL-workflow.sql,  nikira-DML-workflow.sql, nikira-DML-exec.sql.parse.in,
	--					nikira-DML-new-record-config.sql, nikira-DML-task.sql, nikira-DML-internal-user-exec.sql, 
	--					nikira-DML-field-categories.sql.parse.in
	--					
    --  Feature		: 	New model conditional workflow implementation.
    --  Patches     :   None

CREATE SEQUENCE ACTIVITY_INPUTS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE CACHE 20 ;
CREATE TABLE ACTIVITY_INPUTS
(
  	ID						NUMBER(20) ,
  	NAME 					VARCHAR2(256),
  	DESCRIPTION 			VARCHAR2(256),
  	PROPERTY_INDICATOR 		NUMBER(3),
  	VALUE  					VARCHAR2(100),
  	DEFAULT_VALUE 			VARCHAR2(100),
    DATA_TYPE               NUMBER(20),
	REG_EXP_ID              NUMBER(20),
	TRANSLATION_ID          NUMBER(20),
  	CONSTRAINT PK_ACT_INP_ID PRIMARY KEY (ID)
);

CREATE SEQUENCE ACTIVITY_OUTPUTS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE ACTIVITY_OUTPUTS (
    ID 						NUMBER(20) NOT NULL,
    NAME 					VARCHAR2(256) NOT NULL,
    DESCRIPTION				VARCHAR2(256) ,
    ACTION_TYPE				NUMBER(20) NOT NULL,
    DATA_TYPE 				NUMBER(20) NOT NULL,
	REG_EXP_ID              NUMBER(20),
	TRANSLATION_ID          NUMBER(20),
    CONSTRAINT PK_ACT_OUT_ID PRIMARY KEY(ID)
) ;

CREATE SEQUENCE ACTIVITY_OUTPUTS_LABELS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE ACTIVITY_OUTPUTS_LABELS (
    ID 						NUMBER(20) NOT NULL,
    ACTIVITY_OUTPUT_ID 		NUMBER(20) NOT NULL,
    NAME 					VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_ACT_OUT_LBL_ID FOREIGN KEY(ACTIVITY_OUTPUT_ID) REFERENCES ACTIVITY_OUTPUTS(ID)
) ;

CREATE SEQUENCE DEFAULT_ACTIVITY_LABELS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE DEFAULT_ACTIVITY_LABELS (
	ID 						NUMBER(20) NOT NULL,
   	DATA_TYPE 				NUMBER(20) NOT NULL,
   	LABEL_ID  				NUMBER(20) NOT NULL ,
   	LABEL  					VARCHAR2(40) NOT NULL,
   	CONSTRAINT PK_DEF_ACT_LBL_ID PRIMARY KEY(ID)
) ;

CREATE TABLE ACTIVITIES_BK AS (SELECT * FROM ACTIVITIES);
DROP SEQUENCE ACTIVITIES_SEQ;
DROP TABLE ACTIVITIES CASCADE CONSTRAINTS;

CREATE SEQUENCE ACTIVITIES_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE ACTIVITIES (
	ID 						NUMBER(20) NOT NULL,
	NAME 					VARCHAR2(256) NOT NULL,
	DESCRIPTION 			VARCHAR(4000),
	JEOPARDY_PERIOD 		NUMBER(20)  DEFAULT 0,
	ACTIVITY_TEMPLATE_ID 	NUMBER(20),
	IS_AUTOMATIC 			NUMBER(2) DEFAULT 0 NOT NULL,
    INPUT_IDS 				VARCHAR(256) ,
    OUTPUT_ID 				NUMBER(20) NOT NULL,
	CONSTRAINT PK_ACTIVITIES_ID PRIMARY KEY(ID),
	CONSTRAINT UK_ACTIVITIES_NAME UNIQUE (NAME),
    CONSTRAINT FK_ACT_OUT_ID FOREIGN KEY(OUTPUT_ID) REFERENCES ACTIVITY_OUTPUTS(ID),
	CONSTRAINT FK_ACT_TPL_ID FOREIGN KEY(ACTIVITY_TEMPLATE_ID) REFERENCES ACTIVITY_TEMPLATES(ID)
) ;

CREATE SEQUENCE ACTIVITIES_OUTPUT_MAPS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE ACTIVITIES_OUTPUT_MAPS(
    ID 						NUMBER(20) NOT NULL,
    ACTIVITY_ID 			NUMBER(20) NOT NULL,
    LABEL_ID 				NUMBER(20) NOT NULL,
    OPERATOR_ID 			NUMBER(2) NOT NULL,
    VALUE  					VARCHAR(50) NOT NULL,
    MEMO 					VARCHAR(256) NOT NULL,
    ADDITIONAL_INFO 		VARCHAR(75),
    CONSTRAINT PK_ACT_OUT_MAPS_ID PRIMARY KEY(ID),
    CONSTRAINT FK_ACT_IP_OUT_MAP_ID FOREIGN KEY(ACTIVITY_ID) REFERENCES ACTIVITIES(ID)
);

CREATE TABLE WORKFLOW_TRANSACTIONS_BK AS (SELECT * FROM WORKFLOW_TRANSACTIONS);
drop sequence WORKFLOW_TRANSACTIONS_SEQ;
DROP TABLE WORKFLOW_TRANSACTIONS CASCADE CONSTRAINTS;

CREATE SEQUENCE WORKFLOW_TRANSACTIONS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE CACHE 20 ;
CREATE TABLE WORKFLOW_TRANSACTIONS (
	ID 						NUMBER(20) NOT NULL,
	ALARM_ID 				NUMBER(20) NOT NULL,
	ACTIVITY_ID 			NUMBER(20) NOT NULL,
	USER_ID 				VARCHAR(15), 
	ACTUAL_COMPLETION_DATE 	DATE,
	EXPECTED_COMPLETION_DATE DATE,
	COMPLETED_BY 			VARCHAR(15),
	STATUS 					NUMBER(20) DEFAULT 0 NOT NULL,
	POSITION 				NUMBER(20),
	IS_MANDATORY 			NUMBER(2) DEFAULT 1 NOT NULL,
	WORKFLOW_CONFIGURATION_ID NUMBER(20) NOT NULL,
	CONSTRAINT PK_WF_TRN_ID PRIMARY KEY(ID)
) ;

CREATE INDEX IX_WF_TRN_ALARM_ID ON WORKFLOW_TRANSACTIONS("ALARM_ID") ;

CREATE SEQUENCE ALARM_WORKFLOW_INFO_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE CACHE 20 ;
CREATE TABLE ALARM_WORKFLOW_INFO (
    ID 						NUMBER(20) NOT NULL,
    ALARM_ID 				NUMBER(20) NOT NULL,
    WORKFLOW_ID 			NUMBER(20) DEFAULT 0 NOT NULL,
    FIRST_TRANSACTION_ID 	NUMBER(20) DEFAULT 0 NOT NULL,
    CURRENT_TRANSACTION_ID 	NUMBER(20) DEFAULT 0 NOT NULL,
    STATUS 					NUMBER(2) DEFAULT 0 NOT NULL
) ;

CREATE SEQUENCE WORKFLOW_TRANS_VARIABLES_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE CACHE 20 ;
CREATE TABLE WORKFLOW_TRANS_VARIABLES (
    ID 						NUMBER(20) NOT NULL,
    WORKFLOW_TRANSACTION_ID NUMBER(20) NOT NULL,
    ENTITY_TYPE 			NUMBER(20) NOT NULL,
    ENTITY_ID 				NUMBER(20) NOT NULL,
    ENTITY_VALUE 			VARCHAR2(256)
) ;

CREATE SEQUENCE WORKFLOW_ACTIVITY_STEPS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE WORKFLOW_ACTIVITY_STEPS(
    ID 						NUMBER(20) NOT NULL,
    WORKFLOW_ID 			NUMBER(20) NOT NULL,
    ACTIVITY_ID 			NUMBER(20) NOT NULL,
    ACTIVITY_LABEL 			VARCHAR2(256) ,
    STEP_ID 				NUMBER(20) NOT NULL,
    POSITION 				VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE WORKFLOW_ACTIVITY_GROUPS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE WORKFLOW_ACTIVITY_GROUPS(
    ID 						NUMBER(20) NOT NULL,
    WORKFLOW_ID 			NUMBER(20) NOT NULL,
    GROUP_ID 				NUMBER(20) NOT NULL,
    GROUP_LABEL 			VARCHAR2(256)
);

CREATE SEQUENCE WORKFLOW_PATHS_SEQ INCREMENT BY 1 START WITH 1024 NOMAXVALUE NOCYCLE NOCACHE ;
CREATE TABLE WORKFLOW_PATHS(
    ID 						NUMBER(20) NOT NULL,
    WORKFLOW_ID 			NUMBER(20) NOT NULL,
    CURRENT_STEP_ID  		NUMBER(20) NOT NULL,
    ACTIVITIES_OUTPUT_MAP_ID  NUMBER(20) NOT NULL,
    NEXT_STEP_ID 			NUMBER(20) NOT NULL
);


CREATE TABLE AR_WORKFLOW_TRANSACTIONS_BK AS (SELECT * FROM ARCHIVED_WORKFLOW_TRANSACTIONS);
DROP TABLE ARCHIVED_WORKFLOW_TRANSACTIONS CASCADE CONSTRAINTS;
CREATE TABLE ARCHIVED_WORKFLOW_TRANSACTIONS (
	ID 						NUMBER(20) NOT NULL,
	ALARM_ID 				NUMBER(20) NOT NULL,
	ACTIVITY_ID 			NUMBER(20) NOT NULL,
	USER_ID 				VARCHAR(15), 
	ACTUAL_COMPLETION_DATE 	DATE,
	EXPECTED_COMPLETION_DATE DATE,
	COMPLETED_BY 			VARCHAR(15), 
	STATUS 					NUMBER(20) DEFAULT 0 NOT NULL,
	POSITION 				NUMBER(20),
	IS_MANDATORY 			NUMBER(2) DEFAULT 1 NOT NULL,
	WORKFLOW_CONFIGURATION_ID NUMBER(20) NOT NULL,
	CONSTRAINT PK_ARCH_WF_TRN_ID PRIMARY KEY(ID)
) ;
 

ALTER TABLE ARCHIVED_ALARM_ACTIVITY_LOGS ADD PARAMETERS   VARCHAR2(1000) DEFAULT NULL;
ALTER TABLE ARCHIVED_ALARMS ADD WF_ASSIGNED_DATE DATE ; 
ALTER TABLE ARCHIVED_ALARMS ADD WF_MODIFIED_DATE DATE ; 

CREATE TABLE ARCHIVED_ALARM_WORKFLOW_INFO (
    ID 						NUMBER(20) NOT NULL,
    ALARM_ID 				NUMBER(20) NOT NULL,
    WORKFLOW_ID 			NUMBER(20) DEFAULT 0 NOT NULL,
    FIRST_TRANSACTION_ID 	NUMBER(20) DEFAULT 0 NOT NULL,
    CURRENT_TRANSACTION_ID 	NUMBER(20) DEFAULT 0 NOT NULL,
    STATUS 					NUMBER(2) DEFAULT 0 NOT NULL
) ;

CREATE TABLE AR_WORKFLOW_TRANS_VARIABLES (
    ID 						NUMBER(20) NOT NULL,
    WORKFLOW_TRANSACTION_ID NUMBER(20) NOT NULL,
    ENTITY_TYPE 			NUMBER(20) NOT NULL,
    ENTITY_ID 				NUMBER(20) NOT NULL,
    ENTITY_VALUE 			VARCHAR2(256)
) ;

CREATE OR REPLACE VIEW ALARM_WORKFLOW_V AS ( 
	SELECT 	WF_T.ID, A.NAME, WF_T.ALARM_ID, WF_T.ACTIVITY_ID, WF_T.USER_ID, 
		WF_T.EXPECTED_COMPLETION_DATE, WF_T.ACTUAL_COMPLETION_DATE, WF_T.COMPLETED_BY, WF_T.STATUS, WF_T.POSITION,
		WF_T.IS_MANDATORY, A.IS_AUTOMATIC, WF_T.WORKFLOW_CONFIGURATION_ID
	FROM ACTIVITIES A, WORKFLOW_TRANSACTIONS WF_T 
	WHERE A.ID = WF_T.ACTIVITY_ID
) ;

CREATE OR REPLACE VIEW ACTIVITIES_V AS ( 
 	SELECT A.ID, A.NAME, A.DESCRIPTION, A.JEOPARDY_PERIOD, A.IS_AUTOMATIC, A.ACTIVITY_TEMPLATE_ID, 
		A.INPUT_IDS AS INPUT_IDS ,A.OUTPUT_ID AS OUTPUT_ID, AT.NAME AS TEMPLATE_NAME  
	FROM ACTIVITIES A, ACTIVITY_TEMPLATES AT 
	WHERE A.ACTIVITY_TEMPLATE_ID = AT.ID) ;

CREATE OR REPLACE VIEW ARCHIVED_ALARM_WORKFLOW_V AS ( 
	SELECT 	WF_T.ID, A.NAME, WF_T.ALARM_ID, WF_T.ACTIVITY_ID, WF_T.USER_ID, 
			WF_T.EXPECTED_COMPLETION_DATE, WF_T.ACTUAL_COMPLETION_DATE, 
			WF_T.COMPLETED_BY, WF_T.STATUS, WF_T.POSITION,
 			WF_T.IS_MANDATORY, A.IS_AUTOMATIC, WF_T.WORKFLOW_CONFIGURATION_ID
	FROM ACTIVITIES A, ARCHIVED_WORKFLOW_TRANSACTIONS WF_T 
	WHERE A.ID = WF_T.ACTIVITY_ID
) ;

CREATE OR REPLACE VIEW WORKFLOW_CONFIGURATION_V AS ( 
	SELECT P.ID, P.WORKFLOW_ID, P.CURRENT_STEP_ID, P.ACTIVITIES_OUTPUT_MAP_ID, 
		P.NEXT_STEP_ID, S.ACTIVITY_ID AS NEXT_ACTIVITY_ID, S.POSITION
	FROM WORKFLOW_PATHS P, WORKFLOW_ACTIVITY_STEPS S 
	WHERE P.WORKFLOW_ID = S.WORKFLOW_ID 
		AND P.NEXT_STEP_ID = S.STEP_ID
) ;

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
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				NVL2(A.ASSIGNED_DATE, (CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END), 0) AS ANALYSIS_DURATION, A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
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
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				NVL2(A.ASSIGNED_DATE, (CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END), 0) AS ANALYSIS_DURATION, A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
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
                A.FRAUD_TYPES AS FRAUD_TYPES, A.RULE_TAGS AS RULE_TAGS, ASSIGNED_DATE,
				NVL2(A.ASSIGNED_DATE, (CASE
										WHEN A.STATUS IN (2,4,8) THEN
											(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400
										ELSE
											(SYSDATE - A.ASSIGNED_DATE) * 86400
										END), 0) AS ANALYSIS_DURATION, A.WF_ASSIGNED_DATE, A.WF_MODIFIED_DATE
                FROM ALARMS A
                        WHERE (A.REFERENCE_TYPE NOT IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID IN (3, 4)) OR A.REFERENCE_ID = 0)
							AND A.IS_VISIBLE = 1
                            AND A.STATUS NOT IN (7)
) ;

insert into record_configs (id,tname,description,cacheable,key,is_visible,delimeter,category,is_partitioned,is_spark_support) values (118, 'ACTIVITY_INPUTS', 'Activity Inputs', 0, NULL, 1, NULL, 'NAMED_FILTERS', 0, 0) ;

insert into record_view_configs (id, name, is_cell_specific, record_config_id, where_clause, order_by, is_visible,is_pagination_enabled, is_primary_view, is_logging_enabled, create_manual_alarm) values (138,'Activity Inputs',0,118,null,'ID  ASC',1,1,1,1,0);

-- Translation for Activity Output action types 

insert into translation_indices(id, description, is_dynamic) values(536, 'Activity Output Action Types', 1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 536, 1, 'Direct');
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 536, 2, 'Action Result') ;

-- Translation for Activity Variable data types  

insert into translation_indices(id, description, is_dynamic) values(537, 'Activity Variable Data Types', 1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 537, '-176', 'select id as key, data_type as value from data_types where data_type in (''Integer'',''Double'',''String'',''Date'',''Boolean'')') ;

---- Translation for Activity Input Indicators---

insert into translation_indices(id, description, is_dynamic) values(538, 'Activity Input Property Indicators', 1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 538, 1, 'User Input');
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 538, 2, 'Enriched');
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 538, 3, 'Constant');

---  

insert into translation_indices(id, description,is_dynamic) values (539,'WorkFlow Activity Input Variables',1);
insert into translations(id, tr_id, key, value) values (translations_seq.nextval,539,'-176','select id as Key ,name as Value from activity_inputs order by id');
insert into translation_indices(id, description,is_dynamic) values (540,'WorkFlow Activity Output Variables',1);
insert into translations(id, tr_id, key, value) values (translations_seq.nextval,540,'-176','select id as Key ,name as Value from activity_outputs order by id');
insert into translation_indices(id, description) values (541,'WorkFlow Activity Operator ') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval,541, '-176',' select id as Key , display_name as Value from operators where id in(2,3,4,5,6,7,10)');

---- Translation for Activity Output boolean datatypes--- 

insert into translation_indices (id,description,sort_on,is_dynamic) values (542,'WorkFlow Activity Output Boolean Values',null,0);
insert into translations (id,tr_id,key,value) values (translations_seq.nextval,542,'-1','NA');
insert into translations (id,tr_id,key,value) values (translations_seq.nextval,542,'1','Yes');
insert into translations (id,tr_id,key,value) values (translations_seq.nextval,542,'0','No');


insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Default Value','default_value',0,0,0,null,3,null,6,null,null,0,256,0,null,null,null,0,0);

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Value','value',0,0,0,null,3,null,5,null,null,0,256,0,null,null,null,0,0);

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Property/Indicator','property_indicator',0,0,1,null,1,null,4,null,538,1,256,0,null,null,null,0,0);

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Description','Description',0,0,1,null,3,null,3,null,null,0,256,0,null,null,null,0,0);

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Name','NAME',0,0,1,null,3,null,2,null,null,1,256,10,null,null,null,0,0);

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'ID','ID',0,0,0,null,1,null,1,null,null,0,256,0,null,null,null,0,0);


insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_spark_support) values (117, 'ACTIVITY_OUTPUTS', 'Activity Outputs', 0, NULL, 1, NULL, 'NAMED_FILTERS', 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values (137, 'Activity Outputs', 117, '', 'ID ASC', 1, 0, 0, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_visible) values (field_configs_seq.nextval, 117, 'ID', 'ID', 1, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 117, 'Name', 'NAME', 2, 1, 3, 0, '', '', 40, null, 1, 10, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 117, 'Description', 'DESCRIPTION', 3, 2, 3, 0, '', '', 40, null, 1, 10, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, is_visible, data_type, translation_id, is_filter) values (field_configs_seq.nextval, 117, 'Action Type', 'ACTION_TYPE', 4, 3, 1, 3, 536, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, is_visible, data_type, translation_id, is_filter) values (field_configs_seq.nextval, 117, 'Data Type', 'DATA_TYPE', 5, 3, 1, 3, 537, 1) ;

insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter,translation_id) values (field_configs_seq.nextval, 76, 'Activity Input Variable', 'INPUT_IDS', 0, 1, 7, 8, 1, 539) ; 

insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter,translation_id) values (field_configs_seq.nextval, 76, 'Activity Output Variable', 'OUTPUT_ID', 0, 1, 1 ,9, 1, 540) ;


---Entries for Activity Input Baic filter ----
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,118,138,4,8,2,0,null,null,'538');
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,118,138,2,0,1,0,null,null,null);

---Entries for Activity Output Baic filter ----
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,117,137,2,0,1,0,null,null,null);
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,117,137,4,8,2,0,null,null,'536');
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,117,137,5,8,3,0,null,null,'537');

---Entries for Activity Steps Baic filter ----
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,76,89,2,0,1,0,null,null,null);
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,76,89,8,8,2,0,null,null,null);
insert into basic_filter_configs (id,record_config_id,record_view_config_id,field_id,operator_id,position,is_mandatory,min,max,translation_id) values (basic_filter_seq.nextval,76,89,9,8,3,0,null,null,null);

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 16, 'Workflow Assigned Time', 'WF_ASSIGNED_DATE', 28, 0, 4, 0, '', '', 40, null, 1, null, 1, '');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 16, 'Workflow Modified Time', 'WF_MODIFIED_DATE', 29, 0, 4, 0, '', '', 40, null, 1, null, 1, '');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 21, 'Workflow Assigned Time', 'WF_ASSIGNED_DATE', 29, 0, 4, 0, '', '', 40, null, 1, null, 1, '');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 21, 'Workflow Modified Time', 'WF_MODIFIED_DATE', 30, 0, 4, 0, '', '', 40, null, 1, null, 1, '');


    insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 1, 'Yes') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 2, 'No') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 3, 'Not Applicable') ;
    
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 1, 'Range-A') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 2, 'Range-B') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 3, 'Not Applicable') ;
    
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 1, 'Range-A') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 2, 'Range-B') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 3, 'Not Applicable') ;
    
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 1, 'Range-A') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 2, 'Range-B') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 3, 'Not Applicable') ;
    
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 1, 'Valid') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 2, 'Invalid') ;
    insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 3, 'Not Applicable') ;
    
    insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'MARK_ALARM_WITHOUT_RESOLVE_WORKFLOW', '0');

     ------------------Audit Log Changes--------------

    insert into entity_types (id,entity_description) values (10011,'Activity Ouptput');
    insert into entity_types (id,entity_description) values (10012,'Activity Input');
    
    insert into audit_log_event_codes values (883,'Activity Output(s) Added', 'Activity Output ''$1'' added', 45) ;
    insert into audit_log_event_codes values (884,'Activity Output(s) Updated', 'Activity Output ''$1'' updated', 45) ;
    insert into audit_log_event_codes values (885,'Activity Output(s) Deleted', 'Activity Output ''$1'' deleted', 45) ;
    
    insert into audit_log_event_codes values (886,'Activity Input(s) Added',   'Activity Input ''$1'' added', 45) ;
    insert into audit_log_event_codes values (887,'Activity Input(s) Updated', 'Activity Input ''$1'' updated', 45) ;
    insert into audit_log_event_codes values (888,'Activity Input(s) Deleted', 'Activity Input ''$1'' deleted', 45) ;
    
    insert into audit_log_event_codes values (889, 'Activity Execution Started', 'Activity ''$1'' execution started', 44) ;
    insert into audit_log_event_codes values (890, 'Activity Execution Completed' ,'Activity ''$1'' execution completed' , 44) ;
    insert into audit_log_event_codes values (891, 'Activity Execution Terminated' ,'Activity ''$1'' execution terminated' , 44) ;
    insert into audit_log_event_codes values (892, 'Activity Execution Interrupted' ,'Activity ''$1'' execution interrupted' , 44) ;
    insert into audit_log_event_codes values (893, 'Activity Execution Resume' ,'Activity ''$1'' execution resume' , 44) ;
    insert into audit_log_event_codes values (894, 'Workflow Status Changed','Workflow ''$1'' execution status changed to ''$2''' , 44) ;


     --------------Task Entries------------
		insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Workflow Management'), 'Activity Outputs', '/activity_output/list', 0, 1) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Workflow Management'), 'Activity Inputs', '/activity_input/list', 0, 1 ) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Outputs'), 'Add Activity Output', '/activity_output/new/137', 0, 0) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Outputs'), 'Modify Activity Output', '/activity_output/edit', 0, 0) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Outputs'), 'Delete Activity Output', '/activity_output/destroy', 0, 0) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Outputs'), 'Delete Multiple Activity Outputs', '/activity_output/multiple_delete/137', 0, 0) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Outputs'),'Show Activity Output','/activity_output/show', 0, 0 ); 
    
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Inputs'),'Add Activity Input', '/activity_input/new/138', 0, 0) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Inputs'),'Modify Activity Input', '/activity_input/edit', 0, 0) ; 
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Inputs'),'Delete Activity Input', '/activity_input/destroy', 0, 0 ) ;
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Inputs'),'Delete Multiple Activity Inputs', '/activity_input/multiple_delete/138', 0, 0 );
    insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Activity Inputs'),'Show Activity Input','/activity_input/show', 0, 0 ); 
    

    UPDATE EXPANDABLE_FIELD_MAPS SET category = category || ' WORK_FLOW' WHERE name = 'Alarm-InternalUser' AND source_view_id = 116 AND dest_view_id = 83 and source_key = 'REFERENCE_VALUE';

-------<END>
commit;
