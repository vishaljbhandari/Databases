delete from expandable_field_maps where id in (210,211) ;

delete from record_view_configs where id = 121 ;

delete from field_record_config_maps where record_config_id = 96;

delete from record_configs_rules where record_config_id = 96;

delete from field_configs where record_config_id = 96;

delete from CONFIGURATIONS where config_key = 'NETFLOWIDIncrement' ;

delete from CONFIGURATIONS where config_key = 'CLEANUP.RECORDS.NETFLOW.OPTIONS';

delete from DBWRITER_CONFIGURATIONS where id = 8 ;

delete from REFERENCE_TYPES_MAPS where aggregation_type = 5001 ;

delete from agg_type_pseudo_functions where aggregation_type_id = 5001 ;

delete from aggregation_types_maps where source_aggregation = 5001 ;


delete from counter_maps where aggregation_type = 5001 ;

delete from counter_manager_mappings where aggregation_type_id = 5001 ;

delete from counter_details where TABLE_NAME = 'NETFLOW_COUNTER' ; 

delete from aggregation_types where id = 5001 ;

delete from reference_types where id = 7 ;

delete from pseudo_functns_record_configs where record_config_id = 96 ;

delete from field_categories where id = 5001 ;

delete from rc_record_configs where record_config_id = 96 ;

delete from archive_maps where record_config_id = 96;

delete from record_configs where id = 96 ;

delete from ranger_groups_tasks where task_id in (GetParentID('NetFlow Rule Creation'), GetParentID('NetFlow Template Creation'), GetParentID('Netflow')) ;

delete from tasks where link = '/record_view/list/121?fetch_records=false' ;

delete from tasks where name = 'NetFlow Rule Creation' ;
delete from tasks where name = 'NetFlow Template Creation' ;

update field_categories set category = null where id in (7,205);
update field_categories set category = 'NICKNAME HOTLIST CHANGE_EVENT' where id = 3;
update field_categories set category = 'NICKNAME HOTLIST' where id = 4;
update field_categories set category = 'HOTLIST' where id = 14;
update field_categories set category = 'NICKNAME' where id = 54;

-----Adding new data stream called NETFLOW
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned)
	values(96 ,'NETFLOW','Netflow',1,'ACCOUNT_NAME',1, '|', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY', 0) ;

insert into record_view_configs (id, name, record_config_id, order_by, is_visible, is_cell_specific, is_pagination_enabled,
	is_primary_view, is_logging_enabled ) values (121, 'Netflow', 96, 'ID DESC', 1, 0, 1, 1, 1);

	----Adding the fields for the new data streaM
insert into field_configs (id,record_config_id,name,database_field,field_id,position,data_type,is_expandable,ds_category,query_field,width,translation_id,is_visible,is_filter,reg_exp_id,derivative_function) values (field_configs_seq.nextval,96,'ID','ID', 0,0,8, 0 , '', '', 20, null, 0, 0, '', '30') ;

insert into field_configs (id, record_config_id, name,
	database_field,field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible,
	is_filter,reg_exp_id,derivative_function) values (field_configs_seq.nextval,	96,'Account Name','ACCOUNT_NAME',
	1, 1, 3, 0 , '', '', 20, null,1, 1, 8, '') ;

insert into field_configs (id, record_config_id,
	name,database_field,field_id,position,data_type,is_expandable,ds_category,query_field, width,
	translation_id,is_visible,is_filter,reg_exp_id,derivative_function) values ( field_configs_seq.nextval, 96,
	'Protocol','PROTOCOL', 2, 2, 3, 0 , '', '', 20, null, 1,1, 8, '') ;

insert into field_configs (id,
	record_config_id,name,database_field,field_id,position,data_type,format,is_expandable,ds_category,
	query_field,width,translation_id,is_visible, is_filter,reg_exp_id,derivative_function) values (field_configs_seq.nextval,
	96, 'Date','NETFLOW_DATE', 3, 3, 4, '', 0, '', '', 20, null, 1,1, '',  '') ;

insert into field_configs (id, record_config_id,name,database_field,field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id,
	is_visible,is_filter,reg_exp_id, derivative_function) values (field_configs_seq.nextval, 96, 'Total Upload Volume (KB)',
	'TOTAL_UPLOAD_VOLUME', 4, 4, 2, 0 , '', '', 20, null, 1, 1, '', '') ;

insert into field_configs(id, record_config_id,	name,database_field,field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id,
	is_visible,is_filter,reg_exp_id, derivative_function) values ( field_configs_seq.nextval, 96, 'Total Value/Cost',
	'TOTAL_VALUE_COST', 5, 5, 2, 0 , '', '', 20, null,1, 1, '', '') ;

Insert into FIELD_CONFIGS (ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
	values ( field_configs_seq.nextval,96,'Network ID','NETWORK_ID',6,0,1,null,1,null,6,null,null,1,20,null,null,null,null,0);

Insert into FIELD_CONFIGS
(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
values (field_configs_seq.nextval , 96,'Source','SOURCE',7,0,0,null,3,null,7,null,null,0,255,null,null,null,null,0) ;

Insert into FIELD_CONFIGS
(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
values (field_configs_seq.nextval , 96,'Groups','',8,0,0,null,7,null,8,null,null,0,257,null,null,null,null,0) ;


Insert into FIELD_CONFIGS
(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
values (field_configs_seq.nextval , 96,'Day of Year','DAY_OF_YEAR',null,0,0,null,1,null,9,null,null,0,20,null,null,'1',null,0) ;

Insert into FIELD_CONFIGS
(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
values (field_configs_seq.nextval , 96,'Hour of Day','HOUR_OF_DAY',null,0,0,null,1,null,10,null,null,0,20,null,null,'12',null,0) ;

	
----New Aggregation type i.e: Account Name
insert into aggregation_types (ID, DESCRIPTION) values (5001, 'Account Name') ;

----Inserting the field categories for NETFLOW
insert into field_categories(id, name, category,
data_type,regular_expression_id,common_category_id,maskable_positions,is_maskable) values( 5001, 'Account Name',
'AGGREGATION_TYPE NICKNAME HOTLIST MANUAL_ALARM_AGGREGATION_TYPE', 3,'8', '', '' , '' );

insert into aggregation_types_maps ( id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id)
	values ( 14, 5001, 0, 203, 4);
	
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,1,96,'0');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,5,96,'6');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,203,96,'8');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,5001,96,'1');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,13,96,'3');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,17,96,'5');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,50,96,'4');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,23,96,'9');
Insert into FIELD_RECORD_CONFIG_MAPS (ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values (FIELD_RECORD_CONFIG_MAP_SEQ.nextval,46,96,'10');


insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE, COUNTER_CATEGORY) values (8, 'NETFLOW_COUNTER',8, 2000, 0) ;

