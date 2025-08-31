insert into cust_task_input values ('NIK.GPRS_CDR_TABLE_NAME','nik_gprs_cdr') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  224,7, '4') ;
update field_configs set database_field = 'time_stamp' where record_config_id in ( select id from record_configs where tname like 'GPRS_CDR') and database_field like 'TIME_STAMP' ;
update field_configs set database_field = 'hour_of_day' where record_config_id in ( select id from record_configs where tname like 'GPRS_CDR') and database_field like 'HOUR_OF_DAY' ;
