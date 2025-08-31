insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 2, 2) ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, 5) ;

insert into expressions (id, left_field,left_field_indicator, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '10','1025','1,4',1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
                        begin_group_ind, combining_operator, end_group_ind) 
 						values (filter_tokens_seq.nextval,filters_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into RECORD_CONFIGS_RULES values(5,2,0) ;

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (36, 2, 'IMSI', 'IMSI',17,14,3, 0, '', '', 40, null, 1, 1, 9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (37, 2, 'IMEI', 'IMEI',18,15,3, 0, '', '', 40, null, 1, 1, 9, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (38, 2, 'CDR TYPE', 'CDR_TYPE',19,16,1, 0, '', '', 40,3, 1, 1, 1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (39, 2, 'SERVICE', 'SERVICE',20,0,1, 0, '', '', 40, null, 1, 1, 1, 1) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 18, 2, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  4, 2, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  3, 2, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  6, 2, '20') ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval, 2,record_configs.id, functions.id, 8
                            from functions,record_configs,aggregation_types
                             where functions.id in (14)
                             and record_configs.tname in ('RECHARGE_LOG')
							 and instr(','||aggregation_types.record_config_ids||',' , ','||record_configs.id||',') > 0
							  and aggregation_types.id = 2 ) ;


insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, 8) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '9', '1024', 1024, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 2 from pseudo_functions where id = 8)  ;

insert into field_record_config_maps (id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 89, 2, '253.35') ;

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 2 from pseudo_functions where id = 8)  ;

ALTER TABLE RECHARGE_LOG ADD (IMSI VARCHAR2(64), IMEI VARCHAR2(64), CDR_TYPE NUMBER(10), SERVICE NUMBER(20)) ;

ALTER TABLE ALARM_RECHARGE_LOG ADD (IMSI VARCHAR2(64), IMEI VARCHAR2(64), CDR_TYPE NUMBER(10), SERVICE NUMBER(20)) ;

ALTER TABLE SP_ALARM_RECHARGE_LOG ADD (IMSI VARCHAR2(64), IMEI VARCHAR2(64), CDR_TYPE NUMBER(10), SERVICE NUMBER(20)) ;

ALTER TABLE SP_RTF_ALARM_RECHARGE_LOG ADD (IMSI VARCHAR2(64), IMEI VARCHAR2(64), CDR_TYPE NUMBER(10), SERVICE NUMBER(20)) ;

ALTER TABLE OFFLINE_RECHARGE_LOG ADD (IMSI VARCHAR2(64), IMEI VARCHAR2(64), CDR_TYPE NUMBER(10), SERVICE NUMBER(20)) ;

update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',2'  where description = 'IMSI NUMBER' and id = 4;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 4, 2) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id not in (4,5,6 ,7,15,14,17,24, 25, 27)
                             and record_configs.tname = 'RECHARGE_LOG'
                             and field_categories.id = 4);

commit;
