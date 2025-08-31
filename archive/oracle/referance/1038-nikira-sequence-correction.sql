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

commit;
spool off
