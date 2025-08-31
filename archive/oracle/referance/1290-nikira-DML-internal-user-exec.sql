spool nikira-DML-internal-user-exec.log
set feedback off ;
set serveroutput off ;

insert into ranger_groups(id,name,description) values (999,'InternalUser', 'Internal User Group');

-- Internal User Record
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(70, 'INTERNAL_USERS', 'Internal Users', 0, NULL, 1, ',', 'RULE_TAGS NAMED_FILTERS FINGERPRINT_RULE_ENTITY_TYPE STATS_RULE_ENTITY_TYPE', 0) ;

-- Adjustment Log Record
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_spark_support) values(71, 'ADJUSTMENT_LOGS', 'Adjustment Logs', 0, NULL, 1, ',', 'RULE_TAGS FINGERPRINT_ENTITY NAMED_FILTERS TEST_RULE DATASTREAM PROFILE_FIELD', 0, 1) ;

-- CRM Log Record
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_spark_support) values(72, 'CRM_LOGS', 'CRM Logs', 0, NULL, 1, ',', 'RULE_TAGS FINGERPRINT_ENTITY NAMED_FILTERS TEST_RULE DATASTREAM PROFILE_FIELD', 0, 1) ;

-- Internal User record view
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled,help_file_key) values(83, 'Internal User', 70, NULL, 'ID DESC', 1, 0, 1, 1, 1,'INTERNAL_USER_RECORD_VIEW') ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled) values(112, 'Internal User', 70, NULL, 'ID DESC', 0, 0, 0, 0, 0) ;

-- Adjustment Logs record view
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled, create_manual_alarm,help_file_key, is_advanced_query_enabled) values(84, 'Adjustment Logs', 71, NULL, 'ID DESC', 1, 0, 1, 1, 1, 1,'ADJUSTMENT_LOGS_RECORD_VIEW', 1) ;

-- CRM Logs record view
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled, create_manual_alarm,help_file_key, is_advanced_query_enabled) values(85, 'CRM Logs', 72, NULL, 'ID DESC', 1, 0, 1, 1, 1, 1,'CRM_LOGS_RECORD_VIEW', 1) ;

