spool nikira-DML-demo-fp.log
set feedback off ;
set serveroutput off ;

--Entries for alarm of reference type subscriber and status = FRD & NFR 

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(30, 2, 36, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(31, 4, 36, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 36, 3) ;
commit ;

