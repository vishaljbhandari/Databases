spool nikira-DML-enable-disable-feature.log
set serveroutput off ;
set feedback off ;

delete from tasks where id in ((select id from tasks where name ='Online Statistical Rules' and parent_id = 1615), (select id from tasks where name ='Offline Statistical Rules' and parent_id = 1615)) ;

delete from  FEATURE_TASK_MAPS ;
delete from  RECORD_CONFIG_TASK_MAPS ;
delete from  FEATURE_SCHEDULER_MAPS ;
delete from  FEATURE_PSEUDO_FUNCTN_MAPS ;
delete from  FEATURE_ACTION_MAPS ;
delete from  FEATURE_RULE_MAPS ;
delete from  FEATURE_ELEMENT_TYPE_MAPS ;
delete from  FEATURE_FP_ENTITIES_MAPS ;
delete from FEATURE_CONF_TAKS ;
delete from  FEATURE_CONFIGURATIONS ;
delete from FEATURE_REPORT_MAPS ;
delete from  FEATURE_STATUS ;
delete from AGG_RECORD_CONFIG_MAPS ;

--TODO correct in core setup.
update translations set value='select id as Key, description as Value from record_configs where is_visible = 1 and status = 1 order by description ' where tr_id = 15 ;
update translations set value='select id as Key, description as Value from record_configs where is_visible = 1 and status =1 and category like ''%NAMED_FILTERS%'' order by description' where tr_id = 49 ;

update translations set value='select id as Key, description as Value from record_configs where category like ''%PROFILE_FIELD%'' and status =1 order by description' where tr_id = 71 ;

update translations set value='select id as key, description as value from record_configs where status =1 and id in (select distinct record_config_id from rc_record_configs where category = ''RULE'' or category = ''TEMPLATE'') order by description' where tr_id = 86 ;

update translations set value='select id as key, description as value from record_configs where status =1 and id in (select distinct record_config_id from rc_record_configs where category = ''RULE'' or category = ''TEMPLATE'') order by description' where tr_id = 526 ;

update translations set value='select id as Key, description as Value from record_configs where status =1 and category like ''%CUSTOMER_ALERT%'' and description not in (''N/A'','' '') order by description' where tr_id = 705 ;

update translations set value='select id as Key, description as Value from record_configs rc where rc.category like ''%PROFILE_FIELD%'' and rc.id = id and rc.status = 1 ' where tr_id = 548 ;

update translations set value='select rvc.id as key , rvc.name as value from record_view_configs rvc, record_configs rc where rc.id = rvc.record_config_id and status =1 and  is_advanced_query_enabled = 1' where tr_id = 521 ;

update translations set value='select id as key, description as Value from record_configs where status = 1 and id in (select PRECHECK_RECORD_CONFIG_ID from precheck_record_configs)' where tr_id = 560 ;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select id from aggregation_types where status = 0 ) and  upper(category) like ''%AGGREGATION_TYPE%''' where tr_id = 124 ;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select id from aggregation_types where status = 0 ) and ( upper(category) like ''%MANUAL_ALARM%'' or   upper(category) like ''%AGGREGATION_TYPE%'' or upper(category) like ''%STATS_RULE_AGG_TYPE%'') order by name' where tr_id = 12;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select id from aggregation_types where status = 0 ) and  upper(category) like ''%AGGREGATION_TYPE%''' where tr_id = 124;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select ffem.FP_ENTITY_ID from feature_fp_entities_maps ffem, feature_configurations fc, feature_status fs where fs.id = fc.feature_id and ffem.feature_conf_id = fc.id and fs.name=''Statistical_Rules_Online'' and fc.status = 0 intersect select ffem.FP_ENTITY_ID from feature_fp_entities_maps ffem, feature_configurations fc, feature_status fs where fs.id = fc.feature_id and ffem.feature_conf_id = fc.id and fs.name=''Statistical_Rules_Offline'' and fc.status=0) and upper(category) like ''%STATS_RULE_AGG_TYPE%'' order by name' where tr_id = 525 ;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select ffem.FP_ENTITY_ID from feature_fp_entities_maps ffem, feature_configurations fc, feature_status fs where fs.id = fc.feature_id and ffem.feature_conf_id = fc.id and fs.name=''Finger_Print_Profile'' and fc.status = 0 ) and upper(category) like ''%FINGERPRINT_RULE_AGG_TYPE%'' order by name' where tr_id = 546 ;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select id from aggregation_types where status = 0 ) and category like ''%CUSTOMER_ALERT_AGG_TYPE%'' order by name' where tr_id = 706 ;

