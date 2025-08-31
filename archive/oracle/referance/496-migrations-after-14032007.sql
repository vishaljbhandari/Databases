spool migrations-after-14032007.log

delete  from reports where name ='HighRiskDestinationsCellSite';

update field_configs set data_type=3, reg_exp_id=9 where record_config_id = 8 and field_id = 9;

-- scheduler entries
insert into scheduler_command_maps values ('Hotlist Cleanup', '@prefix@/bin/hotlistcleanup.sh,HotListCleanUpPid',0,0,'') ;
insert into scheduler_command_maps values ('Pending Case', '@prefix@/bin/pendingcase.sh,PendingCasePid',0,0,'') ;
insert into scheduler_command_maps values ('Pending Alarm', '@prefix@/bin/pendingalarm.sh,PendingAlarmPid',0,0,'') ;

--audit trails entries
insert into AUDIT_LOG_EVENT_CODES values (55, 'Alarm Generated', 'Alarm generated on $2 (''$1'')') ;


drop index IX_ALARMS_AGGREGATION_TYPE ;
drop index IX_ALARMS_AGGREGATION_VALUE ;
drop index IX_ARCH_ALRM_AGGR_TYPE ;
drop index IX_ARCH_ALRM_AGGR_VALUE ;

alter table alarms drop column aggregation_type ;
alter table alarms drop column aggregation_value ;
alter table alarms drop column account_name ;
alter table alarms drop column subscriber_name ;
alter table alarms drop column subscriber_group ;
alter table alarms drop column outstanding_amount ;

alter table archived_alarms drop column aggregation_type ;
alter table archived_alarms drop column aggregation_value ;

alter table archived_alarms add reference_type  number(20) not null ;
alter table archived_alarms add reference_value  varchar2(40) not null ; 

alter table alarms add reference_type number(20) not null ;
alter table alarms add reference_value  varchar2(40) not null ;

create index IX_ALARMS_REFERENCE_TYPE on ALARMS("REFERENCE_TYPE") ;
create index IX_ALARMS_REFERENCE_VALUE on ALARMS("REFERENCE_VALUE") ;
create index IX_ARCH_ALRM_REF_TYPE on ARCHIVED_ALARMS("REFERENCE_TYPE") ;
create index IX_ARCH_ALRM_REF_VALUE on ARCHIVED_ALARMS("REFERENCE_VALUE") ;

DROP TABLE TEMP_CALL_TO_BY_ALERT_INFO ;
CREATE TABLE TEMP_CALL_TO_BY_ALERT_INFO (
    FRD_PHONE_NUMBER    VARCHAR2(20),
    SUBSCRIBER_ID       NUMBER(20,0),
    PHONE_NUMBER        VARCHAR2(20),
    ALERT_GEN_ID        NUMBER(20,0),
    ALARM_ID            NUMBER(20,0),
    IS_NEW_ALERT        NUMBER(20,0),
    MIN_DAY_OF_YEAR     NUMBER(20,0),
    MAX_DAY_OF_YEAR     NUMBER(20,0),
    EVENT_INSTANCE_ID   NUMBER(20,0)
) ;

ALTER TABLE CDR MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE ARCHIVED_CDR MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;

ALTER TABLE TEMP_CDR_0 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_1 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_2 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_3 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_4 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_5 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_6 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_7 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_8 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_9 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_10 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_11 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_12 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_13 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_14 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_15 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_16 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_17 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_18 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_19 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_20 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_21 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_22 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;
ALTER TABLE TEMP_CDR_23 MODIFY (OP_CALLING_CARD_NUMBER  VARCHAR2(40)) ;

----- DB View Creations For Expandable ---

