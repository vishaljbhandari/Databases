spool nikira-DML-task-I2.log
set feedback off ;
set serveroutput off ;

-- I2 Tasks Start ---

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Tasks'), 'I2 Task','',0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('I2 Task'), 'I2 Alarm Link','i2_alarm_link',0, 0) ;

-- I2 Tasks End ---

commit ;

