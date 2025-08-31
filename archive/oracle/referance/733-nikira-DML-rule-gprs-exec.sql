spool nikira-DML-rule-gprs-exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules(rule_id, record_config_id) values(1, 7) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(2, null, 7, 0, 999) ;

insert into filters_rules(filter_id, rule_id) values(2, 1) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(2, '18', '252.20', 1029, 7) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(2, 2, 2, null) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '18', '', 1024, 7);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, 2, expressions_seq.currval ,null) ;

insert into record_configs_rules(rule_id, record_config_id) values(2, 7) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(4, null, 7, 0, 999) ;

insert into filters_rules(filter_id, rule_id) values(4, 2) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(4, '251.35', '1024', 1028, 5) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(5, '8', '2,4,5', 1030, 8) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(5, 4, 5, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '252.25', '2', 1024, 6) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, 4, expressions_seq.currval, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(10, '252.35', '1024', 1028, 5) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(10, 4, 10, null) ;

insert into record_configs_rules(rule_id, record_config_id) values(15, 7) ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(17, null, 7, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(17, 15) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(17, '14', '2', 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(17, 17, 17, null) ;

-------------------Rule to store default subscribers from RecordProcessing flow.----------------------

insert into record_configs_rules(rule_id, record_config_id) values(5, 7) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(7, null, 7, 0, 999) ;

insert into filters_rules(filter_id, rule_id) values(7, 5) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(7, '14', '1,4', 1030, 8);

insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(7, 7, 7, null) ;



--- Output File Write Action----------------------------

insert into record_configs_rules(rule_id, record_config_id) values(6, 7) ;


-- Dispatcher Rule------------------------
-- Filter : Charging ID is null
insert into record_configs_rules(rule_id, record_config_id) values(7, 7) ;


--------------------------- Global Exception Rule --------------------
insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 7, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Global Exception')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'6','+%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,' ',1) ;


insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Global Exception'), 7) ;
------Rule to Reject Blacklisted/Disconnected Subscribers

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 7, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'252.31','3,0', 1030,8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,null,1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber'), 7) ;

------------------

commit ;

