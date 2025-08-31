spool nikira-DML-new-record-config-statistical-rule.log
set feedback off ;
set serveroutput off ;

-- Statistical Rule Elements
delete from record_view_configs where record_config_id =79;
delete from field_configs where record_config_id =79;
delete from record_configs where id=79 ;
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values (79,'STATRULES_V','Statistical Rule Elements', 0, '', 1, '|','NAMED_FILTERS');

-- Other Rules (For Statistical Rules)
delete from field_configs where record_config_id = 91 ;
delete from field_record_config_maps where record_config_id=91 ;

insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values(91,'RULES_V', 'Statistical Rules',0,'',1, '|', 'NAMED_FILTERS' ) ;

-- Translations For Stats Rule Aggregation Type --
insert into translation_indices(id, description) values (525,'Aggregation Type - Statistical Rules') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 525, '-176', 'select id as Key, name as Value from field_categories where upper(category) like ''%STATS_RULE_AGG_TYPE%'' order by name' ) ;

insert into translation_indices(id, description) values (545,'Entity Type - Statistical Rules') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 545, '-176', 'select id as Key, description as Value from record_configs where is_visible = 1 and category like ''%STATS_RULE_ENTITY_TYPE%'' order by description' ) ;

-- Statistical Rule Elements --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(93,'Statistical Rule Elements',79,'','', 1, 0, 0, 1) ;

-- Statistical Rules
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(94,'Statistical Rules',91,'IS_ACTIVE = 1 AND CATEGORY = ''STATISTICAL_RULE''','KEY ASC', 1, 0,0, 1) ;

-- FieldConfigs for Rule Management - Other Rules --
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 91, 'ID', 'ID', 0, 0, 1, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 91, 'Rule Name', 'NAME', 1, 1, 3, 2, 1, 41, 14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 91, 'Parent Template', 'PARENT_TEMPLATE', 2, 0, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 91, 'KEY', 'KEY', 0, 0, 1, 4) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 91, 'Entity Type', 'DATA_STREAMS', 3, 1, 7, 5, 545, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (field_configs_seq.nextval, 91, 'Aggregate On', 'AGGREGATION_TYPE', 4, 1, 1, 6, 525,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (field_configs_seq.nextval, 91, 'Function', 'FUNCTION', 5, 1, 1, 7, 66,1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 91, 'Network', 'NETWORK_ID', 6, 1, 7, 11, 10, 0) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 91, 'Status', 'STATUS', 7, 1, 3, 8, 1, 41, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 91, 'User', 'USERNAME', 8, 1, 3, 9, 1, 41, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 91, 'Tags', 'TAGS', 0, 0, 7, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 91, 'Description', 'DESCRIPTION', 0, 1, 3, 12) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, translation_id) values (field_configs_seq.nextval, 91, 'Notification Pack', 'NOTIFICATION_PACKS', 0, 1, 7, 13, 1, 74) ;

--Entries for Rules
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  5, 91, '11') ;

-- FieldConfigs for Statistical Rule Elements
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 79, 'ID', 'ID', 0, 0, 1, 1) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 79, 'Name', 'NAME', 1, 1, 3, 2, 1, 41,14) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 79, 'Description', 'DESCRIPTION', 2, 1, 3, 3) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 79, 'Entity Type', 'ENTITY_ID', 3, 1, 1, 4, 72, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 79, 'Data Streams', 'RECORD_CONFIG_ID', 4, 1, 7, 5, 71, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id) values (field_configs_seq.nextval, 79, 'Time Window', 'TIME_WINDOW', 5, 1, 1, 6, 9) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 79, 'Rule Key', 'RULE_KEY', 0, 0, 1, 7) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (field_configs_seq.nextval, 79, 'Status', 'STATUS', 6, 1, 3, 8, 1, 41, 10, 105) ; 

--Statistical Rule Elements to show function------
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id,is_filter) values (FIELD_CONFIGS_SEQ.NEXTVAL, 79, 'Function', 'FUNCTION', 7, 1, 1, 9, 154,1) ;
commit ;
commit ;

