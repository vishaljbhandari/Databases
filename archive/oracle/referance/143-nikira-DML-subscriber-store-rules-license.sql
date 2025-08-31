spool nikira-DML-subscriber-store-rules-license.log
set feedback off ;
set serveroutput off ;

-----------------------------------------------------------------------
-- Decrement Subscriber Process Count
-- Condition:
--		ActiveSubscriber.Subscriber != 0 and
--		(ActiveSubscriber.AccountID <= 1024 or
--		ActiveSubscriber.AccountID = Subscriber.AccountID) and
--      Action Indicator IN (disconnect, cancelled)  and 
--      
-- Action : Decrement Subscriber Process Count 

declare

	rule_seq number ;

begin

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Decrement Subscriber Process Count', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
							begin_group_ind, combining_operator, end_group_ind)
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.35', '1024', 1024, 2) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.35', '35', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'OR', ')') ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '26', '3,4,5,6', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;


insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 59) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2030) ;

----------------------------------------------------------------------
-- Increment Subscriber Process Count
-- Condition:
--		ActiveSubscriber.Subscriber = 0 or
--		(
--		ActiveSubscriber.AccountID > 1024 and
--		ActiveSubscriber.AccountID != Subscriber.Account.AccountID
--		) or
--		(
--		ActiveSubscriber.Subscriber != 0 and 
--		ActiveSubscriber.AccountID < 1024
--		)
-- Action : Increment Subscriber Process Count

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Increment Subscriber Process Count', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.32', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.35', '1024', 1024, 5) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '20.35', '35', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', ')') ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '26', '3,4,5,6', 1030, 9) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

 ----- subscriber less subscriber record ------------
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (filter_tokens_seq.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 4) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (filter_tokens_seq.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', ')') ;

-------------------------------------------------
insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 60) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2028) ;
--------------------------------------------------------------------------------------------------------------------------------
end ;
/

commit ;

