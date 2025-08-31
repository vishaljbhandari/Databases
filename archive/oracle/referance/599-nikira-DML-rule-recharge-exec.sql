spool nikira-DML-rule-recharge-exec.log
set feedback off ;
set serveroutput off ;

--- Output File Write Action----------------------------

insert into record_configs_rules(rule_id, record_config_id) values(6, 2) ;

-- Dispatcher Rule------------------------
-- Filter : Charging ID is null

insert into record_configs_rules(rule_id, record_config_id) values(7, 2) ;

---Rule For updating account balance for Recharge------------------  
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('8','999','8','RuleForPrepaidUpdation For Recharge','0','2','1','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SYSTEM_RULES','1');

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, 8) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '9', '1024', 1024, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null) ;



------------------------
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 8, 10007) ;

insert into record_configs_rules(rule_id, record_config_id) values(8, 2) ;
insert into actions_rules(rule_id, action_id) values(8, 10) ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(9, null, 2, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(9, 8) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(9, '5', '1', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(9, 9, 9, null) ;

-- Dispatcher Rule For Rechare Log
--INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('9','999','9',' Recharge Dispatcher','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');
----insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 9, 10008) ;
----insert into record_configs_rules(rule_id, record_config_id) values(9, 2) ;
----insert into actions_rules(rule_id, action_id) values(9, 9) ;



--------------------------- Global Exception Rule --------------------

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Global Exception')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'2','+%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,' ',1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Global Exception'), 2) ;

------Rule to Reject Blacklisted/Disconnected Subscribers

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'253.31','3,0', 1030,8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,null,1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber'), 2) ;
------------------

commit ;

