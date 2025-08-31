spool nikira-DML-record-config-demo-gprs.log
set feedback off ;
set serveroutput off ;

--Record Types--
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_cost_computation_enabled) values(7,'GPRS_CDR','GPRS',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD TEST_RULE CUSTOMER_ALERT DATASTREAM', 1, 1) ;

---field category for Charging ID--
insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id) values(54, 'Charging ID', 'AGGREGATION_TYPE NICKNAME NO_DURATION', 3, 2, 54) ;

-- Archive Map ----
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(2,'ARCHIVED_GPRS_CDR','ARCHIVED_ALARM_GPRS_CDR',7);

-- Alarm XDR map ---
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_GPRS_CDR',7);

-- Record Views
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled, create_manual_alarm, is_advanced_query_enabled,help_file_key) values(7,'GPRS',7,'','ID DESC', 1, 1, 1, 1, 1, 1,'GPRS_RECORD_VIEW') ; 

-------GPRS--------------
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (300, 7, 'Receive Time', '', 1, 1,4,0 , '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) (select 301, 7, 'Network', 'NETWORK_ID', 2, 2,1, 0, '', '', 20, 10,decode(count(*), 1,0,1),decode(count(*), 1,0,1),'', '' from networks) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (302, 7, 'Record Type', 'RECORD_TYPE', 3, 3,1, 0, '', '', 20, 100, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (303, 7, 'Time Stamp', 'TIME_STAMP', 4, 4,4, 0, '', '',  1,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (304, 7, 'Duration', 'DURATION', 5, 5,1, 0, 'GR CR ', '', 20, 9, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (305, 7, 'Phone Number' , 'PHONE_NUMBER',6,6,3, 1, '', '', 32, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (306, 7, 'Service Type', 'SERVICE_TYPE',7,7,1, 0, '', '', 20, 18, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (307, 7, 'GPRS Type', 'CDR_TYPE',8,8,1, 0, '', '', 20, 3, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (308, 7, 'Upload Data Volume', 'UPLOAD_DATA_VOLUME',9,9,2, 0, 'CR', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (309, 7, 'Download Data Volume', 'DOWNLOAD_DATA_VOLUME',10,10,2, 0, 'CR', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (310, 7, 'QoS Requested', 'QOS_REQUESTED',11,11,1, 0, '', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (311, 7, 'QoS Negotiated', 'QOS_NEGOTIATED',12,12,1, 0, '', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (312, 7, 'Value', 'VALUE',13,13,2, 0, 'GR CR', '', 16, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (313, 7, 'Subscriber ID', 'SUBSCRIBER_ID',14,14,8, 0, '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (314, 7, 'Charging  ID', 'CHARGING_ID',15,15,3, 0, '', '', 26, null, 1,1,10, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (315, 7, 'Service', 'SERVICE',16,16,1, 0, '', '', 20, 35, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (316, 7, 'IMSI', 'IMSI_NUMBER',17,17,3, 0, '', '', 32, null, 1,1,3, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (317, 7, 'IMEI', 'IMEI_NUMBER', 18, 18,3, 0, '', '', 32, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (318, 7, 'Session Status', 'SESSION_STATUS', 19, 19, 1, 0, '', '', 2, 56, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (319, 7, 'Access Point Name', 'ACCESS_POINT_NAME', 20, 20, 3, 0, '', '', 64, null, 1,1,9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, is_visible, is_filter, reg_exp_id, derivative_function, translation_id) values (320, 7, 'Geographic Position', 'GEOGRAPHIC_POSITION',21,21,3, 0, '', '', 32, 1,1,4, '', 99) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (321, 7, 'Cause for Session Closing', 'CAUSE_FOR_SESSION_CLOSING',22,22,1, 0, '', '', 2, 58, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (322, 7, 'PDP Type', 'PDP_TYPE',23,23,3, 0, '', '', 32, null, 1,1,10, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (323, 7, 'Served PDP Address', 'SERVED_PDP_ADDRESS',24,24,3, 0, '', '', 46, null, 1,1,10, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (324, 7, 'GPRS ID', 'ID', 25, 0, 8, 0, '', '', 20, null,0,0,null, '2') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (325, 7, 'Day of Year', 'DAY_OF_YEAR', 26, 0, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (326, 7, 'GMTTime Stamp', '', 27, 0,8, 0, '', '',  20,null, 0,0,'', '9') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (327, 7, 'Cellsite ID', '', 28, 0,8, 0, '', '',  20,null, 0,0,'', '10') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (328, 7, 'Hour of Day', 'HOUR_OF_DAY', 29, 0,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (329, 7, 'Content Volume', '', 30, 0,2, 0, '', '(GPRS_CDR.UPLOAD_DATA_VOLUME+ GPRS_CDR.DOWNLOAD_DATA_VOLUME)',  20,null, 0,0,'', '13') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (330, 7, 'VPMN', 'VPMN', 31, 25, 3, 1, '', '',  40,null, 1, 1, 17, '') ;

----Field Configs Additionals
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,7,'IS_CURRENCY',1);


--For GPRS
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (9, 'Active Subscriber Details ', 7, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Details ', 7, 'PHONE_NUMBER', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE') ;


-- For Record To Subscriber Accociation for Active/Black List
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (252, 'Subscriber Details ', 7, 'PHONE_NUMBER,SUBSCRIBER_ID', 102, 'PHONE_NUMBER,ID', 0, 2, 'RULE') ;


--Entried For GPRS
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  1, 7, '25') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  2, 7, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  3, 7, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  4, 7, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 7, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  6, 7, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 11, 7, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 12, 7, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 7, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 14, 7, '21') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 7, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17, 7, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 18, 7, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 19, 7, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 23, 7, '26') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 7, '252.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 39, 7, '27') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 40, 7, '252.23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 7, '252.5.7.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 7, '252.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 7, '252.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 45, 7, '28') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 7, '9.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 7, '29') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 49, 7, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 30, 7, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 50, 7, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 51, 7, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 30, 7, '252.24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 52, 7, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 53, 7, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 54, 7, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 7, '252.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7,  7, '252.271.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 7, '252.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 200, 7, '31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2071, 7, '252.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 83, 7, '252.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2072, 7, '125.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6001, 7, '252.271.12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6002, 7, '252.190.188.6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6003, 7, '252.47') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6004, 7, '252.271.53') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6005, 7, '252.45') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6006, 7, '252.46') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6007, 7, '252.271.51') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 6008, 7, '252.271.52') ;

-----Aggregation_types_maps entry for Charging ID ----
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 54, 2, 29, 3) ;

----Aggregation_type_granularity_map entry for Charging ID--
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority, rule_category) values(agg_type_granularity_maps_seq.nextval, 54, 0, 1, null) ;

insert into filter_index_fields(record_config_id, field_id) values(7, 6) ;
insert into filter_index_fields(record_config_id, field_id) values(7, 15) ;



-- CounterManager Configurations 
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (54, 'Charging ID', '7', '-1,-2,-3,-4,-5') ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 54) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 54, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 54, 7) ;

-- View Config Components Start
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 7, 'enable_fetch_records', 'false') ;


--GPRS CDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number GPRS CDRs', 7, 'PHONE_NUMBER', 7, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


----- For Gprs CDR View
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 7, 'PHONE_NUMBER',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE') ;


insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(field_record_config_map_seq.nextval,901,7,'252.226.16');


--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,9,7,'FLOAT_PRECISION',2); 
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,7,'FLOAT_PRECISION',2); 
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,7,'FLOAT_PRECISION',2); 

commit ;

