spool nikira-DML-not-consider_distinct_imei_for_callcollision_event.log
set feedback off ;
set serveroutput off ;

-- Consider distinct imei for Call Collision event, This value will used only in the client for showing--
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'OVERLAP_IMEI_ENABLED', '0');

commit ;

