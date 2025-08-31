spool nikira-DML-subscriber-store-rules.log
set feedback off ;
set serveroutput off ;
-- nikira-DML-subscriber-store-rules-account_cancel_on_last_subscriber.sql  nikira-DML-subscriber-store-rules-license.sql
-- nikira-DML-subscriber-store-rules-AI.sql                                 nikira-DML-subscriber-store-rules-not-autoaccountclose.sql
-- nikira-DML-subscriber-store-rules-autoaccountclose.sql                   nikira-DML-subscriber-store-rules.sql
-- nikira-DML-subscriber-store-rules-license-autoaccountclose.sql

create sequence s_rule_seq increment by 1 start with 30 nomaxvalue nominvalue nocycle order ;
--create sequence expressions_seq increment by 1 start with 40 nomaxvalue nominvalue nocycle order ;
create sequence s_fil_seq increment by 1 start with 40 nomaxvalue nominvalue nocycle order ;
--create sequence s_fil_tok_seq increment by 1 start with 40 nomaxvalue nominvalue nocycle order ;

declare

	rule_seq number ;

begin


--Account and Phone Number Blacklisted
--Condition :
--	 BlacklistSubscriber.SubscriberID != 0 AND
--	 ActionIndicator is Cancelled
--Action : Reject Record ("Account and PhoneNumber is Blacklisted. Not going for Updation")
--
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Phone Number And Account Blacklisted', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (expressions_seq.nextval, '21.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (expressions_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
		begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 18) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 17) ;

insert into record_rejection_reasons values (rule_seq, 'Account and PhoneNumber is Blacklisted. Not going for Updation') ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 12) ;

--Account Blacklisted as account Fraud
--Condition :
--	BlacklistAccount.AccountID != 0 AND
--	ActionIndicator  is not cancelled AND
--  BlacklistAccount.FRD Indicator = ACCOUNT_FRAUD
--Action : Reject Record ("Account is Blacklisted. Not going for Updation") ;

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Account Blacklisted', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (expressions_seq.nextval, '23.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (expressions_seq.nextval, '26', '5', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
		begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (expressions_seq.nextval, '23.18', '2', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
		begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 18) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 17) ;

insert into record_rejection_reasons values (rule_seq, 'Account is Blacklisted. Not going for Updation') ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 13) ;

-- Subscriber UID was already used
--Condition :
--	Subscriber UID should exists in System already
--	And if it is matching with other Account than current record's account
--Action : Reject Record ("Subscriber UID was already used by an existing Account") ;

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Subscriber UID Reused', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id)
	values (expressions_seq.nextval, '1', '272.1', 1025, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 18) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 17) ;

insert into record_rejection_reasons values (rule_seq, 'Subscriber UID was already used by an existing Account') ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 14) ;

-- Auto Alarm Cosure for Blacklisted Subscriber UID
--Condition :
--	Action Indicator = Subscriber Cancelled
--	All Subscribers under this UID are blacklisted
--Action : Mark all active alarms on UID as FRD

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Close Subscriber UID Alarms', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id)
	values (expressions_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id)
	values (expressions_seq.nextval, '273.32', '0', 1025, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 32) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (rule_seq, 6011, 2, 200) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2036) ;


--Blacklist Information like Comments, FRD Indicator load
--Condition :
--		Action Indicator in (Cancelled or Account Cancelled)
--Action : Blacklist Info Load Action
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Blacklist Info Load Action', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '5,6', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 16) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 17) ;


-- Account Grouping Rule For Subscriber
-- Action : Grouping Action

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Account Grouping Rule For Subscriber', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
--insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 4) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 19) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 5, 0, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 18) ;

-- Subscriber Grouping Rules
-- Action : Grouping Action

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Subscriber Grouping Rules', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 19) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 0, 0, 3) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 19) ;

-- Add Account
-- Condition:
--		ActiveAccount.Account = 0 and
--		BlacklistAccount.Account = 0
-- Action : Add Account

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Add Account', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '22.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '23.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 11) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 5, 0, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 20) ;

