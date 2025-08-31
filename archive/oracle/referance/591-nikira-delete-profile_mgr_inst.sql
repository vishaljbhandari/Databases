SPOOL nikira-delete-profile_mgr_inst.log
SET FEEDBACK OFF ;
set serveroutput off ;

create or replace procedure delete_fp_table_view_inst(offline_id in number, v_instance_id in number) IS
	v_entity_type number(5) ;
	v_entity_id number(5) ;
	v_counter_category number(5) ;
	create_sql varchar2 (32000) ;
begin
if (v_instance_id != 0)
then
	select counter_category into v_counter_category from in_memory_counter_details where id = offline_id and counter_instance_id = 0 ;
    if ( v_counter_category in (5))
    then
		begin
			select entity_type into v_entity_id from profile_manager_entity_configs where OFFLINE_COUNTER_ID = offline_id ;
			select entity_type into v_entity_type from fp_entities where  id = v_entity_id and category like '%FP%' ;

			create_sql := '' ;
			create_sql := create_sql||' DROP INDEX IX_FP_PROF_ENT_ID_'||v_entity_type||'_'||v_instance_id||'_2 ' ;
			execute immediate create_sql ;

			create_sql := '' ;
			create_sql := 'drop table fp_profiles_'||v_entity_type||'_'||v_instance_id||'_2' ;
			execute immediate create_sql ;
			
			create_sql := '' ;
			create_sql := create_sql||' DROP INDEX IX_FP_PROF_ENT_ID_'||v_entity_type||'_'||v_instance_id||'_3 ' ;
			execute immediate create_sql ;
		
			create_sql := '' ;
			create_sql := 'drop table fp_profiles_'||v_entity_type||'_'||v_instance_id||'_3' ;
			execute immediate create_sql ;
		
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_PROFILES_MAP_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER != -1) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
		
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_MATCH_TYPE_0_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1,0)) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
		
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_MATCH_TYPE_0_'||v_entity_type||'_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1,0) and entity_id = v_entity_id) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
		
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_ENTITYID_'||v_entity_type||'_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1) and entity_id = v_entity_id) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
		
			execute immediate create_sql ;
		exception
		when no_data_found then
			v_entity_type := 0 ;
		end ;
	end if ;
end if ;
end ;
/
spool off

