set feedback off ;
set serveroutput on ;
spool Migration_after_7.3.2.log


--<START>
    --  Files       :   nikira-DDL-workflow.sql
    --  Bug Details :  Bug 33704 - Workflow Modified time and Workflow Assigned time are not visible in Alarm Management & Alarm Administration
					   
    --  Comments    :   
    --  Impacts     :  
	
	ALTER TABLE ALARM_ACTIVITY_LOGS MODIFY ACTIVITY_DESCRIPTION VARCHAR2(1000);
	ALTER TABLE ARCHIVED_ALARM_ACTIVITY_LOGS MODIFY ACTIVITY_DESCRIPTION VARCHAR2(1000);

	UPDATE workflows SET description = SUBSTR(description, 1, 256) ;
	ALTER TABLE workflows MODIFY (description VARCHAR2(256)) ;

	DECLARE
			AlarmId  NUMBER(10,0) ;
	BEGIN
			SELECT id INTO AlarmId FROM tasks WHERE NAME = 'Alarm Management' ;
			UPDATE tasks SET PARENT_ID = AlarmId, NAME = 'Workflow Execution'
					WHERE LINK = '/alarm/show_initiate_workflow;/alarm/show_change_workflow' and NAME = 'Workflow for alarm' ;
	END ;
	/
--<END>


--<START>
    --  Files       :   nikira-DDL-db.sql.parse.in
    --  Bug Details :   Bug 34084 -  Cannot initiate a workflow though the work flow is present.
    --  Comments    :   Entity value in Audit Log only for 100 characters, Removed description from filter
    --  Impacts     :   All auditlog updates
	ALTER TABLE audit_trails MODIFY(entity_value VARCHAR2(256)) ;
	UPDATE field_configs SET is_filter = 0 WHERE record_config_id = 76 and database_field = 'DESCRIPTION' ;
--<END>


--<START>
    --  Files       :  nikira-DDL-db.sql.parse.in
    --  Bug Details :  Bug 33516 -  Not accepting user name as phone_number for phone number when IPDR is selected
					   Bringing Advanced Query Framwork, Finger Print,Smart Pattern Rules support for IPDR Data Stream
	
	
    --  Comments    :  ISP Related Entries
    --  Impacts     :   
	
	@ISP@ update profile_field_entities set element_datastream_ids='1,2,7' where id=2;
	@ISP@ update field_categories set regular_expression_id=8 where id=225 ;
	@ISP@ update agg_type_granularity_maps set PRIORITY=3 where AGGREGATION_TYPE=225 ;
	@ISP@ insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 225,3600, 2, 'PROFILE_FIELD') ;
	@ISP@ update record_view_configs set is_advanced_query_enabled = 1 where id=104;
	@ISP@ delete from counter_maps where category='PROFILE_FIELD' and aggregation_type=225 and record_config_id=83 and counter_type=201 ;
	@ISP@ insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2071, 83, '254.35') ;
	@ISP@ update expressions set RIGHT_FIELD='%' where LEFT_FIELD='12' and RIGHT_FIELD='+%' and RIGHT_FIELD_INDICATOR=1024 and OPERATOR_ID=1 and id in (select expression_id from filter_tokens where system_filter = 1);
	@ISP@ insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(225, 225, 225, 225);
	@ISP@ insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 225, 1, 1) ;
	@ISP@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'IPDR', '/global_exceptions/list/83?show_enrichment=true',  0, 1) ;
	@ISP@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/83', 0, 0) ;
	@ISP@@FINGER_PRINT_PROFILE@ insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 83, '254.32') ;
	@ISP@@FINGER_PRINT_PROFILE@ update aggregation_types set RECORD_CONFIG_IDS= RECORD_CONFIG_IDS || ',83' where id = 16 ;
	@ISP@ insert into filter_index_fields(record_config_id, field_id) values(83, 12) ;

--<END>

--<START>
    --  Files       :   nikira-DML-new-record-config.sql
    --  Bug Details :    Bug 34178 -   No sorting on the default Standard Nicknames
    --  Comments    :   Previously Used ORDER BY ID for Standard Nickname record view now it was changed to ORDER BY NAME
    --  Impacts     :   Sorting of records in the Standard Nichname Record view page    
	update record_view_configs set ORDER_BY = 'NAME ASC' where id = 132;
--<END>

