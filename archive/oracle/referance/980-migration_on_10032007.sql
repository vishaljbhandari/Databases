SPOOL MIGRATION10032007;
DROP SEQUENCE CURRENTLY_OPENED_ALARMS_SEQ ;
DROP SEQUENCE COMPONENTS_SEQ ;
DROP SEQUENCE ACCUMULATION_FIELD_UNITS_SEQ ;
DROP TABLE CURRENTLY_OPENED_ALARMS ;
DROP TABLE COMPONENTS CASCADE CONSTRAINTS ;
DROP TABLE COMPONENTS_PSEUDO_FUNCTIONS CASCADE CONSTRAINTS ;
DROP TABLE ACCUMULATION_FIELD_UNITS CASCADE CONSTRAINTS ;

CREATE SEQUENCE COMPONENTS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE COMPONENTS (
	ID			NUMBER(20) NOT NULL,
	DESCRIPTION	VARCHAR(256) NOT NULL,
	CONSTRAINT	PK_COMPONENTS_ID PRIMARY KEY (ID)
	) ;

CREATE TABLE COMPONENTS_PSEUDO_FUNCTIONS (
	PSEUDO_FUNCTION_ID		NUMBER(20)      NOT NULL,
	COMPONENT_ID			NUMBER(20)      NOT NULL,
	CONSTRAINT FK_PSEU_FUNC_COMP_PSEU_FUNC_ID	FOREIGN KEY (PSEUDO_FUNCTION_ID) REFERENCES PSEUDO_FUNCTIONS(ID),
	CONSTRAINT FK_PSEU_FUNC_COMP_COMP_ID		FOREIGN KEY (COMPONENT_ID) REFERENCES COMPONENTS(ID) 
	) ;

CREATE SEQUENCE ACCUMULATION_FIELD_UNITS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 1NOCYCLE CACHE 20 ORDER ;
CREATE TABLE ACCUMULATION_FIELD_UNITS (
	ID						NUMBER(20) NOT NULL,
	ACCUMULATION_FIELD_ID	NUMBER(20) NOT NULL,
	UNITS					VARCHAR(125) NOT NULL,
	CONSTRAINT FK_ACC_FIELD_UNITS_ACC_FLD_ID FOREIGN KEY (ACCUMULATION_FIELD_ID) REFERENCES FIELD_CATEGORIES(ID)
	) ;
DROP SEQUENCE ANALYST_ACTIONS_SEQ ;
CREATE SEQUENCE ANALYST_ACTIONS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 200 NOCYCLE CACHE 20 ORDER ;


CREATE SEQUENCE CURRENTLY_OPENED_ALARMS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
CREATE TABLE CURRENTLY_OPENED_ALARMS
(
	ID 						NUMBER(20) NOT NULL,
	USER_ID					NUMBER(20) NOT NULL,
	ALARM_ID				NUMBER(20) NOT NULL,
	IS_READ_ONLY			NUMBER(20) NOT NULL,
	DISPLAY_NAME			VARCHAR2(128) NOT NULL,
	LINK					VARCHAR2(256) NOT NULL,
	CONSTRAINT PK_CURRENTLY_OPENED_ALARMS_ID PRIMARY KEY(ID),
	CONSTRAINT FK_CU_OP_AL_AL_ID FOREIGN KEY(ALARM_ID) REFERENCES ALARMS(ID),
	CONSTRAINT FK_CU_OP_AL_RA_US_ID FOREIGN KEY(USER_ID) REFERENCES RANGER_USERS(ID)
);	


update translations set value = 'select key as Key, name as Value from rules r where version = (select max(version) from rules where r.key = key) and parent_id != 0 and key >= 1024 and smart_pattern_id = 0 AND (category is null or category in (''SMART_PATTERN'', ''MANUAL_ALARM_RULES'')) ' where id = 69 and tr_id = 25 ; 

