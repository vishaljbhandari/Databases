create or replace package MigrateAlarms
as
	fHandler UTL_FILE.FILE_TYPE;
	FUNCTION GetRecordCategory(in_event_instance_id NUMBER) RETURN NUMBER ;
	FUNCTION GetFieldIDForMatchedField(in_field_id NUMBER) RETURN VARCHAR2 ;
	PROCEDURE MigratePrecheckRelatedData(in_subscriber_id NUMBER, in_phone_number IN VARCHAR2, in_alert_id IN NUMBER, in_event_instance_id IN NUMBER) ;
	procedure Migrate(log_file_location IN VARCHAR2) ;
end MigrateAlarms ;
/
show error;

create or replace package body MigrateAlarms
as
	  FUNCTION GetRecordCategory(in_event_instance_id NUMBER) RETURN NUMBER
      IS
		event_code NUMBER ;
		record_category NUMBER ;
      BEGIN
		SELECT code into event_code from event_instance@DU_NIKIRA E where id = in_event_instance_id AND event_version = (SELECT MAX(event_version) 
				from event_instance@DU_NIKIRA where E.id = id) ;
		if ((event_code = 57) or  (event_code = 58) or (event_code = 59) or (event_code =60))
		then
			record_category := 2 ;
		elsif ((event_code >= 200) and (event_code <= 300))
		then	
			record_category := 7 ;
		elsif (event_code = 16)
		then 
			record_category := 94 ; 
		else
			record_category := 1 ;
		end if ;
		return record_category ;
	exception when no_data_found then
		UTL_FILE.PUTF (fHandler,'No data found for event ID - ' || in_event_instance_id || '\n') ;
	end GetRecordCategory ;
	

		FUNCTION GetFieldIDForMatchedField(in_field_id NUMBER) RETURN VARCHAR2
		  IS
			field_id_out VARCHAR2(1024) ;
		  BEGIN
			begin
				select field_id into field_id_out from field_configs where record_config_id = 3 and database_field = (select database_field 
					from ds_field_config@DU_NIKIRA where ds_type in (2,5) and position = in_field_id + 1 );
			exception when no_data_found then
				select ASSOCIATED_FIELD into field_id_out from field_configs where record_config_id = 3 and associated_field is not null
				and position = (select position from ds_field_config@DU_NIKIRA where ds_type in (2,5) and position = in_field_id + 1) ;
			end ;
		return field_id_out ;
		END GetFieldIDForMatchedField ;


		PROCEDURE MigratePrecheckRelatedData(in_subscriber_id NUMBER, in_phone_number IN VARCHAR2, in_alert_id IN NUMBER, in_event_instance_id IN NUMBER) 
		IS
				cursor cur_matched_subscriber(in_sub_id in NUMBER, in_ph_num in VARCHAR2) IS 
								select * from matched_subscriber@DU_NIKIRA where subscriber_id = in_sub_id and sub_phone_number = in_ph_num ;

				cursor cur_matched_field(in_matched_sub_id in NUMBER) IS select * from matched_field@DU_NIKIRA where ID = in_matched_sub_id ;

				cursor cur_active_details_cursor(in_sub_id in NUMBER, in_ph_num in VARCHAR2) IS
					select matched_field, MF.match_type, field_position, field_value from matched_subscriber@DU_NIKIRA MS, matched_field@DU_NIKIRA MF,
						precheck_subscriber_field_info@DU_NIKIRA PS where MS.subscriber_id = in_sub_id
						and MS.sub_phone_number = in_ph_num and
						MF.id = MS.id and PS.subscriber_id = in_sub_id 
						and PS.field_position = (MF.matched_field + 1) ;
				
				matched_sub_row cur_matched_subscriber%ROWTYPE ;
				matched_field_row cur_matched_field%ROWTYPE ;
				current_record cur_active_details_cursor%ROWTYPE ;
				precheck_rule_key NUMBER ;
				matched_results_seq_id NUMBER ;
				field_assoc VARCHAR2(1024) ;
				Qry  varchar(2048) ;
				db_field varchar(100) ;
				v_field_id VARCHAR2(1024) ;
		BEGIN
				begin
					select rule_key into precheck_rule_key from event_rule_map where event_instance_id = in_event_instance_id ;
				exception when others then
					goto end_of_function ;
					UTL_FILE.PUTF (fHandler, substr ('Error : select precheck rule key ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
				end ;

				insert /* +append */ into matched_results(ID, rule_key, AGGREGATION_VALUE, MATCH_PERCENTAGE, DB_TYPE)
					values (matched_results_seq.nextval, precheck_rule_key, in_phone_number, 0, 1) ;
				insert /* +append */ into alert_matched_results_maps(ALERT_ID, MATCHED_RESULTS_ID) values (in_alert_id, matched_results_seq.currval) ;

				insert /* +append */ into matched_details(ID, MATCHED_RESULTS_ID, MATCHED_RECORD, FIELD_ID, FIELD_VALUE, MATCH_TYPE)
					select matched_details_seq.nextval, matched_results_seq.currval, 0, FIELD_ASSOCIATION, '', null from PRECHECK_FIELD_CONFIGS ;

				select matched_results_seq.currval into matched_results_seq_id from dual ;

				update /* +append */ matched_details set field_value = in_phone_number where MATCHED_RESULTS_ID = matched_results_seq_id
					and FIELD_ID = '12' ;
				update /* +append */ matched_details set field_value = in_subscriber_id where MATCHED_RESULTS_ID = matched_results_seq_id
					and FIELD_ID = '32' ;
				update /* +append */ matched_details set field_value = (select account_name from subscriber where
						phone_number = in_phone_number and id = in_subscriber_id and rownum <2 ) 
				where MATCHED_RESULTS_ID = matched_results_seq_id and FIELD_ID = '1' ;
				

				OPEN cur_active_details_cursor(in_subscriber_id, in_phone_number) ;
				LOOP
					FETCH cur_active_details_cursor INTO current_record ;
					EXIT WHEN cur_active_details_cursor%NOTFOUND ;

					v_field_id := GetFieldIDForMatchedField(current_record.matched_field) ;
					update /* +append */ matched_details set field_value = current_record.field_value where MATCHED_RESULTS_ID = matched_results_seq_id
						and FIELD_ID = v_field_id ;
					
				END LOOP ;
				CLOSE cur_active_details_cursor ;

				OPEN cur_matched_subscriber(in_subscriber_id, in_phone_number) ;
				LOOP
					FETCH cur_matched_subscriber INTO matched_sub_row ;
					EXIT WHEN cur_matched_subscriber%NOTFOUND ;
					insert /* +append */ into matched_results(ID, rule_key, AGGREGATION_VALUE, MATCH_PERCENTAGE, DB_TYPE)
						values (matched_results_seq.nextval, precheck_rule_key, matched_sub_row.sub_phone_number, 
								matched_sub_row.match_percent, matched_sub_row.match_type) ;
					insert /* +append */ into alert_matched_results_maps(ALERT_ID, MATCHED_RESULTS_ID) values (in_alert_id, matched_results_seq.currval) ;
					select matched_results_seq.currval into matched_results_seq_id from dual ;

					insert /* +append */ into matched_details(ID, MATCHED_RESULTS_ID, MATCHED_RECORD, FIELD_ID, FIELD_VALUE, MATCH_TYPE)
						select matched_details_seq.nextval, matched_results_seq.currval, 1, FIELD_ASSOCIATION, '', null from PRECHECK_FIELD_CONFIGS ;

					update /* +append */ matched_details set field_value = matched_sub_row.matched_sub_phone_number where 
						MATCHED_RESULTS_ID = matched_results_seq_id and FIELD_ID = '12' ;

					update /* +append */ matched_details set field_value = matched_sub_row.matched_subscriber_id where 
						MATCHED_RESULTS_ID = matched_results_seq_id and FIELD_ID = '32' ;

					if(SQL%ROWCOUNT = 0)
					then
						insert /* +append */ into matched_details(ID, MATCHED_RESULTS_ID, MATCHED_RECORD, FIELD_ID, FIELD_VALUE, MATCH_TYPE)
							values(matched_details_seq.nextval, matched_results_seq.currval, 1, 32, matched_sub_row.matched_subscriber_id, null) ;
					end  if ;

					update /* +append */ matched_details set field_value = (select account_name from subscriber where
							phone_number = matched_sub_row.matched_sub_phone_number and id = matched_sub_row.matched_subscriber_id and rownum < 2) 
					where MATCHED_RESULTS_ID = matched_results_seq_id and FIELD_ID = '1' ;

					if(SQL%ROWCOUNT = 0)
					then
						insert /* +append */ into matched_details(ID, MATCHED_RESULTS_ID, MATCHED_RECORD, FIELD_ID, FIELD_VALUE, MATCH_TYPE)
							select matched_details_seq.nextval, matched_results_seq.currval, 1, 1, account_name, null from subscriber where
							phone_number = matched_sub_row.matched_sub_phone_number and id = matched_sub_row.matched_subscriber_id and rownum < 2 ;
					end  if ;


					OPEN cur_matched_field(matched_sub_row.ID) ;
					LOOP
						FETCH cur_matched_field INTO matched_field_row ;
						EXIT WHEN cur_matched_field%NOTFOUND ;
						field_assoc := GetFieldIDForMatchedField(matched_field_row.matched_field) ;

						select database_field into db_field from ds_field_config@DU_NIKIRA where ds_type in (2,5) and position = (matched_field_row.matched_field + 1) ;
						begin

						Qry := 'update /* +append */ matched_details set FIELD_VALUE = (select ' || db_field || ' from subscriber_v where ' ||
									 ' phone_number = ''' || matched_sub_row.matched_sub_phone_number || ''' and subscriber_id = ' || 
									 matched_sub_row.matched_subscriber_id || ' and rownum < 2 ) , match_type = ' || matched_field_row.match_type || 
									' where field_id = ''' || field_assoc || ''' and MATCHED_RESULTS_ID = ' || matched_results_seq_id ;
						execute immediate Qry ;
						exception when others then
							UTL_FILE.PUTF (fHandler, substr ('Error : update matched details ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
						end ;

					END LOOP ;
					CLOSE cur_matched_field ;
				END LOOP ;
				CLOSE cur_matched_subscriber ;

				<< end_of_function >>
					UTL_FILE.PUTF (fHandler, 'After MigratePrecheckRelatedData\n') ;
		exception when others then
			UTL_FILE.PUTF (fHandler, substr ('Error : migrateprecheckdata - ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
		END MigratePrecheckRelatedData;

		procedure Migrate(log_file_location IN VARCHAR2)
		IS
			CURSOR migrate_alarms_cursor IS SELECT * FROM alarm@DU_NIKIRA A where 
				exists (select id from alert@DU_NIKIRA AL where alarm_id = A.id
						and AL.event_instance_id in (select event_instance_id from event_rule_map EM where EM.event_instance_id = AL.event_instance_id)) 
						order by A.ID ;


			CURSOR migrate_alerts_cursor(in_alarm_id in number) IS SELECT * FROM alert@DU_NIKIRA AL where alarm_id = in_alarm_id  
						and AL.event_instance_id in (select event_instance_id from event_rule_map EM where EM.event_instance_id = AL.event_instance_id) ;


			alarm_row migrate_alarms_cursor%ROWTYPE ;
			alert_row migrate_alerts_cursor%ROWTYPE ;

			rule_ids_string VARCHAR2(1000) ;
			rule_tags_string VARCHAR2(1000) ;
			fraud_types_string VARCHAR2(1000) ;

			record_category_v NUMBER ;
			record_count NUMBER(10) := 0 ;
			seq_value NUMBER(20) ;
		BEGIN
			delete from alert_cdr ;
			delete from matched_details ;
			delete from alert_matched_results_maps ;
			delete from matched_results ;
			delete from alarm_comments ;
			delete from alarm_views_fraud_types ;
			delete from alerts ;
			delete from CURRENTLY_OPENED_ALARMS ;
			delete from alarms ;
			commit ;

			fHandler := UTL_FILE.FOPEN(log_file_location, 'migrate_alarms.log', 'w') ;
			OPEN migrate_alarms_cursor ;
			LOOP
				FETCH migrate_alarms_cursor INTO alarm_row ;
				EXIT WHEN migrate_alarms_cursor%NOTFOUND ;
				record_count := record_count + 1 ;

				UTL_FILE.PUTF (fHandler,'Alarm ID - ' || alarm_row.ID || '\n') ;

				SELECT JoinManyRowsIn1(R.key) into rule_ids_string FROM rules R where name IN (select E.description from event_instance@DU_NIKIRA E,
					alert@DU_NIKIRA where alarm_id = alarm_row.ID and E.id = event_instance_id
				  and E.event_version = (select max(event_version) from event_instance@DU_NIKIRA where id=E.id )) and parent_id != 0 ;


				SELECT NVL(JoinManyRowsIn1(TAGID), ' ') into rule_tags_string
				from
				(
					select distinct (TAG_ID) TAGID FROM RULES_TAGS
								WHERE RULE_ID IN (SELECT ID
													FROM RULES
													WHERE KEY in (SELECT KEY
																	FROM (SELECT KEY,MAX(VERSION)
																	FROM RULES
																	WHERE KEY IN (SELECT EM.rule_key 
																	FROM event_instance@DU_NIKIRA E, alert@DU_NIKIRA A, EVENT_RULE_MAP EM where 
																	A.alarm_id = alarm_row.ID and E.id = A.event_instance_id
																	and EM.event_instance_id = E.id 
																	and E.event_version = 
																	(select max(event_version) from event_instance@DU_NIKIRA where id=E.id ))
																	GROUP BY KEY)) and parent_id != 0 ) 
				);

				SELECT NVL(JoinManyRowsIn1(frdTypeID), ' ') into fraud_types_string
				from
				(
					select distinct(fraud_type_id) frdTypeID FROM FRAUD_TYPES_RULES F, RULES R 
										WHERE CompareCSV(R.ID, (SELECT JoinManyRowsIn1(max(ID)) from rules where 
											  CompareCSV(key, (select JoinManyRowsIn1(key) from RULES where 
											KEY IN (select EM.rule_key FROM event_instance@DU_NIKIRA E, alert@DU_NIKIRA A, EVENT_RULE_MAP EM where 
										A.alarm_id = alarm_row.ID and E.id = A.event_instance_id and EM.event_instance_id = E.id and E.event_version =
										(select max(event_version) from event_instance@DU_NIKIRA where id=E.id ) and is_visible=1))) > 0 group by key )) > 0 
										AND R.ID = F.RULE_ID
				) ;
																
				
				begin
				insert /*+ append */ into alarms(ID, NETWORK_ID, REFERENCE_ID, CASE_ID, ALERT_COUNT, CREATED_DATE, MODIFIED_DATE, STATUS, USER_ID, OWNER_TYPE, SCORE,
				VALUE, CDR_COUNT, PENDING_TIME, REFERENCE_TYPE, REFERENCE_VALUE, IS_VISIBLE, RULE_IDS, DISPLAY_VALUE, FRAUD_TYPES, RULE_TAGS)
				values (alarm_row.ID, alarm_row.NETWORK_ID, alarm_row.SUBSCRIBER_ID, alarm_row.CASE_ID, alarm_row.ALERT_COUNT, alarm_row.CREATED_DATE, 
					alarm_row.MODIFIED_DATE, alarm_row.STATUS, alarm_row.USER_ID, decode(NVL(alarm_row.user_id,' '),' ',2,0), alarm_row.SCORE,
					alarm_row.VALUE, alarm_row.CDR_COUNT, alarm_row.PENDING_TIME, 1, alarm_row.PHONE_NUMBER, alarm_row.IS_VISIBLE, NVL(rule_ids_string,' '), ' ',
					nvl(fraud_types_string,' '), nvl(rule_tags_string,' ')) ;

				insert into alarm_comments(ID, COMMENT_DATE, USER_COMMENT, ALARM_ID, ACTION_ID, USER_ID) select alarm_comments_seq.nextval, 
						COMMENT_DATE, USER_COMMENT, ALARM_ID, ACTION_ID, USER_ID from alarm_comment@DU_NIKIRA where alarm_id = alarm_row.ID ;

				exception when others then
					UTL_FILE.PUTF (fHandler, substr ('Error : insert into alarms ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
				end ;

				insert into alarm_views_fraud_types(alarm_view_id, fraud_type_id) select alarm_id, S.id 
					from alarm_fraud_type_map@DU_NIKIRA M, fraud_type@DU_NIKIRA F, fraud_types S
					where alarm_id = alarm_row.ID and M.fraud_id = F.id and S.name = F.name; 

				OPEN migrate_alerts_cursor(alarm_row.ID) ;
				LOOP
					FETCH migrate_alerts_cursor INTO alert_row ;
					EXIT WHEN migrate_alerts_cursor%NOTFOUND ;


					insert /* +append */ into alerts(ID, ALARM_ID, EVENT_INSTANCE_ID, VALUE, CDR_COUNT, REPEAT_COUNT, CDR_TIME, CREATED_DATE, MODIFIED_DATE,
						SCORE, AGGREGATION_TYPE, AGGREGATION_VALUE, IS_SMART_PATTERN, IS_PART_OF_SMART_PATTERN, IS_VISIBLE, START_DAY, END_DAY)
					select alert_row.ID, alert_row.ALARM_ID, EM.rule_key, alert_row.VALUE, alert_row.CDR_COUNT, alert_row.REPEAT_COUNT, 
						alert_row.CDR_TIME, alert_row.CREATED_DATE, alert_row.MODIFIED_DATE,
						alert_row.SCORE, 2, alert_row.PHONE_NUMBER, alert_row.IS_SMART_PATTERN, alert_row.IS_PART_OF_SMART_PATTERN, alert_row.IS_VISIBLE, 
						alert_row.START_DAY, alert_row.END_DAY from event_rule_map EM where EM.event_instance_id = (select E.ID from event_instance@DU_NIKIRA E where E.id=
						alert_row.event_instance_id and E.event_version = (select max(event_version) from event_instance@DU_NIKIRA where id=E.id ));

					record_category_v := GetRecordCategory(alert_row.event_instance_id) ;

					insert /* +append */ into alert_cdr(ALERT_ID, CDR_ID, CDR_VALUE, RECORD_CATEGORY, OWNER_ID) select distinct ALERT_ID, CDR_ID, CDR_VALUE,
						record_category_v, alarm_row.subscriber_id from alert_cdr@DU_NIKIRA where alert_id = alert_row.ID ; 

					if (record_category_v = 94)
					then
						MigratePrecheckRelatedData(alarm_row.subscriber_id, alarm_row.phone_number, alert_row.ID, alert_row.event_instance_id) ;
					end if ;

				END LOOP ;
				CLOSE migrate_alerts_cursor ;

			if(record_count = 500)
			then	
				commit ;
				record_count := 0 ;
			end if ;

			END LOOP ;
			CLOSE migrate_alarms_cursor ;
			commit ;

			SELECT max(ID) INTO SEQ_VALUE FROM alarms ;
			seq_value := seq_value + 1 ;
			EXECUTE IMMEDIATE 'DROP SEQUENCE ALARM_ID' ;
			EXECUTE IMMEDIATE 'CREATE SEQUENCE ALARM_ID INCREMENT BY 1 START WITH ' || SEQ_VALUE || ' NOMAXVALUE NOMINVALUE NOCYCLE CACHE 20 ORDER' ;

			SELECT max(ID) INTO SEQ_VALUE FROM alerts ;
			seq_value := seq_value + 1 ;
			EXECUTE IMMEDIATE 'DROP SEQUENCE ALERT_ID' ;
			EXECUTE IMMEDIATE 'CREATE SEQUENCE ALERT_ID INCREMENT BY 1 START WITH ' || SEQ_VALUE || ' NOMAXVALUE NOMINVALUE NOCYCLE CACHE 20 ORDER' ;
			commit ;
			UTL_FILE.FCLOSE(fHandler);
		exception when others then
			UTL_FILE.PUTF (fHandler, substr ('Error Migrate : ' || sqlcode || '-' || sqlerrm, 1, 250) || '\n') ;
		END Migrate ;

end MigrateAlarms ;
/
show errors;
quit ;
