spool nikira-DML-new-record-config.log
set feedback off ;
set serveroutput off ;

delete from view_config_components where record_view_config_id not in (select id from record_view_configs where record_config_id in (1, 2, 7)) ;
delete from field_record_config_maps where record_config_id in (3, 4, 5, 6, 8, 10, 11, 20, 15, 21, 14, 16, 17) ;
delete from field_configs where record_config_id in (3, 4, 5, 6, 8, 10, 11, 20, 15, 21, 14, 16, 17, 22, 23, 24, 53, 54, 70, 71, 72) ;
delete from record_view_configs where record_config_id in (3, 4, 5, 6, 8, 10, 11, 20, 15, 21, 14, 16, 17, 60, 64, 65, 70, 71, 72) ;
delete from record_configs where id in (3, 4, 5, 6, 8, 10, 11, 20, 15, 21, 14, 16, 17, 22, 23, 24, 53, 54, 70, 71, 72) ;
delete from expandable_field_maps ;

-----Currency Configuration-------------
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'CURRENCY', 'INR' );

-----GRID STATE Configuration-------------
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'GRID_STATE', '1' );

--Record Types--
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(3,'SUBSCRIBER','Subscriber',0,'PHONE_NUMBER',1, '|', 'NAMED_FILTERS PRECHECK RULE_TAGS STATS_RULE_ENTITY_TYPE FINGERPRINT_RULE_ENTITY_TYPE INLINE_RULES TEST_RULE') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(4,'ACCOUNT','Account',0,'ACCOUNT_NAME',1, ',', 'NAMED_FILTERS RULE_TAGS STATS_RULE_ENTITY_TYPE INLINE_RULES TEST_RULE') ; 
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(5,'ACCOUNT_CREDIT_DETAIL','Account Credit Details', 0, 'ACCOUNT_NAME', 1) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(8,'AUDIT_TRAILS','Audit Log',0,'ID',1) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(10,'ALARMS','Alarms',0,'ID',0, ',') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values(11,'ALERTS_V','Alerts',0,'ID',1, ',','NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(14,'HOTLIST_GROUPS_V','Hotlist Groups',0,'ID',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(15,'SUSP_VAL_HOTLIST_GRP_NETWRK_V','Hotlist Entities',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, category) values(16,'ARCHIVED_ALARMS','Archived Alarms',0,'ID',1,'NAMED FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, category) values(17,'CASES','Cases',0,'ID',1, 'NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(20,'ARCHIVED_ALERTS','Archived Alerts',0,'ID',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(21,'ALARM_VIEWS','Alarms',0,'ID',1, ',', 'NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(22,'ALARM_VIEWS','Open Alarms',0,'ID',1, ',', 'NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values(23,'ALARM_VIEWS','Closed Alarms',0,'ID',1, ',','NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(24,'ALARM_VIEWS','Assigned Alarms',0,'ID',1, ',', 'NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(25,'ASN_GROUPS','Hotlist Auto Suspect Number Groups',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(26,'AUTO_SUSPECT_NUMS','Hotlist Auto Suspect Numbers',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(27,'CALLTO_CALLBY_PH_NUMBERS','Call To Call By Phone Number',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(28,'INVALID_SUBSCRIBER_COUNTERS','Invalid Subscriber Counter',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(32,'NAMED_FILTERS_V','Named Filters',0,'',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(34,'AUDIT_FILES_PROCESSED','Files processed',0,'ID',0) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values(12,'ACCOUNT','Parent Account',0,'ACCOUNT_NAME',1, ',','ACCOUNTGROUPING') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(98,'SUBSCRIBER_PRECHECK_V','Subscriber Precheck List',0,'PHONE_NUMBER',1, '|', '') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(99,'ACCOUNT_PRECHECK_V','Account Precheck List',0,'ACCOUNT_NAME',1, ',', '') ;


-- SDR Rate --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(85,'SDR_RATE_V','SDR Rate',0,'',1,'NAMED_FILTERS');


-- Hotlist Key Info --
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(92, 'HOTLIST_PER_KEY_NETWORK_V','Hotlist Entities With Keys', 0, '', 0) ;


-- ************ RATE ************
--  RATE configuration Record 
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(31,'RATE_V','Auto Threhsold usage',0,'',1) ;
--  RATE view thresholds Record 
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(33,'THRESHOLDS_V','View Auto Threhsold',0,'',1) ;
--  RATE view inactive thresholds
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(35,'INVALID_THRESHOLDS_V','Invalid Auto Thrshold View',0,'',1) ;
--*******************************

insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(40,'RANGER_USERS_V','Users',0,'',1,'NAMED_FILTERS') ;

--  Rule Management ---
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(43,'RULE_TEMPLATES_V','Rule Templates',0,'',0, '|') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values(44,'RULES_V','Rules',0,'',1, '|', 'NAMED_FILTERS') ;
--  *************** ---


-- Negative Rules View For Client --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values (46,'NEGATIVE_RULES_V','Query Rules', 0, '', 1, '|','NAMED_FILTERS');
--  *************** ---

-- Scheduler --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values (47, 'SCHEDULER_V', 'Scheduler',0,'',1,'NAMED_FILTERS'); 
--  *************** ---

-- Scheduled Reports --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values (110, 'SCHEDULED_REPORTS_V', 'Scheduled Reports',0,'',1,'NAMED_FILTERS'); 
--  *************** ---

--  Rule History ---
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(48,'RULES_V','Rule History',0,'',0, '|') ;
--  *************** ---

insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(49,'RANGER_USERS_ONLINE_V','Users Online',0,'',1,'NAMED_FILTERS') ;

-- Negative Rule Record --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) 
		values(50, ' ', 'Negative Rule Data record', 0, '', 0, ',') ;
--  *************** ---

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(51,'PROFILE_COUNTER_V','Profile Counter',0,'',0) ;
--  *************** ---
-- Analyst Actions

insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(52, 'ANALYST_ACTIONS_V', 'Analyst Actions', 0, '', 1,'NAMED_FILTERS') ;

--Free and Special Numbers--
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(53, 'FREE_NUMBERS_V', 'Free Numbers', 0, '', 1,'NAMED_FILTERS') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(54, 'RATER_SPECIAL_NUMBERS_V', 'Special Number', 0, '', 1,'NAMED_FILTERS') ;


-- Configurations --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(57, 'CONFIGURATIONS', 'Configurations', 0, '', 1,'NAMED_FILTERS') ;

-- Orgination Destination Links --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(58, 'ORG_DEST_LINKS','Origination Destination Links', 0, '', 1,'NAMED_FILTERS') ;

-- Rate Per Call --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(59, 'RATE_PER_CALLS','Rate Per Calls', 0, '', 1,'NAMED_FILTERS') ;

-- Rate Type --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(62, 'RATE_TYPES','Rate Types', 0, '',1,'NAMED_FILTERS') ;

-- Rate Plan --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(63, 'RATE_PLANS','Rate Plans', 0, '', 1,'NAMED_FILTERS') ;

-- Default Rates --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(64, 'DEFAULT_RATES','Default Rates', 0, '',1,'NAMED_FILTERS') ;

-- Alarm Closure Types --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(61, 'FRAUD_TYPES','Fraud Types', 0, '',1,'NAMED_FILTERS') ;

-- Case Reason --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(65, 'CASE_REASONS','Case Reasons', 0, '',1,'NAMED_FILTERS') ;

-- Geographically Infeasible Event Configs
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values (55, 'VELOCITY_EVENT_CONFIGS', 'Geographically Infeasible Event Configs', 0, '',1,'NAMED_FILTERS') ;

-- Holiday List
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values (56, 'HOLIDAY_LIST_V', 'Holiday List', 0, '',1,'NAMED_FILTERS') ;

-- Zone Code --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(66, 'ZONE_CODES','Zone Code', 0, '',1,'NAMED_FILTERS') ;

-- Country Code --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(67, 'RATER_COUNTRY_CODES','Country Code', 0, '',1,'NAMED_FILTERS') ;

-- Cell Site Geo --
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(68, 'CELL_SITE_GEO_POSITIONS','Geographical Positions', 0, '',1,'NAMED_FILTERS') ;

-- Observation Summary Records--
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(69,'OBSERVATION_SUMMARY_RECORDS','Observation Summary Records', 0, '', 0) ;

-- Alarm Workflow Acticity Logs
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(73, 'ALARM_ACTIVITY_LOGS', 'Alarm Activity Logs', 0, NULL, 1, ',', 'NAMED_FILTERS', 0) ;

-- Alarm Workflow
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(74, 'ALARM_WORKFLOW_V', 'Alarm Workflow', 0, NULL, 1, ',','NAMED_FILTERS', 0) ;

-- Workflow Activity Templates
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values(75, 'ACTIVITY_TEMPLATES', 'Activity Templates', 0, NULL, 1, ',', 'NAMED_FILTERS', 0) ;

-- Workflow Activity Steps
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned)
	values(76, 'ACTIVITIES_V', 'Activity Steps', 0, NULL, 1, ',','NAMED_FILTERS', 0) ;

-- Workflows
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned)
	values(77, 'WORKFLOWS_V', 'Workflows', 0, NULL, 1, ',', 'NAMED_FILTERS', 0) ;


-- Notification Packs
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values (81, 'NOTIFICATION_PACKS_V', 'Notification Packs', 0, '',1, 'NAMED_FILTERS') ;

-- Teams
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned)
	values(90, 'TEAMS_V', 'Teams', 0, NULL, 1, ',', 'NAMED_FILTERS', 0) ;


insert into record_configs (id, tname, description, cacheable, key, is_visible, category) values(97,'CASES','Pending Cases',0,'ID',1,
'NAMED_FILTERS');


--  Query Rule History ---
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(116,'QUERY_RULES_V','Query Rule History',0,'',0, '|') ;
--  *************** ---

-- Workflow Activity Output Steps --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned, is_spark_support) values (117, 'ACTIVITY_OUTPUTS', 'Activity Outputs', 0, NULL, 1, NULL, 'NAMED_FILTERS', 0, 0) ;

insert into record_configs (id,tname,description,cacheable,key,is_visible,delimeter,category,is_partitioned,is_spark_support) values (118, 'ACTIVITY_INPUTS', 'Activity Inputs', 0, NULL, 1, NULL, 'NAMED_FILTERS', 0, 0) ;

commit;

-- ************* --