update translations set value='select id as Key, name as Value from field_categories where id not in ( select id from aggregation_types where status = 0 ) and upper(category) like ''%AUTO_THRESHOLD%'' order by name' where tr_id = 115 ;

update translations set value='select id as Key, name as Value from pseudo_functions where id!=0 and id not in (select fpfm.PSEUDO_FUNCTION_ID from FEATURE_PSEUDO_FUNCTN_MAPS fpfm, feature_status fs where fs.id = fpfm.feature_id and status = 0 and fpfm.PSEUDO_FUNCTION_ID not in (select fpfm.PSEUDO_FUNCTION_ID from FEATURE_PSEUDO_FUNCTN_MAPS fpfm, feature_status fs where fs.id = fpfm.feature_id and status = 1) and fpfm.PSEUDO_FUNCTION_ID not in (select PSEUDO_FUNCTION_ID from PSEUDO_FUNCTNS_RECORD_CONFIGS where PSEUDO_FUNCTION_ID = 26 and record_config_id not in (3,4,160)))' where tr_id = 66 ;

update translations set value='select id as Key, description as Value from fp_entities where id in (select ffem.FP_ENTITY_ID from FEATURE_FP_ENTITIES_MAPS ffem, FEATURE_CONFIGURATIONS fc where fc.id = ffem.FEATURE_CONF_ID and fc.status = 1) order by description' where tr_id = 72 ;

update translations set value='select id as Key, description as Value from record_configs where is_visible = 1 and id in (select record_config_id from fp_entities where category <> ''FP_ONLY'' and id in (select ffem.FP_ENTITY_ID from FEATURE_FP_ENTITIES_MAPS ffem, FEATURE_CONFIGURATIONS fc where fc.id = ffem.FEATURE_CONF_ID and fc.status = 1)) order by description' where tr_id = 545 ;

update translations set value='select id as Key, description as Value from record_configs where is_visible = 1 and category like ''%FINGERPRINT_RULE_ENTITY_TYPE%'' and id in (select record_config_id from fp_entities where category <> ''SR_ONLY'' and id in (select ffem.FP_ENTITY_ID from FEATURE_FP_ENTITIES_MAPS ffem, FEATURE_CONFIGURATIONS fc where fc.id = ffem.FEATURE_CONF_ID and fc.status = 1)) order by description' where tr_id = 544 ;

update translations set value='select id as Key, entity_description as Value from entity_types where id not in ( select fet.entity_type_id from FEATURE_ENTITY_TYPES fet, feature_status fs where fs.id = fet.feature_id and fs.status =0 and fet.entity_type_id not in (select fet.entity_type_id from FEATURE_ENTITY_TYPES fet, feature_status fs where fs.id = fet.feature_id and fs.status = 1))' where tr_id = 20 ;

update translations set value='select id as Key, description as Value from source where id not in (select fso.SOURCE_ID from FEATURE_SOURCES fso, feature_status fs where fs.id = fso.feature_id and fs.status = 0 and fso.SOURCE_ID not in ( select fso.SOURCE_ID from FEATURE_SOURCES fso, feature_status fs where fs.id = fso.feature_id and fs.status =1))' where tr_id = 62 ;

update translations set value='select id as Key, description as value from audit_log_event_codes where id not in ( select fac.audit_log_event_codes_id from feature_audit_codes fac, feature_status fs where fs.id = fac.feature_id and status = 0)' where tr_id = (select id from translation_indices where description='Event Code') ;

update translations set value='select id as Key, name as Value from field_categories where ( upper(category) like ''%MANUAL_ALARM%'' or   upper(category) like ''%AGGREGATION_TYPE%'' or upper(category) like ''%STATS_RULE_AGG_TYPE%'') and id not in (select id from aggregation_types where status=0) order by name' where tr_id = 528 ;

