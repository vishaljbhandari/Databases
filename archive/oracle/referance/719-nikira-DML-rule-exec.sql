spool nikira-DML-rule-exec.log
set feedback off ;
set serveroutput off ;
--- nikira-DML-rule-exec.sql                                       nikira-DML-rule-license-exec.sql
--- nikira-DML-rule-fp-exec.sql                                    nikira-DML-rule-preveasupport-exec.sql
--- nikira-DML-rule-gprs-exec.sql                                  nikira-DML-rule-recharge-exec.sql
--- nikira-DML-rule-gprs-reject-future-records-recharge-exec.sql  nikira-DML-rule-reject-future-records-exec.sql
--- nikira-DML-rule-gsm-exec.sql                                   nikira-DML-rule-reject-future-records-gprs-exec.sql
--- nikira-DML-rule-gsm-gprs-exec.sql                              nikira-DML-rule-reject-future-records-gsm-exec.sql
--- nikira-DML-rule-gsm-preveasupport-exec.sql                     nikira-DML-rule-reject-future-records-recharge-exec.sql
--- nikira-DML-rule-isp-exec.sql



-- Tag entries for Rule
insert into tags(select tags_seq.nextval, name, 'AGGREGATION_TYPE' from field_categories where category like '%AGGREGATION_TYPE%') ;
insert into tags(select tags_seq.nextval, description, 'DATA_STREAMS' from record_configs where is_visible = 1 and category like '%RULE_TAGS%' and tname != ' ') ;
insert into tags(select tags_seq.nextval, name, 'HOTLISTS' from field_categories where category like '%HOTLIST%') ;
insert into tags(select tags_seq.nextval, name ,'FRAUD_TYPES' from fraud_types where fraud_type = 2 and is_active=1);
insert into tags(select tags_seq.nextval, name ,'FUNCTIONS' from pseudo_functions where category not in('SMART_PATTERN_RULE','NEGATIVE_RULE', 'STATISTICAL_RULE','FINGERPRINT_RULE', 'FP_ELEMENT'));
insert into tags(select tags_seq.nextval, name ,'FUNCTIONS' from pseudo_functions where name = 'Call Collision');
insert into tags(select tags_seq.nextval, name ,'FUNCTIONS' from pseudo_functions where name = 'Call Collision Phone Number');
insert into tags(select tags_seq.nextval, name ,'FUNCTIONS' from pseudo_functions where name = 'Velocity');
insert into tags values(tags_seq.nextval, 'Called To', 'FUNCTIONS') ;
insert into tags values(tags_seq.nextval, 'Called By', 'FUNCTIONS');
insert into tags(select tags_seq.nextval, name ,'SPECIAL_RULES' from pseudo_functions where category in('STATISTICAL_RULE','FINGERPRINT_RULE'));
insert into tags(select tags_seq.nextval, name ,'SPECIAL_RULES' from pseudo_functions where category like 'SMART_PATTERN_RULE');
insert into tags values(tags_seq.nextval, 'Normal Rule', 'RULE_TYPE');

insert into tags(select tags_seq.nextval, name, 'DURATION_TYPE' from duration_types) ;

insert into tags(id, name, category) values (tags_seq.nextval, 'Production Rules', 'SOURCE') ;
insert into tags(id, name, category) values (tags_seq.nextval, 'Test Rules', 'SOURCE') ;