--Record Views--
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(3,'Active Subscriber',3,'(ID > 1024 AND ACCOUNT_ID > 1024) AND SUBSCRIBER_TYPE = 0 AND STATUS IN (1,2)','MODIFIED_DATE DESC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(4,'Active Account',4,'(ID > 1024) AND ACCOUNT_TYPE = 0','MODIFIED_DATE DESC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(5,'Account Credit Details', 5,'','', 1, 0, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(8,'Actions',8,'','ID DESC', 1, 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(10,'Alarms',21,'STATUS IN (0,1,3,6)','MODIFIED_DATE DESC', 1, 0,1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(11,'Alerts',11,'','ID ASC', 0, 0, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(12,'Black List Subscriber',3,'ID > 1024 AND SUBSCRIBER_TYPE = 1 AND (ACCOUNT_ID > 1024 OR ACCOUNT_ID = 4)','MODIFIED_DATE DESC', 1, 1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(13,'Black List Account',4,'ID > 1024 AND ACCOUNT_TYPE = 1 ','MODIFIED_DATE DESC', 1, 1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(14,'Hotlist Groups',14,'IS_ACTIVE = 1','ID ASC', 1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(15,'Hotlist Values',15,'HOTLIST_KEY_ID = 0','ID ASC', 1, 0, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(16,'Open Alarms',22,'((USER_ID IS NULL OR USER_ID = '' '') AND STATUS IN (0,1,6))','MODIFIED_DATE DESC', 1, 0,1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(17,'Closed Alarms',23,'STATUS IN (2,4)','MODIFIED_DATE DESC', 1, 0,1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(18,'Assigned Alarms',24,'USER_ID IS NOT NULL AND USER_ID != '' '' AND STATUS NOT IN (2,4,8)','MODIFIED_DATE DESC', 1, 0,1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible,is_cell_specific, is_primary_view,is_logging_enabled) values(19,'Archived Alarms',16,'MODIFIED_DATE < ((select trunc(to_date(value, ''YYYY/MM/DD HH24:MI:SS'')) from configurations  where config_key=''CLEANUP.ALARMS.LAST_RUN_DATE'') - (select to_number(value) from configurations where config_key= ''CLEANUP.ALARMS.INTERVAL_IN_DAYS''))','MODIFIED_DATE DESC',0,1, 1,1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible,is_cell_specific, is_primary_view,is_pagination_enabled) values(20,'Archived Alerts',20,'','ID ASC',0,1, 1,0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(21,'Active And Suspended Subscriber',3,'SUBSCRIBER_TYPE = 0 AND STATUS IN (1,2)','MODIFIED_DATE DESC', 1, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(22,'Active Account For Subscriber Store',4,'ACCOUNT_TYPE = 0','MODIFIED_DATE DESC', 1, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible,is_cell_specific, is_pagination_enabled, is_logging_enabled) values(23,'Open Cases',17,'ID > 1024 AND STATUS = 0 ','MODIFIED_DATE DESC',0,1,1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by,is_visible,is_cell_specific,is_pagination_enabled, is_logging_enabled) values(24,'Pending Cases',97,'ID > 1024 AND STATUS = 1','MODIFIED_DATE DESC',0,1,1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible,is_cell_specific,is_pagination_enabled, is_logging_enabled) values(25,'Closed Cases',17,'ID > 1024 AND STATUS = 2','MODIFIED_DATE DESC',0,1,1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(26,'Alarms',21,'','MODIFIED_DATE DESC', 1, 0,1, 1, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(27,'Alarms',21,'','MODIFIED_DATE DESC', 0, 0,1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(28,'Invalid Subscriber Counter',28,'','', 0, 0, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(31,'Files Processed',34,'','END_TIME DESC', 1, 1, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(32,'Active Alerts',11,'alarm_id in (select alarms.id from alarms where status not in (2,4,8))','MODIFIED_DATE DESC', 1, 1, 1, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(35,'Auto Suspect Number Groups',25,'ID > 0','ID ASC', 1, 0, 0, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(36,'Auto Suspect Numbers',26,'ID > 0 AND ADD_REVIEW_FLAG <> 1 AND DELETE_REVIEW_FLAG = 0 ','ID ASC', 1, 0, 0, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(37,'Default Subscribers',3,'(ID > 1024) AND SUBSCRIBER_TYPE = 0 AND STATUS IN (1,2,3) AND ACCOUNT_ID < 1024','MODIFIED_DATE DESC', 1, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(40,'Named Filter Management',32,'NAME IS NOT NULL','ID ASC', 1, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(41,'ASN Addition Review',26,'ID > 0 AND ADD_REVIEW_FLAG = 1 AND DELETE_REVIEW_FLAG = 0','ID ASC', 1, 0, 0, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(42,'ASN Deletion Review',26,'ID > 0 AND ADD_REVIEW_FLAG = 0 AND DELETE_REVIEW_FLAG = 1','ID ASC', 1, 0, 0, 1, 1) ;
----My Alarms Record view config ----
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,is_pagination_enabled, is_primary_view, is_logging_enabled )values (96,'My Alarms',21,'STATUS IN (0,1,3,5,6)','MODIFIED_DATE DESC',0,1,1,0,1) ;

----My Team Alarms Record view config ----
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,is_pagination_enabled, is_primary_view, is_logging_enabled )values (116,'My Team Alarms',21,'STATUS IN (0,1,3,5,6)','MODIFIED_DATE DESC',0,1,1,0,1) ;


insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(50,'Case Closed Alarms',23,'STATUS IN (2,4)','MODIFIED_DATE DESC', 1, 0,1, 0, 0) ;



--
-- ************ RATE ************
--  RATE configuration Record 
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled,is_cell_specific) values(39,'Auto Threshold Configuration',31,'','ID ASC', 1, 1, 1, 1,1) ;

--  RATE view thresholds Record 
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled,is_cell_specific) values(43,'View Active Autothreshold', 33, 'AGGREGATION_VALUE is NOT NULL', 'THRESHOLD_MODIFIED_DATE DESC', 1, 1, 1, 1,1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(44,'View Inactive Autothreshold', 35, 'AGGREGATION_VALUE is NOT NULL', 'THRESHOLD_MODIFIED_DATE DESC', 1, 1, 1) ;
-- *******************************

-- Record View Configs for Rule Management --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view,is_logging_enabled) values(51,'Rule Templates',43,'IS_ACTIVE = 1 AND (CATEGORY != ''INLINE_RULES'' OR CATEGORY IS NULL)','KEY ASC', 1, 0,1, 1,1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(52,'Rules',44,'RULE_MODE=0 AND IS_ACTIVE = 1 AND (CATEGORY NOT IN (''FINGERPRINT_RULE'',''INLINE_RULES'',''STATISTICAL_RULE'') OR CATEGORY IS NULL)','KEY ASC', 1, 0,0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(53,'Rule History',48,'','KEY ASC', 1, 0,0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(136,'Rule History',116,'','KEY ASC', 1, 0,0, 1) ;

-- **************************************** --


-- Negative(Query) Rules --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(55,'Query Rules',46,'','ID ASC', 1, 0, 0, 1) ;
---------- ********************************************--


-- Scheduler --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(56,'Scheduler',47,'(CATEGORY = ''GENERAL'' OR CATEGORY = ''PRECHECK'')','ID ASC', 1, 0, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(57,'Negative Rule Scheduler',47,'CATEGORY = ''NEGATIVE_RULE''','ID ASC', 1, 0, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(130,'Scheduled Reports',110,'','ID ASC', 1, 0, 0, 1) ;

--USER MANAGEMENT (RANGER_GROUPS)

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(58,'Roles',41,'IS_ACTIVE = 1 AND ID NOT IN (0, 1)','ID DESC', 1, 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(59,'Users',40,'IS_ACTIVE = 1 AND ID NOT IN (0, 1, 2)','ID DESC', 1, 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(60,'Online Users',49,'IS_ACTIVE = 1 AND ID NOT IN (0, 1, 2)','ID DESC', 1, 0, 0) ;

--Negative Rule Data Record View
insert into record_view_configs (id, name, record_config_id) values(61, 'Negative Rule Data Record View', 50) ;


-- Configurations --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(68,'Configurations',57, 'IS_VISIBLE = 1','ID ASC', 1, 0, 0, 1) ;

-- Orgination Destination Links --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(69,'Origination Destination Links',58, '','ID ASC', 1, 0, 0, 1) ;

-- Rate Per Calls --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(70,'Rate Per Call',59, '','ID ASC', 1, 0, 0, 1) ;

-- Alarm Closure Types --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(72,'Fraud Types', 61, 'IS_ACTIVE = 1 AND FRAUD_TYPE = 2','ID ASC', 1, 0, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(73,'Non Fraud Types', 61, 'IS_ACTIVE = 1 AND FRAUD_TYPE = 4','ID ASC', 1, 0, 0, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(74,'Pending Fraud Types', 61, 'IS_ACTIVE = 1 AND FRAUD_TYPE = 5','ID ASC', 1, 0, 0, 1) ;

-- Case Reasons --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(78,'Case Reasons', 65, '', 'ID ASC', 1, 1, 0, 1) ;

-- Distance Time	
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view, where_clause) values(66, 'Geographically Infeasible Event Configs', 55, 'ID ASC', 1, 1, 1, '') ;

-- Holiday List
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view, where_clause) values(67, 'Holiday List', 56, 'ID ASC', 1, 1, 1, '') ;

-- Zone Codes --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(79,'Zone Codes', 66, '', 'ID ASC', 1, 1, 0, 1) ;

-- Country Codes --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(80,'Country Codes', 67, '', 'ID ASC', 1, 1, 0, 1) ;

-- Cell Site GEO --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(81,'Geographical Positions', 68, '', 'ID ASC', 1, 1, 0, 1) ;

-- Observation Summary Records--
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(82,'Observation Summary Records', 69, '', 'SUMMARY_START_TIME DESC', 1, 1, 0, 1) ;

-- Alarm Workflow Activity Logs
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled) values(86, 'Alarm Activity Logs', 73, NULL, 'LOG_DATE DESC', 0, 0, 1, 0, 0) ;

-- Alarm Workflow
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,
	is_pagination_enabled, is_primary_view, is_logging_enabled) values(87, 'Alarm Workflow', 74, NULL,
	'POSITION ASC', 0, 0, 1, 0, 0) ;

-- Workflow Activity Templates
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,
	is_pagination_enabled, is_primary_view, is_logging_enabled) values(88, 'Activity Templates', 75, null,
	'NAME ASC', 0, 0, 1, 0, 0) ;

-- Workflow Activity Steps
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,
	is_pagination_enabled, is_primary_view, is_logging_enabled) values(89, 'Activity Steps', 76, null,
	'ID DESC', 0, 0, 1, 0, 0) ;

-- Workflows
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,
	is_pagination_enabled, is_primary_view, is_logging_enabled) values(90, 'Workflows', 77, null,
	'ID DESC', 0, 0, 1, 0, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
	is_cell_specific, is_primary_view) values (137, 'Activity Outputs', 117, '', 'ID ASC', 1, 0, 0, 1) ;
	
insert into record_view_configs (id, name, is_cell_specific, record_config_id, where_clause, order_by, is_visible, 
	is_pagination_enabled, is_primary_view, is_logging_enabled, create_manual_alarm) 
	values (138,'Activity Inputs',0,118,null,'ID  ASC',1,1,1,1,0);
 
-- Notifications Packs 	
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view, where_clause) values(98, 'Notification Packs', 81, 'ID ASC', 1, 1, 1, 'is_active = 1') ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values (102, 'Active and Blacklisted Subscribers', 3, 'subscriber_type in (0,1)', 'MODIFIED_DATE DESC', 0, 0, 0, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values (103, 'Active and Blacklisted Accounts ', 4, '(ID > 1024) AND account_type in (0,1)', 'MODIFIED_DATE DESC', 0, 0, 0, 0) ;


insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(105,'Disconnected Subscriber',3,'(ID > 1024) AND STATUS = 3  AND SUBSCRIBER_TYPE = 0 AND (ACCOUNT_ID > 1024 OR ACCOUNT_ID = 4)','MODIFIED_DATE DESC', 1, 1, 0, 1) ;
-- SDR Rate --
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view,
	is_logging_enabled) values (107, 'SDR Rate', 85, 'ID ASC', 1, 1, 1, 1) ;

-- Hotlist Key --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(114,'Hotlist Entities With Keys', 92, '', 'ID DESC', 1, 1, 0, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(115,'Suspect Values For Key',15,'','ID DESC', 1, 0, 1, 1) ;

-- Teams
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific,
	is_pagination_enabled, is_primary_view, is_logging_enabled) values(113, 'Teams', 90, null,
	'ID DESC', 0, 0, 1, 0, 0) ;

---For Subscriber
------------ACCOUNT INFORMATION
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (136, 3, 'Account Name', 'ACCOUNT_NAME', 1, 1, 1, '', 3,'', 1, '', null, 1, 40, 8, '5.1', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (137, 3, 'Date of Activation of Account', '', 2, 0, 1, 'SMM.PRECHECK', 4,'', 2, '', null, 1, 11, null, '5.2', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values  (138, 3, 'Network', 'NETWORK_ID', 3, 0,(select decode(count(*),1 ,0 ,1) from networks),'', 1,'', 3, '', 10, 0, 20, null, '5.3', null  ) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (139, 3, 'First Name', '', 4, 0, 1, 'SMM.PRECHECK', 3,'', 4, '', null, 1, 40, 8, '5.4', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (140, 3, 'Middle Name', '', 5, 0, 1, 'SMM.PRECHECK', 3,'', 5, '', null, 1, 40, 8, '5.5', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (141, 3, 'Last Name', '', 6, 0, 1, 'SMM.PRECHECK', 3,'', 6, '', null, 1, 40, 8, '5.6', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (142, 3, 'Address Line 1', '', 7, 0, 1, 'SMM.PRECHECK', 3,'', 7, '', null, 1, 256, 19, '5.7', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (143, 3, 'Address Line 2', '', 8, 0, 1, 'SMM.PRECHECK', 3,'', 8, '', null, 1, 256, 19, '5.8', null) ; 
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (144, 3, 'Address Line 3', '', 9, 0, 1, 'SMM.PRECHECK', 3,'', 9, '', null, 1, 256, 19, '5.9', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (145, 3, 'City', '', 10, 0, 1, 'SMM.PRECHECK', 3,'', 10, '', null, 1, 40, 8, '5.10', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (146, 3, 'Post Code', '', 11, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA', 3,'', 11, '', null, 1, 20, 9, '5.11', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (147, 3, 'Credit Limit', '', 12, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA', 2,'', 40, '', null, 1, 40, null, '5.12', null) ;

------------SUBSCRIBER INFORMATION
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (148, 3, 'Phone No.', 'PHONE_NUMBER', 13, 0, 1, 'GR', 3,'', 12, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (149, 3, 'Date of Activation of Subscriber', 'SUBSCRIBER_DOA', 14, 0, 1, 'SMM.PRECHECK', 4,'', 13, '', null, 1, 11, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (150, 3, 'Home Phone No.', 'HOME_PHONE_NUMBER', 15, 0, 1, 'SMM.PRECHECK GR', 3,'', 14, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (151, 3, 'Office Phone No.', 'OFFICE_PHONE_NUMBER', 16, 0, 1, 'SMM.PRECHECK GR', 3,'', 15, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (152, 3, 'Contact Phone No.', 'CONTACT_PHONE_NUMBER', 17, 0, 1, 'SMM.PRECHECK GR', 3,'', 16, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (153, 3, 'MCN1', 'MCN1', 18, 0, 1, 'GR', 3,'', 17, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (154, 3, 'MCN2', 'MCN2', 19, 0, 1, 'GR', 3,'', 18, '', null, 1, 40, 1, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (155, 3, 'IMSI/ESN', 'IMSI', 20, 0, 1, 'SMM.PRECHECK GR', 3,'', 19, '', null, 1, 40, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (156, 3, 'Equipment ID', 'IMEI', 21, 0, 1, 'SMM.PRECHECK GR', 3,'', 20, '', null, 1, 40, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (157, 3, 'Connection Type', 'CONNECTION_TYPE', 22, 0, 1, 'GR', 1,'', 21, '', 5, 1, 20, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (158, 3, 'Groups', 'GROUPS', 23, 0, 1, 'GR', 7,'', 22, '', 27, 1, 256, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (159, 3, 'Services', 'SERVICES', 24, 0, 1, 'GR', 10,'', 23, '', 35, 1, 20, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (160, 3, 'QoS', 'QoS', 25, 0, 1, 'GR', 1,'', 24, '', null, 1, 2, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (161, 3, 'Product Type', 'PRODUCT_TYPE', 26, 0, 1, 'GR', 1,'', 25, '', 11, 1,20, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (162, 3, 'Action Indicator', '', 27, 0, 1, '', 1,'', 26, '', null, 0, 25, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (176, 3, 'Is New Record', '', 0, 0, 0, '', 1,'', 42, '', null, 0, 25, null, null, 14) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field , derivative_function) values (field_configs_seq.nextval, 3, 'First Call', 'FIRST_CALL', 0, 0, 1, '',1, '', 43 , '', 110, 1, 20 ,12 , null ,14)  ;

------------Account Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (163, 3, 'Rate Plan', '', 28, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE', 3,'', 27, '', null, 1, 256, 9, '5.13', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (164, 3, 'Expiry Date', '', 29, 0, 0, '', 4,'', 28, '', null, 1, 25, null, '5.14', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (165, 3, 'Grace Period ', '', 30, 0, 0, '', 1,'', 29, '', null, 1, 1, null, '5.15', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (166, 3, 'Activation Amount', '', 31, 0, 0, '', 2,'', 30, '', null, 1, 15, null, '5.16', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (167, 3, 'Details', 'ACCOUNT_ID', 0, 0, 0, '', 8,'', 35, '', null, 1, 20, null, null, 6) ;

------------Subscriber Derived Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (168, 3, 'Status', 'STATUS', 0, 0, 1, '', 1, '', 31, '', 19, 1, 20, null, null, 3) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (169, 3, 'ID', 'ID', 0, 0, 0, '', 8, '', 32, '', null, 1, 20, null, null, 5) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (170, 3, 'Age In Network', '', 0, 0, 1, 'GR ENTITY_DATA', 1, '', 33, 'TRUNC(SYSDATE) - TRUNC(SUBSCRIBER_DOA)', null, 1, 20, null, null, 4) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (171, 3, 'Subscriber Type', 'SUBSCRIBER_TYPE', 0, 0, 0, '', 1, '', 34, '', 554, 1, 20, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (172, 3, 'Static Credit Limit', '', 0, 0, 0, '', 2, '', 36, '', null, 1, 25, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (173, 3, 'Set Static Credit Limit Flag', '', 0, 0, 0, '', 1, '', 37, '', null, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (174, 3, 'Subscriber Record Sequence ID', '', 0, 0, 0, '', 8, '', 38, '', null, 1, 1, null, null, 31) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (175, 3, 'Modified Date', 'MODIFIED_DATE', 0, 0, 0, '', 4, '', 39, '', null, 1, 1, null, null, 20) ;

---- Account Credit Detail Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (177, 3, 'Bill Cycle Day', '', 32, 0, 0, '', 1,'', 44, '', null, 0, 1, null, '226.16', null) ;


--- For Account 
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (196, 4, 'Account Name', 'ACCOUNT_NAME', 1, 1, 1, 'GR', 3,'', 1, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (197, 4, 'Date of Activation', 'ACCOUNT_DOA', 2, 0, 1, 'SMM.PRECHECK', 4,'', 2, '', null, 1, 11, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (198, 4, 'Network', 'NETWORK_ID', 3, 0, (select decode(count(*),1,0,1) from networks),'', 1,'', 3, '', 10, 0, 20, null, null, null ) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (199, 4, 'First Name', 'FIRST_NAME', 4, 0, 1, 'SMM.PRECHECK GR', 3,'', 4, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (200, 4, 'Middle Name', 'MIDDLE_NAME', 5, 0, 1, 'SMM.PRECHECK GR', 3,'', 5, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (201, 4, 'Last Name', 'LAST_NAME', 6, 0, 1, 'SMM.PRECHECK GR', 3,'', 6, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (202, 4, 'Address Line 1', 'ADDRESS_LINE_1', 7, 0, 1, 'SMM.PRECHECK GR', 3,'', 7, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (203, 4, 'Address Line 2', 'ADDRESS_LINE_2', 8, 0, 1, 'SMM.PRECHECK GR', 3,'', 8, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (204, 4, 'Address Line 3', 'ADDRESS_LINE_3', 9, 0, 1, 'SMM.PRECHECK GR', 3,'', 9, '', null, 1, 256, 19, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (205, 4, 'City', 'CITY', 10, 0, 1, 'SMM.PRECHECK GR', 3,'', 10, '', null, 1, 40, 8, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (206, 4, 'Post Code', 'POST_CODE', 11, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA GR', 3,'', 11, '', null, 1, 20, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (207, 4, 'Credit Limit', 'CREDIT_LIMIT', 12, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA GR ENTITY_DATA', 2,'', 12, '', null, 1, 40, null, null, null) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (208, 4, 'Rate Plan', 'RATE_PLAN', 13, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE GR', 3,'', 13, '', null, 1, 256, 9, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (209, 4, 'Expiry Date', '', 14, 0, 0, 'GR', 4,'', 14, '', null, 1, 1, null, null, 20) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (210, 4, 'Grace Period ', '', 15, 0, 0, 'GR', 1,'', 15, '', null, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (211, 4, 'Activation Amount', '', 16, 0, 0, 'GR', 2,'', 16, '', null, 1, 15, null, '16.3', null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (215, 4, 'Groups', 'GROUPS', 17, 0, 1, 'GR', 7, '', 20, '', 516, 1, 256, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (218, 4, 'Parent Account ID', 'PARENT_ID', 0, 0, 0, '', 8, '', 30, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (219, 4, 'Hierarchy ID', 'HIERARCHY_ID', 0, 0, 0, '', 8, '', 31, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (221, 4, 'Status For Subscribers in Hierarchy', '', 0, 0, 0, '', 1, '', 34, '', null, 0, 20, null, null, 3) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (222, 4, 'Subscriber Type For Subscribers in Hierarchy', '', 0, 0, 0, '', 1, '', 35, '', 554, 0, 20, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (225, 4, 'Modified Date', 'MODIFIED_DATE', 0, 0, 0, '', 4, '', 36, '', null, 1, 1, null, null, 20) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (368, 4, 'Action Indicator', '', 20, 0, 0, '', 1,'', 50, '', null, 0, 25, null, null, 14) ;

------------Account Derived Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (212, 4, 'Account Type', 'ACCOUNT_TYPE', 0, 0, 0, '', 1, '', 17, '', 555, 1, 20, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (213, 4, 'FRD Indicator', 'FRD_INDICATOR', 0, 0, 0, '', 1, '', 18, '',553, 1, 38, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (214, 4, 'Account ID', 'ID', 0, 0, 0, '', 8, '', 19, '', null, 0, 1, null, null, 6) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (216, 4, 'Comments', 'COMMENTS', 0, 0, 0, '', 3, '', 21, '', null, 0, 512, null, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (217, 4, 'Age In Network', '', 0, 0, 1, 'GR ENTITY_DATA', 1, '', 29, 'TRUNC(SYSDATE) - TRUNC(ACCOUNT_DOA)', null, 1, 20, null, null, 4) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (220, 4, 'Static Credit Limit', '', 0, 0, 0, '', 2, '', 33, '', null, 1, 20, null, null, 27) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (226, 4, 'Account Record Sequence ID', '', 0, 0, 0, '', 8, '', 37, '', null, 1, 1, null, null, 5) ;

--- For Parent Account 
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2000, 12, 'Account Name', 'ACCOUNT_NAME', 1, 1, 1, 'GR', 3,'', 1, '', null, 1, 41, 8, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2001, 12, 'Date of Activation', 'ACCOUNT_DOA', 2, 0, 1, 'SMM.PRECHECK', 4,'', 2, '', null, 0, 11, null, null, 20) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values ( 2002, 12, 'Network', 'NETWORK_ID', 3, 0, (select decode(count(*),1,0,1) from networks), '', 1,'', 3, '', 10, 0, 23, null, null, (select decode(count(*),1,23,14) from networks) ) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2003, 12, 'First Name', 'FIRST_NAME', 4, 0, 1, 'SMM.PRECHECK GR', 3,'', 4, '', null, 1, 41, 8, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2004, 12, 'Middle Name', 'MIDDLE_NAME', 5, 0, 1, 'SMM.PRECHECK GR', 3,'', 5, '', null, 1, 41, 8, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2005, 12, 'Last Name', 'LAST_NAME', 6, 0, 1, 'SMM.PRECHECK GR', 3,'', 6, '', null, 1, 41, 8, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2006, 12, 'Address Line 1', 'ADDRESS_LINE_1', 7, 0, 1, 'SMM.PRECHECK GR', 3,'', 7, '', null, 1, 257, 9, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2007, 12, 'Address Line 2', 'ADDRESS_LINE_2', 8, 0, 1, 'SMM.PRECHECK GR', 3,'', 8, '', null, 1, 257, 9, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2008, 12, 'Address Line 3', 'ADDRESS_LINE_3', 9, 0, 1, 'SMM.PRECHECK GR', 3,'', 9, '', null, 1, 257, 9, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2009, 12, 'City', 'CITY', 10, 0, 1, 'SMM.PRECHECK GR', 3,'', 10, '', null, 1, 41, 8, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2010, 12, 'Post Code', 'POST_CODE', 11, 0, 1, 'SMM.PRECHECK CMM.STATIC.FORMULA GR', 3,'', 11, '', null, 1, 21, 9, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2011, 12, 'Credit Limit', 'CREDIT_LIMIT', 12, 0, 1, 'SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA GR', 3,'', 12, '', null, 1, 40, 9, null, 19) ;

insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2012, 12, 'Rate Plan', 'RATE_PLAN', 13, 0, 1, 'CMM.STATIC.RULE CMM.DYNAMIC.RULE GR', 3,'', 13, '', null, 1, 256, 9, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2013, 12, 'Expiry Date', '', 14, 0, 0, 'GR', 4,'', 14, '', null, 1, 1, null, null, 20) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2014, 12, 'Grace Period ', '', 15, 0, 0, 'GR', 1,'', 15, '', null, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2015, 12, 'Activation Amount', '', 16, 0, 0, 'GR', 2,'', 16, '', null, 1, 15, null, null, 27) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2016, 12, 'Groups', 'GROUPS', 17, 0, 1, 'GR', 7, '', 20, '', 28, 1, 257, null, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2017, 12, 'Parent Account ID', 'PARENT_ID', 0, 0, 0, '', 8, '', 30, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2018, 12, 'Hierarchy ID', 'HIERARCHY_ID', 0, 0, 0, '', 8, '', 31, '', null, 0, 20, null, null, 26) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2025, 12, 'Modified Date', 'MODIFIED_DATE', 0, 0, 0, '', 4, '', 32, '', null, 1, 1, null, null, 20) ;

------------Account Derived Information
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2019, 12, 'Account Type', 'ACCOUNT_TYPE', 0, 0, 0, '', 1, '', 17, '', 555, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2020, 12, 'FRD Indicator', 'FRD_INDICATOR', 0, 0, 0, '', 1, '', 18, '', 553, 1, 1, null, null, 14) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2021, 12, 'Account ID', 'ID', 0, 0, 0, '', 8, '', 19, '', 21, 0, 1, null, null, 6) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2022, 12, 'Comments', 'COMMENTS', 0, 0, 0, '', 3, '', 21, '', null, 0, 1, null, null, 19) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (2023, 12, 'Age In Network', '', 0, 0, 1, 'GR', 1, '', 29, 'TRUNC(SYSDATE) - TRUNC(ACCOUNT_DOA)', null, 1, 20, null, null, 4) ;


--- For Account Credit Details
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (250, 5, 'Account Name', 'ACCOUNT_NAME', 1, 0, 1, '', 3, '', 1, '', null, 0, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (251, 5, 'Account ID', 'ACCOUNT_ID', 2, 0, 0, '', 8, '', 2, '', null, 0, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (252, 5, 'Static Credit Limit', 'STATIC_CREDIT_LIMIT', 3, 0, 1, 'SMM.AG.POSTPAID CMM GR ENTITY_DATA', 2, '', 3, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (253, 5, 'Dynamic Credit Limit', 'DYNAMIC_CREDIT_LIMIT', 4, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 4, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (254, 5, 'Total Slippage', 'TOTAL_SLIPPAGE', 5, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 5, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (255, 5, 'Outstanding Amount', 'OUTSTANDING_AMOUNT', 6, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 6, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (256, 5, 'Total Payment', 'TOTAL_PAYMENT', 7, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 7, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (257, 5, 'Unbilled Amount', 'UNBILLED_AMOUNT', 8, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 8, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (258, 5, 'Last Due Date', 'LAST_DUE_DATE', 9, 0, 1, 'SMM.AG.POSTPAID CMM', 4, '', 9, '', null, 1, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (259, 5, 'Last Pay Date', 'LAST_PAY_DATE', 10, 0, 1, 'SMM.AG.POSTPAID CMM', 4, '', 10, '', null, 1, 1, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (260, 5, 'Last Paid Amount', 'LAST_PAID_AMOUNT', 11, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 11, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (261, 5, 'No of Suspensions', 'NO_OF_SUSPENSIONS', 12, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 12, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (262, 5, 'No of Full Payments', 'NO_OF_FULL_PAYMENTS', 13, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 13, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (263, 5, 'No of Part Payments', 'NO_OF_PART_PAYMENTS', 14, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 14, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (264, 5, 'No of Slippages', 'NO_OF_SLIPPAGES', 15, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 15, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (265, 5, 'Bill Cycle Day', 'BILL_CYCLE_DAY', 16, 0, 1, 'SMM.AG.POSTPAID CMM GR', 1, '', 16, '', null, 0, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (266, 5, 'Exposure', 'EXPOSURE', 17, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 17, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (267, 5, 'Percentage Exposure', 'PERCENTAGE_EXPOSURE', 18, 0, 1, 'SMM.AG.POSTPAID CMM GR', 2, '', 18, '', null, 1, 25, null, null, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (268, 5, 'Credit Expiry Date', 'CREDIT_EXPIRY_DATE', 19, 0, 1, 'SMM.AG.POSTPAID CMM', 4, '', 19, '', null, 1, 1, null, null, null) ;
 

----Audit Trail Log-----
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (500, 8, 'Log Id', 'ID', 1, 1, 1, 0, '', '', 20, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (501, 8, 'Date', 'LOGGED_DATE', 2, 2, 4, 0, '', '', 20, null, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (502, 8, 'Log Source', 'SOURCE', 3, 3, 1, 0, '', '', 20, 62, 1, 9, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter, live_tree_ds) values  (503, 8, 'Event Code', 'EVENT_CODE', 4, 3, 9, 0, '', '', 20, 39, 1, 7, 0, 'AuditLogEventCode.get_source_event_list') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (504, 8, 'Entity Type', 'ENTITY_TYPE', 5, 4, 1, 0, '', '', 20, 20, 1, null, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (505, 8, 'Entity Value', 'ENTITY_VALUE', 6, 5, 3, 1, '', '', 20, null, 1, 10, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (506, 8, 'Action', 'ACTION', 7, 6, 3, 0, '', '', 20, null, 1, 9, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (507, 8, 'Computer', 'IP_ADDRESS', 8, 7, 3, 0, '', '', 20, null, 1, 11, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (508, 8, 'User', 'USER_ID', 9, 8, 3, 0, '', '', 20, 513, 1, 16, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (509, 8, 'Entity Id', 'ENTITY_ID', 10, 9, 1, 0, '', '', 20, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field,width, translation_id, is_visible, reg_exp_id, is_filter) values ( 510, 8, 'Network', 'NETWORK_ID', 11, 10, 7, 0, '', '', 100, 515, (select decode(count(*),1,0,1) from networks), null, 0 ) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 8, 'User Role', 'USER_GROUP', 12, 11, 7, 0, '', '', 100, '106', 1, 16, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 8, 'Parameters', 'PARAMETERS', 13, 12, 3, 0, '', '', 100, '', 0, 10, 0) ;

----------Field Configs for Alarms-----------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values ( 400, 10, 'Network','NETWORK_ID',1,1,1,0,'','',40,'10',(select decode(count(*),1,0,1) from networks),null,(select decode(count(*),1,0,1) from networks),''  ); 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (401, 10, 'Id', 'ID',2,0,1,0,'','',40,null,0,null,0,'18') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (402, 10, 'Reference ID', 'REFERENCE_ID',3,2,8,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (403, 10, 'Case Name', 'CASE_ID',4,0,1,0,'','',40, 34,1,null,0,'15') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (404, 10, 'Alert Count', 'ALERT_COUNT',5,3,1,0,'','',40,null,1,24,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (405, 10, 'Created Date','CREATED_DATE',6,4,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (406, 10, 'Modified Date','MODIFIED_DATE',7,5,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (407, 10, 'Status', 'STATUS',8,6,1,0,'GR CR','',40,26,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (408, 10, 'Owner', 'USER_ID',9,0,3,0,'','',64,514,1,null,0,'16') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (409, 10, 'Score', 'SCORE',10,0,1,0,'GR CR','',40,null,1,13,1,'17') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (410, 10, 'Value', 'VALUE',11,7,2,0,'GR CR','',40,null,1,12,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (411, 10, 'Record Count', 'CDR_COUNT',12,8,1,0,'','',40,null,1,24,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (412, 10, 'Pending Time', 'PENDING_TIME',13,9,4,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (413, 10, 'Reference Type', 'REFERENCE_TYPE',14,10,1,0,'','',40,42,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (414, 10, 'Reference Value', 'REFERENCE_VALUE',15,11,3,1,'','',40,null,1,19,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (415, 10, 'Is Visible', 'IS_VISIBLE',16,12,6,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (416, 10, 'Closure Type','DISPLAY_VALUE',17,13,3,0,'','',256,119,1,null,0,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (417, 10, 'Rule Name','RULE_IDS',18,14,7,0,'','',256,25,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (418, 10, 'Owner Type', 'OWNER_TYPE',19,0,1,0,'','',20,null,0,null,0,'') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (419, 10, 'Fraud Types','FRAUD_TYPES',20,0,7,0,'','',4000,60,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (420, 10, 'Date of Activation', '', 21, 0, 4, 0, '', '', 11, null, 0, null, 0, '35');


insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (421, 10, 'First Assigned/Investigated Time', 'ASSIGNED_DATE', 22, 15, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (422, 10, 'Alarm Analysis Time', '', 23, 16, 1, 0, '', '', 40, 9, 1, null, 1, '36');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (423, 10, 'Workflow Assigned Time', 'WF_ASSIGNED_DATE', 24, 17, 4, 0, '', '', 40, null, 1, null, 1, '');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (424, 10, 'Workflow Modified Time', 'WF_MODIFIED_DATE', 25, 18, 4, 0, '', '', 40, null, 1, null, 1, '');

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (425, 10, 'Fraud Type Tag', 'FRAUD_TYPE_TAG', 26, 19, 7, 0, '', '', 256, 119, 1, null, 1, '');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,2080,10,'22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,2081,10,'23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,2082,10,'24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,2083,10,'25') ;
--insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field,live_tree_ds) values  (420, 10, 'Rule Tags','RULE_TAGS',21,0,9,0,'','',4000,61,1,null,1,'','','Tag.get_tag_set_for_rule') ;

----------Field Configs for Alarm View-----------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (460, 21, 'Network','NETWORK_ID',1,1,1,0,'','',40,'10',(select decode(count(*),1,0,1) from networks),null,1,'' ) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (461, 21, 'Id', 'ID',2,0,1,0,'','',40,null,0,null,0,'18') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (462, 21, 'Reference ID', 'REFERENCE_ID',3,2,8,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (463, 21, 'Case Name', 'CASE_ID',4,0,1,0,'','',40,34,1,16,1,'15') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (464, 21, 'Alert Count', 'ALERT_COUNT',5,3,1,0,'','',40,null,1,13,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (465, 21, 'Created Date','CREATED_DATE',6,4,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (466, 21, 'Modified Date','MODIFIED_DATE',7,5,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (467, 21, 'Status', 'STATUS',8,6,1,0,'GR CR','',40,26,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (468, 21, 'Owner', 'USER_ID',9,0,3,0,'','',64,514,1,16,1,'16') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (469, 21, 'Score', 'SCORE',10,0,1,0,'GR CR','',40,null,1,13,1,'17') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (470, 21, 'Value', 'VALUE',11,7,2,0,'GR CR','',40,null,1,12,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (471, 21, 'Record Count', 'CDR_COUNT',12,8,1,0,'','',40,null,1,13,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (473, 21, 'Reference Type', 'REFERENCE_TYPE',14,10,1,0,'','',40,42,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (474, 21, 'Reference Value', 'REFERENCE_VALUE',15,11,3,1,'','',40,null,1,25,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (475, 21, 'Is Visible', 'IS_VISIBLE',16,12,6,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (477, 21, 'Account Name','ACCOUNT_NAME',18,14,3,0,'','',256,null,1,8,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (478, 21, 'Subscriber Name','SUBSCRIBER_NAME',19,15,3,0,'','',256,null,1,8,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (479, 21, 'Subscriber Groups','GROUPS',20,16,7,0,'','',256,27,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (480, 21, 'Outstanding Amount','OUTSTANDING_AMOUNT',21,17,2,0,'','',256,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (481, 21, 'Rule Name','RULE_IDS',22,18,7,0,'','',256,25,0,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (482, 21, 'Fraud Types','FRAUD_TYPES',23,0,7,0,'','',256,60,0,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field,live_tree_ds) values  (483, 21, 'Rule Tags','RULE_TAGS',24,0,9,0,'','',256,61,0,null,0,'','','Tag.get_tag_set_for_rule') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (484, 21, 'Owner Type', 'OWNER_TYPE',25,0,1,0,'','',20,93,0,null,1,'') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (field_configs_seq.nextval, 21, 'Pending Time','PENDING_TIME',26,0,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (485, 21, 'First Assigned/Investigated Time', 'ASSIGNED_DATE', 27, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (486, 21, 'Alarm Analysis Time', 'ANALYSIS_DURATION', 28, 0, 1, 0, '', '', 40, 9, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (487, 21, 'Workflow Assigned Time', 'WF_ASSIGNED_DATE', 29, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (488, 21, 'Workflow Modified Time', 'WF_MODIFIED_DATE', 30, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (489, 21, 'Fraud Type Tag', 'FRAUD_TYPE_TAG', 32, 0, 7, 0, '', '', 256, 119, 1, null, 1, '');

-----------------Field Configs for Archived Alarms ----------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (5400,16, 'Network','NETWORK_ID',1,1,1,0,'','',40,'10',(select decode(count(*),1,0,1) from networks),null,(select decode(count(*),1,0,1) from networks),'' ) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5401,16, 'Id', 'ID',2,0,1,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5402,16, 'Reference ID', 'REFERENCE_ID',3,2,8,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5403,16, 'Case Name', 'CASE_NAME',4,0,3,0,'','',40,null,1,18,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5404,16, 'Alert Count', 'ALERT_COUNT',5,3,1,0,'','',40,null,1,13,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5405,16, 'Created Date','CREATED_DATE',6,4,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5406,16, 'Modified Date','MODIFIED_DATE',7,5,4,0,'','',40,null,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5407,16, 'Status', 'STATUS',8,6,1,0,'GR CR','',40,26,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5408,16, 'Owner', 'USER_ID',9,0,3,0,'','',64,514,1,16,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5409,16, 'Score', 'SCORE',10,0,1,0,'GR CR','',40,null,1,13,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5410,16, 'Value', 'VALUE',11,7,2,0,'GR CR','',40,null,1,12,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5411,16, 'Record Count', 'CDR_COUNT',12,8,1,0,'','',40,null,1,13,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5412,16, 'Pending Time', 'PENDING_TIME',13,9,4,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5413,16, 'Reference Type', 'REFERENCE_TYPE',14,10,1,0,'','',40,42,1,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5414,16, 'Reference Value', 'REFERENCE_VALUE',15,11,3,1,'','',40,null,1,19,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5415,16, 'Is Visible', 'IS_VISIBLE',16,12,6,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5416,16, 'Account Name', 'ACCOUNT_NAME',17,0,3,0,'','',40,null,1,8,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5417,16, 'Subscriber Name', 'SUBSCRIBER_NAME',18,0,3,0,'','',40,null,1,8,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5418,16, 'Subscriber Groups', 'SUBSCRIBER_GROUP',19,0,7,0,'','',40,27,1,10,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5419,16, 'Outstanding Amount', 'OUTSTANDING_AMOUNT',20,0,2,0,'','',40,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5420,16, 'Rule Name','RULE_IDS',21,0,7,0,'','',256,25,0,null,0,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5421, 16, 'Fraud Types','FRAUD_TYPES',22,0,7,0,'','',256,60,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field,live_tree_ds) values  (5422, 16, 'Rule Tags','RULE_TAGS',23,0,9,0,'','',256,61,0,null,0,'','','Tag.get_tag_set_for_rule') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5423, 16, 'Owner Type', 'OWNER_TYPE',24,0,1,0,'','',20,94,0,null,1,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (5424, 16, 'Closure Type','DISPLAY_VALUE',25,15,3,0,'','',256,119,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5500, 16, 'First Assigned/Investigated Time', 'ASSIGNED_DATE', 26, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5501, 16, 'Alarm Analysis Time', 'ANALYSIS_DURATION', 27, 0, 1, 0, '', '', 40, 9, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5502, 16, 'Workflow Assigned Time', 'WF_ASSIGNED_DATE', 28, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5503, 16, 'Workflow Modified Time', 'WF_MODIFIED_DATE', 29, 0, 4, 0, '', '', 40, null, 1, null, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 16, 'Declared Fraud Value', 'DECLARED_FRAUD_VALUE', 30, 0, 2, 0, '', '', 20, null, 1, null, 0, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (5504, 16, 'Fraud Type Tag', 'FRAUD_TYPE_TAG', 31, 0, 7, 0, '', '', 256, 119, 1, null, 1, '');


-----------------Field Configs for Alerts----------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (429, 11, 'Network','NETWORK_ID',17,17,1,0,'','',40,'10',(select decode(count(*),1,0,1) from networks),null,0,'' ) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (430, 11, 'Id', 'ID',1,0,1,0,'','',40,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (431, 11, 'Alarm Id', 'ALARM_ID',2,2,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (432, 11, 'Rule Name', 'EVENT_INSTANCE_ID',3,3,1,1,'','',40,69,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (433, 11, 'Value', 'VALUE',4,4,2,0,'CR','',40,null,1,12,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (434, 11, 'Record Count', 'CDR_COUNT',5,5,1,0,'','',40,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (435, 11, 'Repeat Count', 'REPEAT_COUNT',6,6,1,0,'','',40,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (436, 11, 'Created Date','CREATED_DATE',7,7,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (437, 11, 'Modified Date','MODIFIED_DATE',8,8,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (438, 11, 'Score', 'SCORE',9,9,1,0,'CR','',40,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (439, 11, 'Aggregation Type','AGGREGATION_TYPE',10,10,1,0,'','',40,528,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (440, 11, 'Aggregation Value', 'AGGREGATION_VALUE',11,11,3,0,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (441, 11, 'Is Smart Pattern', 'IS_SMART_PATTERN',12,12,6,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (442, 11, 'Is Part Of Smart Pattern', 'IS_PART_OF_SMART_PATTERN',13,13,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (443, 11, 'Is Visible', 'IS_VISIBLE',14,14,6,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (444, 11, 'Start Day', 'START_DAY',15,15,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (445, 11, 'End Day', 'END_DAY',16,16,1,0,'','',40,null,0,null,0) ;

-----------------Field Configs for Archived Alerts----------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5425, 20, 'Id', 'ID',1,1,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5426, 20, 'Alarm Id', 'ALARM_ID',2,2,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5427, 20, 'Rule Name', 'EVENT_INSTANCE_ID',3,3,1,1,'','',40,69,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5428, 20, 'Value' , 'VALUE',4,4,2,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5429, 20, 'Record Count', 'CDR_COUNT',5,5,1,0,'','',40,null,1,13,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5430, 20, 'Repeat Count', 'REPEAT_COUNT',6,6,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5431, 20, 'Created Date','CREATED_DATE',7,7,4,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5432, 20, 'Modified Date','MODIFIED_DATE',8,8,4,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5433, 20, 'Score', 'SCORE',9,9,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5434, 20, 'Aggregation Type','AGGREGATION_TYPE',10,10,1,0,'','',40,12,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5435, 20, 'Aggregation Value', 'AGGREGATION_VALUE',11,11,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5436, 20, 'Is Smart Pattern', 'IS_SMART_PATTERN',12,12,6,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5437, 20, 'Is Part Of Smart Pattern', 'IS_PART_OF_SMART_PATTERN',13,13,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5438, 20, 'Is Visible', 'IS_VISIBLE',14,14,6,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (5439, 20, 'Start Day', 'START_DAY',15,15,1,0,'','',40,null,0,null,0) ;

-----------------Field Configs for Case---------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (6400, 17, 'Network', 'NETWORK_ID',1,1,1,0,'','',40,10,(select decode(count(*),1,0,1) from networks),null,1 ) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6401, 17, 'Name', 'NAME',2,2,3,0,'','',40,null,1,18,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6402, 17, 'Description', 'DESCRIPTION',3,3,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6403, 17, 'Owner', 'OWNER_ID',4,4,3,0,'','',64,514,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6404, 17, 'Creator ID', 'CREATOR_ID',5,1,3,0,'','',64,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6405, 17, 'Created Date', 'CREATED_DATE',6,6,4,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6406, 17, 'Modified Date', 'MODIFIED_DATE',7,7,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6407, 17, 'Status', 'STATUS',8,8,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6408, 17, 'Reason', 'REASON_ID',9,9,1,0,'','',40,32,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6409, 17, 'Pending Time','PENDING_TIME',10,10,4,0,'','',40,null,0,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6410, 17, 'Alarm Count', 'ALARM_COUNT',11,11,1,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (6411, 17, 'Id', 'ID',12,12,1,0,'','',40,null,0,null,0) ;
--------------Field Configs for Pending Cases-----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval , 97,'Network', 'NETWORK_ID',1,1,1,0,'','',40,10,(select decode(count(*),1,0,1) from networks),null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 97, 'Name','NAME',2,2,3,0,'','',40,null,1,18,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Description','DESCRIPTION',3,3,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Owner','OWNER_ID',4,4,3,0,'','',64,514,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Creator ID','CREATOR_ID',5,1,3,0,'','',64,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval , 97, 'Created Date','CREATED_DATE',6,6,4,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 97, 'Modified Date','MODIFIED_DATE',7,7,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Status','STATUS',8,8,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Reason','REASON_ID',9,9,1,0,'','',40,32,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Pending Time','PENDING_TIME',10,10,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Alarm Count','ALARM_COUNT',11,11,1,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval, 97, 'Id','ID',12,12,1,0,'','',40,null,0,null,0) ;

insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values(field_record_config_map_seq.nextval,5,97,'1');

---------------Field Configs for Hotlist Groups----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (1430, 14, 'Name', 'NAME',1,1,3,0,'','',40,null,1,9,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (1431, 14, 'Description', 'DESCRIPTION',2,2,3,0,'','',40,null,1,null,0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values ( 1432, 14, 'Networks', 'NETWORKS',3,3, (select decode(count(*),1,1,7) from networks),0,'','',40,10,(select decode(count(*),1,0,1) from networks),null,0 ) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, data_type, is_expandable, ds_category, query_field, width, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 14, 'Networks', 'ID',4,7,0,'','',1024,0,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 14, 'Category', 'IS_PER_KEY',5,4,1,0,'','',40,88 ,1,null,1) ;

---------------Field Configs for Hotlist Values----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2430, 15, 'Entity Start Value', 'VALUE',1,1,3,1,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2439, 15, 'Entity End Value', 'END_VALUE',2,2,3,1,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2431, 15, 'Entity Type', 'ENTITY_TYPE',3,3,1,0,'','',40,89,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2432, 15, 'Source', 'SOURCE',4,4,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2433, 15, 'Reason', 'REASON',5,5,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2434, 15, 'User Name', 'USER_ID',6,6,1,0,'','',40,102,0,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2435, 15, 'Groups', 'GROUPS',7,7,7,0,'','',256,96,1,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2436, 15, 'Expiry Date ','EXPIRY_DATE',8,8,4, '', 0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values ( 2437, 15, 'Networks', 'NETWORK_ID',9,9,7,0,'','',256,10,(select decode(count(*),1,0,1) from networks),null,0 );
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2438, 15, 'ID', 'ID',10,10,1,0,'','',20,'',0,null,0) ; 
---------------Field Configs for Invalid Subscriber Counter----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (2450, 28, 'Reference ID', 'REFERENCE_ID',1,1,8,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (2451, 28, 'Aggregation Value', 'AGGREGATION_VALUE',2,2,3,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (2452, 28, 'Aggregation Type', 'AGGREGATION_TYPE',3, 3,1,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (2453, 28, 'Time Stamp', '', 4, 0,4, 0, '', '',  1,null, 0,0,'', 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field,width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (2455, 28, 'Network','',5,0,1,0,'','',40,null,(select decode(count(*),1,0,1) from networks),null,0,23 ) ;

--------------Field Configs for Hotlist ASN Groups--------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2600, 25, 'ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2601, 25, 'ASN Group Name','NAME',2,2,3, '', 0,'','',20,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2602, 25, 'Description','DESCRIPTION',3,3,3, '', 0,'','',20,null,1,18,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2603, 25, 'Start Range','RANGE_START_INDICATOR',4,4,1,'',0,'','',20,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2604, 25, 'End Range','RANGE_END_INDICATOR',5,5,1,'',0,'','',20,null,1,null,0) ;

--------------Field Configs for SDR Rate--------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval,85,'ID','ID',1,1,1,0,'','',null,null,0,1,null);
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval,85,'Network', 'NETWORK', 2, 0, 7, 0, '','', null, 10, 1, 1, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval,85,'Start Date','START_DATE',3,3,4,0,'','',null,null,1,1,null);
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval,85,'End Date','END_DATE',4,4,4,0,'','',null,null,1,1,null);
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval,85,'SDR Value','SDR_VALUE',5,5,2,0,'','',null,null,1,1,null);

--------------Field Configs for ASN Entities --------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2610, 26, 'ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2611, 26, 'ASN Phone Number','PHONE_NUMBER',2,2,3, '', 1,'','',20,null,1,1,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2612, 26, 'ASN Group','ASN_GROUP_ID',3,3,1, '', 0,'','',20,43,1,18,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2613, 26, 'ASN Score','SCORE',4,4,1, '', 0,'','',5,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2614, 26, 'Last Modified Time','LAST_MODIFICATION_TIME',5,5,4, '', 0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2615, 26, 'Excluded For Score Recalculation','DELETION_FLAG',6,6,1, '', 0,'','',5,6,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2616, 26, 'Call Volume','TOTAL_CALL_VOLUME',7,7,1, '', 0,'','',20,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2617, 26, 'Fraudulent Call Volume','TOTAL_FRAUD_CALL_VOLUME',8,8,1, '', 0,'','',20,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2618, 26, 'Entry Time','FIRST_ENTRY_TIME',9,9,4, '', 0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2619, 26, 'Modification Count','MODIFICATION_COUNT',10,10,1, '', 0,'','',20,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Date Of Activation','DOA',11,11,4, '', 0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Subscriber ID','SUBSCRIBER_ID',12,12,1, '', 0,'','',20,null,0,null,0) ; 

---------------Field Configs for Opened Alarms
insert into field_configs (select field_configs_seq.nextval, 22, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive from field_configs where record_config_id = 21 and database_field not like 'DISPLAY_VALUE') ;

---------------Field Configs for Closed Alarms
insert into field_configs (select field_configs_seq.nextval, 23, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive from field_configs where record_config_id = 21 and database_field not like 'PENDING_TIME' and database_field not like 'RULE_IDS' and database_field not like 'FRAUD_TYPES') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 23, 'Closure Type','DISPLAY_VALUE',17,13,3,0,'','',119,119,1,10,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 23, 'Rule Name','RULE_IDS',22,18,7,0,'','',256,69,0,null,0,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 23, 'Declared Fraud Value', 'DECLARED_FRAUD_VALUE', 31, 0, 2, 0, '', '', 20, null, 1, null, 0, '');
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 23, 'Fraud Types','FRAUD_TYPES',23,0,7,0,'','',256,60,1,'',1,'','') ;

---------------Field Configs for Assigned Alarms
insert into field_configs (select field_configs_seq.nextval, 24, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive from field_configs where record_config_id = 21 and database_field not like 'OWNER_TYPE') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 24, 'Owner Type', 'OWNER_TYPE',25,0,1,0,'','',20,94,0,null,1,'') ;

---------------Field Configs For Audit Files Processed-----------

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Record Name', 'RECORD_NAME',1,0,3,0,'','',40,null,1,0,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Status', 'STATUS',2,0,3,0,'','',40,null,0,0,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'File Name', 'FILE_NAME',3,0,3,0,'','',256,null,1,0,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Start Time', 'START_TIME',4,0,4,0,'','',40,null,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'End Time', 'END_TIME',5,0,4,0,'','',40,null,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Total Record Count', 'TOTAL_COUNT',6,0,1,0,'','',40,null,1,13,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Accepted Record Count', 'ACCEPTED',7,0,1,0,'','',40,null,1,13,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Rejected Record Count', 'REJECTED',8,0,1,0,'','',40,null,1,13,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 34, 'Id','ID',9,0,1,0,'','',20,null,0,null,0) ; 

--------------Field Configs for Called To Called By Phone Numbers --------------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Phone Number','PHONE_NUMBER',1,1,3, '', 0,'','',20,null,0,null,0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Record Type','RECORD_TYPE',2,2,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Call Count','CALL_COUNT',3,3,1, '', 0,'','',20,null,0,null,0);
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Min Day Of Year','MIN_DAY_OF_YEAR',4,4,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Max Day Of Year','MAX_DAY_OF_YEAR',5,5,1, '', 0,'','',20,null,0,null,0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, 
						translation_id, is_visible, reg_exp_id, is_filter) values  
						(field_configs_seq.nextval, 27, 'Date Of Activation','DOA',6,6,4, '', 0,'','',20,null,0,null,0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 27, 'Subscriber ID','SUBSCRIBER_ID',7,7,1, '', 0,'','',20,null,0,null,0) ; 
 



--------------Field Configs for Named Filters -----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 32, 'Filter ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 32, 'Filter Name','NAME',2,2,3, '', 0,'','',256,null,1,9,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 32, 'Entity','RECORD_CONFIG_ID',3,3,1, '', 0,'','',20,49,1,null,1) ; 
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 32, 'Description','DESCRIPTION',4,4,3, '', 0,'','',4000,null,1,9,1) ;

-- ************ RATE ************
--  RATE configuration Record 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2636, 31, 'ID', 'ID', 6, 6, 8, '', 0, '', '', 20, 46, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2637, 31, 'Rule Name', 'RULE_KEY', 1, 1, 1, '', 1, '', '', 40, 25, 1, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2638, 31, 'Aggregation Type', 'AGGREGATION_TYPE', 2, 2, 1, '', 0, '', '', 20, 12, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2639, 31, 'Lower Range', 'LOWER_RANGE', 3, 3, 1, '', 0, '', '', 20, null, 1, 13, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2640, 31, 'Higher Range', 'HIGHER_RANGE', 4, 4, 1, '', 0, '', '', 20, null, 1, 13, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2641, 31, 'Tolerance', 'TOLERANCE', 5, 5, 1, '', 0, '', '', 20, null, 1, 13, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2643, 31, 'Is Enabled', 'IS_CHECKED', 7, 7, 6, '', 0, '', '', 20, 44, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2644, 31, 'Network ID', 'NETWORK_ID', 8, 8, 7, '', 0, '', '', 20, null, 0, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2660, 31, 'Rule Id', 'RULE_ID', 9, 9, 8, '', 0, '', '', 40, 25, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2661, 31, 'Groups', 'ID', 10, 10, 7, '', 0, '', '', 40, 46, 1, null, 0) ; 

--  RATE view thresholds Record 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2645, 33, 'ID', 'ID', 1, 1, 8, '', 0, '', '', 40, null, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2646, 33, 'Rule Name', 'RULE_KEY', 2, 2, 3, '', 1, '', '', 40, 25, 1, 9, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2647, 33, 'Rule Id', 'RULE_ID', 3, 3, 8, '', 0, '', '', 40, 25, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2648, 33, 'Rule Description', 'RULE_DESCRIPTION', 4, 4, 3, '', 0, '', '', 256, null, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2649, 33, 'Rule Version', 'RULE_VERSION', 5, 5, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2650, 33, 'Rule Network ID', 'NETWORK_ID', 6, 6, 7, '', 0, '', '', 20, 10, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2651, 33, 'Threshold ID', 'THRESHOLD_ID', 7, 7, 8, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2652, 33, 'Threshold Version', 'THRESHOLD_VERSION', 8, 8, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2653, 33, 'Threshold Value', 'THRESHOLD_VALUE', 9, 9, 2, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2654, 33, 'Threshold Duration', 'THRESHOLD_DURATION', 10, 10, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2655, 33, 'Threshold Status ', 'THRESHOLD_CHANGED_STATUS', 11, 11, 1, '', 0, '', '', 20, 48, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2656, 33, 'Expiry Date', 'THRESHOLD_EXPIRY_DATE', 12, 12, 4, '', 0, '', '', 40, null, 1, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2657, 33, 'Modified Date', 'THRESHOLD_MODIFIED_DATE', 13, 13, 4, '', 0, '', '', 40, null, 1, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2658, 33, 'Aggregation Type', 'AGGREGATION_TYPE', 14, 14, 1, '', 0, '', '', 20, 115, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2659, 33, 'Aggregation Value', 'AGGREGATION_VALUE', 15, 15, 3, '', 0, '', '', 40, null, 1, 0, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (3659, 33, 'Is Active', 'IS_ACTIVE', 16, 16, 3, '', 0, '', '', 20, 559, 1, null, 1) ; 

-- RATE view invalid thresholds

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2765, 35, 'ID', 'ID', 1, 1, 8, '', 0, '', '', 40, null, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2766, 35, 'Rule Name', 'RULE_KEY', 2, 2, 3, '', 1, '', '', 40, 25, 1, 9, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2767, 35, 'Rule Id', 'RULE_ID', 3, 3, 8, '', 0, '', '', 40, 25, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2768, 35, 'Rule Description', 'RULE_DESCRIPTION', 4, 4, 3, '', 0, '', '', 256, null, 0, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2769, 35, 'Rule Version', 'RULE_VERSION', 5, 5, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2770, 35, 'Rule Network ID', 'NETWORK_ID', 6, 6, 7, '', 0, '', '', 20, 10, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2771, 35, 'Threshold ID', 'THRESHOLD_ID', 7, 7, 8, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2772, 35, 'Threshold Version', 'THRESHOLD_VERSION', 8, 8, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2773, 35, 'Threshold Value', 'THRESHOLD_VALUE', 9, 9, 2, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2774, 35, 'Threshold Duration', 'THRESHOLD_DURATION', 10, 10, 1, '', 0, '', '', 20, null, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2775, 35, 'Threshold Status ', 'THRESHOLD_CHANGED_STATUS', 11, 11, 1, '', 0, '', '', 20, 48, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2776, 35, 'Expiry Date', 'THRESHOLD_EXPIRY_DATE', 12, 12, 4, '', 0, '', '', 40, null, 1, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2777, 35, 'Modified Date', 'THRESHOLD_MODIFIED_DATE', 13, 13, 4, '', 0, '', '', 40, null, 1, null, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2778, 35, 'Aggregation Type', 'AGGREGATION_TYPE', 14, 14, 1, '', 0, '', '', 20, 115, 1, null, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (2779, 35, 'Aggregation Value', 'AGGREGATION_VALUE', 15, 15, 3, '', 0, '', '', 40, null, 1, 0, 1) ; 

-- Field Configs for User Management
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4000, 40, 'ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4001, 40, 'User Name','USER_NAME',2,2,3, '', 0,'','',64,null,1,10,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4002, 40, 'Roles', 'GROUP_NAME', 3, 3, 7, '', 0, '', '', 20, 106, 1, 0, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4003, 40, 'Default Role','DEFAULT_ROLE',4,4,3, '', 0,'','',20,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4004, 40, 'Networks','NETWORK',5,5,7, '', 0,'','',20,10,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4005, 40, 'Hashed Password','HASHED_PASSWORD',6,6,3, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4006, 40, 'Description','DESCRIPTION',7,7,3, '', 0,'','',20,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4007, 40, 'First Name','FIRST_NAME',8,8,3, '', 0,'','',40,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4008, 40, 'Middle Name','MIDDLE_NAME',9,9,3, '', 0,'','',40,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4009, 40, 'Last Name','LAST_NAME',10,10,3, '', 0,'','',40,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4010, 40, 'Contact Number','CONTACT_NO',11,11,3, '', 0,'','',20,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4011, 40, 'Contact Address','CONTACT_ADDRESS',12,12,3, '', 0,'','',20,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4012, 40, 'Email ID','EMAIL_ID',13,13,3, '', 0,'','',80,null,1,22,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4013, 40, 'Password Date','PASSWORD_DATE',14,14,4, '', 0,'','',20,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4014, 40, 'Password Validity (days)','DAYS_TO_EXPIRE',15,15,1, 1, 0,'','',20,104,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4015, 40, 'Is Locked','IS_LOCKED',16,16,1, '', 0,'','',20,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4016, 40, 'Is Online','IS_ONLINE',17,17,1, '', 0,'','',20,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width,translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 40, 'Machine Bounded','IP_BOUNDED',18,18,1, '', 0,'','',20,6,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width,translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 40, 'Permissible Machines (ip/hostname)','PERMISSIBLE_IPS',19,19,3, '', 0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 40, 'Session Expiry (minutes)','SESSION_EXPIRY',20,20,1, 1, 0,'','',20,104,1,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 40, 'Login Expiry Date','LOGIN_EXPIRY',21,21,4, 0, 0,'','',20,null,1,null,1) ; 


--------View Online Users----
insert into field_configs (select field_configs_seq.nextval, 49, name, database_field, position, is_expandable, is_visible,ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive from field_configs where record_config_id = 40) ;


-- Field Configs for Group Filter Management
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4050, 41, 'ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4051, 41, 'Role Name','NAME',2,2,3, '', 0,'','',20,null,1,10,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (4052, 41, 'Description','DESCRIPTION',3,3,3, '', 0,'','',20,null,1,null,0) ;



-- FieldConfigs for Rule Management - Rule Templates --

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3001, 43, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_expandable,is_filter,width,reg_exp_id) values (3002, 43, 'Template Name', 'NAME', 1, 1, 3, 2, 0,1,256,14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3003, 43, 'Key', 'KEY', 0, 0, 1, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (3004, 43, 'Data Streams', 'DATA_STREAMS', 2, 1, 7, 4, 526,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (3005, 43, 'Aggregate On', 'AGGREGATION_TYPE', 3, 1, 1, 5, 12,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (3006, 43, 'Function', 'FUNCTION', 4, 1, 1, 6, 66,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (3007, 43, 'Network', 'NETWORK_ID', 5, 1, 7, 8, 10,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (3008, 43, 'Fraud Types', 'FRAUD_TYPES', 6, 1, 7, 7, 60,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3009, 43, 'Tags', 'TAGS', 0, 0, 7, 9) ; 

-- FieldConfigs for Rule Management - Rule --

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3021, 44, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (3022, 44, 'Rule Name', 'NAME', 1, 1, 3, 2, 1, 256,14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (3023, 44, 'Parent Template', 'PARENT_TEMPLATE', 2, 1, 3, 3, 1, 256,14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3024, 44, 'KEY', 'KEY', 0, 0, 1, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3025, 44, 'Data Streams', 'DATA_STREAMS', 3, 1, 7, 5, 526, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3026, 44, 'Aggregate On', 'AGGREGATION_TYPE', 4, 1, 1, 6, 12, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3027, 44, 'Function', 'FUNCTION', 5, 1, 1, 7, 66, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (3028, 44, 'Network', 'NETWORK_ID', 6, 1, 7, 11, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter, reg_exp_id) values (3029, 44, 'Status', 'STATUS', 7, 1, 3, 8, 105, 1, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id,translation_id, is_filter, reg_exp_id) values (3030, 44, 'User', 'USERNAME', 8, 1, 3, 9, 107, 1, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3031, 44, 'Tags', 'TAGS', 0, 0, 7, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (5007, 44, 'Description', 'DESCRIPTION', 0, 1, 3, 12) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (FIELD_CONFIGS_SEQ.NEXTVAL, 44, 'User Tags', 'USER_DEFINED_TAGS', 9, 1, 7, 13, 112, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (FIELD_CONFIGS_SEQ.NEXTVAL, 44, 'Notification Pack', 'NOTIFICATION_PACKS', 10, 1, 7, 14, 74, 1) ;



-- Negative(Query) Rules

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3040, 46, 'ID', 'ID', 0, 0, 1, 1) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (3041, 46, 'Rule Name', 'NAME', 1, 1, 3, 2, 1, 41,14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3042, 46, 'Description', 'DESCRIPTION', 2, 1, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (3043, 46, 'Severity', 'SEVERITY', 3, 1, 1, 4, 1, 3, 13) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3044, 46, 'Query', 'QUERY', 4, 1, 3, 5) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3067, 46, 'Network', 'NETWORK_ID', 5, 1, 7, 6, 10, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval,46, 'Status', 'STATUS', 6, 1, 3, 8) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width) values(field_configs_seq.nextval,46,'Hour Of Day','HOUR_OF_DAY',7,1,3,9,70);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width,translation_id) values(field_configs_seq.nextval,46,'Day Of Week','DAY_OF_WEEK',8,1,7,10,50,33);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width) values(field_configs_seq.nextval,46,'Day Of Month','DAY_OF_MONTH',9,1,3,11,50);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width,translation_id) values(field_configs_seq.nextval,46,'Month Of Year','MONTH_OF_YEAR',10,1,7,12,50,31);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 46, 'Aggregate On', 'AGGREGATION_TYPE', 11, 1, 1, 13, 12, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 46, 'User', 'USERNAME', 12, 1, 3, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (FIELD_CONFIGS_SEQ.NEXTVAL, 46, 'Notification Pack', 'NOTIFICATION_PACKS', 13, 1, 7, 15, 74, 1) ;

-- Scheduler

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id) values (3045, 47, 'ID', 'ID', 0, 0, 1, 1, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, is_visible, is_filter, reg_exp_id, derivative_function, translation_id) values (3046, 47, 'Job Name', 'JOB_NAME', 2, 1, 3, 0, '', '', 256, 1, 1, 0, '', 561);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (3048, 47, 'Process Time', 'PROCESS_TIME', 2, 1, 1, 3, 1, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id) values (3049, 47, 'Schedule Type', 'SCHEDULE_TYPE', 3, 0, 1, 4, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (3050, 47, 'Hourly', 'HOURLY', 4, 1, 7, 5, 1, 0, 20, 114) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (3039, 47, 'Minute', 'MINUTE', 5, 1, 7, 12, 1, 0, 20, 123) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (3051, 47, 'Day of Week', 'DAY_OF_WEEK', 6, 5, 7, 0, '', '', 20, 33, 1, 1, '', '');
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (3052, 47, 'Day of Month', 'DAY_OF_MONTH', 6, 1, 7, 7, 1, 0, 20, 113) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (3053, 47, 'Month of Year', 'MONTH_OF_YEAR', 8, 7, 7, 0, '', '', 20, 31, 1, 1, '', '');
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (3054, 47, 'Parameter', 'PARAMETER', 8, 0, 3, 9, 0, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, translation_id) values (3055, 47, 'Network', 'NETWORK', 9, 1, 7, 10, 0, 0, 515) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id) values (3056, 47, 'Category', 'CATEGORY', 10, 0, 3, 11, 0, 0) ;

--Scheduled Reports--
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter,	reg_exp_id) values (field_configs_seq.nextval, 110 ,'ID', 'ID', 1, 1, 1, 1, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,ds_category, query_field, width, is_visible, is_filter, reg_exp_id, derivative_function,translation_id) values (field_configs_seq.nextval,110, 'Report Name', 'REPORT_NAME',2, 2, 3, 0, '', '', 256, 1, 1, 0, '',518);
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, is_visible, is_filter, reg_exp_id, derivative_function,translation_id) values (field_configs_seq.nextval,110, 'User Name', 'USER_NAME',3,3 ,3, 0, '', '', 256, 1, 1, 0, '',97);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval,110, 'Process Time', 'PROCESS_TIME',4 , 1, 1,4 , 1, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (field_configs_seq.nextval,110,'Hourly', 'HOURLY',6 , 1, 7, 5, 1, 0, 20, 114) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (field_configs_seq.nextval,110,'Minute', 'MINUTE',5 , 1, 7,6, 1, 0, 20, 123) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval,110,'Day of Week', 'DAY_OF_WEEK',7,7, 7, 0, '', '', 20, 33, 1, 1, '', '');
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width, translation_id) values (field_configs_seq.nextval,110, 'Day of Month', 'DAY_OF_MONTH',8, 1, 7,8 , 1, 0, 20, 113) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function) values (field_configs_seq.nextval,110, 'Month of Year', 'MONTH_OF_YEAR',9 ,9 , 7, 0, '', '', 20, 31, 1, 1, '', '');
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, translation_id) values (field_configs_seq.nextval,110, 'Network', 'NETWORK',10 ,0, 7,10 , 0, 0, 515) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval,110, 'Parameter', 'PARAMETER',11 , 0, 3,11, 0, 0, 256) ;

insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION)
	        values (field_record_config_map_seq.nextval,5,110,'10'); 
-- FieldConfigs for Rule Management - Rule History --

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3057, 48, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3058, 48, 'Rule Name', 'NAME', 1, 1, 3, 2) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3059, 48, 'KEY', 'KEY', 0, 0, 1, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (3060, 48, 'Data Streams', 'DATA_STREAMS', 2, 1, 7, 4, 15) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (3061, 48, 'Aggregate On', 'AGGREGATION_TYPE', 3, 1, 1, 5, 12) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (3062, 48, 'Function', 'FUNCTION', 4, 1, 1, 6, 66) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id)  values( 3063, 48, 'Network', 'NETWORK_ID', 5, (select decode(count(*),1,0,1) from networks), 7, 7, 10 ) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3064, 48, 'Version', 'VERSION', 6, 1, 1, 8) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3065, 48, 'Status', 'STATUS', 7, 1, 3, 9) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3066, 48, 'User', 'USERNAME', 8, 1, 3, 10) ; 

-- Field Configs for Negative Rule Data Record --
insert into field_configs(id, record_config_id, name, database_field, position, data_type, field_id) 
		values (field_configs_seq.nextval, 50, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, data_type, field_id) 
		values (field_configs_seq.nextval, 50, 'Aggregation Value', 'AGGREGATION_VALUE', 2, 3, 2) ; 
insert into field_configs(id, record_config_id, name, database_field, position, data_type, field_id) 
		values (field_configs_seq.nextval, 50, 'Network ID', 'NETWORK_ID', 3, 1, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, data_type, field_id) 
		values (field_configs_seq.nextval, 50, 'Rule ID', 'RULE_ID', 4, 1, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, data_type, field_id, derivative_function)
		values (field_configs_seq.nextval, 50, 'Cellsite ID', 'CELLSITE_ID', '', 8, 5, 10) ;
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
		values (field_record_config_map_seq.nextval,74,50,'2');


-- Analyst Actions --
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view, where_clause) values(63, 'Analyst Actions', 52, 'ID ASC', 1, 1, 1, 'IS_VISIBLE=1 AND IS_ACTIVE=1 AND category = ''RECOMMENDED_ACTION'' ') ;

--Free Numbers And Special Numbers---
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view) values(64, 'Free Numbers', 53, 'ID ASC', 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view) values(65, 'Special Numbers', 54, 'ID ASC', 1, 1, 1) ;

---------------Field Configs for Profile Counter----------------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values (field_configs_seq.nextval, 51, 'Reference ID', 'REFERENCE_ID',1,1,8,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 51, 'Aggregation Value', 'AGGREGATION_VALUE',2,2,3,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values  (field_configs_seq.nextval, 51, 'Aggregation Type', 'AGGREGATION_TYPE',3, 3,1,0,'','',40,null,0,null,0,'') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 51, 'Time Stamp', '', 4, 0,4, 0, '', '',  1,null, 0,0,'', 32) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field,width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function) values ( field_configs_seq.nextval, 51, 'Network','',5,0,1,0,'','',40,null,(select decode(count(*),1,0,1) from networks),null,0,23 ) ;

-- Analyst Actions

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 52, 'Name', 'NAME', 1, 0, 3, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id) 
		values 
			(field_configs_seq.nextval, 52, 'Description', 'DESCRIPTION', 2, 0, 3, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 52, 'Network', 'NETWORK', 3, 0, 7, 0, '', '', null, 10, 1, 1, '') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 52, 'ID', 'ID', 4, 0, 1, 0, '', '', null, null, 0, 0, 0) ;

-- Free Numbers---

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 53, 'ID', 'ID', 0, 0, 1, 0, '', '', null, null, 0, 0, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id) 
		values 
			(field_configs_seq.nextval, 53, 'Free Number', 'FREE_NUMBER', 1, 1, 3, 0, '', '', null, null, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 53, 'Description', 'DESCRIPTION', 2, 2, 3, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
			is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  
		values 
			(field_configs_seq.nextval, 53, 'Network', 'NETWORK', 3, 3, 7, 0, '', '', null, 10, 1, 1, null) ;


-----Distance_unit Configuration-------------

insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DISTANCE_UNIT','KMS');

-- Special Numbers---

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'ID', 'ID', 0, 0, 1, 0, '', '', null, null, 0, 0, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id) values (field_configs_seq.nextval, 54, 'Special Number', 'SPECIAL_NUMBER', 1, 1, 3, 0, '', '', null, null, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Minimum Chargeable Unit [PSTN] (sec/KB)', 'PSTN_MIN_CHARGEABLE_UNIT', 2, 2, 1, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Description', 'DESCRIPTION', 3, 3, 3, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Minimum Charge [PSTN]', 'PSTN_MIN_CHARGE', 4, 4, 2, 0, '', '', null, null, 1, 1, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Service Category', 'SERVICE_CATEGORY', 5, 5, 7, 0, '', '', null, 50, 1, 1, '') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Pulse[PSTN] (sec/KB)', 'PSTN_PULSE', 6, 6, 1, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Service Type', 'CALL_TYPE', 7, 7, 7, 0, '', '', null, 63, 1, 1, '') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Rate [PSTN]', 'PSTN_RATE', 8, 8, 2, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Extra Charge', 'EXTRA_CHARGE', 9, 9, 2, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Minimum Chargeable Unit [Air] (sec/KB)', 'MIN_CHARGEABLE_UNIT', 10, 10, 1, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Minimum Charge[Air]', 'MIN_CHARGE', 11, 11, 2, 0, '', '', null, null, 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'PMN', 'PMN', 12, 12, 3, 0, '', '', null, 92, 1, 1, 0) ;
			
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Pulse[Air] (sec/KB)', 'PULSE', 13, 13, 1, 0, '', '', null, null, 1, 1, 0) ;
			
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Rate[Air]', 'RATE', 14, 14, 2, 0, '', '', null, null, 1, 1, 0) ;
			
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Network', 'NETWORK', 15, 15, 7, 0, '', '', null, 10, 1, 1, '') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 54, 'Type of Match', 'MATCH_TYPE', 16, 16, 7, 0, '', '', 5,108, 1, 1, null);

-- Rate Types ---

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 62, 'ID', 'ID', 1, 1, 1, 0, '', '', null, null, 0, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 62, 'Rate Type', 'RATE_TYPE', 2, 2, 3, 0, '', '', null, null, 1, 1, 34) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 62, 'Description', 'DESCRIPTION', 3, 3, 3, 0, '', '', null, null, 1, 1, 10) ;

-- Rate Plan ---

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'ID', 'ID', 1, 1, 1, 0, '', '', null, null, 0, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge [PSTN-Friends'||'&'||'Family]', 'ff_pstn_min_charge', 2, 2, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge [Air-Friends'||'&'||'Family]', 'ff_min_charge', 3, 3, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge Unit [PSTN] (sec/KB)', 'pstn_min_chargeable_unit', 4, 4, 1, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge Unit [Air] (sec/KB)', 'min_chargeable_unit', 5, 5, 1, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate Plan', 'rate_plan', 6, 6, 3, 0, '', '', null, null, 1, 1, 8) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Pulse [PSTN-Friends'||'&'||'Family] (sec/KB)', 'ff_pstn_pulse', 7, 7, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Pulse [Air-Friends'||'&'||'Family] (sec/KB)', 'ff_pulse', 8, 8, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge [PSTN]', 'pstn_min_charge', 9, 9, 2, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge [Air]', 'min_charge', 10, 10, 2, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate Plan ID', 'rate_plan_id', 11, 11, 3, 0, '', '', null, null, 1, 1, 8) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate [PSTN-Friends'||'&'||'Family]', 'ff_pstn_rate', 12, 12, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate [Air-Friends'||'&'||'Family]', 'ff_rate', 13, 13, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Pulse [PSTN] (sec/KB)', 'pstn_pulse', 14, 14, 1, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Pulse [Air] (sec/KB)', 'pulse', 15, 15, 1, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Service Type', 'call_type', 16, 16, 7, 0, '', '', null, 63, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate [PSTN]', 'pstn_rate', 17, 17, 2, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate [Air]', 'rate', 18, 18, 2, 0, '', '', null, null, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Zone Code', 'zone_code', 19, 19, 3, 0, '', '', null, null, 1, 0, 10) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Origination Number Type', 'org_number_type', 20, 20, 7, 0, '', '', null, 50, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Destination Number Type', 'dest_number_type', 21, 21, 7, 0, '', '', null, 54, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Rate Type', 'rate_type', 22, 22, 3, 0, '', '', null, null, 1, 1, 8) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Extra Charge', 'extra_charge', 23, 23, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Roamer Flag', 'roamer_flag', 24, 24, 7, 0, '', '', null, 51, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Service Band', 'service_band', 25, 25, 7, 0, '', '', null, 53, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge Unit [Air-Friends'||'&'||'Family] (sec/KB)', 'ff_min_chargeable_unit', 26, 26, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Min Charge Unit [PSTN-Friends'||'&'||'Family] (sec/KB)', 'ff_pstn_min_chargeable_unit', 27, 27, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'PMN', 'PMN', 28, 28, 3, 0, '', '', null, 92, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 63, 'Call Category', 'call_category', 29, 29, 3, 0, '', '', null, 2, 1, 1, null) ;

-- Default Rate --

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 64, 'ID', 'ID', 1, 1, 1, 0, '', '', null, null, 0, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 64, 'Service Category', 'rate_type', 2, 2, 7, 0, '', '', null, 50, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 64, 'Service Type', 'call_type', 3, 3, 7, 0, '', '', null, 63, 1, 1, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 64, 'Pulse[Air] (Sec/KB)', 'pulse', 4, 4, 3, 0, '', '', null, null, 1, 0, null) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id)  values(field_configs_seq.nextval, 64, 'Rate', 'rate', 5, 5, 2, 0, '', '', null, null, 1, 0, null) ;
------------------
-- *********** Configurations***********************

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 57, 'ID','ID',1,1,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 57, 'Configuration Key','CONFIG_KEY',2,2,3, '', 0,'','',50,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 57, 'Value','VALUE',3,3,3, '', 0,'','',50,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 57, 'Is Visible','IS_VISIBLE',4,4,1, '', 0,'','',20,null,0,null,0) ;


-- ************* Origination Destination Links ***************
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 58,'ID','ID',6,0,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 58,'Origination Geographic Code','ORG_GEO_CODE',4,4,3, '', 0,'','',80,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 58,'Destination Geographic Code','DEST_GEO_CODE',5,5,3, '', 0,'','',80,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 58,'Zone Code','ZONE_CODE',3,3,3, '', 0,'','',50,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 58,'National Flag','NATIONAL_FLAG',1,1,3, '', 0,'','',50,51,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 58,'Country Code','LETTER_CODE',2,2,3, '', 0,'','',50,64,1,null,1) ;




-- **************** Rate Per Calls ********************
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Service Category','SERVICE_CATEGORY',1,1,7, '', 0,'','',50,50,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Service Band','SERVICE_BAND',2,2,7, '', 0,'','',50,53,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Service Number','SERVICE_NUMBER',3,3,3, '', 0,'','',50,null,1,10,1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Air Amount Per call','AIR_AMOUNT_PER_CALL',4,4,2, '', 0,'','',50,null,1,12,1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'PSTN Amount Per call','PSTN_AMOUNT_PER_CALL',5,5,2, '', 0,'','',50,null,1,12,1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Extra Charge','EXTRA_CHARGE',6,6,2, '', 0,'','',50,null,1,12,1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Description','DESCRIPTION',7,7,3, '', 0,'','',50,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Service Provider','SERVICE_PROVIDER',8,8,7, '', 0,'','',50,51,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Service Type','CALL_TYPE',9,9,7, '', 0,'','',50,63,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'ID','ID',10,10,1, '', 0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'PMN','PMN',11,11,3, '', 0,'','',50,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable,ds_category, query_field, width,
 translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 59,'Type of Match','MATCH_TYPE',12,12,7, '', 0,'','',5,108,1,null,1)
  ;


-- Case Reasons --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 65,'ID','ID', 1, 1, 1, '', 0, '', '', 20, null, 0, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 65, 'Reason', 'REASON', 2, 2, 3, '', 0, '', '', 50, null, 1, 0, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 65, 'Description', 'DESCRIPTION', 3, 3, 3, '', 0, '', '', 50, null, 1, 0, 1) ;

-- **************** Alarm Closure Types ********************
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 61,'ID','ID',1,0,1, '', 0,'','',20,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 61,'Name','NAME',2,1,3, '', 0,'','',50,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 61,'Description','DESCRIPTION',3,2,3, '', 0,'','',50,1,null,0) ;


-- Geographically Infeasible Event Configs
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 55, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id, width)  values (field_configs_seq.nextval, 55, 'Network', 'NETWORK_ID', 5, 1, 7, 0, 1, 1, 0, 10, 10) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 55, 'Road Speed (km/hr)', 'ROAD_SPEED', 3, 2, 1, '', 0, '', '', 20, null, 1, 0, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 55, 'Air Speed (km/hr)', 'AIR_SPEED', 4, 3, 1, '', 0, '', '', 20, null, 1, 0, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format, is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 55, 'Threshold Time To Consider AIR Speed', 'THRESHOLD_TIME', 6, 4, 1, '', 0, '', '', 20, 9, 1, null, 1) ;

-- Holiday List
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 56, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 56, 'Date', 'HOLIDAY_DATE', 2, 0, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 56, 'Description', 'DESCRIPTION', 3, 0, 3, 0, 1, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id, width)  values (field_configs_seq.nextval, 56, 'Network', 'NETWORK_ID', 4, 0, 7, 0, 1, 0, 0, 10, 10) ;

-- Zone Code --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 66, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, width, reg_exp_id)  values (field_configs_seq.nextval, 66, 'Zone Code', 'ZONE_CODE', 2, 0, 3, 0, 1, 1, 41, 4) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, width, reg_exp_id)  values (field_configs_seq.nextval, 66, 'Description', 'DESCRIPTION', 3, 0, 3, 0, 1, 1, 41, 0) ;

-- Country Code --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 67, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 67, 'Country Code', 'COUNTRY_CODE', 2, 0, 3, 0, 1, 1, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 67, 'Description', 'DESCRIPTION', 3, 0, 3, 0, 1, 1, 0, 50) ;

-- Cell Site GEO --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Cell Site ID', 'CELL_SITE_ID', 2, 1, 3, 0, 1, 1, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Longitude', 'LONGITUDE', 3, 2, 3, 0, 1, 0, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Latitude', 'LATITUDE', 4, 3, 3, 0, 1, 0, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Cell Location', 'CELL_LOCATION', 5, 4, 3, 0, 1, 1, 0, 30) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Radius Coverage', 'RADIUS_COVERAGE', 6, 5, 1, 0, 1, 1, 0, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 68, 'Time Zone', 'TIME_ZONE', 7, 6, 3, 0, 1, 1, 0, 40) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id, width)  values (field_configs_seq.nextval, 68, 'Network', 'NETWORK_ID', 8, 7, 1, 0, 1, 0, 0, 10, 20) ;

-- Observation Summary Records --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Aggregation Value', 'AGGREGATION_VALUE', 2,	2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Record Config ID', 'RECORD_CONFIG_ID', 5, 5, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Count', 'COUNT', 6, 6, 1, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Value', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'ID', 'ID', 9, 0, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 69, 'Summary End Time', 'SUMMARY_END_TIME', 10, 10, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 69, 'Rule Name', 'RULE_KEY',11, 11, 1, 1, 1, 1, 0, 69) ;


-- Notification Packs
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 81, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0, 20) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 81, 'Name', 'NAME', 2, 1, 3, 0, 1, 1, 0, 20) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id, width)  values (field_configs_seq.nextval, 81, 'Notification Type', 'NOTIFICATION_TYPE_ID', 3, 2, 7, 0, 1, 1, 0, 80, 10) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id, width)  values (field_configs_seq.nextval, 81, 'Network', 'NETWORK_ID', 4, 3, 7, 0, 1, 0, 0, 10, 10) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, width)  values (field_configs_seq.nextval, 81, 'Is Active', 'IS_ACTIVE', 5, 4, 1, 0, 0, 0, 0, 20) ;



insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 81, '4') ;


-- Hotlist Key --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 92, 'ID', 'ID', 1, 0, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id,width) values (field_configs_seq.nextval, 92, 'Value', 'VALUE', 2, 0, 3, 0, 1, 1,26, 20) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id,width,translation_id)  values (field_configs_seq.nextval, 92, 'Key type', 'KEY_CATEGORY', 3, 0, 3, 0, 1, 0, 0, 50,89) ;
insert into field_configs(id, record_config_id, name, database_field, field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter)values(field_configs_seq.nextval, 92, 'Entity Type','ENTITY_TYPE',4,0,1,0,'','',40,89,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type,is_expandable,is_visible,is_filter, reg_exp_id,width,translation_id)  values (field_configs_seq.nextval, 92, 'Networks','NETWORK', 5, 0, 7, 0, 0, 0, 0, 50,10) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter)values(field_configs_seq.nextval, 92,'User Name', 'USER_ID',6,0,3,0,'','',40,102,0,null,0) ;

-- Entries for bringing up 4 new columns for the hotlist view page on UI
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 15, 'Created Date','CREATED_DATE', 11,11,4,0,'','',40,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 15, 'Created By','CREATED_BY', 12,12,1,0,'','',40,102,1,null,0,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 15, 'Modified Date','MODIFIED_DATE', 13,13,4,0,'','',40,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 15, 'Modified By','MODIFIED_BY', 14,14,1,0,'','',40,102,1,null,0,'','') ;

-- Entries added for bringing up 4 new columns for hotlist vew entity page on UI
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 92, 'Created Date','CREATED_DATE',7,7,4,0,'','',40,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 92, 'Created By','CREATED_BY', 8,8,1,0,'','',40,102,1,null,0,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 92, 'Modified Date','MODIFIED_DATE', 9,9,4,0,'','',40,null,1,null,1,'','') ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter,derivative_function,associated_field) values  (field_configs_seq.nextval, 92, 'Modified By','MODIFIED_BY', 10,10,1,0,'','',40,102,1,null,0,'','') ;


------------------------------------------- Expandable Field Maps entries START ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type)
	values (5, 'Account Details', 3, 'ACCOUNT_ID', 4, 'ID', 0, 1, 'RECORD_VIEW GR STR RULE', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (13, 'Account Subscriber Details', 4, 'ID', 3, 'ACCOUNT_ID', 0, 24, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (14, 'Account Credit Details', 4, 'ACCOUNT_NAME', 5, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (15, 'Account Credit Details', 4, 'ID', 5, 'ACCOUNT_ID', 0, 7, '');

--For SubscriberStore
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (20, 'Previous Subscriber Details', 3, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 9999, '') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (21, 'Previous Blacklisted Details', 3, 'PHONE_NUMBER, ACCOUNT_NAME', 12, 'PHONE_NUMBER, ACCOUNT_NAME', 0, 9999, '') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (22, 'Previous Account Details', 3, 'ACCOUNT_NAME', 22, 'ACCOUNT_NAME', 0, 9999, '') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (23, 'Previous Blacklisted Account Details', 3, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 9999, '') ;




--For Alarm
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (52, 'Alarm-IMSI-Subscriber', 10, 'REFERENCE_ID', 102, 'ID', 0, 4, 'RECORD_VIEW');

--For Hotlist
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (53, 'Active Subscriber Details', 15, 'VALUE', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (54, 'IMSI Subscriber', 15, 'VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (55, 'IMEI Subscriber', 15, 'VALUE', 3, 'IMEI', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (56, 'Account Name Subscriber', 15, 'VALUE', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2000, 'Active Subscriber Details', 15, 'END_VALUE', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2001, 'IMSI Subscriber', 15, 'END_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2002, 'IMEI Subscriber', 15, 'END_VALUE', 3, 'IMEI', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (2003, 'Account Name Subscriber', 15, 'END_VALUE', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
--Subscriber - Account Info
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (58, 'Subscriber-ActiveAccount', 3, 'ACCOUNT_NAME', 4, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (59, 'Subscriber-Black Listed Account', 3, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 7, '');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (60, 'Account-ActiveSubscriber', 4, 'ACCOUNT_NAME', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (61, 'Account-Black Listed Subscriber', 4, 'ACCOUNT_NAME', 12, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (169, 'Account-Disconnected Subscriber', 4, 'ACCOUNT_NAME', 105, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');



-- For Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (64, 'Alarm-IMSI-Subscriber', 10, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--For  Archived Alarm
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) 
	values (68, 'Alarm-IMSI-Subscriber', 19, 'REFERENCE_ID', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

-- For Archived Alarm Aggregation Type
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key,  is_new_view, dest_key_type, category) 
	values (71, 'Alarm-IMSI-Subscriber', 19, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--- For Alarm Admin ( Open Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (77, 'Alarm-IMSI-Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');

--- For Alarm Admin ( Closed Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (81, 'Alarm-IMSI-Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');

--- For Alarm Admin ( Assigned Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (85, 'Alarm-IMSI-Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');

--- For Alarm Case
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (89, 'Alarm-IMSI-Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (93, 'Alarm-IMSI-Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 4, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (97, 'Alarm-IMSI-Subscriber', 16, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--- For Alarm Admin ( Closed Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (101, 'Alarm-IMSI-Subscriber', 17, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--- For Alarm Admin ( Assigned Alarms )--
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (105, 'Alarm-IMSI-Subscriber', 18, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--- For Alarm Case
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (109, 'Alarm-IMSI-Subscriber', 26, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (113, 'Alarm-IMSI-Subscriber', 27, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');

--- For Invalid Subscriber
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (115, 'InvalidSubscriberCounter-PhNum-Subscriber', 28, 'AGGREGATION_VALUE', 37, 'PHONE_NUMBER', 0, 2, '');

--BlackList Subscriber - Account Info
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (116, 'BlackListSubscriber-BlackListAccount', 12, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (124, 'BlackListSubscriber-ActiveAccount', 12, 'ACCOUNT_NAME', 4, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (170, 'BlackListSubscriber-ActiveAccount', 12, 'ACCOUNT_ID', 22, 'ID', 0, 8, '');

--Disconnected Subscriber - Account Info
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
       values (166, 'DisconnectedSubscriber-ActiveAccount', 105, 'ACCOUNT_NAME', 4, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW') ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
       values (167, 'DisconnectedSubscriber-BlackListAccount', 105, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW') ;


--Precheck List Subscriber Enrichment 
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (117, 'Subscriber-BlackListAccount', 3, 'ACCOUNT_ID', 13, 'ID', 0, 1, '');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (135, 'Subscriber-ActiveAccount', 21, 'ACCOUNT_NAME', 4, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW RULE');
--BlackList Account

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (122, 'BlackListAccount-BlackListSubscriber', 13, 'ACCOUNT_NAME', 12, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (171, 'Account-ActiveAndSuspendedSubscriber', 22, 'ID', 21, 'ACCOUNT_ID', 0, 8, '');

-- Entries for Negative Rule Data Record --
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (136, 'NegativeRuleData-Subscriber', 61, 'AGGREGATION_VALUE', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');


----My Alarms entries for expandable_field_maps-----

insert into expandable_field_maps values (155, 'Alarm-IMSI-Subscriber', 96, 'REFERENCE_ID', 3, 'ID', 4, 0, 'RECORD_VIEW', 0)
;
insert into expandable_field_maps values (156, 'Alarm-IMSI-Subscriber', 96, 'AGGREGATION_VALUE', 3, 'IMSI', 4, 0,
	'RECORD_VIEW', 0) ;
insert into expandable_field_maps values (157, 'Alarm-Subscriber', 96, 'REFERENCE_ID', 3, 'ID', 1, 0, 'RECORD_VIEW', 0) ;
insert into expandable_field_maps values (158, 'Alarm-IMEI-Subscriber', 96, 'REFERENCE_ID', 3, 'IMEI', 2, 0, 'RECORD_VIEW',
	0) ;
insert into expandable_field_maps values (159, 'Alarm-AccountName-Subscriber', 96, 'REFERENCE_ID', 4, 'ID', 3, 0,
	'RECORD_VIEW', 0) ;
insert into expandable_field_maps values (160, 'Alarm-Subscriber', 96, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 1, 0,
	'RECORD_VIEW', 0) ;
insert into expandable_field_maps values (161, 'Alarm-IMEI-Subscriber', 96, 'REFERENCE_VALUE', 3, 'IMEI', 2, 0,'RECORD_VIEW'
	, 0) ;
insert into expandable_field_maps values (162, 'Alarm-AccountName-Subscriber', 96, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 3,
	0, 'RECORD_VIEW', 0) ;


--For 'Suspect Values For Key'
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (194, 'Active Subscriber Details', 115, 'VALUE', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (195, 'IMSI Subscriber', 115, 'VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (196, 'IMEI Subscriber', 115, 'VALUE', 3, 'IMEI', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (197, 'Account Name Subscriber', 115, 'VALUE', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
	

--Entries For Subscriber.
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  2, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  3, 3, '20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  4, 3, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 3, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  6, 3, '23') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  7, 3, '5.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 3, '32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 3, '35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 26, 3, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 30, 3, '24') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 31, 3, '25') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 3, '33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 3, '22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 3, '5.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 48, 3, '13') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 3, '28') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 42, 4, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 3, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 43, 4, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 3, '39') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 4, '36') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 12, '32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 3, '32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 4, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 183, 3, '5.7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 184, 3, '5.8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 185, 3, '5.9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 186, 3, '5.10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 204, 3, '1') ;
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values(field_record_config_map_seq.nextval,70,3,39);

--For Subscriber Store
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 57, 3, '20.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 58, 3, '22.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2067, 3, '20.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2068, 3, '170.171.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 116, 3, '42') ;

--active account
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 106, 4, '25.26.30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 107, 4, '25.30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 113, 4, '25.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 108, 4, '30.26.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 110, 4, '30.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 111, 4, '30.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 114, 4, '29.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 114, 3, '22.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 115, 3, '22.30') ;
--


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 59, 3, '20.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 60, 3, '21.32') ;


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 61, 3, '23.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 62, 3, '34') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 62, 4, '35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 63, 3, '5.17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 64, 3, '26') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 64, 4, '50') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 65, 3, '5.18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 66, 3, '5.21') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 66, 4, '21') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 67, 3, '31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 67, 4, '34') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 77, 3, '5.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 78, 3, '36') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 78, 4, '33') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 79, 3, '29') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 79, 4, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 80, 3, '37') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 82, 3, '20.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 83, 3, '20') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 4, '19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 4, '5.20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 203, 4, '20') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 4, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 33, 4, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 34, 4, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 35, 4, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 183, 4, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 184, 4, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 185, 4, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 186, 4, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 63, 4, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 48, 4, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 32, 4, '29') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 4, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 65, 4, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 199, 3, '21') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 8, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 4, '60.12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 4, '60.32') ;

--Entried For alarms
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 10, '22') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5,  10, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1,  10, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 75, 10, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 69, 10, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 84, 10, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 70, 10, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 67, 10, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 71, 10, '10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17, 10, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 72, 10, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 73, 10, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 74, 10, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 68, 10, '16') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 33, 10, '50.5.4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 34, 10, '50.5.5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 35, 10, '50.5.6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 86, 10, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 87, 10, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 88, 10, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 183, 10, '65.7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 184, 10, '65.8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 186, 10, '65.10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 78, 10, '65.15.3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2073, 10, '65.11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2074, 10, '65.15.8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2075, 10, '65.15.10') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2078, 10, '20') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 11, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 29, 14, '14.2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 15, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 16, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 16, '17') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 17, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 21, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 21, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 17, 21, '11');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 22, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 22, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 23, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 23, '18') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 24, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 7, 24, '18') ;

--Entries for Invalid Subscriber Counter
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 28, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 13, 28, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 28, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 28, '115.35') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 28, '115.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 73, 28, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 74, 28, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 75, 28, '1') ;

-- Entries for Auto Suspect Numbers --
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 26, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 26, '12');

-- Entries for Called To Called By Phone Number --
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2, 27, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 26, 27, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 26, 26, '11');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 16, 27, '7');


insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 31, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 33, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 40, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 49, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 43, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 44, '11') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 46, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 41, '6') ;


-- View Config Components Start
insert into view_config_components (id, record_view_config_id, key, value) (select view_config_components_seq.nextval, id, 'enable_fetch_records', 'true' from record_view_configs where id not in (1, 2, 3, 4, 5, 6, 7, 8, 12, 13, 21, 22, 28, 29, 30, 31, 37, 45, 46)) ;
insert into view_config_components (id, record_view_config_id, key, value) (select view_config_components_seq.nextval, id, 'enable_fetch_records', 'false' from record_view_configs where id in (3, 4, 8, 12, 13, 31, 45, 46)) ;
-- View Config Components End

--Entries for Profile Counter
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 13, 51, '4') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 51, '5') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 16, 51, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 73, 51, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 74, 51, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 75, 51, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 212, 51, '1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 01, 51, '1') ;


-- Entries for Analyst Actions
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 52, '3') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 212, 3, '32') ;

-- Entries for Free Numbers
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 53, '3') ;

-- Entries for Special Numbers
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 54, '15') ;

-- RATE TYPES---
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, 
									is_primary_view, is_logging_enabled) 
	values(75,'Rate Types', 62, 'ID ASC', 1, 1, 1, 1) ;

-- RATE PLANS---
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, 
									is_primary_view, is_logging_enabled) 
	values(76,'Rate Plans', 63, 'ID ASC', 1, 1, 1, 1) ;
	
-- DEFAULT RATES---
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, 
									is_primary_view, is_logging_enabled) 
	values(77,'Default Rates', 64, 'ID ASC', 1, 1, 1, 1) ;

-- Field Config Entries for Alarm Activity Logs	
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 73, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 73, 'Alarm ID', 'ALARM_ID', 0, 0, 1, 2, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 73, 'Activity ID', 'ACTIVITY_ID', 0, 0, 1, 3, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 73, 'Activity Description', 'ACTIVITY_DESCRIPTION', 0, 1, 3, 4, 1, 0, 255) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 73, 'Log Date', 'LOG_DATE', 0, 1, 4, 5, 1) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 73, 'Log Message', 'LOG_MESSAGE', 0, 1, 3, 6, 1, 0, 255) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 73, 'User', 'USER_ID', 0, 1, 3, 7, 1, 0, 255) ;

-- Field Config Entries for Alarm Workflow	
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'Alarm ID', 'ALARM_ID', 0, 0, 1, 2, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 74, 'Activity', 'NAME', 0, 1, 3, 3, 1, 0, 255) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'Activity ID', 'ACTIVITY_ID', 0, 0, 1, 4, 1) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 74, 'User', 'USER_ID', 0, 1, 3, 5, 1, 0, 255) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'Expected Completion Date', 'EXPECTED_COMPLETION_DATE', 0, 1, 4, 6, 1) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'Completed On', 'ACTUAL_COMPLETION_DATE', 0, 1, 4, 7, 1) ;
insert into field_configs(id, record_config_id, name, database_field, is_visible, data_type, field_id, translation_id) values (field_configs_seq.nextval, 74, 'Status', 'STATUS', 1, 3, 8, 70) ;
insert into field_configs(id, record_config_id, name, database_field, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 74, 'Position', 'POSITION', 0, 1, 9, 1) ;

-- Field Config Entries for Workflow Activity Templates
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 75, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 75, 'Name', 'NAME', 0, 1, 3, 2, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 75, 'Description', 'DESCRIPTION', 0, 1, 3, 3, 1, 0, 4000) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 75, 'Template Type', 'TEMPLATE_TYPE', 0, 0, 1, 4, 0) ;

-- Field Config Entries for Workflow Activity Steps
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 76, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 76, 'Name', 'NAME', 0, 1, 3, 2, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 76, 'Activity Template', 'TEMPLATE_NAME', 0, 1, 3, 3, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, width) values (field_configs_seq.nextval, 76, 'Jeopardy Period [Day(s)]', 'JEOPARDY_PERIOD', 0, 0, 1, 4, 1, 20) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, translation_id, width) values (field_configs_seq.nextval, 76, 'Automatic', 'IS_AUTOMATIC', 0, 1, 6, 5, 1, 81, 4) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 76, 'Description', 'DESCRIPTION', 0, 1, 3, 6, 0, 0, 4000) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 76, 'Activity Template ID', 'ACTIVITY_TEMPLATE_ID', 0, 0, 1, 7, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter,translation_id) values (field_configs_seq.nextval, 76, 'Activity Input Variable', 'INPUT_IDS', 0, 1, 7, 8, 1, 539) ; 
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter,translation_id) values (field_configs_seq.nextval, 76, 'Activity Output Variable', 'OUTPUT_ID', 0, 1, 1 ,9, 1, 540) ;
 

-- Field Config Entries for Workflows --

insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 77, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 77, 'Name', 'NAME', 0, 1, 3, 2, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 77, 'Description', 'DESCRIPTION', 0, 1, 3, 3, 0, 0, 4000) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, translation_id) values (field_configs_seq.nextval, 77, 'Fraud Type(s)', 'FRAUD_TYPE', 0, 1, 7, 4, 1, 60) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, translation_id) values (field_configs_seq.nextval, 77, 'Reference Type(s)', 'REFERENCE_TYPE', 0, 1, 7, 5, 1, 42) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, translation_id) values (field_configs_seq.nextval, 77, 'Network(s)', 'NETWORK', 0, 1, 7, 6, 1, 10) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 77, '6') ;

-- Field Config Entries for Teams --

insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter) values (field_configs_seq.nextval, 90, 'ID', 'ID', 0, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 90, 'Name', 'NAME', 0, 1, 3, 2, 1, 0, 256) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, reg_exp_id, width) values (field_configs_seq.nextval, 90, 'Description', 'DESCRIPTION', 0, 1, 3, 3, 1, 10, 4000) ;
insert into field_configs(id, record_config_id, name, database_field, is_expandable, is_visible, data_type, field_id, is_filter, translation_id) values (field_configs_seq.nextval, 90, 'Network(s)', 'NETWORK', 0, 1, 7, 4, 1, 10) ;

-- Team
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 90, '4') ;

-- Distance Time
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 55, '5') ;

-- Holiday List
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 56, '4') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 47, '10') ;

-- Cell Site GEO
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 5, 68, '8') ;

-- Alarm
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (field_record_config_map_seq.nextval, 215, 10, '9') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (field_record_config_map_seq.nextval, 2, 10, '15') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association)
	values (field_record_config_map_seq.nextval, 2070, 10, '19') ;

--Assign Alarm Rule

insert into record_configs (id, tname, description, cacheable, is_visible,category)
	values(78,'ALARM_RULE_USER_MAPS_V', 'Alarm Assignment Rules', 0, 1, 'NAMED_FILTERS' ) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
		is_primary_view, is_logging_enabled) 
	values(91,'Alarm Assignment Rules',78,'','PRIORITY ASC', 1, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Id', 'ID', 1, 1, 1, 0, '', '', 20, null, 0, null, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, 
		ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Rule Name','RULE_NAME',2,2,3, '', 0,'','',256,null,1,14,1) ; 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, 
		ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Owner Name', 'USER_ID', 3, 3, 3, '', 0, '', '', 64, 514, 1, 8, 1) ; 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, 
		ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Workflow Name', 'WORKFLOW_ID', 4, 4, 1, '', 0, '', '', 20, 79, 1, null, 1) ; 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Network', 'NETWORKS', 5, 5, 7, 0, '', '', 1024, 10, 1, null, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 78, 'Priority', 'PRIORITY', 6, 6, 1, 0, '', '', 20, null, 1, null, 1) ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 78, 'Status', 'STATUS', 7, 1, 3, 8, 1, 41, 10) ; 
	

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 78, '5') ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(95,'Alarms',10,'','', 1, 0,0, 1) ;


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (151, 'Alarm-Subscriber', 95, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'ASSIGN_ALARM_RULE');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (152, 'Alarm-IMEI-Subscriber', 95, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'ASSIGN_ALARM_RULE');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (153, 'Alarm-AccountName-AccountDetails', 95, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'ASSIGN_ALARM_RULE');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Disconnected Subscriber Details', 95, 'REFERENCE_VALUE',105, 'PHONE_NUMBER', 0, 1, 'ASSIGN_ALARM_RULE') ;

-- Alarm Escalation / Notification Rule

insert into record_configs (id, tname, description, cacheable, is_visible,category)
	values(80,'ALARM_RULE_NOTIFICATION_MAPS_V', 'Alarm Escalation/Notification Rules', 0, 1, 'NAMED_FILTERS' ) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, 
		is_primary_view, is_logging_enabled) 
	values(97,'Alarm Escalation/Notification Rules',80,'','', 1, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Id', 'ID', 1, 1, 1, 0, '', '', 20, null, 0, null, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, 
		ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Rule Name','RULE_NAME',2,2,3, '', 0,'','',256,null,1,14,1) ; 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, format,  is_expandable, 
		ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Type','CATEGORY',3,3,3, '', 0,'','',20,73,1,10,1) ; 

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Group', 'RULE_GROUP', 4, 4, 3, 0, '', '', 1024, null, 1, 0, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Notification Pack', 'PACK_NAME', 5, 5, 3, 0, '', '', 1024, 74, 1, 0, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, 
		query_field, width, translation_id, is_visible, reg_exp_id, is_filter) 
	values  (field_configs_seq.nextval, 80, 'Network', 'NETWORKS', 6, 6, 7, 0, '', '', 1024, 10, 1, null, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter)
values (field_configs_seq.nextval, 80, 'Description', 'DESCRIPTION', 7, 7, 3, 0, null, null, 256, null, 1, null, 0) ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 80, 'Status', 'STATUS', 8, 1, 3, 8, 1, 41, 10) ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 80, '6') ;

-----------------------------------------------------ENTRIES For My Notifications-------------------------

--Record Configs entry
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values (82, 'MY_NOTIFICATIONS','My Notifications', 0, 'ID', 1, null, 'NAMED_FILTERS' , 0) ;

--Record View Config entry
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled) values (99,'My Notifications', 82, null, 'CREATED_DATE DESC', 1, 1, 1, 1, 0 ) ;

--Field Config Entries
insert into field_configs values (field_configs_seq.nextval, 82, 'Notification Id', 'ID', 1, 0, 0, null, 1, null, 1, null, null, 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Date', 'CREATED_DATE', 3, 0, 1, null, 4, null, 3, null, null, 1, 40, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Notification Source', 'SOURCE', 4, 0, 1, null, 1, null, 4, null, 62, 1, 20, '9', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Notification Code', 'NOTIFICATION_CODE', 5, 0, 5, null, 1, null, 5, null, 77, 0, 20, '9', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Entity Type', 'ENTITY_TYPE', 6, 0, 1, null, 1, null, 6, null, 20, 1, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Entity Value', 'ENTITY_VALUE', 7, 1, 1, null, 3, null, 7,
null, null, 1, 100, '10', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Message', 'MESSAGE', 9, 0, 1, null, 3, null, 9, null, null, 0, 20, '9', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Is Read', 'IS_READ', 11, 0, 1, null, 1, null, 11, null, 78, 1, 20, '9', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'User', 'USER_ID', 10, 0, 1, null, 1, null, 10, null, 23, 0, 20, '16', null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 82, 'Entity Id', 'ENTITY_ID', 8, 0, 0, null, 1, null, 8, null, null, 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values ( field_configs_seq.nextval, 82, 'Network', 'NETWORK_ID', 2, 0,(select decode(count(*),1,0,1) from networks),null, 7, null, 2, null, 515 , 1, 40, null, null, null, null, 0,0 ) ;

--Field Record Config Maps entry
insert into field_record_config_maps values (field_record_config_map_seq.nextval, 5, 82, 2) ;
---------------------------------------------------ENTRIES For Suspect Fingerprints-------------------------
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,	is_primary_view, is_logging_enabled) values (100,'Suspect eFingerprints',3,' (((ID > 1024 AND ACCOUNT_ID > 1024) AND SUBSCRIBER_TYPE = 0 AND STATUS IN (1,2,3)) OR (ID> 1024 AND SUBSCRIBER_TYPE = 1 AND (ACCOUNT_ID > 1024 OR ACCOUNT_ID = 4))) AND id in (select distinct fp.profiled_entity_id from fp_profiles fp where fp.IS_MATCH_TYPE = 1 and fp.entity_id = 16)','MODIFIED_DATE DESC', 1, 1, 0, 1) ;
insert into record_view_configs values (101, 'Accounts',4,'(ID > 1024) AND (ACCOUNT_TYPE IN (0,1))','MODIFIED_DATE DESC',0,0,0,0,0,0,0,'',1) ;

insert into expandable_field_maps (id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category, data_record_type)values (163, 'Subscriber-Account', 100, 'ACCOUNT_NAME',	101, 'ACCOUNT_NAME', 7, 0, 'RECORD_VIEW RULE', 0) ;

------------------------------------------- Expandable Field Maps entries for Closed/Archived Alarm Views ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (188, 'Account Credit Details', 103, 'ACCOUNT_NAME', 5, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (190, 'Subscriber-Account', 102, 'ACCOUNT_NAME', 103, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (191, 'Account-ActiveSubscriber', 103, 'ACCOUNT_NAME', 3, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (192, 'Account-Black Listed Subscriber', 103, 'ACCOUNT_NAME', 12, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (193, 'Account-Disconnected Subscriber', 103, 'ACCOUNT_NAME', 105, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW');

---------  Expandables in Hotlist entity (Phone Number for blacklist subscriber )

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number Blacklist Subscriber', 15, 'VALUE', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
		category) values (expandable_field_maps_seq.nextval, 'Phone Number Blacklist Subscriber', 15, 'END_VALUE', 12, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW');
--------------Expandables for auto threshold view--------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Rule Details', 39, 'RULE_KEY', 52, 'KEY', 0, 202, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Rule Details', 43, 'RULE_KEY', 52, 'KEY', 0, 202, 'RECORD_VIEW');
--Entries for SDR Rate

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 85, '2') ;


--Entries for Hotlist Keys
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 92, '5') ;
 

--for unique record sequence ID in multipl_field_counter for count changes
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5000, 3, '38') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5000, 4, '37') ;


-- Total Calls
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  220, 3 , '43') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  222, 3 , '20.43') ;
        

-------------------------------------Entries For modified Account/Subscriber Groups Views--------------------------------
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values (86, 'ACTIVE_ACCOUNT_GROUPS_V','Account Groups', 0, 'ID', 1, null, 'NAMED_FILTERS' , 0) ;

insert into field_configs values (field_configs_seq.nextval, 86, 'Group ID', 'ID', 1, 0, 0, null, 1, null, 1, null, null, 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 86, 'Group Name', 'KEY', 2, 0, 1, null, 3, null, 2, null, null, 1, 30, 9, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 86, 'Description', 'DESCRIPTION', 3, 0, 1, null, 3, null, 3, null, null, 1, 256, 10, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 86, 'Priority', 'PRIORITY', 4, 0, 1, null, 1, null, 4, null, null, 1, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 86, 'Record Configuration', 'RECORD_CONFIG_ID', 5, 0, 0, null, 1, null, 5, null, 85 , 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 86, 'Network', 'NETWORKS', 6, 0, 1, null, 7, null, 6, null, 10, 1, 4000, null, null, null, null, 0,0) ; 

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled) values (108,'Account Groups', 86, null, 'ID ASC', 1, 0, 1, 0, 0 ) ;
insert into field_record_config_maps values (field_record_config_map_seq.nextval, 5, 86, 6) ;

insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category, is_partitioned) values (87, 'ACTIVE_SUB_GROUPS_V','Subscriber Groups', 0, 'ID', 1, null, 'NAMED_FILTERS' , 0) ;

insert into field_configs values (field_configs_seq.nextval, 87, 'Group ID', 'ID', 1, 0, 0, null, 1, null, 1, null, null, 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 87, 'Group Name', 'KEY', 2, 0, 1, null, 3, null, 2, null, null, 1, 30, 9, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 87, 'Description', 'DESCRIPTION', 3, 0, 1, null, 3, null, 3, null, null, 1, 256, 10, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 87, 'Priority', 'PRIORITY', 4, 0, 1, null, 1, null, 4, null, null, 1, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 87, 'Record Configuration', 'RECORD_CONFIG_ID', 5, 0, 0, null,	1, null, 5, null, 85, 0, 20, null, null, null, null, 0,0) ; 
insert into field_configs values (field_configs_seq.nextval, 87, 'Network', 'NETWORK_ID', 6, 0, 1, null, 7, null, 6, null, 10, 1, 4000, null, null, null, null, 0,0) ; 
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,data_type,field_id,reg_exp_id,is_filter,width)values (field_configs_seq.nextval,87,'User Name', 'USER_NAME',7,0,1,3,7,9,1,256);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,data_type,field_id,is_filter)values (field_configs_seq.nextval,87,'Created Time', 'CREATED_TIME',8,0,1,4,8,1);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,data_type,field_id,is_filter)values (field_configs_seq.nextval,87,'Modified Time', 'MODIFIED_TIME',9,0,1,4,9,1);
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible, is_cell_specific, is_pagination_enabled, is_primary_view, is_logging_enabled) values (109,'Subscriber Groups', 87, null, 'ID ASC', 1, 0, 1, 0, 0 ) ;
insert into field_record_config_maps values (field_record_config_map_seq.nextval, 5, 87, 6) ;

---------------------------------Entries for modified Account/Subscriber grouping rules View---------------
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(88,'ACC_SUB_GROUPING_RULES_V','Grouping Rules',0,'ID',1, 'NAMED_FILTERS' ) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 88, '4') ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter,	width, reg_exp_id) values (field_configs_seq.nextval, 88, 'Rule Name', 'RULE_NAME', 0, 1,  3,  1, 1, 10, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 88, 'Groups', 'SUBSCRIBER_GROUP', 0, 1,  7,  2, 1, 10, 0,516) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 88, 'Action', 'ACTION_NAME', 0, 1,  3,  3, 1, 10, 0, 101) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 88, 'Networks', 'NETWORKS', 0, 1,  7,  4, 1, 10, 0, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 88, 'ID', 'ID', 0, 0,  1,  5, 0, 10, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled,	is_visible,is_cell_specific, is_primary_view) values(110, 'Account Grouping Rules',88,'RECORD_CONFIG_ID = 4','ID DESC', 1, 1, 0, 1) ;

---------------------------------Entries for modified Account/Subscriber grouping rules View---------------
insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(89,'ACC_SUB_GROUPING_RULES_V','Grouping Rules',0,'ID',1, 'NAMED_FILTERS' ) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 89, '4') ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter,	width, reg_exp_id) values (field_configs_seq.nextval, 89, 'Rule Name', 'RULE_NAME', 0, 1,  3,  1, 1, 10, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 89, 'Groups', 'SUBSCRIBER_GROUP', 0, 1,  7,  2, 1, 10, 0,523) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 89, 'Action', 'ACTION_NAME', 0, 1,  3,  3, 1, 10, 0, 101) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 89, 'Networks', 'NETWORKS', 0, 1,  7,  4, 1, 10, 0, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 89, 'ID', 'ID', 0, 0,  1,  5, 0, 10, 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled,	is_visible,is_cell_specific, is_primary_view) values(111, 'Subscriber Grouping Rules',89,'RECORD_CONFIG_ID = 3','ID DESC', 1, 1, 0, 1) ;

-- Archived Observation Summary Records--
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(93,'AR_OBSERVATION_SUMMARY_RECORDS','Archived Observation Summary Records', 0, '', 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Aggregation Value', 'AGGREGATION_VALUE', 2,	2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Record Config ID', 'RECORD_CONFIG_ID', 5, 5, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Count', 'COUNT', 6, 6, 1, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Value', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 93, 'Summary End Time', 'SUMMARY_END_TIME', 10, 10, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 93, 'Rule Name', 'RULE_KEY',11, 11, 1, 1, 1, 1, 0, 69) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(117,'Archived Observation Summary Records', 93, '', 'SUMMARY_START_TIME DESC', 1, 1, 0, 1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view, is_logging_enabled) values(118,'Closed History Alarms',23,'STATUS IN (2,4)','MODIFIED_DATE DESC', 1, 0,1, 0, 1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_visible,is_cell_specific, is_primary_view) values(119,'Archived History Alarms',16,'MODIFIED_DATE < ((select trunc(to_date(value, ''YYYY/MM/DD HH24:MI:SS'')) from configurations  where config_key=''CLEANUP.ALARMS.LAST_RUN_DATE'') - (select to_number(value) from configurations where config_key= ''CLEANUP.ALARMS.INTERVAL_IN_DAYS''))','MODIFIED_DATE DESC',0,1, 1) ;

-- Observation Summary Records related to Statistical Rule --

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(172,'OBSERVATION_SUMMARY_RECORDS','Observation Summary Records', 0, '', 0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(154,'Observation Summary Records', 172, '', 'SUMMARY_START_TIME DESC', 1, 1, 1, 1) ;

insert into translation_indices values (557, 'Stats Obs Summary Rule Name', null, 1);
insert into translations values (translations_seq.nextval, 557, '-176', 'select key as Key, substr(name, 1, instr(name, ''_Profile_Field_v'')-1) as Value from rules r where is_active = 1 and (category like ''%PROFILE_FIELD%'') and parent_id != 0 and id > 1024 and rule_mode=0') ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Aggregation Value', 'AGGREGATION_VALUE', 2,	2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Summary End Time', 'SUMMARY_END_TIME', 5, 5, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Record Config ID', 'RECORD_CONFIG_ID', 6, 6, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'Measured Data', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id)  values (field_configs_seq.nextval, 172, 'Statistical Element', 'RULE_KEY', 9, 9, 1, 1, 1, 1, 0,557) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 172, 'ID', 'ID', 10, 0, 1, 0, 0, 0, 0) ;

-- Archived Observation Summary Records related to Statistical Rule --

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(173,'AR_OBSERVATION_SUMMARY_RECORDS','Archived Observation Summary Records', 0, '', 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(155,'Archived Observation Summary Records', 173, '', 'SUMMARY_START_TIME DESC', 1, 1, 1, 1) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Aggregation Type', 'AGGREGATION_TYPE', 1, 1, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Aggregation Value', 'AGGREGATION_VALUE', 2,	2, 3, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Alert ID', 'ALERT_ID', 3, 3, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Summary Start Time', 'SUMMARY_START_TIME', 4, 4, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable,	is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Summary End Time', 'SUMMARY_END_TIME', 5, 5, 4, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Record Config ID', 'RECORD_CONFIG_ID', 6, 6, 1, 0, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'Measured Data', 'VALUE', 7, 7, 2, 0, 1, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'CDR ID', 'CDR_ID', 8, 8, 1, 0, 0, 0, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id, translation_id) values  (field_configs_seq.nextval, 173, 'Statistical Element', 'RULE_KEY',9, 9, 1, 1, 1, 1, 0, 557) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, is_visible, is_filter, reg_exp_id)  values (field_configs_seq.nextval, 173, 'ID', 'ID', 10, 0, 1, 0, 0, 0, 0) ;

-- Time Zone Rate Types ---

insert into record_configs(ID,TNAME,DESCRIPTION,CACHEABLE,KEY,IS_VISIBLE,DELIMETER,CATEGORY,IS_PARTITIONED) values (95,'TIME_ZONE_RATE_TYPES_V','Time Zone Rate Types',0,'',1,'', 'NAMED_FILTERS' ,0);

insert into record_view_configs(ID,NAME,RECORD_CONFIG_ID,WHERE_CLAUSE,ORDER_BY,IS_VISIBLE,IS_CELL_SPECIFIC,IS_PAGINATION_ENABLED,IS_PRIMARY_VIEW,IS_LOGGING_ENABLED)values(120,'Time Zone Rate Types',95,'','ID ASC',1,0,1,1,0);

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'ID','ID',0,0,'',1,'',1,'',0,20,'','','',0,'','');

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'Day Type','DAY_TYPE',0,1,'',3,'',2,'',1,64,'','','',0,52,0);

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'Start Time','START_TIME',0,1,'',1,'',3,'',0,64,'','','',0,9,'');

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'End Time','END_TIME',0,1,'',1,'',4,'',0,64,'','','',0,9,'');

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'Service Category','SERVICE_CATEGORY',0,1,'',3,'',5,'',1,64,'','','',0,50,0);

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'National Flag','NATIONAL_FLAG',0,1,'',3,'',6,'',1,64,'','','',0,51,0);

insert into field_configs(ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,IS_FILTER,WIDTH,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,TRANSLATION_ID,REG_EXP_ID)values(field_configs_seq.nextval,95,'Rate Type','RATE_TYPE',0,1,'',3,'',7,'',1,64,'','','',0,'',0);
-------------Bulk manual alarm----------------
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(503, 'DUMMY_RECORD_CONFIG','Dummy Record Config', 0, '', 0, ',') ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'NETWORK_NAME', '', 1, 0, 1, 1) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'AGGREGATION_TYPE', '', 2, 0, 1, 2) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'SUBSCRIBER_TYPE', '', 3, 0, 1, 3) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'ALARM_ASSIGNED', '', 4, 0, 1, 4) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'ALARM_ASSIGNED_USER_OR_TEAM_NAME', '', 5, 0, 1, 5) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'AGGREGATION_VALUE', '', 6, 0, 1, 6) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'REFERENCE_VALUE', '', 7, 0, 1, 7) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'RULE_NAME', '', 8, 0, 1, 8) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, reg_exp_id) values (field_configs_seq.nextval, 503, 'SCORE', '', 9, 0, 1, 9, 13) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 503, 'USER_COMMENT', '', 10, 0, 1, 10) ;



