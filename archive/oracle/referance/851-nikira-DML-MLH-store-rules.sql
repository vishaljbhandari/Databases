spool nikira-DML-MLH-store-rules.log
set feedback off ;
set serveroutput off ;

drop sequence s_rule_seq ;
drop sequence s_exp_seq ;
drop sequence s_fil_seq ;
drop sequence s_fil_tok_seq ;
create sequence s_rule_seq increment by 1 start with 150 nomaxvalue nominvalue nocycle order ;
create sequence s_exp_seq increment by 1 start with 280 nomaxvalue nominvalue nocycle order ;
create sequence s_fil_seq increment by 1 start with 280 nomaxvalue nominvalue nocycle order ;
create sequence s_fil_tok_seq increment by 1 start with 280 nomaxvalue nominvalue nocycle order ;

declare
rule_seq_id	INTEGER ;
begin
--- MLH
--copy account.root.previous active accountid from database into the account's root datarecord
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy previous ActiveList Root A/c ID to root a/c', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '30.26.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 108, 110, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 12) ;


--copy account.root.previous blacklist accountid from database into the account's root datarecord
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy previous BlackList Root A/c ID to root a/c', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '30.27.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 109, 110, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 13) ;


--copy account.root.id to account.root.hierarchyid

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy account.root.id to account.root.hierarchyid', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 110, 111, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 14) ;

--insert root account if root.previous active accountID = 0 and root.previous blacklist accountID = 0

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Add Root Account For Hierarchy', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '30.26.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '30.27.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '30.1', ' ', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 11) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 30, 0, 12) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 15) ;

--copy parents ActiveList id to id of accounts parent data record
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy parent.activelist.id to parent.id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.26.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 100, 105, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 20) ;

--copy parents BlackList id to id of accounts parent data record
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy parent.blacklist.id to parent.id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.27.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 101, 105, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 21) ;

--copy parents ActiveList  parent_id to parent_id of accounts parent data record
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy parent ID from enchiched AL of parent to parent ID of parent', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.26.30', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 106, 107, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 22) ;

--copy parents BlackList  parent_id to parent_id of accounts parent data record

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy parent ID from enchiched BL of parent to parent ID of parent', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;
	
insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.27.30', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 112, 107, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 23) ;

--copy root.id to parent.parent_id if parent.parent_id = 0
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy root.id to parent.parent_id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.30', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.19', '30.19', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 110, 107, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 24) ;

--copy root.id to parent.heirarchy_id 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy root.id to parent.heirarchy_id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 110, 103, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 25) ;

--copy parent.heirarchy_id to account.heirarchy_id 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy parent.heirarchy_id to account.heirarchy_id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 113, 102, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 26) ;

--Reject Update Record if already present in blacklist
--Account Blacklisted as account Fraud
--Condition :
--	BlacklistAccount.AccountID != 0 AND
--  BlacklistAccount.FRD Indicator = ACCOUNT_FRAUD
--Action : Reject Record ("Account is Blacklisted. Not going for Updation") ;

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'MLH Account Blacklisted', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (s_exp_seq.nextval, '28.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) 
	values (s_exp_seq.nextval, '28.18', '2', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id,
		begin_group_ind, combining_operator, end_group_ind)
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 44) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 17) ;

insert into record_rejection_reasons values (s_rule_seq.currval, 'Account is Blacklisted. Not going for Updation') ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 28) ;

--
-- Add Parent Account
-- Condition:
--		ActiveAccount.Account = 0 and
--		BlacklistAccount.Account = 0
-- Action : Add Account
--
--
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Add Parent Account For Hierarchy', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.26.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '25.27.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '1', '30.1', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 11) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 25, 0, 12) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 29) ;


--copy parent_id from parent account
--If we are processing record for the root avoid copying of parent ID from the dummy parent record.
-- Copy Account.Parent.ID to Account.ParentID
-- Action : CopyAccountID
--
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy account.parent.id to account.parentID', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '1', '30.1', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 105, 104, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 31) ;



--copy hierarchy_id from parent account
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Copy account.parent.hierarchyID to account.hierarchyID', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 103, 102, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 32) ;

--copy ActiveList id to id of account data record
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy activelist.id to id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 58, 24, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 33) ;

--copy previous BlackList id to id of account data record
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'copy blacklist.id to id', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '28.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 20) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 61, 24, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 34) ;

--resetting hierarchy_id for the tree if we get a parent record for root
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Change Hierarchy ID', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.31', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values 
		(s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.31', '31', 1029, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values 
		(s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.30', '0', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values 
		(s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.31', '0', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) values 
		(s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;


insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 40) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 114, 102, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 35) ;

--Blacklist Information like Comments, FRD Indicator load
--Condition :
--		Action Indicator in (Cancelled or Account Cancelled)
--Action : Blacklist Info Load Action
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'MLH Blacklist Info Load Action', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '6,8', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 16) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 36) ;

