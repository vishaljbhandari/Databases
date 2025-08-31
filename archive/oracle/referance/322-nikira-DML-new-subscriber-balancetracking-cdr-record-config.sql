spool nikira-DML-new-subscriber-balancetracking-cdr-record-config.log
set feedback off ;
set serveroutput off ;

---Subscriber field_configs for BALANCE_SUBSCRIBER_SUPPORT

ALTER TABLE ARCHIVED_SUBSCRIBER ADD
(
        VOUCHER_EXPIRY_DATE                             DATE,
        GRACE_PERIOD_EXPIRY_DATE                        DATE,
        CURRENT_BALANCE                                 NUMBER(16,6),
        CURRENT_BALANCE_TIME                            DATE,
        DAILY_BALANCE                                   NUMBER(16,6),
        DAILY_BALANCE_TIME                              DATE,
        PREVIOUS_BALANCE                                NUMBER(16,6),
        LAST_RECHARGE_DATE                              DATE,
        LAST_CDR_TIME                                   DATE
) ; 

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Voucher Expiry Date', 'VOUCHER_EXPIRY_DATE', '33', 0, 1, null, 4, null, 67, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Grace Period Expiry Date', 'GRACE_PERIOD_EXPIRY_DATE', '34', 0, 1, null, 4, null, 66, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Current Balance', 'CURRENT_BALANCE', '35', 0, 1, 'GR ENTITY_DATA CR', 2, null, 56, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Current Balance Time', 'CURRENT_BALANCE_TIME', '36', 0, 1, null, 4, null, 65, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Daily Balance', 'DAILY_BALANCE', '37', 0, 1, null, 2, null, 58, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Daily Balance Time', 'DAILY_BALANCE_TIME', '38', 0, 1, null, 4, null, 59, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Previous Balance', 'PREVIOUS_BALANCE', '39', 0, 1, 'GR', 2, null, 63, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Last Recharge Date', 'LAST_RECHARGE_DATE', '40', 0, 1, null, 4, null, 61, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Last CDR Time', 'LAST_CDR_TIME', '41', 0, 1, null, 4, null, 64, null, null, 1, 25,0, null, null, null, 0, 0) ;


---Subscriber field_configs for precheck for BALANCE_SUBSCRIBER_SUPPORT


insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Voucher Expiry Date', 'VOUCHER_EXPIRY_DATE', '33', 0, 1, null, 4, null, 67, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Grace Period Expiry Date', 'GRACE_PERIOD_EXPIRY_DATE', '34', 0, 1, null, 4, null, 66, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Current Balance', 'CURRENT_BALANCE', '35', 0, 1, 'GR ENTITY_DATA CR', 2, null, 56, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Current Balance Time', 'CURRENT_BALANCE_TIME', '36', 0, 1, null, 4, null, 65, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Daily Balance', 'DAILY_BALANCE', '37', 0, 1, null, 2, null, 58, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Daily Balance Time', 'DAILY_BALANCE_TIME', '38', 0, 1, null, 4, null, 59, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Previous Balance', 'PREVIOUS_BALANCE', '39', 0, 1, 'GR', 2, null, 63, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Last Recharge Date', 'LAST_RECHARGE_DATE', '40', 0, 1, null, 4, null, 61, null, null, 1, 25,0, null, null, null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,121, 'Last CDR Time', 'LAST_CDR_TIME', '41', 0, 1, null, 4, null, 64, null, null, 1, 25,0, null, null, null, 0, 0) ;




---Subscriber basic_filter_configs for BALANCE_SUBSCRIBER_SUPPORT

insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 56, 0, 56, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 58, 0, 58, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 59, 10, 59, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 61, 10, 61, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 63, 0, 63, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 64, 10, 64, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 65, 10, 65, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 66, 10, 66, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 3.0, 67, 10, 67, 0, '01-01-1970', '31-12-9999', null ) ;


insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 56, 0, 56, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 58, 0, 58, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 59, 10, 59, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 61, 10, 61, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 63, 0, 63, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 64, 10, 64, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 65, 10, 65, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 66, 10, 66, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 12.0, 67, 10, 67, 0, '01-01-1970', '31-12-9999', null ) ;
   
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 56, 0, 56, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 58, 0, 58, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 59, 10, 59, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 61, 10, 61, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 63, 0, 63, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 64, 10, 64, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 65, 10, 65, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 66, 10, 66, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 100.0, 67, 10, 67, 0, '01-01-1970', '31-12-9999', null ) ;


insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 56, 0, 56, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 58, 0, 58, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 59, 10, 59, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 61, 10, 61, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 63, 0, 63, 0, '', '', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 64, 10, 64, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 65, 10, 65, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 66, 10, 66, 0, '01-01-1970', '31-12-9999', null ) ;
insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 3, 105.0, 67, 10, 67, 0, '01-01-1970', '31-12-9999', null ) ;
   