-- Entries for Rule Creation enabled Record Configs --
insert into rc_record_configs (select rc_record_configs_seq.nextval, 72, id, 'RULE' from tasks where name = 'CRM Logs Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 71, id, 'RULE' from tasks where name = 'Adjustment Logs Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 72, id, 'TEMPLATE' from tasks where name = 'CRM Logs Template Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 71, id, 'TEMPLATE' from tasks where name = 'Adjustment Logs Template Creation') ;

--Granularity for Data Streams 
insert into ds_granularity_maps(id, record_config_id, threshold_in_seconds, granularity_in_seconds) values (5, 71, 7 * 86400, 6 * 3600) ;
insert into ds_granularity_maps(id, record_config_id, threshold_in_seconds, granularity_in_seconds) values (6, 72, 7 * 86400, 6 * 3600) ;

-- Archive Map ----
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(5, 'ARCHIVED_ADJUSTMENT_LOGS', 'AR_ALARM_ADJUSTMENT_LOGS', 71);
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(6, 'ARCHIVED_CRM_LOGS', 'AR_ALARM_CRM_LOGS', 72);

insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_ADJUSTMENT_LOGS',71);
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_CRM_LOGS',72);


-- Internal User Records
insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'User ID', 'ID',0 , 0, 0, NULL, 8, NULL, 1, NULL, NULL, 1, 40, 9, NULL, 30, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'First Name', 'FIRST_NAME', 2, 0, 1, NULL, 3, NULL, 2, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Middle Name', 'MIDDLE_NAME', 3, 0, 1, NULL, 3, NULL, 3, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Last Name', 'LAST_NAME', 4, 0, 1, NULL, 3, NULL, 4, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Employee Code', 'EMPLOYEE_CODE', 5, 1, 1, NULL, 3, NULL, 5, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Address Line 1', 'ADDRESS_LINE_1', 6, 0, 1, NULL, 3, NULL, 6, NULL, NULL, 1, 256, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Address Line 2', 'ADDRESS_LINE_2', 7, 0, 1, NULL, 3, NULL, 7, NULL, NULL, 1, 256, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'City', 'CITY', 8, 0, 1, NULL, 3, NULL, 8, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'State', 'STATE', 9, 0, 1, NULL, 3, NULL, 9, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Pincode', 'PINCODE', 10, 0, 1, NULL, 3, NULL, 10, NULL, NULL, 1, 40, 6, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Creation Date', 'CREATION_DATE', 11, 0, 1, NULL, 4, NULL, 11, NULL, NULL, 1, 40, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Network', 'NETWORK_ID', 12, 0, 0, NULL, 1, NULL, 12, NULL, 10, 0, 20, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'User Type', 'USER_TYPE', 13, 0, 1, NULL, 1, NULL, 13, NULL, NULL, 1, 20, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Privilige Class', 'PRIVILIGE_CLASS', 14, 0, 1, NULL, 3, NULL, 14, NULL, NULL, 1, 20, 10, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Phone Number', 'PHONE_NUMBER', 15, 1, 1, NULL, 3, NULL, 15, NULL, NULL, 1, 40, 1, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'IP Address', 'IP_ADDRESS', 16, 0, 1, NULL, 3, NULL, 16, NULL, NULL, 1, 40, 23, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 70, 'Internal User ID', 'INTERNAL_USER_ID', 1, 0, 1, NULL, 3, NULL, 17, NULL, NULL, 1, 40, 8, NULL, NULL, NULL);

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 1', 'OPTIONAL_FIELD_1', '17', 0, 0, null, 3, null, 18, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 2', 'OPTIONAL_FIELD_2', '18', 0, 0, null, 3, null, 19, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 3', 'OPTIONAL_FIELD_3', '19', 0, 0, null, 3, null, 20, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 4', 'OPTIONAL_FIELD_4', '20', 0, 0, null, 3, null, 21, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 5', 'OPTIONAL_FIELD_5', '21', 0, 0, null, 3, null, 22, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 6', 'OPTIONAL_FIELD_6', '22', 0, 0, null, 3, null, 23, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 7', 'OPTIONAL_FIELD_7', '23', 0, 0, null, 3, null, 24, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 8', 'OPTIONAL_FIELD_8', '24', 0, 0, null, 3, null, 25, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 9', 'OPTIONAL_FIELD_9', '25', 0, 0, null, 3, null, 26, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 10', 'OPTIONAL_FIELD_10', '26', 0, 0, null, 3, null, 27, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 11', 'OPTIONAL_FIELD_11', '27', 0, 0, null, 2, null, 28, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 12', 'OPTIONAL_FIELD_12', '28', 0, 0, null, 2, null, 29, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 13', 'OPTIONAL_FIELD_13', '29', 0, 0, null, 2, null, 30, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 14', 'OPTIONAL_FIELD_14', '30', 0, 0, null, 4, null, 31, null, null, 0, 20,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 70, 'Optional Field 15', 'OPTIONAL_FIELD_15', '31', 0, 0, null, 4, null, 32, null, null, 0, 20,0, null, '', null, 0, 0) ;




