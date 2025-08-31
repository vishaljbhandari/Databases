spool nikira-DML-subscriber-store-rules-account_cancel_on_last_subscriber.log
set feedback off ;
set serveroutput off ;

-- Last Subscriber Account Cancel Action 
--  If ActionIndicator in (Subscriber Cancelled) AND
--		Subscriber.Account.Active/SuspendedSubscriber.AccountID = 0 AND
--- Action : Cancel Account

declare

	rule_seq number ;

begin

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq,'Account Cancel Action', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;
insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '170.171.32', 0, 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 3) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 51) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 63, '1', 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 2041) ;

-- Last Subscriber Account set Fraud Indicator
--  If ActionIndicator in (Subscriber Cancelled) AND
--		Subscriber.Account.Active/SuspendedSubscriber.AccountID = 0 AND
--- Action : set fraud indicator to account fraud
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq,'Set Fraud Indicator', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;
insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '170.171.32', 0, 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 3) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 51) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 65, '2', 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 2042) ;


-- Last Subscriber Account Close Alarms for Account Action
--  If ActionIndicator in (Subscriber Cancelled) AND
--		Subscriber.Account.Active/SuspendedSubscriber.AccountID = 0 AND
--- Action : Close Alarms for Account
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq,'Close Account based Alarms', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;
insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '170.171.32', 0, 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 3) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (s_rule_seq.currval, 7, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 2043) ;
end ;
/
commit ;

