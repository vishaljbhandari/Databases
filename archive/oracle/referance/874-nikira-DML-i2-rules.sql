spool nikira-DML-i2-rules.log
set feedback off ;
set serveroutput off ;

----These are AlarmLink Precheck Rules Per User
INSERT INTO tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) VALUES (tasks_seq.nextval, '0,3,4', GetParentID('Server Configurations'), 'Precheck I2 Fields', '/precheck/list_i2_fields', 0, 1) ;

INSERT INTO ranger_groups_tasks(ranger_group_id, task_id)
        SELECT id,  tasks_seq.currval FROM ranger_groups WHERE name IN ( 'radmin', 'default', 'nadmin' ) ;

DECLARE
    network_count number(20) ;
BEGIN
	SELECT COUNT(*) INTO NETWORK_COUNT FROM NETWORKS;

---- Inserting default rule and match configuration entries 

	INSERT INTO PRECHECK_FIELD_CONFIG_MAP VALUES (3, 32, 39) ;

	INSERT INTO RULES (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, 
					ACCUMULATION_FUNCTION, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID,
					DESCRIPTION, PROCESSOR_TYPE, CATEGORY, IS_ACTIVE) 
				VALUES (rules_seq.nextval, 999, rules_key_seq.nextval, 'AlarmLink-Precheck-Default', 0, 2, 1, 
					29, 1, sysdate, sysdate, 100, 'radmin', 
					'Alarm Link Default Rule', 1, 'ALARMLINK.I2.ADMIN.PRECHECK', 1) ;

	if (network_count > 1) then
		INSERT INTO NETWORKS_RULES (RULE_ID, NETWORK_ID) 	(SELECT rules_seq.currval, ID FROM NETWORKS WHERE ID != 999) ;
	else 
		if (network_count = 1) then
			INSERT INTO NETWORKS_RULES (RULE_ID, NETWORK_ID) 	(SELECT rules_seq.currval, ID FROM NETWORKS WHERE ID = 999) ;
		end if ;
	end if ;
	
	INSERT INTO RECORD_CONFIGS_RULES (RULE_ID, RECORD_CONFIG_ID) VALUES (rules_seq.currval, 3) ;
	
	INSERT INTO ANALYST_ACTIONS_RULES (RULE_ID, ANALYST_ACTION_ID) 
			(SELECT rules_seq.currval, ID FROM ANALYST_ACTIONS WHERE CATEGORY = 'RECOMMENDED_ACTION') ;
	
	INSERT INTO ACTIONS_RULES (RULE_ID, ACTION_ID) VALUES (rules_seq.currval, 36) ;
	
	INSERT INTO RULE_PRIORITY_MAPS (ID, RULE_ID, PRIORITY) 
		VALUES (rule_priority_maps_seq.nextval, rules_seq.currval, 100) ;

	INSERT INTO THRESHOLDS(ID, THRESHOLD_ID, AGGREGATION_TYPE, RULE_KEY, RULE_VERSION, VALUE, VERSION, 
			DURATION, EFFECTIVE_TIME, EFFECTIVE_DAY, EFFECTIVE_WEEK_DAY, CHANGED_STATUS) 
		VALUES (thresholds_seq.nextval, 0, 2, rules_key_seq.currval, 0, 0, 0, 0, 1, 1, 1, 0) ;

   	INSERT INTO MATCH_CONFIGURATIONS (ID, RULE_ID, EXCLUDE_WORD_LENGTH, MIN_MATCH_PERCENTAGE, MIN_MATCH_RECORDS, RESTRICT_PARTICIPATED_RECORDS )
   		VALUES(match_configurations_seq.nextval, rules_seq.currval, 1, 1, 1, 100) ;

	FOR field IN (SELECT * FROM FIELD_CONFIGS WHERE RECORD_CONFIG_ID = 3 AND DS_CATEGORY LIKE '%SMM.PRECHECK%')
	LOOP
		INSERT INTO ALARMLINK_PRECHECK_FIELDS(ID, FIELD_ID, RECORD_CONFIG_ID) VALUES (ALARMLINK_PRECHECK_FIELDS_SEQ.nextval, field.field_id, 3) ;
		INSERT INTO MATCH_FIELD_CONFIGURATIONS(ID, MATCH_CONFIG_ID, FIELD_ID, WEIGHTAGE, 
				IS_FIELD_CHECKED, IS_EXACT, IS_PHONETIC, IS_SUBSTRING, IS_WORD,	IS_FUZZY,
				MINIMUM_PERCENTAGE_MATCH, EXCLUDE_WORDS, CROSS_MATCH_FIELDS, DISPLAY_IN_VIEW) 
			VALUES(match_field_configurations_seq.nextval, match_configurations_seq.currval,
				   field.field_id, 10, 1, 1, 1, 1, 1, 1, 10, NULL, NULL, 0) ;
	END LOOP ;

	INSERT INTO MATCH_FIELD_CONFIGURATIONS(ID, MATCH_CONFIG_ID, FIELD_ID, WEIGHTAGE, 
			IS_FIELD_CHECKED, IS_EXACT, IS_PHONETIC, IS_SUBSTRING, IS_WORD,	IS_FUZZY,
			MINIMUM_PERCENTAGE_MATCH, EXCLUDE_WORDS, CROSS_MATCH_FIELDS, DISPLAY_IN_VIEW) 
		VALUES(match_field_configurations_seq.nextval, match_configurations_seq.currval,
			   32, 10, 1, 1, 1, 1, 1, 1, 10, NULL, NULL, 1) ;
	
	INSERT INTO FILTERS (ID, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, IS_ACTIVE) VALUES (filters_seq.nextval, 130, 0, 999, 1) ;
	
	INSERT INTO EXPRESSIONS (ID, LEFT_FIELD, LEFT_FIELD_INDICATOR,RIGHT_FIELD ,RIGHT_FIELD_INDICATOR ,OPERATOR_ID ,PRIORITY ,IS_BETWEEN_OPERATOR) 
					VALUES (expressions_seq.nextval, 39, 1025, 1024, 1024, 5, 13, 0) ;
	INSERT INTO FILTER_TOKENS (id, FILTER_ID, DESCRIPTION, EXPRESSION_ID, SYSTEM_FILTER, COMBINING_OPERATOR ) 
					VALUES (filter_tokens_seq.nextval, filters_seq.currval, 'AlarmLinkPrecheckList', expressions_seq.currval, 0, '') ;
					
	INSERT INTO EXPRESSIONS (ID, LEFT_FIELD, LEFT_FIELD_INDICATOR,RIGHT_FIELD ,RIGHT_FIELD_INDICATOR ,OPERATOR_ID ,PRIORITY ,IS_BETWEEN_OPERATOR) 
					VALUES (expressions_seq.nextval, 20, 1025, 1024, 1024, 5, 13, 0) ;
	INSERT INTO FILTER_TOKENS (id, FILTER_ID, DESCRIPTION, EXPRESSION_ID, SYSTEM_FILTER, COMBINING_OPERATOR ) 
					VALUES (filter_tokens_seq.nextval, filters_seq.currval, 'AlarmLinkPrecheckList', expressions_seq.currval, 0, 'AND') ;
					
	INSERT INTO PRECHECK_LISTS (ID, NAME, KEY, RECORD_CONFIG_ID, FILTER_ID, VERSION, CREATED_DATE, MODIFIED_DATE, USER_ID, IS_ACTIVE, IS_ENABLED, DESCRIPTION) 
					VALUES (precheck_lists_seq.nextval, 'AlarmLinkPrecheckList', 1, 130, filters_seq.currval, 0, sysdate, sysdate, 3, 1, 1, 'AlarmLinkPrecheckList') ;
	
	INSERT INTO CONFIGURATIONS VALUES(configurations_seq.nextval, 'BITMAP_CURRENT_RUN_IDENTIFIER_1', '1', 0) ;

	INSERT INTO SCHEDULERS (ID,JOB_NAME,HOURLY,PARAMETER,CATEGORY) VALUES (SCHEDULERS_SEQ.nextval,'Bitmap Index Rebuild',0,'"1"','PRECHECK') ;

	INSERT INTO MATCH_LIST_CONFIGURATIONS (ID, MATCH_CONFIG_ID, LIST_KEY)
					VALUES (match_list_configurations_seq.nextval, match_configurations_seq.currval, (SELECT KEY FROM PRECHECK_LISTS WHERE NAME='AlarmLinkPrecheckList')) ;

