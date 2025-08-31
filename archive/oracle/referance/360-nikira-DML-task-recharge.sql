spool nikira-DML-task-recharge.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Rule'), 'Recharge Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Template'), 'Recharge Template Creation', '', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'Recharge Log', '/global_exceptions/list/2?show_enrichment=true',  0, 1) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Recharge Log', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/2', 0, 0) ;


DECLARE
	parentid NUMBER(20) ;
BEGIN

	select GetParentID('Record View') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,4', parentid, name, '/record_view/list/' || id ||'?fetch_records=false',0 , 1 from record_view_configs where is_visible = 1 and id = 2) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,4', parentid, name, '/record_view/list/' || id ,0 , 0 from record_view_configs where id in (6)) ;
	
END ;
/

	
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Recharge Log', 'Record View'), 'Manual Alarm', '/record_view/create_manual_alarm/2', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Recharge Log', 'Record View'), 'Filter on Non Indexed Fields', '/non_index_filtering/2', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Recharge Log', 'Record View'), 'Filter using LIKE Operator', '/filter_using_like_operator/2', 0, 0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,4', GetParentID('Recharge Log', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/2', 0, 0) ;

	insert into bulk_data_view_configs values (2,'0,1,2,3,4,5,6,7,8,15,16',100000);

insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 2, id, 'RULE' from tasks where name = 'Recharge Rule Creation') ;
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 2, id, 'TEMPLATE' from tasks where name = 'Recharge Template Creation') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Server Configurations'), 'Prepaid Top Ups', '/prepaid_top_up/list', 0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Prepaid Top Ups'), 'Add', '/prepaid_top_up/new/71', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Prepaid Top Ups'), 'Modify', '/prepaid_top_up/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Prepaid Top Ups'), 'Show', '/prepaid_top_up/show', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Prepaid Top Ups'), 'Delete', '/prepaid_top_up/destroy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Prepaid Top Ups'), 'Multiple Delete', '/prepaid_top_up/multiple_delete/71', 0, 0) ;
	
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 2, id from tasks where link like '%record_view/list/2?fetch_records=%') ;
commit;

