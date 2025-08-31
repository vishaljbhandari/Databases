spool nikira-DML-task-not-ldap.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('User Management'), 'Password Configuration', '/password_configuration/configure', 0, 1) ;
commit ;

