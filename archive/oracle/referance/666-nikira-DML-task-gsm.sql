spool nikira-DML-task-gsm.log
set feedback off ;
set serveroutput off ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Rule'), 'CDR Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Template'), 'CDR Template Creation', '', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'CDR', '/global_exceptions/list/1?show_enrichment=true',  0, 1) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('CDR', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/1', 0, 0) ;



DECLARE
	parentid NUMBER(20) ;
BEGIN


	select GetParentID('Record View') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,4', parentid, name, '/record_view/list/' || id ||'?fetch_records=false',0 , 1 from record_view_configs where is_visible = 1 and id = 1) ;

end ;
/

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('CDR', 'Record View'), 'Manual Alarm', '/record_view/create_manual_alarm/1', 0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('CDR', 'Record View'), 'Apply High Cost Filters', '/high_cost_filtering/1', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('CDR', 'Record View'), 'Filter Using Pattern Searches', '/filter_using_pattern_searches/1', 0, 0) ;


	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,4', GetParentID('CDR', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/1', 0, 0) ;

	
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 1, id, 'RULE' from tasks where name = 'CDR Rule Creation') ;
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 1, id, 'TEMPLATE' from tasks where name = 'CDR Template Creation') ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 1, id from tasks where link like '%record_view/list/1?fetch_records=%') ;

insert into tasks values(tasks_seq.nextval, GetParentID('CDR','Record View'), 'Sort Across Pages', '/field_config/sort_across_pages/1'	, 0, 0, '0,1,4', '');

commit ;

