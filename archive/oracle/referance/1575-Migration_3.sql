update tasks set name='Link Chart Task' where id=1599 ;
update tasks set name='Alarm Link Chart Task' where id=1600 ;
update tasks set name='CDR Link Chart' where id=1601 ;
update tasks set name='Precheck Link Chart Fields' where id=1746 ;
update audit_log_event_codes set description='Alarm Link Chart Task Invoked' where id=741 ;
update audit_log_event_codes set description='CDR Link Chart Invoked' where id=742 ;
update source set description='Link Chart' where id=53 ;
update entity_types set entity_description='Link Chart' where id=9048 ;
commit;
