spool nikira-DML-task-precheck.log
set feedback off ;
set serveroutput off ;

----- Manual Precheck -- 
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (20, '0,3,4', GetParentID('Tasks'), 'Manual Precheck', '/manual_precheck/index', 0, 1, 'icons/manualprecheck.png') ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,3,4', GetParentID('Manual Precheck'), 'Normal Manual Precheck', '/manual_precheck/normal_manual_precheck', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,3,4', GetParentID('Manual Precheck'), 'Generate Alarm', '/manual_precheck/generate_precheck_alarm', 0, 0) ;
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval, '0,3,4', GetParentid('Manual Precheck'), 'Bulk Manual Precheck', '', 0, 0) ;
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval, '0,3,4', GetParentid('Bulk Manual Precheck', 'Manual Precheck'), 'View', '/manual_precheck/bulk_precheck', 0, 0) ;
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval, '0,3,4', GetParentid('Bulk Manual Precheck', 'Manual Precheck'), 'Delete', '/manual_precheck/destroy', 0, 0) ;
insert into tasks (id, package_ids, parent_id, name, link, is_default, is_menu_item) values (tasks_seq.nextval, '0,3,4', GetParentid('Bulk Manual Precheck', 'Manual Precheck'), 'Multiple Delete', '/manual_precheck/multiple_delete', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', GetParentID('Server Configurations'), 'Precheck Fields', '/precheck/list_precheck_fields', 0, 1) ;


DECLARE
	parentid NUMBER(20) ;
BEGIN
	select GetParentID('Tasks') into parentid from dual ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', (select id from tasks where name = 'Account View' and parent_id = parentid),'Create Subscriber Precheck','/account/new/45',0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', (select id from tasks where name = 'Account View' and parent_id = parentid),'Modify Subscriber Precheck Entry','/account/edit',0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', (select id from tasks where name = 'Account View' and parent_id = parentid),'Delete Subscriber Precheck Entry','/account/destroy',0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', (select id from tasks where name = 'Subscriber Precheck List' and parent_id = (select id from tasks where name = 'Subscriber View' and parent_id = parentid)),'Add','/account/new/29',0, 0) ;
END ;
/

-- Precheck List Tasks
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Server Configurations'), 'Precheck Lists', '/precheck_list/list', 0, 1) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Precheck Lists'), 'Add Precheck List', '/precheck_list/new/140', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Precheck Lists'), 'Modify Precheck List', '/precheck_list/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Precheck Lists'), 'Delete Precheck List', '/precheck_list/destroy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Precheck Lists'), 'Delete Multiple Precheck Lists', '/precheck_list/multiple_delete/140', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Precheck Lists'),'Show Precheck List','/precheck_list/show', 0, 0 ); 

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Management'),'On Demand Precheck','/alarm/complete_precheck', 0, 0 ); 

-- Precheck Lists logs
insert into audit_log_event_codes values (901, 'Precheck list created', 'Precheck list ''$1'' added',  9) ;
insert into audit_log_event_codes values (902, 'Precheck list updated', 'Precheck list ''$1'' updated',  9) ;
insert into audit_log_event_codes values (903, 'Precheck list deleted', 'Precheck list ''$1'' deleted',  9) ;
insert into audit_log_event_codes values (905, 'Precheck list enabled', 'Precheck list ''$1'' enabled',  9) ;
insert into audit_log_event_codes values (906, 'Precheck list disabled', 'Precheck list ''$1'' deleted',  9) ;

commit ;