--New task entries made for online and offline statistical rules.
insert into tasks values(tasks_seq.nextval,1615, 'Online Statistical Rules', '/statistical_rule/online/94', 0,0,'0','') ;
insert into tasks values(tasks_seq.nextval,1615, 'Offline Statistical Rules', '/statistical_rule/online/94', 0,0,'0','') ;

--Correcting customer alert notification for LTE_IMSI and WIFI_ID
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID(' Add Rules'), 'LTE Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into rc_record_configs (select rc_record_configs_seq.nextval, 3, id, 'TEMPLATE' from tasks where name = 'Subscriber Template Creation') ;
update record_configs set status = 1 ; 
update AGGREGATION_TYPES set status = 1 ;
--TODO : update the file with create table record configs and see if update is required or status can be inserted

	--Aggregation types per record config
		--Subscriber UID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 83, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6011, 505, 1);
		--LTE IMSI
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6013, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6013, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6013, 505, 1);
		--Unique Identitfication Number
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 226, 160, 1);
		--Employee Code
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 71, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 72, 1);
		--Internal ID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 71, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 72, 1);
		--Internal User ID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 213, 71, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 213, 72, 1);
		--VPMN
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 200, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 200, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 200, 505, 1);
		--WIFI ID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6014, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6014, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 6014, 505, 1);
		--Charging ID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 54, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 54, 505, 1);
		--User name
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 225, 83, 1);
		--Account Name
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 505, 1);
		--Phone Number
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 71, 1);
		--IMEI Number
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 3, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 3, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 3, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 3, 505, 1);
		--IMSI Number
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 4, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 4, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 4, 3, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 4, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 4, 505, 1);
		--Geographic Position
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 14, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 14, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 14, 505, 1);
		--Subscriber ID
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 1, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 2, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 7, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 83, 1);
insert into AGG_RECORD_CONFIG_MAPS values(AGG_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 505, 1);
									   -- in all the inserts for record configs.


--1) Precheck enable/disable by default the feature is enabled.
------------------------------------------------------------------------------------------------------------------------------------------
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Precheck', 1, NULL) ;

  --Precheck entries visible in GUI
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Subscriber Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Create Subscriber Precheck') ) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Add Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Account Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Precheck Lists')) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Normal Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Bulk Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Precheck Fields')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify Subscriber Precheck Entry')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Subscriber Precheck Entry')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Multiple Precheck Lists')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Show Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='On Demand Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Precheck I2 Fields')) ;

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 98, (select id from tasks where name='Subscriber Precheck List') ) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 98, (select id from tasks where name='Create Subscriber Precheck')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 124, (select id from tasks where name='Add Precheck List')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 99, (select id from tasks where name='Account Precheck List')) ;

  --Precheck entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Bitmap Index Rebuild', NULL) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Bitmap Index Cleanup', NULL) ;

  --Precheck entries visible in Alarm analyst actions
insert into FEATURE_ACTION_MAPS values(FEATURE_ACTION_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from ANALYST_ACTIONS where name='Move to Subscriber Precheck list')) ;

  --Precheck entries for entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Precheck Details')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Precheck Fields')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Bulk Manual Precheck')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Precheck List')) ;

  --Precheck entires for sources
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Account/Subscriber Precheck Details Added'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Subscriber Precheck Details Added'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Bulk Manual Precheck'));

  --Entries for Audit log Filter event code

  --Precheck pseudo function
BEGIN
FOR ids in ( select id,name from pseudo_functions where CATEGORY like '%PRECHECK%')
LOOP
insert into FEATURE_PSEUDO_FUNCTN_MAPS values(FEATURE_PSEUDO_FUNCTN_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, ids.id) ;
END LOOP;
END ;
/

