spool nikira-DML-new-record-config-not-ldap.log
set feedback off ;
set serveroutput off ;

insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(41,'RANGER_GROUPS','Roles',0,'',1,'NAMED_FILTERS') ;
commit ;

