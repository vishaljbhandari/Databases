-- Field configs for CDR, GPRS and Recharge log & their related tables.

delete from field_configs where record_config_id = 101 and field_id = 29 and database_field = 'OTHER_PARTY_COUNTRY_CODE';
update field_configs set data_type = 4 where record_config_id = 101 and  field_id = 39 and database_field = 'SPARK_PROCESSING_TIME' ;
delete from field_configs where record_config_id = 101 and field_id =40  and database_field = 'DB_LOADING_TIME';
update field_configs set data_type = 2 where record_config_id = 101 and  field_id = 53 and database_field = 'OPTIONAL_FIELD_6' ;
update field_configs set data_type = 2 where record_config_id = 101 and  field_id = 54 and database_field = 'OPTIONAL_FIELD_7' ;
update field_configs set data_type = 2 where record_config_id = 101 and  field_id = 55 and database_field = 'OPTIONAL_FIELD_8' ;
update field_configs set data_type = 4 where record_config_id = 101 and  field_id = 56 and database_field = 'OPTIONAL_FIELD_9' ;
update field_configs set data_type = 4 where record_config_id = 101 and  field_id = 57 and database_field = 'OPTIONAL_FIELD_10' ;
delete from field_configs where record_config_id = 101 and field_id = 58  and database_field = 'OPTIONAL_FIELD_11';
delete from field_configs where record_config_id = 101 and field_id = 59  and database_field = 'OPTIONAL_FIELD_12';
delete from field_configs where record_config_id = 101 and field_id = 60  and database_field = 'OPTIONAL_FIELD_13';
delete from field_configs where record_config_id = 101 and field_id = 61  and database_field = 'OPTIONAL_FIELD_14';
delete from field_configs where record_config_id = 101 and field_id = 62  and database_field = 'OPTIONAL_FIELD_15';
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,101, 'Account Id', 'ACCOUNT_ID', '49', 0, 0, null, 1, null, 58, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,101, 'Account Name', 'ACCOUNT_NAME', '50', 0, 0, null, 3, null, 59, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,101, 'Aggregation 1', 'AGGREGATION_1', '51', 0, 0, null, 3, null, 60, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,101, 'Aggregation 2', 'AGGREGATION_2', '52', 0, 0, null, 3, null, 61, null, null, 0, 20,0, null, '', null, 0, 0) ;
update field_configs set data_type = 4 where record_config_id = 7 and database_field = 'SPARK_PROCESSING_TIME' ;
delete from field_configs where record_config_id = 7 and database_field = 'DB_LOADING_TIME';
update field_configs set data_type = 2 where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_6' ;
update field_configs set data_type = 2 where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_7' ;
update field_configs set data_type = 2 where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_8' ;
update field_configs set data_type = 4 where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_9' ;
update field_configs set data_type = 4 where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_10' ;
delete from field_configs where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_11';
delete from field_configs where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_12';
delete from field_configs where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_13';
delete from field_configs where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_14';
delete from field_configs where record_config_id = 7 and database_field = 'OPTIONAL_FIELD_15';
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,7, 'Account Id', 'ACCOUNT_ID', '45', 0, 0, null, 1, null, 54, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,7, 'Account Name', 'ACCOUNT_NAME', '46', 0, 0, null, 3, null, 55, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,7, 'Aggregation 1', 'AGGREGATION_1', '47', 0, 0, null, 3, null, 56, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,7, 'Aggregation 2', 'AGGREGATION_2', '48', 0, 0, null, 3, null, 57, null, null, 0, 20,0, null, '', null, 0, 0) ;
delete from field_configs where record_config_id = 1 and database_field = 'OTHER_PARTY_COUNTRY_CODE';
update field_configs set data_type = 4 where record_config_id = 1 and database_field = 'SPARK_PROCESSING_TIME' ;
delete from field_configs where record_config_id = 1 and database_field = 'DB_LOADING_TIME';
update field_configs set data_type = 2 where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_6' ;
update field_configs set data_type = 2 where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_7' ;
update field_configs set data_type = 2 where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_8' ;
update field_configs set data_type = 4 where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_9' ;
update field_configs set data_type = 4 where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_10' ;
delete from field_configs where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_11';
delete from field_configs where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_12';
delete from field_configs where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_13';
delete from field_configs where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_14';
delete from field_configs where record_config_id = 1 and database_field = 'OPTIONAL_FIELD_15';
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Account Id', 'ACCOUNT_ID', '49', 0, 0, null, 1, null, 57, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Account Name', 'ACCOUNT_NAME', '50', 0, 0, null, 3, null, 58, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Aggregation 1', 'AGGREGATION_1', '51', 0, 0, null, 3, null, 59, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,1, 'Aggregation 2', 'AGGREGATION_2', '52', 0, 0, null, 3, null, 60, null, null, 0, 20,0, null, '', null, 0, 0) ;
-- delete from field_configs where record_config_id = 2 and name = 'Voucher Expiry Date' and field_id = 15;
-- delete from field_configs where record_config_id = 2 and name = 'Grace Period' and field_id = 16;
update field_configs set data_type = 2 where record_config_id = 2 and database_field = 'BALANCE_BEFORE' ;
update field_configs set data_type = 2 where record_config_id = 2 and database_field = 'BALANCE_AFTER' ;
update field_configs set data_type = 4 where record_config_id = 2 and database_field = 'SPARK_PROCESSING_TIME' ;
delete from field_configs where record_config_id = 2 and database_field = 'DB_LOADING_TIME';
update field_configs set data_type = 2 where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_6' ;
update field_configs set data_type = 2 where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_7' ;
update field_configs set data_type = 2 where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_8' ;
update field_configs set data_type = 4 where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_9' ;
update field_configs set data_type = 4 where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_10' ;
delete from field_configs where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_11';
delete from field_configs where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_12';
delete from field_configs where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_13';
delete from field_configs where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_14';
delete from field_configs where record_config_id = 2 and database_field = 'OPTIONAL_FIELD_15';
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Account Name', 'ACCOUNT_NAME', '40', 0, 0, null, 3, null, 43, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Aggregation 1', 'AGGREGATION_1', '41', 0, 0, null, 3, null, 44, null, null, 0, 16,0, null, '', null, 0, 0) ;
insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,2, 'Aggregation 2', 'AGGREGATION_2', '42', 0, 0, null, 3, null, 45, null, null, 0, 16,0, null, '', null, 0, 0) ;


