spool nikira-DML-new-record-config-orders.log
set feedback off ;
set serveroutput off ;

-- Record Config Creation
insert into record_configs (id, tname, description, cacheable, is_visible,category, delimeter)
	values(160,'ORDERS', 'Orders', 0, 1, 'INLINE_RULES PRECHECK RULE_TAGS NAMED_FILTERS', '|') ;

-- Field Config Entries
insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter,width, reg_exp_id, associated_field, derivative_function) values (field_configs_seq.nextval, 160, 'ID',                     'ID',              0, 0, 0, '', 8,  '', 1,   '', null, 0, 40,  '',    null,  '31') ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Order Number',                     'ORDER_NUMBER',              1, 0, 1, 'SMM.PRECHECK', 3,  '', 2,   '', null, 0, 40,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Unique Identification Number',                     'UNIQUE_ID_NO',              2, 0, 1, '', 3,  '', 3,   '', null, 1, 40,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'First Name',                       'FIRST_NAME',                3, 0, 1, 'SMM.PRECHECK', 3,  '', 4,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Middle Name',                      'MIDDLE_NAME',               4, 0, 1, 'SMM.PRECHECK', 3,  '', 5,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Last Name',                        'LAST_NAME',                 5, 0, 1, 'SMM.PRECHECK', 3,  '', 6,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Address Line 1',                   'ADDRESS_LINE_1',            6, 0, 1, 'SMM.PRECHECK', 3,  '', 7,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Address Line 2',                   'ADDRESS_LINE_2',            7, 0, 1, 'SMM.PRECHECK', 3,  '', 8,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Address Line 3',                   'ADDRESS_LINE_3',            8, 0, 1, 'SMM.PRECHECK', 3,  '', 9,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'City',                             'CITY',                      9, 0, 1, 'SMM.PRECHECK CR', 3,  '', 10,  '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Post Code',                        'POST_CODE',                 10, 0, 1, 'SMM.PRECHECK', 3,  '', 11,  '', null, 1, 20,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Comments',                         'COMMENTS',                  11, 0, 1, 'SMM.PRECHECK', 3,  '', 12,  '', null, 1, 512, 10, null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Order Date', 'ORDER_DATE',            12, 0, 1, 'SMM.PRECHECK CR', 4,  '', 13,  '', null, 1, 40,  null, null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Home Phone No.',                   'HOME_PHONE_NUMBER',         13, 0, 1, 'SMM.PRECHECK', 3,  '', 14,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Office Phone No.',                 'OFFICE_PHONE_NUMBER',       14, 0, 1, 'SMM.PRECHECK', 3,  '', 15,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Contact Phone No.',                'CONTACT_PHONE_NUMBER',      15, 0, 1, 'SMM.PRECHECK', 3,  '', 16,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Network',                'NETWORK_ID',      16, 0, 1, 'CR', 1,  '', 17,  '', 10, 1, 20,  0,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 160, 'Day Of Year',                'DAY_OF_YEAR',      0, 0, 0, '', 1,  '', 18,  '', null, 0, 20,  null,    null,  '1') ;

-- Record View Creation
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, 
									is_primary_view, is_logging_enabled,help_file_key) 
	values(161,'Orders', 160, 'ID ASC', 1, 1, 1, 1,'ORDER_RECORD_VIEW') ;

DECLARE
	parentid NUMBER(20) ;
BEGIN
	select GetParentID('Record View') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,4', parentid, name, '/record_view/list/' || id ||'',0 , 1 from record_view_configs where is_visible = 1 and id = 161) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

end ;
/

-- Creating Task Entries
DECLARE
  parentid NUMBER(20) ;
BEGIN
  	select GetParentID('Record View') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Orders', 'Record View'), 'Filter on Non Indexed Fields', '/non_index_filtering/160', 0, 0) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Orders', 'Record View'), 'Filter using LIKE Operator', '/filter_using_like_operator/160', 0, 0) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Orders', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/161', 0, 0) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
	
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Rule'), 'Order Form Rule Creation', '', 0, 0) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Template'), 'Order Form Template Creation', '', 0, 0) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
END ;
/


--INSERT INTO filter_index_fields (RECORD_CONFIG_ID,FIELD_ID) values (160,2) ;

