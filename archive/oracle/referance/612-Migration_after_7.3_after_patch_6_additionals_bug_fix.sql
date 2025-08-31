spool migrations.log

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)   (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1    from field_categories,functions,record_configs,aggregation_types      where field_categories.category like '%AGGREGATION_TYPE%'  and functions.id  in (30)  and record_configs.tname in ('CDR')     and instr(','||aggregation_types.record_config_ids||',' , ','||record_configs.id||',')> 0  and field_categories.id = aggregation_types.id );
update field_configs set width=256 where record_config_id=87 and DATABASE_FIELD = 'USER_NAME';
	update audit_log_event_codes set description='Suspect eFingerprint(s) Deleted' where description='Suspect Fingerprint(s) Deleted';
	update audit_log_event_codes set description='Suspect eFingerprint(s) Added' where description='Suspect Fingerprint(s) Added';
update field_categories set category=category|| ' HOTLIST ' where name like 'OtherParty Number';
commit;
quit;
spool off;
