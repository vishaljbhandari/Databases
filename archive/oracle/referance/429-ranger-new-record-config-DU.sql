set feedback off ;
spool ranger-new-record-config-DU.log
delete from field_record_config_maps  where record_config_id in (1, 2, 7) ;
delete from field_configs where record_config_id in (1, 2, 7) ;

delete from view_config_components where record_view_config_id in (select id from record_view_configs where record_config_id in (1, 2, 7)) ;
delete from record_view_configs where record_config_id in (1, 2, 7) ;
delete from record_configs where id in (1, 2, 7) ;
delete from aggregation_types where id in (1, 2, 7, 14, 54) ;
delete from counter_manager_mappings where record_config_id in (1, 2, 7, 70, 71, 72) ;

delete from archive_maps ;

--Record Types--
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(1,'CDR','CDR',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD', 0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(2,'RECHARGE_LOG','Recharge Log',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD', 0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(7,'GPRS_CDR','GPRS',1,'PHONE_NUMBER',1, ',', 'NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD', 0) ;

-- Archive Map ----
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(1,'ARCHIVED_CDR','ARCHIVED_CDR',1);
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(2,'ARCHIVED_GPRS_CDR','ARCHIVED_GPRS_CDR',7);
insert into archive_maps( ID,ARCHIVE_NAME,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(4,'ARCHIVED_RECHARGE_LOG','ARCHIVED_RECHARGE_LOG',2);

insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(3, 'ARCHIVED_SUBSCRIBER', 'ARCHIVED_SUBSCRIBER', 3);
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(5, 'ARCHIVED_ADJUSTMENT_LOGS', 'ARCHIVED_ADJUSTMENT_LOGS', 71);
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(6, 'ARCHIVED_CRM_LOGS', 'ARCHIVED_CRM_LOGS', 72);

-- Record Views
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(1,'CDR',1,'','ID DESC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(2,'Recharge Log',2,'','ID DESC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(7,'GPRS',7,'','ID DESC', 1, 1, 1, 1) ;
	
-- Values for CDR Table
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (1, 1, 'Receive Time', '', 1, 1,4,0 , '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (2, 1, 'Network', 'NETWORK_ID', 2, 2,1, 0, '', '', 20, 10, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (3, 1, 'Caller Number', 'CALLER_NUMBER', 3, 3,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (4, 1, 'Called Number', 'CALLED_NUMBER', 4, 4,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (5, 1, 'Forwarded Number', 'FORWARDED_NUMBER', 5, 5,3,0 , '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (6, 1, 'Record Type', 'RECORD_TYPE', 6, 6,1, 0, '', '', 20, 1, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (7, 1, 'Duration', 'DURATION', 7, 7,1, 0, 'GR CR', '', 20, 9, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (8, 1, 'Time Stamp', 'TIME_STAMP', 8, 8,4, 0, 'CR', '',  1,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (9, 1, 'Equipment ID', 'EQUIPMENT_ID', 9, 9,3, 0, '', '', 40, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (10, 1, 'IMSI/ESN Number', 'IMSI_NUMBER',10,10,3, 0, '', '', 40, null, 1,1,3, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (11, 1, 'Geographic Position', 'GEOGRAPHIC_POSITION',11,11,3, 0, '', '', 32, 99, 1,1,4, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (12, 1, 'Call Type', 'CALL_TYPE',12,12,1, 0, '', '', 20, 2, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (13, 1, 'Subscriber ID', 'SUBSCRIBER_ID',13,13,8, 0, '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (14, 1, 'Value (' ||(select value from configurations where  config_key like '%CURRENCY%') || ')', 'VALUE',14,14,2, 0, 'GR CR', '', 16, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (15, 1, 'CDR Type', 'CDR_TYPE',15,15,1, 0, '', '', 20, 3, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (16, 1, 'Service Type', 'SERVICE_TYPE',16,16,1, 0, '', '', 20, 4, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (17, 1, 'CDR Category', 'CDR_CATEGORY',17,17,1, 0, '', '', 20, 5, 1, 1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (18, 1, 'Is Complete', 'IS_COMPLETE',18,18,6, 0, '', '', 1, 7, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (19, 1, 'Co-Related Field', '',19,19,3, 0, '', '', 20, 1, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (20, 1, 'Is Attempted', 'IS_ATTEMPTED',20,20,6, 0, '', '', 1, 6, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (21, 1, 'Service', 'SERVICE',21,21,1, 0, '', '', 20, 35, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (22, 1, 'Phone Number' , 'PHONE_NUMBER',22,22,3, 0, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (23, 1, 'CDR ID', 'ID', 23, null, 8, 0, '', '', 20, null,0,0,null, '2') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (24, 1, 'Day of Year', 'DAY_OF_YEAR', 24, null, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (88, 1, 'GMTTime Stamp', '', 25, null,8, 0, '', '',  20,null, 0,0,'', '9') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (89, 1, 'OtherPartyNumber', '', 26, null,3, 0, '', '',  40,null, 0,0,1, '11') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (90, 1, 'Cellsite ID', '', 27, null,8, 0, '', '',  20,null, 0,0,'', '10') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (93, 1, 'Hour of Day', 'HOUR_OF_DAY', 28, null,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (94, 1, 'OtherPartyCountryCode', 'OTHER_PARTY_COUNTRY_CODE', 29, null,3, 0, '', '',  20, 41, 1,1,'', '22') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (95, 1, 'VPMN', 'VPMN', 30, 23, 3, 1, '', '',  40,null, 1, 1, 17, '') ;
-- For DU CDR---
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, is_filter, width, reg_exp_id)  values (field_configs_seq.nextval, 1, 'Source', 'SOURCE', 31, 24, 3, 1, 1, 40, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 1, 'Cell Site Name', 'CELL_SITE_NAME', 32, 25, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 1, 'Is Conference', 'IS_CONFERENCE', 33, 26, 1, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 1, 'Type Of Call', 'IS_SUBSCRIBERLESS', 34, 27, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 1, 'IN Charge', 'IN_CHARGE', 35, 28, 2, 0) ;

-- Values for Recharge Log Table  
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (25, 2, 'Time Stamp', 'TIME_STAMP',1,1,4, 0,'', '', 1, null, 1, 1, 2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (26, 2, 'Phone Number', 'PHONE_NUMBER',2,2,3, 1, '', '', 40, null, 1, 1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (27, 2, 'Amount (' ||(select value from configurations where  config_key like '%CURRENCY%') || ')', 'AMOUNT',3,3,2, 0, 'GR CR', '', 16, null, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (28, 2, 'Recharge Type', 'RECHARGE_TYPE',4,4,1, 0, '', '', 20, 98, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (29, 2, 'Status', 'STATUS',5,5,1, 0, '', '', 20, 16, 1, 1, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (30, 2, 'Credit Card', 'CREDIT_CARD',6,6,3, 0, '', '', 40, null, 1, 1, 5, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (31, 2, 'PIN Number', 'PIN_NUMBER',7,7,3, 0, '', '', 40, null, 1, 1, 6, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (32, 2, 'Network', 'NETWORK_ID',8,8,1, 0, '', '',  20, 10, 0, 0, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (33, 2, 'Account ID', 'ACCOUNT_ID',9,9,8, 0, '', '', 20, null, 1, 0, '', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (34, 2, 'Subscriber ID', 'SUBSCRIBER_ID',10,10,8, 0, '', '',  20, null, 0, 0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (35, 2, 'Recharge Card Number', 'SERIAL_NUMBER',0,11,3, 0, '', '', 40, null, 1, 0, 7, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (101, 2, 'RECHARGE ID', 'ID', 12, null, 8, 0, '', '', 20, null,0,0,null, '7') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (102, 2, 'Day of Year', 'DAY_OF_YEAR', 13, null, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (103, 2, 'Hour of Day', 'HOUR_OF_DAY', 14, null,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (104, 2, 'Voucher Expiry Date', '',15,12,4, 0,'', '', 1, null, 1, 1, 2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (105, 2, 'Grace Period', '',16,13,8,'', 0,'', '', 16, null, 1, 1, '', '') ;
-- For DU Recharge ---
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Acct ID', 'ACCT_ID', 17, 14, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Acct Ref ID', 'ACCT_REF_ID', 18, 15, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'User', 'DU_USER', 19, 16, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Account Type', 'ACCOUNT_TYPE', 20, 17, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Balance Type', 'BALANCE_TYPES', 21, 18, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Balances', 'BALANCES', 22, 19, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Acs Cust ID', 'ACS_CUST_ID', 23, 20, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Bonus Type', 'BONUS_TYPE', 24, 21, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'CS', 'CS', 25, 22, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'PI', 'PI', 26, 23, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Reference', 'REFERENCE', 27, 24, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Wallet Type', 'WALLET_TYPE', 28, 25, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Batch Description', 'BATCH_DESCRIPTION', 29, 26, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Type Description', 'TYPE_DESCRIPTION', 30, 27, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Voucher', 'VOUCHER', 31, 28, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'NACK', 'NACK', 32, 29, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Redeeming Acct Ref', 'REDEEMING_ACCT_REF', 33, 30, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Host', 'HOST', 34, 31, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Voucher Type', 'VOUCHER_TYPE', 35, 32, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'BadPins', 'BADPINS', 36, 33, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Charge Name', 'CHARGE_NAME', 37, 34, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'TCS', 'TCS', 38, 35, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Event Calss', 'EVENT_CLASS', 39, 36, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Event Name', 'EVENT_NAME', 40, 37, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Event Cost', 'EVENT_COST', 41, 38, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Event Time Cost', 'EVENT_TIME_COST', 42, 39, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Event Count', 'EVENT_COUNT', 43, 40, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Discount', 'DISCOUNT', 44, 41, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Cascade', 'CASCADE', 45, 42, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'CDR Type', 'CDR_TYPE', 46, 43, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 2, 'Result Reason', 'RESULT_REASON', 47, 44, 3, 0) ;

-------GPRS--------------
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (300, 7, 'Receive Time', '', 1, 1,4,0 , '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (301, 7, 'Network', 'NETWORK_ID', 2, 2,1, 0, '', '', 20, 10, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (302, 7, 'Record Type', 'RECORD_TYPE', 3, 3,1, 0, '', '', 20, 100, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (303, 7, 'Time Stamp', 'TIME_STAMP', 4, 4,4, 0, '', '',  1,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (304, 7, 'Duration', 'DURATION', 5, 5,1, 0, 'GR CR ', '', 20, 9, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (305, 7, 'Phone Number' , 'PHONE_NUMBER',6,6,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (306, 7, 'Service Type', 'SERVICE_TYPE',7,7,1, 0, '', '', 20, 18, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (307, 7, 'GPRS Type', 'CDR_TYPE',8,8,1, 0, '', '', 20, 3, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (308, 7, 'Upload Data Volume', 'UPLOAD_DATA_VOLUME',9,9,2, 0, 'CR', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (309, 7, 'Download Data Volume', 'DOWNLOAD_DATA_VOLUME',10,10,2, 0, 'CR', '', 20, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (310, 7, 'QoS Requested', 'QOS_REQUESTED',11,11,1, 0, '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (311, 7, 'QoS Negotiated', 'QOS_NEGOTIATED',12,12,1, 0, '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (312, 7, 'Value (' ||(select value from configurations where  config_key like '%CURRENCY%') || ')', 'VALUE',13,13,2, 0, 'GR CR', '', 16, null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (313, 7, 'Subscriber ID', 'SUBSCRIBER_ID',14,14,8, 0, '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (314, 7, 'Charging  ID', 'CHARGING_ID',15,15,3, 0, '', '', 26, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (315, 7, 'Service', 'SERVICE',16,16,1, 0, '', '', 20, 35, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (316, 7, 'IMSI Number', 'IMSI_NUMBER',17,17,3, 0, '', '', 40, null, 1,1,3, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (317, 7, 'Equipment ID', 'IMEI_NUMBER', 18, 18,3, 0, '', '', 40, null, 1,1,2, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (318, 7, 'Session Status', 'SESSION_STATUS', 19, 19, 1, 0, '', '', 2, 56, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (319, 7, 'Access Point Name', 'ACCESS_POINT_NAME', 20, 20, 3, 0, '', '', 40, null, 1,1,9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (320, 7, 'Geographic Position', 'GEOGRAPHIC_POSITION',21,21,3, 0, '', '', 32, 99, 1,1,4, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (321, 7, 'Cause for Session Closing', 'CAUSE_FOR_SESSION_CLOSING',22,22,1, 0, '', '', 2, 58, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (322, 7, 'PDP Type', 'PDP_TYPE',23,23,3, 0, '', '', 40, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (323, 7, 'Served PDP Address', 'SERVED_PDP_ADDRESS',24,24,3, 0, '', '', 40, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (324, 7, 'GPRS ID', 'ID', 25, null, 8, 0, '', '', 20, null,0,0,null, '2') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (325, 7, 'Day of Year', 'DAY_OF_YEAR', 26, null, 1, 0, '', '', 20, null, 0,0,null, '1') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (326, 7, 'GMTTime Stamp', '', 27, null,8, 0, '', '',  20,null, 0,0,'', '9') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (327, 7, 'Cellsite ID', '', 28, null,8, 0, '', '',  20,null, 0,0,'', '10') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (328, 7, 'Hour of Day', 'HOUR_OF_DAY', 29, null,1, 0, '', '',  20,null, 0,0,'', '12') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (329, 7, 'Content Volume', '', 30, null,2, 0, '', '',  20,null, 0,0,'', '13') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (330, 7, 'VPMN', '', 31, 0, 3, 1, '', '',  40,null, 1, 1, 17, '') ;

-- For DU GPRS ---
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Sender Terminal Type', 'SENDER_TERMINAL_TYPE', 32, 25, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Sender Terminal IP Address/Content Type', 'SENDER_TERMINAL_IP_ADDRESS', 33, 26, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Orig Vasp ID/SDP Application ID', 'ORIG_VASP_ID', 34, 27, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Orig Vas ID/Content Title', 'ORIG_VAS_ID', 35, 28, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Sender Roaming Class/Provider ID', 'SENDER_ROAMING_CLASS', 36, 29, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Recipient Terminal IP Address', 'RECIPIENT_TERMINAL_IP_ADDRESS', 37, 30, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'ADDRESS HIDING STATUS/FIELD ID', 'ADDRESS_HIDING_STATUS', 38, 31, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'DEST VASP ID/RECORD SEQUCNCE', 'DEST_VASP_ID', 39, 32, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'DEST VAS ID/GGSN ADDRESS', 'DEST_VAS_ID', 40, 33, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'RECIPIENT ROAMING CLASS/SGSN ADDRESS', 'RECIPIENT_ROAMING_CLASS', 41, 34, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'FORWARDED BY/NETWORK INITIATED PDP CONTEXT', 'FORWARDED_BY', 42, 35, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'MSG ID/RECORD OPENING TIME/TYPE OF CALL', 'MSG_ID', 43, 36, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'PRIORITY/SGSN CHANGE', 'PRIORITY', 44, 37, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT SIZE VIDEO/PDP HLR INDEX', 'CNT_SIZE_VIDEO', 45, 38, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT NUMBER VIDEO/OPTIONAL DATA', 'CNT_NUMBER_VIDEO', 46, 39, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT SIZE AUDIO/S CHARGING TYPE', 'CNT_SIZE_AUDIO', 47, 40, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT NUMBER AUDIO/PLMN ID', 'CNT_NUMBER_AUDIO', 48, 41, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT SIZE IMAGE/CAMEL APN NETWORK', 'CNT_SIZE_IMAGE', 49, 42, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT NUMBER IMAGE/CAMEL APN OPERATOR', 'CNT_NUMBER_IMAGE', 50, 43, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT SIZE TEXT/CAMEL APPEND', 'CNT_SIZE_TEXT', 51, 44, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT NUMBER TEXT/CAMEL FFD', 'CNT_NUMBER_TEXT', 52, 45, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT SIZE OTHER/APN OPERATOR', 'CNT_SIZE_OTHER', 53, 46, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'CNT NUMBER OTHER/ROUTING AREA', 'CNT_NUMBER_OTHER', 54, 47, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'RECIPIENT NUMBER/SERVICE AREA CODE', 'RECIPIENT_NUMBER', 55, 48, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'NO OF SUCCESSFUL RECIPIENTS/TOLLFREE UPLINK', 'NO_OF_SUCCESSFUL_RECIPIENTS', 56, 49, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'DEST MMSC/TOLLFREE DOWNLINK', 'DEST_MMSC', 57, 50, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'DELIVERY STATUS/SESSION ID', 'DELIVERY_STATUS', 58, 51, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'ERROR CAUSE/CHARGING PROFILE', 'ERROR_CAUSE', 59, 52, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'TARIFF CLASS/UPLINK HITS', 'TARIFF_CLASS', 60, 53, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'MESSAGE CLASS/DOWNLINK HITS', 'MESSAGE_CLASS', 61, 54, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'SENDER CHARGING TYPE/SA CHARGING_CLASS', 'SENDER_CHARGING_TYPE', 62, 55, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'RECIPIENT CHARGING TYPE/SA SERVICE ID', 'RECIPIENT_CHARGING_TYPE', 63, 56, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'SENDER PREPAID STATUS/WALLET ID', 'SENDER_PREPAID_STATUS', 64, 57, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'RECIPIENT PREPAID STATUS/WALLET CHARGING TYPE', 'RECIPIENT_PREPAID_STATUS', 65, 58, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'OTHER PARTY NUMBER/ACCESS TYPE', 'OTHER_PARTY_NUMBER', 66, 59, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, is_filter, width, reg_exp_id)  values (field_configs_seq.nextval, 7, 'Source', 'SOURCE', 67, 60, 3, 1, 1, 40, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'Cell Site Name', 'CELL_SITE_NAME', 68, 61, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 7, 'IN Charge/Purchase Price', 'IN_CHARGE', 69, 62, 2, 0) ;

---For Subscriber
------------ACCOUNT INFORMATION
delete from field_configs where record_config_id = 3 ;

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (136, 3, 'Account Name', 'ACCOUNT_NAME', 1, 1, 1, 'GR', 3,'', 1, '', null, 1, 41, 8, '5.1', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (137, 3, 'Date of Activation of Account', '', 2, 0, 1, '', 4,'', 2, '', null, 1, 9, null, '5.2', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (138, 3, 'Network', 'NETWORK_ID', 3, 0, 0, '', 1,'', 3, '', 10, 0, 23, null, '5.3', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (139, 3, 'First Name', '', 4, 0, 1, 'SMM.PRECHECK GR', 3,'', 4, '', null, 1, 41, 8, '5.4', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (140, 3, 'Middle Name', '', 5, 0, 1, 'SMM.PRECHECK GR', 3,'', 5, '', null, 1, 41, 8, '5.5', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (141, 3, 'Last Name', '', 6, 0, 1, 'SMM.PRECHECK GR', 3,'', 6, '', null, 1, 41, 8, '5.6', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (142, 3, 'Address Line 1', '', 7, 0, 1, 'SMM.PRECHECK GR', 3,'', 7, '', null, 1, 257, 19, '5.7', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (143, 3, 'Address Line 2', '', 8, 0, 1, 'SMM.PRECHECK GR', 3,'', 8, '', null, 1, 257, 19, '5.8', null) ; 
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (144, 3, 'Address Line 3', '', 9, 0, 1, 'SMM.PRECHECK GR', 3,'', 9, '', null, 1, 257, 19, '5.9', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (145, 3, 'City', '', 10, 0, 1, 'SMM.PRECHECK GR', 3,'', 10, '', null, 1, 41, 8, '5.10', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (146, 3, 'Post Code', '', 11, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA GR', 3,'', 11, '', null, 1, 21, 9, '5.11', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (147, 3, 'Credit Limit', '', 12, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA GR', 2,'', 40, '', null, 1, 40, null, '5.12', null) ;

------------SUBSCRIBER INFORMATION
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (148, 3, 'Phone No.', 'PHONE_NUMBER', 13, 0, 1, 'SMM.PRECHECK GR', 3,'', 12, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (149, 3, 'Date of Activation of Subscriber', 'SUBSCRIBER_DOA', 14, 0, 1, '', 4,'', 13, '', null, 1, 9, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (150, 3, 'Home Phone No.', 'HOME_PHONE_NUMBER', 15, 0, 1, 'SMM.PRECHECK GR', 3,'', 14, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (151, 3, 'Office Phone No.', 'OFFICE_PHONE_NUMBER', 16, 0, 1, 'SMM.PRECHECK GR', 3,'', 15, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (152, 3, 'Contact Phone No.', 'CONTACT_PHONE_NUMBER', 17, 0, 1, 'SMM.PRECHECK GR', 3,'', 16, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (153, 3, 'MCN1', 'MCN1', 18, 0, 1, 'GR', 3,'', 17, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (154, 3, 'MCN2', 'MCN2', 19, 0, 1, 'GR', 3,'', 18, '', null, 1, 41, 1, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (155, 3, 'IMSI/ESN', 'IMSI', 20, 0, 1, 'GR', 3,'', 19, '', null, 1, 21, 9, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (156, 3, 'Equipment ID', 'IMEI', 21, 0, 1, 'GR', 3,'', 20, '', null, 1, 21, 9, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (157, 3, 'Connection Type', 'CONNECTION_TYPE', 22, 0, 1, 'GR', 1,'', 21, '', 5, 1, 25, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (158, 3, 'Groups', 'GROUPS', 23, 0, 1, 'GR', 7,'', 22, '', 27, 1, 257, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (159, 3, 'Services', 'SERVICES', 24, 0, 1, 'GR', 10,'', 23, '', 35, 1, 4, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (160, 3, 'QoS', 'QoS', 25, 0, 1, 'GR', 1,'', 24, '', null, 1, 25, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (161, 3, 'Product Type', 'PRODUCT_TYPE', 26, 0, 1, 'GR', 1,'', 25, '', 11, 1,25, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (162, 3, 'Action Indicator', '', 27, 0, 1, '', 1,'', 26, '', null, 0, 25, null, null, null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (176, 3, 'Is New Record', '', 0, 0, 0, '', 1,'', 42, '', null, 0, 25, null, null, 14) ;

------------Account Information
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (163, 3, 'Rate Plan', '', 28, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE GR', 3,'', 27, '', null, 1, 256, 9, '5.13', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (164, 3, 'Expiry Date', '', 29, 0, 0, 'GR', 4,'', 28, '', null, 1, 25, null, '5.14', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (165, 3, 'Grace Period ', '', 30, 0, 0, 'GR', 1,'', 29, '', null, 1, 1, null, '5.15', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (166, 3, 'Activation Amount', '', 31, 0, 1, 'GR SMM.PRECHECK', 2,'', 30, '', null, 1, 1, null, '5.16', null) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (167, 3, 'Details', 'ACCOUNT_ID', 0, 0, 0, 'GR', 8,'', 35, '', null, 1, 1, null, null, 6) ;

------------Subscriber Derived Information
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (168, 3, 'Status', 'STATUS', 0, 0, 1, '', 1, '', 31, '', 19, 1, 1, null, null, 3) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (169, 3, 'ID', 'ID', 0, 0, 0, '', 8, '', 32, '', null, 1, 1, null, null, 5) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (170, 3, 'Age In Network', '', 0, 0, 1, 'GR', 1, '', 33, 'TRUNC(SYSDATE) - TRUNC(SUBSCRIBER_DOA)', null, 1, 20, null, null, 4) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (171, 3, 'Subscriber Type', 'SUBSCRIBER_TYPE', 0, 0, 0, '', 1, '', 34, '', null, 1, 1, null, null, 14) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (172, 3, 'Static Credit Limit', '', 0, 0, 0, '', 2, '', 36, '', null, 1, 25, null, null, 14) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (173, 3, 'Set Static Credit Limit Flag', '', 0, 0, 0, '', 1, '', 37, '', null, 1, 1, null, null, 14) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (174, 3, 'Subscriber Record Sequence ID', '', 0, 0, 0, '', 8, '', 38, '', null, 1, 1, null, null, 31) ;
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (175, 3, 'Modified Date', 'MODIFIED_DATE', 0, 0, 0, '', 4, '', 39, '', null, 1, 1, null, null, 20) ;

-- For DU SUBSCRIBER ---
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category, associated_field) values (field_configs_seq.nextval, 3, 'Bill Cycle', '', 62, 32, 3, 0, 'SMM.AG.POSTPAID', '5.51') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Rate Plan', 'RATEPLAN', 63, 33, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Date Of Birth', 'DATE_OF_BIRTH', 64, 34, 3, 0, 'SMM.PRECHECK') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Bill Cycle', 'BILLCYCLE', 65, 35, 3, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category,is_filter,reg_exp_id)  values (field_configs_seq.nextval, 3, 'Subscription Type', 'SUBSCRIPTION_TYPE', 66, 36, 3, 1, 'GR',1,0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Credit Class', 'CREDIT_CLASS', 67, 37, 3, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'End Service Date', 'END_SERVICE_DATE', 68, 38, 3, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Nationality', 'NATIONALITY', 69, 39, 3, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Passport Number', 'PASSPORT_NUMBER', 70, 40, 3, 0, 'SMM.PRECHECK') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category)  values (field_configs_seq.nextval, 3, 'Company Registration Number', 'COMPANY_REGISTRATION_NUMBER', 71, 41, 3, 0, 'SMM.PRECHECK') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Co ID', 'OPTIONAL_FIELD1', 72, 42, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Company Name', 'OPTIONAL_FIELD2', 73, 43, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Subscriber First Name', 'OPTIONAL_FIELD3', 74, 44, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Payment Responsibility Customer ID', 'OPTIONAL_FIELD4', 75, 45, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field5', 'OPTIONAL_FIELD5', 76, 46, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field6', 'OPTIONAL_FIELD6', 77, 47, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field7', 'OPTIONAL_FIELD7', 78, 48, 2, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field8', 'OPTIONAL_FIELD8', 79, 49, 2, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field9', 'OPTIONAL_FIELD9', 80, 50, 2, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Optional Field10', 'OPTIONAL_FIELD10', 81, 51, 2, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Group Description', 'GROUP_DESCRIPTION', 82, 52, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Rate Plan ID', 'RATEPLAN_ID', 83, 53, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Main Directory Number Flag', 'MAIN_DIR_NO_FLAG', 84, 54, 3, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible)  values (field_configs_seq.nextval, 3, 'Dummy', '', 85, 81, 3, 0) ;

--- For Account 
delete from field_configs where record_config_id = 4 ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (196, 4, 'Account Name', 'ACCOUNT_NAME', 1, 1, 1, 'GR', 3,'', 1, '', null, 1, 41, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (197, 4, 'Date of Activation', 'ACCOUNT_DOA', 2, 0, 1, '', 4,'', 2, '', null, 0, 9, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (198, 4, 'Network', 'NETWORK_ID', 3, 0, 0, '', 1,'', 3, '', 10, 0, 23, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (199, 4, 'First Name', 'FIRST_NAME', 4, 0, 1, 'SMM.PRECHECK GR', 3,'', 4, '', null, 1, 41, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (200, 4, 'Middle Name', 'MIDDLE_NAME', 5, 0, 1, 'SMM.PRECHECK GR', 3,'', 5, '', null, 1, 41, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (201, 4, 'Last Name', 'LAST_NAME', 6, 0, 1, 'SMM.PRECHECK GR', 3,'', 6, '', null, 1, 41, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (202, 4, 'Address Line 1', 'ADDRESS_LINE_1', 7, 0, 1, 'SMM.PRECHECK GR', 3,'', 7, '', null, 1, 257, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (203, 4, 'Address Line 2', 'ADDRESS_LINE_2', 8, 0, 1, 'SMM.PRECHECK GR', 3,'', 8, '', null, 1, 257, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (204, 4, 'Address Line 3', 'ADDRESS_LINE_3', 9, 0, 1, 'SMM.PRECHECK GR', 3,'', 9, '', null, 1, 257, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (205, 4, 'City', 'CITY', 10, 0, 1, 'SMM.PRECHECK GR', 3,'', 10, '', null, 1, 41, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (206, 4, 'Post Code', 'POST_CODE', 11, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA GR', 3,'', 11, '', null, 1, 21, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (207, 4, 'Credit Limit', 'CREDIT_LIMIT', 12, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA GR', 2,'', 12, '', null, 1, 40, null, null, null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (208, 4, 'Rate Plan', 'RATE_PLAN', 13, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE GR', 3,'', 13, '', null, 1, 256, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (209, 4, 'Expiry Date', '', 14, 0, 0, 'GR', 4,'', 14, '', null, 1, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (210, 4, 'Grace Period ', '', 15, 0, 0, 'GR', 1,'', 15, '', null, 1, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (211, 4, 'Activation Amount', '', 16, 0, 1, 'GR', 2,'', 16, '', null, 1, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (215, 4, 'Groups', 'GROUPS', 17, 0, 1, 'GR', 7, '', 20, '', 28, 1, 257, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (218, 4, 'Parent Account ID', 'PARENT_ID', 0, 0, 0, '', 8, '', 30, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (219, 4, 'Hierarchy ID', 'HIERARCHY_ID', 0, 0, 0, '', 8, '', 31, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (225, 4, 'Modified Date', 'MODIFIED_DATE', 0, 0, 0, '', 4, '', 36, '', null, 1, 1, null, null, 20) ;

------------Account Derived Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (212, 4, 'Account Type', 'ACCOUNT_TYPE', 0, 0, 0, '', 1, '', 17, '', null, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (213, 4, 'FRD Indicator', 'FRD_INDICATOR', 0, 0, 0, '', 1, '', 18, '', null, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (214, 4, 'Account ID', 'ID', 0, 0, 0, '', 8, '', 19, '', null, 0, 1, null, null, 6) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (216, 4, 'Comments', 'COMMENTS', 0, 0, 0, '', 3, '', 21, '', null, 0, 1, null, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (217, 4, 'Age In Network', '', 0, 0, 1, 'GR', 1, '', 29, 'TRUNC(SYSDATE) - TRUNC(ACCOUNT_DOA)', null, 1, 20, null, null, 4) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (220, 4, 'Static Credit Limit', '', 0, 0, 0, '', 2, '', 33, '', null, 1, 20, null, null, 27) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (226, 4, 'Account Record Sequence ID', '', 0, 0, 0, '', 8, '', 37, '', null, 1, 1, null, null, 5) ;

--- For MLH  
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (350, 4, 'Parent Account Name', '', 18, 0, 0, '', 3,'', 32, '', null, 0, 41, null, 25.1, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (367, 4, 'Root Account Name', '', 19, 0, 0, '', 3, '', 49, '', null, 0, 257, null, '30.1', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (368, 4, 'Action Indicator', '', 20, 0, 0, '', 1,'', 50, '', null, 0, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (221, 4, 'Status For Subscribers in Hierarchy', '', 0, 0, 0, '', 1, '', 34, '', null, 0, 20, null, null, 3) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (222, 4, 'Subscriber Type For Subscribers in Hierarchy', '', 0, 0, 0, '', 1, '', 35, '', null, 0, 20, null, null, 14) ;

-- For DU Account
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_visible, ds_category) values (field_configs_seq.nextval, 4, 'Bill Cycle', 'BILL_CYCLE', 51, 21, 3, 1, 'SMM.AG.POSTPAID') ;

------------------------------------------- Expandable Field Maps entries START ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (1, 'Recharge View', 1, 'CALLED_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (2, 'Recharge Info', 1, 'CALLER_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (3, 'Called Active Subscriber Info', 1, 'CALLED_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (4, 'Caller Active Subscriber Info', 1, 'CALLER_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (6, 'Subscriber Info', 1, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (121, 'CDR-VPMN-Info               ', 1, 'VPMN', 49, 'VPMN', 0, 200, 'RECORD_VIEW', 0);

--For GPRS
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (8, 'Recharge View', 7, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (9, 'Active Subscriber Info ', 7, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Info ', 7, 'PHONE_NUMBER', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (125, 'GPRS-VPMN-Info               ', 7, 'VPMN', 49, 'VPMN', 0, 200, 'RECORD_VIEW', 0);

--For Recharge Log 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (12, 'Active Subscriber Info', 2, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Info', 2, 'PHONE_NUMBER', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');

-- For hotlist
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (57, 'Geographic Position CDR', 15, 'VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');

--For 'Suspect Values For Key'
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (198, 'Geographic Position CDR', 115, 'VALUE', 1, 'GEOGRAPHIC_POSITION', 0, 14, 'RECORD_VIEW GR RULE');


-- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (50, 'Alarm-Subscriber', 10, 'REFERENCE_ID', 102, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (51, 'Alarm-IMEI-Subscriber', 10, 'REFERENCE_ID', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (73, 'Alarm-AccountName-Subscriber', 10, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');

-- For Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (62, 'Alarm-Subscriber', 10, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (63, 'Alarm-IMEI-Subscriber', 10, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (65, 'Alarm-AccountName-AccountInfo', 10, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--For  Archived Alarm
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (66, 'Alarm-Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (67, 'Alarm-IMEI-Subscriber', 19, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (74, 'Alarm-AccountName-Subscriber', 19, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');

-- For Archived Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (69, 'Alarm-Subscriber', 19, 'REFERENCE_VALUE', 102, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (70, 'Alarm-IMEI-Subscriber', 19, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (72, 'Alarm-AccountName-AccountInfo', 19, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Open Alarms )--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (75, 'Alarm-Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (76, 'Alarm-IMEI-Subscriber', 16, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (78, 'Alarm-AccountName-Subscriber', 16, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Closed Alarms )--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (79, 'Alarm-Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (80, 'Alarm-IMEI-Subscriber', 17, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (82, 'Alarm-AccountName-Subscriber', 17, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Assigned Alarms )--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (83, 'Alarm-Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (84, 'Alarm-IMEI-Subscriber', 18, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (86, 'Alarm-AccountName-Subscriber', 18, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');

--- For Alarm Case

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (87, 'Alarm-Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (88, 'Alarm-IMEI-Subscriber', 26, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (90, 'Alarm-AccountName-Subscriber', 26, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (91, 'Alarm-Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (92, 'Alarm-IMEI-Subscriber', 27, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (94, 'Alarm-AccountName-Subscriber', 27, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (95, 'Alarm-Subscriber', 16, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (96, 'Alarm-IMEI-Subscriber', 16, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (98, 'Alarm-AccountName-Subscriber', 16, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Closed Alarms )--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (99, 'Alarm-Subscriber', 17, 'REFERENCE_VALUE', 102, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (100, 'Alarm-IMEI-Subscriber', 17, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (102, 'Alarm-AccountName-Subscriber', 17, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Assigned Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (103, 'Alarm-Subscriber', 18, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (104, 'Alarm-IMEI-Subscriber', 18, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (106, 'Alarm-AccountName-Subscriber', 18, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Case

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (107, 'Alarm-Subscriber', 26, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (108, 'Alarm-IMEI-Subscriber', 26, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (110, 'Alarm-AccountName-Subscriber', 26, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (111, 'Alarm-Subscriber', 27, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (112, 'Alarm-IMEI-Subscriber', 27, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (114, 'Alarm-AccountName-Subscriber', 27, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');


-- For CDR
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
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 1, '23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 1, '6.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 39, 1, '25') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 40, 1, '6.23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 14, 1, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 12, 1, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 41, 1, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 1, '6.5.7.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 1, '6.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 44, 1, '26') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 8, 1, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 9, 1, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 10, 1, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 45, 1, '27') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 1, '6.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 23, 1, '24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 1, '28') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 1, '6.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 1, '6.134.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 1, '6.134.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 200, 1, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 89, 1, '6.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 83, 1, '6.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 1, '6.134.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 201, 1, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 1, '6.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2072, 1, '121.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2076, 1, '29') ;

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
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 7, '9.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 39, 7, '27') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 40, 7, '9.23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 7, '9.5.7.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 7, '9.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 7, '9.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 45, 7, '28') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 7, '9.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 7, '29') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 49, 7, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 30, 7, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 50, 7, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 51, 7, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 30, 7, '9.24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 52, 7, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 53, 7, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 54, 7, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 7, '9.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7,  7, '9.134.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 7, '9.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 200, 7, '31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 7, '9.5.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2071, 7, '9.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 83, 7, '9.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2072, 7, '125.1') ;

--Entries For Recharge
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  1, 2, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  2, 2, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 2, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 2, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 2, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 23, 2, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 2, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17, 2, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 2, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 2, '12.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 55, 2, '12.5.13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 56, 2, '12.5.7.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  3, 2, '12.20') ; 
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  4, 2, '12.19') ; 
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 2, '12.33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 2, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 79, 2, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 83, 2, '12.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 2, '12.5.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 2, '12.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 218, 2, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 2, '12.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 2, '12.134.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2077, 2, '4') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 3, '32') ;

--Entries For Partner Information
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  200, 42, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 70, '15') ;

insert into filter_index_fields(record_config_id, field_id) values(1, 22) ;
insert into filter_index_fields(record_config_id, field_id) values(7, 6) ;
insert into filter_index_fields(record_config_id, field_id) values(2, 2) ;
insert into filter_index_fields(record_config_id, field_id) values(3, 12) ;
insert into filter_index_fields(record_config_id, field_id) values(3, 1) ;
insert into filter_index_fields(record_config_id, field_id) values(3, 19) ;
insert into filter_index_fields(record_config_id, field_id) values(3, 75) ;
insert into filter_index_fields(record_config_id, field_id) values(4, 1) ;
insert into filter_index_fields(record_config_id, field_id) values(98,1) ;
insert into filter_index_fields(record_config_id, field_id) values(98,12) ;
insert into filter_index_fields(record_config_id, field_id) values(99,1) ;


-- CounterManager Configurations 
insert into aggregation_types (ID, DESCRIPTION) values (2, 'PHONE NUMBER') ;
insert into aggregation_types (ID, DESCRIPTION) values (3, 'IMEI NUMBER') ;
insert into aggregation_types (ID, DESCRIPTION) values (4, 'IMSI NUMBER') ;
insert into aggregation_types (ID, DESCRIPTION) values (7, 'Account Name') ;
insert into aggregation_types (ID, DESCRIPTION) values (14, 'Geographic Position') ;
insert into aggregation_types (ID, DESCRIPTION) values (16, 'Subscriber ID') ;
insert into aggregation_types (ID, DESCRIPTION) values (200, 'VPMN') ; 
insert into aggregation_types (ID, DESCRIPTION) values (54, 'Charging ID') ;
insert into aggregation_types (ID,DESCRIPTION) values(10,'Session ID');

insert into aggregation_types (ID, DESCRIPTION) values (213, 'Internal User ID') ;
insert into aggregation_types (ID, DESCRIPTION) values (216, 'PROFILE FIELD PHONE NUMBER') ;
insert into aggregation_types (ID, DESCRIPTION) values (217, 'PROFILE FIELD ACCOUNT NAME') ;

-- Subscriber 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,2,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,3,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,4,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,7,3) ;


insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 3, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 3, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (2, 4, 2, 1) ;
--Velocity Counter
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 2, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 3, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 3, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 3, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 4, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 4, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 4, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 4, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 4, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 1, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 4, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 6, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 7, 14, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 200, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 200, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 200, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 200, 1) ;

-- Internal User
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 70) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 70) ;

-- Adjustment Log
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 71) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 71) ;

-- CRM Log
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 213, 72) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 213, 72) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 54, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 7, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 7, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 7, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 7, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 7, 1) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 3, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 3, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 3, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 3, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 3, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 4, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 4, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 4, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 4, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 4, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 1, 14, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 4, 14, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 14, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 6, 14, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (5, 7, 14, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 54, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 54, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 7, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 7, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 7, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 7, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 7, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 200, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 2, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 2, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 2) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 3, 2) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 4, 2) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 7, 2) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (4, 11, 16, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (4, 11, 16, 2) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (4, 11, 16, 3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (4, 11, 16, 4) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (4, 11, 16, 7) ;

insert into counter_manager_mappings select 4, 11, 213, id from record_configs where id in (70, 71, 72) ; 

-- CounterManager End

-- View Config Components Start
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 1, 'enable_fetch_records', 'false') ;
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 2, 'enable_fetch_records', 'false') ;
insert into view_config_components (id, record_view_config_id, key, value) values (view_config_components_seq.nextval, 7, 'enable_fetch_records', 'false') ;
-- View Config Components End

--For CDR
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (172, 'Called Number CDRs', 1, 'CALLED_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (173, 'Caller Number CDRs', 1, 'CALLER_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');

--For GPRS
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (174, 'GPRS Records For Phone Number', 7, 'PHONE_NUMBER', 7, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


-- Expandable Field Maps entries for Internal User
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (176, 'Internal User - Active Subscriber', 83, 'PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW', 0);
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (177, 'Internal User - CDR', 83, 'PHONE_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW', 0);
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (178, 'Internal User - GPRS', 83, 'PHONE_NUMBER', 7, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW', 0);
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (179, 'Internal User - Recharge Log', 83, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW', 0);


-- Expandable Field Map entries for Closed Case -> Associated Alarms

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (180, 'Alarm-Subscriber', 50, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (181, 'Alarm-IMEI-Subscriber', 50, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (182, 'Alarm-IMSI-Subscriber', 50, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (183, 'Alarm-AccountName-Subscriber', 50, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (184, 'Alarm-Subscriber', 50, 'REFERENCE_VALUE', 102, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (185, 'Alarm-IMEI-Subscriber', 50, 'REFERENCE_VALUE', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (186, 'Alarm-AccountName-Subscriber', 50, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (187, 'Alarm-IMSI-Subscriber', 50, 'AGGREGATION_VALUE', 102, 'IMSI', 0, 4, 'RECORD_VIEW');

----------Black List subsciber info --- start -----
insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (expandable_field_maps_seq.nextval,'Caller Black List Subscriber Info',1,'CALLER_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE',0);
insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (expandable_field_maps_seq.nextval,'Called Black List Subscriber Info',1,'CALLED_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE',0);
----------Black List subsciber info --- end  -----


------------------ Precheck List View Field Config Entries

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) (select FIELD_CONFIGS_SEQ.nextval,98 ,name ,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function from field_configs where (ds_category like '%SMM.PRECHECK%' or database_field in ('ACCOUNT_NAME','NETWORK_ID','ID','ACCOUNT_ID','PHONE_NUMBER')) and (ASSOCIATED_FIELD is null or  database_field in ('ACCOUNT_NAME','NETWORK_ID')) and record_config_id =3   );

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) (select FIELD_CONFIGS_SEQ.nextval,99 ,name ,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function from field_configs where (ds_category like '%SMM.PRECHECK%' or database_field in ('ACCOUNT_NAME','NETWORK_ID','ID','ACCOUNT_ID')) and record_config_id = 4   );

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) ( select field_record_config_map_seq.nextval,field_category_id,98, field_association from field_record_config_maps where record_config_id=3 and  field_association in ( select  to_char(field_id) from field_configs where record_config_id =98)) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) ( select field_record_config_map_seq.nextval,field_category_id,99, field_association from field_record_config_maps where record_config_id=4 and  field_association in (select to_char(field_id) from field_configs where record_config_id =99)) ;



commit ;
quit ;
spool off ;
