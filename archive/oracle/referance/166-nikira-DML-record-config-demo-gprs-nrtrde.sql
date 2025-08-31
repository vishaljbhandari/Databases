spool nikira-DML-record-config-demo-gprs-nrtrde.log
set feedback off ;
set serveroutput off ;


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (125, 'GPRS-VPMN-Details', 7, 'VPMN', 49, 'VPMN', 0, 200, 'RECORD_VIEW', 0);

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 6, 200, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 200, 7) ;
commit ;

