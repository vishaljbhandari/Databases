spool nikira-DML-ai.log
set feedback off ;
set serveroutput off ;
--Blacklist Neural Profile Load  Action
insert into actions (ID, ACTION_NAME, IS_VISIBLE) values (52,'Blacklist Neural Profile Load Action',0);

----Cleanup Package Configurations---
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'INSTALLATION.AI','1');

commit ;