-- Account Grouping Rules
-- Action : Grouping Action

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'MLH Account Grouping Rules', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '2,3,4,5,6,7,8', 1030, 9) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 19) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 0, 0, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 37) ;

--
-- Add Account
-- Condition:
--		ActiveAccount.Account = 0 and
--		BlacklistAccount.Account = 0
-- Action : Add Account
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Add Account For Hierarchy', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '28.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.19', '0', 1024, 26) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;
insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '1', ' ', 1024, 7) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, 'AND', null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 41) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 0, 0, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 38) ;

--  Close Account
--  If ActionIndicator Equal Account Cancelled 
--- Action : add to blacklist profile
--- Action : close alarms for all subscribers for this account

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Alarms for FRD Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '6', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--add blacklist profile options
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 29) ;
--close alarms when action indicator IN (Account Cancelled)
--parameter 1 for close alarm action is aggregation type
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 2, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 39) ;

--  Close Account
--  If ActionIndicator Equal Account Cancelled 
--- Action : close account based alarms for this account

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Account based Alarms for FRD Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '6', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--close alarms when action indicator IN (Account Cancelled)
--parameter 1 for close alarm action is aggregation type
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 7, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 40) ;


--  Close Hierarchy
--  If ActionIndicator Equal (Hierarchy Cancelled )
--- Action : Addto blacklist profile options, close alarms as FRD
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Alarms For Hierarchy on FRD Disconnect MLH ', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '8', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--add to blacklist profile
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 45) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 43) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 2, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 41) ;
--	


--  Close Account
--  If ActionIndicator Equal Account Disconnect 
--- Action : close alarms for all subscribers for this account

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Alarms for Normal Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '4', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--close alarms when action indicator IN (Account Disconnect)
--parameter 1 for close alarm action is aggregation type
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 2, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 42) ;

--  Close Account
--  If ActionIndicator Equal Account Disconnect 
--- Action : close account based alarms for this account

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Account based Alarms for Normal Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '4', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--close alarms when action indicator IN (Account Disconnect)
--parameter 1 for close alarm action is aggregation type
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 33) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 7, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 43) ;


--close alarms when action indicator IN (Hierarchy Disconnect)
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Alarms For Hierarchy on Normal Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '7', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 43) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 2, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 44) ;

--  Close Hierarchy
--  If ActionIndicator Equal (Hierarchy Cancelled )
--- Action : close account based alarms as FRD
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Account based Alarms For Hierarchy on FRD Disconnect MLH ', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '8', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--add to blacklist profile
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 43) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 7, 2, 200) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 45) ;
--	


--close account based  alarms when action indicator IN (Hierarchy Disconnect)
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Account based Alarms For Hierarchy on Normal Disconnect MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '7', 1024, 6) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 43) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 7, 4, 500) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 46) ;

--update account

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Update Account For Hierarchy', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '29.19', '0', 1024, 25) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
		begin_group_ind, combining_operator, end_group_ind) 
		values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 12) ;

insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3)
												values (s_rule_seq.currval, 7, 4, 0) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 47) ;

--upsert credit details 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
	values (rule_seq_id, 999, rule_seq_id, 'Upsert Credit Details', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 22) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 48) ;

-- Action : Upsert Recharge Details

select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category)
	values (rule_seq_id, 999, rule_seq_id, 'Upsert Recharge Details', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 23) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 49) ;


--  Close Account
--  If ActionIndicator in (Account Cancelled or Account Disconnected)
--- Action : Close Account 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Account MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '4,6', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--close account
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 21) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 50) ;



--  Close Hierarchy
--  If ActionIndicator in (Hierarchy Cancelled or Hierarchy Disconnected)
--- Action : Close Hierarchy 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id, 'Close Hierarchy MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '7,8', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
--close accounts
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 42) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 51) ;
--	

-- Copy Precheck Info 
--  If ActionIndicator in (Account Cancelled or Account Disconnected)
--- Action : Move Precheck Fields 
select s_rule_seq.nextval INTO rule_seq_id from dual ;
insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, is_enabled, created_time, modification_time, severity, user_id, description, processor_type, category) 
	values (rule_seq_id, 999, rule_seq_id,'Copy Precheck Info MLH', 0, 7, 0, 0, 1, sysdate, sysdate, 100, 'radmin', '', 1, 'SUBSCRIBER.STORE') ;

insert into filters (id, name, record_config_id, is_exception, network_id) values (s_fil_seq.nextval, null, 4, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (s_fil_seq.currval, s_rule_seq.currval) ;

insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (s_exp_seq.nextval, '50', '6,8', 1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
							begin_group_ind, combining_operator, end_group_ind) 
	values (s_fil_tok_seq.nextval, s_fil_seq.currval, s_exp_seq.currval, null, null, null, null) ;

insert into record_configs_rules (rule_id, record_config_id) values (s_rule_seq.currval, 4) ;
insert into actions_rules (rule_id, action_id) values (s_rule_seq.currval, 46) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, s_rule_seq.currval, 52) ;

end ;
/

commit ;

