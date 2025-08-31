
delete from ascii_delimited_field_info where parser_name = 'GBXUS_SUB_PARSER' and field_position = 36 ;
insert into ascii_delimited_field_info (parser_name,field_position,field_name) values ('GBXUS_SUB_PARSER',36,'ULTIMATE_NAME');
insert into ascii_delimited_field_info (parser_name,field_position,field_name) values ('GBXUS_SUB_PARSER',37,'REGION');
insert into ascii_delimited_field_info (parser_name,field_position,field_name) values ('GBXUS_SUB_PARSER',38,'ORDER_STATUS');
insert into ascii_delimited_field_info (parser_name,field_position,field_name) values ('GBXUS_SUB_PARSER',39,'DUMMY_SPACE');

insert into formatter (datasource_name,field_name,sequence,formatter_type,formatter_name) values ('GBXUS_SUBSCRIBERDS','ULTIMATE_NAME',1,8,'TRUNC_AFTER_30');
insert into formatter (datasource_name,field_name,sequence,formatter_type,formatter_name) values ('GBXUS_SUBSCRIBERDS','REGION',1,8,'TRUNC_AFTER_1');
insert into formatter (datasource_name,field_name,sequence,formatter_type,formatter_name) values ('GBXUS_SUBSCRIBERDS','ORDER_STATUS',1,8,'TRUNC_AFTER_2');

insert into rff_field_position_map values ('GBXUS_SUBSCRIBERDS', 'ULTIMATE_NAME', 60, '') ;
insert into rff_field_position_map values ('GBXUS_SUBSCRIBERDS', 'REGION', 61, '') ;
insert into rff_field_position_map values ('GBXUS_SUBSCRIBERDS', 'ORDER_STATUS', 62, '') ;
 
delete from output_format where datasource_name = 'GBXUS_SUBSCRIBERDS' ;

insert into output_format (datasource_name,number_of_fields,delimiter) values ('GBXUS_SUBSCRIBERDS',62,'|');

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1156, 3, 'Ultimate Name', 'ULTIMATE_NAME', 60, 0, 1, '', 3,'', 70, '', null, 1, 31, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1157, 3, 'Region', 'REGION', 61, 0, 1, '', 3,'', 71, '', null, 1, 1, 10, null, null) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id,  query_field, translation_id, is_filter, width,  reg_exp_id, associated_field, derivative_function) values (1158, 3, 'Order Status', 'ORDER_STATUS', 62, 0, 1, '', 3,'', 72, '', null, 1, 2, 10, null, null) ;

alter table subscriber add (ULTIMATE_NAME           VARCHAR2(30),
							REGION                  VARCHAR2(1),
							ORDER_STATUS            VARCHAR2(2)) ;

delete from aggregation_types_map where  source_aggregation in (1003, 1004) ;

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1003, 0, 0, 1, '', null) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1004, 0, 0, 1, '', null) ;

