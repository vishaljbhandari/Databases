spool nikira-DML-task-I2-gsm.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('I2 Task'), 'I2 CDR Link','i2_cdr_link',0, 0) ;
commit ;

