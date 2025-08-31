spool nikira-DML-task-gprs.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Rule'), 'GPRS Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Template'), 'GPRS Template Creation', '', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'GPRS', '/global_exceptions/list/7?show_enrichment=true',  0, 1) ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('GPRS', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/7', 0, 0) ;



DECLARE
	parentid NUMBER(20) ;
BEGIN

	select GetParentID('Record View') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,4', parentid, name, '/record_view/list/' || id ||'?fetch_records=false',0 , 1 from record_view_configs where is_visible = 1 and id = 7) ;

END ;
/

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('GPRS', 'Record View'), 'Manual Alarm', '/record_view/create_manual_alarm/7', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('GPRS', 'Record View'), 'Apply High Cost Filters', '/high_cost_filtering/7', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('GPRS', 'Record View'), 'Filter Using Pattern Searches', '/filter_using_pattern_searches/7', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,4', GetParentID('GPRS', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/7', 0, 0) ;

	insert into bulk_data_view_configs values (7,'1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,31',100000);

insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 7, id, 'RULE' from tasks where name = 'GPRS Rule Creation') ;
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 7, id, 'TEMPLATE' from tasks where name = 'GPRS Template Creation') ;

insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 7, id from tasks where link like '%record_view/list/7?fetch_records=%') ;

commit;




insert into tasks values(tasks_seq.nextval, GetParentID('GPRS','Record View'), 'Sort Across Pages', '/field_config/sort_across_pages/7'	, 0, 0, '0,1,4', '');







commit ;

