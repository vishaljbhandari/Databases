spool nikira-DML-record-config-demo-gsm-recharge.log
set feedback off ;
set serveroutput off ;

------------------------------------------- Expandable Field Maps entries START ---------------------------------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (1, 'Recharge View', 1, 'CALLED_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW GR RULE');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (2, 'Recharge Details', 1, 'CALLER_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW GR RULE');


--CDR To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number Recharge Logs', 1, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');


--Recharge Log To Other Datastreams
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Phone Number CDRs', 2, 'PHONE_NUMBER', 1, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW');

commit ;

