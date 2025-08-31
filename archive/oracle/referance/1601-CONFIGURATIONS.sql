spool CONFIGURATIONS.log



---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values (0,'ALARM_SEQUENCE_AGGRESSIVE_DELETE',CONFIGURATIONS_SEQ.nextval,'0');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values (0,'ALARM_SEQUENCE_TEMP_TABLE_COUNT',CONFIGURATIONS_SEQ.nextval,'40');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values (1,'FP_GENERATOR_LAST_RUN_TIME_7',CONFIGURATIONS_SEQ.nextval,'01/03/2009 00:00:00');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values (1,'FP_PROFILES_LAST_RUN_IDENTIFIER_7_0',CONFIGURATIONS_SEQ.nextval,'9999');
spool off ;
