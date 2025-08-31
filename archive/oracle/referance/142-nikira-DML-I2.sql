spool nikira-DML-I2.log
set feedback off ;
set serveroutput off ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'SUPPORTED_I2_PLUGINS', '6,7,8');
-------Configuration Entry for I2 look back days----
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'I2_LOOK_BACK_DAYS', '30') ;

--------- Entity Types Entries for I2 chart--

insert into entity_types(id, entity_description) values (9048, 'I2 Link Chart') ;

-------------- Source Entries for I2 chart---
insert into source (id, description) values (53, 'I2 Link Chart') ;


-- Audit Log for I2
insert into audit_log_event_codes values (741,'I2 Alarm Link Chart Invoked', 'User ''$2'' with role ''$3'' invoked i2 alarm link chart', 53) ;
insert into audit_log_event_codes values (742,'I2 CDR Link Chart Invoked', 'User ''$2'' with role ''$3'' invoked i2 cdr link chart', 53) ;

commit ;

