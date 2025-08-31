create or replace package MigrateGroupingRules
as
	fHandler UTL_FILE.FILE_TYPE;
	procedure Migrate(log_file_location IN VARCHAR2) ;
	procedure GetLeftFieldID(field_name_old IN VARCHAR2, in_category IN VARCHAR2, o_left_field OUT VARCHAR2, field_desc OUT VARCHAR2) ;
	procedure GetOperator(operator_old IN VARCHAR2, old_field IN VARCHAR2, operator_id OUT NUMBER, operator_name OUT VARCHAR2, value_field IN OUT VARCHAR2) ;
end MigrateGroupingRules ;
/
show error;

create or replace package body MigrateGroupingRules
as
	procedure GetLeftFieldID(field_name_old IN VARCHAR2, in_category IN VARCHAR2, o_left_field OUT VARCHAR2, field_desc OUT VARCHAR2)
	IS
		position_old NUMBER(20) ;
		dbfield_old VARCHAR2(100) ;
		field_name VARCHAR2(4000) ;
	BEGIN
		begin
			UTL_FILE.PUTF (fHandler, ' field - ' || field_name_old || '\n') ;
			if (field_name_old = 'Age In Network')
			then
				select to_char(field_id), name  into o_left_field, field_name from field_configs where record_config_id = 3 and name = 'Age In Network' ;
			else
				select position into position_old from ds_field_config@DU_NIKIRA where name=field_name_old and ds_type = 5 ;
				select to_char(field_id), name  into o_left_field, field_name from field_configs where record_config_id = 3 and position = position_old ;
			end if ;
			field_desc := 'Active Subscriber.' || field_name ;
		exception when no_data_found then
			begin
				select database_field into dbfield_old from ds_field_config@DU_NIKIRA where name=field_name_old and ds_type = 2 ;
				select to_char(field_id), name into o_left_field, field_name from field_configs where record_config_id = 4 and database_field = dbfield_old ;
				o_left_field := '5.' || o_left_field ;
				field_desc := 'Account Info.' || field_name ;

			exception when no_data_found then
				if in_category like '%POSTPAID%' 
				then
					select database_field into dbfield_old from ds_field_config@DU_NIKIRA where name=field_name_old and ds_type = 11 ;
					select to_char(field_id), name into o_left_field, field_name from field_configs where record_config_id = 5 and database_field = dbfield_old ;
					o_left_field := '5.14.' || o_left_field ;
					field_desc := 'Account Info.Account Credit Details.' || field_name ;
				else
					select database_field into dbfield_old from ds_field_config@DU_NIKIRA where name=field_name_old and ds_type = 12 ;
					select to_char(field_id), name into o_left_field, field_name from field_configs where record_config_id = 6 and database_field = dbfield_old ;
					o_left_field := '5.16.' || o_left_field ;
					field_desc := 'Account Info.Account Recharge Details.' || field_name ;
				end if ;
				
			end ;
		end ;
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : GetLeftFieldID - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	END GetLeftFieldID ;

	procedure GetOperator(operator_old IN VARCHAR2, old_field IN VARCHAR2, operator_id OUT NUMBER, operator_name OUT VARCHAR2, value_field IN OUT VARCHAR2) 
	IS
	BEGIN
		case operator_old
			when '.EQ.' THEN
				operator_id := 6 ;
			when '.NQ.' THEN
				operator_id := 7 ;
			when '.GT.' THEN
				operator_id := 5 ;
			when '.LT.' THEN
				operator_id := 4 ;
			when '.GE.' THEN
				operator_id := 3 ;
			when '.LE.' THEN
				operator_id := 2 ;
			when '.NQ.' THEN
				operator_id := 7 ;
			when '.BW.' THEN
				operator_id := 0 ;
				value_field := value_field || '%' ;
			when '.NB.' THEN
				operator_id := 1 ;
				value_field := value_field || '%' ;
			when '.EW.' THEN
				operator_id := 0 ;
				value_field := '%' || value_field ;
			when '.NE.' THEN
				operator_id := 1 ;
				value_field := '%' || value_field ;
			when '.CO.' THEN
				operator_id := 0 ;
				value_field := '%' || value_field || '%' ;
			when '.NC.' THEN
				operator_id := 1 ;
				value_field := '%' || value_field || '%' ;
		end case ;

		if old_field = 'Groups'
		then
			if operator_id = 6 or operator_id = 0
			then
				operator_id := 8 ;
			else
				operator_id := 9 ;
			end if ;
		end if ;
		select operator into operator_name from operators where id = operator_id ;
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : GetOperator - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	END GetOperator ;

	procedure Migrate(log_file_location IN VARCHAR2)
	IS
		cursor rule_cursor is 
			select * from RULE@DU_NIKIRA where category like 'SMM.AG.%' ;

		cursor condition_cursor(in_rule_id IN NUMBER) is 
			select * from condition@DU_NIKIRA where rule_id=in_rule_id order by serial_no ;

		condition_row condition_cursor%ROWTYPE ;
		rule_row rule_cursor%ROWTYPE ;
		left_field_id VARCHAR2(256) ;
		desc_left_field VARCHAR2(400) ;
		operator_name VARCHAR2(50) ;
		operator_id NUMBER(20) ;

		filter_id NUMBER(20) ;
		right_field VARCHAR2(256) ;
		strDescription VARCHAR2(4000) ;
		product_type NUMBER(20) ;
	BEGIN
		fHandler := UTL_FILE.FOPEN(log_file_location, 'migrate_grouping_rules.log', 'w') ;
		open rule_cursor ;
		loop
			fetch rule_cursor into rule_row ;
			exit when rule_cursor%NOTFOUND ;

			UTL_FILE.PUTF (fHandler, 'ID - ' || rule_row.ID || ' Name - ' || rule_row.name || '\n') ;

			insert into rules (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
			PSEUDO_FUNCTION_ID, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, DESCRIPTION, PROCESSOR_TYPE,
			CATEGORY, IS_ACTIVE, IS_SMART_PATTERN, SMART_PATTERN_ID) values 
			(rules_seq.nextval, 999, rules_key_seq.nextval, rule_row.name, 0, 0, 0,
				0, null, 1, sysdate, 
			sysdate, 100, 'nadmin', null,1,
			'SUBSCRIBER GROUPING RULES', 1, 0, 0) ;
			insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 3) ;
			insert into actions_rules (rule_id, action_id) values (rules_seq.currval, 
					decode(rule_row.category,'SMM.AG.POSTPAID.APP', 25,
							'SMM.AG.PREPAID.APP', 25,
							'SMM.AG.POSTPAID.OWR',26,
							'SMM.AG.PREPAID.OWR',26)) ;
			insert into networks_rules(RULE_ID, NETWORK_ID) values (rules_seq.currval, 999) ;
			insert into rules_subscriber_groups(rule_id, subscriber_group_id) select rules_seq.currval, G.ID from subscriber_groups G where
				G.key in (select group_name from rule_group_map@DU_NIKIRA where rule_id = rule_row.ID) ;

			insert into filters(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID, USER_ID, IS_ACTIVE, CATEGORY) values
				(filters_seq.nextval, null, 3, 0, 999, null, 1, null) ;
			select filters_seq.currval into filter_id from dual ;
			insert into filters_rules(filter_id, rule_id) values (filter_id, rules_seq.currval) ;

			open condition_cursor(rule_row.ID) ;
			loop
				fetch condition_cursor into condition_row ;
				exit when condition_cursor%NOTFOUND ;
				GetLeftFieldID(condition_row.field, rule_row.category, left_field_id, desc_left_field) ;
				right_field := condition_row.value ;
				GetOperator(condition_row.operator, condition_row.field, operator_id, operator_name, right_field) ;
				strDescription := desc_left_field || ' ' || operator_name || ' ' || right_field ;

				insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
					(expressions_seq.nextval, left_field_id, right_field, decode(operator_id, 8, 1030, 9, 1030, 1024), operator_id, 0) ;
				insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
						COMBINING_OPERATOR, END_GROUP_IND) values
				(filter_tokens_seq.nextval, filter_id, strDescription, expressions_seq.currval, null, 0, condition_row.BEGIN_GROUP_IND, 
					 condition_row.COMBINING_OPERATOR, condition_row.END_GROUP_IND) ;
			end loop ;
			close condition_cursor ;

			strDescription := 'Active Subscriber.Product Type Equal ' ;
			if rule_row.category like '%POSTPAID%'
			then
				product_type := 1 ;
				strDescription := strDescription || 'POSTPAID Product' ;
			else
				product_type := 2 ;
				strDescription := strDescription || 'PREPAID Product' ;
			end if ;

			insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
				(expressions_seq.nextval, 25, to_char(product_type), 1024, 6, 0) ;
			insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
					COMBINING_OPERATOR, END_GROUP_IND) values
			(filter_tokens_seq.nextval, filter_id, strDescription, expressions_seq.currval, null, 0, null, 'AND', null) ;

			insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID, PRIORITY) values
				(expressions_seq.nextval, 3, '999', 1030, 8, 0) ;
			insert into filter_tokens(ID, FILTER_ID, DESCRIPTION, EXPRESSION_ID, CONTAINED_FILTER_ID, SYSTEM_FILTER, BEGIN_GROUP_IND,
					COMBINING_OPERATOR, END_GROUP_IND) values
			(filter_tokens_seq.nextval, filter_id, null, expressions_seq.currval, null, 1, null, 'AND', null) ;
			commit ;

		end loop ;
		close rule_cursor ;
		UTL_FILE.PUTF (fHandler, 'Migrating Grouping Rules completed \n') ;
		UTL_FILE.FCLOSE(fHandler);
	exception when others then
		UTL_FILE.PUTF (fHandler, substr ('Error : Migrate - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
	END Migrate ;
end MigrateGroupingRules ;
/
show errors;
quit ;