insert into tag_categories(category, show_mode) values ('AGGREGATION_TYPE','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('DATA_STREAMS','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('HOTLISTS','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('FRAUD_TYPES','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('FUNCTIONS','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('SPECIAL_RULES','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('RULE_TYPE','PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('DURATION_TYPE' ,'PRODUCTION') ;
insert into tag_categories(category, show_mode) values ('USER_DEFINED' ,'PRODUCTION') ;
 
insert into tag_categories(category, show_mode) values ('AGGREGATION_TYPE','TEST') ;
insert into tag_categories(category, show_mode) values ('DATA_STREAMS','TEST') ;
insert into tag_categories(category, show_mode) values ('HOTLISTS','TEST') ;
insert into tag_categories(category, show_mode) values ('FUNCTIONS','TEST') ;
insert into tag_categories(category, show_mode) values ('SPECIAL_RULES','TEST') ;
insert into tag_categories(category, show_mode) values ('RULE_TYPE','TEST') ;
insert into tag_categories(category, show_mode) values ('DURATION_TYPE' ,'TEST') ;
insert into tag_categories(category, show_mode) values ('USER_DEFINED' ,'TEST') ;

-----------------------------------------------------SYSTEM DEFINED RULES-------------------------------------------------------------------------

------Rule to Reject Blacklisted/Disconnected Subscribers
insert into rules (id,parent_id,key,name,version,aggregation_type,accumulation_field,accumulation_function,pseudo_function_id,is_enabled,created_time,modification_time,severity,user_id,description,processor_type,category,is_active)
values (rules_seq.nextval, '999', rules_key_seq.nextval , 'Rule For Rejecting Blacklist/Disconnected Subscriber','0','2','0','0',NULL,'1',sysdate,sysdate,'1','radmin',NULL,'1','SYSTEM_RULES','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval , 1) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval,17) ; 

------ Update IMEI Rule ------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('1','999','1','RuleForUpdateIMEI','0','2','1','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SYSTEM_RULES','1');
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 1, 6) ;

insert into actions_rules(rule_id, action_id) values(1, 2) ;

-------------- Updating Prepaid information------------------------------------ 
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE)	VALUES ('2','999','2','RuleForPrepaidUpdation','0','2','1','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','SYSTEM_RULES','1');

insert into actions_rules(rule_id, action_id) values(2, 3) ;

-------------------Rule For Enrichment.----------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('15','999','15','RecordEnrichment','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 15, 4) ;


insert into actions_rules(rule_id, action_id) values(15, 53) ;

-------------------Rule to store default subscribers from RecordProcessing flow.----------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('5','999','0','SubscriberStore','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into filters (id, name, record_config_id, is_exception, network_id) values (filters_seq.nextval, null, 2, 0, 999) ;
insert into filters_rules (filter_id, rule_id) values (filters_seq.currval, 5) ;


insert into expressions (id, left_field,left_field_indicator, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '10','1025','1,4',1030, 8) ;
insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
                         begin_group_ind, combining_operator, end_group_ind) 
 values (filter_tokens_seq.nextval,filters_seq.currval, expressions_seq.currval, null, null, null, null) ;

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 5, 4) ;


insert into actions_rules(rule_id, action_id) values(5, 6) ;

-------------------Rule to store default subscribers from RecordProcessing flow added for Recharge Log--------------
insert into RECORD_CONFIGS_RULES values(5,2,0) ;


--- Output File Write Action----------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('6','999','6','File Write Action','1','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 6, 5) ;

insert into actions_rules(rule_id, action_id) values(6, 5) ;


-- Dispatcher Rule------------------------
-- Filter : Charging ID is null

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('7','999','7','Dispatcher','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 7, 10006) ;

insert into record_configs_rules(rule_id, record_config_id) values(7, 50) ;

insert into actions_rules(rule_id, action_id) values(7, 7) ;
-- Dispatcher Rule------------------------
-- Filter : Charging ID is not null (For IP rule processor)

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('9','999','9','Dispatcher For IP Rule Processor','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 9, 10008) ;

insert into actions_rules(rule_id, action_id) values(9, 7) ;

-- Subscriber Dispatcher Rule------------------------
-- Filter : Charging ID is null

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('109','999','109','Subscriber Dispatcher','0','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 109, 10010) ;

insert into record_configs_rules(rule_id, record_config_id) values(109, 3) ;

insert into actions_rules(rule_id, action_id) values(109, 7) ;
insert into modulo_dispatcher_categories (record_config_id, field_category_id, enabled) values (3, 7, 1) ;


-- Dispatcher Rule - Account DataStream ------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('10','999','10','AccountDispatcher','0','7','0','0',NULL,'1',TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-07-12 14:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 10, 1000009) ;

insert into record_configs_rules(rule_id, record_config_id) values(10, 4) ;

insert into actions_rules(rule_id, action_id) values(10, 7) ;
insert into modulo_dispatcher_categories (record_config_id, field_category_id, enabled) values (4, 7, 1) ;




-- Mapping entries for tags and rules
insert into rules_tags(rule_id, tag_id) values(5, (select id from tags where name='Account Name' and category='AGGREGATION_TYPE'));
insert into rules_tags(rule_id, tag_id) values(6, (select id from tags where name='Account Name' and category='AGGREGATION_TYPE'));
insert into rules_tags(rule_id, tag_id) values(7, (select id from tags where name='Account Name' and category='AGGREGATION_TYPE'));
insert into rules_tags(rule_id, tag_id) values(10, (select id from tags where name='Account Name' and category='AGGREGATION_TYPE'));

insert into rules_tags(rule_id, tag_id) values(5, (select id from tags where name='Account' and category='DATA_STREAMS'));
insert into rules_tags(rule_id, tag_id) values(6, (select id from tags where name='Account' and category='DATA_STREAMS'));
insert into rules_tags(rule_id, tag_id) values(7, (select id from tags where name='Account' and category='DATA_STREAMS'));
insert into rules_tags(rule_id, tag_id) values(10, (select id from tags where name='Account' and category='DATA_STREAMS'));

insert into rules_tags(rule_id, tag_id) values(5, (select id from tags where name='Phone Number' and category='HOTLISTS'));
insert into rules_tags(rule_id, tag_id) values(6, (select id from tags where name='Phone Number' and category='HOTLISTS'));
insert into rules_tags(rule_id, tag_id) values(7, (select id from tags where name='Phone Number' and category='HOTLISTS'));

insert into rules_tags(rule_id, tag_id) values(5, (select id from tags where name='Normal Rule' and category='RULE_TYPE'));
insert into rules_tags(rule_id, tag_id) values(6, (select id from tags where name='Normal Rule' and category='RULE_TYPE'));
insert into rules_tags(rule_id, tag_id) values(7, (select id from tags where name='Normal Rule' and category='RULE_TYPE'));
insert into rules_tags(rule_id, tag_id) values(10, (select id from tags where name='Normal Rule' and category='RULE_TYPE'));

----Rule for Summary Table updation action
INSERT INTO rules
(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE)
	VALUES ('103','999','103','RuleForVoucherExpiryDate','0','2','1','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1',NULL,'1');
insert into actions_rules(rule_id, action_id) values(103, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 103, 20000) ;

----
INSERT INTO rules
(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE)
	VALUES ('104','999','104','RuleForVoucherExpiryDatewithGracePeriodNull','0','2','1','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1',NULL,'1');
insert into actions_rules(rule_id, action_id) values(104, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 104, 20001) ;


INSERT INTO rules
(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE)
	VALUES ('105','999','105','RuleForVoucherExpiryDatewithGracePeriod','0','2','1','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1',NULL,'1');
insert into actions_rules(rule_id, action_id) values(105, 4) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 105, 20002) ;


INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('108','999','108','Dispatcher Performance BenchMark Rule','0','2','17','0',NULL,'0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'10','radmin',NULL,'1','DISPATCHER','1');

insert into actions_rules(rule_id, action_id) values(108, 30) ; 
insert into record_configs_rules(rule_id, record_config_id) values (108, 3) ;
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 108, 999999) ;

--Coloring Rules

---Coloring Rules for alarm views for 'radmin'----------------------------------------------------
-----------------ALT STATUS--------------------

exec InsertColoringRule('ALT Status', 'radmin', '#FF1010', '0', '8', 10, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Archived Alarms', 'radmin', '#FF1010', '0', '8', 16, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Alarms', 'radmin', '#FF1010', '0', '8', 21, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Alarms', 'radmin', '#FF1010', '0', '8', 22, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Alarms', 'radmin', '#FF1010', '0', '8', 23, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Assigned Alarms', 'radmin', '#FF1010', '0', '8', 24, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Case Alarms', 'radmin', '#FF1010', '0', '8', 36, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Case Alarms', 'radmin', '#FF1010', '0', '8', 37, 'Status Equal ALT') ;


-----------------AVL STATUS--------------------

exec InsertColoringRule('AVL Status', 'radmin', '#6AB5FF', '1', '8', 10, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Archived Alarms', 'radmin', '#6AB5FF', '1', '8', 16, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Alarms', 'radmin', '#6AB5FF', '1', '8', 21, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Alarms', 'radmin', '#6AB5FF', '1', '8', 22, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Alarms', 'radmin', '#6AB5FF', '1', '8', 23, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Assigned Alarms', 'radmin', '#6AB5FF', '1', '8', 24, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Case Alarms', 'radmin', '#6AB5FF', '1', '8', 36, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Case Alarms', 'radmin', '#6AB5FF', '1', '8', 37, 'Status Equal AVL') ;



-----------------FRD STATUS--------------------

exec InsertColoringRule('FRD Status', 'radmin', '#FFF05F', '2', '8', 10, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Archived Alarms', 'radmin', '#FFF05F', '2', '8', 16, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Alarms', 'radmin', '#FFF05F', '2', '8', 21, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Alarms', 'radmin', '#FFF05F', '2', '8', 22, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Alarms', 'radmin', '#FFF05F', '2', '8', 23, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Assigned Alarms', 'radmin', '#FFF05F', '2', '8', 24, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Case Alarms', 'radmin', '#FFF05F', '2', '8', 36, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Case Alarms', 'radmin', '#FFF05F', '2', '8', 37, 'Status Equal FRD') ;



-----------------INV STATUS--------------------

exec InsertColoringRule('INV Status', 'radmin', '#FF9797', '3', '8', 10, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Archived Alarms', 'radmin', '#FF9797', '3', '8', 16, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Alarms', 'radmin', '#FF9797', '3', '8', 21, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Alarms', 'radmin', '#FF9797', '3', '8', 22, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Alarms', 'radmin', '#FF9797', '3', '8', 23, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Assigned Alarms', 'radmin', '#FF9797', '3', '8', 24, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Case Alarms', 'radmin', '#FF9797', '3', '8', 36, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Case Alarms', 'radmin', '#FF9797', '3', '8', 37, 'Status Equal INV') ;


-----------------NFR STATUS--------------------

exec InsertColoringRule('NFR Status', 'radmin', '#CCCCFF', '4', '8', 10, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Archived Alarms', 'radmin', '#CCCCFF', '4', '8', 16, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Alarms', 'radmin', '#CCCCFF', '4', '8', 21, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Alarms', 'radmin', '#CCCCFF', '4', '8', 22, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Alarms', 'radmin', '#CCCCFF', '4', '8', 23, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Assigned Alarms', 'radmin', '#CCCCFF', '4', '8', 24, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Case Alarms', 'radmin', '#CCCCFF', '4', '8', 36, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Case Alarms', 'radmin', '#CCCCFF', '4', '8', 37, 'Status Equal NFR') ;


-----------------PEN STATUS--------------------

exec InsertColoringRule('PEN Status', 'radmin', '#FFF8b5', '5', '8', 10, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Archived Alarms', 'radmin', '#FFF8b5', '5', '8', 16, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Alarms', 'radmin', '#FFF8b5', '5', '8', 21, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Alarms', 'radmin', '#FFF8b5', '5', '8', 22, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Alarms', 'radmin', '#FFF8b5', '5', '8', 23, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Assigned Alarms', 'radmin', '#FFF8b5', '5', '8', 24, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Case Alarms', 'radmin', '#FFF8b5', '5', '8', 36, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Case Alarms', 'radmin', '#FFF8b5', '5', '8', 37, 'Status Equal PEN') ;


-----------------NEW STATUS--------------------

exec InsertColoringRule('NEW Status', 'radmin', '#D7FFAE', '6', '8', 10, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Archived Alarms', 'radmin', '#D7FFAE', '6', '8', 16, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Alarms', 'radmin', '#D7FFAE', '6', '8', 21, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Alarms', 'radmin', '#D7FFAE', '6', '8', 22, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Alarms', 'radmin', '#D7FFAE', '6', '8', 23, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Assigned Alarms', 'radmin', '#D7FFAE', '6', '8', 24, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Case Alarms', 'radmin', '#D7FFAE', '6', '8', 36, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Case Alarms', 'radmin', '#D7FFAE', '6', '8', 37, 'Status Equal NEW') ;


---Coloring Rules for alarm views for 'nadmin'----------------------------------------------------
-----------------ALT STATUS--------------------

exec InsertColoringRule('ALT Status', 'nadmin', '#FF1010', '0', '8', 10, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Archived Alarms', 'nadmin', '#FF1010', '0', '8', 16, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Alarms', 'nadmin', '#FF1010', '0', '8', 21, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Alarms', 'nadmin', '#FF1010', '0', '8', 22, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Alarms', 'nadmin', '#FF1010', '0', '8', 23, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Assigned Alarms', 'nadmin', '#FF1010', '0', '8', 24, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Case Alarms', 'nadmin', '#FF1010', '0', '8', 36, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Case Alarms', 'nadmin', '#FF1010', '0', '8', 37, 'Status Equal ALT') ;


-----------------AVL STATUS--------------------

exec InsertColoringRule('AVL Status', 'nadmin', '#6AB5FF', '1', '8', 10, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Archived Alarms', 'nadmin', '#6AB5FF', '1', '8', 16, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Alarms', 'nadmin', '#6AB5FF', '1', '8', 21, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Alarms', 'nadmin', '#6AB5FF', '1', '8', 22, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Alarms', 'nadmin', '#6AB5FF', '1', '8', 23, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Assigned Alarms', 'nadmin', '#6AB5FF', '1', '8', 24, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Case Alarms', 'nadmin', '#6AB5FF', '1', '8', 36, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Case Alarms', 'nadmin', '#6AB5FF', '1', '8', 37, 'Status Equal AVL') ;


-----------------FRD STATUS--------------------

exec InsertColoringRule('FRD Status', 'nadmin', '#FFF05F', '2', '8', 10, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Archived Alarms', 'nadmin', '#FFF05F', '2', '8', 16, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Alarms', 'nadmin', '#FFF05F', '2', '8', 21, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Alarms', 'nadmin', '#FFF05F', '2', '8', 22, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Alarms', 'nadmin', '#FFF05F', '2', '8', 23, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Assigned Alarms', 'nadmin', '#FFF05F', '2', '8', 24, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Case Alarms', 'nadmin', '#FFF05F', '2', '8', 36, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Case Alarms', 'nadmin', '#FFF05F', '2', '8', 37, 'Status Equal FRD') ;


-----------------INV STATUS--------------------

exec InsertColoringRule('INV Status', 'nadmin', '#FF9797', '3', '8', 10, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Archived Alarms', 'nadmin', '#FF9797', '3', '8', 16, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Alarms', 'nadmin', '#FF9797', '3', '8', 21, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Alarms', 'nadmin', '#FF9797', '3', '8', 22, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Alarms', 'nadmin', '#FF9797', '3', '8', 23, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Assigned Alarms', 'nadmin', '#FF9797', '3', '8', 24, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Case Alarms', 'nadmin', '#FF9797', '3', '8', 36, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Case Alarms', 'nadmin', '#FF9797', '3', '8', 37, 'Status Equal INV') ;


-----------------NFR STATUS--------------------

exec InsertColoringRule('NFR Status', 'nadmin', '#CCCCFF', '4', '8', 10, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Archived Alarms', 'nadmin', '#CCCCFF', '4', '8', 16, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Alarms', 'nadmin', '#CCCCFF', '4', '8', 21, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Alarms', 'nadmin', '#CCCCFF', '4', '8', 22, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Alarms', 'nadmin', '#CCCCFF', '4', '8', 23, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Assigned Alarms', 'nadmin', '#CCCCFF', '4', '8', 24, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Case Alarms', 'nadmin', '#CCCCFF', '4', '8', 36, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Case Alarms', 'nadmin', '#CCCCFF', '4', '8', 37, 'Status Equal NFR') ;


-----------------PEN STATUS--------------------

exec InsertColoringRule('PEN Status', 'nadmin', '#FFF8b5', '5', '8', 10, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Archived Alarms', 'nadmin', '#FFF8b5', '5', '8', 16, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Alarms', 'nadmin', '#FFF8b5', '5', '8', 21, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Alarms', 'nadmin', '#FFF8b5', '5', '8', 22, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Alarms', 'nadmin', '#FFF8b5', '5', '8', 23, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Assigned Alarms', 'nadmin', '#FFF8b5', '5', '8', 24, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Case Alarms', 'nadmin', '#FFF8b5', '5', '8', 36, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Case Alarms', 'nadmin', '#FFF8b5', '5', '8', 37, 'Status Equal PEN') ;


-----------------NEW STATUS--------------------

exec InsertColoringRule('NEW Status', 'nadmin', '#D7FFAE', '6', '8', 10, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Archived Alarms', 'nadmin', '#D7FFAE', '6', '8', 16, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Alarms', 'nadmin', '#D7FFAE', '6', '8', 21, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Alarms', 'nadmin', '#D7FFAE', '6', '8', 22, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Alarms', 'nadmin', '#D7FFAE', '6', '8', 23, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Assigned Alarms', 'nadmin', '#D7FFAE', '6', '8', 24, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Case Alarms', 'nadmin', '#D7FFAE', '6', '8', 36, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Case Alarms', 'nadmin', '#D7FFAE', '6', '8', 37, 'Status Equal NEW') ;


---Coloring Rules for alarm views for 'default'----------------------------------------------------
-----------------ALT STATUS--------------------

exec InsertColoringRule('ALT Status', 'default', '#FF1010', '0', '8', 10, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Archived Alarms', 'default', '#FF1010', '0', '8', 16, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Alarms', 'default', '#FF1010', '0', '8', 21, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Alarms', 'default', '#FF1010', '0', '8', 22, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Alarms', 'default', '#FF1010', '0', '8', 23, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Assigned Alarms', 'default', '#FF1010', '0', '8', 24, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Open Case Alarms', 'default', '#FF1010', '0', '8', 36, 'Status Equal ALT') ;
exec InsertColoringRule('ALT Status - Closed Case Alarms', 'default', '#FF1010', '0', '8', 37, 'Status Equal ALT') ;


-----------------AVL STATUS--------------------

exec InsertColoringRule('AVL Status', 'default', '#6AB5FF', '1', '8', 10, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Archived Alarms', 'default', '#6AB5FF', '1', '8', 16, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Alarms', 'default', '#6AB5FF', '1', '8', 21, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Alarms', 'default', '#6AB5FF', '1', '8', 22, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Alarms', 'default', '#6AB5FF', '1', '8', 23, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Assigned Alarms', 'default', '#6AB5FF', '1', '8', 24, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Open Case Alarms', 'default', '#6AB5FF', '1', '8', 36, 'Status Equal AVL') ;
exec InsertColoringRule('AVL Status - Closed Case Alarms', 'default', '#6AB5FF', '1', '8', 37, 'Status Equal AVL') ;


-----------------FRD STATUS--------------------

exec InsertColoringRule('FRD Status', 'default', '#FFF05F', '2', '8', 10, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Archived Alarms', 'default', '#FFF05F', '2', '8', 16, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Alarms', 'default', '#FFF05F', '2', '8', 21, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Alarms', 'default', '#FFF05F', '2', '8', 22, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Alarms', 'default', '#FFF05F', '2', '8', 23, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Assigned Alarms', 'default', '#FFF05F', '2', '8', 24, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Open Case Alarms', 'default', '#FFF05F', '2', '8', 36, 'Status Equal FRD') ;
exec InsertColoringRule('FRD Status - Closed Case Alarms', 'default', '#FFF05F', '2', '8', 37, 'Status Equal FRD') ;


-----------------INV STATUS--------------------

exec InsertColoringRule('INV Status', 'default', '#FF9797', '3', '8', 10, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Archived Alarms', 'default', '#FF9797', '3', '8', 16, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Alarms', 'default', '#FF9797', '3', '8', 21, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Alarms', 'default', '#FF9797', '3', '8', 22, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Alarms', 'default', '#FF9797', '3', '8', 23, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Assigned Alarms', 'default', '#FF9797', '3', '8', 24, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Open Case Alarms', 'default', '#FF9797', '3', '8', 36, 'Status Equal INV') ;
exec InsertColoringRule('INV Status - Closed Case Alarms', 'default', '#FF9797', '3', '8', 37, 'Status Equal INV') ;


-----------------NFR STATUS--------------------

exec InsertColoringRule('NFR Status', 'default', '#CCCCFF', '4', '8', 10, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Archived Alarms', 'default', '#CCCCFF', '4', '8', 16, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Alarms', 'default', '#CCCCFF', '4', '8', 21, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Alarms', 'default', '#CCCCFF', '4', '8', 22, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Alarms', 'default', '#CCCCFF', '4', '8', 23, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Assigned Alarms', 'default', '#CCCCFF', '4', '8', 24, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Open Case Alarms', 'default', '#CCCCFF', '4', '8', 36, 'Status Equal NFR') ;
exec InsertColoringRule('NFR Status - Closed Case Alarms', 'default', '#CCCCFF', '4', '8', 37, 'Status Equal NFR') ;


-----------------PEN STATUS--------------------

exec InsertColoringRule('PEN Status', 'default', '#FFF8b5', '5', '8', 10, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Archived Alarms', 'default', '#FFF8b5', '5', '8', 16, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Alarms', 'default', '#FFF8b5', '5', '8', 21, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Alarms', 'default', '#FFF8b5', '5', '8', 22, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Alarms', 'default', '#FFF8b5', '5', '8', 23, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Assigned Alarms', 'default', '#FFF8b5', '5', '8', 24, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Open Case Alarms', 'default', '#FFF8b5', '5', '8', 36, 'Status Equal PEN') ;
exec InsertColoringRule('PEN Status - Closed Case Alarms', 'default', '#FFF8b5', '5', '8', 37, 'Status Equal PEN') ;


-----------------NEW STATUS--------------------

exec InsertColoringRule('NEW Status', 'default', '#D7FFAE', '6', '8', 10, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Archived Alarms', 'default', '#D7FFAE', '6', '8', 16, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Alarms', 'default', '#D7FFAE', '6', '8', 21, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Alarms', 'default', '#D7FFAE', '6', '8', 22, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Alarms', 'default', '#D7FFAE', '6', '8', 23, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Assigned Alarms', 'default', '#D7FFAE', '6', '8', 24, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Open Case Alarms', 'default', '#D7FFAE', '6', '8', 36, 'Status Equal NEW') ;
exec InsertColoringRule('NEW Status - Closed Case Alarms', 'default', '#D7FFAE', '6', '8', 37, 'Status Equal NEW') ;




---------------End of coloring rules for alarm views----------------------







---------Coloring rules for MY_NOTIFICATIONS UNREAD Status

insert into filters (ID, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID) values (filters_seq.nextval, 82, 0, 999) ;
insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD ,RIGHT_FIELD_INDICATOR ,OPERATOR_ID ,PRIORITY ,IS_BETWEEN_OPERATOR) values (expressions_seq.nextval, 11, 0, 1024, 6, 0, 0) ;
insert into filter_tokens (id, FILTER_ID, DESCRIPTION, EXPRESSION_ID, SYSTEM_FILTER ) values (filter_tokens_seq.nextval, filters_seq.currval, 'Is Read Equal UNREAD', expressions_seq.currval, 0) ;

---------My Notifications coloring rule for nadmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for unread for nadmin', 0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'nadmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#D7FFAE') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

---------My Notifications coloring rule for radmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for unread for radmin', 0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'radmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#D7FFAE') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

---------My Notifications coloring rule for default
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for unread for default', 0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'default', null, 1, 'COLORING_RULES', 1, 0, 0, 0,0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#D7FFAE') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;


---------Coloring rules for MY_NOTIFICATIONS READ Status
insert into filters (ID, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID) values (filters_seq.nextval, 82, 0, 999) ;
insert into expressions (ID, LEFT_FIELD, RIGHT_FIELD ,RIGHT_FIELD_INDICATOR ,OPERATOR_ID ,PRIORITY ,IS_BETWEEN_OPERATOR) values (expressions_seq.nextval, 11, 1, 1024, 6, 0, 0) ;
insert into filter_tokens (id, FILTER_ID, DESCRIPTION, EXPRESSION_ID, SYSTEM_FILTER ) values (filter_tokens_seq.nextval, filters_seq.currval, 'Is Read Equal READ', expressions_seq.currval, 0) ;

---------My Notifications coloring rule for nadmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for read for nadmin',
	0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'nadmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0,0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#FFFFFF') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

---------My Notifications coloring rule for radmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for read for radmin',
	0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'radmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#FFFFFF') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

---------My Notifications coloring rule for default
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'My notification coloring rule for read for default',
	0, 0, 0, 0, null, 1, sysdate, sysdate, 100, 'default', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#FFFFFF') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 82 );
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;
----------------End of Coloring rule for My Notifications------------

---------------End Of Coloring Rules-------------------------------------------------

--------- Coloring rules for Rule Status (IS_ENABLED)
--
insert into filters (id, record_config_id, is_exception, network_id) values (filters_seq.nextval, 44, 0, 999) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '8', 'Disabled', 1024, 6) ;
insert into filter_tokens (id, filter_id, description, expression_id, system_filter) values 
(filter_tokens_seq.nextval, filters_seq.currval, 'Status Equal Disabled', expressions_seq.currval, 0) ;

---------  nadmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval,'Rule Status Equal Disabled - nadmin', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'nadmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 44);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 46);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 78);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 80);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 244);
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

--------- radmin
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval, 'Rule Status Equal Disabled - radmin', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'radmin', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 44);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 46);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 78);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 80);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 244);
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

--------- default
insert into rules values (rules_seq.nextval, 999, rules_key_seq.nextval, 'Rule Status Equal Disabled - default', 0, 0, 0, 0,
	null, 1, sysdate, sysdate, 100, 'default', null, 1, 'COLORING_RULES', 1, 0, 0, 0, 0, 0) ;
insert into rule_color_maps values (rule_color_maps_seq.nextval, rules_seq.currval, '#CCCCCC') ;
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 44);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 46);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 78);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 80);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 244);
insert into filters_rules values (filters_seq.currval, rules_seq.currval) ;

commit ; 
------------------------ Manual Alarm Rules ----------------------

DECLARE
	cursor fraud_types_cursor is select * from fraud_types where fraud_type = 2 and is_active = 1 ; 
	fraudtypescursor fraud_types_cursor%ROWTYPE;
BEGIN

	open fraud_types_cursor ;
	loop
			FETCH fraud_types_cursor INTO fraudtypescursor ;
			EXIT WHEN fraud_types_cursor%NOTFOUND ;
				insert into rules (id, parent_id, key, name, version, aggregation_type, is_enabled, severity, user_id,
									processor_type, is_active, category)
								values(rules_seq.nextval, 1000, rules_key_seq.nextval, 'Manual Alarm - '||fraudtypescursor.name, 0, 0, 1,100, 
									 'default', 1, 1, 'MANUAL_ALARM_RULES') ;

				insert into fraud_types_rules (rule_id, fraud_type_id) values(rules_seq.currval, fraudtypescursor.id) ;
				insert into rules_tags(rule_id, tag_id) select rules_seq.currval, id from tags where category = 'FRAUD_TYPES' ;
	end loop ;
	COMMIT ;
	close fraud_types_cursor ;
	EXCEPTION
    	WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
	COMMIT ;
END ;
/

insert into analyst_actions_rules(rule_id, analyst_action_id)
		(select r.id, a.id from rules r, analyst_actions a 
				where r.parent_id = 1000 
					and r.category = 'MANUAL_ALARM_RULES'
					and a.category like '%RECOMMENDED_ACTION%') ;

insert into analyst_actions_rules(rule_id, analyst_action_id)
		(select r.id, a.id from rules r, analyst_actions a 
				where r.category = 'CalledToCalledBy'
					  and a.category like '%RECOMMENDED_ACTION%') ;

insert into record_configs_rules (rule_id, record_config_id) (select r.id, rc.id from rules r , record_configs rc where rc.id in (1,2,7) and r.category = 'MANUAL_ALARM_RULES') ;
insert into rules_tags (rule_id, tag_id) (select r.id, t.id from rules r , tags t where t.name in ('CDR', 'GPRS', 'Recharge Logs') and t.category='DATA_STREAMS' and r.category = 'MANUAL_ALARM_RULES');


-- Scheduler Dispatcher Rule------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('14','999','14','Scheduler Dispatcher','0','2','0','0',NULL,'1',TO_DATE('2008-06-24 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2008-06-24 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCH.SCHEDULER','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 14, 10006) ;

insert into record_configs_rules(rule_id, record_config_id) values(14, 3) ;
insert into record_configs_rules(rule_id, record_config_id) values(14, 4) ;

insert into actions_rules(rule_id, action_id) values(14, 50) ;
 

--------------------------- Global Exception Rule --------------------

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE)
VALUES
(rules_seq.nextval, '999', rules_key_seq.nextval , 'Rule For Global Exception','0','2','0','0',NULL,'1',sysdate,sysdate,'1','radmin',NULL,'1','DISPATCHER.GLOBAL_EXCEPTION','1');


insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval , 7 ) ;

-----------------------------------------------------------------------------------------------------------------------------


insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, 3, 0, 999) ;
insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, rules_seq.currval) ;
insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval,'12','+%', 1024,1);
insert into filter_tokens(id, filter_id, expression_id, contained_filter_id, description, system_filter) values(filter_tokens_seq.nextval, filters_seq.currval,expressions_seq.currval, null,' ',1) ;

------------------------------------------------------------------------------------------------------------------------------

insert into record_configs_rules(rule_id, record_config_id) values(rules_seq.currval, 3) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval,17) ; 



-- Update Total Calls For Subscriber ----

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) values (rules_seq.nextval, '999', rules_key_seq.nextval , 'Update Total Calls For Subscriber','0','2','0','0',NULL,'1',sysdate,sysdate,'1','radmin',NULL,'1','SYSTEM_RULES','1');
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval , 2048) ;

insert into actions_rules(rule_id, action_id) values(rules_seq.currval,55) ;

-- Grouped field configs default entry --
insert into grouped_field_configs (ID, NAME, RECORD_CONFIG_ID, FIELD_IDS, DATA_TYPE, CATEGORY_ID) values (grouped_field_configs_seq.nextval, 'UNF Number', 1, '3,4,5,22', 3, 2);

-- Manual Profile Match For Internal User Dispatcher Rule------------------------
INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES ('16','999','16','Scheduler Dispatcher','0','2','0','0',NULL,'1',TO_DATE('2008-06-24 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2008-06-24 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCH.PROFILE_MATCH','1');

insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, 16, 10007) ;

insert into record_configs_rules(rule_id, record_config_id) values(16, 3) ;
insert into record_configs_rules(rule_id, record_config_id) values(16, 4) ;

insert into actions_rules(rule_id, action_id) values(16, 7) ;
commit ;

