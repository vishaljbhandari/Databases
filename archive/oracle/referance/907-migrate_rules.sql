create or replace package MigrateRules
as
	TYPE FilterCurType IS REF CURSOR RETURN filter@DU_NIKIRA%ROWTYPE ;
	fHandler UTL_FILE.FILE_TYPE;
	procedure MigrateThresholds(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_rule_key IN NUMBER) ;
	procedure MigrateSubscriberGroups(current_rule_id IN NUMBER, in_event_instance_id IN NUMBER, in_event_version IN NUMBER, filter_id OUT NUMBER) ;
	procedure GetFieldConfigDetails(in_filter_field IN NUMBER, in_rec_conf_id IN NUMBER, filter_field_id OUT NUMBER, filter_data_type OUT NUMBER,
			filter_field_name OUT VARCHAR2, o_translation_id OUT NUMBER) ;
	procedure MigrateSingleFilterException(current_record IN FilterCurType, in_filter_id IN NUMBER, in_is_exception IN NUMBER) ;
	procedure MigrateHotlists(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_filter_id IN NUMBER, current_rule_id IN NUMBER) ;
	procedure InsertRulesTags(current_rule_id IN NUMBER) ;
	procedure MigrateDistinctDestinations(in_event_instance_id IN NUMBER, current_rule_id IN NUMBER) ;
	procedure ServiceViolationFilter(in_filter_id IN NUMBER) ;
	procedure InvalidSubscriberFilter(in_filter_id IN NUMBER) ;
	procedure InvalidSubscriberRuleException(rule_key IN NUMBER, in_filter_id IN NUMBER) ;
	procedure MigrateNotifications(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) ;
	procedure Migrate(log_file_location IN VARCHAR2) ;
end MigrateRules ;
/
show error;

