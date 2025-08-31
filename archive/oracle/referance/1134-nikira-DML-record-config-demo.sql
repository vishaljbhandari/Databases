spool nikira-DML-record-config-demo.log
set feedback off ;
set serveroutput off ;
-- nikira-DML-record-config-demo-gprs-nrtrde.sql    nikira-DML-record-config-demo-gsm.sql           nikira-DML-record-config-demo-not-mlh.sql
-- nikira-DML-record-config-demo-gprs-recharge.sql  nikira-DML-record-config-demo-isp-gprs.sql      nikira-DML-record-config-demo-nrtrde.sql
-- nikira-DML-record-config-demo-gprs.sql           nikira-DML-record-config-demo-isp-gsm.sql       nikira-DML-record-config-demo-recharge.sql
-- nikira-DML-record-config-demo-gsm-gprs.sql       nikira-DML-record-config-demo-isp-recharge.sql  nikira-DML-record-config-demo.sql
-- nikira-DML-record-config-demo-gsm-nrtrde.sql     nikira-DML-record-config-demo-isp.sql
-- nikira-DML-record-config-demo-gsm-recharge.sql   nikira-DML-record-config-demo-mlh.sql


delete from field_record_config_maps  where record_config_id in (1, 2, 7) ;
delete from field_configs where record_config_id in (1, 2, 7) ;

delete from view_config_components where record_view_config_id in (select id from record_view_configs where record_config_id in (1, 2, 7)) ;
delete from record_view_configs where record_config_id in (1, 2, 7) ;
delete from record_configs where id in (1, 2, 7) ;
delete from aggregation_types where id in (1, 2, 14, 54) ;
delete from counter_manager_mappings where record_config_id in (1, 2, 7, 70, 71, 72) and rule_mode = 0 ;
delete from rule_modes where id = 0 ;

delete from archive_maps ;

insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(3, 'ARCHIVED_SUBSCRIBER', 'ARCHIVED_SUBSCRIBER', 3);

-- Alarm XDR map ---
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'OBS_SUMMARY_RECORDS',69);
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'AR_OBS_SUMMARY_RECORDS',93);
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'OBS_SUMMARY_RECORDS',116);




------------------------------------------- Expandable Field Maps entries START ---------------------------------

-- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (50, 'Alarm-Service', 10, 'REFERENCE_ID', 102, 'ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (51, 'Alarm-IMEI-Subscriber', 10, 'REFERENCE_ID', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (73, 'Alarm-AccountName-Subscriber', 10, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW WORK_FLOW');

