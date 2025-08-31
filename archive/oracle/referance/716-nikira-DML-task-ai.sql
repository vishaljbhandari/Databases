spool nikira-DML-task-ai.log
set feedback off ;
set serveroutput off ;

--insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Server Configurations'), 'Rate of Change Suppression Rules', '', 0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Rate of Change Suppression Rules'), 'Data', '/global_exceptions/list/30?'||'show_enrichment=false&'||'category=ROC.DATA_SUPPRESSION&'||'title=Rate of Change Data Suppression Rules',  0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Rate of Change Suppression Rules'), 'Voice', '/global_exceptions/list/29?'||'show_enrichment=false&'||'category=ROC.VOICE_SUPPRESSION&'||'title=Rate of Change Voice SuppressionRules',  0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Data', 'Rate of Change Suppression Rules'), 'Modify', '/global_exceptions/edit/30', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Voice', 'Rate of Change Suppression Rules'), 'Modify', '/global_exceptions/edit/29', 0, 0) ;

commit ;