--2) Statistical Rules enable/disable by default the feature is enabled.
------------------------------------------------------------------------------------------------------------------------------------------

  --Online Statistical configurations
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Statistical_Rules_Online', 1, null) ;

	--Online Statistical Rules fp entity enable/disable by default the feature is enabled.
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Profile Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval, (select id from tasks where name='Statistical Rules') ) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Add Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Show Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Export Statistical Rules')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Import Statistical Rules')) ;

	--Entities for statistical
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Online_Aggregate_On_Account',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Account')) ;
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Online_Aggregate_on_Subscriber', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Subscriber')) ;
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Online_Aggregate_on_Imei', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='IMEI')) ;
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Online_Aggregate_on_Other_Party_Number', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='OtherParty Number')) ;
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Online_Aggregate_On_Internal_Users',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Internal User')) ;
	--Entries for Statistical entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION)='Statistical Rule Element')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION)='Statistical Rule')) ;

  --entires for sources
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Profile Element'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Statistical Rule Element'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Statistical Rule'));

  --Offline Statistical configurations
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Statistical_Rules_Offline', 1, 0) ;

	--Offline Statistical Rules fp entity enable/disable by default the feature is enabled.
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Profile Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval, (select id from tasks where name='Statistical Rules') ) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Add Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Show Statistical Rule')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Export Statistical Rules')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Import Statistical Rules')) ;


	--Entities and scheduler configurations for offline statistical
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Offline_Aggregate_On_Account',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Account')) ;
  		--Statistical entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_7_0', FEATURE_CONFIGURATIONS_SEQ.currval);

insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Offline_Aggregate_on_Subscriber', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Subscriber')) ;
  		--Statistical entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_2_0', FEATURE_CONFIGURATIONS_SEQ.currval);

insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Offline_Aggregate_on_Imei', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='IMEI')) ;
  		--Statistical entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_3_0', FEATURE_CONFIGURATIONS_SEQ.currval);

insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Offline_Aggregate_on_Other_Party_Number', FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='OtherParty Number')) ;
  		--Statistical entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_44_0', FEATURE_CONFIGURATIONS_SEQ.currval);

insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'Offline_Aggregate_On_Internal_Users',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Internal User')) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_214_0', FEATURE_CONFIGURATIONS_SEQ.currval);
  		--Statistical entries visible in Scheduler

	--Entries for Statistical entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION)='Statistical Rule Element')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION)='Statistical Rule')) ;

  --entires for sources
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Profile Element'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Statistical Rule Element'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Statistical Rule'));

--3) Fingerprint enable/disable by default the feature is enabled.
------------------------------------------------------------------------------------------------------------------------------------------
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Finger_Print_Profile', 1, NULL) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Profile Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Suspect eFingerprints'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='eFingerprint Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='New eFingerprint Rule'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Copy eFingerprint Rule'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Show eFingerprint Rule'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify eFingerprint Rule'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete eFingerprint Rule'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Multiple eFingerprint Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Export eFingerprint Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Import eFingerprint Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='eFingerprint Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/102'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/83'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/3'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/12'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/105'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/100'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='View eFingerprint Profile' and  link ='/fp_profile/show_fp_profile/21'));

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/83'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/102'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/21'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/3'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/12'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Profile Match' and  link ='/fingerprint_rule/manual_profile_match/100'));

  --Finger print entries visible in Alarm analyst actions
insert into FEATURE_ACTION_MAPS values(FEATURE_ACTION_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from ANALYST_ACTIONS where name='Move to Profile Match list')) ;

  --Finger print requires only match elements
insert into FEATURE_ELEMENT_TYPE_MAPS values(FEATURE_ELEMENT_TYPE_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from fp_element_types where name='Match')) ;

	--Subscriber entity for Efingerprint 
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'EFP_Aggregate_On_Subscriber',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval,  (select id from fp_entities where description='Subscriber')) ;
		--Tasks related to efp configurations 
insert into FEATURE_CONF_TAKS values(FEATURE_CONF_TAKS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from tasks where name='Subscriber' and  link ='/fp_configuration/show/2'));
  		--efp entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_2_0', FEATURE_CONFIGURATIONS_SEQ.currval);

	--Internal User entity for Efingerprint 
insert into FEATURE_CONFIGURATIONS values(FEATURE_CONFIGURATIONS_SEQ.nextval, 'EFP_Aggregate_On_Internal_Users',FEATURE_STATUS_SEQ.currval, 1) ;
insert into FEATURE_FP_ENTITIES_MAPS values(FEATURE_FP_ENTITIES_MAPS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from fp_entities where description='Internal User')) ;
		--Tasks related to efp configurations 