-- Adjustment Log Field configs
insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Internal User ID', 'INTERNAL_USER_ID', 1, 1, 1, NULL, 3, NULL, 1, NULL, NULL, 1, 20, 10, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Account Number', 'ACCOUNT_NUMBER', 2, 0, 1, NULL, 3, NULL, 2, NULL, NULL, 1, 40, 8, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Phone Number', 'PHONE_NUMBER', 3, 1, 1, NULL, 3, NULL, 3, NULL, NULL, 1, 40, 1, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Time Stamp', 'TIME_STAMP', 4, 0, 1, NULL, 4, NULL, 4, NULL, NULL, 1, 40, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Amount', 'AMOUNT', 5, 0, 1, 'CR', 2, NULL, 5, NULL, NULL, 1, 40, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Adjustment Type', 'ADJUSTMENT_TYPE', 6, 0, 1, 'CR', 1, NULL, 6, NULL, NULL, 1, 40, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Adjustment Description', 'ADJUSTMENT_DESCRIPTION', 7, 0, 1, NULL, 3, NULL, 7, NULL, NULL, 1, 40, 10, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Comments', 'COMMENTS', 8, 0, 1, NULL, 3, NULL, 8, NULL, NULL, 1, 40, 10, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Network', 'NETWORK_ID', 9, 0, 0, NULL, 1, NULL, 9, NULL, 10, 0, 20, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Employee Code', 'EMPLOYEE_CODE', 10, 1, 1, NULL, 3, NULL, 10, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'ID', 'ID', NULL, 0, 0, NULL, 8, NULL, 11, NULL, NULL, 0, 40, NULL, NULL, 30, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Day of Year','DAY_OF_YEAR', NULL, 0, 0, NULL, 1, NULL, 12, NULL, NULL, 0, 20, NULL, NULL, 1, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,query_field , translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 71, 'Internal ID','INTERNAL_ID',11 , 0, 0, NULL, 8, NULL, 13, NULL, NULL, 0, 20, NULL, NULL, NULL, NULL) ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 71, 'Log Type', 'LOG_TYPE', 14, 12, 1, 0, '', '', 10, 603, 1, 1, 1, '') ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 1', 'OPTIONAL_FIELD_1', '13', 0, 0, null, 3, null, 15, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 2', 'OPTIONAL_FIELD_2', '14', 0, 0, null, 3, null, 16, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 3', 'OPTIONAL_FIELD_3', '15', 0, 0, null, 3, null, 17, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 4', 'OPTIONAL_FIELD_4', '16', 0, 0, null, 3, null, 18, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 5', 'OPTIONAL_FIELD_5', '17', 0, 0, null, 3, null, 19, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 6', 'OPTIONAL_FIELD_6', '18', 0, 0, null, 3, null, 20, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 7', 'OPTIONAL_FIELD_7', '19', 0, 0, null, 3, null, 21, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 8', 'OPTIONAL_FIELD_8', '20', 0, 0, null, 3, null, 22, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 9', 'OPTIONAL_FIELD_9', '21', 0, 0, null, 3, null, 23, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 10', 'OPTIONAL_FIELD_10', '22', 0, 0, null, 3, null, 24, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 11', 'OPTIONAL_FIELD_11', '23', 0, 0, null, 2, null, 25, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 12', 'OPTIONAL_FIELD_12', '24', 0, 0, null, 2, null, 26, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 13', 'OPTIONAL_FIELD_13', '25', 0, 0, null, 2, null, 27, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 14', 'OPTIONAL_FIELD_14', '26', 0, 0, null, 4, null, 28, null, null, 0, 20,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 71, 'Optional Field 15', 'OPTIONAL_FIELD_15', '27', 0, 0, null, 4, null, 29, null, null, 0, 20,0, null, '', null, 0, 0) ;


-- CRM Log Field Configs
insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Internal User ID', 'INTERNAL_USER_ID', 1, 1, 1, NULL, 3, NULL, 1, NULL, NULL, 1, 20,10, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Transaction Time Stamp', 'TRANSACTION_TIME_STAMP', 2, 0, 1, NULL, 4, NULL, 2, NULL, NULL, 1, 20, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'IP Address', 'IP_ADDRESS', 3, 0, 1, NULL, 3, NULL, 3, NULL, NULL, 1, 20, 23, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Type of Transaction', 'TYPE_OF_TRANSACTION', 4, 0, 1, 'CR', 3, NULL, 4, NULL, NULL, 1, 20, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Network', 'NETWORK_ID', 5, 0, 0, NULL, 1, NULL, 5, NULL, 10, 0, 20, NULL, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Employee Code', 'EMPLOYEE_CODE', 6, 1, 1, NULL, 3, NULL, 6, NULL, NULL, 1, 40, 9, NULL, NULL, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'ID', 'ID', NULL, 0, 0, NULL, 8, NULL, 7, NULL, NULL, 0, 20, NULL, NULL, 30, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Day of Year','DAY_OF_YEAR', NULL, 0, 0, NULL, 1, NULL, 8, NULL, NULL, 0, 20, NULL, NULL, 1, NULL);

insert into field_configs(id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width,reg_exp_id, associated_field, derivative_function, live_tree_ds) values (field_configs_seq.nextval, 72, 'Internal ID','INTERNAL_ID',7, 0, 0, NULL, 8, NULL, 9, NULL, NULL, 0, 20, NULL, NULL,NULL , NULL);

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 72, 'Log Type', 'LOG_TYPE', 10, 8, 1, 0, '', '', 10, 603, 1, 1, 1, '') ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 1', 'OPTIONAL_FIELD_1', '9', 0, 0, null, 3, null, 11, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 2', 'OPTIONAL_FIELD_2', '10', 0, 0, null, 3, null, 12, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 3', 'OPTIONAL_FIELD_3', '11', 0, 0, null, 3, null, 13, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 4', 'OPTIONAL_FIELD_4', '12', 0, 0, null, 3, null, 14, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 5', 'OPTIONAL_FIELD_5', '13', 0, 0, null, 3, null, 15, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 6', 'OPTIONAL_FIELD_6', '14', 0, 0, null, 3, null, 16, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 7', 'OPTIONAL_FIELD_7', '15', 0, 0, null, 3, null, 17, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 8', 'OPTIONAL_FIELD_8', '16', 0, 0, null, 3, null, 18, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 9', 'OPTIONAL_FIELD_9', '17', 0, 0, null, 3, null, 19, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 10', 'OPTIONAL_FIELD_10', '18', 0, 0, null, 3, null, 20, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 11', 'OPTIONAL_FIELD_11', '19', 0, 0, null, 2, null, 21, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 12', 'OPTIONAL_FIELD_12', '20', 0, 0, null, 2, null, 22, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 13', 'OPTIONAL_FIELD_13', '21', 0, 0, null, 2, null, 23, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 14', 'OPTIONAL_FIELD_14', '22', 0, 0, null, 4, null, 24, null, null, 0, 20,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval, 72, 'Optional Field 15', 'OPTIONAL_FIELD_15', '23', 0, 0, null, 4, null, 25, null, null, 0, 20,0, null, '', null, 0, 0) ;


