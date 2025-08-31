spool nikira-DML-new-record-config-precheck.log
set feedback off ;
set serveroutput off ;

-- Translations
insert into translation_indices(id, description,is_dynamic) values (560, 'Precheck Record Configurations', 1) ;

insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 560, '-176', ' select id as key, description as Value from record_configs where id in (select PRECHECK_RECORD_CONFIG_ID from precheck_record_configs) ') ;

insert into translation_indices(id, description,is_dynamic) values (549, 'Active Users', 1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 549, '-176', 'select id as Key, name as Value from ranger_users where id >= 3 and is_active = 1 order by name') ;

insert into translation_indices(id, description,is_dynamic) values (550, 'Precheck List Statuses', 1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 550,'0', 'Disabled') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 550,'1', 'Enabled') ;

insert into translation_indices(id, description,is_dynamic) values (552, 'Precheck Account Network', 0) ;
insert into translations values(translations_seq.nextval, 552, '-176', 'select id as Key, description as Value from networks where id != 999 order by description') ;

-- Subscriber Monitor Lists

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (expandable_field_maps_seq.nextval, 'Account-ActiveService', 46, 'ACCOUNT_NAME', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (expandable_field_maps_seq.nextval, 'Account-Black Listed Service', 46, 'ACCOUNT_NAME', 12, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (expandable_field_maps_seq.nextval, 'Account-Disconnected Service', 46, 'ACCOUNT_NAME', 105, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW'); 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (118, 'Subscriber-PrecheckListAccount', 3, 'ACCOUNT_ID', 46, 'ID', 0, 1, '');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (199, 'Subscriber-Account Precheck list', 45, 'ACCOUNT_NAME', 46, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Active Subscriber Details', 45, 'PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black list Subscriber Details', 45, 'PHONE_NUMBER',12 , 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

-- Matched Results
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(94,'MATCHED_RESULTS','Matched Result Records for precheck', 0, '', 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 94, 'ID', 'ID', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 94, 'Rule Key', 'RULE_KEY', 2, 2, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 94, 'Aggregation Value', 'AGGREGATION_VALUE', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 94, 'Match Percentage', 'MATCH_PERCENTAGE', 4, 4, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 94, 'List Key', 'LIST_KEY', 5, 5, 1, 0, 0, 1, 0) ;

-- Precheck Lists
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_spark_support) values (124, 'PRECHECK_LISTS', 'Precheck Lists', 0, NULL, 1, NULL, 'NAMED_FILTERS', 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
	is_cell_specific, is_primary_view) values (140, 'Precheck Lists', 124, ' IS_ACTIVE = 1 ', 'ID ASC', 1, 0, 0, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'ID', 'ID', 1, 0, 1, 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Key', 'KEY', 2, 0, 1, 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Name', 'NAME', 3, 1, 3, 256, null, 1, 10, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Description', 'DESCRIPTION', 4, 2, 3, 256, null, 1, 10, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Record Configuration', 'RECORD_CONFIG_ID', 5, 3, 1, 40, 560, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'FILTER_ID', 'FILTER_ID', 6, 4, 1, 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Version', 'VERSION', 7, 5, 1, 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Created Date', 'CREATED_DATE', 8, 6, 4, 256, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Modified Date', 'MODIFIED_DATE', 9, 7, 4, 256, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'User Name', 'USER_ID', 10, 8, 1, 40, 549, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Is Active', 'IS_ACTIVE', 11, 9, 1, 40, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 124, 'Status', 'IS_ENABLED', 12, 10, 1, 40, 550, 1, null, 1) ;

insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140,  3, 0, 1, 0, null, null, null);
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140,  4, 8, 2, 0, null, null, null);
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140,  5, 8, 3, 0, null, null, '560');
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140,  8, 10, 4, 0, null, null, null);
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140,  9, 10, 5, 0, null, null,  null);
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) 
	values (basic_filter_configs_seq.nextval, 124, 140, 10, 8, 6, 0, null, null, '549');

commit ;