insert into FEATURE_CONF_TAKS values(FEATURE_CONF_TAKS_SEQ.nextval, FEATURE_CONFIGURATIONS_SEQ.currval, (select id from tasks where name='Internal User' and  link ='/fp_configuration/show/214'));
  		--efp entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Profile Manager_214_0', FEATURE_CONFIGURATIONS_SEQ.currval);

  --entries for entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'eFingerprint Configuration')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'eFingerprint Element')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'eFingerprint Rule')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Suspect eFingerprint Configuration')) ;

  --entires for sources
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Profile Element'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='eFingerprint Configuration'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='eFingerprint Rule'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Suspect eFingerprints'));

--4) I2 feature 
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'I2', 1, NULL) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='I2 Task')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='I2 Alarm Link')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='I2 CDR Link')) ;

--Scheduel Entries 
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Alarm Link Executor', NULL) ;

  --entries for entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'I2 Link Chart')) ;

  --Precheck entires for sources
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='I2 Link Chart'));


--5) RTF feature
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'RTF', 1, NULL) ;

insert into FEATURE_REPORT_MAPS values(FEATURE_REPORT_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from reports where name ='RuleTestFacilitySummary')) ;

insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'RTF Entity Summary', NULL) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'RTF Run Cleaner', NULL) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Disable Online Test Rules', NULL) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Archive RTF Data', NULL) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Rule Test Facility'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Move Production Rule To Test' and  link ='/rule/move_production_rule_to_test_rule/52'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Test Rules' and link = '/test_rule/list_test_rule/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Test Alerts' and link = '/test_alert/list_test_alerts/124'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Add Test Rule' and link = '/test_rule/new_rule/128;/test_rule/new/128;'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Show Test Rule' and link =  '/test_rule/show'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Modify Test Rule' and link =  '/test_rule/edit'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Delete Test Rule' and link =  '/test_rule/destroy;/test_rule/multiple_delete/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Delete Test Alert' and link =  '/test_alert/destroy;/test_alert/multiple_delete/124'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Assign Test Rule Tags' and link =  '/test_rule/tag_multiple/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Manage Test Rule Tags' and link =  '/test_rule/manage_rule_tags/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'On-demand Test Run History'and link =  '/test_rule/ondemand_run_history/128;/test_rule/back_to_test_rule_page/123;/test_rule/compare_ondemand_runs/123'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Promote Test Rule To Production' and link =  '/test_rule/move_test_rule_to_production/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Offline Online Test Run History' and link =  '/test_alert/show_test_run/124;/test_rule/compare_ondemand_runs/125;/test_rule/back_to_test_alert_page/125;/test_rule/compare_ondemand_runs/126;/test_rule/back_to_test_alert_page/126'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Show On-demand Test Run' and link =  '/test_rule/show_on_demand_history/128'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Delete On-demand Test Run' and link =  '/test_rule/destroy_ondemand_run;/test_rule/multiple_delete_ondemand_run/123'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'On-demand Test Run' and link =  '/test_rule/process_ondemand'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Manual Alarm' and link =  '/test_alert/create_test_alert_manual_alarm/124'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Online Test Rules' and link =  '/participation/list?rule_mode=3'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Online Test Rules' and link =  '/alarm_flooding_control/list?rule_mode=3'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Rule Test Facility Summary Report'));

  --entries for entity types
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'On-demand Test Run')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Test Alerts')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Test Rule Configuration')) ;

  --entries for source
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Rule Test Facility'));
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Rule Test Facility'));

  --entries for audit log event codes
insert into FEATURE_AUDIT_CODES values(FEATURE_AUDIT_CODES_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from AUDIT_LOG_EVENT_CODES where trim(DESCRIPTION)='Rule Instance Added From Test Rule')) ;

--6) Inline feature
update record_configs set status = 1 where id in (160, 170)  ; 
--TODO should be removed.

insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Inline_Module', 1, NULL) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Orders')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Filter on Non Indexed Fields' and link = '/non_index_filtering/160')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Filter using LIKE Operator' and link = '/filter_using_like_operator/160')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Bulk Data Viewer' and link = '/bulk_data_viewer/161')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Order Form Rule Creation' )) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Order Form Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Sort Across Pages' and link = '/field_config/sort_across_pages/161')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name='Order Form Customer Alert Rule Creation')) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Inline Rule Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Inline Rules' and link = '/inline_rule/list_rule_instance/152;/rule/compare_rules/53;/rule/back_to_rule_page/53;')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Inline Rule Templates' and link = '/inline_rule/list_rule_template/151')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Add Inline Rule' and link = '/inline_rule/new_rule/152;/inline_rule/new/152;')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Show Inline Rule' and link =  '/inline_rule/show')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Edit Inline Rule' and link = '/inline_rule/edit')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Copy Inline Rule' and link = '/inline_rule/copy')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Delete Inline Rule' and link =  '/inline_rule/destroy;/inline_rule/multiple_delete/152')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Assign Inline Rule Tags' and link = '/inline_rule/tag_multiple/152')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Manage Inline Rule Tags' and link = '/inline_rule/manage_rule_tags/152')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Add Inline Template' and link =  '/inline_rule/new_template/151')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Copy Inline Template' and link =  '/inline_rule/copy_template')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Modify Inline Template' and link =  '/inline_rule/edit_template')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Delete Inline Template' and link =  '/inline_rule/destroy_template;/inline_rule/destroy_multiple_templates/151')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Precheck Lists')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Add Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Normal Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Bulk Manual Precheck')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Modify Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Delete Multiple Precheck Lists')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Show Precheck List')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='On Demand Precheck')) ;
  --Precheck entries visible in Scheduler
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Bitmap Index Rebuild', NULL) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Bitmap Index Cleanup', NULL) ;

  --Precheck entries for Inline
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Bulk Manual Precheck')) ;
insert into FEATURE_ENTITY_TYPES values(FEATURE_ENTITY_TYPES_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from entity_types where trim(ENTITY_DESCRIPTION) = 'Precheck List')) ;

  --Precheck entries for Inline
insert into FEATURE_SOURCES values(FEATURE_SOURCES_SEQ.nextval, FEATURE_STATUS_SEQ.currval,(select id from source where trim(description)='Bulk Manual Precheck'));

  --Precheck pseudo function
BEGIN
FOR ids in ( select id,name from pseudo_functions where CATEGORY like '%PRECHECK%')
LOOP
insert into FEATURE_PSEUDO_FUNCTN_MAPS values(FEATURE_PSEUDO_FUNCTN_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, ids.id) ;
END LOOP;
END ;
/

--7) Prevea feature
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Prevea', 1, NULL) ;
insert into FEATURE_REPORT_MAPS values(FEATURE_REPORT_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, (select id from reports where name ='ExposureManagement')) ;
insert into FEATURE_SCHEDULER_MAPS values(FEATURE_SCHEDULER_MAPS_SEQ.nextval, FEATURE_STATUS_SEQ.currval, 'Prevea Exposure Management Summarization', NULL) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Risk Management' and link =  '/risk_management/')) ;
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name = 'Exposure Management Report')) ;

--8) Customer Notification enable/disable by default the feature is enabled.
------------------------------------------------------------------------------------------------------------------------------------------
insert into FEATURE_STATUS values(FEATURE_STATUS_SEQ.nextval, 'Customer_Notification', 1, NULL) ;

insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Order Form Customer Alert Rule Creation'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where name='Customer Alert Management'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where parent_id = GetParentID('Customer Alert Management') and name='Groups'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where parent_id = GetParentID('Customer Alert Management') and name='Grouping Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where parent_id = GetParentID('Customer Alert Management') and name='Customer Alert Rules'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where parent_id = GetParentID('Customer Alert Management') and name='Notification Templates'));
insert into FEATURE_TASK_MAPS values(FEATURE_TASK_MAPS_SEQ.nextval,FEATURE_STATUS_SEQ.currval,(select id from tasks where parent_id = GetParentID('Customer Alert Management') and name='Customer Notifications'));

--Internal Users data stream (configurations)
	--Internal users
