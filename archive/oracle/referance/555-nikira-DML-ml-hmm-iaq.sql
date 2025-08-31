-- ********************************************************************************
-- *  Copyright(c) Subex Systems Limited 2006. All Rights Reserved.               *
-- *  The copyright to the Computer Program(s) herein is the property of Subex    *
-- *  systems limited. the program(s) may be used and/or copied with the written  *
-- *  permission from subex systems limited or in accordance with the terms and   *
-- *  conditions stipulated in the agreement/contract under which the program(s)  *
-- *  have been supplied.                                                         *
-- ********************************************************************************
SPOOL mlaqhmm-exec.log
delete ml_hmm_band ;

insert into ml_hmm_band values (1, 1, 0, 10) ;
insert into ml_hmm_band values (2, 1, 10, 20) ;
insert into ml_hmm_band values (3, 1, 20, 30) ;
insert into ml_hmm_band values (4, 1, 30, 40) ;
insert into ml_hmm_band values (5, 1, 40, 50) ;
insert into ml_hmm_band values (6, 1, 50, 60) ;
insert into ml_hmm_band values (7, 1, 60, 70) ;
insert into ml_hmm_band values (8, 1, 70, 80) ;
insert into ml_hmm_band values (9, 1, 80, 90) ;
insert into ml_hmm_band values (10, 1, 90, 101) ;
insert into ml_hmm_band values (11, 1, null, 0) ;
insert into ml_hmm_band values (11, 1, 101, null) ;

insert into ml_hmm_band values (1, 2, null, 5) ;
insert into ml_hmm_band values (2, 2, 5, 10) ;
insert into ml_hmm_band values (3, 2, 10, 20) ;
insert into ml_hmm_band values (4, 2, 20, 30) ;
insert into ml_hmm_band values (5, 2, 30, 100) ;
insert into ml_hmm_band values (6, 2, 100, null) ;

insert into ml_hmm_band values (1, 3, null, 100) ;
insert into ml_hmm_band values (2, 3, 100, 1000) ;
insert into ml_hmm_band values (3, 3, 1000, null) ;

insert into ml_hmm_band values (1, 4, null, 0) ;
insert into ml_hmm_band values (2, 4, 0, 30) ;
insert into ml_hmm_band values (3, 4, 30, 60) ;
insert into ml_hmm_band values (4, 4, 60, 90) ;
insert into ml_hmm_band values (5, 4, 90, 120) ;
insert into ml_hmm_band values (6, 4, 120, 150) ;
insert into ml_hmm_band values (7, 4, 150, 180) ;
insert into ml_hmm_band values (8, 4, 180, 360) ;
insert into ml_hmm_band values (9, 4, 360, null) ;

delete from configurations where config_key = 'ML.AQ.HMM.ID' ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'ML.AQ.HMM.ID', 1025) ;

delete from configurations where config_key = 'ML.AQ.HMM.USE_TYPE' ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'ML.AQ.HMM.USE_TYPE' , '0') ;

delete from configurations where config_key = 'ML.AQ.HMM.MODEL.GENERATOR.LAST.RUN.DATE' ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'ML.AQ.HMM.MODEL.GENERATOR.LAST.RUN.DATE' , '1970/01/01 00:00:00') ;

delete from ml_hmm_aq ;
insert into ml_hmm_aq values (1025, 2025, 3025, 16, sysdate) ; 

delete from ml_hmm_info ;
delete from ml_hmm ;

insert into ml_hmm values (2025, 0, 2, 2, sysdate, 0, 0) ;
insert into ml_hmm values (3025, 0, 2, 2, sysdate, 0, 0) ;

insert into ml_hmm_info values (2025, 0, 1, 0, 0, 0) ;
insert into ml_hmm_info values (2025, 0, 2, 0, 0, 0) ;

insert into ml_hmm_info values (3025, 0, 1, 0, 0, 0) ;
insert into ml_hmm_info values (3025, 0, 2, 0, 0, 0) ;

delete from ml_hmm_info_int ;
delete from ml_hmm_int ;

insert into ml_hmm_int values (2025, 2, 2) ;
insert into ml_hmm_int values (3025, 2, 2) ;

insert into ml_hmm_info_int values (2025, 1, 0, 0, 0) ;
insert into ml_hmm_info_int values (2025, 2, 0, 0, 0) ;

insert into ml_hmm_info_int values (3025, 1, 0, 0, 0) ;
insert into ml_hmm_info_int values (3025, 2, 0, 0, 0) ;

-- HMM Alerts View --
insert into record_configs (id, tname, description, cacheable, is_visible, is_partitioned) 
	values(108,'ML_HMM_ALERTS_V','Alerts Info for HMM IAQ', 0, 0, 0) ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alarm ID', 'ALARM_ID', 1, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alerts Rule Keys', 'ALERTS_RULE_KEYS', 2, 0, 3, 2) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alerts Repeat Counts', 'ALERTS_REPEAT_COUNTS', 3, 0, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alerts Values', 'ALERTS_VALUES', 4, 0, 3, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alerts Created Dates', 'ALERTS_CREATED_DATES', 5, 0, 3, 5) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
	values (field_configs_seq.nextval, 108, 'Alerts Severities', 'ALERTS_SEVERITIES', 6, 0, 3, 6) ; 

insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view) 
	values(129,'HMM Alerts View',108,'', 0, 0, 0) ;

-- Alarms To HMM Alerts View Association --
insert into expandable_field_maps
	(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, data_record_type) 
	values (expandable_field_maps_seq.nextval, 'Alarm-HmmAlertsView', 95, 'ID', 129, 'ALARM_ID', 0, 0, 0);

-- Field Categories for HMM
insert into field_categories(id, name, data_type) values(3000, 'Alerts Rule Keys', 3) ;
insert into field_categories(id, name, data_type) values(3001, 'Alerts Repeat Counts', 3) ;
insert into field_categories(id, name, data_type) values(3002, 'Alerts Values', 3) ;
insert into field_categories(id, name, data_type) values(3003, 'Alerts Created Dates', 3) ;
insert into field_categories(id, name, data_type) values(3004, 'Alerts Severities', 3) ;

-- Additional Entries in field_record_config_maps for alarm
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,3000,10, expandable_field_maps_seq.currval || '.2');
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,3001,10, expandable_field_maps_seq.currval || '.3');
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,3002,10, expandable_field_maps_seq.currval || '.4');
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,3003,10, expandable_field_maps_seq.currval || '.5');
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,3004,10, expandable_field_maps_seq.currval || '.6');
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) 
	values(field_record_config_map_seq.nextval,48,10,'21');


commit ;
