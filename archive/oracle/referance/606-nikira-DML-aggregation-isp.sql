spool nikira-DML-aggregation-isp.log
set feedback off ;
set serveroutput off ;

-- Archive Map ----
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(9, 'ARCHIVED_IPDR', 'ARCHIVED_ALARM_IPDR', 83);

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id,REFERENCE_CATEGORY_ID ) values (reference_types_maps_seq.nextval, 225, 1, 225, 16) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 225, 83) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 225,83) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1 from field_categories,functions,record_configs where field_categories.category like '%AGGREGATION_TYPE%' and functions.id in (1,2) and record_configs.tname = 'IPDR' and field_categories.id = 225 )  ;

INSERT INTO counter_maps (category, aggregation_type, function_id, record_config_id, id, counter_type) values ('REGULAR', 225, 6, 83, counter_maps_seq.nextval, 6) ;
INSERT INTO counter_maps (category, aggregation_type, function_id, record_config_id, id, counter_type) values ('REGULAR', 225, 14, 83, counter_maps_seq.nextval, 8) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 1 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 2 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 3 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 4 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 5 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 6 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 8 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 9 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 10 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 11 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 12 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 13 ) ;

insert into agg_type_pseudo_functions values ( AGG_TYPE_PSEUDO_FUNCTIONS_seq.nextval, 225, 14 ) ;

----- Entry into pseudo_functns_record_configs for IPDR
insert into pseudo_functns_record_configs values(1,83);
insert into pseudo_functns_record_configs values(2,83);
insert into pseudo_functns_record_configs values(3,83);
insert into pseudo_functns_record_configs values(4,83);
insert into pseudo_functns_record_configs values(5,83);
insert into pseudo_functns_record_configs values(6,83);
insert into pseudo_functns_record_configs values(8,83);
insert into pseudo_functns_record_configs values(9,83);
insert into pseudo_functns_record_configs values(10, 83);
insert into pseudo_functns_record_configs values(11, 83);
insert into pseudo_functns_record_configs values(12, 83);
insert into pseudo_functns_record_configs values(13, 83);
insert into pseudo_functns_record_configs values(14, 83);
--- Updating Global expression rule for subscriber
update expressions set RIGHT_FIELD='%' where LEFT_FIELD='12' and RIGHT_FIELD='+%' and RIGHT_FIELD_INDICATOR=1024 and OPERATOR_ID=1 and id in (select expression_id from filter_tokens where system_filter = 1);

commit ;

