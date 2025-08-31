insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval,  224,1, '8') ;
insert into cust_task_input values ('NIK.CDR_TABLE_NAME','nik_cdr') ;
update configurations set value ='1' where config_key ='IS_CDM_ENABLED' ;

update field_configs set database_field ='VAL' where database_field='VALUE' and record_config_id = 109 ;
update field_configs set database_field ='XDR_ID' where database_field='ID' and record_config_id = 109 ;
update field_configs set position = 27, derivative_function=null where database_field ='OTHER_PARTY_COUNTRY_CODE' and record_config_id=1 ;

-- Cleanup Partial Record Temporary Table
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('Cleaning of Partial Record Temporary Table', 'cleanuppartialtemptable.rb,CleanupPartialTempTablePID', 0, 0, 1);
