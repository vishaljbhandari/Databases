spool nikira-DML-new-record-config-isp.log
set feedback off ;
set serveroutput off ;

insert into record_configs (id, tname, description, cacheable, key, is_visible,
	delimeter,category,is_partitioned,is_cost_computation_enabled) values (83,'IPDR','IPDR',0,'ID',1,',','TEST_RULE NAMED_FILTERS
	RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD CUSTOMER_ALERT DATASTREAM', 1 , 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled, create_manual_alarm,is_advanced_query_enabled,help_file_key) values(104,'IPDR',83,NULL,'TBL.ID DESC', 1, 1, 1, 1, 1,1,'IPDR_RECORD_VIEW') ;

--
-- *********** DS_FIELD configuration for ISP *****************************

insert into field_configs (id, record_config_id, name, database_field,field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 83, 'Dayof Year', 'DAY_OF_YEAR', 16,null, 1, 0,'','',20, null, 0,0,null, '1') ;


insert into field_configs (id, record_config_id, name, database_field,is_visible, data_type, field_id, is_filter, width, reg_exp_id, derivative_function,position) values (field_configs_seq.nextval, 83,'ID', 'ID',0,8,15,0,20, 0,30, null) ; 

insert into field_configs (id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 83,'Network', 'NETWORK_ID',1,0,1,1,1,20, 0, 10) ; 


insert into field_configs (id,record_config_id,name,database_field,field_id, position, data_type, format, width, translation_id, is_visible, reg_exp_id, is_filter,ds_category) values (field_configs_seq.nextval,83, 'Time Stamp', 'TIME_STAMP',2,2,4, null,40,null, 1,null,1,'CR') ; 

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, width, translation_id, is_visible, reg_exp_id, is_filter,ds_category) values (field_configs_seq.nextval, 83, 'Duration', 'DURATION', 3,3,8,0,20, 9,1,null, 1,'CR') ;


insert into field_configs (id,record_config_id,name, database_field, position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 83, 'Phone Number', 'PHONE_NUMBER', 4, 1,1, 'GR',3, '',4, '', null,1,40,1, null, null) ;

insert into field_configs (id, record_config_id, name, database_field,field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 83, 'Framed IP Address', 'FRAMED_IP_ADDRESS', 5, 5,3, 0, '','',32,null, 1,23,1) ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 83, 'IPDR Type', 'IPDR_TYPE', 6,6,1, 0, '','', 4, 3,1,9, 1) ;

insert into field_configs (id, record_config_id, name,database_field,field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Upload Data Volume', 'UPLOAD_DATA_VOLUME',7, 7, 2, 0,'', '', 20,null, 1,1,'', '') ;

insert into field_configs (id, record_config_id, name, database_field,field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Download Data Volume', 'DOWNLOAD_DATA_VOLUME',8,8, 2, 0,'','',20, null, 1,1,'', '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'ISP Qos', 'ISP_QOS', 9,9,1, 0, '','',20, null, 1, 1,'', '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Value', 'VALUE', 10, 10, 2,0,'CR', '', 20, null,1, 1,'', '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Subscriber ID', 'SUBSCRIBER_ID',11,11,8, 0,'', '',20, null,0, 0,'', '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'User Name', 'USER_NAME', 12,12, 3, 1, '','',256, null, 1, 1, 36, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Session ID', 'SESSION_ID', 13, 13,3, 0,'','',10, null, 1,1,10, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Session Status', 'SESSION_STATUS',14, 14,1, 0,'','',2, 56, 1,1,'', '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval, 83, 'Hour of Day', 'HOUR_OF_DAY',17, null,1, 0,'','',2, null, 0,0,'', 12) ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 83, 'Content Volume', '', 18, 0,2, 0, '', '(IPDR.UPLOAD_DATA_VOLUME+ IPDR.DOWNLOAD_DATA_VOLUME)',  20,null, 0,0,'', '13') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 83, 'IMEI', '', 19, 0,3, 0, '', '',  20,null, 0,0,'', '19') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 83, 'IMSI', '', 20, 0,3, 0, '', '',  20,null, 0,0,'', '19') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 83, 'Services', '', 21, 0,1, 0, '', '',  20,null, 0,0,'', '14') ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Service Number Type', 'SERVICE_NUMBER_TYPE', '15', 0, 1, null, 1, null, 22, null, 720, 1, 20,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 1', 'OPTIONAL_FIELD_1', '16', 0, 0, null, 3, null, 23, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 2', 'OPTIONAL_FIELD_2', '17', 0, 0, null, 3, null, 26, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 3', 'OPTIONAL_FIELD_3', '18', 0, 0, null, 3, null, 28, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 4', 'OPTIONAL_FIELD_4', '19', 0, 0, null, 3, null, 29, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 5', 'OPTIONAL_FIELD_5', '20', 0, 0, null, 3, null, 30, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 6', 'OPTIONAL_FIELD_6', '21', 0, 0, null, 3, null, 31, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 7', 'OPTIONAL_FIELD_7', '22', 0, 0, null, 3, null, 32, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 8', 'OPTIONAL_FIELD_8', '23', 0, 0, null, 3, null, 33, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 9', 'OPTIONAL_FIELD_9', '24', 0, 0, null, 3, null, 34, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 10', 'OPTIONAL_FIELD_10', '25', 0, 0, null, 3, null, 35, null, null, 0, 255,10, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 11', 'OPTIONAL_FIELD_11', '26', 0, 0, null, 2, null, 37, null, null, 0, 16,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 12', 'OPTIONAL_FIELD_12', '27', 0, 0, null, 2, null, 38, null, null, 0, 16,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 13', 'OPTIONAL_FIELD_13', '28', 0, 0, null, 2, null, 39, null, null, 0, 16,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 14', 'OPTIONAL_FIELD_14', '29', 0, 0, null, 4, null, 40, null, null, 0, 16,0, null, null, null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,83, 'Optional Field 15', 'OPTIONAL_FIELD_15', '30', 0, 0, null, 4, null, 41, null, null, 0, 20,0, null, null, null, 0, 0) ;


--------------Field Configs Additionals

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,83,'IS_CURRENCY',1);
--------------------
--Entries For ISP.

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  5, 83, '1') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  13, 83, '2') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  12, 83, '3') ;


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2, 83, '4') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2060, 83, '5') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2061, 83, '6') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  50, 83, '7') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  49, 83, '8') ;


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2062, 83, '9') ;


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  17, 83, '10') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  16, 83, '11') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2064, 83, '13') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2065, 83, '14') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 1, 83, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 51, 83, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 32, 83, '254.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 47, 83, '250.32');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 18, 83, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  3, 83, '19');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  4, 83, '20');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  6, 83, '21');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  24, 83, '254.35');

insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 6009, '22')

insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 6010, '254.54') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 6011, '254.55') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 83, 6012, '254.56') ;

--- AGGREGATION TYPE USER NAME
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (225, 'User Name','83', '-1,-2,-3,-4,-5') ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 225) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 225, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 225, 83, '12') ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id,  group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 225, 0, 29, '3') ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 225, 0, 3) ;
--Updating regular expression id of phone number field for subscriber record
update field_configs set REG_EXP_ID=36 where RECORD_CONFIG_ID=3 and FIELD_ID=12;

commit ;