CREATE OR REPLACE VIEW BILLING_NUMBER_SUMMARY AS (
	SELECT ALARM_ID, BILLING_NUMBER, COUNT(CDR_ID) AS CDR_COUNT, SUM(DURATION) AS TOTAL_DURATION, SUM(VALUE) AS TOTAL_VALUE 
		FROM (
			SELECT  AL.ALARM_ID, C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER ,C.ID AS CDR_ID, C.DURATION,	C.VALUE
					FROM ALERTS  AL, CDR C 
					WHERE C.ID IN (	SELECT 	DISTINCT CDR_ID 
										FROM ALERT_CDR 
										WHERE ALERT_ID = AL.ID AND RECORD_CATEGORY= 1 ) 
					AND AL.AGGREGATION_TYPE = 1000 
					AND C.CALLER_NUMBER = AL.AGGREGATION_VALUE  
			UNION
			SELECT  AL.ALARM_ID, C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER ,C.ID AS CDR_ID, C.DURATION,	C.VALUE
					FROM ALERTS  AL, CDR C 
					WHERE C.ID IN (	SELECT 	DISTINCT CDR_ID 
										FROM ALERT_CDR 
										WHERE ALERT_ID = AL.ID AND RECORD_CATEGORY= 1 ) 
					AND AL.AGGREGATION_TYPE = 1001 
					AND C.CALLED_NUMBER = AL.AGGREGATION_VALUE  
			UNION
			SELECT  AL.ALARM_ID, C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER ,C.ID AS CDR_ID, C.DURATION,	C.VALUE
					FROM ALERTS  AL, CDR C 
					WHERE C.ID IN (	SELECT 	DISTINCT CDR_ID 
										FROM ALERT_CDR 
										WHERE ALERT_ID = AL.ID AND RECORD_CATEGORY= 1 ) 
					AND AL.AGGREGATION_TYPE = 1002 
					AND C.OP_BILLED_PHONE_NUMBER = AL.AGGREGATION_VALUE  
			UNION
			SELECT  AL.ALARM_ID, C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER ,C.ID AS CDR_ID, C.DURATION,	C.VALUE
					FROM ALERTS  AL, CDR C 
					WHERE C.ID IN (	SELECT 	DISTINCT CDR_ID 
										FROM ALERT_CDR 
										WHERE ALERT_ID = AL.ID AND RECORD_CATEGORY= 1 ) 
					AND AL.AGGREGATION_TYPE = 2 
					AND C.PHONE_NUMBER = AL.AGGREGATION_VALUE  
				) GROUP BY ALARM_ID, BILLING_NUMBER
);

CREATE OR REPLACE VIEW BILLING_NUMBER_ALERT_VIEW AS (
	SELECT  DISTINCT AL.* , C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER
		FROM ALERTS AL, CDR C 
		WHERE C.CALLER_NUMBER = AL.AGGREGATION_VALUE 
		AND AL.AGGREGATION_TYPE = 1000 
		AND C.ID IN ( SELECT DISTINCT CDR_ID FROM ALERT_CDR WHERE ALERT_ID = AL.ID )
		AND AL.ALARM_ID IN (SELECT ID FROM ALARMS WHERE STATUS NOT IN ( 2, 4, 8))
	UNION
	SELECT  DISTINCT AL.* , C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER
		FROM ALERTS AL, CDR C 
		WHERE C.CALLED_NUMBER = AL.AGGREGATION_VALUE 
		AND AL.AGGREGATION_TYPE = 1001 
		AND C.ID IN ( SELECT DISTINCT CDR_ID FROM ALERT_CDR WHERE ALERT_ID = AL.ID )
		AND AL.ALARM_ID IN (SELECT ID FROM ALARMS WHERE STATUS NOT IN ( 2, 4, 8))
	UNION
	SELECT  DISTINCT AL.* , C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER
		FROM ALERTS AL, CDR C 
		WHERE C.OP_BILLED_PHONE_NUMBER = AL.AGGREGATION_VALUE 
		AND AL.AGGREGATION_TYPE = 1002 
		AND C.ID IN ( SELECT DISTINCT CDR_ID FROM ALERT_CDR WHERE ALERT_ID = AL.ID )
		AND AL.ALARM_ID IN (SELECT ID FROM ALARMS WHERE STATUS NOT IN ( 2, 4, 8))
	UNION
	SELECT  DISTINCT AL.* , C.OP_BILLED_PHONE_NUMBER AS BILLING_NUMBER
		FROM ALERTS AL, CDR C 
		WHERE C.PHONE_NUMBER = AL.AGGREGATION_VALUE 
		AND AL.AGGREGATION_TYPE = 2 
		AND C.ID IN ( SELECT DISTINCT CDR_ID FROM ALERT_CDR WHERE ALERT_ID = AL.ID )
		AND AL.ALARM_ID IN (SELECT ID FROM ALARMS WHERE STATUS NOT IN ( 2, 4, 8))
);

