spool nikira-DML-new-record-config-ldap.log
set feedback off ;
set serveroutput off ;

insert into record_configs (id, tname, description, cacheable, key, is_visible,category) values(41,'RANGER_GROUPS_V','Roles',0,'',1,'NAMED_FILTERS') ;
---For LDAP turn-on DAYS_TO_EXPIRE not shown in record_view
update field_configs set is_visible=0, is_filter=0 where record_config_id=40 and field_id=15;
--Field Config entry for Ranger_Groups_v for LDAP 
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id ) values (FIELD_CONFIGS_SEQ.NEXTVAL, 41, 'priority', 'PRIORITY', 4, 1, 1, 4) ;
commit ;

