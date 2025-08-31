spool nikira-DML-ldap.log
set feedback off ;
set serveroutput off ;

--Entry for LDAP
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'LDAP','1') ;



--RANGER_GROUPS_PRIORITY entry for nadmin

insert into RANGER_GROUPS_PRIORITY(ID,RANGER_GROUP_ID,PRIORITY) values(1,2,1);

commit ;

