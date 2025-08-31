spool nikira-DML-rule-gsm-preveasupport-exec.log
set feedback off ;
set serveroutput off ;

-------Prevea File Write Action----------------------------
insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, (select id from rules where name = 'Prevea File Write Action')) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '18', '1', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval ,null) ;

commit ;

