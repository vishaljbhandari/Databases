set feedback off

delete from configurations where config_key = 'ACTIONS.PGW_SUBSCRIBER_STORE' ;
delete from user_options where option_id='1024.PageSize' ;
delete from alarm_status_action_maps where reference_type = 8 ;

delete from filter_tokens where id = 1024 ;
delete from expressions where id = 1024 ;
delete from filters_rules where filter_id = 1024 ;
delete from filters where id = 1024 ;
delete from actions_rules where rule_id = 1024 ;
delete from record_configs_rules where rule_id = 1024 ;
delete from rule_priority_maps where rule_id = 1024 ;
delete from actions where id = 1024 ;
delete from rules where id = 1024 ;

delete from expandable_field_maps where id in (1024) ;
delete from field_record_config_maps where record_config_id = 1024 ;
delete from field_configs where record_config_id = 1024 ;
delete from record_configs_rules where record_config_id = 1024 ;
delete from record_view_configs where id = 1024 ;
delete from basic_filter_configs where record_config_id = 1024 ;
delete from agg_type_pseudo_functions where aggregation_type_id = 5002 ;

delete from configurations where config_key = 'DU_PGW_DATAIDIncrement' ;
--delete from configurations where config_key = 'CLEANUP.RECORDS.DU_PGW_DATA.OPTIONS' ;
--delete from configurations where config_key = 'CLEANUP.RECORDS.LAST_DU_PGW_DATA_DAY_TRUNCED' ;
--update configurations set VALUE = replace(VALUE, ',1024', '') where CONFIG_KEY='CLEANUP.RECORDS.OPTION' ;

delete from dbwriter_configurations where record_config_id = 1024 ;
delete from counter_maps where record_config_id = 1024 ;
delete from counter_manager_mappings where record_config_id = 1024 ;
delete from pseudo_functns_record_configs where record_config_id = 1024 ;
delete from rc_record_configs where record_config_id = 1024 ;
delete from archive_maps where record_config_id = 1024 ;

delete from aggregation_types_maps where source_aggregation = 5002 ;
delete from reference_types_maps where aggregation_type = 5002 ;
delete from reference_types where id = 8 ;
delete from field_categories where id = 5002 ;
delete from aggregation_types where id = 5002 ;

delete from record_configs where id = 1024 ;

delete from ranger_groups_tasks where task_id in (select id from tasks where name in ('PGW Rule Creation', 'PGW Template Creation', 'Payment Gateway')) ;
delete from tasks where name in ('PGW Rule Creation', 'PGW Template Creation', 'Payment Gateway') ;

-----Adding new data stream called NETFLOW
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(1024 ,'DU_PGW_DATA','Payment Gateway',1,'MSISDN',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY', 0) ;

insert into record_view_configs (id, name, record_config_id, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled ) values (1024, 'Payment Gateway', 1024, 'TIMESTAMP DESC', 1, 0, 1, 1, 1) ;

----Adding the fields for the new data streaM
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id, derivative_function)	values (field_configs_seq.nextval, 1024, 'ID',					'ID',					0,  0,  8, 20,  0, 0, null, '30') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Phone Number',		'MSISDN',				1,  1,  3, 40,  1, 1, 1) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Time Stamp',			'TIMESTAMP',			2,  2,  4, 20,  1, 1, null) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Card Number',			'CARD_NO',				3,  3,  3, 20,  1, 1, 5) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Account Name',		'ACCOUNT_NAME',			4,  4,  3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Value',				'VALUE',				5,  5,  2, 20,  1, 1, null) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Start Date',			'START_DATE',			6,  6,  3, 20,  1, 0, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Expiry Date',			'EXPIRY_DATE',			7,  7,  3, 20,  1, 0, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Card Holder Name',	'CARD_HOLDER_NAME',		8,  8,  3, 70,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Card Acceptor ID',	'CARD_ACCEPTOR_ID_CODE',9,  9,  3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Transaction ID',		'TRANSACTION_ID',		10, 10, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Transaction Type',	'TRANSACTION_TYPE',		11, 11, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Status',				'STATUS',				12, 12, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Pay Channel',			'PAY_CHANNEL',			13, 13, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'First Name',			'FIRST_NAME',			14, 14, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Last Name',			'LAST_NAME',			15, 15, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'IP Address',			'IP_ADDRESS',			16, 16, 3, 256, 1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'RSP Code',			'RSPCODE',				17, 17, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Destination MSISDN',	'DEST_MSISDN',			18, 18, 3, 40,  1, 1, 1) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Response Code',		'RESPONSE_CODE',		19, 19, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Card Type',			'CARD_TYPE',			20, 20, 3, 20,  1, 1, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'ID Number',			'ID_NUMBER',			21, 21, 3, 20,  1, 0, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Issue',				'ISSUE',				22, 22, 3, 20,  1, 0, 10) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Subscriber ID',		'SUBSCRIBER_ID',		23, 23, 8, 20,  0, 0, null) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id)							values (field_configs_seq.nextval, 1024, 'Network ID',			'NETWORK_ID',			24, 24, 1, 20,  0, 0, null) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, width, is_visible, is_filter, reg_exp_id, derivative_function)	values (field_configs_seq.nextval, 1024, 'Day Of year',			'DAY_OF_YEAR',			25,  0, 1, 20,  0, 0, null, '1') ;

-- add expandable and set asso_field
insert into expandable_field_maps (id, name, source_view_id, source_key, dest_view_id, dest_key, dest_key_type, is_new_view, category, data_record_type)
	values (1024, 'PGW Subscriber Info', 1024, 'MSISDN', 21, 'PHONE_NUMBER', 2, 0, 'RECORD_VIEW GR RULE', 0) ;

