
--Record Types--

insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_cost_computation_enabled) values(1,'CDR','CDR',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD TEST_RULE CUSTOMER_ALERT ALARM_LINK DATASTREAM', 1, 1) ;

-- Archive Map ----
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(1,'ARCHIVED_CDR','ARCHIVED_ALARM_CDR',1);

-- Alarm XDR map ---
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_CDR',1);

-- Record Views
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled, create_manual_alarm, is_advanced_query_enabled,help_file_key) values(1,'CDR',1,'','TBL.ID DESC', 1, 1, 1, 1, 1, 1,'CDR_RECORD_VIEW') ;

-- Values for CDR Table
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (1, 1, 'Receive Time', '', 1, 1,4,0 , '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) (select 2, 1, 'Network', 'NETWORK_ID', 2, 2,1, 0, '', '', 20, 10,decode(count(*), 1,0,1),decode(count(*), 1,0,1),'', '' from networks) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (3, 1, 'Caller Number', 'CALLER_NUMBER', 3, 3,3, 1, '', '', 80, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (4, 1, 'Called Number', 'CALLED_NUMBER', 4, 4,3, 1, '', '', 80, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (5, 1, 'Forwarded Number', 'FORWARDED_NUMBER', 5, 5,3,0 , '', '', 80, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (6, 1, 'Record Type', 'RECORD_TYPE', 6, 6,1, 0, '', '', 20, 1, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (7, 1, 'Duration', 'DURATION', 7, 7,8, 0, 'GR CR', '', 20, 9, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (8, 1, 'Time Stamp', 'TIME_STAMP', 8, 8,4, 0, 'CR', '',  1,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (9, 1, 'IMEI', 'EQUIPMENT_ID', 9, 9,3, 0, '', '', 40, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (10, 1, 'IMSI', 'IMSI_NUMBER',10,10,3, 0, '', '', 40, null, 1,1,3, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (11, 1, 'Geographic Position', 'GEOGRAPHIC_POSITION',11,11,3, 0, '', '', 32, 99, 1,1,4, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (12, 1, 'Call Type', 'CALL_TYPE',12,12,1, 0, '', '', 20, 2, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (13, 1, 'Subscriber ID', 'SUBSCRIBER_ID',13,13,8, 0, '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (14, 1, 'Value', 'VALUE',14,14,2, 0, 'GR CR', '', 16, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (15, 1, 'CDR Type', 'CDR_TYPE',15,15,1, 0, '', '', 20, 3, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (16, 1, 'Service Type', 'SERVICE_TYPE',16,16,1, 0, '', '', 20, 4, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (17, 1, 'CDR Category', 'CDR_CATEGORY',17,17,1, 0, '', '', 20, 5, 1, 1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (18, 1, 'Is Complete', 'IS_COMPLETE',18,18,6, 0, '', '', 20, 7, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (19, 1, 'Co-Related Field', '',19,19,3, 0, '', '', 20, 1, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (20, 1, 'Is Attempted', 'IS_ATTEMPTED',20,20,6, 0, '', '', 20, 6, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (21, 1, 'Service', 'SERVICE',21,21,1, 0, '', '', 20, 35, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (22, 1, 'Phone Number' , 'PHONE_NUMBER',22,22,3, 1, '', '', 80, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (23, 1, 'CDR ID', 'ID', 23, 0, 8, 0, '', '', 20, null,0,0,null, '2') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (24, 1, 'Day of Year', 'DAY_OF_YEAR', 24, 0, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (88, 1, 'GMTTime Stamp', '', 25, 0,8, 0, '', '',  20,null, 0,0,'', '9') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (89, 1, 'OtherPartyNumber', '', 26, 0,3, 0, '', '',  32,null, 1,1,1, '11') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (90, 1, 'Cellsite ID', '', 27, 0,8, 0, '', '',  20,null, 0,0,'', '10') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (93, 1, 'Hour of Day', 'HOUR_OF_DAY', 28, 0,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (94, 1, 'Other Party Country Code', 'OTHER_PARTY_COUNTRY_CODE', 29, 0,3, 0, '', '',  20, 41, 1,1,'', '22') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (95, 1, 'VPMN', 'VPMN', 30, 23, 3, 1, '', '',  40, null, 1, 1, 17, '') ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Service Number Type', 'SERVICE_NUMBER_TYPE', '24', 0, 1, null, 1, null, 31, null, 720, 1, 20,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Connection Type', 'CONNECTION_TYPE', '25', 0, 1, null, 1, null, 32, null, 1558, 1, 20,13, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Other Party Number', 'OTHER_PARTY_NUMBER', '26', 0, 1, null, 3, null, 33, null, null, 1, 40,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Incoming Trunk ID', 'INCOMING_TRUNK_ID', '27', 0, 1, null, 3, null, 34, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Outgoing Trunk ID', 'OUTGOING_TRUNK_ID', '28', 0, 1, null, 3, null, 35, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Other Party Country', 'OTHER_PARTY_COUNTRY', '29', 0, 1, null, 3, null, 36, null, 41, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Spark Processing Time', 'SPARK_PROCESSING_TIME', '30', 0, 0, null, 1, null, 37, null, null, 0, 20,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'DB Loading Time', 'DB_LOADING_TIME', '31', 0, 0, null, 1, null, 38, null, null, 0, 20,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Originating SMSC Address', 'ORG_SMSC_ADDRESS', '32', 0, 1, null, 3, null, 39, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Destination SMSC Address', 'DEST_SMSC_ADDRESS', '33', 0, 1, null, 3, null, 40, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Raw Caller Number', 'RAW_CALLER_NUMBER', '34', 0, 1, null, 3, null, 41, null, null, 1, 80,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Raw Called Number', 'RAW_CALLED_NUMBER', '35', 0, 1, null, 3, null, 42, null, null, 1, 80,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Raw Forwarded Number', 'RAW_FORWARDED_NUMBER', '36', 0, 1, null, 3, null, 44, null, null, 1, 80,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'File Name', 'FILE_NAME', '37', 0, 1, null, 3, null, 45, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'DS Name', 'DS_NAME', '38', 0, 1, null, 3, null, 46, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 1', 'OPTIONAL_FIELD_1', '39', 0, 0, null, 3, null, 47, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 2', 'OPTIONAL_FIELD_2', '40', 0, 0, null, 3, null, 48, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 3', 'OPTIONAL_FIELD_3', '41', 0, 0, null, 3, null, 49, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 4', 'OPTIONAL_FIELD_4', '42', 0, 0, null, 3, null, 50, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 5', 'OPTIONAL_FIELD_5', '43', 0, 0, null, 3, null, 51, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 6', 'OPTIONAL_FIELD_6', '44', 0, 0, null, 3, null, 52, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 7', 'OPTIONAL_FIELD_7', '45', 0, 0, null, 3, null, 53, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 8', 'OPTIONAL_FIELD_8', '46', 0, 0, null, 3, null, 54, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 9', 'OPTIONAL_FIELD_9', '47', 0, 0, null, 3, null, 55, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 10', 'OPTIONAL_FIELD_10', '48', 0, 0, null, 3, null, 56, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 11', 'OPTIONAL_FIELD_11', '49', 0, 0, null, 2, null, 57, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 12', 'OPTIONAL_FIELD_12', '50', 0, 0, null, 2, null, 58, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 13', 'OPTIONAL_FIELD_13', '51', 0, 0, null, 2, null, 59, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 14', 'OPTIONAL_FIELD_14', '52', 0, 0, null, 4, null, 60, null, null, 0, 20,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Optional Field 15', 'OPTIONAL_FIELD_15', '53', 0, 0, null, 4, null, 61, null, null, 0, 20,0, null, '', null, 0, 0) ;


--------------FIELD CONFIGS ADDITIONALS-----
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,1,'IS_CURRENCY',1);
------------------------------------------- Expandable Field Maps entries START ---------------------------------

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (3, 'Called Active Subscriber Details', 1, 'CALLED_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (4, 'Caller Active Subscriber Details', 1, 'CALLER_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (6, 'Active Subscriber Details', 1, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');


-- For hotlist
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (57, 'Geographic Position CDR', 15, 'VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (2005, 'Geographic Position CDR', 15, 'END_VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');
--For 'Suspect Values For Key'
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (198, 'Geographic Position CDR', 115, 'VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');

-- For Record To Subscriber Accociation for Active/Black List
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (251, 'Subscriber Details', 1, 'PHONE_NUMBER,SUBSCRIBER_ID', 102, 'PHONE_NUMBER,ID', 0, 2, 'RULE NOT_VISIBLE');

-- For CDR
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2, 1, '22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  3, 1, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  4, 1, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  5, 1, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  6, 1, '21') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 11, 1, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 13, 1, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 1, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 17, 1, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 18, 1, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 21, 1, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 1, '23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 32, 1, '251.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 39, 1, '25') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 40, 1, '251.23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 14, 1, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 12, 1, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 41, 1, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 42, 1, '251.5.7.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 43, 1, '251.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 44, 1, '26') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 8, 1, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 9, 1, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 10, 1, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 45, 1, '27') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 47, 1, '6.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 23, 1, '24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 46, 1, '28') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 29, 1, '251.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 24, 1, '251.271.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 1, '251.271.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 200, 1, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 89, 1, '251.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 1, '251.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 203, 1, '251.271.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 201, 1, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 212, 1, '251.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 220, 1,'251.43') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2072, 1, '121.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2076, 1, '29') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 62, 1, '251.34') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6001, 1, '251.271.12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6002, 1, '251.190.188.6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6003, 1, '251.47') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6004, 1, '251.271.53') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6005, 1, '251.45') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6006, 1, '251.46') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6007, 1, '251.271.51') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6008, 1, '251.271.52') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6009, '31') ;


insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6010, '251.54') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6011, '251.55') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6012, '251.56') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6018, '34' ) ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6019, '35' ) ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 6022, '17') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 15, '12') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 19, '16') ;

