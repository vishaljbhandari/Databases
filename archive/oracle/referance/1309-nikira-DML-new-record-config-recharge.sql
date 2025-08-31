spool nikira-DML-new-record-config-recharge.log
set feedback off ;
set serveroutput off ;



insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
	values (7, 'Account Recharge Details', 4, 'ID', 6, 'ACCOUNT_ID', 0, 24, 'RECORD_VIEW');


-- Entries for Prepaid Top Ups
insert into record_configs (id, tname, description, cacheable, is_visible,category)
	values(60,'PREPAID_TOP_UPS_V', 'Prepaid Top Ups', 0, 1, 'NAMED_FILTERS' ) ;


insert into record_view_configs (id, name, record_config_id, order_by, is_pagination_enabled, is_visible, 
									is_primary_view, is_logging_enabled) 
	values(71,'Prepaid Top Ups', 60, 'ID ASC', 1, 1, 1, 1) ;
	

insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width, translation_id) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Recharge Type', 'RECHARGE_TYPE', 6, 1, 1, 7, 1, 2, 17) ;
------------------------------------------
	
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, 
								data_type, field_id, is_filter, width) 
	values  (FIELD_CONFIGS_SEQ.nextval, 60, 'ID','ID', 1 , 0, 1, 1, 0, 1) ;

insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Rate Plan', 'RATE_PLAN', 2, 1, 3, 2, 1, 256, 8) ;
	
insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Min Amount', 'MIN_AMOUNT', 3, 1, 2, 3, 1, 22, 12) ;

insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width, reg_exp_id) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Max Amount', 'MAX_AMOUNT', 4, 1, 2, 4, 1, 22, 12) ;

insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Description', 'DESCRIPTION', 4, 1, 3, 5, 0, 256) ;

insert into field_configs(id, record_config_id, name,database_field, position, is_visible, data_type, field_id, is_filter, width, translation_id) values (FIELD_CONFIGS_SEQ.nextval, 60, 'Network', 'NETWORK', 5, 0, 7, 6, 0, 256, 10) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 5, 60, '6') ;

--------------------------------Field Configs Additionals--------------------------------------------
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,3,60,'IS_CURRENCY',1);

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,4,60,'IS_CURRENCY',1);

------------------------------------------- Expandable Field Maps entries for Closed/Archived Alarm Views ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category)
	values (189, 'Account Recharge Details', 103, 'ACCOUNT_NAME', 6, 'ACCOUNT_NAME', 0, 7, 'RECORD_VIEW GR RULE');
commit ;

