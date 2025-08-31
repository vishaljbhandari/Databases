spool nikira-DML-not-ldap.log
set feedback off ;
set serveroutput off ;


--Configuration entry for LDAP disabled.
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'LDAP','0') ;
commit ;