insert into filter_index_fields(record_config_id, field_id) values(1, 22) ;
insert into filter_index_fields(record_config_id, field_id) values(1, 3) ;
insert into filter_index_fields(record_config_id, field_id) values(1, 4) ;
insert into filter_index_fields(record_config_id, field_id) values(101, 22) ;
insert into filter_index_fields(record_config_id, field_id) values(101, 3) ;
insert into filter_index_fields(record_config_id, field_id) values(101, 4) ;

-- View Config Components Start
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 1, 'enable_fetch_records', 'false') ;

--For CDR
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (172, 'Called Number CDRs', 1, 'CALLED_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (173, 'Caller Number CDRs', 1, 'CALLER_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


----------Black List subsciber info --- start -----
insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (expandable_field_maps_seq.nextval,'Caller Black List Subscriber Details',1,'CALLER_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE NOT_VISIBLE',0);
insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (expandable_field_maps_seq.nextval,'Called Black List Subscriber Details',1,'CALLED_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE NOT_VISIBLE',0);
----------Black List subsciber info --- end  -----

--CDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number CDRs', 1, 'PHONE_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Details', 1, 'PHONE_NUMBER', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');


-- DONT CHANGE EXP FIELD MAP ID of the below statement, since it is being used in Client side.
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (245, 'Caller Active/Blacklist Subscriber Details', 1, 'CALLER_NUMBER', 102, 'PHONE_NUMBER', 0, 2, null); 


