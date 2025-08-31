spool nikira-add-schedular-audit-log.log
set feedback off ;
set serveroutput off ;
spool nikira-add-schedular-audit-log.log

insert into translation_indices(id, description) values (117,'Job Status') ;
insert into translation_indices(id, description) values (118,'Script Status') ;
insert into translation_indices(id, description) values (130,'Scheduler Job Names') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 117,'1', 'INPROGRESS') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 117,'2', 'COMPLETED') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 117,'3', 'KILLED') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 117,'4', 'DIDNOTSTART') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 117,'5', 'ALREADYRUNNING') ;

insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 118,'1', 'SUCCESS') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 118,'0', 'FAILURE') ;

insert into translations(id, tr_id, key, value) values (translations_seq.nextval,130, '-176', 'select job_name as key, job_name as value from SCHEDULER_COMMAND_MAPS') ;
---Shedular Log file-----Need to add translation indices
insert into record_configs (id, tname, description, cacheable, key, is_visible) values(100,'SCHEDULDED_JOB_EXEC_DETAILS','Scheduler Audit Log',0,'ID',0) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(121,'Scheduler Audit Log',100,'','END_TIME DESC', 1, 1, 0) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Id','ID',1,0,1,0,'','',20,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Job Name', 'JOB_NAME',2,0,3,0,'','',40,130,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Job Status', 'JOB_STATUS',3,0,1,0,'','',40,117,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Script Status', 'SCRIPT_STATUS',4,0,1,0,'','',40,118,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Start Time', 'START_TIME',5,0,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'End Time', 'END_TIME',6,0,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 100, 'Log', 'LOG_PATH',7,0,3,1,'','',256,null,1,0,1) ;

DECLARE
	parentid NUMBER(20) ;
BEGIN
	
	select GetParentID('Audit Log') into parentid from dual ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,2,3,4', parentid, name, '/record_view/list/' || id ||'?fetch_records=false',0 , 1 from record_view_configs where  id =121);

end ;
/

insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where link like '%/record_view/list/121%'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where link like '%/record_view/list/121%'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where link like '%/record_view/list/121%'),2 from dual) ;

insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 100, 121, 2, 8, 2, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 100, 121, 5, 10, 5, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 100, 121, 6, 10, 6, 0) ;


insert into user_options (id, option_id, user_id,role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'121.PageSize','radmin',1,50,0,1);
insert into user_options (id, option_id, user_id,role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'121.PageSize','system',1,50,0,1);
insert into user_options (id, option_id, user_id,role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'121.PageSize','default',1,50,0,1);
insert into user_options (id, option_id, user_id,role_id, value, is_read_only, is_enabled) values (user_options_seq.nextval,'121.PageSize','nadmin',2,50,0,1);


spool off ;
commit ;

