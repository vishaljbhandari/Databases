spool nikira-DML-rule-gsm-exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules(rule_id, record_config_id) values(1, 1) ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(1, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(1, 1) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(1, '9', '251.20', 1029, 7) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(1, 1, 1, null) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '9', '', 1024, 7);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, 1, expressions_seq.currval ,null) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 2, 5) ;
insert into record_configs_rules(rule_id, record_config_id) values(2, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(3, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(3, 2) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(3, '15', '2,4,5', 1030, 8) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(3, 3, 3, null) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '251.25', '2', 1024, 6) ;
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, 3, expressions_seq.currval, null) ;

insert into record_configs_rules(rule_id, record_config_id) values(15, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(16, null, 1, 0, 999) ;

insert into filters_rules(filter_id, rule_id) values(16, 15) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(16, '13', '2', 1030, 8);

insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(16, 16, 16, null) ;


-------------------Rule to store default subscribers from RecordProcessing flow.----------------------
insert into record_configs_rules(rule_id, record_config_id) values(5, 1) ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(6, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(6, 5) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(6, '13', '1,4', 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(6, 6, 6, null) ;


--- Output File Write Action----------------------------
insert into record_configs_rules(rule_id, record_config_id) values(6, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(8, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(8, 6) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(8, '18', '1', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(8, 8, 8, null) ;

-- Dispatcher Rule------------------------
-- Filter : Charging ID is null
insert into record_configs_rules(rule_id, record_config_id) values(7, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(11, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(11, 7) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(11, '19', '0', 1024, 2);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(11, 11, 11, null) ;

-- Dispatcher Rule------------------------
-- Filter : Charging ID is not null (For IP rule processor)

insert into record_configs_rules(rule_id, record_config_id) values(9, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(12, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(12, 9) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(12, '19', '0', 1024, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(12, 12, 12, null) ;
insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (1, 2) ;

----Rule for Summary Table updation action

insert into record_configs_rules(rule_id, record_config_id) values(103, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(103, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(103, 103) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(103, '251.25', '2', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(103, 103, 103, null) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(105, '8' , '251.135.16.2',1025, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(105, 103, 105, null) ;

insert into record_configs_rules(rule_id, record_config_id) values(104, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values (104, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(104, 104) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(106, '251.25', '2', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(106, 104, 106, null) ;


insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(107, '251.135.16.2', '1970/01/01 00:00:00', 1024, 16);

insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(107, 104, 107, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(108, '8' , '251.135.16.2',1025, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(108, 104, 108, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(109, '251.135.16.4','1970/10/01 00:00:00',1024, 17);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(109, 104, 109, null) ;


insert into record_configs_rules(rule_id, record_config_id) values(105, 1) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(105, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(105, 105) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(110, '251.25', '2', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(110, 105, 110, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(112, '8', '251.135.16.4',1025, 5);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(112, 105, 112, null) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(113, '8', '1970/10/01 00:00:00', 1024, 17);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(113, 105, 113, null) ;



insert into record_configs_rules(rule_id, record_config_id) values (108, 1) ;


--------------------------- Global Exception Rule --------------------

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Global Exception')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'22','+%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null,' ',1) ;


insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Global Exception'), 1) ;





-- Update Total Calls For Subscriber ----


insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Update Total Calls For Subscriber')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'251.43','2', 1024, 4);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null,' ',1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Update Total Calls For Subscriber'), 1) ;

------Rule to Reject Blacklisted/Disconnected Subscribers

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'251.31','3,0', 1030,8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,null,1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Rejecting Blacklist/Disconnected Subscriber'), 1) ;
------------------
------------------ Coloring Rules for ASN Record Views for 'radmin'----------------------------------------------------

exec InsertColoringRule('Fraud Subscriber Call', 'radmin', '#FFF05F', '1', '32', 101, '') ;
exec InsertColoringRule('Fraud Subscriber Call', 'default', '#FFF05F', '1', '32', 101, '') ;
exec InsertColoringRule('Fraud Subscriber Call', 'nadmin', '#FFF05F', '1', '32', 101, '') ;
exec InsertColoringRule('Non Fraud Subscriber Call', 'radmin', '#CCCCFF', '0', '32', 101, '') ;
exec InsertColoringRule('Non Fraud Subscriber Call', 'default', '#CCCCFF', '0', '32', 101, '') ;
exec InsertColoringRule('Non Fraud Subscriber Call', 'nadmin', '#CCCCFF', '0', '32', 101, '') ;


commit ;