---- Inserting values corresponding to alarmlink per user
  	FOR ranger_user IN (SELECT * FROM ranger_users)
    LOOP

		INSERT INTO RULES (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, 
						ACCUMULATION_FUNCTION, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID,
						DESCRIPTION, PROCESSOR_TYPE, CATEGORY, IS_ACTIVE) 
			VALUES (rules_seq.nextval, 999, rules_key_seq.nextval, 'AlarmLink-Precheck', 0, 2, 1, 
						29, 1, sysdate, sysdate, 100, ranger_user.name, 
						'', 1, 'ALARMLINK.PRECHECK.'||ranger_user.name, 1) ;
	 	if (network_count > 1) then
			INSERT INTO NETWORKS_RULES (RULE_ID, NETWORK_ID) 	(SELECT rules_seq.currval, ID FROM NETWORKS WHERE ID != 999) ;
		else 
			if (network_count = 1) then
				INSERT INTO NETWORKS_RULES (RULE_ID, NETWORK_ID) 	(SELECT rules_seq.currval, ID FROM NETWORKS WHERE ID = 999) ;
			end if ;
		end if ;
		
		INSERT INTO RECORD_CONFIGS_RULES (RULE_ID, RECORD_CONFIG_ID) VALUES (rules_seq.currval, 3) ;
		
		INSERT INTO ANALYST_ACTIONS_RULES (RULE_ID, ANALYST_ACTION_ID) 
				(SELECT rules_seq.currval, ID FROM ANALYST_ACTIONS WHERE CATEGORY = 'RECOMMENDED_ACTION') ;
		
		INSERT INTO ACTIONS_RULES (RULE_ID, ACTION_ID) VALUES (rules_seq.currval, 36) ;
		
		INSERT INTO RULE_PRIORITY_MAPS (ID, RULE_ID, PRIORITY) 
			VALUES (rule_priority_maps_seq.nextval, rules_seq.currval, 100) ;

	    INSERT INTO THRESHOLDS(ID, THRESHOLD_ID, AGGREGATION_TYPE, RULE_KEY, RULE_VERSION, VALUE, VERSION, 
				DURATION, EFFECTIVE_TIME, EFFECTIVE_DAY, EFFECTIVE_WEEK_DAY, CHANGED_STATUS) 
			VALUES (thresholds_seq.nextval, 0, 2, rules_key_seq.currval, 0, 0, 0, 0, 1, 1, 1, 0) ;
		
		INSERT INTO MATCH_CONFIGURATIONS (ID, RULE_ID, EXCLUDE_WORD_LENGTH, MIN_MATCH_PERCENTAGE, MIN_MATCH_RECORDS, RESTRICT_PARTICIPATED_RECORDS )
			VALUES(match_configurations_seq.nextval, rules_seq.currval, 1, 1, 1, 10) ;
		
		INSERT INTO MATCH_LIST_CONFIGURATIONS (ID, MATCH_CONFIG_ID, LIST_KEY)
					VALUES (match_list_configurations_seq.nextval, match_configurations_seq.currval, (SELECT KEY FROM PRECHECK_LISTS WHERE NAME='AlarmLinkPrecheckList')) ;

		FOR field IN (select * from field_configs where record_config_id = 3 and ds_category like '%SMM.PRECHECK%')
		LOOP
			INSERT INTO MATCH_FIELD_CONFIGURATIONS(ID, MATCH_CONFIG_ID, FIELD_ID, WEIGHTAGE, 
					IS_FIELD_CHECKED, IS_EXACT, IS_PHONETIC, IS_SUBSTRING, IS_WORD,	IS_FUZZY,
					MINIMUM_PERCENTAGE_MATCH, EXCLUDE_WORDS, CROSS_MATCH_FIELDS, DISPLAY_IN_VIEW) 
				VALUES(match_field_configurations_seq.nextval, match_configurations_seq.currval,
					   field.field_id, 10, 1, 1, 1, 1, 1, 1, 10, NULL, NULL, 1) ;
		END LOOP ;

		INSERT INTO USER_OPTIONS(ID, OPTION_ID, USER_ID, VALUE, IS_READ_ONLY, IS_ENABLED, ROLE_ID)
			VALUES(user_options_seq.nextval, 'AlarmLinkPrecheckRuleID', ranger_user.name, to_char(rules_seq.currval), 0, 1, ranger_user.default_role) ;

	END LOOP ;
END ;
/
commit;
