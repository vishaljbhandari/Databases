spool nikira-DML-rule-isp-exec.log
set feedback off ;
set serveroutput off ;

--ISP

insert into record_configs_rules(rule_id, record_config_id) values (6, 83) ;
insert into record_configs_rules(rule_id, record_config_id) values (7, 83) ;

insert into record_configs_rules(rule_id, record_config_id) values(5, 83) ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 83, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, 5) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '11', '1,4', 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null) ;

insert into record_configs_rules(rule_id, record_config_id)  values(15,83);

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 83, 0, 999) ;

insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, 15) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '11', '2', 1030, 8);

insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null) ;

--------------------------- Global Exception Rule --------------------

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 83, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Global Exception')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'12','%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null,' ',1) ;


insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Global Exception'), 83) ;

-- Update Total Calls For Subscriber ----

insert into record_configs_rules (rule_id, record_config_id) (select r.id, 83 from rules r  where r.category = 'MANUAL_ALARM_RULES') ;
commit ;

