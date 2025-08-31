spool nikira-DML-task-statistical-rule.log
set feedback off ;
set serveroutput off ;

-- Statistical Rules - Tasks 

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Rule Management'), 'Statistical Rules','/statistical_rule/list/94;/rule/compare_rules/53;/statistical_rule/back_to_rule_page/53' ,0, 1) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Add Statistical Rule', '/statistical_rule/new/94', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Modify Statistical Rule', '/statistical_rule/edit', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Delete Statistical Rule', '/statistical_rule/destroy;/statistical_rule/multiple_delete/94', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Show Statistical Rule', '/statistical_rule/show', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Export Statistical Rules', '/statistical_rule/export_statistical_rules/94', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Statistical Rules'), 'Import Statistical Rules', '/statistical_rule/import_statistical_rules/94', 0, 0) ;

commit;