-- Before Update Active Account Copy Account ID.
-- Condition:
--		ActiveAccount.Account != 0
-- Action : Copy AccountID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Before Update Active Account Copy Account ID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '22.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 58, 77, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 21) ;

-- Before Update Blacklist Account Copy Account ID.
-- Condition:
--		Blacklist.Account != 0
-- Action : Copy AccountID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Before Update Blacklist Account Copy Account ID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '23.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 61, 77, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 24) ;


-- Before Update Active Account Copy Hierarchy ID.
-- Condition:
--		ActiveAccount.Account != 0
-- Action : Copy AccountID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Before Update Active Account Copy Hierarchy ID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '22.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 114, 102, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 22) ;


-- Before Update Active Account Copy Parent ID.
-- Condition:
--		ActiveAccount.Account != 0
-- Action : Copy AccountID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Before Update Active Account Copy Parent ID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '22.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 115, 104, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 23) ;

-- Update Account
-- Condition:
--		ActiveAccount.Account != 0 
-- Action : Update Account

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Update Active Account', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '22.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 12) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values (rule_seq, 7, 4, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2044) ;

-- Copy Subscriber.Account.ID to Subscriber.AccountID
-- Action : CopyAccountID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Copy Subscriber.Account.ID to Subscriber.AccountID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 77, 24, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 25) ;

-- Copy Previous_Subscriber.SSID to Subscriber.SSID
-- Action : CopySSID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Copy Previous_Subscriber.SSID to Subscriber.SSID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 6015, 6010, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 25) ;

--Configured "Static Credit Limit Rules" will take priority values 1024 to 2024. Hence donot change the priority

-- Account Credit Limit Calculation
-- Condition:
--	Product Type = POSTPAID AND
--- Set Static Credit Limit Flag = 0
-- Action : Set Credit Limit Rule, Default Formula

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
	values (rule_seq, 999, rule_seq, 'Set Credit Limit Rule, Default Formula', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '25', '1', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '37', '0', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 24) ;

insert into formulas values (1, 'Default Static Credit Limit') ;
insert into formula_expressions values (formula_expressions_seq.nextval, 1, 1, '500.00', 1024, 2, 0, 0) ;
insert into rule_formula_map values (rule_formula_map_seq.nextval, rule_seq, 1) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2024) ;

-- Account Credit Limit Updation / Insert
-- Condition:
--	Product Type = POSTPAID
-- Action : Upsert Credit Details

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
	values (rule_seq, 999, rule_seq, 'Upsert Credit Details', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '25', '1', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 22) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2025) ;

-- Account Credit Limit Updation / Insert
-- Condition:
--	Product Type = Prepaid
-- Action : Upsert Recharge Details

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
	values (rule_seq, 999, rule_seq, 'Upsert Recharge Details', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '25', '2', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 23) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2026) ;

-- AutoClose Account
-- Condition:
--		ActiveSubscriber.SubscriberID != 0 AND
--		ActiveSubscriber.AccountID >= 1024 AND
--		ActiveSubscriber.AccountID != Subscriber.Account.ID AND
--		Status in (Active or Suspended)
-- Action : AutoClose Account and Close Invalid Subscriber Alarms

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Auto Close Account Action', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 5) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '54', '20.54', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '35', '20.35', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'OR', ')') ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '31', '1,2', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2027) ;

-- Condition:
--		ActiveSubscriber.Subscriber = 0 or
--		(
--		ActiveSubscriber.AccountID > 1024 and
--		ActiveSubscriber.AccountID != Subscriber.Account.AccountID
--		)
-- Action : Set Is New Subscriber Flag to the value of Action Indicator (used to identify update records to exclude from precheck)

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Set Is New Flag', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 4) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 5) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54', '54', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'OR', ')') ;

insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
					begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, ')') ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
					begin_group_ind, combining_operator, end_group_ind)
 	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, ')') ; 

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)values (rule_seq, 64, 116, 0) ;


insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2028) ;


