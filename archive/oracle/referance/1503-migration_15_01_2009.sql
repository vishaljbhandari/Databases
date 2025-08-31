--Migration script for Reports after 35280

insert into translation_indices(id, description,is_dynamic) values (97, 'Report Ranger UsersName',1) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 97, '-176', 'select name as Key, name as Value from ranger_users where id >= 3 order by name') ;

update report_parameters set translation_index_id = 97, report_parameter_name = 'ANALYST' where name = 'Analyst' and translation_index_id = 82 and position = 4;
update report_parameters set report_parameter_name = 'FRAUD_TYPE' where name = 'Fraud Type' and translation_index_id = 83 and position = 5;
commit;

update report_parameters set position = 2 where name = 'Balance Limit' and position = 1 and report_parameter_name = 'BalanceLimit' ;
update report_parameters set position = 1 where name = 'Network' and position = 2 and report_parameter_name = 'NETWORK_ID' ;

update translations set value='select id as Key, name as Value from ranger_users where id >= 3 order by name' where value = 'select id as Key, name as Value from ranger_users where id > 3 order by name' ;

insert into report_data_types (ID, DATA_TYPE) values (7, 'DurationInMinutes') ;
update report_parameters set report_data_type_id=7 where name = 'Duration in min greater than 0' and report_data_type_id=5 ;

-- Rules View changes for Description column in Rule listing.
CREATE OR REPLACE VIEW RULES_V AS
(
        SELECT
                        R.ID AS ID, R.NAME AS NAME, R.KEY AS KEY, R.AGGREGATION_TYPE AS AGGREGATION_TYPE, R.PSEUDO_FUNCTION_ID AS FUNCTION,
                        R.USER_ID AS USERNAME, PR.NAME AS PARENT_TEMPLATE, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS,
                        R.IS_ACTIVE AS IS_ACTIVE, RT.TAGS AS TAGS,RN.NETWORKS AS NETWORK_ID, RD.DATA_STREAMS AS DATA_STREAMS, R.VERSION AS VERSION, R.CATEGORY AS CATEGORY, R.DESCRIPTION AS DESCRIPTION
        FROM
                        RULES R,RULE_TAGS_V RT,rules pr, RULE_NETWORKS_V RN, RULE_DATASTREAMS_V RD
        WHERE
                        R.KEY >= 1024 AND R.PARENT_ID != 0 AND R.SMART_PATTERN_ID = 0 AND
                        (R.CATEGORY IS NULL OR R.CATEGORY IN ('SMART_PATTERN','CalledToCalledBy','FINGERPRINT_RULE', 'STATISTICAL_RULE')) AND R.PARENT_ID = PR.ID AND R.ID = RT.RULE_ID
                        AND R.ID = RN.RULE_ID AND R.ID = RD.RULE_ID
        UNION ALL
        SELECT
                        R.ID AS ID, R.NAME AS NAME, R.KEY AS KEY, R.AGGREGATION_TYPE AS AGGREGATION_TYPE, R.PSEUDO_FUNCTION_ID AS FUNCTION,
                        R.USER_ID AS USERNAME,'-' AS PARENT_TEMPLATE, DECODE(R.IS_ENABLED, 0, 'Disabled', 1, 'Enabled') AS STATUS,
                        R.IS_ACTIVE AS IS_ACTIVE, RT.TAGS AS TAGS,RN.NETWORKS AS NETWORK_ID, RD.DATA_STREAMS AS DATA_STREAMS, R.VERSION AS VERSION, R.CATEGORY AS CATEGORY, R.DESCRIPTION AS DESCRIPTION
        FROM
                        RULES R,RULE_TAGS_V RT, RULE_NETWORKS_V RN, RULE_DATASTREAMS_V RD
        WHERE
                        R.KEY >= 1024 AND R.PARENT_ID != 0 AND R.SMART_PATTERN_ID = 0 AND
                        (R.CATEGORY IS NULL OR R.CATEGORY IN ('SMART_PATTERN','CalledToCalledBy','FINGERPRINT_RULE', 'STATISTICAL_RULE')) AND R.PARENT_ID = 999 AND R.ID = RT.RULE_ID
                        AND R.ID = RN.RULE_ID AND R.ID = RD.RULE_ID
) ;
insert into field_configs(id, record_config_id, name, database_field, position, is_visible, data_type, field_id) 
values (FIELD_CONFIGS_SEQ.NEXTVAL, 44, 'Description', 'DESCRIPTION', 0, 1, 3, 12) ;

