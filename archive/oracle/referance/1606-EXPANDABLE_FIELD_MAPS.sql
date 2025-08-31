spool EXPANDABLE_FIELD_MAPS.log



---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Credit Details','',0,'ACCOUNT_ID',7,4537,5,0,'ID',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Subscriber Details','RECORD_VIEW',0,'ACCOUNT_ID',24,4535,3,0,'ID',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Recharge Details','RECORD_VIEW',0,'ACCOUNT_ID',24,4534,6,0,'ID',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account-Disconnected Service','RECORD_VIEW',0,'ACCOUNT_NAME',7,4543,105,0,'ACCOUNT_NAME',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account-Black Listed Service','RECORD_VIEW',0,'ACCOUNT_NAME',7,4539,12,0,'ACCOUNT_NAME',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account-ActiveService','RECORD_VIEW',0,'ACCOUNT_NAME',7,4545,3,0,'ACCOUNT_NAME',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Information','RECORD_VIEW',0,'ADDRESS_LINE_1',2,4540,4,0,'ADDRESS_LINE_1',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Information','RECORD_VIEW',0,'ADDRESS_LINE_2',2,4541,4,0,'ADDRESS_LINE_2',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Information','RECORD_VIEW',0,'ADDRESS_LINE_3',2,4542,4,0,'ADDRESS_LINE_3',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Credit Details','RECORD_VIEW GR RULE',0,'ACCOUNT_NAME',7,4536,5,0,'ACCOUNT_NAME',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Recharge Details','RECORD_VIEW GR RULE',0,'ACCOUNT_NAME',7,4538,6,0,'ACCOUNT_NAME',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Account Profile Fields','RECORD_VIEW GR RULE',2,'ACCOUNT_ID',7,4544,106,0,'ID',506);
---------------------------insert statements ---------------
insert into EXPANDABLE_FIELD_MAPS(name,category,data_record_type,dest_key,dest_key_type,id,dest_view_id,is_new_view,source_key,source_view_id) values ('Subscriber Details','RULE NOT_VISIBLE',0,'SUBSCRIBER_UID,SSID',2,503,102,0,'AGGR_VALUE,ID',500);
spool off ;
