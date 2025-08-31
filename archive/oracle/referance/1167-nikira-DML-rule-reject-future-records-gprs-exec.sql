spool nikira-DML-rule-reject-future-records-gprs-exec.log
set feedback off ;
set serveroutput off ;

---------------------------Rule For Future Record Rejection------------------------

insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 7, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Rule For Future Record Rejection')) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'4','1 days from now', 1035, 16);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null,' ',1) ;

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Future Record Rejection'), 7) ;
commit ;

