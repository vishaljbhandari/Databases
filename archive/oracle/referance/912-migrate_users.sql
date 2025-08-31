create or replace package MigrateUsers
AS
	procedure Migrate(log_file_location IN VARCHAR2) ;
END MigrateUsers ;
/
show error;

create or replace package body MigrateUsers
as
procedure Migrate(log_file_location IN VARCHAR2)
IS
	cursor user_cursor is select * from ranger_user@DU_NIKIRA where id not in ('default', 'radmin') ;
	user_row user_cursor%ROWTYPE ;

	cursor colouring_rules_cursor is select * from rules where category = 'COLORING_RULES' and user_id = 'default' ;
	colouring_rule colouring_rules_cursor%ROWTYPE ;
	fHandler UTL_FILE.FILE_TYPE;
	v_days_to_expire NUMBER(10) ;
begin

	fHandler := UTL_FILE.FOPEN(log_file_location, 'user_names.txt', 'w') ;

	open user_cursor ;
	loop
		begin
		fetch user_cursor into user_row ;
		exit when user_cursor%NOTFOUND ;

		dbms_output.put_line('User -- ' || user_row.ID || '\n') ;
		UTL_FILE.PUTF (fHandler, user_row.ID || '\n') ;

		insert into ranger_users(ID, NAME, DESCRIPTION, FIRST_NAME, MIDDLE_NAME, LAST_NAME, CONTACT_NO, CONTACT_ADDRESS, EMAIL_ID, IS_LOCKED,
				IS_ACTIVE, DEFAULT_ROLE, IS_FIRST_TIME_LOGIN, LOGIN_ATTEMPTS)
		values(ranger_users_seq.nextval, user_row.ID, user_row.DESCRIPTION, user_row.FIRST_NAME, user_row.MIDDLE_NAME, user_row.LAST_NAME,
				user_row.CONTACT_NO, user_row.CONTACT_ADDRESS, user_row.EMAIL_ID, user_row.IS_LOCKED, user_row.IS_ACTIVE, 2, 1, 0) ;

		insert into RANGER_GROUPS_RANGER_USERS(RANGER_GROUP_ID, RANGER_USER_ID) values(2, ranger_users_seq.currval) ;

		insert into PASSWORDS(ID, RANGER_USER_NAME, HASHED_PASSWORD, PASSWORD_DATE, DAYS_TO_EXPIRE, IS_ACTIVE) values
			(passwords_seq.nextval, user_row.ID, '7288edd0fc3ffcbe93a0cf06e3568e28521687bc', sysdate, 
						decode(user_row.DAYS_TO_EXPIRE,365242, 36500,user_row.DAYS_TO_EXPIRE), 1) ;

		insert into NETWORKS_RANGER_USERS(RANGER_USER_ID, NETWORK_ID) values(ranger_users_seq.currval, 999) ;

		insert into user_options(id,user_id,role_id,option_id,value,is_read_only,is_enabled) select user_options_seq.nextval, 
				user_row.ID, 2 ,option_id, value, is_read_only, is_enabled from user_options where user_id = 'default' ;

		INSERT INTO rules (id, key, accumulation_field, accumulation_function, name, processor_type, severity, smart_pattern_id, aggregation_type, 
				category, created_time, is_active, is_enabled, pseudo_function_id, description, version, user_id, is_smart_pattern, modification_time, 
				parent_id) VALUES(rules_seq.nextval, rules_key_seq.nextval, 1, 16, 'Manual-Precheck_COPY_' || to_char(rules_seq.currval), 1, 100, 0, 2, 
					'MANUAL.PRECHECK', sysdate, 1, 1, 26, NULL, 0, user_row.ID, 0, sysdate, 999) ;

		update user_options set value = rules_seq.currval where option_id = 'ManualPrecheckRuleID' and user_id = user_row.ID ;

		insert into networks_rules(rule_id,network_id) values(rules_seq.currval,999) ;
		insert into record_configs_rules(rule_id,record_config_id) values(rules_seq.currval,3) ;
		insert into analyst_actions_rules(rule_id,analyst_action_id) values(rules_seq.currval,12) ;
		insert into analyst_actions_rules(rule_id,analyst_action_id) values(rules_seq.currval,11) ;
		insert into record_configs_rules(rule_id,record_config_id) values(rules_seq.currval,3) ;
		INSERT INTO rule_priority_maps (rule_id, priority, id) VALUES(rules_seq.currval, 100, rule_priority_maps_seq.nextval) ;
		INSERT INTO thresholds (start_date, end_date, changed_status, aggregation_type, effective_week_day, expiry_date, modified_date, 
				effective_time, is_active, id, rule_key, value, version, threshold_id, reference_id, effective_day, aggregation_value, duration, 
				rule_version, start_time, end_time) 
		VALUES(NULL, NULL, 0, 2, 1, NULL, sysdate, 1, 1, thresholds_seq.nextval, rules_key_seq.currval, 0.0, 0, 0, NULL, 1, NULL, 0, 0, NULL, NULL) ;
		INSERT INTO match_configurations (rule_id, is_blacklist_match, exclude_word_length, min_match_percentage, id, is_activelist_match) 
				VALUES(rules_seq.currval, 1, 3, 100, match_configurations_seq.nextval, 1) ;
		insert into match_configurations_networks(match_configuration_id,network_id) values(match_configurations_seq.currval,999) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '14', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '15', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '16', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '19', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '20', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.10', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.11', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.16', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.4', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.5', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.6', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.7', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.8', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.9', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '65', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '67', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '68', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '69', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '70', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;

		insert into actions_rules(rule_id,action_id) values(rules_seq.currval,36) ;

		INSERT INTO rules (id, key, accumulation_field, accumulation_function, name, processor_type, severity, smart_pattern_id, aggregation_type, category,
				created_time, is_active, is_enabled, pseudo_function_id, description, version, user_id, is_smart_pattern, modification_time, 
				parent_id) VALUES(rules_seq.nextval, rules_key_seq.nextval, 1, 20, 'AlarmLink-Precheck_COPY_' || rules_seq.currval, 1, 100, 0, 2, 'ALARMLINK.PRECHECK.default', sysdate, 1, 1, 
					NULL, NULL, 0, user_row.ID, 0, sysdate, 999) ;
		update user_options set value = rules_seq.currval where option_id = 'AlarmLinkPrecheckRuleID' and user_id = user_row.ID ;

		insert into networks_rules(rule_id,network_id) values(rules_seq.currval,999) ;
		insert into record_configs_rules(rule_id,record_config_id) values(rules_seq.currval,3) ;
		insert into analyst_actions_rules(rule_id,analyst_action_id) values(rules_seq.currval,12) ;
		insert into analyst_actions_rules(rule_id,analyst_action_id) values(rules_seq.currval,11) ;
		INSERT INTO rule_priority_maps (rule_id, priority, id) VALUES(rules_seq.currval, 100, rule_priority_maps_seq.nextval) ;
		INSERT INTO thresholds (start_date, end_date, changed_status, aggregation_type, effective_week_day, expiry_date, modified_date, effective_time, 
				is_active, id, rule_key, value, version, threshold_id, reference_id, effective_day, aggregation_value, duration, rule_version, 
				start_time, end_time) 
	VALUES(NULL, NULL, 0, 2, 1, NULL, sysdate, 1, 1, thresholds_seq.nextval, rules_key_seq.currval, 0.0, 0, 0, NULL, 1, NULL, 0, 0, NULL, NULL) ;
		INSERT INTO match_configurations (rule_id, is_blacklist_match, exclude_word_length, min_match_percentage, id, is_activelist_match) VALUES(rules_seq.currval, 1, 3, 10, match_configurations_seq.nextval, 1) ;
		insert into match_configurations_networks(match_configuration_id,network_id) values(match_configurations_seq.currval,999) ;

		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '14', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '15', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '16', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '19', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '20', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.10', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.11', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.16', NULL,match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.4', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.5', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.6', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.7', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.8', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '5.9', NULL, match_field_configurations_seq.nextval , 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '65', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '67', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '68', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '69', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		INSERT INTO match_field_configurations (cross_match_fields, match_config_id, is_word, display_in_view, is_phonetic, is_fuzzy, field_id, exclude_words, id, is_field_checked, is_substring, minimum_percentage_match, weightage, is_exact) VALUES(NULL, match_configurations_seq.currval, 1, 1, 1, 1, '70', NULL, match_field_configurations_seq.nextval, 1, 1, 10.0, 10, 1) ;
		insert into actions_rules(rule_id,action_id) values(rules_seq.currval,36) ;

		--colouring rules
		open colouring_rules_cursor ;
		loop
			fetch colouring_rules_cursor into colouring_rule ;
			exit when colouring_rules_cursor%NOTFOUND ;
			INSERT INTO rules (name, accumulation_field, accumulation_function, severity, processor_type, smart_pattern_id, aggregation_type, 
				category, created_time, pseudo_function_id, is_enabled, is_active, id, version, description, user_id, parent_id, key, 
				modification_time, is_smart_pattern) VALUES(colouring_rule.name, colouring_rule.accumulation_field, colouring_rule.accumulation_function, 
					colouring_rule.severity, colouring_rule.processor_type, colouring_rule.smart_pattern_id, colouring_rule.aggregation_type,
					colouring_rule.category, sysdate, colouring_rule.pseudo_function_id, colouring_rule.is_enabled, colouring_rule.is_active,
					rules_seq.nextval, 0, colouring_rule.description, user_row.ID, 999, rules_key_seq.nextval, sysdate, 0) ;
			insert into filters_rules(filter_id, rule_id) select filter_id, rules_seq.currval from filters_rules where rule_id = colouring_rule.id ;
			insert into record_configs_rules(rule_id,record_config_id) select rules_seq.currval, record_config_id from record_configs_rules 
				where rule_id = colouring_rule.id ;
			insert into rule_color_maps (back_color, rule_id, id) select back_color, rules_seq.currval, rule_color_maps_seq.nextval from
				rule_color_maps where rule_id = colouring_rule.id ;
		end loop ;
		close colouring_rules_cursor ;
		exception when others then
			dbms_output.put_line(substr ('Error : migrateusers - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
		end ;

	end loop ;
	close user_cursor ;
	commit ;
	UTL_FILE.FCLOSE(fHandler);
exception when others then
	dbms_output.put_line(substr ('Error : migrateusers - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
end Migrate;

end migrateusers ;
/
show errors;

quit ;
