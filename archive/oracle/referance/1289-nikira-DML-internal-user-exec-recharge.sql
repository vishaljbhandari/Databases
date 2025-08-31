spool nikira-DML-internal-user-exec-recharge.log
set feedback off ;
set serveroutput off ;

-- Expandable Field Maps entries for Internal User
INSERT INTO expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (179, 'Internal User - Recharge Logs', 83, 'PHONE_NUMBER', 2, 'PHONE_NUMBER', 1, 2, 'RECORD_VIEW', 0);
commit ;

