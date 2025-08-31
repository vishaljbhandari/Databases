set feedback off
spool nikira-new-exec-telus.log

------------------ Installation Type ---------------------------
delete from holiday_lists;
insert into holiday_lists(id,network_id,holiday_date,description,holiday_day_type) values(holiday_lists_seq.nextval,0,'26-JAN-2000','Republic day','');
insert into holiday_lists(id,network_id,holiday_date,description,holiday_day_type) values(holiday_lists_seq.nextval,0,'15-AUG-2000','Independence day','');
insert into holiday_lists(id,network_id,holiday_date,description,holiday_day_type) values(holiday_lists_seq.nextval,0,'02-OCT-2000','Gandhi Jayanthi','');
insert into holiday_lists(id,network_id,holiday_date,description,holiday_day_type) values(holiday_lists_seq.nextval,0,'01-MAY-2000', 'May day', '');

-- since time value is used as the key for the map maintained internally this value 
-- should be unique.

delete distance_times;
insert into distance_times values(distance_times_seq.nextval, 0, 1, 0, 0);
insert into distance_times values(distance_times_seq.nextval, 1, 5, 300, 0);
insert into distance_times values(distance_times_seq.nextval, 5, 10, 300 * 2, 0);
insert into distance_times values(distance_times_seq.nextval, 10, 15, 300 * 3, 0);
insert into distance_times values(distance_times_seq.nextval, 15, 20, 300 * 4, 0);
insert into distance_times values(distance_times_seq.nextval, 20, 50, 300 * 10, 0);
insert into distance_times values(distance_times_seq.nextval, 50, 100, 300 * 14, 0);
insert into distance_times values(distance_times_seq.nextval, 100, 200, 300 * 24, 0);
insert into distance_times values(distance_times_seq.nextval, 200, 300, 300 * 48, 0);
insert into distance_times values(distance_times_seq.nextval, 300, 400, 300 * 72, 0);

--delete roamer_imsi_prefix;
--insert into roamer_imsi_prefix values(0, '40445');

---***** Entries for Service table**********
delete from service ;

insert into service(id, description) values(1 , 'Incoming') ;
insert into service(id, description) values(2 , 'Local') ;
insert into service(id, description) values(4 , 'Long Distance') ;
insert into service(id, description) values(8 , 'International') ;
insert into service(id, description) values(16 , 'Trunk') ;
insert into service(id, description) values(32 , 'National Roaming') ;
insert into service(id, description) values(64 , 'International Roaming') ;

---***** Entries for Calendar table *****
delete from calendar ;

insert into calendar values (1,'Gregorian') ;
insert into calendar values (2,'Islamic') ;

delete aggregation_types_map ;

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 2,  0, 16, 1, '6.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 2,  0, 16, 3, '22', 3) ;
commit;

spool off;
QUIT;