--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,71,'FLOAT_PRECISION',2);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,71,'IS_CURRENCY',1);

------FC Entry for Internal User -------
insert into field_categories(id, name, category, data_type) values(216, 'Previous Internal User Sequence ID','',3) ;
insert into field_categories(id, name, category, data_type) values(217, 'Internal User Sequence ID','',3) ;
insert into field_categories(id, name, category, data_type) values(221, 'Internal ID','PROFILE_AGG_TYPE FINGERPRINT_RULE_AGG_TYPE ONDEMAND_OFFLINE_TEST', 3) ;
insert into field_categories(id, name, category, data_type) values(219, 'Profiled Internal User ID', '', 1) ;
insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id) values(213, 'Internal User ID', 'AGGREGATION_TYPE HOTLIST MANUAL_ALARM NICKNAME ONDEMAND_OFFLINE_TEST', 3, 2, 213);
insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id) values(214, 'Employee Code', 'PROFILE_SPECIFIC AGGREGATION_TYPE MANUAL_ALARM NICKNAME HOTLIST ONDEMAND_OFFLINE_TEST STATS_RULE_AGG_TYPE FINGERPRINT_RULE_AGG_TYPE', 3, 2, 214);


-- Modulo Dispatcher Categories ----
insert into modulo_dispatcher_categories  (record_config_id, field_category_id, enabled) values (70,213,1) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id, enabled) values (71,213,0) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id, enabled) values (72,213,0) ;

-- Reference Type Entries.
insert into reference_types(id, description, record_config_id) values(6, 'Internal User', 70) ;

-- pseudo_functns_record_configs entries --
--Internal User
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 70 from pseudo_functions where id = 25)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 70 from pseudo_functions where id = 30)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 70 from pseudo_functions where id = 31)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 70 from pseudo_functions where id = 35)  ;
-- Adjustment Log
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 1)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 6)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 30)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 35)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 10)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 71 from pseudo_functions where id = 70)  ;
-- CRM Log
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 72 from pseudo_functions where id = 6)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 72 from pseudo_functions where id = 35)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 72 from pseudo_functions where id = 70)  ;



-- Internal User
insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, max_wait_time) values (4, 70, 1, 24, '0:0:0', 0, 1) ;
insert into record_loader_config(id, record_config_id) values (5, 70 ) ;
-- Adjustment Log
insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, max_wait_time) values (5, 71, 1, 24, '0:0:0', 0, 1) ;
insert into record_loader_config(id, record_config_id) values (6, 71 ) ;
-- CRM Log
insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, max_wait_time) values (6, 72, 1, 24, '0:0:0', 0, 1) ;
insert into record_loader_config(id, record_config_id) values (7, 72 ) ;

--Aggregation Types entries --
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (213, 'Internal User ID', '71,72', '-1,-2,-3,-4,-5') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (214, 'Employee Code', '71,72', '-1,-2,-3,-4,-5') ;
insert into aggregation_types (id,DESCRIPTION, RECORD_CONFIG_IDS) values (221,'Internal ID', '71,72') ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 213) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 214) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 221) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 213, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 214, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 221, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');

-- Aggregation Type Pseudo Functions --
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 213, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 213, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 213, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 213, id from pseudo_functions where id = 70);

-------Employee Code-----------
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 214, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 214, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 214, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 214, id from pseudo_functions where id = 70);

-------------------------

insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 213, 0, 0, 70) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 214, 0, 0, 70) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 221, 213,0,70) ;

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 213, 6, 214, 217) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 214, 6, 214, 217) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval,221, 6, 214, 217) ;

--Granularity And Priority of Aggregation Types 
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 213, 0, 3, null);
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 214, 0, 3, null);