update record_configs set status = 1 where id = 70 ; 
--TODO should be removed.

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where name='Internal User View')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where name='Internal User' and link='/record_view/list/83?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where name='Internal User' and  link='/fp_configuration/show/214')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where parent_id = GetParentID('Add Rule')  and  name='Internal Users Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where parent_id = GetParentID('Add Template')  and  name='Internal Users Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where parent_id = (select id from tasks where link like '/record_view/list/83%')  and  name='Manual Profile Match' and link='/fingerprint_rule/manual_profile_match/83')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 70, (select id from tasks where parent_id = (select id from tasks where link like '/record_view/list/83%')  and  name='View eFingerprint Profile' and link='/fp_profile/show_fp_profile/83')) ;

	--Adjustment Logs
update record_configs set status = 1 where id = 71 ; 
--TODO should be removed

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 71, (select id from tasks where name='Adjustment Logs' and link='/record_view/list/84?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 71, (select id from tasks where name='Bulk Data Viewer' and link='/bulk_data_viewer/85')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 71, (select id from tasks where parent_id = GetParentID('Add Rule')  and  name='Adjustment Logs Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 71, (select id from tasks where parent_id = GetParentID('Add Template')  and  name='Adjustment Logs Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 71, (select id from tasks where parent_id = GetParentID('Adjustment Logs')  and  link = '/field_config/sort_across_pages/84')) ;

	--CRM Logs
update record_configs set status = 1 where id = 72 ; 
--TODO should be removed

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 72, (select id from tasks where name='CRM Logs' and link='/record_view/list/85?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 72, (select id from tasks where name='Bulk Data Viewer' and link='/bulk_data_viewer/84')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 72, (select id from tasks where parent_id = GetParentID('Add Rule')  and  name='CRM Logs Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 72, (select id from tasks where parent_id = GetParentID('Add Template')  and  name='CRM Logs Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 72, (select id from tasks where parent_id = GetParentID('CRM Logs')  and  link = '/field_config/sort_across_pages/85')) ;

update AGG_RECORD_CONFIG_MAPS set status = 1 where record_config_id in (70,71,71) ; 
--TODO should be removed



--GPRS data stream (configurations)
update record_configs set status = 1 where id = 7 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 7 ; 
--TODO should be removed

insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 7, (select id from reports where name='GPRSRepeatedShortSessions')) ; 
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where parent_id = GetParentID('Add Rule')  and name = 'GPRS Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where parent_id = GetParentID('Add Template')  and name = 'GPRS Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where parent_id = GetParentID('Global Exceptions')  and link = '/global_exceptions/list/7?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where parent_id = GetParentID('GPRS', 'Global Exceptions')  and link = '/global_exceptions/edit/7')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where link = '/record_view/create_manual_alarm/7'));
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where link = '/high_cost_filtering/7')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where link = '/filter_using_pattern_searches/7')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where link = '/bulk_data_viewer/7')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where link = '/field_config/sort_across_pages/7')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where name='GPRS' and link = '/global_exceptions/list/7?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where name='GPRS' and link = '/record_view/list/7?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 7, (select id from tasks where name = 'GPRS Repeated Short Session Report')) ;

--IPDR data stream (configurations)
update record_configs set status = 1 where id = 83 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 83 ; 
--TODO should be removed

insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 83, (select id from reports where name='ISPCumulativeHighDuration')) ; 
insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 83, (select id from reports where name='ISPLongSessions')) ; 
insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 83, (select id from reports where name='ISPMultipleSimultaneousSessions')) ; 
insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 83, (select id from reports where name='ISPRepeatedShortSession')) ; 
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='IPDR' and link = '/record_view/list/104?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='Manual Alarm' and link = '/record_view/create_manual_alarm/104')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='Filter on Non Indexed Fields' and link = '/non_index_filtering/83')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='Bulk Data Viewer' and link = '/bulk_data_viewer/104')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='IPDR' and link = '/global_exceptions/list/83?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='Modify' and link = '/global_exceptions/edit/83')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='IPDR Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='IPDR Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='Sort Across Pages' and link = '/field_config/sort_across_pages/104')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='ISP Cumulative High Duration Report')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='ISP Long Sessions Report')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='ISP Multiple Simultaneous Sessions Report')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 83, (select id from tasks where name ='ISP Repeated Short Session Report')) ;

