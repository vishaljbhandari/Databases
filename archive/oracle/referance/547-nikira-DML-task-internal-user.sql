spool nikira-DML-task-internal-user.log
set feedback off ;
set serveroutput off ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (10, '0,2,4', GetParentID('Tasks'), 'Internal User View', '', 0, 1, 'icons/internaluserview.png') ;

--Internal User View
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Internal User View'), 'Internal User', '/record_view/list/83?fetch_records=false', 0, 1) ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Rule'), 'Adjustment Logs Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Rule'), 'CRM Logs Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Rule'), 'Internal Users Rule Creation', '', 0, 0) ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Template'), 'Adjustment Logs Template Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Template'), 'CRM Logs Template Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID('Add Template'), 'Internal Users Template Creation', '', 0, 0) ;




DECLARE
	parentid NUMBER(20) ;
BEGIN
	
	select GetParentID('Record View') into parentid from dual ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', parentid, 'Adjustment Logs', '/record_view/list/84?fetch_records=false', 0, 1) ;
	
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', parentid, 'CRM Logs', '/record_view/list/85?fetch_records=false', 0, 1) ;

  insert into tasks (ID,PARENT_ID,NAME,LINK,IS_DEFAULT,IS_MENU_ITEM,PACKAGE_IDS,IMAGE_SRC) values (tasks_seq.nextval,GetParentID('CRM Logs','Record View'),'Manual Alarm','/record_view/create_manual_alarm/85',0,0,'0,1,4',null);

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,2,4', GetParentID('CRM Logs', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/85', 0, 0) ;

	insert into bulk_data_view_configs values (85,'1,2,3,4,5,6,7,8,9',100000);
  
  insert into tasks (ID,PARENT_ID,NAME,LINK,IS_DEFAULT,IS_MENU_ITEM,PACKAGE_IDS,IMAGE_SRC) values (tasks_seq.nextval,GetParentID('Adjustment Logs','Record View'),'Manual Alarm','/record_view/create_manual_alarm/84',0,0,'0,1,4',null);

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,2,4', GetParentID('Adjustment Logs', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/84', 0, 0) ;
	
	insert into bulk_data_view_configs values (84,'1,2,3,4,5,6,7,8,9,10,11,12,13',100000);

end ;
/

insert into tasks values(tasks_seq.nextval, GetParentID('CRM Logs')			, 'Sort Across Pages', '/field_config/sort_across_pages/85'	, 0, 0, '0,1,4', '');

insert into tasks values(tasks_seq.nextval, GetParentID('Adjustment Logs')	, 'Sort Across Pages', '/field_config/sort_across_pages/84'	, 0, 0, '0,1,4', '');

commit ;