-- Rule Creation Record Configs
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 160, id, 'RULE' from tasks where name = 'Order Form Rule Creation') ;
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 160, id, 'TEMPLATE' from tasks where name = 'Order Form Template Creation') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 160, id from tasks where link like '%record_view/list/160%') ;

	
----- Adding New Aggregation Type
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (226, 'Unique Identification Number', '160', '-1,-2,-3,-4') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id) values( 226, 'Unique Identification Number', 'AGGREGATION_TYPE INLINE_RULES NICKNAME NOT_DEFAULT HOTLIST', 3, 19, 226);

INSERT INTO aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 226, 0, 226, NULL) ;

INSERT INTO agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 226, 0, 1, null) ;

----- Field Record Configs Entries
INSERT INTO field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 226, 160, '3') ;
INSERT INTO field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 160, '1') ;
INSERT INTO field_record_config_maps (record_config_id, id, field_category_id, field_association) values (160, field_record_config_map_seq.nextval, 5, '17') ;
INSERT INTO field_record_config_maps (record_config_id, id, field_category_id, field_association) values (160, field_record_config_map_seq.nextval, 13, '13') ;

----- Reference Types Entries
INSERT INTO reference_types(id, description, record_config_id) values(226, 'UID', 160) ;
INSERT INTO reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 226, 226, 226, 226) ;
INSERT INTO modulo_dispatcher_categories (RECORD_CONFIG_ID,FIELD_CATEGORY_ID) values (160, 226) ;

-- Counter Related Entries

INSERT INTO counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval,226, 160,2,1,'REGULAR');
INSERT INTO counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval,226, 160,29,1,'REGULAR');
INSERT INTO counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id,rule_mode) values (1,1,226,160,0) ;


INSERT INTO AGG_TYPE_PSEUDO_FUNCTIONS (ID, AGGREGATION_TYPE_ID,PSEUDO_FUNCTION_ID) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.NEXTVAL, 226, 26) ;
INSERT INTO AGG_TYPE_PSEUDO_FUNCTIONS (ID, AGGREGATION_TYPE_ID,PSEUDO_FUNCTION_ID) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.NEXTVAL, 226, 6) ;
INSERT INTO pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (6,160) ;
INSERT INTO pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (26,160) ;
INSERT INTO DS_GRANULARITY_MAPS values (17,160,7776000,0) ;

--INSERT INTO basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 160, 161, 1, 0, 1, 0) ;
INSERT INTO basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 160, 161, 2, 0, 2, 0) ;

INSERT INTO tags(select tags_seq.nextval, description, 'DATA_STREAMS' from record_configs where is_visible = 1 and id=160 and category like '%RULE_TAGS%') ;

update pseudo_functions set category = 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST INLINE' where id = 6;

---- Entries Required For Alarm Denormalizer
insert into alarm_xdr_maps values(10, 'ALARM_ORDERS', 160) ;
--INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(999,160,'ORDERS') ;

-- Archival entries
INSERT INTO archive_maps (lookup_table_name, archive_name, record_config_id, id) values ('ARCHIEVED_ORDERS', 'Orders archieve', 160, 15) ;


---- User Options
INSERT INTO user_options (id, option_id, user_id, value, is_read_only, is_enabled, role_id) select user_options_seq.nextval, '161.AssignedRecordViewFilter', name,  '999', 0, 0, 2 from ranger_users where is_active=1 ;
INSERT INTO user_options (id, option_id, user_id, value, is_read_only, is_enabled, role_id) select user_options_seq.nextval, '161.SelectedFields', name,  '2', 0, 0, 2 from ranger_users where is_active=1 ;
INSERT INTO user_options (id, option_id, user_id, value, is_read_only, is_enabled, role_id) select user_options_seq.nextval, '161.PageSize', name,  '50', 0, 1, 2 from ranger_users where is_active=1 ;
INSERT INTO user_options (id, option_id, user_id, value, is_read_only, is_enabled, role_id) select user_options_seq.nextval, '161.AlarmXDRPageSize', name,  '50', 0, 1, 2 from ranger_users where is_active=1 ;


---- Alarm Closure Actions
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 226 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 226 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;

--------------------------------------------------------- Dummy Record Config Values For Precheck Lists ----------------------------------------

