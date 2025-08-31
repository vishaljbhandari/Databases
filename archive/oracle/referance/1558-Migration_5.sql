delete from rc_record_configs where category = 'RULE' and record_config_id = 4 and task_id = (select id from tasks where name = 'Account Rule Creation');
delete from rc_record_configs where category = 'TEMPLATE' and record_config_id = 4 and task_id = (select id from tasks where name = 'Account Template Creation');
update regular_expressions set expression='^[A-Za-z0-9%?][A-Za-z0-9_\-\.@%?]*$' where id =22 and description = 'RegularExpression for E-Mail validation';
commit;