--<START>
    --  Files       :   workflow-db-exec.sql
    --  Bug Details :   Bug 33638 -- removing change fraud type from responsibilities
    --  Comments    :   The Change Fraud Type icon is removed and hence the responsibility should not be present
    --  Impacts     :   Change fraud type will not come as a responsibility.
	delete from TEAMS_USERS_ALARM_TASKS where ALARM_TASK_ID = 3;
	DELETE FROM ALARM_TASKS WHERE ID = 3 ;
--<END>

--<START>
    --  Files       :   cleanup_package.sql.parse.in
    --  Bug Details :   Bug 33754 - On running the archived alarm cleanup script throwing error, 'ID' invalid identifier.
    --  Comments    :   Archived Alarm Xdrs are deleted using column name xdr_id if they are spark supported
    --  Impacts     :   Archived Data Cleanup
	--	Patches		:	7.3.1 Patch_CDM
	@../cleanup_package.sql
--<END>


--<START>
    --  Files       :   alarm_closure_actions.sql.parse.in
    --  Bug Details :   Bug 34359 - Life style profile not generated for GPRS usage for a subscriber
    --  Comments    :   Gprs Profile(LSP) was not generating due to wrong record_config_id was refered in the code
    --  Impacts     :   Lifestyle Profile on Non eFP Setup
	@../alarm_closure_actions.sql
--<END>

--<START>
    --  Files       :   nikira-DML-help-files.sql
    --  Comments    :   Help files keys added for workflow modules
    --  Impacts     :   Context and Web help

	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT','homepage_activity_inputs_hpgs.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT_CREATE','add_activity_inputs_wmgmt.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_INPUT_EDIT','add_activity_inputs_wmgmt.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT','homepage_activity_outputs_hpgs.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT_CREATE','add_activity_outputs_wmgmt.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'ACTIVITY_OUTPUT_EDIT','add_activity_outputs_wmgmt.htm') ;
	insert into help_files_maps values(help_files_maps_seq.nextval,'GLOBAL_EXCEPTION_IPDR','homepage_ipdr_hpgs.htm') ;

	delete from help_files_maps where KEY in ('ALARM_CHANGE_FRAUD_TYPE', 'EXECUTE_ACTIVITY_TEMPLATE') ;
--<END>

--<START>
    --  Files       :  nikira-DML-task-isp.sql
	--  Bug Details : Bug ID - 34514  On applying the normal filter in IPDR records its throwing an error
    --  Comments    :   Non index filtering task was not present for the IPDR. so added this task
    --  Impacts     :   Basic filter in record views

@ISP@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Record View'), 'Filter on Non Indexed Fields', '/non_index_filtering/83', 0, 0) ;
@ISP@ insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
@ISP@ insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
@ISP@ insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

--<END>

--<START>
    --  Files       : nikira-DML-task-isp.sql  
	--  Bug Details : 
    --  Comments    :  Privilege of Creating Global exception of IPDR for default Ranger Groups is added  
    --  Impacts     :  Global Exception of IPDR

@ISP@ declare
@ISP@   list_task_id number;
@ISP@   modify_task_id number;
@ISP@ begin
@ISP@   select ID into list_task_id from tasks where LINK = '/global_exceptions/list/83?show_enrichment=true' ;
@ISP@   select ID into modify_task_id from tasks where LINK = '/global_exceptions/edit/83' ;
@ISP@   insert into ranger_groups_tasks values(0, list_task_id);
@ISP@   insert into ranger_groups_tasks values(1, list_task_id);
@ISP@   insert into ranger_groups_tasks values(2, list_task_id);
@ISP@   insert into ranger_groups_tasks values(0, modify_task_id);
@ISP@   insert into ranger_groups_tasks values(1, modify_task_id);
@ISP@   insert into ranger_groups_tasks values(2, modify_task_id);
@ISP@ end ;
@ISP@ /

--<END>
@../fraudlossavoidancesummary.sql ;

--<START>
    --  Files       :  nikira-DML-task-nrtrde.sql,nikira-DML-new-record-config-nrtrde.sql  
    --  Bug Details :   
    --  Comments    :    Brought in GUI for NRTRDE Partners 
    --  Impacts     :       

