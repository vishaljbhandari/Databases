insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  224,83, '2') ;
insert into cust_task_input values ('NIK.IPDR_TABLE_NAME','nik_ipdr') ;
update field_configs set database_field = 'time_stamp' where record_config_id in ( select id from record_configs where tname like 'IPDR') and database_field like 'TIME_STAMP' ;
update field_configs set database_field = 'hour_of_day' where record_config_id in ( select id from record_configs where tname like 'IPDR') and database_field like 'HOUR_OF_DAY' ;