-- For Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (62, 'Alarm-Service', 10, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW WORK_FLOW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (63, 'Alarm-IMEI-Subscriber', 10, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (65, 'Alarm-AccountName-AccountDetails', 10, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--For  Archived Alarm
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (66, 'Alarm-Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (67, 'Alarm-IMEI-Subscriber', 19, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (74, 'Alarm-AccountName-Subscriber', 19, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');

-- For Archived Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (69, 'Alarm-Service', 19, 'REFERENCE_VALUE,REFERENCE_ID', 102, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (70, 'Alarm-IMEI-Subscriber', 19, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) values (72, 'Alarm-AccountName-AccountDetails', 19, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

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

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (95, 'Alarm-Service', 16, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (96, 'Alarm-IMEI-Subscriber', 16, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (98, 'Alarm-AccountName-Subscriber', 16, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Closed Alarms )--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (99, 'Alarm-Service', 17, 'REFERENCE_VALUE,REFERENCE_ID', 102, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (100, 'Alarm-IMEI-Subscriber', 17, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (102, 'Alarm-AccountName-Subscriber', 17, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Admin ( Assigned Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (103, 'Alarm-Service', 18, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (104, 'Alarm-IMEI-Subscriber', 18, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (106, 'Alarm-AccountName-Subscriber', 18, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

--- For Alarm Case

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (107, 'Alarm-Service', 26, 'REFERENCE_VALUE,REFERENCE_ID', 102, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (108, 'Alarm-IMEI-Subscriber', 26, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (110, 'Alarm-AccountName-Subscriber', 26, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (111, 'Alarm-Service', 27, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (112, 'Alarm-IMEI-Subscriber', 27, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (114, 'Alarm-AccountName-Subscriber', 27, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');

-- Association For Subscriber to Active/Blacklist Account Based on Account ID 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (271, 'Active/Blacklist Account Details', 3, 'ACCOUNT_ID', 103, 'ID', 0, 1, 'RULE NOT_VISIBLE' , 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (272, 'Active/Blacklist Subscriber UID Details', 3, 'SUBSCRIBER_UID', 102, 'SUBSCRIBER_UID', 0, 1, 'RULE NOT_VISIBLE' , 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (273, 'Blacklist Subscriber UID/Active Subscriber Details', 12, 'SUBSCRIBER_UID', 21, 'SUBSCRIBER_UID', 0, 1, 'RULE NOT_VISIBLE' , 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,	category) values (534, 'Active/Blacklist Account Details',45, 'ACCOUNT_ID', 103, 'ID', 0, 1, 'RULE');


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 47, 3, '32') ;


insert into filter_index_fields(record_config_id, field_id) values(3, 12) ;
insert into filter_index_fields(record_config_id, field_id) values(3, 1) ;
insert into filter_index_fields(record_config_id, field_id) values(4, 1) ;
insert into filter_index_fields(record_config_id, field_id) values(98,1) ;
insert into filter_index_fields(record_config_id, field_id) values(98,12) ;
insert into filter_index_fields(record_config_id, field_id) values(99,1) ;

insert into filter_index_fields (record_config_id, field_id) values (3, 53.0) ;
insert into filter_index_fields (record_config_id, field_id) values (3, 55.0) ;


-- CounterManager Configurations 
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (2, 'PHONE NUMBER', '3,71', '-1,-2,-3,-4,-5,901') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (3, 'IMEI NUMBER', '', '-1,-2,-3,-4,-5') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (4, 'IMSI NUMBER', '3', '-1,-2,-3,-4,-5,901') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (14, 'Geographic Position', '', '-1,-2,-3,-4,-5') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS) values (16, 'Subscriber ID', '1,2,7') ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 2) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 3) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 4) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 14) ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 16) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 2, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 3, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 4, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 14, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 16, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');


--- Production Rule Mode --
insert into rule_modes(id, name, display_name, category) values(0, 'Production', 'Production', null) ;

-- Subscriber 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,2,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,3,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,4,3) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values(1,1,7,3) ;


-- CounterManager End



-- Expandable Field Map entries for Closed Case -> Associated Alarms

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (180, 'Alarm-Subscriber', 50, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (181, 'Alarm-IMEI-Subscriber', 50, 'REFERENCE_ID', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (182, 'Alarm-IMSI-Subscriber', 50, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (183, 'Alarm-AccountName-Subscriber', 50, 'REFERENCE_ID', 4, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (184, 'Alarm-Subscriber', 50, 'REFERENCE_VALUE,REFERENCE_ID', 102, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (185, 'Alarm-IMEI-Subscriber', 50, 'REFERENCE_VALUE', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (186, 'Alarm-AccountName-Subscriber', 50, 'REFERENCE_VALUE', 103, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (187, 'Alarm-IMSI-Subscriber', 50, 'AGGREGATION_VALUE', 102, 'IMSI', 0, 4, 'RECORD_VIEW');



------------------ Precheck List View Field Config Entries

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) (select FIELD_CONFIGS_SEQ.nextval,98 ,name ,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function from field_configs where record_config_id =3   );

update field_configs set is_visible=0 where record_config_id=98 and DATABASE_FIELD in ('MCN1','MCN2','CONNECTION_TYPE','SERVICES','QoS','PRODUCT_TYPE','STATUS','FIRST_CALL','GROUPS');


insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) (select FIELD_CONFIGS_SEQ.nextval,99 ,name ,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function from field_configs where record_config_id = 4   );
update field_configs set is_visible=0 where record_config_id=99 and DATABASE_FIELD in ('CREDIT_LIMIT','RATE_PLAN','GROUPS');

update field_configs set associated_field='540.3' where record_config_id=99 and name='Activation Amount';
update field_configs set associated_field='536.1' where record_config_id=99 and name='Parent Account Name';
update field_configs set associated_field='539.1' where record_config_id=99 and name='Root Account Name';

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) ( select FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,field_category_id,98, field_association from field_record_config_maps where record_config_id=3) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) ( select FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,field_category_id,99, field_association from field_record_config_maps where record_config_id=4) ;

update field_configs set is_visible = 0 where record_config_id=98 and name='Subscriber UID';
update field_configs set is_visible = 0 where record_config_id=98 and name='Service Number Type';

-- For My Team Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-Subscriber', 116, 'REFERENCE_ID', 102, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMEI-Subscriber', 116, 'REFERENCE_ID', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-AccountName-Subscriber', 116, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');

-- For Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-Service', 116, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 999, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMEI-Subscriber', 116, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-AccountName-AccountDetails', 116, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMSI-Subscriber', 116, 'REFERENCE_ID', 102, 'ID', 0, 4, 'RECORD_VIEW');
	
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMSI-Subscriber', 116, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');




----- For HotList
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 115, 'VALUE',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;


--------Alarm History
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 118, 'REFERENCE_VALUE', 105, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 119, 'REFERENCE_VALUE', 105, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	select expandable_field_maps_seq.nextval, name, 119, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category
		from expandable_field_maps where source_view_id = 19 ;

---- For Hotlist
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 15, 'VALUE',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 15, 'END_VALUE',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;
-- Bill Cycle Relations --
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (226, 'Subscriber Account Credit Detail', 3, 'ACCOUNT_NAME', 5, 'ACCOUNT_NAME', 0, 7, ''); 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,	category) values (535, 'Subscriber Account Credit Detail', 45, 'ACCOUNT_NAME', 5, 'ACCOUNT_NAME', 0, 7, ''); 



-- Inserts for record_types which are not to be used by alarmdenormalizer
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(1,3,'SUBSCRIBER') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(2,69,'OBS_SUMMARY_RECORDS') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(3,29,'DEV_CUM_VOICE_ROC_RECORDS') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(4,30,'DEV_CUM_DATA_ROC_RECORDS') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(5,4,'ACCOUNT') ;
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(7,116,'OBS_SUMMARY_RECORDS') ;

-- Entries for record type for field length validations
insert into LENGTH_VALIDATION_REC_TYPES values(1,'CDR') ;
insert into LENGTH_VALIDATION_REC_TYPES values(2,'RECHARGE_LOG') ;
insert into LENGTH_VALIDATION_REC_TYPES values(3,'SUBSCRIBER') ;
insert into LENGTH_VALIDATION_REC_TYPES values(4,'ACCOUNT') ;
insert into LENGTH_VALIDATION_REC_TYPES values(7,'GPRS_CDR') ;

--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,21,'FLOAT_PRECISION',2); 


-- Entry for handling enrichment for Account Name,Phone Number During subscriber
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Previous Subscriber for Phone Number and AccountName', 3, 'PHONE_NUMBER,ACCOUNT_NAME', 12, 'PHONE_NUMBER,ACCOUNT_NAME', 0, 9999, ''); 
insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,5001,3,to_char(expandable_field_maps_seq.currval) || '.32' );
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,	category) values (expandable_field_maps_seq.nextval, 'Previous Subscriber for Phone Number and AccountName', 45, 'PHONE_NUMBER,ACCOUNT_NAME', 12, 'PHONE_NUMBER,ACCOUNT_NAME', 0, 9999, ''); 

commit ;