------ For CDR Record View
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval , 'Called Disconnected Subscriber Details', 1, 'CALLED_NUMBER',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE NOT_VISIBLE') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval , 'Caller Disconnected Subscriber Details', 1, 'CALLER_NUMBER',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE NOT_VISIBLE') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval , 'Disconnected Subscriber Details', 1, 'PHONE_NUMBER',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE NOT_VISIBLE') ;


-- Bill Cycle Relations --
insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,901,1,'251.226.16');

--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,1,'FLOAT_PRECISION',2); 



---Partial record temp table ----
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(109,'PARTIAL_TEMP_CDR','Partial tempcdr',0,'',0);

--- Partial Record Temp Table Map ---

insert into field_configs (select FIELD_CONFIGS_SEQ.nextval,109,name,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,IS_CASE_SENSITIVE from field_configs where RECORD_CONFIG_ID=1);

insert into field_record_config_maps (select FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, field_category_id, 109, field_association from field_record_config_maps where record_config_id =1 ) ;

insert into partial_temp_table_maps( ID,LOOKUP_TABLE_ID,RECORD_CONFIG_ID,RTF_LOOKUP_TABLE_ID) values(partial_temp_table_maps_seq.nextval,109,1,109);

---- For Phone number hyperlink in ASN CDR view
insert into expandable_field_maps values(expandable_field_maps_seq.nextval,'Subscriber Information',122,'PHONE_NUMBER',102,'PHONE_NUMBER',2,0,'RECORD_VIEW',0);




commit ;