@NRTRDE@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Add NRTRDE Partner', '/vpmn_info/new/49', 0, 0) ;
@NRTRDE@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Modify NRTRDE Partner', '/vpmn_info/edit', 0, 0) ;
@NRTRDE@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Show NRTRDE Partner', '/vpmn_info/show', 0, 0) ;
@NRTRDE@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Delete NRTRDE Partner', '/vpmn_info/destroy', 0, 0) ;
@NRTRDE@ insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Multiple Delete NRTRDE Partner', '/vpmn_info/multiple_delete/49', 0, 0) ;
@NRTRDE@ insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 49, id from tasks where link like '%record_view/list/49?fetch_records=%') ;
@NRTRDE@ 
@NRTRDE@     insert into entity_types (id,entity_description) values (10013,'NRTRDE Partner');
@NRTRDE@     
@NRTRDE@     insert into audit_log_event_codes values (897,'NRTRDE Partner(s) Added', 'NRTRDE Partner ''$1'' added', 22) ;
@NRTRDE@     insert into audit_log_event_codes values (898,'NRTRDE Partner(s) Updated', 'NRTRDE Partner ''$1'' updated', 22) ;
@NRTRDE@     insert into audit_log_event_codes values (899,'NRTRDE Partner(s) Deleted', 'NRTRDE Partner ''$1'' deleted', 22) ;
@NRTRDE@     update field_configs set reg_exp_id=18 where record_config_id=42 and field_id=2 ;   
@NRTRDE@     update field_configs set reg_exp_id=10 where record_config_id=42 and field_id=5 ;   
@NRTRDE@     update field_configs set reg_exp_id=18 where record_config_id=42 and field_id=6 ;   
@NRTRDE@     update field_configs set reg_exp_id=15 where record_config_id=42 and field_id=9 ;   
--<END>

--<START>
    --  Files       :   nikira-DML-new-record-config-gsm.sql,nikira-DML-rtf-exec.sql.parse.in,nikira-DML-exec.sql.parse.in,nikira-DML-new-record-config.sql,
nikira-DML-new-record-config-recharge.sql,nikira-DDL-db.sql.parse.in,nikira-DML-new-record-config-isp.sql,nikira-DML-record-config-demo-recharge.sql,nikira-DML-internal-user-exec.sql,nikira-DML-record-config-demo-gsm.sql,nikira-DML-record-config-demo-gprs.sql
    --  Bug Details :   CR-NIK-523 - Multiple currency support in Nikira UI based on network
    --  Comments    :   Now the currency will depend on network table, currency field
    --  Impacts     :   All record views will now show the currency in their field name based on the network chosen.

	alter table networks add currency varchar2(40) default 'INR';
	alter table accumulation_field_units add is_network_specific number(1) default 0 ;

	insert into field_configs_additionals(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) (select FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,FIELD_ID,RECORD_CONFIG_ID,'IS_CURRENCY',1 from field_configs where name like '%(INR)%');

	update field_configs set name = replace(name, ' (INR)', '') where name like '%(INR)%' ;
	
	insert into field_configs_additionals(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,60,'IS_CURRENCY',1);
        insert into field_configs_additionals(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,60,'IS_CURRENCY',1);

--<END>

--<START>
    --  Files	    :   nikira-DML-exec.sql.parse.in
    --  Bug Details :   34331 Scheduled reports actions are not captured in audit log
    --  Comments    :   Entity type is added 
	insert into entity_types(id, entity_description) values (15000, 'Report Scheduler') ;
--<END>

--<START>
    --  Files       :   nikira-DML-exec.sql.parse.in    
    --  Bug Details : 	Providing configuration to allow duration to be in seconds format in export options 
    --  Impacts     :   While exporting cdr records into .csv or .txt formats, duration will come in seconds and for pdf and rtf formats it will be HH:MM:SS 
	insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'DURATION_IN_SECONDS', 0) ;
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in    
    --  Bug Details :  Bug 34846 -  Not able to select ASN common Numbers or ASN Ignored Numbers from Nicknames  	 
    --  Impacts     :  Default Nickname entries will list all netwroks instead of NA
	delete from list_configs_networks where list_config_id in (1,2); 
	insert into list_configs_networks (network_id, list_config_id ) (select n.id, s.id from list_configs s , networks n where n.id!=999 and (select count(*) from networks) != 1 and s.id not in (1024,1025,1026,1027,1028)) ;
	insert into list_configs_networks (network_id, list_config_id ) (select n.id, s.id from list_configs s , networks n where n.id=999 and (select count(*) from networks) = 1 ) ;
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in    
    --  Bug Details :    	 
    --  Impacts     :  

