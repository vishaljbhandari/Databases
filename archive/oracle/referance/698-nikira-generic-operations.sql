spool nikira-sequence-correction.log
set feedback off ;
set serveroutput off ;

declare
	max_id number;
	seq_id number;
	diff number;
begin
   select max(id) into max_id from field_configs ;
   select FIELD_CONFIGS_SEQ.nextval into seq_id from dual ;  
   IF max_id > seq_id THEN
   	diff := max_id - seq_id ;
   	execute immediate 'alter sequence FIELD_CONFIGS_SEQ increment by '||diff ;
   	select FIELD_CONFIGS_SEQ.nextval into seq_id from dual ;
   	execute immediate 'alter sequence FIELD_CONFIGS_SEQ increment by 1' ;
   	select FIELD_CONFIGS_SEQ.nextval into seq_id from dual ;
   END IF ;
end ;
/

insert into filter_case_insensitive_fields (record_config_id, database_field) (select f.record_config_id, f.database_field from field_configs f where f.data_type = 3 and f.is_filter = 1 and f.database_field is not null and f.record_config_id not in ( select precheck_record_config_id from precheck_record_configs) and f.database_field not in (select database_field from filter_case_insensitive_fields where record_config_id = f.record_config_id) and f.field_id not in (select field_id from FILTER_INDEX_FIELDS where record_config_id = f.record_config_id));

commit;
spool off
