spool nikira-DML-field-categories-isp.log
set feedback off ;
set serveroutput off ;


--ISP FIELD
insert into field_categories(id, name, category, data_type) values( 2060, 'Framed IP Address' , '', 3);
insert into field_categories(id, name, category, data_type) values( 2061, 'IPDR Type' , '', 3);
insert into field_categories(id, name, category, data_type) values( 2062, 'ISP Qos' , '', 1);
insert into field_categories(id, name, category, data_type) values( 2064, 'Session ID' , '', 3);
insert into field_categories(id, name, category, data_type) values( 2065, 'Session Status' , '', 1);
insert into field_categories(id, name, category, data_type, regular_expression_id, COMMON_CATEGORY_ID) values(225 , 'User Name' , 'ACCUMULATION_FIELD AGGREGATION_TYPE NEGATIVE_RULE_AGG_TYPE NICKNAME HOTLIST MANUAL_ALARM PROFILE_SPECIFIC ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_AGG_TYPE', 3, 1, 225);

commit ;