--Recharge Logs stream (configurations)
update record_configs set status = 1 where id = 2 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 2 ; 
--TODO should be removed

insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 2, (select id from reports where name='PrepaidHighFrequencyRecharge')) ; 
insert into REPORT_RECORD_CONFIG_MAPS values(REPORT_RECORD_CONFIG_MAPS_SEQ.nextval, 2, (select id from reports where name='PrepaidPINReuse')) ; 
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name ='Recharge Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name ='Recharge Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where parent_id = GetParentID('Global Exceptions') and name ='Recharge Logs' and link='/global_exceptions/list/2?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where parent_id = GetParentID('Recharge Logs', 'Global Exceptions') and name ='Modify' and link='/global_exceptions/edit/2')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Recharge Logs' and link='/record_view/list/2?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Account Recharge' and link='/record_view/list/6')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Manual Alarm' and link='/record_view/create_manual_alarm/2')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Apply High Cost Filters' and link='/high_cost_filtering/2')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Filter Using Pattern Searches' and link='/filter_using_pattern_searches/2')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Bulk Data Viewer' and link='/bulk_data_viewer/2')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Prepaid Top Ups' and link='/prepaid_top_up/list')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Add' and link='/prepaid_top_up/new/71')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Modify' and link='/prepaid_top_up/edit')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Show' and link='/prepaid_top_up/show')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Delete' and link='/prepaid_top_up/destroy')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Multiple Delete' and link='/prepaid_top_up/multiple_delete/71')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 2, (select id from tasks where name='Sort Across Pages' and link='/field_config/sort_across_pages/2')) ;

--Voice data stream (configuration)
update record_configs set status = 1 where id = 1 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 1 ; 
--TODO should be removed

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where name ='CDR Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where name ='CDR Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('Global Exceptions') and name ='CDR' and link='/global_exceptions/list/1?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Global Exceptions') and name ='Modify' and link='/global_exceptions/edit/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where name ='CDR' and link='/record_view/list/1?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Record View') and name ='Manual Alarm' and link='/record_view/create_manual_alarm/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Record View') and name ='Apply High Cost Filters' and link='/high_cost_filtering/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Record View') and name ='Filter Using Pattern Searches' and link='/filter_using_pattern_searches/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Record View') and name ='Bulk Data Viewer' and link='/bulk_data_viewer/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('CDR', 'Record View') and name ='Sort Across Pages' and link='/field_config/sort_across_pages/1')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 1, (select id from tasks where parent_id = GetParentID('I2 Task') and name ='I2 CDR Link' and link='i2_cdr_link')) ;

--NRTRDE vpmn info data stream (configuration)
update record_configs set status = 1 where id = 42 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 42 ; 
--TODO should be removed

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='HighUsagePerNetworkPerVPMN')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='PRSDestinationsCalledPerVPMN')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='VPMNTraffic')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='NRTRDE Partners' and link='/vpmn_info/list/49?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='Add NRTRDE Partner' and link='/vpmn_info/new/49')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='Modify NRTRDE Partner' and link='/vpmn_info/edit')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='Show NRTRDE Partner' and link='/vpmn_info/show')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='Delete NRTRDE Partner' and link='/vpmn_info/destroy')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 42, (select id from tasks where name ='Bulk Data Viewer' and link='/bulk_data_viewer/49')) ;

--LTE data stream (configuration)
update record_configs set status = 1 where id = 505 ; 
--TODO should be removed

update AGG_RECORD_CONFIG_MAPS set status =1 where record_config_id = 505 ; 
--TODO should be removed

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='LTE' and link='/record_view/list/505?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='LTE Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='LTE Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='Manual Alarm' and link='/record_view/create_manual_alarm/505')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='LTE' and link='/global_exceptions/list/505?show_enrichment=true')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='Modify' and link='/global_exceptions/edit/505')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 505, (select id from tasks where name ='Bulk Data Viewer' and link='/bulk_data_viewer/505')) ;

--Orders data stream (configuration)
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name ='Orders' and link='/record_view/list/161?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name ='Order Form Rule Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name ='Order Form Template Creation')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_SEQ.nextval, 160, (select id from tasks where name ='Order Form Customer Alert Rule Creation')) ;

spool off ;