--------------------------- ------------------------------

-- Translations Entries
insert into translation_indices(id, description) values (42,'Reference Type') ;
insert into translation_indices(id, description) values (43,'Summary Info') ;

insert into translations(id, tr_id, key, value) values (141, 42, -176, 'select id as Key, description as Value from reference_types') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 43, -176, 'select id as Key, ''Summary Info'' as Value from alarms') ;

-- Record configs Entries --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(25,'BILLING_NUMBER_SUMMARY','Billing Number Summary',0,'ALARM_ID',1, '') ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter) values(26,'BILLING_NUMBER_ALERT_VIEW','Billing Number Alert View',0,'ID',1, '') ;

-- Record View Configs Entries --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(28,'Billing Number Summary',25,'','BILLING_NUMBER ASC', 0, 1, 0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(29,'Billing Number Alert View',26,'','ID ASC', 0, 1, 0) ;

--- Alarm View Entry Updation

update field_configs set name = 'Summary Info',is_expandable = 1, is_visible = 1, translation_id = 43 where record_config_id in (21, 22, 24) and database_field = 'ID' ;

-------- Billing Number Summary Field Configs Entries -------
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 25, 'Alarm ID', 'ALARM_ID', 1, null,1, 0, '', '',  20,null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 25, 'Billing Number', 'BILLING_NUMBER', 2, null,3, 1, '', '',  40,null, 1,1,1, '') ; 
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 25, 'Count Of Records', 'CDR_COUNT', 3, null,1, 0, '', '',  20,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 25, 'Total Duration', 'TOTAL_DURATION', 4, null,1, 0, '', '',  20,null, 1,1,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 25, 'Total Value', 'TOTAL_VALUE', 5, null,2, 0, '', '',  20,null, 1,1,'', '') ;

-------- Billing Number Alert View Field Configs Entries -------
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Billing Number', 'BILLING_NUMBER',1,null,3,0,'','',40,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Id', 'ID',2,null,1,0,'','',40,null,0,null,0) ; 
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Alarm Id', 'ALARM_ID',3,null,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Rule Name', 'EVENT_INSTANCE_ID',4,null,1,0,'','',40,25,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Value', 'VALUE',5,null,2,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Record Count', 'CDR_COUNT',6,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Repeat Count', 'REPEAT_COUNT',7,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Created Date','CREATED_DATE',8,null,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Modified Date','MODIFIED_DATE',9,null,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Score', 'SCORE',10,null,1,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Aggregation Type','AGGREGATION_TYPE',11,null,1,0,'','',40,12,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 26, 'Aggregation Value', 'AGGREGATION_VALUE',12,null,3,0,'','',40,null,1,0,1) ;


update field_configs set data_type = 3, reg_exp_id =2 where id = 27 ; 

update field_configs set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42 where id = 413 ; 
update field_configs set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where id = 414 ; 

update field_configs set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42  where id = 473 ; 
update field_configs set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where id = 474 ; 

update field_configs set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42  where id = 5413 ; 
update field_configs set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where id = 5414 ; 

update field_configs  set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42  where  database_field = 'AGGREGATION_TYPE' and record_config_id = 22 ;
update field_configs  set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where  database_field = 'AGGREGATION_VALUE' and record_config_id = 22 ;

update field_configs  set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42  where  database_field = 'AGGREGATION_TYPE' and record_config_id = 23 ;
update field_configs  set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where  database_field = 'AGGREGATION_VALUE' and record_config_id = 23 ;

update field_configs  set name = 'Reference Type', database_field = 'REFERENCE_TYPE', translation_id = 42  where  database_field = 'AGGREGATION_TYPE' and record_config_id = 24 ;
update field_configs  set name = 'Reference Value', database_field = 'REFERENCE_VALUE' where  database_field = 'AGGREGATION_VALUE' and record_config_id = 24 ;

ALTER TABLE AUDIT_FILES_PROCESSED ADD STATUS VARCHAR2(40) NOT NULL ;

DROP SEQUENCE ALARM_STATUS_ACTION_MAPS_SEQ ;
DROP TABLE ALARM_STATUS_ACTION_MAPS ;

