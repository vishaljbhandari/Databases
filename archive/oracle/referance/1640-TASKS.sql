spool TASKS.log



update TASKS  set is_menu_item = '0' where  parent_id = '38' and link = '/precheck/list_i2_fields' and name = 'Precheck Link Chart Fields' ;


update TASKS set name = 'Suspect Subscriber eFingerprints' where image_src is null and name = 'Suspect eFingerprints' and is_dropdown_link = '1' and is_default = '0' and id = '1415' and is_menu_item = '1' and link = '/account/index/100?fetch_records=false;/record_view/list/100' and package_ids = '0,1,2' and parent_id = '30' ;


---------------------------delete statements ---------------
----delete from TASKS where  image_src is null and name = 'Suspect eFingerprints' and is_dropdown_link = '1' and is_default = '0' and id = '1415' and is_menu_item = '1' and link = '/account/index/100?fetch_records=false;/record_view/list/100' and package_ids = '0,1,2' and parent_id = '30' ;
---------------------------delete statements ---------------

delete from FEATURE_TASK_MAPS where  task_id = 1600 and feature_id = 5 ;

delete from RANGER_GROUPS_TASKS where task_id = 1600;

delete from TASKS where  image_src is null and name = 'Alarm Link Chart Task' and is_dropdown_link is null and is_default = '0' and id = '1600' and is_menu_item = '0' and link = 'i2_alarm_link' and package_ids = '0,1,2,3,4' and parent_id = '1599' ;
---------------------------insert statements ---------------
----insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Suspect Subscriber eFingerprints','1','0','1415','1','/account/index/100?fetch_records=false;/record_view/list/100','0,1,2','30');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Account','','0','4098','1','/fp_configuration/show/7','0,1','54');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','View eFingerprint Profile','','0','4099','0','/fp_profile/show_fp_profile/4','0,1','1394');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','View eFingerprint Profile','','0','4100','0','/fp_profile/show_fp_profile/13','0,1','1395');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','View eFingerprint Profile','','0','4101','0','/fp_profile/show_fp_profile/103','0,1','1405');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Manual Profile Match','','0','4102','0','/fingerprint_rule/manual_profile_match/4','0,1','1394');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Manual Profile Match','','0','4103','0','/fingerprint_rule/manual_profile_match/13','0,1','1395');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Manual Profile Match','','0','4104','0','/fingerprint_rule/manual_profile_match/103','0,1','1405');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Suspect Account eFingerprints','1','0','4105','1','/account/index/506?fetch_records=false;/record_view/list/506','0,1,2','30');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','View eFingerprint Profile','','0','4106','0','/fp_profile/show_fp_profile/506','0,1,2','4105');
---------------------------insert statements ---------------
insert into TASKS(image_src,name,is_dropdown_link,is_default,id,is_menu_item,link,package_ids,parent_id) values ('','Manual Profile Match','','0','4107','0','/fingerprint_rule/manual_profile_match/506','0,1,2','4105');
spool off ;