-- Add Subscriber
-- Condition:
--		ActiveSubscriber.Subscriber = 0 or
--		(
--		ActiveSubscriber.AccountID > 1024 and
--		ActiveSubscriber.AccountID != Subscriber.Account.AccountID
--		)
-- Action : Add Subscriber

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Add Subscriber', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 5) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54', '54', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'OR', ')') ; 

insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, ')') ;  

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 41) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 0, 0, 3) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2029) ;

-- Befor Updating Subscriber Copy subscriber ID
-- Condition:
--		ActiveSubscriber.Subscriber != 0 and
--		(ActiveSubscriber.AccountID <= 1024 or
--		ActiveSubscriber.AccountID = Subscriber.AccountID)
-- Action : CopySubscriberID

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Befor Updating Subscriber Copy subscriber ID', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
							begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 2) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54', '54', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', ')') ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, null, null, null, null, ')') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 57, 16, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2030) ;




-- Update Subscriber 
-- Condition:
--		ActiveSubscriber.Subscriber != 0 and
--		(ActiveSubscriber.AccountID <= 1024 or
--		ActiveSubscriber.AccountID = Subscriber.AccountID)
-- Action : Update Subscriber 

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Update Subscriber', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
							begin_group_ind, combining_operator, end_group_ind)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 2) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'OR', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54', '54', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'AND', ')') ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, null, null, null, null, ')') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 13) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2031) ;


--Add To Blacklist Profile
--If ActionIndicator == Subscriber Cancelled
--Action Add to Blacklist profile

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Adding Sub to Blacklist Profile Options', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '5', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 28) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 32) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 2, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2032) ;

-- Copy Previous Total Calls
-- Condition:
--     ActiveSubscriber.Subscriber != 0 and
--     (ActiveSubscriber.AccountID <= 1024 or
--     ActiveSubscriber.AccountID = Subscriber.AccountID)

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
values (rule_seq, 999, rule_seq, 'Copy Previous Total Calls', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind)
   values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 2) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
                           begin_group_ind, combining_operator, end_group_ind)
   values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, '(', 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
                           begin_group_ind, combining_operator, end_group_ind)
   values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, 'OR', ')') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 56) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2030) ;

--  Close Alarms as FRD
--  If ActionIndicator = (Account Cancelled)
--- Action : Close Alarms 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
values (rule_seq, 999, rule_seq, 'Close Alarm as FRD', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '6', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 33) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 29) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 2, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2033) ;

--Close Alarm for the subscriber
--If ActionIndicator == Subscriber disconnect 

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Closing Alarm', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '3', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 32) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 2, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2034) ;



--  Close Account
--  If ActionIndicator in (Account Cancelled or Account Disconnected)
--- Action : Close Account 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Close Account', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '4,6', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 21) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2035) ;

--  Close Alarms as NFR
--  If ActionIndicator = (Account Disconnected)
--- Action : Close Alarms 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Close Alarm as NFR', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '4', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
--insert into actions_rules (rule_id, action_id) values (rule_seq, 29) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 2, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2036) ;



--  Close Account based alarms on Account disconnect
--  If ActionIndicator in (Account Disconnected)
--- Action : Close Aalarms for Account 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Close Account Based Alarms NFR', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '4', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 7, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2037) ;

--  Close Account based alarms on Account Cancelled
--  If ActionIndicator in (Account Cancelled)
--- Action : Close Aalarms for Account 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Close Account Based Alarms FRD', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '6', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 7, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2038) ;


-- Copy Precheck Info 
--  If ActionIndicator in (Subscriber Cancelled or Account Cancelled)
--- Action : Move Precheck Fields 
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq,'Copy Precheck Info', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '26', '5,6', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 38) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2039) ;