-- Subscriber field configs

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Fathers Name', 'FATHERS_NAME', '62', 0, 1, 'SMM.PRECHECK', 3, null, 79, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Nationality', 'NATIONALITY', '63', 0, 1, 'GR', 3, null, 80, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Company Name', 'COMPANY_NAME', '64', 0, 1, 'SMM.PRECHECK GR', 3, null, 81, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Alternate MSISDN', 'ALTERNATE_MSISDN', '65', 0, 1, 'SMM.PRECHECK', 3, null, 82, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Contact Name', 'CONTACT_NAME', '66', 0, 1, 'SMM.PRECHECK', 3, null, 83, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Customer ID', 'CUSTOMER_ID', '67', 0, 1, '', 3, null, 84, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Email ID', 'EMAIL_ID', '68', 0, 1, 'SMM.PRECHECK', 3, null, 85, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Customer Segment', 'CUSTOMER_SEGMENT', '69', 0, 1, 'GR', 3, null, 86, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Customer Product Type', 'CUSTOMER_PRODUCT_TYPE', '70', 0, 1, 'GR', 3, null, 87, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Package Plan 1', 'PACKAGE_PLAN_1', '71', 0, 1, 'GR', 3, null, 88, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Package Plan 2', 'PACKAGE_PLAN_2', '72', 0, 1, 'GR', 3, null, 89, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Additional Services', 'ADDITIONAL_SERVICES', '73', 0, 1, 'GR', 3, null, 90, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Store Name', 'STORE_NAME', '74', 0, 1, 'SMM.PRECHECK GR', 3, null, 91, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Retailer Name', 'RETAILER_NAME', '75', 0, 1, 'SMM.PRECHECK', 3, null, 92, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'Retailer Area Code', 'RETAILER_AREA_CODE', '76', 0, 1, 'GR', 3, null, 93, null, null, 1, 256, 0, null, '', null, 0, 0) ;

insert into field_configs (id, record_config_id, name, database_field, position, is_expandable, is_visible, ds_category, data_type, format, field_id, query_field, translation_id, is_filter, width, reg_exp_id, associated_field, derivative_function, live_tree_ds, is_encrypted, is_case_sensitive) values (field_configs_seq.nextval,3, 'ID Number Type', 'ID_TYPE', '77', 0, 1, 'GR', 3, null, 94, null, null, 1, 256, 0, null, '', null, 0, 0) ;

-- Field configs for partial temp cdr

delete from field_configs where record_config_id = 109 ;

insert into field_configs (select FIELD_CONFIGS_SEQ.nextval,109,name,DATABASE_FIELD,POSITION,IS_EXPANDABLE,IS_VISIBLE,DS_CATEGORY,DATA_TYPE,FORMAT,FIELD_ID,QUERY_FIELD,TRANSLATION_ID,IS_FILTER,WIDTH,REG_EXP_ID,ASSOCIATED_FIELD,DERIVATIVE_FUNCTION,LIVE_TREE_DS,IS_ENCRYPTED,IS_CASE_SENSITIVE from field_configs where RECORD_CONFIG_ID=1);

update field_configs set database_field = 'VAL' where record_config_id = 109 and  field_id = 14 and database_field = 'VALUE' ;

update field_configs set database_field = 'XDR_ID' where record_config_id = 109 and  field_id = 23 and database_field = 'ID' ;

--Reorders positions of cdr, gprs_cdr and recharge_log
DECLARE
	new_position NUMBER(5) ;
	CURSOR cur_record_configs IS 
	SELECT id as record_config_id FROM record_configs 
		WHERE id IN (1, 2, 7, 101) ;
BEGIN
	FOR row_record_config_id IN cur_record_configs LOOP
	DECLARE
		CURSOR cur_field_id_per_record_config IS
  			SELECT field_id FROM field_configs 
			WHERE record_config_id = row_record_config_id.record_config_id AND position > 0 ORDER BY position ;
	BEGIN
		new_position := 1;
		FOR field_id_row IN cur_field_id_per_record_config LOOP
			update field_configs set position = new_position where record_config_id = row_record_config_id.record_config_id and field_id = field_id_row.field_id ;
		
		new_position := new_position + 1 ;
		END LOOP;
	END;
	END LOOP;
END;
/

commit ;