----*********Insert counter clear action for all reference types for Delete   ***----
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 6 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 6 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 6 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 6 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 6 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;

--Manual Profile Match
BEGIN
  FOR ranger_user IN (SELECT * FROM ranger_users)
    LOOP
		INSERT INTO user_options(id, option_id, user_id, value, is_read_only, is_enabled, role_id)
				VALUES(user_options_seq.nextval, 'InternalUserManualProfileMatchRuleID', ranger_user.name, '0', 0, 1, ranger_user.default_role) ;
	END LOOP ;
END ;
/


--Internal User Configuration entries.
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'INTERNAL_USERSIDIncrement','1');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, '70.REFERRER_FIELD_CATEGORIES', '2,5,13,33,213,214') ;

--Generic Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id not in (4,5,6,7,15,14,17,24,25,27,54,30)
                             and record_configs.tname in ('ADJUSTMENT_LOGS', 'CRM_LOGS')) ;

-- Profile Counter - Internal User
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
	(select counter_maps_seq.nextval, 214, record_configs.id, functions.id, 11 
		from functions, record_configs
       where functions.id in (24, 25)
			and record_configs.tname in ('INTERNAL_USERS','CRM_LOGS', 'ADJUSTMENT_LOGS') ) ;

-- Invalid User counter / Using Invalid Subscriber 

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) 
	values(counter_maps_seq.nextval, 213, 71, 54, 8) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) 
	values(counter_maps_seq.nextval, 213, 72, 54, 8) ; 

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) 
	values(counter_maps_seq.nextval, 214, 71, 54, 8) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) 
	values(counter_maps_seq.nextval, 214, 72, 54, 8) ; 


-- Internal User
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 214, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 214, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 214, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 214, 70) ;

-- Adjustment Log
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 214, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 214, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 214, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 214, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 214, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 221, 71) ;

-- CRM Log
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 214, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 214, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 214, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 214, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 214, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 221, 72) ;



-- Expandable Field Maps entries for Internal User
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (176, 'Internal User - Active Subscriber', 83, 'PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW', 0);


-- For Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 116, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 116, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW WORK_FLOW', 0);

--- Internal User
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval , 'Internal User - Disconnected Subscriber', 83, 'PHONE_NUMBER', 105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW', 0) ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (expandable_field_maps_seq.nextval, 'InternalUserId-InternalUser', 15, 'VALUE', 83, 'ID', 0, 213, 'RECORD_VIEW');

