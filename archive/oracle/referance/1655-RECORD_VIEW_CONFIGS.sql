spool RECORD_VIEW_CONFIGS.log


update RECORD_VIEW_CONFIGS set name = 'Suspect Subscriber eFingerprints' where is_visible = '1' and name = 'Suspect eFingerprints' and is_primary_view = '0' and is_advanced_query_enabled = '0' and record_config_id = '3' and create_manual_alarm = '0' and is_logging_enabled = '1' and is_pagination_enabled = '1' and help_file_key is null and is_cell_specific = '0' and order_by = 'MODIFIED_DATE DESC' ;

---------------------------insert statements ---------------
---------------------------insert statements ---------------
insert into RECORD_VIEW_CONFIGS(is_visible,where_clause,name,is_primary_view,is_advanced_query_enabled,record_config_id,create_manual_alarm,id,is_logging_enabled,is_pagination_enabled,help_file_key,is_cell_specific,order_by) values ('1',' ((ID > 1024 AND ACCOUNT_TYPE = 0) OR (ACCOUNT_TYPE = 1 AND (ID > 1024 OR ID = 4))) AND id in (select distinct fp.profiled_entity_id from fp_suspect_profiles_7 fp where fp.IS_MATCH_TYPE = 1 and fp.entity_id = 7)','Suspect Account eFingerprints','0','0','4','0','506','1','1','','0','MODIFIED_DATE DESC');

update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Alarms' and RECORD_CONFIG_ID = '21' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'My Team Alarms' and RECORD_CONFIG_ID = '21' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Closed History Alarms' and RECORD_CONFIG_ID = '23' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Open Alarms' and RECORD_CONFIG_ID = '22' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Closed Alarms' and RECORD_CONFIG_ID = '23' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Assigned Alarms' and RECORD_CONFIG_ID = '24' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'Alarms ' and RECORD_CONFIG_ID = '21' ;
update RECORD_VIEW_CONFIGS  set dyn_where_cluse_perf_speed = '0' where  NAME = 'My Alarms' and RECORD_CONFIG_ID = '21' ;

spool off ;
