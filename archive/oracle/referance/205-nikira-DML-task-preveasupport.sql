spool nikira-DML-task-preveasupport.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values ( TASKS_SEQ.nextval, '0,4', GetParentID('Tasks'),'Risk Management','/risk_management/',0, 1,'icons/lighthouse.png') ;

commit ;

