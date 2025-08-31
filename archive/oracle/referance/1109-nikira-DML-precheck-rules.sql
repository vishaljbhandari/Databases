spool nikira-DML-precheck-rules.log
set feedback off;
set serveroutput off ;

-- precheck index insertion rule
INSERT INTO rules(id, parent_id, key, name, version, aggregation_type, accumulation_field,
	accumulation_function, pseudo_function_id, is_enabled, created_time, modification_time, severity,
	user_id, description, processor_type, category, is_active) VALUES 
 	(rules_seq.nextval, '999', rules_key_seq.nextval, 'RuleForBitmapIndexInsertion', '0', '1', '0', 
 	34, NULL, '1', sysdate, sysdate, '1', 'radmin', NULL, '1', 'BITMAP_INSERT INLINE.STORE', '1') ;

insert into rule_priority_maps (id, rule_id, priority) values 
	(rule_priority_maps_seq.nextval, rules_seq.currval, 10321) ;

insert into actions_rules (rule_id, action_id) values (rules_seq.currval, 36) ;

insert into record_configs_rules (rule_id, record_config_id) 
	select rules_seq.currval, record_config_id from precheck_record_configs ;

commit ;
