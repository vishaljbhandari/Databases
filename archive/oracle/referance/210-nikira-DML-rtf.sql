spool nikira-DML-rtf.log
set feedback off ;
set serveroutput off ;
-- Audit Log For Alarm Flooding Control --
insert into audit_log_event_codes values (862,'Alarm Flooding Control Configuration Updated', 'Alarm Flooding Control Configuration Updated For $1', 9) ;
insert into audit_log_event_codes values (865,'Rule disabled by Alarm Flooding Control', 'Rule ''$1'' has been disabled by Alarm Flooding Control', 56) ;


-- Audit Log For Participation Control --
insert into audit_log_event_codes values (863,'Rule Participation Control Configuration Updated', 'Rule Participation Control Configuration Updated For $1', 9) ;
insert into audit_log_event_codes values (866,'Rule disabled by Rule Participation Control', 'Rule ''$1'' has been disabled by Rule Participation Control',57) ;


--Entry for RTF
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'IS_RTF_ENABLED','1') ;

--- Participation Control ---
insert into pc_configs(rule_mode, is_enabled) values(0, 0) ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'STATSLOGGER_THREAD_QUEUE_SIZE', '500');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.MONITOR_TIME_INTERVAL', '3600');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.ALLOWED_RECORD_CONFIGS', '1,7,2,83,69,93,71,72');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.LAST_PROCESSED_BUCKET_START_TIME', '01/01/1970 00:00:00');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.MAX_RECORDS_PROCESSED_PER_HOUR', '1000');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.MAX_RECORD_PARTICIPATION_PERCENTAGE', '30');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.COST_OF_COMPUTATION_PER_PARTICIPATED_RECORD', '5');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.NO_OF_TOP_RULES_TO_NOTIFY', '5');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.BUCKET_PROCESS_DELAY', '300');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.BUCKET_CLEANUP_INTERVAL_DAYS', '7');
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'PC.PROCESS_ENABLED', '1');

--Alarm Flooding Control --
insert into ALARM_FLOODING_CONTROL (rule_mode, is_enabled, duration_in_seconds) values (0, 0, 0) ;


commit ;
commit ;

