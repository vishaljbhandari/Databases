spool nikira-DML-rule-preveasupport-exec.log
set feedback off ;
set serveroutput off ;

-------Prevea File Write Action----------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'999',rules_key_seq.nextval,'Prevea File Write Action','1','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SUBSCRIBER.STORE','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 10006) ;

insert into record_configs_rules(rule_id, record_config_id) values(rules_seq.currval, 3) ;

insert into actions_rules (rule_id, action_id) values(rules_seq.currval,100);


insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, rules_seq.currval) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '25', '1', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval ,null) ;

commit ;