-- Expandables For Internal User Management

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (140, 'Internal-User-Internal User-ID', 83, 'INTERNAL_USER_ID, EMPLOYEE_CODE ', 112, 'INTERNAL_USER_ID, EMPLOYEE_CODE', 0, 213, '');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (141, 'AdjustmentLog-InternalUser-ID', 84, 'INTERNAL_USER_ID', 83, 'INTERNAL_USER_ID', 0, 213, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (142, 'CRMLog-InternalUser-ID', 85, 'INTERNAL_USER_ID', 83, 'INTERNAL_USER_ID', 0, 213, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (143, 'Alarm-InternalUser', 10, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (144, 'Alarm-InternalUser', 16, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (145, 'Alarm-InternalUser', 17, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (146, 'Alarm-InternalUser', 18, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (147, 'Alarm-InternalUser', 19, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (148, 'AdjustmentLog-InternalUser-EmployeeCode', 84, 'EMPLOYEE_CODE', 83, 'EMPLOYEE_CODE', 0, 214, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (149, 'CRMLog-InternalUser-EmployeeCode', 85, 'EMPLOYEE_CODE', 83, 'EMPLOYEE_CODE', 0, 214, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (241, 'adjustmenlog - internaluser', 84, 'INTERNAL_USER_ID, EMPLOYEE_CODE', 83, 'INTERNAL_USER_ID, EMPLOYEE_CODE', 0, 213, '');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (242, 'crmlog- internaluser', 85, 'INTERNAL_USER_ID, EMPLOYEE_CODE', 83, 'INTERNAL_USER_ID, EMPLOYEE_CODE', 0, 214, '');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (243, 'AdjustmentLog - Active Subscriber', 84, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (244, 'InternalUser - AdjustmentLog', 83, 'PHONE_NUMBER', 84, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


--For 'Suspect Values For Key'
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (201, 'InternalUserId-InternalUser', 115, 'VALUE', 83, 'ID', 0, 213, 'RECORD_VIEW');

INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (164, 'Internal User - Adjustment Logs', 83, 'INTERNAL_USER_ID,EMPLOYEE_CODE', 84, 'INTERNAL_USER_ID,EMPLOYEE_CODE', 1, 214, 'RECORD_VIEW', 0);
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (165, 'Internal User - CRM Logs', 83, 'INTERNAL_USER_ID,EMPLOYEE_CODE', 85, 'INTERNAL_USER_ID,EMPLOYEE_CODE', 1, 214, 'RECORD_VIEW', 0);

INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (200, 'Alarm-InternalUser', 10, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW WORK_FLOW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 96, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 116, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 16, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 17, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 18, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 19, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0) ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (212, 'Alarm-InternalUser', 118, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (213, 'Alarm-InternalUser', 118, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0);

----- For Adjustments Log Record View
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval , 'AdjustmentLog - Disconnected Subscriber', 84, 'PHONE_NUMBER', 105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;

------Internal ID (Specific to Nikira ) Mapping Provided .
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 71, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 72, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 70, '1') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 33, 70, '2');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 18, 71, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 18, 72, '10') ;

-- Internal User
--Entries for Profile Counter
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 221, 51, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 51, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 219, 51, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 217, 51, '1') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 5, 70, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 213, 70, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 216, 70, '140.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 217, 70, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 219, 70, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 70, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 13, 70, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 70, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 183, 70, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 184, 70, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 185, 70, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 186, 70, '8') ;
-- Phone Number
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 70, '15') ;

-- Adjustment Log
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 13, 71, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 71, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 213, 71, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 219, 71, '241.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 71, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 5, 71, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 71, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 17, 71, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 217, 71, '241.1') ;

--Adjustment Logs Mapping with subscriber
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,16,71,'243.32') ;
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,29,71,'243.22') ;

-- CRM Log
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 13, 72, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 213, 72, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 219, 72, '242.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 5, 72, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 72, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 214, 72, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 217, 72, '242.1') ;



------Global Exception for Internal User --------------------------------------------------------------------------------------------------------

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 70, 0, 999) ;
insert into filters_rules (select filters_seq.currval, id from  rules where category='DISPATCHER.GLOBAL_EXCEPTION');
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'15','+%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,' ',1) ;
insert into record_configs_rules (select id, 70, 0 from  rules where category='DISPATCHER.GLOBAL_EXCEPTION');

---------------------------------------------------------------------------------------------


--------------Internal User Rules

----- Update internal user action ----
insert into actions (ID, ACTION_NAME, IS_VISIBLE) values (57,'Update Internal User',0);

insert into record_configs_rules(rule_id, record_config_id) values(14, 70) ;

-- Dispatcher Rule - Internal User DataStream ------------------------

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'999',rules_key_seq.nextval,'internal user dispatch','0','213','0','0',NULL,'1',TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 10007) ;
insert into record_configs_rules(rule_id, record_config_id) values (rules_seq.currval, 70) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval, 7) ;


----------- Add Internal User To DB ----- 

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'999',rules_key_seq.nextval,'add internal user to db','0','213','0','0',NULL,'1',TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SYSTEM_RULES','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 10007) ;
insert into record_configs_rules(rule_id, record_config_id) values (rules_seq.currval, 70) ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 70, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, rules_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '140.17', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval, 41) ;

----------- Update Internal User In DB ----- 

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'999',rules_key_seq.nextval,'update internal user in db','0','213','0','0',NULL,'1',TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SYSTEM_RULES','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 10007) ;
insert into record_configs_rules(rule_id, record_config_id) values (rules_seq.currval, 70) ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 70, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, rules_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '140.17', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval, 57) ;

----------------------------------------------------------------------------

-- Adjustment Logs
insert into record_configs_rules(rule_id, record_config_id) values(6, 71) ;
insert into record_configs_rules(rule_id, record_config_id) values(7, 71) ;