insert into counter_manager_mappings(counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (8,1,5001, 96 );

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 96, 1, 1) ;	
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 96, 2, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 96, 6, 1) ;

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5001, 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5001, 3);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5001, 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5001, 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5001, 12);

insert into pseudo_functns_record_configs ( pseudo_function_id, record_config_id ) values (1, 96);
insert into pseudo_functns_record_configs ( pseudo_function_id, record_config_id ) values (3, 96);
insert into pseudo_functns_record_configs ( pseudo_function_id, record_config_id ) values (6, 96);
insert into pseudo_functns_record_configs ( pseudo_function_id, record_config_id ) values (10, 96);
insert into pseudo_functns_record_configs ( pseudo_function_id, record_config_id ) values (12, 96);


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3', GetParentID('Add Rule'), 'NetFlow Rule Creation', '', 0, 0) ;

insert into ranger_groups_tasks (task_id, ranger_group_id) values (tasks_seq.currval, 2);

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3', GetParentID('Add Template'), 'NetFlow Template Creation', '', 0, 0) ;

insert into ranger_groups_tasks (task_id, ranger_group_id) values (tasks_seq.currval, 2) ;

insert into rc_record_configs(ID,RECORD_CONFIG_ID,TASK_ID,CATEGORY) values (17, 96, GetParentID('NetFlow Rule Creation'), 'RULE') ;
insert into rc_record_configs(ID,RECORD_CONFIG_ID,TASK_ID,CATEGORY) values (18, 96, GetParentID('NetFlow Template Creation'), 'TEMPLATE') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values
(tasks_seq.nextval,'0',GetParentID('Record View'), 'Netflow', '/record_view/list/121?fetch_records=false', 0, 1);

insert into ranger_groups_tasks (task_id, ranger_group_id) values (tasks_seq.currval, 2);


insert into reference_types(id, description, record_config_id) values (7, 'Account Netflow' , 96);

Insert into REFERENCE_TYPES_MAPS (ID,REFERENCE_TYPE,REFERENCE_VALUE_CATEGORY_ID,REFERENCE_CATEGORY_ID,AGGREGATION_TYPE) values (REFERENCE_TYPES_MAPS_SEQ.nextval,7,5001,24,5001);

insert into record_configs_rules(rule_id , record_config_id ) values (6,96);
insert into record_configs_rules(rule_id , record_config_id ) values (7,96);

Insert into DBWRITER_CONFIGURATIONS
(ID,RECORD_CONFIG_ID,MAX_RECS_PER_SUBPARTITION,MAX_SUBPARTITIONS,CURRENT_PARTITION_INFO,RECORDS_PROCESSED,RECORD_COMMIT_COUNT,ACCEPTABLE_FUTURE_DAYS,PARTITION_BUFFER_DAYS,IS_BATCH_LOAD_ENABLED,BATCH_SIZE,CURRENT_BATCH_INFO,LAST_PROCESSED_FILE,LAST_PROCESSED_RECORD_NUMBER,BATCH_TIME_OUT_VALUE,MAX_WAIT_TIME,RESERVED_SUBPARTITIONS)
values
(8,96,1000,22,'0:0:0',0,1,1,0,0,1,null,'',5,1800,120,'22,23');

Insert into CONFIGURATIONS (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'NETFLOWIDIncrement','1',1);
Insert into CONFIGURATIONS (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'CLEANUP.RECORDS.NETFLOW.OPTIONS','1970/01/01 00:00:00,30',1);

Insert into EXPANDABLE_FIELD_MAPS
(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values
(210,'Alarm-Account Info',10,'REFERENCE_VALUE',4,'ACCOUNT_NAME',7,0,'RECORD_VIEW ALARM_DETAILS',0) ;

Insert into ARCHIVE_MAPS (ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values (9,'ARCHIVED_NETFLOW','ARCHIVED_NETFLOW',96);

commit;
quit;
	
