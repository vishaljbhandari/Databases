spool nikira-DML-rule-fp-exec.log
set feedback off ;
set serveroutput off ;

-- Coloring rules for nadmin
insert into filters (id, record_config_id, is_exception, network_id) values (filters_seq.nextval, 45, 0, 999) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '9', 'Disabled', 1024, 6) ;
insert into filter_tokens (id, filter_id, description, expression_id, system_filter) values 
(filter_tokens_seq.nextval, filters_seq.currval, 'Status Equal Disabled', expressions_seq.currval, 0) ;

insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'Profile Element Status Equal Disabled - nadmin', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'nadmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;

insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 45);

-- Coloring rules for radmin
insert into filters (id, record_config_id, is_exception, network_id) values (filters_seq.nextval, 45, 0, 999) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '9', 'Disabled', 1024, 6) ;
insert into filter_tokens (id, filter_id, description, expression_id, system_filter) values 
(filter_tokens_seq.nextval, filters_seq.currval, 'Status Equal Disabled', expressions_seq.currval, 0) ;

insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'Profile Element Status Equal Disabled - radmin', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'radmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;

insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 45);

-- Coloring rules for default
insert into filters (id, record_config_id, is_exception, network_id) values (filters_seq.nextval, 45, 0, 999) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '9', 'Disabled', 1024, 6) ;
insert into filter_tokens (id, filter_id, description, expression_id, system_filter) values 
(filter_tokens_seq.nextval, filters_seq.currval, 'Status Equal Disabled', expressions_seq.currval, 0) ;

insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'Profile Element Status Equal Disabled - default', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'default', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;

insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 45);
-- Fingerprint Configuration Rule For Entity Subscriber--

INSERT INTO rules(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'0',rules_key_seq.nextval,'Subscriber_FP_configuration_v0','0','16','0','0','0','1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','FINGERPRINT','1') ;
insert into fp_configurations(id, entity_id, time_window, version, rule_key) values(1, 2, 1, 0, rules_key_seq.currval);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 3) ;
commit ;