alter table SUSPECT_VALUES add(END_VALUE varchar(40));
DROP VIEW SUSP_VAL_HOTLIST_GRP_NETWRK_V;
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
        GROUP BY (HGSV.SUSPECT_VALUE_ID, SV.VALUE, SV.HOTLIST_KEY_ID, SV.ENTITY_TYPE, SV.SOURCE, SV.REASON, SV.USER_ID,SV.EXPIRY_DATE, SV.CREATED_DATE, SV.CREATED_BY, SV.MODIFIED_DATE, SV.MODIFIED_BY)
);
update table field_configs set position =field_id+1 where id in (2,4,5,6,7,8,9) and record_config_id=15;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2439, 15, 'Entity End Value', 'END_VALUE',9,2,3,1,'','',40,null,1,0,1) ;
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in 
    --  Bug Details :  Claro Requirement to retain subscriber info for all tabs of alarm
    --  Impacts     :  Alarm Details Page
	insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'SHOW_ASSOCIATED_INFO_FOR_ALL_ALARM_TABS','0',0);
	insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'DEFAULT_ACTIVE_ALARM_TAB','1',0);
--<END>

--<START>
    --  Files       :  nikira-DDL-db.sql.parse.in
    --  Change Details :  DB2 Support changes for alarm_views
    --  Comments    :  pendign date format not proper, analysis_duration rounded to whole number
    --  Impacts     :  Alarm Management
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
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yy'), to_date('','dd-mm-yy'),A.PENDING_TIME) AS PENDING_TIME,
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
		A.SCORE, A.VALUE, A.CDR_COUNT, decode(A.PENDING_TIME,to_date('01-01-1970', 'dd-mm-yy'), to_date('','dd-mm-yy'),A.PENDING_TIME) AS PENDING_TIME,
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
--<END>

--<START>
    --  Files       :   
    --  Bug Details :  Merging Offline data loader changes from Roadmap 
	@temp_offline_tables.sql;
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in, nikira-DML-field-categories-nrtrde.sql, nikira-DML-record-config-demo-gprs-nrtrde.sql,nikira-DML-task-nrtrde.sql,nikira-DML-nrtrde.sql,nikira-DML-vpmn-rules.sql   
    --  Bug Details :  NRTRDE PARTNERS related entries for Updating an existing VPMN INFO while loading VPMN INFO using script 
    --  Impacts     :  VPMN INFO in the record view

	insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (64,'Update Data Record',0);
@NRTRDE@ insert into field_categories(id, name, category, data_type) values(4000, 'Previous VPMN Sequence ID','', '') ;
@NRTRDE@ insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'TRUNCATE_VPMN_INFO_FOR_BULK_LOAD', '0' );
@NRTRDE@ insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 4000, 42, '514.1') ;
@NRTRDE@ insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 42, '1') ;
@NRTRDE@ update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='NETWORK_ID' where id =125;
@NRTRDE@ update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='NETWORK_ID' where id =121;
@NRTRDE@ update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='NETWORK_ID' where id =514;
@NRTRDE@ update field_configs set translation_id = 41 where record_config_id=42 and field_id =5 ; 
@NRTRDE@ update tasks set LINK='/vpmn_info/list/49?fetch_records=false' where LINK= '/record_view/list/49?fetch_records=false' ; 
@NRTRDE@ declare
@NRTRDE@    rule_seq number ;
@NRTRDE@ begin
@NRTRDE@ -- Rule for setting Previous Processed VPMN ID
@NRTRDE@ select s_rule_seq.nextval into rule_seq from dual ;
@NRTRDE@ insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) values (rule_seq, 999, rule_seq, 'Before Updating VPMN Copy VPMN ID', 0, 200, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'DISPATCHER.VPMN.STORE') ;
@NRTRDE@ insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 42) ;
@NRTRDE@ insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
@NRTRDE@ insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 4000, 1, 0) ;
@NRTRDE@ insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 3000) ;
@NRTRDE@    						
@NRTRDE@ insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 42, 1, 999) ;
@NRTRDE@ insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, s_rule_seq.currval) ;
@NRTRDE@ insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '514.2', '0', 1024, 26) ;
@NRTRDE@ insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;
@NRTRDE@ 
@NRTRDE@ -- Rule for Updating an existing VPMN Record
@NRTRDE@ select s_rule_seq.nextval into rule_seq from dual ;
@NRTRDE@ insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) values (rule_seq, 999, rule_seq, 'Update VPMN Record', 0, 200, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'DISPATCHER.VPMN.STORE') ;
@NRTRDE@ insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 42) ;
@NRTRDE@ insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 64) ;
@NRTRDE@ insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 0, 0, 42) ;
@NRTRDE@ insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 3000) ;
@NRTRDE@    						
@NRTRDE@ insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 42, 1, 999) ;
@NRTRDE@ insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, s_rule_seq.currval) ;
@NRTRDE@ insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '514.2', '0', 1024, 26) ;
@NRTRDE@ insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;
@NRTRDE@ end ;
@NRTRDE@ /