-- Dispatch Subscriber Record
--select s_rule_seq.nextval into rule_seq from dual ;
-- insert into rules (id,parent_id,key,name,version,aggregation_type,accumulation_field,accumulation_function,pseudo_function_id,is_enabled,created_time,modification_time,severity,user_id,description,processor_type,category,is_active) values (rule_seq,'999',rule_seq,'Dispatcher','0','2','0','0',null,'1', sysdate, sysdate,'1','radmin',NULL,'1','DISPATCHER.SUBSCRIBER','1');
--select s_rule_seq.nextval into rule_seq from dual ;
-- insert into rules (id,parent_id,key,name,version,aggregation_type,accumulation_field,accumulation_function,pseudo_function_id,is_enabled,created_time,modification_time,severity,user_id,description,processor_type,category,is_active) values (rule_seq,'999',rule_seq,'Dispatcher','0','2','0','0',null,'1', sysdate, sysdate,'1','radmin',NULL,'1','SYSTEM_RULES','1');
select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id,parent_id,key,name,version,aggregation_type,accumulation_field,accumulation_function,pseudo_function_id,is_enabled,created_time,modification_time,severity,user_id,description,processor_type,category,is_active) values (rule_seq, 999, rule_seq,'Dispatcher','0','2','0','0',null,'1', sysdate, sysdate,'1','radmin',NULL,'1','SUBSCRIBER.STORE','1');

-- insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2035) ;

-- insert into record_configs_rules(rule_id, record_config_id) values(rule_seq, 1) ;
-- insert into actions_rules(rule_id, action_id) values(rule_seq, 7) ;

--Offline  Account Grouping Rules
-- Action : Account Group Updation

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Offline Account Grouping Rules', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'ACCOUNTGROUPING') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 4) ;
insert into actions_rules (rule_id, action_id, priority) values (rule_seq, 19, 0) ;
insert into actions_rules (rule_id, action_id, priority) values (rule_seq, 35, 1) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 0, 0, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2045) ;

--Offline  Subscriber Grouping Rules
-- Action : Subscriber Group Updation

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Offline Subscriber Grouping Rules', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBERGROUPING') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id, priority) values (rule_seq, 19, 0) ;
insert into actions_rules (rule_id, action_id, priority) values (rule_seq, 35, 1) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 0, 0, 3) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2046) ;

--ASN Rule

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'ASN Population', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'ASN') ;
insert into filters(id, name, record_config_id, is_exception, network_id) values(s_fil_seq.nextval, null, 27, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(120,'229.22',(select value from configurations where config_key='ASN.OTHERPARTYNUMBER.GROUPS'), 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values(3108, s_fil_seq.currval, 120, null, null, null, null) ;

insert into filters(id, name, record_config_id, is_exception, network_id) values(s_fil_seq.nextval, null, 26, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(121,'228.22', (select value from configurations where config_key='ASN.OTHERPARTYNUMBER.GROUPS'), 1030, 8);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) values(3109, s_fil_seq.currval, 121, null, null, null, null) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 37) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 100) ;
insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 26) ;
insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 27) ;

-- Copy IMEI if present
-- Condition:
--		Subscriber.IMEI = '' and
--		(
--		ActiveSubscriber.Subscriber = 1 and
--		ActiveSubscriber.IMEI != ''
--		)
-- Action : Copy Existing Subscriber's IMEI

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq, 999, rule_seq, 'Copy Subscriber IMEI', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, rule_seq) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20', '', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, begin_group_ind, combining_operator, end_group_ind) 
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, combining_operator)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, 'AND') ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.20', '', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, combining_operator)
	values (FILTER_TOKENS_SEQ.nextval, s_fil_seq.currval, expressions_seq.currval, null, 'AND') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 20) ; 

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (rule_seq, 2079, 83, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 2030) ;

--Offline  Copy Previous Account Group
-- Action : Copy Field From Record

select s_rule_seq.nextval into rule_seq from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, 
modification_time, severity, user_id, description, processor_type, category)
   values (rule_seq, 999, rule_seq, 'Copy Previous Account Group', 0, 2, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (rule_seq, 3) ;
insert into actions_rules (rule_id, action_id) values (rule_seq, 58) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
                                               values (rule_seq, 22, 5, 203) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rule_seq, 16) ;

end ;
/
commit ;

