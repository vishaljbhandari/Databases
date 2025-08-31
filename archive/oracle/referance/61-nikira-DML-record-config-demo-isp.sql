spool nikira-DML-record-config-demo-isp.log
set feedback off ;
set serveroutput off ;

-- Alarm XDR map ---
insert into alarm_xdr_maps( ID,LOOKUP_TABLE_NAME,RECORD_CONFIG_ID) values(alarm_xdr_maps_seq.nextval,'ALARM_IPDR',83);

--- Entries for filter_index_fields
insert into filter_index_fields(record_config_id, field_id) values(83, 12) ;

-- For Record To Subscriber Accociation for Active/Black List

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (254, 'Subscriber Details', 104, 'USER_NAME,SUBSCRIBER_ID', 102, 'PHONE_NUMBER,ID', 0, 2, 'RULE');


--Entries For ISP --
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 83, '254.22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 83, '254.271.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 83, '254.271.20') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 23, 83, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 46, 83, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 212, 83, '254.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2071, 83, '254.35') ;


-- CounterManager Configurations 
insert into aggregation_types (ID,DESCRIPTION) values(10,'Session ID');
update aggregation_types set RECORD_CONFIG_IDS= RECORD_CONFIG_IDS || ',83' where id = 16 ;  

--IPDR To Other Datastreams

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number IPDRs', 104, 'PHONE_NUMBER', 104, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (250, 'Active Subscriber Details', 104, 'USER_NAME', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Black List Subscriber Details', 104, 'USER_NAME', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');


----- For IPDR View
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 104, 'USER_NAME',105, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW') ;



insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(field_record_config_map_seq.nextval,901,83,'250.226.16');



--------------------field_configs Additional configuration -------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,7,83,'FLOAT_PRECISION',2); 
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,8,83,'FLOAT_PRECISION',2); 
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,83,'FLOAT_PRECISION',2); 

commit ;

