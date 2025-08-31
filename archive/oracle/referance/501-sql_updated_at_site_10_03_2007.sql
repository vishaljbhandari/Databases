
--update casual call indicator filter to accept all charactors
update field_configs set reg_exp_id=10 where record_config_id=1 and field_id=40;
 
--update first name filter to accept %  in begining also.
update field_configs set reg_exp_id=8 where record_config_id=4 and field_id=4;
update regular_expressions set expression='^[.\w%?]+$' where id=8;

--filter fixes
update field_configs set reg_exp_id=10 where record_config_id=3 and field_id=46;
update field_configs set reg_exp_id=10 where record_config_id=3 and field_id=48;
update field_configs set reg_exp_id=10 where record_config_id=3 and field_id=49;
update field_configs set reg_exp_id=10 where record_config_id=3 and field_id=51;
update field_configs set reg_exp_id=10 where record_config_id=3 and field_id=50;
update field_configs set data_type=4 ,format='YYYY/MM/DD', width=9, reg_exp_id='' where  record_config_id=4 and field_id=30; 

--make common category same for phone_number,terminating number,originating number,called number and caller number
update field_categories set common_category_id=2 where  id in(8,9,1000,1001) ;
--make 1000 to page size(i tested on site, it is working fine)
update user_options set value='2,5,10,20,50,100,200,1000' where option_id='page_sizes' ;
 
--add create date for alarm view
update basic_filter_configs set position=position+1 where RECORD_CONFIG_ID=21 and RECORD_VIEW_CONFIG_ID=10 and position>3 ;
 
insert into basic_filter_configs 
(ID,RECORD_CONFIG_ID,RECORD_VIEW_CONFIG_ID,FIELD_ID,OPERATOR_ID,POSITION,IS_MANDATORY,MIN,MAX,TRANSLATION_ID)
values (basic_filter_seq.nextval,21,10,6,10,4,0,'01-01-1970','31-12-9999','')
 
 --added to make create data in open alarm filter                                                                                                                                                             
update basic_filter_configs set position=position+1 where RECORD_CONFIG_ID=22 and RECORD_VIEW_CONFIG_ID=16 and position>3 ;
 
insert into basic_filter_configs 
(ID,RECORD_CONFIG_ID,RECORD_VIEW_CONFIG_ID,FIELD_ID,OPERATOR_ID,POSITION,IS_MANDATORY,MIN,MAX,TRANSLATION_ID)
values (basic_filter_seq.nextval,22,16,6,10,4,0,'01-01-1970','31-12-9999','')
 
--added to make create data for closed alarms filter
update basic_filter_configs set position=position+1 where RECORD_CONFIG_ID=23 and RECORD_VIEW_CONFIG_ID=17 and position>3 ;
 
insert into basic_filter_configs 
(ID,RECORD_CONFIG_ID,RECORD_VIEW_CONFIG_ID,FIELD_ID,OPERATOR_ID,POSITION,IS_MANDATORY,MIN,MAX,TRANSLATION_ID)
values (basic_filter_seq.nextval,23,17,6,10,4,0,'01-01-1970','31-12-9999','')
 
--added to make create date for assigned alarms filter
update basic_filter_configs set position=position+1 where RECORD_CONFIG_ID=24 and RECORD_VIEW_CONFIG_ID=18 and position>3 ;
 
insert into basic_filter_configs 
(ID,RECORD_CONFIG_ID,RECORD_VIEW_CONFIG_ID,FIELD_ID,OPERATOR_ID,POSITION,IS_MANDATORY,MIN,MAX,TRANSLATION_ID)
values (basic_filter_seq.nextval,24,18,6,10,4,0,'01-01-1970','31-12-9999','')
 
--to make create date for archived alarm filter
update basic_filter_configs set position=position+1 where RECORD_CONFIG_ID=16 and RECORD_VIEW_CONFIG_ID=19 and position>3 ;
 
insert into basic_filter_configs 
(ID,RECORD_CONFIG_ID,RECORD_VIEW_CONFIG_ID,FIELD_ID,OPERATOR_ID,POSITION,IS_MANDATORY,MIN,MAX,TRANSLATION_ID)
values (basic_filter_seq.nextval,16,19,6,10,4,0,'01-01-1970','31-12-9999',''

update field_categories set common_category_id=2 where  id in(8,9,1000,1001) ;

update score_mapping_values set value=0 ;

commit ;
exit ;