--<END>

--<START>
    --  Files       :  nikira-DML-record-config-demo.sql 
    --  Change Details :Range Support In Hotlist 
    --  Comments    :  
    --  Impacts     : Hotlist Management 
alter table suspect_values add (end_value varchar(40)); 
alter table suspect_values add (is_range number(20)); 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 15, 'END_VALUE',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;
delete from basic_filter_configs  where record_config_id =15 and field_id in (15,7,6);
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 2, 0, 2, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 4, 0, 3, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 8, 10,4, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 15, 15, 7, 8, 5, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2430, 15, 'Entity Start Value', 'VALUE',1,1,3,1,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2439, 15, 'Entity End Value', 'END_VALUE',2,2,3,1,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2431, 15, 'Entity Type', 'ENTITY_TYPE',3,3,1,0,'','',40,89,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2432, 15, 'Source', 'SOURCE',4,4,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2433, 15, 'Reason', 'REASON',5,5,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2434, 15, 'User Name', 'USER_ID',6,6,1,0,'','',40,102,0,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2435, 15, 'Groups', 'GROUPS',7,7,7,0,'','',256,96,1,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2436, 15, 'Expiry Date ','EXPIRY_DATE',8,8,4, '', 0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values ( 2437, 15, 'Networks', 'NETWORK_ID',9,9,7,0,'','',256,10,(select decode(count(*),1,0,1) from networks),null,0 );
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2438, 15, 'ID', 'ID',10,10,1,0,'','',20,'',0,null,0) ; 

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2000, 'Active Subscriber Details', 15, 'END_VALUE', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2001, 'IMSI Subscriber', 15, 'END_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2002, 'IMEI Subscriber', 15, 'END_VALUE', 3, 'IMEI', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2003, 'Account Name Subscriber', 15, 'END_VALUE', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (2005, 'Geographic Position CDR', 15, 'END_VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
		category) values (expandable_field_maps_seq.nextval, 'Phone Number Blacklist Subscriber', 15, 'END_VALUE', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

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
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in 
    --  Bug Details :  Providing audit_log_event_code value for reset workflow 
    --  Impacts     :  Audit logs
	insert into audit_log_event_codes values(900,'Reset Workflow','Workflow ''$1'' reset',44);
--<END>

--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in 
    --  Bug Details :  Providing providing entity type for import 
    --  Impacts     :  Audit logs
	insert into entity_types (id,entity_description) values (9021,'Import');
--<END>

--<START>
    --  Files       :  nikira-DDL-db.sql.parse.in
    --  Bug Details :  Adding a column for providing script name in table_names table 
    --  Impacts     :  rating loader 
	create table table_names_tmp as select * from table_names ;
	truncate table table_names ;
	alter table table_names add script_name varchar2(512) not null ;
	insert into table_names select id,NAME,DESCRIPTION,CONTROL_FILE, 'default_loader.sh' from table_names_tmp ;
	drop table table_names_tmp ;
--<END>


--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in 
    --  Bug Details :  providing script names 
    --  Impacts     :  Rating loader 
	insert into table_names values(table_names_seq.nextval, 'RATER_COUNTRY_CODES', 'Country Codes', 'rater_country_codes.ctl','default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'zone_codes', 'Zone Codes', 'zone_codes.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'time_zone_rate_types', 'Time Zone Rate Types', 'time_zone_rate_types.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'sdr_rates', 'Sdr Rates','sdr_rates_tmp.ctl', 'sdr_rates_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_types', 'Rate Types', 'rate_types.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rater_special_numbers_tmp', 'Rater Special Numbers', 'rater_special_numbers_tmp.ctl', 'rater_special_numbers_loader.sh');
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_plans', 'Rate Plans', 'rate_plans.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_per_calls', 'Rate Per Calls', 'rate_per_calls.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'org_dest_links', 'Origination Destination Links', 'org_dest_links.ctl', 'default_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'free_numbers_tmp', 'Free Numbers', 'free_numbers_tmp.ctl', 'free_number_loader.sh') ;
	Insert into table_names values(TABLE_NAMES_SEQ.nextval, 'default_rates', 'Default Rates', 'default_rates.ctl', 'default_loader.sh') ;
--<END>


--<START>
    --  Files       :  drop-nikira-DDL-rater.sql
    --  Bug Details :  dropping temp tables 
    --  Impacts     :  rating loader 
	DROP TABLE RATER_SPECIAL_NUMBERS_TMP;
	DROP TABLE SDR_RATES_TMP;
	DROP TABLE FREE_NUMBERS_TMP;
--<END>

--<START>
    --  Files       :  nikira-DDL-rater.sql.parse.in
    --  Bug Details :  Brininging in the required db changes for rater scripts 
    --  Impacts     :  rating loader 

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
		   NETWORK             varchar2(64)
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
		update rate_per_calls set DESCRIPTION = 'Default Description' DESCRIPTION = NULL;
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
		alter table  time_zone_rate_types modfiy START_TIME              DATE NOT NULL;
		alter table  time_zone_rate_types modfiy END_TIME                DATE NOT NULL;
		alter table  time_zone_rate_types modfiy SERVICE_CATEGORY        VARCHAR2(64) NOT NULL;
		alter table  time_zone_rate_types modfiy NATIONAL_FLAG           VARCHAR2(64) NOT NULL;

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
		alter table country_codes modify DESCRIPTION  VARCHAR2(64) NOT NULL;
		
		
--<END>


--<START>
    --  Files       :  nikira-DML-packages-procedures.sql
    --  Bug Details :  compiling the functions required for rating 
    --  Impacts     :  rating loader 
	@../import-functions.sql
--<END>


--<START>
    --  Files       :  nikira-DDL-db.sql.parse.in
    --  Details 	:  Time window with inconsitent precisions
    --  Impacts     :  finger print rules
	
	CREATE OR REPLACE VIEW FP_ELEMENTS_V AS
	(
		SELECT
			FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID, 
			FC.NAME AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, 
			ROUND(T.DURATION / 86400, 6) AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
		FROM
			FP_ELEMENTS FE, FIELD_CONFIGS FC, RULES R, THRESHOLDS T
		WHERE
			FE.FIELD_ID = FC.FIELD_ID AND FE.RECORD_CONFIG_ID = FC.RECORD_CONFIG_ID AND FE.FIELD_ID IS NOT NULL AND FE.IS_ACTIVE = 1
				AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE =1 AND T.RULE_KEY = R.KEY AND T.RULE_VERSION = R.VERSION 
				AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
		UNION ALL
		SELECT
				FE.ID, FE.NAME, FE.DESCRIPTION, FE.ENTITY_ID, FE.ELEMENT_TYPE, FE.RECORD_CONFIG_ID, FE.FIELD_ID,  
		' ' AS ELEMENT_NAME, FE.RULE_KEY, R.PSEUDO_FUNCTION_ID AS FUNCTION, 
		ROUND(T.DURATION / 86400, 6) AS TIME_WINDOW, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS
		FROM
			FP_ELEMENTS FE, RULES R, THRESHOLDS T
		WHERE
			FE.FIELD_ID IS NULL AND FE.IS_ACTIVE = 1
				AND FE.RULE_KEY = R.KEY AND R.IS_ACTIVE = 1 AND T.RULE_KEY = R.KEY  AND T.RULE_VERSION = R.VERSION
				AND T.THRESHOLD_ID=0 AND T.AGGREGATION_VALUE IS NULL
	);
--<END>


--<START>
    --  Files       :  nikira-DML-exec.sql.parse.in 
    --  Details 	: 
    --  Impacts     : 

insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'UPDATE_PREPAID_BALANCE.INTERVAL', '0');


--<END>

--<START>
    --  Files       : nikira-DML-exec.sql.parse.in, drop-nikira-DDL-db.sql.in, nikira-DDL-db.sql.parse.in 
    --  Details 	: changes for record loader to run with DB2
    --  Impacts     : record loader 

	DROP TABLE ALARM_RECORD_LOADER_SYNC ;
	DELETE FROM CONFIGURATIONS WHERE CONFIG_KEY = 'SYNC_KEY_FOR_ALARM_AND_RECORDLOADER' ;
	insert into configurations (id, config_key, value) values (configurations_seq.nextval,'LOADER.DB_ERROR_RETRY_SLEEP_SECONDS', '30');
	insert into configurations (id, config_key, value) values (configurations_seq.nextval,'LOADER.DB_ERROR_RETRY_ATTEMPTS', '20');
--<END>

--<START>
    --  Files       : generateRTFEntitySummary.sql.parse.in 
    --  Details 	: changed to run with DB2 as well 
    --  Impacts     : Rule test facility

	@../generateRTFEntitySummary.sql
--<END>

commit ;

/

quit;
