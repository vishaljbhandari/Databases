spool nikira-DML-task-nrtrde.log
set feedback off ;
set serveroutput off ;

DECLARE
	parentid NUMBER(20) ;
BEGIN
	
	select GetParentID('Record View') into parentid from dual ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,4', parentid, name, '/vpmn_info/list/' || id ||'?fetch_records=false',0 , 1 from record_view_configs where is_visible = 1 and id = 49) ;

end ;
/
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Add NRTRDE Partner', '/vpmn_info/new/49', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Modify NRTRDE Partner', '/vpmn_info/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Show NRTRDE Partner', '/vpmn_info/show', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'), 'Delete NRTRDE Partner', '/vpmn_info/destroy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners'),	'Multiple Delete NRTRDE Partner', '/vpmn_info/multiple_delete/49', 0, 0) ;
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 49, id from tasks where link like '%vpmn_info/list/49?fetch_records=%') ;
	
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('NRTRDE Partners', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/49', 0, 0) ;
	
	insert into bulk_data_view_configs values (49,'1,2,3,4,5,6,7,8,9,10,11,12,13,14',100000);
     
	 ------------------Audit Log Changes--------------

    insert into entity_types (id,entity_description) values (10013,'NRTRDE Partner');
    
    insert into audit_log_event_codes values (897,'NRTRDE Partner(s) Added', 'NRTRDE Partner ''$1'' added', 22) ;
    insert into audit_log_event_codes values (898,'NRTRDE Partner(s) Updated', 'NRTRDE Partner ''$1'' updated', 22) ;
    insert into audit_log_event_codes values (899,'NRTRDE Partner(s) Deleted', 'NRTRDE Partner ''$1'' deleted', 22) ;

insert into tasks values(tasks_seq.nextval, GetParentID('NRTRDE Partners')	, 'Sort Across Pages', '/field_config/sort_across_pages/49'	, 0, 0, '0,1,4', '');

commit ;