----New Aggregation type for PGW: Card Number
insert into aggregation_types (ID, DESCRIPTION) values (5002, 'Card Number') ;
insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id) values(5002, 'Card Number', 'AGGREGATION_TYPE NICKNAME HOTLIST MANUAL_ALARM_AGGREGATION_TYPE', 3, '5', '5002') ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) values (15, 5002, 0, null, 3) ;

insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1,	1024, '0') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13,	1024, '2') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17,	1024, '5') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203,	1024, '1024.5.20') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5001,1024, '4') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5002,1024, '3') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16,1024, '23') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47,1024, '1024.32') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5,1024, '24') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  2,1024, '1') ;
insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29,1024, '1024.22') ;

insert into configurations (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'DU_PGW_DATAIDIncrement','1',1);
--insert into configurations (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'CLEANUP.RECORDS.DU_PGW_DATA.OPTIONS','1970/01/01 00:00:00,30',1) ;
--insert into configurations (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'CLEANUP.RECORDS.LAST_DU_PGW_DATA_DAY_TRUNCED','',1) ;
--update configurations set VALUE = VALUE || ',1024' where CONFIG_KEY='CLEANUP.RECORDS.OPTION' ;

insert into counter_manager_mappings(counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 1024) ;
insert into counter_manager_mappings(counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 5001, 1024) ;
insert into counter_manager_mappings(counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 5002, 1024) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 2, 1024, 1, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 2, 1024, 2, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 2, 1024, 6, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 1024, 1, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 1024, 2, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5001, 1024, 6, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5002, 1024, 1, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5002, 1024, 2, 1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(COUNTER_MAPS_SEQ.nextval, 5002, 1024, 6, 1) ;

insert into reference_types (id, description, record_config_id) values (8, 'Card Number', 1024);
insert into reference_types_maps (id, reference_type, reference_value_category_id, reference_category_id, aggregation_type) values (reference_types_maps_seq.nextval, 8, 5002, 0, 5002);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5002, 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5002, 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values (AGG_TYPE_PSEUDO_FUNCTIONS_SEQ.nextval , 5002, 10);

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id ) values (1, 1024) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id ) values (6, 1024) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id ) values (10, 1024) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3', GetParentID('Add Rule'), 'PGW Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'radmin';
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'nadmin' ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'default' ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3', GetParentID('Add Template'), 'PGW Template Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'radmin';
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'nadmin' ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'default' ;

insert into rc_record_configs(ID,RECORD_CONFIG_ID,TASK_ID,CATEGORY) values (19, 1024, GetParentID('PGW Rule Creation'), 'RULE') ;
insert into rc_record_configs(ID,RECORD_CONFIG_ID,TASK_ID,CATEGORY) values (20, 1024, GetParentID('PGW Template Creation'), 'TEMPLATE') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval,'0',GetParentID('Record View'), 'Payment Gateway', '/record_view/list/1024?fetch_records=false', 0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'radmin';
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'nadmin' ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'default' ;

insert into record_configs_rules (rule_id, record_config_id) values (6, 1024) ;
insert into record_configs_rules (rule_id, record_config_id) values (7, 1024) ;

insert into dbwriter_configurations (id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, record_commit_count, acceptable_future_days, partition_buffer_days, is_batch_load_enabled, batch_size, current_batch_info, last_processed_file, last_processed_record_number, batch_time_out_value, max_wait_time, reserved_subpartitions)
values (9, 1024, 0, 0, '0:0:0', 0, 1, 1, 0, 0, 1, null, '', 5, 1800, 120, null) ;

insert into archive_maps (id, archive_name, lookup_table_name, record_config_id) values (10, 'ARCHIVED_DU_PGW_DATA', 'ARCHIVED_DU_PGW_DATA', 1024) ;

insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_seq.nextval, 1024, 1024,  1,  0, 1, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max) values(basic_filter_seq.nextval, 1024, 1024,  2, 10, 2, 0, '01-01-1970', '31-12-9999') ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_seq.nextval, 1024, 1024,  3,  0, 3, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_seq.nextval, 1024, 1024,  4,  0, 4, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_seq.nextval, 1024, 1024,  5, 10, 5, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_seq.nextval, 1024, 1024, 10,  0, 6, 0) ;

-------------------Rule to store default subscribers for PGW.----------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('1024','999','1024','PGW SubscriberStore','0','2','0','0',NULL,'1',TO_DATE('2009-03-12 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2009-03-12 11:00:00','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');
insert into actions(id, action_name, is_visible) values (1024, 'PGW Store Subscriber', 0) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 1024, 4) ;

insert into record_configs_rules(rule_id, record_config_id) values(1024, 1024) ;

insert into actions_rules(rule_id, action_id) values(1024, 1024) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(1024, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(1024, 1024) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(1024, '23', '1,4', 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(1024, 1024, 1024, null) ;

insert into configurations (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'ACTIONS.PGW_SUBSCRIBER_STORE','libpgwsubscriberstore',1);

insert into user_options(id, option_id, user_id, value, is_read_only, is_enabled, role_id) (select user_options_seq.nextval, '1024.PageSize', u.name, '50', 0, 1, m.ranger_group_id from ranger_groups_ranger_users m, ranger_users u where u.id = m.ranger_user_id) ;

insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 2, 34, 8) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 4, 34, 8) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 8, 34, 8) ;

commit;
quit;

