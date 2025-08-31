spool nikira-DML-new-record-config-not-mlh.log
set feedback off ;
set serveroutput off ;

--Active and Suspended Subscriber to Account--
delete from expandable_field_maps where id=134 and name='Account Details' ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type)
    values (134, 'Account Details', 21, 'ACCOUNT_ID', 4, 'ID', 0, 1, 'RECORD_VIEW GR RULE',0);
commit ;