insert into translations(id, tr_id, key, value) values (300, 20, '63', 'Account') ;
insert into translations(id, tr_id, key, value) values (301, 20, '62', 'Subscriber') ;
insert into translations(id, tr_id, key, value) values (302, 20, '29', 'Groups') ;
insert into translations(id, tr_id, key, value) values (132, 20,'7002', 'Holiday Lists') ;
insert into translations(id, tr_id, key, value) values (133, 20,'7003', 'Schedulers') ;
insert into translations(id, tr_id, key, value) values (134, 20,'7004', 'Analyst Actions') ;
insert into translations(id, tr_id, key, value) values (135, 20,'7005', 'Case Reasons') ;
insert into translations(id, tr_id, key, value) values (136, 20,'7006', 'Fraud Types') ;
insert into translations(id, tr_id, key, value) values (137, 20,'7007', 'Non Fraud Types') ;
insert into translations(id, tr_id, key, value) values (138, 20,'7008', 'Pending Types') ;
insert into translations(id, tr_id, key, value) values (139, 20,'7009', 'Global Exceptions') ;
insert into translations(id, tr_id, key, value) values (140, 20,'7010', 'Profile Options') ;

update field_configs set format = 'YYYY/MM/DD' where record_config_id=3 and field_id=13 ;
update field_configs set format = 'YYYY/MM/DD' where record_config_id=4 and field_id=2 ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6411, 17, 'Id', 'ID',12,12,1,0,'','',40,null,0,null,0) ;
update expandable_field_maps set category = 'RECORD_VIEW' where id = 59 ;
update configurations set value = 'summary.sh,mismatchsummary.sh,mcnsummary.sh' where config_key = 'SUMMARY_SCRIPTS' ;
delete from configurations where config_key =  'LAST_PROCESSED_LIFESTYLEPROFILE_SUBLESS_ID';
delete from configurations where config_key =  'STOP_LIFESTYLEPROFILE_SUBLESS_PROCESSING' ;

insert into components (id, description) values (components_seq.nextval, 'Text Field') ;
insert into components (id, description) values (components_seq.nextval, 'Duration') ;
insert into accumulation_field_units (id, accumulation_field_id, units) values (accumulation_field_units_seq.nextval, 17, '$') ;

