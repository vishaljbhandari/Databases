
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (16, '0,1,2', GetParentID('Tasks'), 'Profile Management','/fp_element/index/54',0, 1, 'icons/fingerprintmanagement.png') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Add', '/fp_element/new/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Modify', '/fp_element/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Delete', '/fp_element/destroy;/fp_element/multiple_delete/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Show', '/fp_element/show/54', 0, 0) ;

-- Export / Import of Profile Elements
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Export Elements', '/fp_element/export_fp_elements/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Import Elements', '/fp_element/import_fp_elements/54', 0, 0) ;

insert into  ranger_groups_tasks select id, 16 from ranger_groups;


insert into  ranger_groups_tasks select r.id, t.id from ranger_groups r, tasks t where parent_id=16;


-- Fingerprint Elements --
insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter,category) values (45,'FP_ELEMENTS_V','Fingerprint Elements',0,'',1, '|','NAMED_FILTERS');
-- Fingerprint Elements --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(54,'Profile Elements',45,'','', 1, 0, 0, 1) ;

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 45, 'ID', 'ID', 0, 0, 1, 1) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width,reg_exp_id) values (field_configs_seq.nextval, 45, 'Name', 'NAME', 1, 1, 3, 2, 1,256, 9) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 45, 'Entity', 'ENTITY_ID', 2, 1, 1, 3, 72, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 45, 'Element Type', 'ELEMENT_TYPE', 3, 1, 1, 4, 65, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 45, 'Entity ID', 'ENTITY_ID', 0, 0, 3, 5) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, translation_id, is_filter) values (field_configs_seq.nextval, 45, 'Data Streams', 'RECORD_CONFIG_ID', 4, 1, 1, 6, 86, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 45, 'Profile Field', 'FIELD_ID', 0, 0, 1, 7) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Profile Field', 'ELEMENT_NAME', 5, 1, 3, 8, 1, 41, 10) ; 

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Retention Period (Day(s)/Effective Day(s))', 'TIME_WINDOW', 7, 1, 1, 10, 0, 41, 13) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (field_configs_seq.nextval, 45, 'Status', 'STATUS', 8, 1, 3, 9, 1, 41, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) values (field_configs_seq.nextval, 45, 'Rule Key', 'RULE_KEY', 0, 0, 1, 12) ;

--FP Elements to show function------
delete from field_configs where record_config_id=45 and name = 'Function';
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, translation_id)
values (FIELD_CONFIGS_SEQ.NEXTVAL, 45, 'Function', 'FUNCTION', 6, 1, 1, 11, 1, 154) ;

-- Element Types to dispaly---
insert into fp_element_types(id, name, element_pseudofunction_ids) values(1, 'Summary', '1,2,3,4,5,6,39,40,47,48,50,51,52') ;
-------- Source Entries for FP --
insert into source (id, description) values (41,'Profile Element');

insert into source_fms_log (id,event_name,source_id) values (153, 'Profile Element Added',41) ;
insert into source_fms_log (id,event_name,source_id) values (154, 'Profile Element Updated',41) ;
insert into source_fms_log (id,event_name,source_id) values (155, 'Profile Element Deleted',41) ;

insert into audit_log_event_codes values (661,'Profile Element Added', 'Profile Element ''$1'' was added', 41) ;
insert into audit_log_event_codes values (662,'Profile Element Updated', 'Profile Element ''$1'' was updated', 41) ;
insert into audit_log_event_codes values (663,'Profile Element Deleted', 'Profile Element ''$1'' was deleted', 41) ;

insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_LAST_RUN_IDENTIFIER_2_0',	9999) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_NUM_PARTITIONS', 4) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'PROFILE_COUNTER_STORAGE_DAYS','5' ) ;


commit ;
