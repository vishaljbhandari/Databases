SPOOL ranger-vpmn-rules.log 
set feedback off ;
set serveroutput off ;

-- Partner Information -- VPMN Loading -- 
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, 
				   is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
		values
					(s_rule_seq.nextval, 999, s_rule_seq.currval, 'Add Partner Information', 0, 200, 0, 0, 1, 
							sysdate, sysdate, 100, 'radmin', '', 1, 'DISPATCHER.VPMN.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 42) ;

insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 41) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 0, 0, 42) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 3000) ;

-----------------------Entries added to handle dupliacte VPMN record-------------------------------

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 42, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, s_rule_seq.currval) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '514.2', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values (filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null, null, null, null) ;


