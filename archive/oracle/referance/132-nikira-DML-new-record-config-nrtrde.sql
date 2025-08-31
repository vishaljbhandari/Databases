spool nikira-DML-new-record-config-nrtrde.log
set feedback off ;
set serveroutput off ;

insert into record_configs (id, tname, description, cacheable, key, is_visible, delimeter, category) values (42,'VPMN_INFO','Partner Information',0,'ID',1,',','NAMED_FILTERS') ;

-- Field Configs for NRTRDE - Partner Information

insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, derivative_function) values (1500, 42, 'ID', 'ID', '', 0,  8,  1, 0, 20, 13, '28') ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1501, 42, 'VPMN', 'VPMN', 1, 1,  3,  2, 1, 64, 18) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1503, 42, 'Description', 'DESCRIPTION', 2, 1,  3,  4, 1, 4000, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (1504, 42, 'Country', 'COUNTRY', 3, 1,  3,  5, 1, 128, 10, 41) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1505, 42, 'Contact Person', 'CONTACT_PERSON_NAME', 4, 1,  3,  6, 1, 256, 18) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1506, 42, 'Contact Person Phone Number', 'CONTACT_PERSON_PHONE_NUMBER', 5, 1,  3,  7, 1, 32, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1507, 42, 'Contact Person Fax', 'CONTACT_PERSON_FAX', 6, 1,  3,  8, 1, 32, 1) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1508, 42, 'Contact Person Email', 'CONTACT_PERSON_EMAIL_ID', 7, 1,  3,  9, 1, 256, 15) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1509, 42, 'Contact Person Address Line 1', 'CONTACT_PERSON_ADDRESS_LINE1', 8, 1,  3,  10, 1, 4000, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1510, 42, 'Contact Person Address Line 2', 'CONTACT_PERSON_ADDRESS_LINE2', 9, 1,  3,  11, 1, 4000, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1511, 42, 'Contact Person Address Line 3', 'CONTACT_PERSON_ADDRESS_LINE3', 10, 1,  3,  12, 1, 4000, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (1512, 42, 'Contact Person Address Line 4', 'CONTACT_PERSON_ADDRESS_LINE4', 11, 1,  3,  13, 1, 4000, 10) ; 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id, translation_id) values (1513, 42, 'Network', 'NETWORK_ID', 12, 1,  1,  14, 0, 10, 0, 10) ; 
--VPMN record view
insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, is_primary_view,help_file_key,fetch_record) values(49,'NRTRDE Partners',42,'ID ASC', 1, 1, 1,'NRTRDE_PARTNERS_RECORD_VIEW',0) ;
------------------------------------------- Expandable Field Maps entries for VPMN ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (119, 'Alarm-VPMN-Details', 10, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW WORK_FLOW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (120, 'Alarm-VPMN-Details', 10, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (126, 'Alarm-VPMN-Details', 16, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (127, 'Alarm-VPMN-Details', 16, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (128, 'Alarm-VPMN-Details', 17, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (129, 'Alarm-VPMN-Details', 17, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (130, 'Alarm-VPMN-Details', 18, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (131, 'Alarm-VPMN-Details', 18, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (132, 'Alarm-VPMN-Details', 19, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (133, 'Alarm-VPMN-Details', 19, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (154, 'Alarm-VPMN-Details', 96, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 5, 42, '14') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 4000, 42, '514.1') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 1, 42, '1') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (150, 'Alarm-VPMN-Details', 95, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'ASSIGN_ALARM_RULE', 0);

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (210, 'Alarm-VPMN-Details', 118, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (211, 'Alarm-VPMN-Details', 118, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);

--Entry added to  handle the duplicate VPMN record-------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (514, 'VPMN-Details-VPMN Details VPMN', 49, 'VPMN', 49, 'VPMN', 0, 213, '');

commit ;