insert into components_pseudo_functions (pseudo_function_id, component_id) values (1, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (2, 2) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (6, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (7, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (8, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (9, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (10, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (11, 2) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (15, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (16, 2) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (17, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (21, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (22, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (23, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (24, 1) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) values (25, 1) ;

insert into AUDIT_LOG_EVENT_CODES values (140,'Account Closed', 'Account ''$1'' closed on receiving ''$2''') ;
insert into AUDIT_LOG_EVENT_CODES values (141,'Phone Number Automatically Disconnected', 'PhoneNumber ''$1'' for Account ID ''$2'' disconnected on receiving activation for Account ID ''$3''') ;
insert into AUDIT_LOG_EVENT_CODES values (142,'Subscriber Alarm Closed', 'Aggregation Value ''$1'' belonging to Account ''$2'', Closed as NFR by System') ;
insert into AUDIT_LOG_EVENT_CODES values (143,'Account Alarm Closed', 'Account ''$1'', Closed as NFR by System') ;
insert into AUDIT_LOG_EVENT_CODES values (144,'Subscriber Group Promoted', 'Local Group ''$1'' promoted to Global group') ;
insert into AUDIT_LOG_EVENT_CODES values (145,'Invalid Subscriber Alarm Closed', 'Invalid Subscriber ''$1'', Closed as NFR by System') ;
insert into AUDIT_LOG_EVENT_CODES values (507,'Holiday List Added', 'Holiday added for the date ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (508,'Holiday List Edited', 'Holiday edited for the date ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (509,'Holiday List Deleted', 'Holiday deleted for the date ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (510,'Scheduler Entry Added', 'Scheduler added for module ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (511,'Scheduler Entry Edited', 'Scheduler edited for module ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (512,'Scheduler Entry Deleted', 'Scheduler deleted for module ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (513,'Analyst Action Added', 'Analyst Action ''$1'' added') ;
insert into AUDIT_LOG_EVENT_CODES values (514,'Analyst Action Edited', 'Analyst Action ''$1'' edited') ;
insert into AUDIT_LOG_EVENT_CODES values (515,'Analyst Action Deleted', 'Analyst Action ''$1'' deleted') ;
insert into AUDIT_LOG_EVENT_CODES values (516,'Case Reason Added', 'Case Reason ''$1'' added') ;
insert into AUDIT_LOG_EVENT_CODES values (517,'Case Reason Edited', 'Case Reason ''$1'' edited') ;
insert into AUDIT_LOG_EVENT_CODES values (518,'Case Reason Deleted', 'Case Reason ''$1'' deleted') ;
insert into AUDIT_LOG_EVENT_CODES values (519,'Fraud Type Added', 'Fraud Type ''$1'' added') ;
insert into AUDIT_LOG_EVENT_CODES values (520,'Fraud Type Edited', 'Fraud Type ''$1'' edited') ;
insert into AUDIT_LOG_EVENT_CODES values (521,'Fraud Type Deleted', 'Fraud Type ''$1'' deleted') ;
insert into AUDIT_LOG_EVENT_CODES values (522,'Non Fraud Type Added', 'Non Fraud Type ''$1'' added') ;
insert into AUDIT_LOG_EVENT_CODES values (523,'Non Fraud Type Edited', 'Non Fraud Type ''$1'' edited') ;
insert into AUDIT_LOG_EVENT_CODES values (524,'Non Fraud Type Deleted', 'Non Fraud Type ''$1'' deleted') ;
insert into AUDIT_LOG_EVENT_CODES values (525,'Pending Fraud Type Added', 'Pending Fraud Type ''$1'' added') ;
insert into AUDIT_LOG_EVENT_CODES values (526,'Pending Fraud Type Edited', 'Pending Fraud Type ''$1'' edited') ;
insert into AUDIT_LOG_EVENT_CODES values (527,'Pending Fraud Type Deleted', 'Pending Fraud Type ''$1'' deleted') ;
insert into AUDIT_LOG_EVENT_CODES values (528,'Global Exception Modified', 'Global Exception for ''$1'' is modified') ;
insert into AUDIT_LOG_EVENT_CODES values (529,'Profile Option Enabled', 'Profile Option Enabled for ''$1''') ;
insert into AUDIT_LOG_EVENT_CODES values (530,'Profile Option Disabled', 'Profile Option Disabled for ''$1''') ;

insert into rules (id, parent_id, key, name, network_id, version, aggregation_type, is_enabled, severity, user_id,
      processor_type, is_active, category)
		(select rules_seq.nextval, 1000, rules_key_seq.nextval, 'Manual Alarm - '||f.name, 0, 0, 0, 0,100, 
			'default', 1, 0, 'MANUAL_ALARM_RULES' from fraud_types f where f.fraud_type = 2 ) ;

insert into analyst_actions_rules(rule_id, analyst_action_id)
		(select r.id, a.id from rules r, analyst_actions a 
				where r.parent_id = 1000 
					and r.category = 'MANUAL_ALARM_RULES' 
					and a.category like '%RECOMMENDED_ACTION%') ;

delete from ranger_groups_tasks where task_id in ( select id from tasks where  name = 'Currently Opened Alarms' and is_menu_item = 2) ;
delete from tasks where  name = 'Currently Opened Alarms' and is_menu_item = 2;

update tasks set link = '/alarm_stack/restore_to_avl/18' where name = 'Restore To AVL' ;

update expressions set right_field = 2 where id in (select expression_id from filter_tokens where filter_id in (select
		filter_id from filters_rules where rule_id in (select id from rules where name = 'Account Blacklisted'))) and
left_field = '23.18' and right_field_indicator = 1024 ;

update field_configs set reg_exp_id = 10 where record_config_id= 1 and field_id = 41 ;
update field_configs set reg_exp_id = 0 where record_config_id= 8 and field_id = 6 ;
update field_configs set data_type = 1 where record_config_id= 1 and field_id = 27 ;

update field_categories set regular_expression_id = 13 where id in (1002, 1003, 1004) ;
update field_categories set common_category_id = id where id in (1000,1001,1002,1003,1004);
update field_categories set common_category_id = 1000 where id = 8 ;
update field_categories set common_category_id = 1001 where id = 9 ;
update field_categories set regular_expression_id = 1 where id = 1002 ;

alter table hotlist_groups add is_active  NUMBER(20)  DEFAULT 1;
delete from record_configs where id in (22,23,24) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(22,'ALARM_VIEWS','Open Alarms',0,'ID',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(23,'ALARM_VIEWS','Closed Alarms',0,'ID',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(24,'ALARM_VIEWS','Assigned Alarms',0,'ID',0) ;
update record_view_configs set where_clause = ' ID > 0 AND IS_ACTIVE = 1 ' where id = 14 ;
update record_view_configs set record_config_id = 22 where id =16 ;
update record_view_configs set record_config_id = 23 where id =17 ;
update record_view_configs set record_config_id = 24 where id =18 ;

insert into field_configs (select field_configs_seq.nextval, 22, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function from field_configs where record_config_id = 21 and database_field not like 'DISPLAY_VALUE') ;
insert into field_configs (select field_configs_seq.nextval, 23, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function from field_configs where record_config_id = 21 and database_field not like 'PENDING_TIME') ;
insert into field_configs (select field_configs_seq.nextval, 24, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function from field_configs where record_config_id = 21) ;

update hotlist_groups set is_active = 1 ; 
update basic_filter_configs set record_config_id = 22 where record_view_config_id = 16 ; 
update basic_filter_configs set record_config_id = 23 where record_view_config_id = 17 ; 
update basic_filter_configs set record_config_id = 24 where record_view_config_id = 18 ; 
update basic_filter_configs set is_mandatory = 0 where record_config_id in (16,21,22,23,24) and field_id in (8,14) ;

delete from field_record_config_maps where field_category_id in (8,9,10) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 8, 1, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 9, 1, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 10, 1, '5') ;

drop package AlarmGenerator;

CREATE OR REPLACE TYPE split_table AS TABLE OF varchar2(32767);
/

CREATE OR REPLACE PACKAGE AlarmGenerator
AS
	ALARM_STATUS_FRD		number(20) := 2 ;
	ALARM_STATUS_DEL		number(20) := 8 ;
	ALARM_STATUS_NFR		number(20) := 4 ;
	ALARM_STATUS_NEW		number(20) := 6 ;

	AGG_TYPE_PHONE_NUMBER number(2) := 2 ;
	AGG_TYPE_ACCOUNT_NAME number(2) := 7 ;
	AGG_TYPE_IMSI		  number(2) := 4 ;

	FUNCTION split (input_string varchar2, delimiter varchar2 := ',' ) RETURN split_table pipelined ; 
	FUNCTION join (cursor_string sys_refcursor, delimiter varchar2 := ',' ) RETURN varchar2 ; 

	PROCEDURE GetScoreAndStatus(previous_alarm_score in number, previous_alarm_status in number, score in number, alarm_score out number, alarm_status out number) ;
	PROCEDURE CreateAlarm( agg_value in varchar2, agg_type in number, network_id in number, score in number, reference_id in number, event_id in number, call_count in number, min_day in number, max_day in number, alarm_comment in varchar2, user_id in varchar2) ;
	PROCEDURE CreateManualAlarm( agg_type in number, agg_value in varchar2, network in varchar2, score in number, rule_name in varchar2, alarm_comment in varchar2, subscriber_type in number, user_id in varchar2) ;
	PROCEDURE GetReferenceID( agg_type in number, agg_value in varchar2, network in varchar2, reference_id out number) ;
	PROCEDURE AddDefaultSubscriber( agg_value in varchar2, network in varchar2, reference_id out number) ;
	PROCEDURE AddDefaultAccount( agg_value in varchar2, network in varchar2, reference_id out number) ;
	PROCEDURE GetRuleKey(rule_name in varchar2, event_id out number) ;
END AlarmGenerator ;
/

CREATE OR REPLACE PACKAGE BODY AlarmGenerator AS

	FUNCTION split(input_string varchar2, delimiter varchar2 := ',') RETURN split_table pipelined
	IS
		position    pls_integer;
		list    	varchar2(32767) := input_string;
	BEGIN
		LOOP
			position := instr(list,delimiter);
			IF position > 0 THEN
				pipe row(substr(list,1,position-1));
				list := substr(list,position+length(delimiter));

			ELSE
				pipe row(list);
				exit;
			END IF;
		END LOOP;
		RETURN;
	END split;

	FUNCTION join(cursor_string sys_refcursor, delimiter varchar2 := ',') RETURN varchar2
	IS
		value 	varchar2(32767) ;
		output	varchar2(32767) ;
	BEGIN
		LOOP

       		FETCH cursor_string INTO value;
	        EXIT WHEN cursor_string%NOTFOUND;

        	IF output IS NOT NULL 
			THEN
            	output := output || delimiter ;
	        END IF ;
		
        	output := output || value;

	    END LOOP;

    	RETURN output ;

	END join ;

	PROCEDURE GetScoreAndStatus(previous_alarm_score in number, previous_alarm_status in number, score in number, alarm_score out number, alarm_status out number)
	IS
		ALARM_STATUS_AVL  number(20) := 1 ;
		ALARM_STATUS_ALT  number(20) := 0 ;
	BEGIN
		IF(previous_alarm_score > score)
		THEN
			alarm_score := previous_alarm_score ;
		ELSE
			alarm_score := score ;
		END IF ;

		IF(previous_alarm_status = ALARM_STATUS_AVL)	
		THEN
			alarm_status := ALARM_STATUS_ALT ;
		ELSE
			alarm_status := previous_alarm_status ; 
		END IF ;	
	END GetScoreAndStatus;

	PROCEDURE CreateAlarm( agg_value in varchar2, agg_type in number, network_id in number, score in number, reference_id in number, event_id in number, call_count in number, min_day in number, max_day in number, alarm_comment in varchar2, user_id in varchar2)
	AS
			is_alert_new            number(2) := 0;
			is_alarm_new            number(2) := 0;
			alarm_status			number(20) ;
			temp         			number(20) ;
			day_of_year				number(20) ;
			start_day				number(20) ;
			end_day					number(20) ;
			alarm_score				number(20,0) := 0;
			alert_score				number(20,0) := 0;
			alarm_gen_id            number(20,0) := 0;
			alert_gen_id            number(20,0) := 0;

		CURSOR alarm_cursor(agg_type number, agg_value varchar2) IS
			SELECT id, score, status 
				FROM alarms
					WHERE status NOT IN (ALARM_STATUS_FRD, ALARM_STATUS_NFR, ALARM_STATUS_DEL)
						AND aggregation_type = agg_type
						AND aggregation_value = agg_value;
		CURSOR alert_cursor(agg_type number, agg_value varchar2, event_id number, alarm_id number) IS
			SELECT id, score
				FROM alerts
					WHERE aggregation_type = agg_type
						AND aggregation_value  = agg_value
						AND event_instance_id  = event_id
						AND alerts.alarm_id     = alarm_id ;

		alarm_value alarm_cursor%ROWTYPE;
		alert_value alert_cursor%ROWTYPE;
		 
		BEGIN
			IF (min_day = 0 AND max_day = 0)
			THEN
				SELECT to_char(sysdate,'DDD') INTO day_of_year FROM dual ;
				end_day := day_of_year ;
				start_day := day_of_year ;
			ELSE
				start_day := min_day ;
				end_day := max_day ;
			END IF ;

			open alarm_cursor(agg_type,agg_value);
			fetch alarm_cursor INTO alarm_value;
			IF(alarm_cursor%NOTFOUND)
			THEN
				alarm_gen_id := 0 ;
				is_alarm_new := 1 ;
			ELSE
				alarm_gen_id := alarm_value.id ;
			END IF ;

			IF alarm_gen_id != 0
			THEN
				open alert_cursor(agg_type,agg_value,event_id,alarm_gen_id);
				fetch alert_cursor INTO alert_value;
				IF(alert_cursor%NOTFOUND)
				THEN
					alert_gen_id := 0 ;
				ELSE
					alert_gen_id := alert_value.id ;
				END IF ;
			END IF ;
			
			IF alarm_gen_id = 0
			THEN
				SELECT alarm_id.nextval INTO alarm_gen_id FROM dual;
				INSERT INTO alarms (network_id, id, reference_id, alert_count,
						created_date, modified_date, status, user_id, score, value, cdr_count, aggregation_type, 
						aggregation_value, is_visible,rule_ids)
				VALUES (network_id, alarm_gen_id, reference_id, 1, sysdate, sysdate,
						ALARM_STATUS_NEW, user_id, score, 0, 0, agg_type, agg_value, 1, event_id);
			END IF;
			is_alert_new := 0;
			IF alert_gen_id = 0
			THEN
				is_alert_new := 1;
				SELECT alert_id.nextval INTO alert_gen_id FROM dual;
				INSERT INTO alerts(id, alarm_id, event_instance_id, value, cdr_count,
						repeat_count, cdr_time, created_date, modified_date, score,
						aggregation_type, aggregation_value, is_visible, start_day, end_day)
					VALUES (alert_gen_id, alarm_gen_id, event_id, 0, call_count,
							0, sysdate, sysdate, sysdate, score, agg_type, agg_value, 1,
							start_day, end_day);
			ELSE
				GetScoreAndStatus(alert_value.score, 0, score, alert_score, temp) ;
				UPDATE alerts SET repeat_count = repeat_count + 1,
								  score	= alert_score,
								  modified_date  = sysdate
									WHERE id = alert_gen_id
										AND aggregation_type  = agg_type
										AND aggregation_value = agg_value
										AND event_instance_id = event_id ;
			END IF;

			IF is_alarm_new = 0
			THEN
				GetScoreAndStatus(alarm_value.score, alarm_value.status, score, alarm_score, alarm_status) ;
				UPDATE alarms SET modified_date = sysdate, 
						alert_count = alert_count + 1, 
						score = alarm_score, 
						status = alarm_status,
						rule_ids = (SELECT AlarmGenerator.join(CURSOR(SELECT EVENT_INSTANCE_ID FROM ALERTS WHERE alarm_id = alarm_gen_id)) FROM DUAL) 
							WHERE id = alarm_gen_id
								AND	aggregation_type = agg_type 
								AND aggregation_value = agg_value;
			END IF;

			INSERT INTO alarm_comments (id, comment_date, user_id, alarm_id, action_id, user_comment)
				VALUES (alarm_comments_seq.nextval, sysdate, user_id, alarm_gen_id, 0, alarm_comment);
		COMMIT;

		IF is_alarm_new != 1
		THEN
			close alert_cursor ;
		END IF;

		close alarm_cursor ;

	END CreateAlarm ;

	PROCEDURE CreateManualAlarm( agg_type in number, agg_value in varchar2, network in varchar2, score in number, rule_name in varchar2, alarm_comment in varchar2, subscriber_type in number, user_id in varchar2)
	AS
			reference_id		   	number(20,0) := 2;
			new_alarm				varchar2(256) ;
			event_id				number(20) := 0 ;
			
		BEGIN
			IF subscriber_type = 4 
			THEN
				GetReferenceID(agg_type, agg_value, network, reference_id) ;

				IF (reference_id = 4 and agg_type = AGG_TYPE_PHONE_NUMBER) 
				THEN
					AddDefaultSubscriber(agg_value, network, reference_id) ;
				ELSIF (reference_id = 4 and agg_type = AGG_TYPE_ACCOUNT_NAME)
				THEN
					AddDefaultAccount(agg_value, network, reference_id) ;
				END IF ;
			ELSE
				reference_id := 2 ;
			END IF;
				GetRuleKey(rule_name, event_id) ;
			CreateAlarm(agg_value, agg_type, network, score, reference_id, event_id, 0, 0, 0, alarm_comment, user_id) ; 
	END CreateManualAlarm ;

	PROCEDURE GetReferenceID( agg_type in number, agg_value in varchar2, network in varchar2, reference_id out number)
	AS
	BEGIN 
		
		case agg_type 
			WHEN AGG_TYPE_PHONE_NUMBER THEN
				BEGIN 
					SELECT id INTO reference_id
						FROM subscriber
						WHERE id > 1024 
							AND phone_number = agg_value 
							AND subscriber_type = 0 ;
				EXCEPTION
					when no_data_found THEN
						reference_id := 4 ;
				END ;
			WHEN AGG_TYPE_ACCOUNT_NAME 	THEN
				BEGIN 
					SELECT account_id INTO reference_id
						FROM subscriber
						WHERE id > 1024 
							AND account_name = agg_value 
							AND subscriber_type = 0 ;
				EXCEPTION
					when no_data_found THEN
						reference_id := 4 ;
				END ;
			ELSE
				reference_id := 0 ;
		END CASE ; 
	END GetReferenceID ;

	PROCEDURE AddDefaultSubscriber( agg_value in varchar2, network in varchar2, reference_id out number)
	AS
		DEFAULT_ACCOUNT 			 number(2) := 4 ;
		SUBSCRIBER_STATUS_ACTIVE 	 number(2) := 1 ;
		GSM							 number(2) := 1 ;
		UNKNOWN_PRODUCT				 number(2) := 0 ;
	BEGIN
		
		SELECT subscriber_id.nextval INTO reference_id FROM dual ;

		INSERT INTO SUBSCRIBER (id, account_id, phone_number, subscriber_doa, connection_type, 
						groups, status, product_type, network_id) 
				VALUES( reference_id, DEFAULT_ACCOUNT,
						agg_value, sysdate, GSM, 'Subscriberless', SUBSCRIBER_STATUS_ACTIVE, 
						UNKNOWN_PRODUCT, network) ;

	END AddDefaultSubscriber ; 

	PROCEDURE AddDefaultAccount( agg_value in varchar2, network in varchar2, reference_id out number)
	AS
	BEGIN
		
		SELECT account_id.nextval INTO reference_id FROM dual ;

		INSERT INTO ACCOUNT (id, account_name, account_doa, network_id) 
				VALUES( reference_id, agg_value, sysdate, network) ;

		INSERT INTO ACCOUNT_CREDIT_DETAIL (account_id, account_name) 
				VALUES( reference_id, agg_value) ;

	END AddDefaultAccount ; 

	PROCEDURE GetRuleKey( rule_name in varchar2, event_id out number)
	AS
	BEGIN 

		SELECT key INTO event_id FROM rules 
				where name = rule_name
					and is_active = 0 
					and parent_id = 1000
					and category = 'MANUAL_ALARM_RULES' 
					and rownum < 2;

	END GetRuleKey ; 

END AlarmGenerator ;
/

commit ;
quit ;