-- Alarm Rule Notification maps View changes for Description column in Rule listing.
CREATE OR REPLACE VIEW ALARM_RULE_NOTIFICATION_MAPS_V AS
(
        SELECT R.ID AS ID, R.NAME AS RULE_NAME, R.CATEGORY AS CATEGORY, R.DESCRIPTION AS DESCRIPTION, RNM.NOTIFICATION_PACK_ID AS PACK_NAME,RNM.RULE_GROUP AS RULE_GROUP, JOINMANYROWSIN1(NR.NETWORK_ID) AS NETWORKS
        FROM RULES R, RULE_NOTIFICATION_MAPS RNM,NETWORKS_RULES NR
        WHERE R.ID = RNM.RULE_ID
        AND R.IS_ACTIVE = 1
        AND NR.RULE_ID = R.ID
        AND R.CATEGORY in ('ALARM_ESCALATION_RULE','ALARM_NOTIFICATION_RULE')
        GROUP BY R.ID, R.NAME,R.CATEGORY,RNM.NOTIFICATION_PACK_ID,RNM.RULE_GROUP, R.DESCRIPTION
) ;

insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, 
is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter)
values (field_configs_seq.nextval, 80, 'Description', 'DESCRIPTION', 7, 7, 3, 
0, null, null, 256, null, 1, null, 0) ;

delete from entity_types where id = 2049 ;
delete from entity_types where id = 9000 ;


--------Alarm History-------Start----------

delete from expandable_field_maps where source_view_id = 118 ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-Subscriber', 118, 'REFERENCE_ID', 102, 'ID', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMEI-Subscriber', 118, 'REFERENCE_ID', 102, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMSI-Subscriber', 118, 'REFERENCE_ID', 102, 'ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-Subscriber', 118, 'REFERENCE_VALUE', 3, 'PHONE_NUMBER', 0, 1, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMEI-Subscriber', 118, 'REFERENCE_VALUE', 3, 'IMEI', 0, 2, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-IMSI-Subscriber', 118, 'AGGREGATION_VALUE', 3, 'IMSI', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-AccountName-AccountInfo', 118, 'REFERENCE_VALUE', 4, 'ACCOUNT_NAME', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-AccountName-Subscriber', 118, 'REFERENCE_ID', 103, 'ID', 0, 3, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (expandable_field_maps_seq.nextval, 'Alarm-VPMN-Info', 118, 'REFERENCE_VALUE', 49, 'VPMN', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) values (expandable_field_maps_seq.nextval, 'Alarm-VPMN-Info', 118, 'REFERENCE_ID', 49, 'ID', 0, 5, 'RECORD_VIEW', 0);
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 118, 'REFERENCE_ID', 83, 'ID', 0, 6, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category, data_record_type) VALUES (expandable_field_maps_seq.nextval, 'Alarm-InternalUser', 118, 'REFERENCE_VALUE', 83, 'EMPLOYEE_CODE', 0, 6, 'RECORD_VIEW', 0);

--------Alarm History-------End----------


update field_configs set is_filter=0 where record_config_id=60 and field_id=6;
update field_configs set is_filter=0 where record_config_id=47 and field_id=10;
update field_configs set is_filter=0 where record_config_id=56 and field_id=4;
update field_configs set is_filter=0 where record_config_id=68 and field_id=8;
update field_configs set is_filter=0 where record_config_id=81 and field_id=4;
update field_configs set is_filter=0 where record_config_id=80 and field_id=6;

