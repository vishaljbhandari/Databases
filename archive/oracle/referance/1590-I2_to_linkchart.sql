declare
I2_and_linkchart NUMBER(10) := 0;
Link_chart_id NUMBER(10) := 0 ;
begin
select count(*) into I2_and_linkchart from feature_status where name in ('I2','Link_Chart');
if I2_and_linkchart > 1
then
	begin
		select id into Link_chart_id from feature_status where NAME = 'Link_Chart';
		delete from FEATURE_ENTITY_TYPES where FEATURE_ID in (Link_chart_id);
		delete from FEATURE_SOURCES where FEATURE_ID in (Link_chart_id);
		delete from FEATURE_TASK_MAPS where FEATURE_ID in (Link_chart_id);
		delete from FEATURE_SCHEDULER_MAPS where FEATURE_ID in (Link_chart_id);
		delete from FEATURE_STATUS where name = 'Link_Chart';
		update FEATURE_STATUS set NAME='Link_Chart' where name = 'I2';  
		commit;
	exception when
	no_data_found then
		null;
	end;	
end if;
end;
/
