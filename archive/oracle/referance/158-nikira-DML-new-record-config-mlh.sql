spool nikira-DML-new-record-config-mlh.log
set feedback off ;
set serveroutput off ;

--MLH

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(9,'Active Parent Account',12,'(ID > 1024) AND ACCOUNT_TYPE = 0','ID ASC', 0, 0, 0) ;
--- For MLH  
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (350, 4, 'Parent Account Name', '', 18, 0, 0, '', 3,'', 32, '', null, 0, 41, null, 25.1, null) ;
insert into field_configs(id,record_config_id,name,database_field,position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (367, 4, 'Root Account Name', '', 19, 0, 0, '', 3, '', 49, '', null, 0, 257, null, '30.1', null) ;
--
--MLH
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (25, 'Parent Account Details', 4, 'PARENT_ID', 9, 'ID', 0, 9999, '') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (26, 'Previous Active Account Details For Parent Account', 9, 'ACCOUNT_NAME', 22, 'ACCOUNT_NAME', 0, 9999, '') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (27, 'Previous Blacklist Account Details For Parent Account', 9, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 9999, '') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (28, 'Previous Blacklist Account Details For Account', 4, 'ACCOUNT_NAME', 13, 'ACCOUNT_NAME', 0, 9999, '') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (29, 'Previous Active Account Details For Account', 4, 'ACCOUNT_NAME', 22, 'ACCOUNT_NAME', 0, 9999, '') ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (30, 'Root Account Details', 4, 'HIERARCHY_ID', 9, 'ID', 0, 9999, '') ;

--
--Active and Suspended Subscriber to Account--
delete from expandable_field_maps where id=134 and name='Account Details' ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type)
    values (134, 'Account Details', 21, 'ACCOUNT_ID', 4, 'ID', 0, 1, 'RECORD_VIEW GR RULE',1);
--MLH
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 58, 4, '29.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 100, 4, '25.26.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 102, 4, '31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 102, 3, '5.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 103, 4, '25.31') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 104, 4, '30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 104, 3, '5.30') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 105, 4, '25.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 24, 12, '19') ;
--MLH
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 61, 4, '28.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 101, 4, '25.27.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 109, 4, '30.27.19') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 112, 4, '25.27.30') ;
--
commit ;