create or replace package body MigrateRules
as
	procedure MigrateThresholds(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_rule_key IN NUMBER) 
	IS
		cursor threshold_cursor(in_event_instance_id IN NUMBER, in_event_version IN NUMBER) IS
			select * from threshold@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id and EVENT_VERSION = in_event_version ;

		threshold_row threshold_cursor%ROWTYPE ;
		sub_id NUMBER(20) ;
		th_value NUMBER(20) ;
	begin
		open threshold_cursor(in_event_instance_id, in_event_version) ;
		loop
			fetch threshold_cursor into threshold_row ;
			exit when threshold_cursor%NOTFOUND ;

			begin
				if (threshold_row.PHONE_NUMBER != '0')
				then
					select id into sub_id from subscriber where phone_number = threshold_row.PHONE_NUMBER and subscriber_type = 0 and status in (1,2) ;

					insert into thresholds(ID, THRESHOLD_ID,AGGREGATION_TYPE,REFERENCE_ID,AGGREGATION_VALUE,RULE_KEY,RULE_VERSION,VALUE,VERSION,
					START_DATE,END_DATE,START_TIME,END_TIME,DURATION,EFFECTIVE_TIME,EFFECTIVE_DAY,EFFECTIVE_WEEK_DAY,IS_ACTIVE,CHANGED_STATUS,
					EXPIRY_DATE,MODIFIED_DATE)
					values (thresholds_seq.nextval, threshold_row.THRESHOLD_ID, 2, nvl(sub_id,0), threshold_row.PHONE_NUMBER, in_rule_key, 
					in_event_version, threshold_row.value, threshold_row.threshold_version,
					threshold_row.START_DATE,  threshold_row.END_DATE, threshold_row.START_TIME, threshold_row.END_TIME, threshold_row.DURATION, 
					threshold_row.EFFECTIVE_TIME, threshold_row.EFFECTIVE_DAY, threshold_row.EFFECTIVE_WEEK_DAY, threshold_row.IS_ACTIVE, 
					threshold_row.CHANGED_STATUS, threshold_row.EXPIRY_DATE, threshold_row.MODIFIED_DATE) ;
				else
					insert into thresholds(ID, THRESHOLD_ID,AGGREGATION_TYPE,REFERENCE_ID,AGGREGATION_VALUE,RULE_KEY,RULE_VERSION,VALUE,VERSION,
					START_DATE,END_DATE,START_TIME,END_TIME,DURATION,EFFECTIVE_TIME,EFFECTIVE_DAY,EFFECTIVE_WEEK_DAY,IS_ACTIVE,CHANGED_STATUS,
					EXPIRY_DATE,MODIFIED_DATE)
					values (thresholds_seq.nextval, threshold_row.THRESHOLD_ID, 2, null, null, in_rule_key, in_event_version,
					threshold_row.value, threshold_row.threshold_version,
					threshold_row.START_DATE,  threshold_row.END_DATE, threshold_row.START_TIME, threshold_row.END_TIME, threshold_row.DURATION, 
					threshold_row.EFFECTIVE_TIME, threshold_row.EFFECTIVE_DAY, threshold_row.EFFECTIVE_WEEK_DAY, threshold_row.IS_ACTIVE, 
					threshold_row.CHANGED_STATUS, threshold_row.EXPIRY_DATE, threshold_row.MODIFIED_DATE) ;
				end if ;

			exception when no_data_found then
				UTL_FILE.PUTF (fHandler, 'Phone Number - ' || threshold_row.PHONE_NUMBER || ' not found\n') ;
			end ;

		end loop ;
		close threshold_cursor ;

		-- invalid subscriber
		if (in_event_instance_id = 1)
		then
			begin
				select to_number(value)*60*60 into th_value from configuration@DU_NIKIRA where id ='Held Alarm Cleanup Interval in Hours' ;
			exception when no_data_found then
				th_value := 5*86400 ;
				UTL_FILE.PUTF (fHandler, 'in_event_instance_id - ' || in_event_instance_id || 'config entry Held Alarm Cleanup Interval in Hours\n' ) ;
			end ;

				insert into thresholds(ID, THRESHOLD_ID,AGGREGATION_TYPE,REFERENCE_ID,AGGREGATION_VALUE,RULE_KEY,RULE_VERSION,VALUE,VERSION,
				START_DATE,END_DATE,START_TIME,END_TIME,DURATION,EFFECTIVE_TIME,EFFECTIVE_DAY,EFFECTIVE_WEEK_DAY,IS_ACTIVE,CHANGED_STATUS,
				EXPIRY_DATE,MODIFIED_DATE)
				values (thresholds_seq.nextval, 0, 2, null, null, in_rule_key, in_event_version,
				th_value, 0,
				null,  null, null, null, th_value*30,
				1, 1, 0, 1, 
				0, null, sysdate) ;
		end if ;

		--velocity, service violation
		if(in_event_code = 39 or in_event_code = 42)
		then
			insert into thresholds(ID, THRESHOLD_ID,AGGREGATION_TYPE,REFERENCE_ID,AGGREGATION_VALUE,RULE_KEY,RULE_VERSION,VALUE,VERSION,
			START_DATE,END_DATE,START_TIME,END_TIME,DURATION,EFFECTIVE_TIME,EFFECTIVE_DAY,EFFECTIVE_WEEK_DAY,IS_ACTIVE,CHANGED_STATUS,
			EXPIRY_DATE,MODIFIED_DATE)
			values (thresholds_seq.nextval, 0, 2, null, null, in_rule_key, in_event_version,
			0, 0,
			null,  null, null, null, 86400,
			1, 1, 0, 1, 
			0, null, sysdate) ;
		end if ;
		
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
					(filters_seq.nextval, null, 1, 0, 999, null, 1, null) ;
				insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
					(expressions_seq.nextval, '6.22', groups_string, 1030, 8, 0) ;
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
									EVENT_INSTANCE_ID = in_event_instance_id and EVENT_VERSION = in_event_version) 
					and SG.record_config_id = 3 ; 

			if (in_event_instance_id = 1 or in_event_instance_id = 3 or in_event_instance_id = 5)
			then
				UTL_FILE.PUTF (fHandler, 'adding all groups ...\n') ;
				insert into rules_subscriber_groups(rule_id, subscriber_group_id) select current_rule_id, SG.id from subscriber_groups SG 
					where SG.record_config_id = 3 ;
			end if ;
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In MigrateSubscriberGroups in_event_instance_id - ' || in_event_instance_id || ' version - ' || in_event_version || '\n') ;
		end ;
	end MigrateSubscriberGroups ;


	procedure GetFieldConfigDetails(in_filter_field IN NUMBER, in_rec_conf_id IN NUMBER, filter_field_id OUT NUMBER, filter_data_type OUT NUMBER,
			filter_field_name OUT VARCHAR2, o_translation_id OUT NUMBER)
	IS
	begin
		begin
			select field_id, data_type, name, nvl(translation_id,0) into filter_field_id, filter_data_type, filter_field_name, o_translation_id 
				from field_configs
				where record_config_id = in_rec_conf_id and position = in_filter_field ;

		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'NO DATA FOUND  GetFieldConfigDetails in_filter_field - ' || in_filter_field || ' in_rec_conf_id - ' || in_rec_conf_id ||'\n') ;
		end ;
	end GetFieldConfigDetails ;


	procedure MigrateSingleFilterException(current_record IN FilterCurType, in_filter_id IN NUMBER, in_is_exception IN NUMBER) 
	IS
		filter_field_id NUMBER(10) ;
		filter_operator_id NUMBER(10) ;
		filter_data_type NUMBER(10) ;
		filter_field_name VARCHAR2(100) ;
		filter_operator_name VARCHAR2(50) ;
		right_field_value VARCHAR2(4000) ;
		strDescription VARCHAR2(4000) := null ;
		right_field_indicator_value NUMBER(10) ;

		nickname_id NUMBER(10) ;
		right_field_id NUMBER(10) ;
		right_field_data_type NUMBER(10) ;
		right_field_name VARCHAR2(100) ;
		filter_row FILTER@DU_NIKIRA%ROWTYPE ;
		translation_id NUMBER(10) := 0 ;

		translated_string VARCHAR2(4000) ;
	begin
		LOOP
			FETCH current_record INTO filter_row ;
			EXIT WHEN current_record%NOTFOUND ;
			strDescription := NULL ;

			GetFieldConfigDetails(filter_row.filter_field, 1,  filter_field_id, filter_data_type, filter_field_name, translation_id) ;
			
			filter_operator_id := filter_row.COMPARISION_TYPE ;

			if(filter_data_type = 3)
			then
				CASE filter_row.COMPARISION_TYPE
				WHEN 10 THEN
					right_field_value := filter_row.STRING_VALUE || '%' ;
					filter_operator_id := 0 ;
				WHEN 11 THEN
					right_field_value := filter_row.STRING_VALUE || '%' ;
					filter_operator_id := 1 ;
				WHEN 12 THEN
					right_field_value := '%' || filter_row.STRING_VALUE  ;
					filter_operator_id := 0 ;
				WHEN 13 THEN
					right_field_value := '%' || filter_row.STRING_VALUE ;
					filter_operator_id := 1 ;
				ELSE
					UTL_FILE.PUTF (fHandler, 'filter_data_type - ' || filter_data_type || ' COMPARISION_TYPE - ' || filter_row.COMPARISION_TYPE || '\n') ;
				END CASE ;
			end if ;

			IF in_is_exception = 1 THEN
				CASE filter_operator_id
					WHEN 0 THEN
						filter_operator_id := 1 ;
					WHEN 1 THEN
						filter_operator_id := 0 ;
					WHEN 2 THEN
						filter_operator_id := 5 ;
					WHEN 5 THEN
						filter_operator_id := 2 ;
					WHEN 3 THEN
						filter_operator_id := 4 ;
					WHEN 4 THEN
						filter_operator_id := 3 ;
					WHEN 6 THEN
						filter_operator_id := 7 ;
					WHEN 7 THEN
						filter_operator_id := 6 ;
					WHEN 8 THEN
						filter_operator_id := 9 ;
					WHEN 9 THEN
						filter_operator_id := 8 ;
				END CASE ;
			END IF ;
			

			begin
				select operator into filter_operator_name from operators where ID = filter_operator_id ;
			exception when no_data_found then
				UTL_FILE.PUTF (fHandler, 'operator ID ' || filter_operator_id || ' not found \n') ;
			end ;
			
			if (nvl(filter_row.table_id,0) = 0)
			then
				if (filter_operator_id = 8 or filter_operator_id = 9)
				then
					if(filter_row.filter_field = 3 or filter_row.filter_field = 4 or filter_row.filter_field = 5 or filter_row.filter_field = 22)
					then
					   BEGIN
							select id into nickname_id from list_configs
								where list_configs.name = filter_row.STRING_VALUE ;
							insert into list_configs(ID, NAME, LIST_TYPE, DATA_TYPE, DESCRIPTION, FIELD_CATEGORY_ID, CATEGORY)
								values(list_configs_seq.nextval, null, 1, 3, null, 2, null) ;
							insert into list_details(ID, LIST_CONFIG_ID, VALUE, VALUE_TYPE) 
								values (list_details_seq.nextval, list_configs_seq.currval, to_char(nickname_id), 1) ;

							select to_char(list_configs_seq.currval) into right_field_value from dual ;
							right_field_indicator_value := 1031 ;
							strDescription := 'CDR.' || filter_field_name || ' ' || filter_operator_name || ' ' || filter_row.STRING_VALUE ;
						EXCEPTION
							WHEN NO_DATA_FOUND THEN
								strDescription := 'CDR.' || filter_field_name || ' ' || filter_operator_name || ' ' || filter_row.STRING_VALUE ;
								right_field_value := filter_row.STRING_VALUE ;
								right_field_indicator_value := 1030 ;
						END ;
					else
						right_field_indicator_value := 1024 ;
						case 
						WHEN (filter_data_type = 1 or filter_data_type = 6 or filter_data_type = 8) THEN
							right_field_value := to_char(filter_row.INTEGER_VALUE) ;
						WHEN filter_data_type = 2 THEN
							right_field_value := to_char(filter_row.DOUBLE_VALUE) ;
						WHEN filter_data_type = 3 THEN
							right_field_value := filter_row.STRING_VALUE ;
						WHEN filter_data_type = 4 THEN
							right_field_value := TO_CHAR(filter_row.DATE_TIME_VALUE, 'yyyy/mm/dd hh24:mi:ss') ;
						ELSE 
							UTL_FILE.PUTF (fHandler, ' filter_data_type - ' || filter_data_type || '\n') ;
						end case ;
					end if ;
				elsif filter_row.DATE_TIME_VALUE IS NOT NULL AND filter_data_type = 4 THEN
					right_field_value := TO_CHAR(filter_row.DATE_TIME_VALUE, 'yyyy/mm/dd hh24:mi:ss') ;
					right_field_indicator_value := 1024 ;
				ELSIF filter_data_type = 3 THEN
					right_field_value := filter_row.STRING_VALUE ;
					right_field_indicator_value := 1024 ;
				ELSIF filter_row.INTEGER_VALUE >= 0  AND (filter_data_type = 1 or filter_data_type = 6 or filter_data_type = 8) THEN
						right_field_value := TO_CHAR(filter_row.INTEGER_VALUE) ;
						right_field_indicator_value := 1024 ;
				ELSIF filter_row.DOUBLE_VALUE >= 0.00 AND filter_data_type = 2 THEN
					right_field_value := TO_CHAR(filter_row.DOUBLE_VALUE) ;
					right_field_indicator_value := 1024 ;
				end if ;

				if (filter_data_type = 3 and (filter_operator_id = 0 or filter_operator_id = 1))
				then
					if(instr(right_field_value, '%') = 0)
					then
						right_field_value := right_field_value || '%' ;
					end if ;
				end if ;

				translated_string := right_field_value ;
				if translated_string is null
				then
					translated_string := '[NULL]' ;
				end if ;

				begin
					if (translation_id <> 0)
					then 
						translated_string := Utility.translator(translation_id, trim(right_field_value)) ;
					end if ;
				exception when no_data_found then
					UTL_FILE.PUTF (fHandler, ' no data found for tr_id - ' || translation_id || ' key - ' || trim(right_field_value) || '\n') ;
				end ;
				
				if(strDescription IS NULL)
				then
					strDescription := 'CDR.' || filter_field_name ||' '|| filter_operator_name ||' '|| translated_string ; 
				end if ;
			end if ;

			--CDR field
			if (filter_row.table_id = 1)
			then
				right_field_indicator_value := 1025 ;
				GetFieldConfigDetails(filter_row.value_field, 1, right_field_id, right_field_data_type, right_field_name, translation_id) ;
				right_field_value := TO_CHAR(right_field_id) ;
				strDescription := 'CDR.' || filter_field_name || ' ' || filter_operator_name || ' CDR.' || right_field_name ;
			end if ;

			--subscriber field
			if (filter_row.table_id = 2)
			then
				right_field_indicator_value := 1025 ;
				GetFieldConfigDetails(filter_row.value_field, 3, right_field_id, right_field_data_type, right_field_name, translation_id) ;
				right_field_value := '6.' || TO_CHAR(right_field_id) ;
				strDescription := 'CDR.' || filter_field_name || ' ' || filter_operator_name || ' CDR.Subscriber Info.' || right_field_name ;
			end if ;

			INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) VALUES
				(expressions_seq.nextval, filter_field_id, right_field_value, right_field_indicator_value, filter_operator_id, 0) ;

			begin
				INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID, DESCRIPTION, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND, COMBINING_OPERATOR,
						END_GROUP_IND) VALUES
					(filter_tokens_seq.nextval, in_filter_id, expressions_seq.currval, nvl(strDescription, ''), null, 0, 
						null, null, null) ; 
			exception when others then
				UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens failed 2\n') ; 
			end ;

		END LOOP ;
	 
	end MigrateSingleFilterException ;

	procedure MigrateHotlists(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, in_event_code IN NUMBER, in_filter_id IN NUMBER, current_rule_id IN NUMBER)
	IS
		hotlist_group_ids VARCHAR2(50) ;
		hotlist_string VARCHAR2(4000) ;
		strDescription VARCHAR2(4000) ;
		left_field_id VARCHAR2(20) ;
		right_field_id NUMBER(10) ;
		field_name VARCHAR2(256) ;
		groups_string VARCHAR2(4000) ;
		fc_id NUMBER(10) ;
	BEGIN
		begin
			select JoinManyRowsIn1(ID) into hotlist_group_ids from HOTLIST_GROUPS where name in (select value from event_instance_hotlist@DU_NIKIRA where 
						EVENT_INSTANCE_ID = in_event_instance_id AND EVENT_VERSION = in_event_version) ;
			select decode(in_event_code, 4, 2,
										5, 4,
										6, 3,
										7,14,
										8, 2076) INTO fc_id from dual ;
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In MigrateHotlists data not found in HOTLIST_GROUPS\n') ;
		end ;

		insert into list_configs(ID, NAME, LIST_TYPE, DATA_TYPE, DESCRIPTION, FIELD_CATEGORY_ID, CATEGORY)
			values(list_configs_seq.nextval, null, 3, 3, null, fc_id, null) ;
		select list_configs_seq.currval into right_field_id from dual ;

		insert into list_configs(ID, NAME, LIST_TYPE, DATA_TYPE, DESCRIPTION, FIELD_CATEGORY_ID, CATEGORY)
			values(list_configs_seq.nextval, null, 3, 3, null, fc_id, null) ;

		insert into list_details(ID, LIST_CONFIG_ID, VALUE, VALUE_TYPE) values 
			(list_details_seq.nextval, right_field_id, list_configs_seq.currval, 1) ;

		hotlist_string := 'SELECT value FROM suspect_values INNER JOIN hotlist_groups_suspect_values ON ' ||
			' suspect_values.id = hotlist_groups_suspect_values.suspect_value_id WHERE hotlist_groups_suspect_values.hotlist_group_id IN (' ||
			hotlist_group_ids || ') AND entity_type = ' || to_char(fc_id) || ' AND (instr(value, ''%'') > 0 OR instr(value, ''?'') > 0 OR instr(value, ''_'') > 0 ) ' ||
			' AND nvl(suspect_values.expiry_date,sysdate) >= sysdate ^ SELECT value FROM suspect_values INNER JOIN hotlist_groups_suspect_values ON suspect_values.id ' ||
			' = hotlist_groups_suspect_values.suspect_value_id  WHERE hotlist_groups_suspect_values.hotlist_group_id IN (' ||
			hotlist_group_ids || ') AND entity_type = ' || to_char(fc_id) || ' AND nvl(suspect_values.expiry_date,sysdate) >= sysdate' ;


		insert into list_details(ID, LIST_CONFIG_ID, VALUE, VALUE_TYPE) values 
			(list_details_seq.nextval, list_configs_seq.currval, hotlist_string, 5) ;


		begin
			select trim(field_association) into left_field_id from field_record_config_maps where record_config_id = 1 and field_category_id = fc_id ;

			select name into field_name from field_categories where id = fc_id ;
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In MigrateHotlists field_record_config_maps not found for FC ID ' || fc_id || ' record_config_id 1\n') ;
		end ;

		begin
			select JoinManyRowsIn1(value) into groups_string from event_instance_hotlist@DU_NIKIRA where EVENT_INSTANCE_ID = in_event_instance_id 
				AND EVENT_VERSION = in_event_version ;
			strDescription := trim(field_name) || ' In ' || trim(groups_string) ;
		exception when no_data_found then
			UTL_FILE.PUTF (fHandler, 'In MigrateHotlists data not found in event_instance_hotlist@DU_NIKIRA\n') ;
		end ;

		insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
			(expressions_seq.nextval, left_field_id, to_char(right_field_id), 1040, 8, 0) ;

		begin
			INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID, DESCRIPTION, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND, COMBINING_OPERATOR,
					END_GROUP_IND) VALUES
				(filter_tokens_seq.nextval, in_filter_id, expressions_seq.currval, nvl(strDescription, ''), null, 1, null, null, null) ; 
		exception when others then
			UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens failed 3\n') ; 
		end ;

		insert into hotlist_rules (ID, RULE_ID, ENTITY_ID, FILTER_TOKEN_ID, HOTLIST_GROUP_ID, CATEGORY)
			select hotlist_rules_seq.nextval, current_rule_id, fc_id,
			filter_tokens_seq.currval, H.ID, 'Hotlist'
			from HOTLIST_GROUPS H where H.name in (select value from event_instance_hotlist@DU_NIKIRA where 
						EVENT_INSTANCE_ID = in_event_instance_id AND EVENT_VERSION = in_event_version) ;

		insert into rules_tags(RULE_ID, TAG_ID) select current_rule_id,  id from tags where name = trim(field_name)
			and category = 'HOTLISTS' ;
	end MigrateHotlists ;

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

		--DataStream : CDR
		insert into rules_tags(RULE_ID, TAG_ID) values (current_rule_id, 14) ;
		--Rule Type  : Normal Rule
		insert into rules_tags(RULE_ID, TAG_ID) values (current_rule_id, 83) ;
	END InsertRulesTags ;

	procedure MigrateDistinctDestinations(in_event_instance_id IN NUMBER, current_rule_id IN NUMBER) 
	IS
		cursor dist_dest_cursor(in_event_instance_id IN NUMBER) IS SELECT * from distinct_destinations@DU_NIKIRA where 
					EVENT_INSTANCE_ID = in_event_instance_id and STATUS = 1 ;
		dist_dest_row dist_dest_cursor%ROWTYPE ;
		nickname_id NUMBER(20) ;
		v_value_type NUMBER(20) ;
		destString VARCHAR2(4000) ;
	BEGIN
		open dist_dest_cursor(in_event_instance_id) ;
		loop
			fetch dist_dest_cursor into dist_dest_row ;
			exit when dist_dest_cursor%NOTFOUND ;

			begin
				if(dist_dest_row.DEST_TYPE = 1)
				then
					select id into nickname_id from list_configs
						where list_configs.name = dist_dest_row.DEST_NUMBER ;
					destString := to_char(nickname_id) ;
					v_value_type := 1 ;
				else
					destString := dist_dest_row.DEST_NUMBER ;
					v_value_type := 0 ;
				end if ;
				if(dist_dest_cursor%FOUND and dist_dest_cursor%ROWCOUNT = 1)
				then
					insert into list_configs(ID, NAME, LIST_TYPE, DATA_TYPE, DESCRIPTION, FIELD_CATEGORY_ID, CATEGORY)
						values(list_configs_seq.nextval, null, 1, 3, null, 44, null) ;
					insert into list_configs_rules(rule_id, list_config_id) values (current_rule_id, list_configs_seq.currval) ;
				end if ;

				insert into list_details(ID, LIST_CONFIG_ID, VALUE, VALUE_TYPE) 
					values (list_details_seq.nextval, list_configs_seq.currval, destString, v_value_type) ;
			exception when no_data_found then
				UTL_FILE.PUTF (fHandler, 'In MigrateDistinctDestinations destination ' || dist_dest_row.DEST_NUMBER || ' not found \n') ;
			end ;
		end loop ;
		close dist_dest_cursor ;
	END MigrateDistinctDestinations ;

	procedure ServiceViolationFilter(in_filter_id IN NUMBER)
	IS
	BEGIN
		insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
			(expressions_seq.nextval, '18', '1', 1024, 6, 0) ;
		begin
			insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
				COMBINING_OPERATOR, END_GROUP_IND) values
				(filter_tokens_seq.nextval, in_filter_id, 'CDR.Is Complete Equal Yes', expressions_seq.currval, null, 1, null, null, null) ;
		exception when others then
			UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens ---- ServiceViolationFilter\n') ; 
		end ;
	END ServiceViolationFilter ;

	procedure InvalidSubscriberFilter(in_filter_id IN NUMBER) 
	IS
	BEGIN
		begin
			insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
				(expressions_seq.nextval, '6.35', '1', 1024, 6, 0) ;
			insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
				COMBINING_OPERATOR, END_GROUP_IND) values
				(filter_tokens_seq.nextval, in_filter_id, null, expressions_seq.currval, null, 1, null, null, null) ;
		exception when others then
			UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens ---- InvalidSubscriberFilter\n') ; 
		end ;
	END InvalidSubscriberFilter ;

	procedure InvalidSubscriberRuleException(rule_key IN NUMBER, in_filter_id IN NUMBER)
	IS
		value_string VARCHAR2(100) ;
	BEGIN
		insert into list_configs(ID, NAME, LIST_TYPE, DATA_TYPE, DESCRIPTION, FIELD_CATEGORY_ID, CATEGORY)
			values(list_configs_seq.nextval, null, 0, 3, null, 2, null) ;

		value_string := 'select aggregation_value from alerts where alerts.event_instance_id = ' || to_char(rule_key) ;
		insert into list_details(ID, LIST_CONFIG_ID, VALUE, VALUE_TYPE) 
			values (list_details_seq.nextval, list_configs_seq.currval, value_string, 2) ;

		insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
			(expressions_seq.nextval, '22', '1029', 1032, 8, 0) ;
		insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
			COMBINING_OPERATOR, END_GROUP_IND) values
			(filter_tokens_seq.nextval, in_filter_id, null, expressions_seq.currval, null, 1, null, null, null) ;
	exception when others then
		UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens ---- InvalidSubscriberRuleException\n') ; 
	END ;


	procedure MigrateNotifications(in_event_instance_id IN NUMBER, in_event_version IN NUMBER, current_rule_id in NUMBER) 
	IS
		address_string	VARCHAR2(256) ;
    	start_pos NUMBER(10) := 1 ;
		curr_pos NUMBER(10)  := 1;
		delimiter VARCHAR2(2) := ',' ;
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
	
	procedure Migrate(log_file_location IN VARCHAR2)
	IS
		cursor event_instance_cursor is 
		select * from EVENT_INSTANCE@DU_NIKIRA where code not in (16, 57, 58, 59, 60, 103, 43)
			and code < 200
			and id not in (12,13)
			and user_defined_event_id not in (2, 11, 300, 301, 302, 303)
			and is_smart_pattern = 0 and is_part_of_smart_pattern = 0 order by ID, EVENT_VERSION;

		filter_cursor FilterCurType ;

		event_row event_instance_cursor%ROWTYPE ;
		current_rule_id NUMBER(10) ;
		exception_count NUMBER(10) := 0 ;
		filter_id NUMBER(10) := 0 ;
		rule_key NUMBER(10) := 0 ;
	BEGIN
		fHandler := UTL_FILE.FOPEN(log_file_location, 'migrate_rules.log', 'w') ;
		if(Utility.initialize <> 'Traslator Loading Successful')
		then
			UTL_FILE.PUTF (fHandler, 'QUITTING !! - Error in loading translation \n') ;
			goto exit_on_error ;
		end if ;

		open event_instance_cursor ;
		loop
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
			(select rules_seq.nextval, 999, rule_key, event_row.DESCRIPTION, event_row.event_version, 2 , 
            (select decode (UDE.CODE,
				 			1, 1,
							61, 1,
							82, 1,
							92, 1,
							4, 1,
							5, 1,
							6, 1,
							7, 1,
							8, 1,
							90, 1,
							13, 12,
							14, 17,
							2, 12,
							3, 17,
							62, 1,
							80, 12,
							81, 17,
							75, 44,
							42, 6,
							41, 12,
							17, 17,
							39, 45,
							93, 17,
							94, 17,
							95, 12,
							96, 12)
			 	FROM USER_DEFINED_EVENT@DU_NIKIRA UDE where UDE.ID =  event_row.USER_DEFINED_EVENT_ID)	,
             (select decode (UDE.CODE,
				 			1, 2,
							61, 2,
							82, 2,
							92, 2,
							4, 2,
							5, 2,
							6, 2,
							7, 2,
							8, 2,
							90, 2,
							13, 6,
							14, 6,
							2, 1,
							3, 1,
							62, 2,
							80, 8,
							81, 9,
							75, 15,
							42, 5,
							41, 5,
							17, 14,
							39, 4,
							93, 6,
							94, 1,
							95, 6,
							96, 1)
			 	FROM USER_DEFINED_EVENT@DU_NIKIRA UDE where UDE.ID =  event_row.USER_DEFINED_EVENT_ID)	,
             (select decode (UDE.CODE,
				 			1, 6,
							61, 6,
							82, 6,
							92, 6,
							4, 6,
							5, 6,
							6, 6,
							7, 6,
							8, 6,
							90, 6,
							13, 11,
							14, 10,
							2, 2,
							3, 1,
							62, 6,
							80, 16,
							81, 17,
							75, 21,
							42, 7,
							41, 15,
							17, 8,
							39, 9,
							93, 10,
							94,1,
							95,11,
							96, 2)
			 	FROM USER_DEFINED_EVENT@DU_NIKIRA UDE where UDE.ID =  event_row.USER_DEFINED_EVENT_ID)	,
            event_row.is_enabled, event_row.TIME_STAMP, 
			event_row.MODIFICATION_TIME, event_row.SEVERITY, event_row.USER_ID, event_row.DESCRIPTION,
			(SELECT DECODE(UDE.BASE_CODE,
						   80, 2, 
						   81, 2,
						   1) FROM USER_DEFINED_EVENT@DU_NIKIRA UDE where UDE.ID =  event_row.USER_DEFINED_EVENT_ID),
			null, event_row.is_active, event_row.IS_SMART_PATTERN, event_row.is_part_of_smart_pattern from dual) ;

			select rules_seq.currval into current_rule_id from dual ;
			--record config : CDR
			insert into fraud_types_rules(RULE_ID, FRAUD_TYPE_ID) select current_rule_id, id from fraud_types where name = 'Subscription Fraud' ;
			insert into record_configs_rules (rule_id, record_config_id) values (current_rule_id, 1) ;
			insert into rule_priority_maps(ID, RULE_ID, PRIORITY) values (rule_priority_maps_seq.nextval, current_rule_id, 999999) ;
			--generate alarm action
			insert into actions_rules(rule_id, action_id) values (current_rule_id, 1) ;
			InsertRulesTags(current_rule_id) ;
			MigrateNotifications(event_row.id, event_row.event_version, current_rule_id) ;


			--Subscription fraud
			insert into analyst_actions_rules(RULE_ID, ANALYST_ACTION_ID) select current_rule_id, id from analyst_actions 
						where category = 'RECOMMENDED_ACTION' 
						and name IN (select DESCRIPTION FROM recommended_action@DU_NIKIRA RA, event_instance_action@DU_NIKIRA EA
									where RA.ID = EA.ACTION_ID AND EA.EVENT_INSTANCE_ID = event_row.id and EA.EVENT_VERSION = event_row.event_version) ;

			insert into networks_rules(RULE_ID, NETWORK_ID) values (current_rule_id, 999) ;

			MigrateThresholds(event_row.id, event_row.event_version, event_row.code, rule_key) ;
			MigrateSubscriberGroups(current_rule_id, event_row.id, event_row.event_version, filter_id) ;

			--Migrating filters
			if (filter_id = 0)
			then
				insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
					(filters_seq.nextval, null, 1, 0, 999, null, 1, null) ;
				insert into filters_rules(filter_id, rule_id) values (filters_seq.currval, current_rule_id) ;
				select filters_seq.currval into filter_id from dual ;
			end if ;

			open filter_cursor FOR 
				select * from filter@DU_NIKIRA where EVENT_INSTANCE_ID = event_row.id and EVENT_VERSION = event_row.event_version and is_exception = 0 ;
			MigrateSingleFilterException(filter_cursor, filter_id, 0) ;
			close filter_cursor ;

			if (event_row.code >= 4 and event_row.code <= 8)
			then
				MigrateHotlists(event_row.id, event_row.event_version, event_row.code, filter_id, current_rule_id) ;
			end if ;

			--GSM suspended subscriber (adding default filter subscriber.status = 2)
			if(event_row.code = 82)
			then
				insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
					(expressions_seq.nextval, '6.31', '2', 1024, 6, 0) ;
				begin
					insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
						COMBINING_OPERATOR, END_GROUP_IND) values
						(filter_tokens_seq.nextval, filter_id, null, expressions_seq.currval, null, 1, null, null, null) ;
				exception when others then
					UTL_FILE.PUTF (fHandler, 'Inserting into filter_tokens ---- 2\n') ; 
				end ;
			end if ;

			if(event_row.code = 75)
			then
				MigrateDistinctDestinations(event_row.id, current_rule_id) ;
			end if ;
			if(event_row.code = 42)
			then
				ServiceViolationFilter(filter_id) ;
			end if ;
			if(event_row.ID = 1)
			then
				InvalidSubscriberFilter(filter_id) ;
			end if ;

			--Migrating exceptions
			filter_id := 0 ;
			select count(1) into exception_count from filter@DU_NIKIRA where EVENT_INSTANCE_ID = event_row.id and 
					EVENT_VERSION = event_row.event_version and is_exception = 1 ;
			if(exception_count > 0)
			then
				insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
					(filters_seq.nextval, null, 1, 1, 999, null, 1, null) ;
				insert into filters_rules(filter_id, rule_id) values (filters_seq.currval, current_rule_id) ;
				select filters_seq.currval into filter_id from dual ;

				open filter_cursor FOR 
					select * from filter@DU_NIKIRA where EVENT_INSTANCE_ID = event_row.id and EVENT_VERSION = event_row.event_version and is_exception = 1 ;
				MigrateSingleFilterException(filter_cursor, filter_id, 1) ;
				close filter_cursor ;
			end if ;

			if(event_row.ID = 1)
			then
				if(filter_id = 0)
				then
					insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
						(filters_seq.nextval, null, 1, 1, 999, null, 1, null) ;
					insert into filters_rules(filter_id, rule_id) values (filters_seq.currval, current_rule_id) ;
					select filters_seq.currval into filter_id from dual ;
				end if ;
				InvalidSubscriberRuleException(rule_key, filter_id) ;
			end if ;

		commit ;
		end loop ;
		close event_instance_cursor ;
		<<exit_on_error>>
		UTL_FILE.PUTF (fHandler, 'MigrateRules completed \n') ;
		UTL_FILE.FCLOSE(fHandler);
	EXCEPTION
	   when others then
	  UTL_FILE.PUTF (fHandler, 'Error - ' || sqlerrm || '\n');
	END Migrate ;

end MigrateRules ;
/
show errors;
quit ;
