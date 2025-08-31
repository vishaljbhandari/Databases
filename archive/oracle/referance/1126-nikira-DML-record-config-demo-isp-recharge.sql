spool nikira-DML-record-config-demo-isp-recharge.log
set feedback off ;
set serveroutput off ;

--Recharge Log To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number IPDRs', 2, 'PHONE_NUMBER', 104, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');



--IPDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number Recharge Logs', 104, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');
commit ;