-- Orders Dummy
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, 
		is_partitioned, is_cost_computation_enabled, is_spark_support)
	values(170, 'ORDERS', 'Orders', 0, 'NIQUE_ID_NO', 0,  '|',  '', 0, 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
	is_cell_specific, is_primary_view,help_file_key) values (172, 'Orders', 170, '', 'ID ASC', 1, 0, 0, 1,'ORDER_RECORD_VIEW') ;


insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter,width, reg_exp_id, associated_field, derivative_function) values (field_configs_seq.nextval, 170, 'ID',                     'ID',              0, 0, 0, '', 8,  '', 1,   '', null, 0, 40,  '',    null,  '31') ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Order Number',                     'ORDER_NUMBER',              1, 0, 1, 'SMM.PRECHECK', 3,  '', 2,   '', null, 0, 40,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Unique Identification Number',                     'UNIQUE_ID_NO',              2, 0, 1, '', 3,  '', 3,   '', null, 1, 40,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'First Name',                       'FIRST_NAME',                3, 0, 1, 'SMM.PRECHECK', 3,  '', 4,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Middle Name',                      'MIDDLE_NAME',               4, 0, 1, 'SMM.PRECHECK', 3,  '', 5,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Last Name',                        'LAST_NAME',                 5, 0, 1, 'SMM.PRECHECK', 3,  '', 6,   '', null, 1, 40,  8,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Address Line 1',                   'ADDRESS_LINE_1',            6, 0, 1, 'SMM.PRECHECK', 3,  '', 7,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Address Line 2',                   'ADDRESS_LINE_2',            7, 0, 1, 'SMM.PRECHECK', 3,  '', 8,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Address Line 3',                   'ADDRESS_LINE_3',            8, 0, 1, 'SMM.PRECHECK', 3,  '', 9,   '', null, 1, 256, 19,   null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'City',                             'CITY',                      9, 0, 1, 'SMM.PRECHECK', 3,  '', 10,  '', null, 1, 40,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Post Code',                        'POST_CODE',                 10, 0, 1, 'SMM.PRECHECK', 3,  '', 11,  '', null, 1, 20,  9,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Comments',                         'COMMENTS',                  11, 0, 1, 'SMM.PRECHECK', 3,  '', 12,  '', null, 1, 512, 10, null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Order Date', 'ORDER_DATE',            12, 0, 1, 'SMM.PRECHECK', 4,  '', 13,  '', null, 1, 40,  null, null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Home Phone No.',                   'HOME_PHONE_NUMBER',         13, 0, 1, 'SMM.PRECHECK', 3,  '', 14,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Office Phone No.',                 'OFFICE_PHONE_NUMBER',       14, 0, 1, 'SMM.PRECHECK', 3,  '', 15,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Contact Phone No.',                'CONTACT_PHONE_NUMBER',      15, 0, 1, 'SMM.PRECHECK', 3,  '', 16,  '', null, 1, 40,  1,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Network',                'NETWORK_ID',      16, 0, 1, '', 1,  '', 17,  '', 10, 1, 20,  0,    null,  null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 170, 'Day Of Year',                'DAY_OF_YEAR',      0, 0, 0, '', 1,  '', 18,  '', null, 0, 20,  null,    null,  '1') ;

insert into precheck_record_configs
(id, record_config_id, precheck_record_config_id, precheck_record_view_config_id, key_field_id, precheck_key_field_id) 
values (precheck_record_configs_seq.nextval, 160, 170, 172, 1, 1) ;

insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  2,  2) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  3,  3) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  4,  4) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  5,  5) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  6,  6) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  7,  7) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  8,  8) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160,  9,  9) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 10, 10) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 11, 11) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 12, 12) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 13, 13) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 14, 14) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 15, 15) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 16, 16) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(160, 18, 18) ;


insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'FIRST_NAME') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'MIDDLE_NAME') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'LAST_NAME') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'ADDRESS_LINE_1') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'ADDRESS_LINE_2') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'ADDRESS_LINE_3') ;
insert into filter_case_insensitive_fields (record_config_id, database_field) values (160, 'CITY') ;


insert into configurations(id, config_key, value) values(configurations_seq.nextval, '160.SELECTED_PRECHECK_FIELDS','') ;

