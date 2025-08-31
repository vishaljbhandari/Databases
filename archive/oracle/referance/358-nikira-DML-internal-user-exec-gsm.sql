spool nikira-DML-internal-user-exec-gsm.log
set feedback off ;
set serveroutput off ;

-- Expandable Field Maps entries for Internal User
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (177, 'Internal User - CDR', 83, 'PHONE_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW', 0);


insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 1, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, 12) ;

insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, '18', '1', 1024, 6);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, null) ; 
commit ;

