set feedback off ;
spool nikira-record-config-GBXUS.log

delete from field_record_config_maps  where record_config_id in (1) ;
delete from field_record_config_maps  where field_category_id in (8,9,10) ;
delete from field_configs where record_config_id in (1) ;

delete from record_view_configs where record_config_id in (1) ;
delete from archive_maps;
delete from record_configs where id in (1) ;
delete from aggregation_types where id in (1) ;
delete from counter_manager_mappings where record_config_id in (1) ;

--Record Types--
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(1,'CDR','CDR',0,'PHONE_NUMBER',1, ',') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(525,'BILLING_NUMBER_SUMMARY','Billing Number Summary',0,'ALARM_ID',0, '') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(526,'BILLING_NUMBER_ALERT_VIEW','Billing Number Alert View',0,'ID',0, '') ;

-- Record Views
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(1,'CDR',1,'','ID ASC', 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(528,'Billing Number Summary',525,'','BILLING_NUMBER ASC', 0, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(529,'Billing Number Alert View',526,'','ID ASC', 0, 0, 0) ;
	
-- Values for CDR Table
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function, format)  values (1, 1, 'Receive Time', '', 1, 1,4,0 , '', '', 20, null, 0,0,'', '','yyyy/mm/dd hh24:mi:ss') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (2, 1, 'Network', 'NETWORK_ID', 2, 2,1, 0, '', '', 20, 10, 0,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (3, 1, 'Origination Number', 'CALLER_NUMBER', 3, 3,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (4, 1, 'Termination Number', 'CALLED_NUMBER', 4, 4,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (5, 1, 'Forwarded Number', 'FORWARDED_NUMBER', 5, 5,3,0 , '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (6, 1, 'Record Type', 'RECORD_TYPE', 6, 6,1, 0, '', '', 20, 1, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (7, 1, 'Duration', 'DURATION', 7, 7,1, 0, 'GR CR', '', 20, 9, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function, format)  values (8, 1, 'Time Stamp', 'TIME_STAMP', 8, 8,4, 0, '', '',  1,null, 1,1,'', '', 'yyyy/mm/dd hh24:mi:ss') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (9, 1, 'Equipment ID', 'EQUIPMENT_ID', 9, 9,3, 0, '', '', 40, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (10, 1, 'IMSI/ESN Number', 'IMSI_NUMBER',10,10,3, 0, '', '', 40, null, 1,1,3, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (11, 1, 'Geographic Position', 'GEOGRAPHIC_POSITION',11,11,3, 0, '', '', 32, null, 1,0,4, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (12, 1, 'Call Type', 'CALL_TYPE',12,12,1, 0, '', '', 20, 2, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (13, 1, 'Subscriber ID', 'SUBSCRIBER_ID',13,13,8, 0, '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (14, 1, 'Value', 'VALUE',14,14,2, 0, 'GR CR', '', 16, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (15, 1, 'CDR Type', 'CDR_TYPE',15,15,1, 0, '', '', 20, 3, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (16, 1, 'Service Type', 'SERVICE_TYPE',16,16,1, 0, '', '', 20, 4, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (17, 1, 'CDR Category', 'CDR_CATEGORY',17,17,1, 0, '', '', 20, 1, 5,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (18, 1, 'Is Complete', 'IS_COMPLETE',18,18,6, 0, '', '', 1, 7, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (19, 1, 'Co-Related Field', '',19,19,3, 0, '', '', 20, 1, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (20, 1, 'Is Attempted', 'IS_ATTEMPTED',20,20,6, 0, '', '', 1, 6, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (21, 1, 'Service', 'SERVICE',21,21,1, 0, '', '', 20, 35, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (22, 1, 'Phone Number' , 'PHONE_NUMBER',22,22,3, 0, '', '', 40, null, 1,1,1, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (23, 1, 'Originating Switch' , 'OP_ORIG_SWICTH', 23, 23,1, 0, '', '', 20, null, 1, 1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (24, 1, 'Called Address Nature' , 'OP_DISP1', 24, 24,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (25, 1, 'Billed Phone Number' , 'OP_BILLED_PHONE_NUMBER', 25, 25,3, 0, '', '', 20, null, 1,1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (26, 1, 'Charge Address Nature' , 'OP_DISP2', 26, 26,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (27, 1, 'Calling Card Number' , 'OP_CALLING_CARD_NUMBER', 27, 27,3, 0, '', '', 20, null, 1,1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (28, 1, 'Orig Trunk' , 'OP_TRUNK_GROUP', 28, 28,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (29, 1, 'Carrier' , 'OP_CARRIER', 29, 29,1, 0, '', '', 20, null, 1,1, 13, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (30, 1, 'Call End Time' , 'OP_CALL_END_TIME', 30, 30,4, 0, '', '', 40, null, 1,1,13, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (31, 1, 'Orig Port' , 'OP_PORT', 31, 31,1, 0, '', '', 20, null, 1,1, 13, '') ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (32, 1, 'Info Digit' , 'OP_INFO_DIGIT', 32, 32,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (33, 1, 'Account Number' , 'OP_ACCOUNT_NUMBER', 33, 33,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (34, 1, 'Terminating Switch' , 'OP_TERM_SWITCH', 34, 34,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (35, 1, 'Final Switch' , 'OP_FINAL_SWITCH', 35, 35,1, 0, '', '', 20, null, 1,1, 13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (36, 1, 'Terminating Trunk' , 'OP_TERM_TRUNK', 36, 36,1, 0, '', '', 20, null, 1,1,13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (37, 1, 'Final Trunk' , 'OP_FINAL_TRUNK', 37, 37,1, 0, '', '', 20, null, 1,1,13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (38, 1, 'JIP' , 'OP_JIP', 38, 38,1, 0, '', '', 20, null, 1,1,13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (39, 1, 'LNP_LRN' , 'OP_LNP_LRN', 39, 39,1, 0, '', '', 20, null, 1,1,13, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (40, 1, 'Casual IND' , 'OP_ASSN_CODE', 40, 40,3, 0, '', '', 20, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (41, 1, 'GBX Service Type' , 'GBX_SERVICE_TYPE', 41, 41,3, 0, '', '', 20, null, 1,1, 10, '') ;

--DERIVED FIELDS FOR CDR
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (42, 1, 'CDR ID', 'ID', 42, null, 8, 0, '', '', 20, null,0,0,null, '2') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (43, 1, 'Day of Year', 'DAY_OF_YEAR', 43, null, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (44, 1, 'GMTTime Stamp', '', 44, null,8, 0, '', '',  20,null, 0,0,'', '9') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (45, 1, 'OtherPartyNumber', '', 45, null,3, 0, '', '',  40,null, 0,0,1, '11') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (46, 1, 'Cellsite ID', '', 46, null,8, 0, '', '',  20,null, 0,0,'', '10') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (47, 1, 'Hour of Day', 'HOUR_OF_DAY', 47, null,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (48, 1, 'OtherPartyCountryCode', 'OTHER_PARTY_COUNTRY_CODE', 48, null,3, 0, '', '',  20,41, 1,0,'', '22') ;

-------- Billing Number Summary Field Configs Entries -------
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 525, 'Alarm ID', 'ALARM_ID', 1, null,1, 0, '', '',  20,null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 525, 'Billing Number', 'BILLING_NUMBER', 2, null,3, 1, '', '',  40,null, 1,1,1, '') ; 
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 525, 'Count Of Records', 'CDR_COUNT', 3, null,1, 0, '', '',  20,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 525, 'Total Duration', 'TOTAL_DURATION', 4, null,1, 0, '', '',  20,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 525, 'Total Value', 'TOTAL_VALUE', 5, null,2, 0, '', '',  20,null, 1,1,'', '') ;

-------- Billing Number Alert View Field Configs Entries -------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Billing Number', 'BILLING_NUMBER',1,null,3,0,'','',40,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Id', 'ID',2,null,1,0,'','',40,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Alarm Id', 'ALARM_ID',3,null,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Rule Name', 'EVENT_INSTANCE_ID',4,null,1,0,'','',40,25,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Value', 'VALUE',5,null,2,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Record Count', 'CDR_COUNT',6,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Repeat Count', 'REPEAT_COUNT',7,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Created Date','CREATED_DATE',8,null,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Modified Date','MODIFIED_DATE',9,null,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Score', 'SCORE',10,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Aggregation Type','AGGREGATION_TYPE',11,null,1,0,'','',40,12,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 526, 'Aggregation Value', 'AGGREGATION_VALUE',12,null,3,0,'','',40,null,1,0,1) ;

------------------------------------------- Expandable Field Maps entries START ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (3, 'Termination Subscriber Info', 1, 'CALLED_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (4, 'Origination Subscriber Info', 1, 'CALLER_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (6, 'Subscriber Info', 1, 'PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');

-- For hotlist
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (57, 'Geographic Position CDR', 15, 'VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');

--- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1500, 'Alarm-Phone no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1501, 'Alarm-Calling Card no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1502, 'Alarm-GBX Account no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1503, 'Alarm-Phone no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1504, 'Alarm-Calling Card no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1505, 'Alarm-GBX Account no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Closed Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1506, 'Alarm-Phone no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1507, 'Alarm-Calling Card no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1508, 'Alarm-GBX Account no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1509, 'Alarm-Phone no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1510, 'Alarm-Calling Card no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1511, 'Alarm-GBX Account no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Archieved Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1512, 'Alarm-Phone no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1513, 'Alarm-Calling Card no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1514, 'Alarm-GBX Account no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1515, 'Alarm-Phone no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1516, 'Alarm-Calling Card no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1517, 'Alarm-GBX Account no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');


-- Entries for Assigned case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1518, 'Alarm-Phone no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1519, 'Alarm-Calling Card no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1520, 'Alarm-GBX Account no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

--- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1521, 'Alarm-Phone no to Subscriber', 10, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1522, 'Alarm-GBX Account no to Subscriber', 10, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Closed Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1523, 'Alarm-Phone no to Subscriber', 17, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1524, 'Alarm-GBX Account no to Subscriber', 17, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1525, 'Alarm-Phone no to Subscriber', 16, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1526, 'Alarm-GBX Account no to Subscriber', 16, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Archieved Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1527, 'Alarm-Phone no to Subscriber', 19, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1528, 'Alarm-GBX Account no to Subscriber', 19, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1529, 'Alarm-Phone no to Subscriber', 18, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1530, 'Alarm-GBX Account no to Subscriber', 18, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1531, 'Alarm-Phone no to Subscriber', 27, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1532, 'Alarm-GBX Account no to Subscriber', 27, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1533, 'Alarm-Phone no to Subscriber', 26, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1534, 'Alarm-GBX Account no to Subscriber', 26, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Billing Number - Subscriber 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1535, 'Billing Number Subscriber Info', 1, 'OP_BILLED_PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');

-- Entries for Billing Number - CDR 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1536,'Alarm Billing Number To CDR',10,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');

-- Entries For Billing Number Summary
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1537,'Billing Number Summary',10,'ID',528,'ALARM_ID',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1543,'Alarm Billing Number Summary Info',10,'ID',528,'ALARM_ID',1,2,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1544,'Alarm Billing Number Summary Info',10,'ID',528,'ALARM_ID',1,3,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1538,'Billing Number to Alerts',528,'BILLING_NUMBER',529,'BILLING_NUMBER',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1539,'Billing Number Summary',16,'ID',528,'ALARM_ID',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1540,'Billing Number Summary',18,'ID',528,'ALARM_ID',1,1,'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1541,'Alarm Billing Number To CDR',16,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1542,'Alarm Billing Number To CDR',18,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');

-- For CDR
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  1, 1, '42') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  2, 1, '22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  3, 1, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  4, 1, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 1, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  6, 1, '21') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 11, 1, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 1, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 1, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17, 1, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 18, 1, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 21, 1, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 1, '6.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 39, 1, '44') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 40, 1, '6.23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 14, 1, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 12, 1, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 41, 1, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 1, '6.5.7.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 1, '6.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 44, 1, '45') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 8, 1, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 9, 1, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 10, 1, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 45, 1, '46') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 1, '6.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 23, 1, '43') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 1, '47') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 1, '6.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 1, '6.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 1, '6.5.1') ;


---------------
--ACCOUNT INFORAMTION FOR GBX
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1115, 3, 'End Service Date', '', 32, 0, 1, '', 4,'', 41, '', null, 1, 41, 8, '5.30', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1116, 3, 'Corporate Account', '', 33, 0, 1, 'GR', 3,'', 42, '', null, 1, 41, 8, '5.31', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1117, 3, 'Association', '', 34, 0, 1, 'GR', 3,'', 43, '', null, 1, 41, 8, '5.32', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1118, 3, 'Support Rep', '', 35, 0, 1, 'GR', 3,'', 44, '', null, 1, 41, 8, 5.33, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1119, 3, 'Acct Status', '', 36, 0, 1, 'GR', 3,'', 45, '', null, 1, 41, 8, '5.34', null) ;

--SUBSCRIBER FIELDS FOR GBX

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1150, 3, 'Home Address', 'HOME_ADDRESS', 37, 0, 1, '', 3,'', 46, '', null, 1, 41, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1151, 3, 'GBX Services', 'GBXUS_SERVICES', 38, 0, 1, '', 3,'', 47, '', 35, 1, 41, 1, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1152, 3, 'Disconnection Reason', 'DISCONNECTION_REASON', 39, 0, 1, '', 3,'', 48, '', null, 1, 41, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1153, 3, 'ANI Status', 'OPTIONAL_FIELD2', 40, 0, 1, '', 3,'', 49, '', null, 1, 41, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1154, 3, 'Optional Field 3', 'OPTIONAL_FIELD3', 41, 0, 0, '', 3,'', 50, '', null, 1, 41, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1155, 3, 'Last Use Date', 'OPTIONAL_FIELD4', 42, 0, 1, '', 3,'', 51, '', null, 1, 41, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1156, 3, 'Ultimate Name', 'ULTIMATE_NAME', 60, 0, 1, '', 3,'', 70, '', null, 1, 31, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1157, 3, 'Region', 'REGION', 61, 0, 1, '', 3,'', 71, '', null, 1, 1, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1158, 3, 'Order Status', 'ORDER_STATUS', 62, 0, 1, '', 3,'', 72, '', null, 1, 2, 10, null, null) ;

--ACCOUNT CREDIT DETAILS

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1201, 3, 'Expiry Date', '', 43, 0, 0, 'GR', 4,'', 52, '', null, 1, 1, null, '5.14.19', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1202, 3, 'Static Credit Limit', '', 44, 0, 1, 'GR', 2, '', 54, '', null, 1, 1, null, '5.14.3', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1203, 3, 'Dynamic Credit Limit', '', 45, 0, 1, 'GR', 2, '',  55, '', null, 1, 1, null, '5.14.4', null) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1204, 3, 'Total Slippage', '', 46, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 56, '', null, 1, 1, null, '5.14.5', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1205, 3, 'Outstanding Amount', '', 47, 0, 1, 'SMM.AG.POSTPAID GR', 2, '', 57, '', null, 1, 1, null, '5.14.6', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1206, 3, 'Total Payment', '', 48, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 58, '', null, 1, 1, null, '5.14.7', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1207, 3, 'Unbilled Amount', '', 49, 0, 1, 'SMM.AG.POSTPAID GR', 2, '', 59, '', null, 1, 1, null, '5.14.8', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1208, 3, 'Last Due Date', '', 50, 0, 1, 'SMM.AG.POSTPAID CMM', 4, '', 60, '', null, 1, 1, null, '5.14.9', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1209, 3, 'Last Pay Date', '', 51, 0, 1, 'SMM.AG.POSTPAID CMM', 4, '', 61, '', null, 1, 1, null, '5.14.10', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1210, 3, 'Last Paid Amount', '', 52, 0, 1, 'SMM.AG.POSTPAID GR', 2, '', 62, '', null, 1, 1, null, '5.14.11', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1211, 3, 'No of Suspensions', '', 53, 0, 1, 'SMM.AG.POSTPAID GR', 1, '', 63, '', null, 1, 1, null, '5.14.12', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1212, 3, 'No of Full Payments', '', 54, 0, 1, 'SMM.AG.POSTPAID GR', 1, '', 64, '', null, 1, 1, null, '5.14.13', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1213, 3, 'No of Part Payments', '', 55, 0, 1, 'SMM.AG.POSTPAID GR', 1, '', 65, '', null, 1, 1, null, '5.14.14', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1214, 3, 'No of Slippages', '', 56, 0, 1, 'SMM.AG.POSTPAID GR', 1, '', 66, '', null, 1, 1, null, '5.14.15', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1215, 3, 'Bill Cycle', '', 57, 0, 1, 'SMM.AG.POSTPAID GR', 3, '', 67, '', null, 0, 1, null, '5.14.16', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1216, 3, 'Exposure', '', 58, 0, 1, 'SMM.AG.POSTPAID GR', 2, '', 68, '', null, 1, 1, null, '5.14.17', null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1217, 3, 'Percentage Exposure', '', 59, 0, 1, 'SMM.AG.POSTPAID GR', 2, '', 69, '', null, 1, 1, null, '5.14.18', null) ;

--ACCOUNT INFORAMTION FOR GBX

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (275, 4, 'End Service Date', 'END_SERVICE_DATE', 18, 0, 1, 'GR', 4,'', 30, '', null, 1, 9, '', null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (276, 4, 'Corporate Account', 'OPTIONAL_FIELD1', 19, 0, 1, 'GR', 3,'', 31, '', null, 1, 41, 8, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (277, 4, 'Association', 'OPTIONAL_FIELD5', 20, 0, 1, 'GR', 3,'', 32, '', null, 1, 41, 8, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (278, 4, 'Support Rep', 'DEALER_NAME', 21, 0, 1, 'GR', 3,'', 33, '', null, 1, 41, 8, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (279, 4, 'Acct Status', 'OP_STATUS', 22, 0, 1, 'GR', 3,'', 34, '', null, 1, 41, 8, null, null) ;

--------------
insert into filter_index_fields(record_view_config_id, field_id) values(1, 22) ;
insert into filter_index_fields(record_view_config_id, field_id) values(1, 3) ;
insert into filter_index_fields(record_view_config_id, field_id) values(1, 4) ;

update field_configs set database_field = 'RATE_PLAN' where field_id = 27 and record_config_id = 3 ;
update field_configs set associated_field = '' where field_id = 27 and record_config_id = 3 ;
update field_configs set is_visible = 0 where field_id = 13 and record_config_id = 4 ;
update field_configs set is_filter = 0 where field_id = 13 and record_config_id = 4 ;
update field_configs set reg_exp_id = 10  where id = 40 and record_config_id = 1 ;

update field_categories set category = replace(category, 'AGGREGATION_TYPE', '') ; 
update field_categories set category = replace(category, 'NICKNAME', '') ; 
update field_categories set category = replace(category, 'HOTLIST', '') ; 
update field_categories set category = replace(category, 'MANUAL_ALARM_AGGREGATION_TYPE', '') ; 
update field_categories set name = 'Phone Number',  category = category || ' AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST' where id = 2 ; 
update field_categories set common_category_id = '' where id in (8,9,10) ;
update regular_expressions set expression = '^[\w%?]+[.\w%?]*$' where id = 8 ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values( 1000, 'Origination Number' , 'AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST', 3, 1, 1000); 
insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values( 1001, 'Destination Number' , 'AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST', 3, 1, 1001); 
insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values( 1002, 'Billing Number' , 'AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST', 3, 1, 1002); 
insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values( 1003, 'Calling Card Number' , 'AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST', 3, 13, 1003); 
insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values( 1004, 'GBX Account Number' , 'AGGREGATION_TYPE MANUAL_ALARM_AGGREGATION_TYPE NICKNAME HOTLIST', 3, 13, 1004);

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1000, 1, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1000, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1001, 1, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1001, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1002, 1, '25') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1002, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1003, 1, '27') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1004, 1, '33') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1005, 'Origination Number Subscriber ID' , '', 8, null, 1005);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1005, 1, '4.32') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1006, 'Termination Number Subscriber ID' , '', 8, null, 1006);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1006, 1, '3.32') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1007, 'Billing Number Subscriber ID' , '', 8, null, 1007);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1007, 1, '1535.32') ;

insert into aggregation_types (ID, DESCRIPTION) values (2, 'Phone Number') ;
insert into aggregation_types (ID, DESCRIPTION) values (1000, 'Origination Number') ;
insert into aggregation_types (ID, DESCRIPTION) values (1001, 'Destination Number') ;
insert into aggregation_types (ID, DESCRIPTION) values (1002, 'Billing Number') ;
insert into aggregation_types (ID, DESCRIPTION) values (1003, 'Calling Card NUMBER') ;
insert into aggregation_types (ID, DESCRIPTION) values (1004, 'GBX Account Number') ;

update counter_details set TABLE_NAME='CDR_COUNTER_1' where id = 1 ; 
insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE) values (1000, 'CDR_COUNTER_2', 8, 2000) ;
insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE) values (1001, 'CDR_COUNTER_3', 8, 2000) ;
insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE) values (1002, 'CDR_COUNTER_4', 8, 2000) ;
insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE) values (1003, 'CDR_COUNTER_5', 8, 2000) ;
insert into counter_details (ID, TABLE_NAME, NUMBER_OF_COLUMNS, COLUMN_SIZE) values (1004, 'CDR_COUNTER_6', 8, 2000) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (2, 4, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (2, 5, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1000, 1, 1000, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1000, 7, 1000, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1001, 1, 1001, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1001, 7, 1001, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1002, 1, 1002, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1002, 7, 1002, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1003, 1, 1003, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1003, 7, 1003, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1004, 1, 1004, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1004, 7, 1004, 1) ;

commit ;

quit ;
