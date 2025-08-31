spool nikira-DML-record-config-demo-recharge.log
set feedback off ;
set serveroutput off ;

--Record Types--
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_cost_computation_enabled) values(2,'RECHARGE_LOG','Recharge Logs',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD TEST_RULE DATASTREAM', 1, 1) ;

-- Archive Map ----
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(4,'ARCHIVED_RECHARGE_LOG','AR_ALARM_RECHARGE_LOG',2);

-- Alarm XDR map ---
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_RECHARGE_LOG',2);

-- Record Views
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled, create_manual_alarm, is_advanced_query_enabled,help_file_key) values(2,'Recharge Logs',2,'','TBL.ID DESC', 1, 1, 1, 1, 1, 1,'RECHARGE_LOG_RECORD_VIEW') ;
	
-- Values for Recharge Log Table  
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (25, 2, 'Time Stamp', 'TIME_STAMP',1,1,4, 0,'', '', 1, null, 1, 1, 2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (26, 2, 'Phone Number', 'PHONE_NUMBER',2,2,3, 1, '', '', 32, null, 1, 1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (27, 2, 'Amount', 'AMOUNT',3,3,2, 0, 'GR CR', '', 16, null, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (28, 2, 'Recharge Type', 'RECHARGE_TYPE',4,4,1, 0, '', '', 20, 98, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (29, 2, 'Status', 'STATUS',5,5,1, 0, '', '', 20, 16, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (30, 2, 'Credit Card', 'CREDIT_CARD',6,6,3, 0, '', '', 80, null, 1, 1, 5, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (31, 2, 'PIN Number', 'PIN_NUMBER',7,7,3, 0, '', '', 40, null, 1, 1, 6, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) (select 32, 2, 'Network', 'NETWORK_ID',8,8,1, 0, '', '',  20, 10,decode(count(*),1,0,1),decode(count(*),1,0,1),'','' from networks) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (33, 2, 'Account ID', 'ACCOUNT_ID',9,9,8, 0, '', '', 20, null, 1, 0, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (34, 2, 'Subscriber ID', 'SUBSCRIBER_ID',10,10,8, 0, '', '',  20, null, 0, 0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (35, 2, 'Recharge Card Number', 'SERIAL_NUMBER',49,11,3, 0, '', '', 40, null, 1, 1, 7, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (36, 2, 'IMSI', 'IMSI',17,14,3, 0, '', '', 40, null, 1, 1, 9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (37, 2, 'IMEI', 'IMEI',18,15,3, 0, '', '', 40, null, 1, 1, 9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (38, 2, 'CDR TYPE', 'CDR_TYPE',19,16,1, 0, '', '', 40,3, 1, 1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (39, 2, 'SERVICE', 'SERVICE',20,17,1, 0, '', '', 40, 35, 1, 1, 1, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (101, 2, 'RECHARGE ID', 'ID', 12, 0, 8, 0, '', '', 20, null,0,0,null, '7') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (102, 2, 'Day of Year', 'DAY_OF_YEAR', 13, 0, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (103, 2, 'Hour of Day', 'HOUR_OF_DAY', 14, 0,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (104, 2, 'Voucher Expiry Date', '',15,12,4, 0,'', '', 1, null, 1, 1, 2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (105, 2, 'Grace Period', '',16,13,8,'', 0,'', '', 16, null, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Service Number Type', 'SERVICE_NUMBER_TYPE', '18', 0, 1, 'GR CR', 1, null, 21, null, 720, 1, 20,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Balance Before', 'BALANCE_BEFORE', '19', 0, 1, null, 3, null, 22, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Balance After', 'BALANCE_AFTER', '20', 0, 1, null, 3, null, 23, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Other Party Number', 'OTHER_PARTY_NUMBER', '21', 0, 1, null, 3, null, 24, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Action Type', 'ACTION_TYPE', '22', 0, 1, null, 3, null, 25, null, 1559, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Spark Processing Time', 'SPARK_PROCESSING_TIME', '23', 0, 0, null, 3, null, 26, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'DB loading time', 'DB_LOADING_TIME', '24', 0, 0, null, 3, null, 27, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Other Party Country', 'OTHER_PARTY_COUNTRY', '25', 0, 1, null, 3, null, 28, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Raw Phone Number', 'RAW_PHONE_NUMBER', '26', 0, 1, null, 3, null, 29, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Raw Other Party Number', 'RAW_OTHER_PARTY_NUMBER', '27', 0, 1, null, 3, null, 30, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'File Name', 'FILE_NAME', '28', 0, 1, null, 3, null, 31, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'DS Name', 'DS_NAME', '29', 0, 1, null, 3, null, 32, null, null, 1, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 1', 'OPTIONAL_FIELD_1', '30', 0, 0, null, 3, null, 33, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 2', 'OPTIONAL_FIELD_2', '31', 0, 0, null, 3, null, 34, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 3', 'OPTIONAL_FIELD_3', '32', 0, 0, null, 3, null, 35, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 4', 'OPTIONAL_FIELD_4', '33', 0, 0, null, 3, null, 36, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 5', 'OPTIONAL_FIELD_5', '34', 0, 0, null, 3, null, 37, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 6', 'OPTIONAL_FIELD_6', '35', 0, 0, null, 3, null, 38, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 7', 'OPTIONAL_FIELD_7', '36', 0, 0, null, 3, null, 39, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 8', 'OPTIONAL_FIELD_8', '37', 0, 0, null, 3, null, 40, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 9', 'OPTIONAL_FIELD_9', '38', 0, 0, null, 3, null, 41, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 10', 'OPTIONAL_FIELD_10', '39', 0, 0, null, 3, null, 42, null, null, 0, 255,10, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 11', 'OPTIONAL_FIELD_11', '40', 0, 0, null, 2, null, 43, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 12', 'OPTIONAL_FIELD_12', '41', 0, 0, null, 2, null, 44, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 13', 'OPTIONAL_FIELD_13', '42', 0, 0, null, 2, null, 45, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 14', 'OPTIONAL_FIELD_14', '43', 0, 0, null, 4, null, 47, null, null, 0, 0,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Optional Field 15', 'OPTIONAL_FIELD_15', '44', 0, 0, null, 4, null, 48, null, null, 0, 0,0, null, '', null, 0, 0) ;

--Field Configs Additionals
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,2,'IS_CURRENCY',1);
--For Recharge Log 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (12, 'Active Subscriber Details', 2, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Details', 2, 'PHONE_NUMBER', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');


-- For Record To Subscriber Accociation for Active/Black List
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (253, 'Subscriber Details', 2, 'PHONE_NUMBER,SUBSCRIBER_ID', 102, 'PHONE_NUMBER,ID', 0, 2, 'RULE');

--Entries For Recharge
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  1, 2, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2, 2, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  5, 2, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 13, 2, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 16, 2, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 23, 2, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 46, 2, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 17, 2, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 24, 2, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 29, 2, '253.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 55, 2, '253.271.13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 56, 2, '253.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 32, 2, '253.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 42, 2, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 79, 2, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 2, '253.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 203, 2, '253.271.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 212, 2, '253.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 218, 2, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 47, 2, '12.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 7, 2, '253.271.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2077, 2, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 18, 2, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  4, 2, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  3, 2, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  6, 2, '20') ;

insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6009, '21') ;

insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6010, '253.54') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6011, '253.55') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6012, '253.56') ;

insert into filter_index_fields(record_config_id, field_id) values(2, 2) ;
insert into filter_index_fields(record_config_id, field_id) values(2, 7) ;
insert into filter_index_fields (record_config_id, field_id) values (2, 21.0) ;


-- View Config Components Start
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 2, 'enable_fetch_records', 'false') ;
-- View Config Components End

----- For Recharge Log View
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval,  'Disconnected Subscriber Details', 2, 'PHONE_NUMBER',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');



insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,901,2,'253.226.16');

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 89, 2, '253.35') ;
insert into field_record_config_maps(id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6017, '7') ;
insert into field_record_config_maps(id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6016, '49') ;
insert into field_record_config_maps(id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2.0, 6020, '25') ;


--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,2,'FLOAT_PRECISION',2); 


--Recharge Log To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number Recharge Logs', 2, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


commit ;