DECLARE
    network_count number(20) ;
BEGIN
	select count(*) into network_count from networks;
  FOR ranger_user IN (SELECT * FROM ranger_users)
    LOOP

		INSERT INTO rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, 
						accumulation_function, is_enabled, created_time, modification_time, severity, user_id,
						description, processor_type, category, pseudo_function_id, is_active) 
			VALUES (rules_seq.nextval, 999, rules_key_seq.nextval, 'Manual Precheck - Orders', 0, 226, 1, 29, 1, sysdate, sysdate, 100, ranger_user.name, '', 1, 'MANUAL.PRECHECK', 26, 1) ;

--	 if (network_count > 1) then
--		INSERT INTO networks_rules (rule_id, network_id) 	(select rules_seq.currval, id from networks where id != 999) ;
--	else 
--		 if (network_count = 1) then
--		INSERT INTO networks_rules (rule_id, network_id) 	(select rules_seq.currval, id from networks where id = 999) ;
--		end if ;
--	end if ;

		INSERT INTO record_configs_rules (rule_id, record_config_id) VALUES (rules_seq.currval, 160) ;
		INSERT INTO analyst_actions_rules (rule_id, analyst_action_id) 
				(select rules_seq.currval, id from analyst_actions where category = 'RECOMMENDED_ACTION') ;
		INSERT INTO actions_rules (rule_id, action_id) VALUES (rules_seq.currval, 36) ;
		INSERT INTO rule_priority_maps (id, rule_id, priority) 
			VALUES (rule_priority_maps_seq.nextval, rules_seq.currval, 100) ;

	    INSERT INTO thresholds(id, threshold_id, aggregation_type, rule_key, rule_version, value, version, 
				duration, effective_time, effective_day, effective_week_day, changed_status) 
			VALUES (thresholds_seq.nextval, 0, 2, rules_key_seq.currval, 0, 0, 0, 0, 1, 1, 1, 0) ;
		INSERT INTO match_configurations (id, rule_id, exclude_word_length, min_match_percentage, min_match_records, restrict_participated_records)
			VALUES(match_configurations_seq.nextval, rules_seq.currval, 0, 100, 1, 50) ;

			FOR field IN (select * from field_configs where record_config_id = 160 and ds_category like '%SMM.PRECHECK%')
			LOOP
				INSERT INTO match_field_configurations(id, match_config_id, field_id, weightage, 
						is_field_checked, is_exact, is_phonetic, is_substring, is_word,	is_fuzzy,
						minimum_percentage_match, exclude_words, cross_match_fields, display_in_view) 
					VALUES(match_field_configurations_seq.nextval, match_configurations_seq.currval,
						   field.field_id, 0, 0, 0, 0, 0, 0, 0, 100, NULL, NULL, 0) ;
			END LOOP ;
		INSERT INTO user_options(id, option_id, user_id, value, is_read_only, is_enabled, role_id)
					VALUES(user_options_seq.nextval, '160.ManualPrecheckRuleID', ranger_user.name, 
							to_char(rules_seq.currval), 0, 1, ranger_user.default_role) ;
	END LOOP ;
END ;
/


insert into manual_precheck_configs (id, record_config_id, aggregation_type, aggregation_value) values (manual_precheck_configs_seq.nextval, 160, 226, 'Dummy Uniq Address') ;


------------Inline Store Rules -----------
INSERT INTO rules(id, parent_id, key, name, version, aggregation_type, accumulation_field,
	accumulation_function, pseudo_function_id, is_enabled, created_time, modification_time, severity,
	user_id, description, processor_type, category, is_active) VALUES 
	(rules_seq.nextval, '999', rules_key_seq.nextval, 'Store Inline Records', 0, 1, 0, 
	0, NULL, '1', sysdate, sysdate, '1', 'radmin', NULL, '1', 'INLINE.STORE', 1) ;

insert into rule_priority_maps (id, rule_id, priority) values 
	(rule_priority_maps_seq.nextval, rules_seq.currval, 10320) ;

insert into actions_rules (rule_id, action_id) values (rules_seq.currval, 41) ;

insert into record_configs_rules (rule_id, record_config_id) 
	values (rules_seq.currval, 160) ;

commit ;
