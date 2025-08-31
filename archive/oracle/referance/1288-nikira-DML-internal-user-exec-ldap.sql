spool nikira-DML-internal-user-exec-ldap.log
set feedback off ;
set serveroutput off ;

--RANGER_GROUPS_PRIORITY entry for nadmin and internal user
insert into RANGER_GROUPS_PRIORITY(ID,RANGER_GROUP_ID,PRIORITY) values(2,999,2);

commit ;

