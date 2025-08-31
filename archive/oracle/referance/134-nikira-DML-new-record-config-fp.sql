spool nikira-DML-new-record-config-fp.log
set feedback off ;
set serveroutput off ;

-- Fingerprint Elements --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values (45,'FP_ELEMENTS_V','Fingerprint Elements',0,'',1, '|','NAMED_FILTERS');
--  *************** ---
-- Other Rules (For FingerPrint Rules)
delete from record_configs where id=119 and tname='RULES_V' and description='Fingerprint Rules' ;
Insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values(119,'RULES_V', 'Fingerprint Rules',0,'',1, '|', 'NAMED_FILTERS' ) ;


-- Translations For Stats Rule Aggregation Type --
insert into translation_indices(id, description) values (546,'Aggregation Type - FingerPrint Rules') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 546, '-176', 'select id as Key, name as Value from field_categories where upper(category) like ''%FINGERPRINT_RULE_AGG_TYPE%'' order by name' ) ;

insert into translation_indices(id, description) values (544,'Entity Type - FingerPrint Rules') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 544, '-176', 'select id as Key, description as Value from record_configs where is_visible = 1 and category like ''%FINGERPRINT_RULE_ENTITY_TYPE%'' order by description' ) ;

-- Fingerprint Elements --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(54,'Subscriber eFingerprint Elements',45,'ENTITY_ID=16','', 1, 0, 0, 1) ;

---------- ********************************************--
-- Fingerprint Rules --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(62,'eFingerprint Rules',119,'CATEGORY = ''FINGERPRINT_RULE'' AND IS_ACTIVE = 1','ID ASC', 1, 0, 0, 1) ;

-- FieldConfigs for Rule Management - Other Rules --
delete from field_configs where record_config_id = 119 ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 119, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 119, 'Rule Name', 'NAME', 1, 1, 3, 2, 1, 41, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 119, 'Parent Template', 'PARENT_TEMPLATE', 2, 0, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 119, 'KEY', 'KEY', 0, 0, 1, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 119, 'Entity Type', 'DATA_STREAMS', 3, 1, 7, 5, 544, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (field_configs_seq.nextval, 119, 'Aggregate On', 'AGGREGATION_TYPE', 4, 1, 1, 6, 546,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (field_configs_seq.nextval, 119, 'Function', 'FUNCTION', 5, 1, 1, 7, 66,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 119, 'Network', 'NETWORK_ID', 6, 1, 7, 11, 10, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 119, 'Status', 'STATUS', 7, 1, 3, 8, 1, 41, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 119, 'User', 'USERNAME', 8, 1, 3, 9, 1, 41, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 119, 'Tags', 'TAGS', 0, 0, 7, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 119, 'Description', 'DESCRIPTION', 0, 1, 3, 12) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 119, 'Notification Pack', 'NOTIFICATION_PACKS', 0, 1, 7, 13, 74, 1) ;

--Entries for Rules
delete from field_record_config_maps where record_config_id=119 ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 119, '11') ;

-- FieldConfigs for Fingerprint Management 

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3032, 45, 'ID', 'ID', 0, 0, 1, 1) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width,reg_exp_id) values (3033, 45, 'Name', 'NAME', 1, 1, 3, 2, 1,256, 9) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3034, 45, 'Element Type', 'ELEMENT_TYPE', 2, 1, 1, 3, 65, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3035, 45, 'Entity ID', 'ENTITY_ID', 0, 0, 3, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (3036, 45, 'Data Streams', 'RECORD_CONFIG_ID', 3, 1, 1, 5, 562, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (3037, 45, 'Profile Field', 'FIELD_ID', 0, 0, 1, 6) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (3038, 45, 'Profile Element', 'ELEMENT_NAME', 4, 1, 3, 7, 1, 41, 10) ; 

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Time Window (Day(s))', 'TIME_WINDOW', 5, 1, 1, 9, 0, 41, 13) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Status', 'STATUS', 6, 1, 3, 8, 1, 41, 10) ; 

--FP Elements to show function------
delete from field_configs where record_config_id=45 and name = 'Function';
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id)
values (FIELD_CONFIGS_SEQ.NEXTVAL, 45, 'Function', 'FUNCTION', 5, 1, 1, 10, 66) ;

commit ;

