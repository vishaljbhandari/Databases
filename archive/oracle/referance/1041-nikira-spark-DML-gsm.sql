insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  224,1, '8') ;
insert into cust_task_input values ('NIK.CDR_TABLE_NAME','nik_cdr') ;
update configurations set value ='1' where config_key ='IS_CDM_ENABLED' ;

update field_configs set database_field ='VAL' where database_field='VALUE' and record_config_id = 109 ;
update field_configs set database_field ='XDR_ID' where database_field='ID' and record_config_id = 109 ;
update field_configs set position = 27, derivative_function=null where database_field ='OTHER_PARTY_COUNTRY_CODE' and record_config_id=1 ;
update field_configs set database_field = 'time_stamp' where record_config_id in ( select id from record_configs where tname like 'CDR') and database_field like 'TIME_STAMP' ;
update field_configs set database_field = 'hour_of_day' where record_config_id in ( select id from record_configs where tname like 'CDR') and database_field like 'HOUR_OF_DAY' ;