--- Internal User Output File Write Action----------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('12','999','12','Internal User File Write Action','1','213','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 12, 10005) ;

insert into record_configs_rules(rule_id, record_config_id) values(12, 72) ;

insert into actions_rules(rule_id, action_id) values(12, 5) ;

-- CRM Logs Dispatcher Rule------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('13','999','13','Internal User Dispatcher','0','213','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 13, 10006) ;

insert into record_configs_rules(rule_id, record_config_id) values(13, 72) ;
insert into actions_rules(rule_id, action_id) values(13, 7) ;

-- Manual Profile Match For Internal User Dispatcher Rule------------------------
insert into record_configs_rules(rule_id, record_config_id) values(16, 70) ;



-- Role Filter for Active Alarms: REFERENCE_TYPE = 'INTERNAL USER ID' and STATUS in (AVL,ALT,INV,NEW)

insert into filters (id, name, record_config_id, is_exception, network_id, user_id, is_active, category) 
		values (filters_seq.nextval, null, '21', '0', '999', null, '1', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id, priority) 
		values (expressions_seq.nextval, '8', '0,1,3,6', '1030', '8', '0') ;

insert into filter_tokens (id, filter_id, description, expression_id, contained_filter_id, 
							system_filter, begin_group_ind, combining_operator, end_group_ind) 
		values (filter_tokens_seq.nextval, filters_seq.currval, 'Reference Type In Internal User', 
				expressions_seq.currval, null, '0', null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id, priority) 
		values (expressions_seq.nextval, '14', '6', '1030', '8', '0') ;

insert into filter_tokens (id, filter_id, description, expression_id, contained_filter_id, 
							system_filter, begin_group_ind, combining_operator, end_group_ind) 
		values (filter_tokens_seq.nextval, filters_seq.currval, 'Status In AVL,INV,NEW', 
				expressions_seq.currval, null, '0', null, null, null) ;

delete from role_options where option_id = '10.DAC_filter' and role_id = 999 ;

insert into role_options (id, role_id, option_id, value) 
		values (role_options_seq.nextval, '999', '10.DAC_filter', filters_seq.currval) ;

-- Role Filter for Active Alerts: AGGREGATION_TYPE = 'INTERNAL USER ID'

insert into filters (id, name, record_config_id, is_exception, network_id, user_id, is_active, category) 
		values (filters_seq.nextval, null, '11', '0', '999', null, '1', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id, priority) 
		values (expressions_seq.nextval, '10', '213,214', '1024', '8', '0') ;

insert into filter_tokens (id, filter_id, description, expression_id, contained_filter_id, 
							system_filter, begin_group_ind, combining_operator, end_group_ind) 
		values (filter_tokens_seq.nextval, filters_seq.currval, 'Aggregation Type in Internal User ID,Employee Code', 
				expressions_seq.currval, null, '0', null, null, null) ;

delete from role_options where option_id = '32.DAC_filter' and role_id = 999 ;

insert into role_options (id, role_id, option_id, value) 
		values (role_options_seq.nextval, '999', '32.DAC_filter', filters_seq.currval) ;

-- Role Filter for Rules: USER_ID = 'system'

insert into filters (id, name, record_config_id, is_exception, network_id, user_id, is_active, category) 
		values (filters_seq.nextval, null, '44', '0', '999', null, '1', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id, priority) 
		values (expressions_seq.nextval, '9', 'system', '1024', '7', '0') ;

insert into filter_tokens (id, filter_id, description, expression_id, contained_filter_id, 
							system_filter, begin_group_ind, combining_operator, end_group_ind) 
		values (filter_tokens_seq.nextval, filters_seq.currval, 'User Not Equal system', 
				expressions_seq.currval, null, '0', null, null, null) ;

delete from role_options where option_id = '52.DAC_filter' and role_id = 999 ;

insert into role_options (id, role_id, option_id, value) 
		values (role_options_seq.nextval, '999', '52.DAC_filter', filters_seq.currval) ;




--- Filters of Store Internal User for Logs of Invalid Internal User 

insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, pseudo_function_id, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category, is_active) values (rules_seq.nextval, 999 , rules_key_seq.nextval, 'Store Referrer', 0, 214, 0, 0, NULL, 1, sysdate, sysdate, 1, 'radmin', NULL, 1, 'DISPATCHER', 1);
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 4) ;

insert into filters (id, name, record_config_id, is_exception, network_id, category, is_active) values (filters_seq.nextval, null, 71, 0, 999, 'INVALID_REFERRER', 1) ;
insert into expressions (id, left_field,left_field_indicator, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, 14, 1025, '7', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, system_filter) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, 1) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, rules_seq.currval) ;

insert into filters (id, name, record_config_id, is_exception, network_id, category, is_active) values (filters_seq.nextval, null, 72, 0, 999, 'INVALID_REFERRER', 1) ;
insert into expressions (id, left_field,left_field_indicator, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, 10, 1025, '7', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, system_filter) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, 1) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, rules_seq.currval) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval, 66) ;
insert into record_configs_rules (rule_id, record_config_id, granularity) values (rules_seq.currval, 71, 0) ;
insert into record_configs_rules (rule_id, record_config_id, granularity) values (rules_seq.currval, 72, 0) ;