update field_configs set REG_EXP_ID = 10 where RECORD_CONFIG_ID = 8 and NAME = 'Entity Value' ;
update field_configs set REG_EXP_ID = 10 where RECORD_CONFIG_ID = 82 and NAME = 'Entity Value' ;

-------Alarm cellsite----start------
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (215, 'Alarm-CellSite', 10, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (216, 'Alarm-CellSite', 26, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (217, 'Alarm-CellSite', 16, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (218, 'Alarm-CellSite', 17, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (219, 'Alarm-CellSite', 18, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (220, 'Alarm-CellSite', 19, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (221, 'Alarm-CellSite', 96, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (222, 'Alarm-CellSite', 116, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (223, 'Alarm-CellSite', 50, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (224, 'Alarm-CellSite', 118, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (225, 'Alarm-CellSite', 119, 'REFERENCE_VALUE', 81, 'CELL_SITE_ID', 0, 4, 'RECORD_VIEW');

-------Alarm cellsite----End-------


update tasks set link=link||';/record_view/list/81' where name='Geographical Positions';

-------------------------For removing value entry from the typeslisted in nick names------------------
update field_categories set category=replace(category,'NICKNAME','') where id=17;

---------------------For removing the entries coming in standard nick name under mynetworks and to put it under correct network-----------
insert into list_configs_networks (select n.id, s.id from list_configs s, networks n where n.id != 999 and category not like 'ASN' and s.name like n.description || '%') ;



update field_configs set translation_id = 89 where RECORD_CONFIG_ID = 15 and name='Entity Type' ;

---------------------------For making value as a filter in configuration page------------------------
update field_configs set reg_exp_id=10,is_filter=1 where record_config_id=57 and field_id=3;



---------------------For Pending Case ----------
insert into record_configs (id, tname, description, cacheable, key,is_visible,category)values(97,'CASES','Cases',0,'ID',1,'NAMED_FILTERS');

insert into field_configs(id, record_config_id, name, database_field, field_id,position,data_type,is_expandable,ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval,97,'Network','NETWORK_ID',1,1,1,0,'','',40,10,0,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval , 97,'Name','NAME',2,2,3,0,'','',40,null,1,18,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values ( field_configs_seq.nextval,97,'Description','DESCRIPTION',3,3,3,0,'','',40,null,1,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval ,97,'Owner','OWNER_ID',4,4,3,0,'','',40,null,1,10,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval , 97,'Creator ID','CREATOR_ID',5,1,3,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval , 97,'Created Date','CREATED_DATE',6,6,4,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval , 97,'Modified Date','MODIFIED_DATE',7,7,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval ,97,'Status','STATUS',8,8,1,0,'','',40,null,0,null,0) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval , 97,'Reason ID','REASON_ID',9,9,1,0,'','',40,32,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values(field_configs_seq.nextval , 97,'Pending Time','PENDING_TIME',10,10,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values (field_configs_seq.nextval, 97,'Alarm Count','ALARM_COUNT',11,11,1,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values ( field_configs_seq.nextval,97,'Id','ID',12,12,1,0,'','',40,null,0,null,0) ;

update RECORD_VIEW_CONFIGS set RECORD_CONFIG_ID=97 where id=24;
update Field_configs set Is_visible=0 where id=6409;


----------------------For Hotlist Key Entity-----------------
update field_configs set field_id=6 where record_config_id=92 and field_id=5;
update field_configs set field_id=5 where record_config_id=92 and field_id=4;

insert into field_configs(id, record_config_id, name, database_field,field_id,position,data_type,is_expandable,ds_category,query_field, width, translation_id, is_visible, reg_exp_id,is_filter)values(field_configs_seq.nextval, 92, 'Entity Type','ENTITY_TYPE',4,0,1,0,'','',40,89,1,null,1) ;

 CREATE OR REPLACE VIEW HOTLIST_PER_KEY_NETWORK_V
 AS
 (
     SELECT HPK.ID AS ID,HPK.KEY_CATEGORY AS KEY_CATEGORY,HPK.VALUE AS VALUE,SV.ENTITY_TYPE AS ENTITY_TYPE,
     JOINMANYROWSIN1UNIQ(HGN.NETWORK_ID) AS NETWORK, SV.USER_ID AS USER_ID
     FROM HOTLIST_PER_KEY HPK,SUSPECT_VALUES SV,HOTLIST_GROUPS_SUSPECT_VALUES HGSV,HOTLIST_GROUPS_NETWORKS HGN
     WHERE HPK.ID = SV.HOTLIST_KEY_ID AND SV.ID = HGSV.SUSPECT_VALUE_ID AND HGSV.HOTLIST_GROUP_ID = HGN.HOTLIST_GROUP_ID
     GROUP BY (HPK.ID, HPK.KEY_CATEGORY, HPK.VALUE, SV.USER_ID,SV.ENTITY_TYPE)
  );

alter table ARCHIVED_MATCHED_DETAILS modify FIELD_VALUE   VARCHAR2(256) ;

insert into configurations (id, config_key, value) values (configurations_seq.nextval,'SUBINST_CLUCENE', 'ID > 1024') ;
update analyst_actions set is_active = 0 where id = 35 ;

-------For putting UserOption entry for All Users in the case of hotlist page size-----

declare
  cout number;
begin
  for  ranger_user in (select * from ranger_users)
    loop
      for id in ( select id from field_categories where upper(CATEGORY) like '%HOTLIST%' and (common_category_id is null or common_category_id=id) order by id )
       loop
            select count(*) into cout from user_options where option_id = '15.'||id.id||'.PageSize' and user_id like ranger_user.name;
            if cout = 0 then
                 insert into user_options(id,option_id,user_id,value,is_read_only,is_enabled) values (user_options_seq.nextval,'15.'||id.id||'.PageSize',ranger_user.name,'50',0,1); 
             end if;
       end loop;
    end loop;
end;
/

------For avoiding new,delete,multipledelete... from configuration that appears in configuration node of role creation page -
delete from RANGER_GROUPS_TASKS  where task_id in(select id from tasks where link like '/configuration/edit');
delete from tasks where link like '/configuration/edit';
delete from RANGER_GROUPS_TASKS  where task_id in(select id from tasks where link like '/configuration/new/68');
delete from tasks where link like  '/configuration/new/68';
delete from RANGER_GROUPS_TASKS  where task_id in(select id from tasks where link like  '/configuration/destroy');
delete from tasks where link like '/configuration/destroy';
delete from RANGER_GROUPS_TASKS  where task_id in(select id from tasks where link like '/configuration/multiple_delete/68');
delete from tasks where link like '/configuration/multiple_delete/68';


@ $DBSETUP_HOME/utility_package.sql

-------------For making a new link named balcklist subscriber info in closed alarm and to change existing  name to active subscriber info ---

insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (226,'Black List Subscriber Info',1,'CALLER_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE',0);
insert into expandable_field_maps(ID,NAME,SOURCE_VIEW_ID,SOURCE_KEY,DEST_VIEW_ID,DEST_KEY,DEST_KEY_TYPE,IS_NEW_VIEW,CATEGORY,DATA_RECORD_TYPE) values (227,'Black List Subscriber Info',1,'CALLED_NUMBER',12,'PHONE_NUMBER',2,0,'RECORD_VIEW GR RULE',0);
update expandable_field_maps set name='Called Active Subscriber Info' where id=3;
update expandable_field_maps set name='Caller Active Subscriber Info' where id=4;

--------For getting records: in Pending cases  ------
insert into field_record_config_maps(ID,FIELD_CATEGORY_ID,RECORD_CONFIG_ID,FIELD_ASSOCIATION) values(field_record_config_map_seq.nextval,5,96,'1');




commit ;
