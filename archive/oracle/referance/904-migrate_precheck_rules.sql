create or replace package MigratePrecheckRules
as
	fHandler UTL_FILE.FILE_TYPE;
	procedure MigrateThresholds(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_rule_key IN NUMBER) ;
	procedure MigrateSubscriberGroups(current_rule_id IN NUMBER, in_event_instance_id IN NUMBER, in_event_version IN NUMBER, filter_id OUT NUMBER) ;
	procedure GetFieldConfigDetails(in_field_position IN NUMBER, associated_field OUT VARCHAR2) ;
	procedure InsertRulesTags(current_rule_id IN NUMBER) ;
	procedure MigrateNotifications(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) ;
	function InsertMatchConfigurations(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) return NUMBER ;
	function GetCrossMatchString(in_cross_match_string IN VARCHAR2) return VARCHAR2 ;
	procedure InsertMatchFieldConfigurations(match_config_id IN NUMBER, in_event_instance_id IN NUMBER, in_event_version IN NUMBER, 
					current_rule_id in NUMBER) ;
	procedure Migrate(log_file_location IN VARCHAR2) ;
end MigratePrecheckRules ;
/
show error;

create or replace package body MigratePrecheckRules
as
	procedure MigrateThresholds(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_rule_key IN NUMBER) 
	IS
	begin
		insert into thresholds(ID, THRESHOLD_ID,AGGREGATION_TYPE,REFERENCE_ID,AGGREGATION_VALUE,RULE_KEY,RULE_VERSION,VALUE,VERSION,
		START_DATE,END_DATE,START_TIME,END_TIME,DURATION,EFFECTIVE_TIME,EFFECTIVE_DAY,EFFECTIVE_WEEK_DAY,IS_ACTIVE,CHANGED_STATUS,
		EXPIRY_DATE,MODIFIED_DATE)
		values (thresholds_seq.nextval, 0, 2, null, null, in_rule_key, in_event_version,
		0, 0,
		null,  null, null, null, 86400,
		1, 1, 0, 1, 
		4, null, sysdate) ;

	end MigrateThresholds ;

	procedure MigrateSubscriberGroups(current_rule_id IN NUMBER, in_event_instance_id IN NUMBER, in_event_version IN NUMBER, filter_id OUT NUMBER)
	IS
		groups_string varchar2(4000) ;
	begin
		begin
			filter_id := 0 ;
			select JoinManyRowsIn1(GROUP_ID) into groups_string
						 from event_instance_group@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and EVENT_VERSION = in_event_version ;
			if(groups_string IS NOT NULL)
			then
				insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
					(filters_seq.nextval, null, 3, 0, 999, null, 1, null) ;
				insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
					(expressions_seq.nextval, '22', groups_string, 1030, 8, 0) ;
				begin
					insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
						COMBINING_OPERATOR, END_GROUP_IND) values
						(filter_tokens_seq.nextval, filters_seq.currval, null, expressions_seq.currval, null, 1, null, null, null) ;
				exception when others then
					UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens failed\n') ; 
				end ;
				insert into filters_rules(filter_id, rule_id) values (filters_seq.currval, current_rule_id) ;
				select filters_seq.currval into filter_id from dual ;
			end if ;

			insert into rules_subscriber_groups(rule_id, subscriber_group_id) select current_rule_id, SG.id from subscriber_groups SG 
					where SG.key IN (select group_id from event_instance_group@DU_NIKIRA where 
									EVENT_INSTANCE_ID = in_event_instance_id and EVENT_VERSION = in_event_version) ; 
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In MigrateSubscriberGroups in_event_instance_id - ' || in_event_instance_id || ' version - ' || in_event_version || '\n') ;
		end ;
	end MigrateSubscriberGroups ;


	procedure GetFieldConfigDetails(in_field_position IN NUMBER, associated_field OUT VARCHAR2) 
	IS
		o_field_id  NUMBER(10) ;
	begin
		UTL_FILE.PUTF (fHandler, 'In GetFieldConfigDetails recevied value - ' || in_field_position || '\n') ;
		begin
			select associated_field, field_id into associated_field, o_field_id 
				from field_configs
				where record_config_id = 3 and position = in_field_position ;
			if associated_field is null
			then
				associated_field := to_char(o_field_id) ;
			end if ;
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In GetFieldConfigDetails in_field_position - ' || in_field_position || '\n') ;
		end ;
	end GetFieldConfigDetails ;

	procedure InsertRulesTags(current_rule_id IN NUMBER)
	IS
	BEGIN
		-- Aggregation Type : Phone number
		insert into rules_tags(RULE_ID, TAG_ID) values (current_rule_id, 1) ;
		-- Fraud Type : subscription fraud
		insert into rules_tags(RULE_ID, TAG_ID) select current_rule_id,  id from tags where 
				NAME = 'Subscription Fraud'
				AND category = 'FRAUD_TYPES' ;
		--Function 
		insert into rules_tags(RULE_ID, TAG_ID) select current_rule_id,  id from tags where 
				NAME = (select name from pseudo_functions where id = (select pseudo_function_id from rules where ID = current_rule_id)) 
				AND category = 'FUNCTIONS' ;

		--DataStream : Subscriber
		insert into rules_tags(RULE_ID, TAG_ID) values (current_rule_id, 9) ;
		--Rule Type  : Normal Rule
		insert into rules_tags(RULE_ID, TAG_ID) values (current_rule_id, 83) ;
	END InsertRulesTags ;

	procedure MigrateNotifications(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) 
	IS
		address_string	VARCHAR2(256) ;
    	start_pos NUMBER(10) := 1 ;
		curr_pos NUMBER(10)  := 1;
		delimiter VARCHAR2(2) := ',' ;
		out_chars VARCHAR2(400) ;
		email_id VARCHAR2(256) ;
		notif_pack_id NUMBER(20) ;
	BEGIN
		select ADDRESS into address_string from event_notification@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id
			and EVENT_VERSION = in_event_version ;
		address_string := ',' || address_string ;
		loop
			exit when  (curr_pos = 0) ;
		    tokenizer (start_pos, delimiter, address_string, email_id, curr_pos) ;

			begin
				select id into notif_pack_id from notification_packs where name = trim(email_id) ;
			exception when no_data_found then
				insert into notification_packs(ID, NAME, IS_ACTIVE) values (notification_packs_seq.nextval, trim(email_id), 1) ;
				insert into notification_entities(ID, NOTIFICATION_PACK_ID, NOTIFICATION_TYPE_ID, ADDRESS, START_DATE, END_DATE, START_TIME,
							END_TIME, EFFECTIVE_TIME, EFFECTIVE_DAY, EFFECTIVE_WEEK_DAY) values 
				(notification_entities_seq.nextval, notification_packs_seq.currval, 1, trim(email_id), null, null, null, null,
				 			1, 2, 127) ;
				select notification_packs_seq.currval into notif_pack_id from dual ;
			end ;
			insert into rule_notification_maps(ID, RULE_ID, RULE_GROUP, NOTIFICATION_PACK_ID) values (rule_notification_maps_seq.nextval,
					current_rule_id, null, notif_pack_id) ;
		    start_pos := curr_pos ;
   		end loop ;
	exception when no_data_found then
		UTL_FILE.PUTF (fHandler, 'No notifications configured for event ID - ' || in_event_instance_id|| '\n') ;
	END  MigrateNotifications ;

	function InsertMatchConfigurations(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) return NUMBER
	IS
		v_activelist_match NUMBER(10) ;
		v_blacklist_match NUMBER(10) ;
		v_exclude_word_length NUMBER(10) ;
		v_min_match_percentage NUMBER(10) ;

		match_config_id NUMBER(10) ;
	BEGIN
		select to_number(CONFIG_VALUE) into v_activelist_match from generic_event_config@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and
			EVENT_VERSION = in_event_version and
			CONFIG_ID = 'SL.ActiveList' ;

		select to_number(CONFIG_VALUE) into v_blacklist_match from generic_event_config@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and
			EVENT_VERSION = in_event_version and
			CONFIG_ID = 'SL.BlackList' ;

		select to_number(CONFIG_VALUE) into v_exclude_word_length from generic_event_config@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and
			EVENT_VERSION = in_event_version and
			CONFIG_ID = 'SL.ExcludeWordLength' ;

		select to_number(CONFIG_VALUE) into v_min_match_percentage from generic_event_config@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and
			EVENT_VERSION = in_event_version and
			CONFIG_ID = 'SL.MinimumMatchPercentage' ;

		insert into match_configurations(ID, RULE_ID, IS_ACTIVELIST_MATCH, IS_BLACKLIST_MATCH, EXCLUDE_WORD_LENGTH, MIN_MATCH_PERCENTAGE)
			values(match_configurations_seq.nextval, current_rule_id, v_activelist_match, v_blacklist_match, v_exclude_word_length, v_min_match_percentage) ;

		insert into MATCH_CONFIGURATIONS_NETWORKS(NETWORK_ID, MATCH_CONFIGURATION_ID) values (999, match_configurations_seq.currval) ;

		select match_configurations_seq.currval into match_config_id from dual ;
		return match_config_id ;
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : inserting match configurations ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	END InsertMatchConfigurations ;

	procedure InsertMatchFieldConfigurations(match_config_id IN NUMBER, in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) 
	IS
		cursor sub_load_conf(in_event_version IN NUMBER) IS select * from subscriber_loader_config@DU_NIKIRA
				where EVENT_VERSION = in_event_version ;

		sub_load_row sub_load_conf%ROWTYPE ;
		associated_field VARCHAR2(256) ;
		cross_match_string VARCHAR2(256) ;
		v_display_in_view NUMBER(10) ;
		v_is_checked NUMBER(10) ;
	BEGIN
		open sub_load_conf(in_event_version) ; 
		loop
			fetch sub_load_conf into sub_load_row ;
			exit when sub_load_conf%NOTFOUND ;

			GetFieldConfigDetails(sub_load_row.FIELD_ID+1, associated_field) ;

			cross_match_string := sub_load_row.CROSS_MATCH_FIELDS ;
			if sub_load_row.CROSS_MATCH_FIELDS IS NOT NULL
			then
				UTL_FILE.PUTF (fHandler, 'CROSS MATCH ---' || sub_load_row.CROSS_MATCH_FIELDS || '-\n') ;
				cross_match_string := GetCrossMatchString(sub_load_row.CROSS_MATCH_FIELDS) ;
			end if ;

			if(sub_load_row.DISPLAY_IN_VIEW > 0)
			then
				v_display_in_view := 1 ;
			else
				v_display_in_view := 0 ;
			end if ;

			v_is_checked := sub_load_row.IS_FIELD_CHECKED ;

			if ( sub_load_row.IS_EXACT = 0 and sub_load_row.IS_PHONETIC = 0 and sub_load_row.IS_SUBSTRING = 0 and sub_load_row.IS_WORD = 0)
			then
				v_is_checked := 0 ;
			end if ;

			insert into match_field_configurations(ID, MATCH_CONFIG_ID, FIELD_ID, WEIGHTAGE, IS_FIELD_CHECKED, IS_EXACT, IS_PHONETIC,
					IS_SUBSTRING, IS_WORD, IS_FUZZY, MINIMUM_PERCENTAGE_MATCH, EXCLUDE_WORDS, CROSS_MATCH_FIELDS, DISPLAY_IN_VIEW)
			values(match_field_configurations_seq.nextval, match_config_id, associated_field, sub_load_row.WEIGHTAGE, v_is_checked,
					sub_load_row.IS_EXACT, sub_load_row.IS_PHONETIC, sub_load_row.IS_SUBSTRING, sub_load_row.IS_WORD, 0, 
					sub_load_row.MINIMUM_PERCENTAGE_MATCH,
					sub_load_row.EXCLUDE_WORD, cross_match_string, v_display_in_view) ;
		end loop ;
		close sub_load_conf ;
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : inserting match field configurations ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	END InsertMatchFieldConfigurations ;

	function GetCrossMatchString(in_cross_match_string IN VARCHAR2) return VARCHAR2
	is
		address_string	VARCHAR2(256) ;
    	start_pos NUMBER(10) := 1 ;
		curr_pos NUMBER(10)  := 1;
		delimiter VARCHAR2(2) := ' ' ;
		o_cross_match_string VARCHAR2(400) ;
		delimited_string VARCHAR2(400) ;
		in_position VARCHAR2(256) ;
		associated_field VARCHAR2(256) ;
	begin
		delimited_string := ' ' || in_cross_match_string ;
		loop
			exit when  (curr_pos = 0) ;
		    tokenizer (start_pos, delimiter, delimited_string, in_position, curr_pos) ;

			GetFieldConfigDetails(to_number(in_position) + 1, associated_field) ;
			o_cross_match_string := o_cross_match_string || associated_field || ',' ;

		    start_pos := curr_pos ;
   		end loop ;

		select substr(o_cross_match_string, 1, length(o_cross_match_string) - 1) into o_cross_match_string from dual ;
		return o_cross_match_string ;
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : GetCrossMatchString -  ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	end GetCrossMatchString ;
	
	procedure Migrate(log_file_location IN VARCHAR2)
	IS
		cursor event_instance_cursor is 
		select * from EVENT_INSTANCE@DU_NIKIRA where id = 2
			and is_smart_pattern = 0 and is_part_of_smart_pattern = 0 order by ID, EVENT_VERSION;

		event_row event_instance_cursor%ROWTYPE ;
		current_rule_id NUMBER(10) ;
		exception_count NUMBER(10) := 0 ;
		filter_count NUMBER(10) := 0 ;
		filter_id NUMBER(10) := 0 ;
		rule_key NUMBER(10) := 0 ;
		r_parent_id NUMBER(10) := 0 ;
		match_config_id NUMBER(10) ;
	BEGIN
		fHandler := UTL_FILE.FOPEN(log_file_location, 'migrate_precheck_rules.log', 'w') ;

		insert into rules (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
		PSEUDO_FUNCTION_ID, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, DESCRIPTION, PROCESSOR_TYPE,
		CATEGORY, IS_ACTIVE, IS_SMART_PATTERN, SMART_PATTERN_ID)  values 
		(rules_seq.nextval, 0, rules_key_seq.nextval, 'Subscriber Precheck', 0, 2 , 1, 16, 26,
		1, sysdate, 
		sysdate, 100, 'nadmin', null, 1,
		null, 1, 0, 0) ;
		insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 3) ;
		insert into rule_priority_maps(ID, RULE_ID, PRIORITY) values (rule_priority_maps_seq.nextval, rules_seq.currval, 999999) ;
		insert into actions_rules(rule_id, action_id) values (rules_seq.currval, 1) ;
		insert into fraud_types_rules(RULE_ID, FRAUD_TYPE_ID) select rules_seq.currval, id from fraud_types where name = 'Subscription Fraud' ;

		select rules_seq.currval into current_rule_id from dual ;
		InsertRulesTags(current_rule_id) ;
		insert into analyst_actions_rules(RULE_ID, ANALYST_ACTION_ID) values(rules_seq.currval, 11) ; 
		insert into analyst_actions_rules(RULE_ID, ANALYST_ACTION_ID) values(rules_seq.currval, 12) ; 
		insert into networks_rules(RULE_ID, NETWORK_ID) values (rules_seq.currval, 999) ;

		select rules_seq.currval into r_parent_id from dual ;

		open event_instance_cursor ;
		loop
			begin
				fetch event_instance_cursor  into event_row ;
				exit when event_instance_cursor%NOTFOUND ;

				begin
					select rule_key into rule_key from EVENT_RULE_MAP where EVENT_INSTANCE_ID = event_row.ID ;
				exception when no_data_found then
					rule_key := 0 ;
				end ;

				if(rule_key = 0)
				then
					select rules_key_seq.nextval into rule_key from dual ;
					insert into EVENT_RULE_MAP(EVENT_INSTANCE_ID, RULE_KEY) VALUES (event_row.ID, rule_key) ;
				end if ;


				UTL_FILE.PUTF (fHandler, 'Migrating EventInstance ID - ' || event_row.ID || ' Version - ' || event_row.event_version || ' Name - ' || event_row.description || ' rule key - ' || rule_key || '\n') ;

				insert into rules (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
				PSEUDO_FUNCTION_ID, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, DESCRIPTION, PROCESSOR_TYPE,
				CATEGORY, IS_ACTIVE, IS_SMART_PATTERN, SMART_PATTERN_ID)  
				(select rules_seq.nextval, r_parent_id, rule_key, event_row.DESCRIPTION, event_row.event_version, 2 , 1, 16, 26,
				event_row.is_enabled, event_row.TIME_STAMP, 
				event_row.MODIFICATION_TIME, event_row.SEVERITY, event_row.USER_ID, event_row.DESCRIPTION, 1,
				null, event_row.is_active, event_row.IS_SMART_PATTERN, event_row.is_part_of_smart_pattern from dual) ;

				select rules_seq.currval into current_rule_id from dual ;
				--record config : Subscriber
				insert into record_configs_rules (rule_id, record_config_id) values (current_rule_id, 3) ;
				insert into rule_priority_maps(ID, RULE_ID, PRIORITY) values (rule_priority_maps_seq.nextval, current_rule_id, 999999) ;
				--generate alarm action
				insert into actions_rules(rule_id, action_id) values (current_rule_id, 1) ;
				InsertRulesTags(current_rule_id) ;
				MigrateNotifications(event_row.id, event_row.event_version, current_rule_id) ;


				--Subscription fraud
				insert into fraud_types_rules(RULE_ID, FRAUD_TYPE_ID) select current_rule_id, id from fraud_types where name = 'Subscription Fraud' ;

				insert into analyst_actions_rules(RULE_ID, ANALYST_ACTION_ID) select current_rule_id, id from analyst_actions 
							where category = 'RECOMMENDED_ACTION' 
							and name IN (select DESCRIPTION FROM recommended_action@DU_NIKIRA RA, event_instance_action@DU_NIKIRA EA
										where RA.ID = EA.ACTION_ID AND EA.EVENT_INSTANCE_ID = event_row.id and EA.EVENT_VERSION = event_row.event_version) ;

				insert into networks_rules(RULE_ID, NETWORK_ID) values (current_rule_id, 999) ;

				MigrateThresholds(event_row.id, event_row.event_version, event_row.code, rule_key) ;
				MigrateSubscriberGroups(current_rule_id, event_row.id, event_row.event_version, filter_id) ;


				--Inserting exceptions
				insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
					(filters_seq.nextval, null, 3, 1, 999, null, 1, null) ;
				insert into filters_rules(filter_id, rule_id) values (filters_seq.currval, current_rule_id) ;

				insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
					(expressions_seq.nextval, '42', '0', 1024, 6, 0) ;
				begin
					insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
						COMBINING_OPERATOR, END_GROUP_IND) values
						(filter_tokens_seq.nextval, filters_seq.currval, null, expressions_seq.currval, null, 1, null, null, null) ;
				exception when others then
					UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens failed\n') ; 
				end ;

				match_config_id := InsertMatchConfigurations(event_row.id, event_row.event_version, current_rule_id) ;
				InsertMatchFieldConfigurations(match_config_id, event_row.id, event_row.event_version, current_rule_id) ;

				commit ;
			EXCEPTION
			   when others then
			  UTL_FILE.PUTF (fHandler, 'Error - ' || sqlerrm || '\n');
			end ;
		end loop ;
		close event_instance_cursor ;
		<<exit_on_error>>
		UTL_FILE.PUTF (fHandler, 'MigratePrecheckRules completed\n') ;
		UTL_FILE.FCLOSE(fHandler);
	EXCEPTION
	   when others then
	  UTL_FILE.PUTF (fHandler, 'Error - ' || sqlerrm || '\n');
	END Migrate ;

end MigratePrecheckRules ;
/
show errors;
quit ;
