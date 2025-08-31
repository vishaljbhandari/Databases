
-----for changing exp id  : (226) where SVK  = Account_name ----------------
update expandable_field_maps set SOURCE_KEY = 'SUBSCRIBER_UID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 3 and SOURCE_KEY = 'ACCOUNT_NAME' and id = 226;

-----for changing exp id  : (535) where SVK  = Account_name ----------------
update expandable_field_maps set SOURCE_KEY = 'SUBSCRIBER_UID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 45 and SOURCE_KEY = 'ACCOUNT_NAME' and id = 535;

-----for changing exp id  : (14,16) where SVK  = Account_name ----------------
update expandable_field_maps set SOURCE_VIEW_ID = 3 , SOURCE_KEY = 'SUBSCRIBER_UID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 4 and DEST_KEY = 'ACCOUNT_NAME' and id in (14,16);

-----for changing exp id  : (15,7) where SVK  = ID ----------------
update expandable_field_maps set SOURCE_VIEW_ID = 3 , SOURCE_KEY = 'SSID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 4 and DEST_KEY = 'ACCOUNT_ID' and id in (15,7);

update field_record_config_maps set FIELD_ASSOCIATION = '4512.15.3' where FIELD_ASSOCIATION = '65.15.3' and RECORD_CONFIG_ID = 10 and FIELD_CATEGORY_ID = 78;
update field_record_config_maps set FIELD_ASSOCIATION = '4512.15.8' where FIELD_ASSOCIATION = '65.15.8' and RECORD_CONFIG_ID = 10 and FIELD_CATEGORY_ID = 2074;
update field_record_config_maps set FIELD_ASSOCIATION = '4512.15.10' where FIELD_ASSOCIATION = '65.15.10' and RECORD_CONFIG_ID = 10 and FIELD_CATEGORY_ID = 2075;

update field_record_config_maps set FIELD_ASSOCIATION = '251.7.2' where  FIELD_ASSOCIATION = '251.5.7.2' and RECORD_CONFIG_ID in (1, 109) and FIELD_CATEGORY_ID = 42;
update field_record_config_maps set FIELD_ASSOCIATION = '251.7.3' where  FIELD_ASSOCIATION = '251.5.7.3' and RECORD_CONFIG_ID in (1, 109) and FIELD_CATEGORY_ID = 43;
update field_record_config_maps set FIELD_ASSOCIATION = '252.7.2' where  FIELD_ASSOCIATION = '252.5.7.2' and RECORD_CONFIG_ID = 7 and FIELD_CATEGORY_ID = 42;
update field_record_config_maps set FIELD_ASSOCIATION = '252.7.3' where  FIELD_ASSOCIATION = '252.5.7.3' and RECORD_CONFIG_ID = 7 and FIELD_CATEGORY_ID = 43;
update field_record_config_maps set FIELD_ASSOCIATION = '253.7.3' where  FIELD_ASSOCIATION = '253.5.7.3' and RECORD_CONFIG_ID = 2 and FIELD_CATEGORY_ID = 56;
update field_record_config_maps set FIELD_ASSOCIATION = '4509.7.2' where  FIELD_ASSOCIATION = '4509.5.7.2' and RECORD_CONFIG_ID = 505 and FIELD_CATEGORY_ID = 42;
update field_record_config_maps set FIELD_ASSOCIATION = '4509.7.3' where  FIELD_ASSOCIATION = '4509.5.7.3' and RECORD_CONFIG_ID = 505 and FIELD_CATEGORY_ID = 43;

-----for changing exp id  : (522,540) where SVK  = Account_name ----------------
update expandable_field_maps set SOURCE_VIEW_ID = 45, SOURCE_KEY = 'SUBSCRIBER_UID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 46 and SOURCE_KEY = 'ACCOUNT_NAME' and id in (522,540);

-----for changing exp id  : (523) where SVK  = ID ----------------
update expandable_field_maps set SOURCE_VIEW_ID = 45, SOURCE_KEY = 'SSID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 46 and SOURCE_KEY = 'ID' and id = 523;

-----for changing exp id  : (188,189) where SVK  = Account_name ----------------
update expandable_field_maps set SOURCE_VIEW_ID = 102, SOURCE_KEY = 'SUBSCRIBER_UID' where DEST_VIEW_ID in (5,6) and SOURCE_VIEW_ID = 103 and SOURCE_KEY = 'ACCOUNT_NAME' and id in (188,189);

update field_record_config_maps set FIELD_ASSOCIATION = '251.188.6' where FIELD_ASSOCIATION = '251.190.188.6' and RECORD_CONFIG_ID in (1, 109) and  FIELD_CATEGORY_ID = 6002;
update field_record_config_maps set FIELD_ASSOCIATION = '252.188.6' where FIELD_ASSOCIATION = '252.190.188.6' and RECORD_CONFIG_ID = 7 and  FIELD_CATEGORY_ID = 6002;
update field_record_config_maps set FIELD_ASSOCIATION = '254.188.6' where FIELD_ASSOCIATION = '254.190.188.6' and RECORD_CONFIG_ID = 83  and FIELD_CATEGORY_ID = 6002;
update field_record_config_maps set FIELD_ASSOCIATION = '4509.188.6' where FIELD_ASSOCIATION = '4509.190.188.6' and RECORD_CONFIG_ID = 505  and FIELD_CATEGORY_ID = 6002;

--------- For Activation amt of subs :
update field_configs set ASSOCIATED_FIELD = '7.3' where RECORD_CONFIG_ID = 3 and NAME = 'Activation Amount';

--------- For Activation amt of ACC :
update field_configs set ASSOCIATED_FIELD = '' where RECORD_CONFIG_ID = 4 and NAME = 'Activation Amount';

--------- For Activation amt of sub precheck :
update field_configs set ASSOCIATED_FIELD = '540.3' where RECORD_CONFIG_ID = 98 and NAME = 'Activation Amount';

--------- For Activation amt of ACC precheck :
update field_configs set ASSOCIATED_FIELD = '' where RECORD_CONFIG_ID = 99 and NAME = 'Activation Amount';

------ enrichment changes in rule page : -----
insert into expandable_field_maps (ID, NAME, SOURCE_VIEW_ID, SOURCE_KEY, DEST_VIEW_ID, DEST_KEY, DEST_KEY_TYPE, IS_NEW_VIEW, CATEGORY, DATA_RECORD_TYPE) values (504,'Account Credit Details',21,'SUBSCRIBER_UID',5,'ACCOUNT_NAME',7,0,'RECORD_VIEW RULE',0);
insert into expandable_field_maps (ID, NAME, SOURCE_VIEW_ID ,SOURCE_KEY, DEST_VIEW_ID, DEST_KEY, DEST_KEY_TYPE, IS_NEW_VIEW, CATEGORY, DATA_RECORD_TYPE) values (505,'Account Recharge Details',21,'SUBSCRIBER_UID',6,'ACCOUNT_NAME',7,0,'RECORD_VIEW RULE',0);

---- For rule action parameter changes: (ssid : 6010)
update rule_action_parameters set PARAMETER_1 = 6010 where RULE_ID in (2, 8);
update rule_action_parameters set PARAMETER_1 = 6011, PARAMETER_2 = 6010 where RULE_ID in (46,47);