--------------End Bulk Manual alarm---------------

--------Alarm History-------Start----------

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (202, 'Alarm-Subscriber', 118, 'REFERENCE_ID', 102, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (203, 'Alarm-IMEI-Subscriber', 118, 'REFERENCE_ID', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (204, 'Alarm-IMSI-Subscriber', 118, 'REFERENCE_ID', 102, 'ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (205, 'Alarm-Subscriber', 118, 'REFERENCE_VALUE,REFERENCE_ID', 3, 'PHONE_NUMBER,ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (206, 'Alarm-IMEI-Subscriber', 118, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (207, 'Alarm-IMSI-Subscriber', 118, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (208, 'Alarm-AccountName-AccountDetails', 118, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (209, 'Alarm-AccountName-Subscriber', 118, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');

--------Alarm History-------End----------

-------Alarm cellsite----start------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (215, 'Alarm-CellSite', 10, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW WORK_FLOW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (216, 'Alarm-CellSite', 26, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (217, 'Alarm-CellSite', 16, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (218, 'Alarm-CellSite', 17, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (219, 'Alarm-CellSite', 18, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (220, 'Alarm-CellSite', 19, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (221, 'Alarm-CellSite', 96, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (222, 'Alarm-CellSite', 116, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (223, 'Alarm-CellSite', 50, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (224, 'Alarm-CellSite', 118, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (225, 'Alarm-CellSite', 119, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW'); 

-------Alarm cellsite----End-------

-- Adding entry in field config for modification_time for rule_history page
Insert into FIELD_CONFIGS (ID,RECORD_CONFIG_ID,NAME,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED)
values ( field_configs_seq.nextval, 48, 'Modified Time', 'MODIFICATION_TIME', 16, 0, 1, null, 4, null, 16, null, null, 0, 40, null, null, null, null, 0); 

-- subscriber previous IMEI
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2079, 3, '20.20') ;

-- Bill Cycle Relations
insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values(field_record_config_map_seq.nextval,901,3,'226.16');

--Recharge Details entries
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(6,'ACCOUNT_RECHARGE_DETAIL','Account Recharge',0,'ID',1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(6,'Account Recharge',6,'','', 1, 0, 1, 1) ;
--- For Account Recharge
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (230, 6, 'Account Id', 'ACCOUNT_ID',1,null,8,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (231, 6, 'Expiry Date','VOUCHER_EXPIRY_DATE',2,2,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (232, 6, 'Current Balance','CURRENT_BALANCE',3,3,2,0,'GR ENTITY_DATA','',40,null,1,null,1) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (233, 6, 'Grace Period ','GRACE_PERIOD_EXPIRY_DATE',4,4,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (234, 6, 'Previous Balance','PREVIOUS_BALANCE',5,5,2,0,'GR','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (235, 6, 'Last Recharge Date','LAST_RECHARGE_DATE',6,6,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (236, 6, 'Last CDR Time ','LAST_CDR_TIME',7,7,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (237, 6, 'Account Name','ACCOUNT_NAME',8,8,3,0,'','',40,null,0,null,0) ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (16, 'Account Recharge Details', 4, 'ACCOUNT_NAME', 6, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW GR RULE');


--------Custom Nickname---
insert into record_configs (id,tname,description,cacheable,key,is_visible,delimeter,category,is_partitioned,is_spark_support) values (111,'CUSTOM_NICKNAMES_V','Custom Nickname',0,null,1,null,null,0,0);

insert into record_view_configs (id,name,record_config_id,where_clause,order_by,is_visible,is_cell_specific,is_pagination_enabled,is_primary_view,is_logging_enabled,create_manual_alarm) values (131,'Custom Nickname',111,null,'ID ASC',1,0,1,1,1,0);


insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Nickname Type','NICKNAME_TYPE',6,7,3,0,0,null,null,null,null,50,null,null,0,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Record Count','RECORD_COUNT',5,6,1,0,0,null,null,null,null,30,null,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'ID','ID',4,5,1,0,0,null,null,null,null,30,null,null,0,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Maximum Records','MAX_VALUES',3,4,1,0,1,null,null,null,null,50,null,null,1,null,null,0,0);
iNSERT INTO field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Days to expiry','NO_OF_DAYS',2,3,1,0,1,null,null,null,null,40,null,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Network','NETWORK_ID',1,2,1,0,0,null,null,null,10,40,0,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,111,'Name','NICKNAME',0,1,3,0,1,null,null,null,null,256,0,null,1,null,null,0,0);

insert into field_record_config_maps (id,field_category_id,record_config_id,field_association) values (field_record_config_map_seq.nextval,1,111,'5');
iNSERT INTO field_record_config_maps (id,field_category_id,record_config_id,field_association) values (field_record_config_map_seq.nextval,5,111,'2');


---------Standard nick name-------
insert into record_configs (id,tname,description,cacheable,key,is_visible,delimeter,category,is_partitioned,is_spark_support) values (112,'STANDARD_NICKNAMES_V','Standard Nicknames',0,null,1,null,null,0,0);

insert into record_view_configs (id,name,record_config_id,where_clause,order_by,is_visible,is_cell_specific,is_pagination_enabled,is_primary_view,is_logging_enabled,create_manual_alarm) values (132,'Standard Nickname',112,'list_type = 1 and name is not null','NAME ASC',1,0,1,1,1,0);


insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'Category','CATEGORY',6,6,3,0,0,null,null,null,null,200,0,null,0,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'Field Category','FIELD_CATEGORY_ID',5,5,1,0,0,null,null,null,null,200,0,null,0,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'Network','NETWORK_ID',4,4,7,0,1,null,null,null,515,300,0,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'Description','DESCRIPTION',3,3,3,0,1,null,null,null,null,256,0,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'Name','NAME',2,2,3,0,1,null,null,null,null,256,18,null,1,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,field_id,data_type,is_expandable,is_visible,ds_category,format,query_field,translation_id,width,reg_exp_id,associated_field,is_filter,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,112,'ID ','ID',1,1,1,0,0,null,null,null,null,30,null,null,0,null,null,0,0);


insert into field_record_config_maps (id,field_category_id,record_config_id,field_association) values (field_record_config_map_seq.nextval,5,112,'4');
insert into field_record_config_maps (id,field_category_id,record_config_id,field_association) values (field_record_config_map_seq.nextval,1,112,'1');

---- Query Framework

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(113,'QUERY_JOBS','Completed Queries',0,'ID',1) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(114,'QUERY_JOBS','Queued Queries',0,'ID',1) ;
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(115,'QUERY_JOBS','Scheduled Queries',0,'ID',1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(133,'Completed Queries',113,'QUERY_STATUS_ID IN(0,1,5)','ID ASC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(134,'Queued Queries',114,'QUERY_STATUS_ID IN(2,3)','PRIORITY ASC', 1, 1, 1, 1) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values(135,'Scheduled Queries',115,'QUERY_STATUS_ID IN(4,7)','ID ASC', 1, 1, 1, 1) ;

-----Completed Jobs
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 113, 'Query ID', 'ID', 1, 0, 1, '', 1,'', 1, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'Name', 'NAME', 2, 0, 1, '', 3,'', 2, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'Description', 'DESCRIPTION', 3, 0, 1, '', 3,'', 3, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'User Name', 'USER_ID', 4, 0, 1, '', 3,'', 4, '', 23, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'Entity Type', 'RECORD_VIEW_ID', 5, 0, 1, '', 3,'', 5, '', 521, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 113, 'Start Time', 'START_TIME', 8, 0, 1, '', 4,'', 6, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 113, 'End Time', 'END_TIME', 9, 0, 1, '', 4,'', 7, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 113, 'No. of Records', 'NO_OF_ROWS', 7, 0, 1, '', 1,'', 8, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'Cost Category', 'COST_CATEGORY_ID', 4, 0, 1, '', 3,'', 9, '', 524, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 113, 'Status', 'QUERY_STATUS_ID', 6, 0, 1, 'CR', 3,'', 10, '', 520, 1, 40, 10) ;

-----Queued Jobs
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 114, 'Query ID', 'ID', 1, 0, 1, '', 1,'', 1, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Name', 'NAME', 2, 0, 1, '', 3,'', 2, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Description', 'DESCRIPTION', 2, 0, 1, '', 3,'', 3, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'User Name', 'USER_ID', 3, 0, 1, '', 3,'', 4, '', 23, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Entity Type', 'RECORD_VIEW_ID', 4, 0, 1, '', 3,'', 5, '', 521, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Priority', 'PRIORITY', 5, 0, 0, '', 1,'', 6, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 114, 'Start Time', 'START_TIME', 7, 0, 1, '', 4,'', 7, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 114, 'Queued Time', 'QUEUED_AT', 9, 0, 1, '', 4,'', 8, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Cost Category', 'COST_CATEGORY_ID', 4, 0, 1, '', 3,'', 9, '', 524, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 114, 'Status', 'QUERY_STATUS_ID', 6, 0, 1, 'CR', 3,'', 10, '', 520, 1, 40, 10) ;

-----Scheduled Jobs
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 115, 'Query ID', 'ID', 1, 0, 1, '', 1,'', 1, '', null, 1, 40) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Name', 'NAME', 2, 0, 1, '', 3,'', 2, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Description', 'DESCRIPTION', 2, 0, 1, '', 3,'', 3, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'User Name', 'USER_ID', 3, 0, 1, '', 3,'', 4, '', 23, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Entity Type', 'RECORD_VIEW_ID', 4, 0, 1, '', 3,'', 5, '', 521, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Scheduled Time', 'SCHEDULED_AT', 5, 0, 1, '', 4,'', 6, '', null, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Cost Category', 'COST_CATEGORY_ID', 4, 0, 1, '', 3,'', 7, '', 524, 1, 40, 10) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id) values (field_configs_seq.nextval, 115, 'Status', 'QUERY_STATUS_ID', 6, 0, 1, 'CR', 3,'', 8, '', 520, 1, 40, 10) ;

-- FieldConfigs for Rule Management - Query Rule History --

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'KEY', 'KEY', 0, 0, 1, 2) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'Rule Name', 'NAME', 1, 1, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'Description', 'DESCRIPTION', 2, 1, 3, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 116, 'Severity', 'SEVERITY', 3, 1, 1, 5, 1, 3, 13) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'Query', 'QUERY', 4, 1, 3, 6) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id)  values(field_configs_seq.nextval, 116, 'Network', 'NETWORK_ID', 5, (select decode(count(*),1,0,1) from networks), 7, 7, 10 ) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'Status', 'STATUS', 6, 1, 3, 8) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width) values(field_configs_seq.nextval,116,'Hour Of Day','HOUR_OF_DAY',7,1,3,9,70);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width,translation_id) values(field_configs_seq.nextval,116,'Day Of Week','DAY_OF_WEEK',8,1,7,10,50,33);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width) values(field_configs_seq.nextval,116,'Day Of Month','DAY_OF_MONTH',9,1,3,11,50);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, width,translation_id) values(field_configs_seq.nextval,116,'Month Of Year','MONTH_OF_YEAR',10,1,7,12,50,31);
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (field_configs_seq.nextval, 116, 'Aggregate On', 'AGGREGATION_TYPE', 11, 1, 1, 13, 12) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'User', 'USERNAME', 12, 1, 3, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 116, 'Version', 'VERSION', 13, 1, 1, 15) ; 

-- FieldConfigs for Work Flow - Activity Outputs --
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_visible) values (field_configs_seq.nextval, 117, 'ID', 'ID', 1, 0, 1, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 117, 'Name', 'NAME', 2, 1, 3, 0, '', '', 40, null, 1, 10, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 117, 'Description', 'DESCRIPTION', 3, 2, 3, 0, '', '', 40, null, 1, 10, 0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, is_visible, data_type, translation_id, is_filter) values (field_configs_seq.nextval, 117, 'Action Type', 'ACTION_TYPE', 4, 3, 1, 3, 536, 1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, is_visible, data_type, translation_id, is_filter) values (field_configs_seq.nextval, 117, 'Data Type', 'DATA_TYPE', 5, 3, 1, 3, 537, 1) ;

------------Record config, Record view config, field confgi entries for activity inputs-----------

insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Default Value','default_value',0,0,0,null,3,null,6,null,null,0,256,0,null,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Value','value',0,0,0,null,3,null,5,null,null,0,256,0,null,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Property/Indicator','property_indicator',0,0,1,null,1,null,4,null,538,1,256,0,null,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Description','Description',0,0,1,null,3,null,3,null,null,0,256,0,null,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'Name','NAME',0,0,1,null,3,null,2,null,null,1,256,10,null,null,null,0,0);
insert into field_configs (id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function,live_tree_ds,is_encrypted,is_case_sensitive) values (field_configs_seq.nextval,118,'ID','ID',0,0,0,null,1,null,1,null,null,0,256,0,null,null,null,0,0);

----------Field Configs Additionals ---------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,10,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,21,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,16,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,11,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,20,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,8,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,9,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,54,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,2,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,63,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,10,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,9,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,12,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,17,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,18,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,23,63,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,64,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,59,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,5,59,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,6,59,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,7,69,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,7,93,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,22,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,23,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,11,24,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,14,109,'IS_CURRENCY',1);

-------------For Record View Operations(Subscriber and Account)-----------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,1,4,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,2,4,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,4,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,20,4,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,1,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,2,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,12,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,13,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,21,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,22,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,23,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,25,3,'IS_MANDATORY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,31,3,'IS_MANDATORY',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,1,3,'IS_NOT_MODIFIABLE',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,3,'IS_NOT_MODIFIABLE',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,12,3,'IS_NOT_MODIFIABLE',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,21,3,'IS_NOT_MODIFIABLE',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,25,3,'IS_NOT_MODIFIABLE',1);
insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,1,4,'IS_NOT_MODIFIABLE',1);

insert into field_configs_additionals values(FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,25,3,'FORM_TRANSLATION_ID',556);


-------------Entries required for google street view expandable----------------
update field_configs set is_expandable=1 where record_config_id=4 and field_id in (7, 8, 9);
update field_configs set is_expandable=1 where record_config_id=3 and field_id in (7, 8, 9);

insert into expandable_field_maps(id,name,source_view_id,source_key,dest_view_id,dest_key,is_new_view,dest_key_type,category)values(expandable_field_maps_seq.nextval,'Account Information',4,'ADDRESS_LINE_1',4,'ADDRESS_LINE_1',0,2,'RECORD_VIEW');
insert into expandable_field_maps(id,name,source_view_id,source_key,dest_view_id,dest_key,is_new_view,dest_key_type,category)values(expandable_field_maps_seq.nextval,'Account Information',4,'ADDRESS_LINE_2',4,'ADDRESS_LINE_2',0,2,'RECORD_VIEW');
insert into expandable_field_maps(id,name,source_view_id,source_key,dest_view_id,dest_key,is_new_view,dest_key_type,category)values(expandable_field_maps_seq.nextval,'Account Information',4,'ADDRESS_LINE_3',4,'ADDRESS_LINE_3',0,2,'RECORD_VIEW');
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 47, 4, '9');
insert into expandable_field_maps values(expandable_field_maps_seq.nextval, 'Account Information', 103, 'ADDRESS_LINE_1', 3, 'ADDRESS_LINE_1', 9, 0, 'RECORD_VIEW', 0);
insert into expandable_field_maps values(expandable_field_maps_seq.nextval, 'Account Information', 103, 'ADDRESS_LINE_2', 3, 'ADDRESS_LINE_2', 9, 0, 'RECORD_VIEW', 0);
insert into expandable_field_maps values(expandable_field_maps_seq.nextval, 'Account Information', 103, 'ADDRESS_LINE_3', 3, 'ADDRESS_LINE_3', 9, 0, 'RECORD_VIEW', 0);
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 7, 4, 'STREET_VIEW_ENABLED', 1 );
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 8, 4, 'STREET_VIEW_ENABLED', 1 );
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 9, 4, 'STREET_VIEW_ENABLED', 1 );
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 7, 3, 'STREET_VIEW_ENABLED', 1 );
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 8, 3, 'STREET_VIEW_ENABLED', 1 );
insert into field_configs_additionals values(field_configs_additionals_seq.nextval, 9, 3, 'STREET_VIEW_ENABLED', 1 );

commit ;