DROP SEQUENCE REFERENCE_TYPES_MAPS_SEQ ;
DROP TABLE REFERENCE_TYPES_MAPS ;

DROP SEQUENCE REFERENCE_TYPES_SEQ ;
DROP TABLE REFERENCE_TYPES CASCADE CONSTRAINTS ;

CREATE SEQUENCE REFERENCE_TYPES_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 5 NOCYCLE CACHE 20 ORDER;
CREATE TABLE REFERENCE_TYPES
(
	   ID                                                              NUMBER(20) NOT NULL,
	   DESCRIPTION                                             VARCHAR2(256) NOT NULL,
	   RECORD_CONFIG_ID                                NUMBER(20) ,
	   CONSTRAINT PK_REFERENCE_TYPES_ID PRIMARY KEY(ID),
	   CONSTRAINT FK_REF_TYPES_REC_CFG_ID FOREIGN KEY (RECORD_CONFIG_ID) REFERENCES RECORD_CONFIGS(ID)
) ;


CREATE SEQUENCE REFERENCE_TYPES_MAPS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
CREATE TABLE REFERENCE_TYPES_MAPS
(
	   ID                                                              NUMBER(20) NOT NULL,
	   REFERENCE_TYPE                                  NUMBER(20) NOT NULL,
	   REFERENCE_VALUE_CATEGORY_ID             NUMBER(20) NOT NULL,
	   AGGREGATION_TYPE                                NUMBER(20) NOT NULL,
	   CONSTRAINT PK_REFERENCE_TYPES_MAPS PRIMARY KEY(REFERENCE_TYPE, REFERENCE_VALUE_CATEGORY_ID, AGGREGATION_TYPE),
	   CONSTRAINT UK_REFERENCE_TYPES_MAPS UNIQUE (AGGREGATION_TYPE),
	   CONSTRAINT FK_REF_TY_MP_REF_TYPE FOREIGN KEY(REFERENCE_TYPE) REFERENCES REFERENCE_TYPES(ID)
) ;


CREATE SEQUENCE ALARM_STATUS_ACTION_MAPS_SEQ INCREMENT BY 1 NOMAXVALUE ;
CREATE TABLE ALARM_STATUS_ACTION_MAPS
(
    ID                      NUMBER(20)   NOT NULL,
    STATUS                  NUMBER(20)   NOT NULL,
    ANALYST_ACTION_ID       NUMBER(20,0) NOT NULL,
    REFERENCE_TYPE          NUMBER(20)   NOT NULL,
    CONSTRAINT FK_ALM_REF_TYPE_ID FOREIGN KEY (REFERENCE_TYPE)  REFERENCES REFERENCE_TYPES(ID),
    CONSTRAINT FK_ALM_STUS_AC_MAP_STATUS  FOREIGN KEY (STATUS)  REFERENCES ALARM_STATUSES(ID),
    CONSTRAINT FK_ALM_STUS_AC_MAP_ACT_ID  FOREIGN KEY (ANALYST_ACTION_ID) REFERENCES ANALYST_ACTIONS(ID)
) ;


update field_categories set common_category_id=null where  id in(8,9) ;
update field_categories set regular_expression_id=1 where id = 1002 ;

insert into field_categories(id, name, category, data_type) values(87, 'Reference Type','',1) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 87, 10, '14') ;

insert into field_categories(id, name, category, data_type) values(88, 'Reference Value','',3) ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 88, 10, '15') ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1000, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1001, 3, '12') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1002, 3, '12') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1005, 'Origination Number Subscriber ID' , '', 8, null, 1005);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1005, 1, '4.32') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1006, 'Termination Number Subscriber ID' , '', 8, null, 1006);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1006, 1, '3.32') ;

insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID)
	values( 1007, 'Billing Number Subscriber ID' , '', 8, null, 1007);
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values
(field_record_config_map_seq.nextval, 1007, 1, '1535.32') ;

delete from actions_rules where action_id = 34 ;
delete from actions where id = 34 ;

delete from alarm_status_action_maps ;
delete from reference_types_maps ;
delete from reference_types ;

