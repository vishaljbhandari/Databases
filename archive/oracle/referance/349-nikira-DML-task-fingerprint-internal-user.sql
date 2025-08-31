spool nikira-DML-task-fingerprint-internal-user.log
set feedback off ;
set serveroutput off ;

-- eFingerprint Elements - Internal User

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('eFingerprint Elements', 'eFingerprint Management'), 'Internal User', '/fp_element/index/92', 0, 1) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('Internal User', 'eFingerprint Elements', 'eFingerprint Management'), 'Add', '/fp_element/new/92', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('Internal User', 'eFingerprint Elements', 'eFingerprint Management'), 'Modify', '/fp_element/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('Internal User', 'eFingerprint Elements', 'eFingerprint Management'), 'Delete', '/fp_element/destroy;/fp_element/multiple_delete/92', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('Internal User', 'eFingerprint Elements', 'eFingerprint Management'), 'Show', '/fp_element/show/92', 0, 0) ;






	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', (select id from tasks where link like '/record_view/list/83%'), 'View eFingerprint Profile', '/fp_profile/show_fp_profile/83',0 ,0) ;

	
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', (select id from tasks where link like '/record_view/list/83%'), 'Manual Profile Match', '/fingerprint_rule/manual_profile_match/83',0 ,0) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2', GetParentID('eFingerprint Configuration', 'eFingerprint Management'), 'Internal User', '/fp_configuration/show/221', 0, 1) ;




commit;


 