---- Change the sortable_fields entry with the sortable field_ids from the BLK DATA Viewer Window
update bulk_data_view_configs set sortable_fields = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,31,33,35,40,41,43,56,58,59,61,63,64,65,66,67' where record_view_config_id = 3;

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,56,3,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,56,3,'FLOAT_PRECISION',2);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,58,3,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,58,3,'FLOAT_PRECISION',2);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,63,3,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,63,3,'FLOAT_PRECISION',2);

--Making is_visible false for account_recharge_detail
update field_configs set is_visible = 0 where record_config_id = 6 and position between 2 and 7;

--Making expandable of account_recharge_detail invisible from client
update expandable_field_maps set category = '' where id = 16;
update expandable_field_maps set category = '' where id = 189;
update expandable_field_maps set category = '' where id = 7;

--Disabling system rules doing upsert to account_recharge_detail
update rules set IS_ENABLED = 0 where name = 'Upsert Recharge Details'; 
update rules set is_enabled = 0 where name = 'RuleForPrepaidUpdation';
update rules set is_enabled = 0 where name = 'RuleForPrepaidUpdation For Recharge';

--expandable view change to reffer subscriber table instead of account_recharge table

update field_record_config_maps set field_association = '251.67' where record_config_id = 1 and field_category_id = 42 and field_association = '251.5.7.2' ;
update field_record_config_maps set field_association = '31' where record_config_id = 1 and field_category_id = 43 and field_association = '251.5.7.3' ;

update field_record_config_maps set field_association = '251.67' where record_config_id = 109 and field_category_id = 42 and field_association = '251.5.7.2' ;
update field_record_config_maps set field_association = '31' where record_config_id = 109 and field_category_id = 43 and field_association = '251.5.7.3' ;

update field_record_config_maps set field_association = '252.67' where record_config_id = 7 and field_category_id = 42 and field_association = '252.5.7.2' ;
update field_record_config_maps set field_association = '32' where record_config_id = 7 and field_category_id = 43 and field_association = '252.5.7.3' ;

insert into field_record_config_maps(id, field_association, record_config_id, field_category_id) values (field_record_config_map_seq.nextval, '56', 3, 56);
insert into field_record_config_maps(id, field_association, record_config_id, field_category_id) values (field_record_config_map_seq.nextval, '31', 1, 56);
insert into field_record_config_maps(id, field_association, record_config_id, field_category_id) values (field_record_config_map_seq.nextval, '32', 7, 56);
update field_record_config_maps set field_association = '21' where record_config_id = 2 and field_category_id = 56 and field_association = '253.5.7.3' ;

--Assosiated information to be displayed with Current balance field
update user_options set value = value ||','||56 where option_id = '102.SelectedFields' and user_id = 'default' ;
update user_options set value = value ||','||56 where option_id = '102.SelectedFields' and user_id = 'nadmin' ;
update user_options set value = value ||','||56 where option_id = '102.SelectedFields' and user_id = 'radmin' ;

update user_options set value = value ||','||56 where option_id = '3.SelectedFields';
update user_options set value = value ||','||56 where option_id = '100.SelectedFields';

update user_options set value = value ||','||31 where option_id = '1.SelectedFields';
update user_options set value = value ||','||21 where option_id = '2.SelectedFields';


--CDR field_configs
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Current Balance', 'CURRENT_BALANCE', '24', 0, 1, 'GR ENTITY_DATA CR', 2, null, 31, null, null, 1, 40,0, null, null, null, 0, 0) ;

insert into field_configs (select FIELD_CONFIGS_SEQ.nextval,109,name,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,IS_CASE_SENSITIVE from field_configs where RECORD_CONFIG_ID=1 and FIELD_ID=31);

insert into basic_filter_configs (id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max, translation_id) values (basic_filter_seq.nextval, 1, 1, 31, 0, 31, 0, '', '', null ) ;

---- Change the sortable_fields entry with the sortable field_ids from the BLK DATA Viewer Window
update bulk_data_view_configs set sortable_fields = '2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,20,22,26,29,30,31' where record_view_config_id = 1; 

insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,31,1,'IS_CURRENCY',1);
insert into FIELD_CONFIGS_ADDITIONALS(ID,FIELD_ID,RECORD_CONFIG_ID,CONFIG_KEY,VALUE) values (FIELD_CONFIGS_ADDITIONALS_SEQ.nextval,31,1,'FLOAT_PRECISION',2);




insert into configurations (ID, CONFIG_KEY, VALUE, IS_VISIBLE) values (configurations_seq.nextval, 'CACHE_ERROR_RETRY_COUNT', '10', 0);
insert into configurations (ID, CONFIG_KEY, VALUE, IS_VISIBLE) values (configurations_seq.nextval, 'CACHE_CONNECTION_RETRY_COUNT', '5', 0);
insert into configurations (ID, CONFIG_KEY, VALUE, IS_VISIBLE) values (configurations_seq.nextval, 'CACHE_SLEEP_TIME', '2', 0);
insert into configurations (ID, CONFIG_KEY, VALUE, IS_VISIBLE) values (configurations_seq.nextval, 'CACHE_RETRY_DB', '0', 0);
 

commit;

