spool nikira-DML-record-config-demo-gsm-gprs.log
set feedback off ;
set serveroutput off ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 7, '252.271.20') ;

-- CounterManager Configurations 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 54, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 54, 1) ;


--CDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number GPRS CDRs', 1, 'PHONE_NUMBER', 7, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


--GPRS CDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number CDRs', 7, 'PHONE_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');

commit ;

