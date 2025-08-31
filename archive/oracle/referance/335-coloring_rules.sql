spool coloring_rules.log
set feedback off ;
set serveroutput off ;
create or replace procedure InsertColoringRule( ruleName in varchar2, userId in varchar2, color in varchar2, rightField in varchar2, leftField in varchar2, recordConfigId in number, filterDescription in varchar2 )
IS
begin
	
	INSERT INTO rules (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
		PSEUDO_FUNCTION_ID, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, DESCRIPTION, PROCESSOR_TYPE,
		CATEGORY, IS_ACTIVE) VALUES (rules_seq.nextval, '999', rules_key_seq.nextval, ruleName, '0', '0', '0', '2', NULL,
		'1', sysdate, sysdate, '100', userId, NULL, '1', 'COLORING_RULES', '1');

	insert into rule_color_maps(id, rule_id, back_color) values (rule_color_maps_seq.nextval, rules_seq.currval, color) ;

	insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, recordConfigId, 0, 999) ;

	insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, rules_seq.currval) ;

	insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, leftField, rightField, 1024, 6) ;

	insert into filter_tokens(id, filter_id, expression_id, description) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, filterDescription) ;

	insert into record_configs_rules(rule_id, record_config_id) values (rules_seq.currval, recordConfigId) ;

end InsertColoringRule ; 
/
commit ;

