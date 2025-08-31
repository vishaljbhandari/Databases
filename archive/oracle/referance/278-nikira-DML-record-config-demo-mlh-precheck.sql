spool nikira-DML-record-config-demo-mlh-precheck.log
set feedback off ;
set serveroutput off ;

-- Account Dummy
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, 
		is_partitioned, is_cost_computation_enabled, is_spark_support)
	values(122, 'ACCOUNT', 'Account', 0, 'SUBSCRIBER_ID', 0,  ',',  '', 0, 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
	is_cell_specific, is_primary_view) values (142, 'Precheck Account View', 122, '', 'ID ASC', 1, 0, 0, 1) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Account Name', 'ACCOUNT_NAME', 0, 0, 1, 'GR', 3,'', 1, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Date of Activation', 'ACCOUNT_DOA', 0, 0, 1, 'SMM.PRECHECK', 4,'', 2, '', null, 1, 11, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Network', 'NETWORK_ID', 0, 0, (select decode(count(*),1,0,1) from networks),'', 1,'', 3, '', 10, 1, 20, null, null, null ) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'First Name', 'FIRST_NAME', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 4, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Middle Name', 'MIDDLE_NAME', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 5, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Last Name', 'LAST_NAME', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 6, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Address Line 1', 'ADDRESS_LINE_1', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 7, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Address Line 2', 'ADDRESS_LINE_2', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 8, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Address Line 3', 'ADDRESS_LINE_3', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 9, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'City', 'CITY', 0, 0, 1, 'SMM.PRECHECK GR', 3,'', 10, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Post Code', 'POST_CODE', 0, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA GR', 3,'', 11, '', null, 1, 20, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Credit Limit', 'CREDIT_LIMIT', 0, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA GR ENTITY_DATA', 2,'', 12, '', null, 1, 40, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Rate Plan', 'RATE_PLAN', 0, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE GR', 3,'', 13, '', null, 1, 256, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Parent Account ID', 'PARENT_ID', 0, 0, 1, '', 8, '', 14, '', null, 1, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Hierarchy ID', 'HIERARCHY_ID', 0, 0, 1, '', 8, '', 15, '', null, 1, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Modified Date', 'MODIFIED_DATE', 0, 0, 1, '', 4, '', 16, '', null, 1, 1, null, null, 20) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Account Type', 'ACCOUNT_TYPE', 0, 0, 1, '', 1, '', 17, '', 555, 1, 20, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'FRD Indicator', 'FRD_INDICATOR', 0, 0, 1, '', 1, '', 18, '', null, 1, 38, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Account ID', 'ID', 0, 0, 1, '', 8, '', 19, '', null, 1, 1, null, null, 6) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Groups', 'GROUPS', 0, 0, 1, 'GR', 7, '', 20, '', 516, 1, 256, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function)
	 values (field_configs_seq.nextval, 122, 'Comments', 'COMMENTS', 0, 0, 1, '', 3, '', 21, '', null, 1, 512, 10, null, 19) ;
	
insert into precheck_record_configs
(id, record_config_id, precheck_record_config_id, precheck_record_view_config_id, key_field_id, precheck_key_field_id) 
values (precheck_record_configs_seq.nextval, 4, 122, 142, 19, 19) ;

insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  2,  2) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  4,  4) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  5,  5) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  6,  6) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  7,  7) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  8,  8) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4,  9,  9) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4, 10, 10) ;
insert into precheck_field_config_map(record_config_id, field_id, precheck_field_id) values(4, 11, 11) ;


DECLARE
    network_count number(20) ;
BEGIN
	select count(*) into network_count from networks;
  FOR ranger_user IN (SELECT * FROM ranger_users)
    LOOP

		INSERT INTO rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, 
						accumulation_function, is_enabled, created_time, modification_time, severity, user_id,
						description, processor_type, category, pseudo_function_id, is_active) 
			VALUES (rules_seq.nextval, 999, rules_key_seq.nextval, 'Manual Precheck - Accounts', 0, 7, 1, 29, 1, 
			sysdate, sysdate, 100, ranger_user.name, '', 1, 'MANUAL.PRECHECK', 26, 1) ;

		INSERT INTO record_configs_rules (rule_id, record_config_id) VALUES (rules_seq.currval, 4) ;
		INSERT INTO analyst_actions_rules (rule_id, analyst_action_id) 
				(select rules_seq.currval, id from analyst_actions where category = 'RECOMMENDED_ACTION') ;
		INSERT INTO actions_rules (rule_id, action_id) VALUES (rules_seq.currval, 36) ;
		INSERT INTO rule_priority_maps (id, rule_id, priority) 
			VALUES (rule_priority_maps_seq.nextval, rules_seq.currval, 100) ;

	    INSERT INTO thresholds(id, threshold_id, aggregation_type, rule_key, rule_version, value, version, 
				duration, effective_time, effective_day, effective_week_day, changed_status) 
			VALUES (thresholds_seq.nextval, 0, 2, rules_key_seq.currval, 0, 0, 0, 0, 1, 1, 1, 0) ;
		INSERT INTO match_configurations (id, rule_id, exclude_word_length, min_match_percentage, min_match_records, restrict_participated_records)
			VALUES(match_configurations_seq.nextval, rules_seq.currval, 0, 100, 1, 50) ;

			FOR field IN (select * from field_configs where record_config_id = 160 and ds_category like '%SMM.PRECHECK%')
			LOOP
				INSERT INTO match_field_configurations(id, match_config_id, field_id, weightage, 
						is_field_checked, is_exact, is_phonetic, is_substring, is_word,	is_fuzzy,
						minimum_percentage_match, exclude_words, cross_match_fields, display_in_view) 
					VALUES(match_field_configurations_seq.nextval, match_configurations_seq.currval,
						   field.field_id, 0, 0, 0, 0, 0, 0, 0, 100, NULL, NULL, 0) ;
			END LOOP ;
		INSERT INTO user_options(id, option_id, user_id, value, is_read_only, is_enabled, role_id)
					VALUES(user_options_seq.nextval, '4.ManualPrecheckRuleID', ranger_user.name, 
							to_char(rules_seq.currval), 0, 1, ranger_user.default_role) ;
	END LOOP ;
END ;
/


insert into manual_precheck_configs (id, record_config_id, aggregation_type, aggregation_value) values (manual_precheck_configs_seq.nextval, 4, 7, 'Dummy Account Name') ;





commit ;

