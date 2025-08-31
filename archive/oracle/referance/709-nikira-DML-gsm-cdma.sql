spool nikira-DML-gsm-cdma.log
set feedback off ;
set serveroutput off ;
-- ***************** FMSLog Messages  ******************
insert into source_fms_log (id,event_name,source_id) values (38,'Hotlist IMSI Added',7);
insert into source_fms_log (id,event_name,source_id) values (39,'Hotlist IMSI deleted',7);
insert into source_fms_log (id,event_name,source_id) values (40,'Hotlist IMSI Modified',7);
insert into source_fms_log (id,event_name,source_id) values (59,'Prepaid IMSI Prefix is Added',9);
insert into source_fms_log (id,event_name,source_id) values (60,'Prepaid IMSI Prefix is deleted',9);


commit ;

