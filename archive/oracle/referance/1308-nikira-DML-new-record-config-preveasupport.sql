spool nikira-DML-new-record-config-preveasupport.log
set feedback off ;
set serveroutput off ;

-----------PROFILE FIELDS----------
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(84,'PREVEA_PROFILE_FIELDS','profile fields',0,'ACCOUNT_ID',1) ;


delete from field_configs where record_config_id=3 and database_field='IS_UPDATE'; 
insert into field_configs(id,record_config_id,name,database_field , position,is_expandable,is_visible,ds_category,data_type,format,field_id,query_field,translation_id,is_filter,width,reg_exp_id,associated_field,derivative_function) values (field_configs_seq.nextval, 3, 'Is Update', 'IS_UPDATE', 0, 0, 0, '', 1, '', 78, '', null, 0, 1,null, null, 101) ;
--- *******************PROFILE FIELDS *******************

insert into field_configs(id,record_config_id,name,database_field,is_expandable,is_visible,data_type,format,field_id,query_field,translation_id,is_filter,width) values (field_configs_seq.nextval, 84, 'ACCOUNT ID', 'ACCOUNT_ID',  0, 0, 8,'', 1, '', null, 1, 41 ) ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2066, 3, '78') ;
--- *******************PROFILE FIELDS *******************

insert into record_view_configs (id, name, record_config_id, is_pagination_enabled, is_visible) values( 106,	'Profile Fields', 84, 0, 1) ;
-------PROFILE FIELDS-------------

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type)  values (168, 'Account Profile Fields', 4, 'ID', 106, 'ACCOUNT_ID', 0, 7, 'RECORD_VIEW GR RULE', 2);
commit ;