--For PAGE SIZE 'default' and 'radmin'
insert into user_options (id, option_id, user_id, value, is_read_only, is_enabled) (select user_options_seq.nextval, rview.id || '.PageSize', users.name, '50', 0, 1 from record_view_configs rview, ranger_users users where rview.id in (83,84,85,112) and users.name != 'nadmin') ;
--For 'nadmin'
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) (select user_options_seq.nextval, rview.id || '.PageSize', 'nadmin', 2, '50', 0, 1 from record_view_configs rview where rview.id in (83,84,85,112)) ;

--For AlarmXDRPageSize 'default' and 'radmin'
insert into user_options (id, option_id, user_id, value, is_read_only, is_enabled) (select user_options_seq.nextval, rview.id || '.AlarmXDRPageSize', 'default', '50', 0, 1 from record_view_configs rview where rview.id in (84,85)) ;
insert into user_options (id, option_id, user_id, value, is_read_only, is_enabled) (select user_options_seq.nextval, rview.id || '.AlarmXDRPageSize', 'radmin', '50', 0, 1 from record_view_configs rview where rview.id in (84,85)) ;
--For 'nadmin'
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) (select user_options_seq.nextval, rview.id || '.AlarmXDRPageSize', 'nadmin', 2, '50', 0, 1 from record_view_configs rview where rview.id in (84,85)) ;


-- Adjustment Log --
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 1, 0, 1, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 2, 0, 2, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 3, 0, 3, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max) values(basic_filter_configs_seq.nextval, 71, 84, 4, 10, 4, 0, '01-01-1970', '31-12-9999') ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max) values(basic_filter_configs_seq.nextval, 71, 84, 5, 10, 5, 0, 0, 32767) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 6, 0, 6, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 7, 0, 7, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 8, 0, 8, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 71, 84, 10, 0, 9, 0) ;

-- CRM Logs ---
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 72, 85, 1, 0, 1, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max) values(basic_filter_configs_seq.nextval, 72, 85, 2, 10, 2, 0, '01-01-1970', '31-12-9999') ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 72, 85, 3, 0, 3, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 72, 85, 4, 0, 4, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(basic_filter_configs_seq.nextval, 72, 85, 6, 0, 6, 0) ;

-- Manual Alarm Rule entries for CRM and Adjustment Logs ----- 
insert into record_configs_rules (rule_id, record_config_id) (select r.id, rc.id from rules r , record_configs rc where rc.id in (71,72) and r.category = 'MANUAL_ALARM_RULES') ;

-- Inserts for record_types which are not to be used by alarmdenormalizer
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(6,70,'INTERNAL_USERS') ;

-- Entries for DAC enabled Record Views --
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 85, id from tasks where link like '%/record_view/list/85?fetch_records=%') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 84, id from tasks where link like '%/record_view/list/84?fetch_records=%') ;

--Internal user adjustment log record view selected fields.

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'nadmin', 2, '1, 2 ,3 ,4 ,5 ,6,7,8,9,10', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'radmin', 1, '1, 2 ,3 ,4 ,5 ,6,7,8,9,10', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval, '84.SelectedFields', 'default', 1, '1, 2 ,3 ,4 ,5 ,6,7,8,9,10', 0, 1) ;

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','nadmin', 2, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','radmin', 1, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFields','default', 1, '4', 0, 1);

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','nadmin', 2, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','radmin', 1, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'84.chosenFieldSortOrder','default', 1, '1', 0, 1);

--Internal user CRM log record view selected fields.

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.SelectedFields', 'nadmin', 2, '1, 2 ,3, 4 ,5, 6', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.SelectedFields', 'radmin', 1, '1, 2 ,3, 4 ,5, 6', 0, 1) ;
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.SelectedFields', 'default', 1, '1, 2 ,3, 4, 5, 6', 0, 1) ;
                            
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','nadmin', 2, '4', 0, 1); 
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','radmin', 1, '4', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFields','default', 1, '4', 0, 1);

insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','nadmin', 2, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','radmin', 1, '1', 0, 1);
insert into user_options (id, option_id, user_id, role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'85.chosenFieldSortOrder','default', 1, '1', 0, 1);


--- Default values for Internal User

insert into default_field_values (id, record_config_id, field_category_id, record_information_type, field_value) values (default_field_values_seq.nextval, 70, 33, 7, 'Default') ; 

insert into tags values(tags_seq.nextval, 'CRM Logs', 'DATA_STREAMS') ;
insert into tags values(tags_seq.nextval, 'Adjustment Logs', 'DATA_STREAMS') ;

commit ;
