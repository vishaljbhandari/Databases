spool nikira-DML-cdma-not-gsm.log
set feedback off ;
set serveroutput off ;
-- ***************** FMSLog Messages  ******************
insert into source_fms_log (id,event_name,source_id) values (38,'Hotlist ESN Added',7);
insert into source_fms_log (id,event_name,source_id) values (39,'Hotlist ESN deleted',7);
insert into source_fms_log (id,event_name,source_id) values (40,'Hotlist ESN Modified',7);
insert into source_fms_log (id,event_name,source_id) values (59,'Prepaid ESN Prefix is Added',9);
insert into source_fms_log (id,event_name,source_id) values (60,'Prepaid IMSI Prefix is deleted',9);

commit ;

