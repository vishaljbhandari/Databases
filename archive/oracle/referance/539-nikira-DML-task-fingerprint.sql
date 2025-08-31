spool nikira-DML-task-fingerprint.log
set feedback off ;
set serveroutput off ;

---- Finger Print Rules ---
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('Rule Management'), 'eFingerprint Rules','/fingerprint_rule/list/62;/rule/compare_rules/53;/fingerprint_rule/back_to_rule_page/53', 0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'New eFingerprint Rule', '/fingerprint_rule/new/62', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Copy eFingerprint Rule', '/fingerprint_rule/copy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Show eFingerprint Rule', '/fingerprint_rule/show', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Modify eFingerprint Rule', '/fingerprint_rule/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Delete eFingerprint Rule', '/fingerprint_rule/destroy', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Delete Multiple eFingerprint Rules', '/fingerprint_rule/multiple_delete/62', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Export eFingerprint Rules', '/fingerprint_rule/export_fp_rules/62', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2', GetParentID('eFingerprint Rules'), 'Import eFingerprint Rules', '/fingerprint_rule/import_fp_rules/62', 0, 0) ;

-- Profile Management
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (16, '0,1,2', GetParentID('Tasks'), 'Profile Management','/fp_element/index/54',0, 1, 'icons/fingerprintmanagement.png') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Add', '/fp_element/new/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Modify', '/fp_element/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Delete', '/fp_element/destroy;/fp_element/multiple_delete/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Show', '/fp_element/show/54', 0, 0) ;

-- Export / Import of Profile Elements
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Export Elements', '/fp_element/export_fp_elements/54', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('Profile Management'), 'Import Elements', '/fp_element/import_fp_elements/54', 0, 0) ;


--View eFingerprint Profile
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1', ( select id from tasks where instr(link, '/account/index/'||record_view_configs.id) = 1), 'View eFingerprint Profile', '/fp_profile/show_fp_profile/'||id||';/fp_profile/show_fp_profile/502' ,0 ,0 from record_view_configs where id in(3,12,105)) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,2', ( select id from tasks where instr(link,'/account/index/'||record_view_configs.id) = 1), 'View eFingerprint Profile', '/fp_profile/show_fp_profile/'||id ,0 ,0 from record_view_configs where id = 100) ;

	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1', ( select id from tasks where instr(link,'/account/index/'||record_view_configs.id) = 1), 'Manual Profile Match', '/fingerprint_rule/manual_profile_match/'||id||';/fingerprint_rule/manual_profile_match/502' ,0 ,0 from record_view_configs where id in(3,12)) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,2', ( select id from tasks where instr(link,'/account/index/'||record_view_configs.id) = 1), 'Manual Profile Match', '/fingerprint_rule/manual_profile_match/'||id ,0 ,0 from record_view_configs where id = 100) ;

-- eFingerprint Management
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (17, '0,1,2', GetParentID('Tasks'), 'eFingerprint Management','',0, 1, 'icons/fingerprintmanagement.png') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1', GetParentID('eFingerprint Management'), 'Subscriber', '/fp_configuration/show/2', 0, 1) ;

insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,3',(select id from tasks where link like  '/account/index/21%;%'),'View eFingerprint Profile','/fp_profile/show_fp_profile/21',0, 0) ; 
insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,3',(select id from tasks where link like  '/account/index/21%;%'),'Manual Profile Match','/fingerprint_rule/manual_profile_match/21',0, 0) ; 

--Task entry for Accounts record View used by Suspect eFingerprints
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', GetParentID('Subscriber View'),'Account','/record_view/list/101',0, 0) ;

insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,3',(select id from tasks where link like  '/account/index/102%;%'),'View eFingerprint Profile','/fp_profile/show_fp_profile/102',0, 0) ; 

insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,3',(select id from tasks where link like  '/account/index/102%;%'),'Manual Profile Match','/fingerprint_rule/manual_profile_match/102',0, 0) ;     

commit;