------- Reference Type Entries --------------
insert into reference_types(id, description, record_config_id) values(1, 'Phone Number', 3) ;
insert into reference_types(id, description, record_config_id) values(2, 'GBX Account Number', null) ;
insert into reference_types(id, description, record_config_id) values(3, 'Calling Card Number', null) ;

delete from aggregation_types_map where source_aggregation between 1000 and 1004 and datastream_record_config_id = 1;

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1000, 0, 1005, 1, '4.22', null) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1001, 0, 1006, 1, '3.22', null) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1002, 0, 1007, 1, '1535.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1003, 0, 16, 1, '6.22', null) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1004, 0, 16, 1, '6.22', null) ;


------- Reference Type Map Entries -----------
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 2, 1, 2 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1000, 1, 1000 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1001, 1, 1001 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1002, 1, 1002 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1003, 3, 1003 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1004, 2, 1004 ) ;

--------- Reference Type -- Billing Number --------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(1, 2, 24, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(2, 2, 25, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(3, 2, 26, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(4, 2, 27, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(5, 2, 28, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(6, 2, 30, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(7, 2, 31, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(8, 2, 33, 1) ;

--------- Reference Type -- GBX Account Number ---------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(9,  2, 24, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(10, 2, 25, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(11, 2, 26, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(12, 2, 27, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(13, 2, 28, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(14, 2, 30, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(15, 2, 31, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(16, 2, 33, 2) ;

--------- Reference Type -- Calling Card Number ---------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(17, 2, 24, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(18, 2, 25, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(19, 2, 26, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(20, 2, 27, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(21, 2, 28, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(22, 2, 30, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(23, 2, 31, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(24, 2, 33, 3) ;

----*********Insert counter clear action for all reference types for NFR   ***----
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(25, 4, 33, 1) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(26, 4, 33, 2) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(27, 4, 33, 3) ;

delete from alarm_status_action_maps where analyst_action_id in (select id from analyst_actions where name like 'Blacklist Subscriber/Account') ;
delete from analyst_actions where name like 'Blacklist Subscriber/Account' ;

delete from expandable_field_maps where id >= 1500 or id between 50 and 114 ;
--- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1500, 'Alarm-Phone no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1501, 'Alarm-Calling Card no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1502, 'Alarm-GBX Account no to Subscriber', 10, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1503, 'Alarm-Phone no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1504, 'Alarm-Calling Card no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1505, 'Alarm-GBX Account no to Subscriber', 16, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Closed Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1506, 'Alarm-Phone no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1507, 'Alarm-Calling Card no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1508, 'Alarm-GBX Account no to Subscriber', 17, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1509, 'Alarm-Phone no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1510, 'Alarm-Calling Card no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1511, 'Alarm-GBX Account no to Subscriber', 18, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Archieved Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1512, 'Alarm-Phone no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1513, 'Alarm-Calling Card no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1514, 'Alarm-GBX Account no to Subscriber', 19, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1515, 'Alarm-Phone no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1516, 'Alarm-Calling Card no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1517, 'Alarm-GBX Account no to Subscriber', 26, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');


-- Entries for Assigned case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1518, 'Alarm-Phone no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1519, 'Alarm-Calling Card no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1520, 'Alarm-GBX Account no to Subscriber', 27, 'REFERENCE_ID', 3, 'ID', 0, 2, 'RECORD_VIEW');

--- For Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1521, 'Alarm-Phone no to Subscriber', 10, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1522, 'Alarm-GBX Account no to Subscriber', 10, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Closed Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1523, 'Alarm-Phone no to Subscriber', 17, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1524, 'Alarm-GBX Account no to Subscriber', 17, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1525, 'Alarm-Phone no to Subscriber', 16, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1526, 'Alarm-GBX Account no to Subscriber', 16, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Archieved Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1527, 'Alarm-Phone no to Subscriber', 19, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1528, 'Alarm-GBX Account no to Subscriber', 19, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1529, 'Alarm-Phone no to Subscriber', 18, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1530, 'Alarm-GBX Account no to Subscriber', 18, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Assigned case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1531, 'Alarm-Phone no to Subscriber', 27, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1532, 'Alarm-GBX Account no to Subscriber', 27, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

-- Entries for Open case Alarms
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1533, 'Alarm-Phone no to Subscriber', 26, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,category) values (1534, 'Alarm-GBX Account no to Subscriber', 26, 'REFERENCE_VALUE', 4, 'ID', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (1535, 'Billing Number Subscriber Info', 1, 'OP_BILLED_PHONE_NUMBER', 3, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE'); 

 -- Entries for Billing Number - CDR 
 insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1536,'Alarm Billing Number To CDR',10,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');
 
-- Entries For Billing Number Summary
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1537,'Alarm Billing Number Summary Info',10,'ID',28,'ALARM_ID',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1538,'Billing Number to Alerts',28,'BILLING_NUMBER',29,'BILLING_NUMBER',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1539,'Alarm Billing Number Summary Info',16,'ID',28,'ALARM_ID',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1540,'Alarm Billing Number Summary Info',18,'ID',28,'ALARM_ID',1,1,'RECORD_VIEW');


insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1541,'Alarm Billing Number To CDR',16,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type,
	category) values (1542,'Alarm Billing Number To CDR',18,'REFERENCE_VALUE',1,'PHONE_NUMBER',1,1,'RECORD_VIEW');

--Updating IMEI Aggregation Type to have No Reference--
update aggregation_types_map set reference_category_id = 0 where source_aggregation = 3 ;

CREATE OR REPLACE VIEW ALARM_VIEWS
AS
(
    SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID, A.SCORE, A.VALUE, A.CDR_COUNT, A.PENDING_TIME, A.REFERENCE_TYPE, A.REFERENCE_VALUE,
        A.IS_VISIBLE, S.ACCOUNT_NAME, (S.FIRST_NAME||' '||S.MIDDLE_NAME||' '||S.LAST_NAME) SUBSCRIBER_NAME,
        S.GROUPS, C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS
        FROM ALARMS A, SUBSCRIBER_V S, ACCOUNT_CREDIT_DETAIL C
            WHERE A.REFERENCE_ID = S.SUBSCRIBER_ID
                AND S.ACCOUNT_ID = C.ACCOUNT_ID
                AND (A.REFERENCE_ID > 1024 OR  A.REFERENCE_ID in (2,4))
                AND A.IS_VISIBLE = 1
                AND A.REFERENCE_TYPE IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID = 3)
                AND A.STATUS NOT IN (7)
UNION ALL
    SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID, A.SCORE, A.VALUE, A.CDR_COUNT, A.PENDING_TIME, A.REFERENCE_TYPE, A.REFERENCE_VALUE,
        A.IS_VISIBLE, AC.ACCOUNT_NAME, (AC.FIRST_NAME||' '||AC.MIDDLE_NAME||' '||AC.LAST_NAME) SUBSCRIBER_NAME,
        '', C.OUTSTANDING_AMOUNT, A.DISPLAY_VALUE, A.RULE_IDS
        FROM ALARMS A, ACCOUNT AC, ACCOUNT_CREDIT_DETAIL C
            WHERE A.REFERENCE_ID = AC.ID
                AND AC.ID = C.ACCOUNT_ID
                AND (A.REFERENCE_ID > 1024 OR  A.REFERENCE_ID in (2,4))
                AND A.IS_VISIBLE = 1
                AND A.REFERENCE_TYPE IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID = 4)
                AND A.STATUS NOT IN (7)
UNION ALL
    SELECT A.NETWORK_ID, A.ID, A.REFERENCE_ID, A.CASE_ID, A.ALERT_COUNT, A.CREATED_DATE, A.MODIFIED_DATE,
        A.STATUS, A.USER_ID, A.SCORE, A.VALUE, A.CDR_COUNT, A.PENDING_TIME, A.REFERENCE_TYPE, A.REFERENCE_VALUE,
        A.IS_VISIBLE, 'Not Applicable', 'Not Applicable', 'Not Applicable', 0.0, A.DISPLAY_VALUE, A.RULE_IDS
        FROM ALARMS A
            WHERE (A.REFERENCE_TYPE IN (SELECT ID FROM REFERENCE_TYPES WHERE RECORD_CONFIG_ID is null)
                    OR A.REFERENCE_ID = 0)
                AND A.IS_VISIBLE = 1
                AND A.STATUS NOT IN (7)
) ;

commit;
spool off ;
exit ;
