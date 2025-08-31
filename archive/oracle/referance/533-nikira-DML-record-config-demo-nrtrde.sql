spool nikira-DML-record-config-demo-nrtrde.log
set feedback off ;
set serveroutput off ;

--Entries For Partner Information
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  200, 42, '2') ;



-- CounterManager Configurations 
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (200, 'VPMN', '', '-1,-2,-3,-4,-5') ; 
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 200) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 200, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (expandable_field_maps_seq.nextval, 'Alarm-VPMN-Details', 116, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (expandable_field_maps_seq.nextval, 'Alarm-VPMN-Details', 116, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);



commit ;

