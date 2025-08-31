spool nikira-DML-functions.log
set feedback off ;
set serveroutput off ;
-- Functions
--Bitmap Precheck
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(29,'Bitmap Match Function', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(34,'Bitmap Insert Function', '', 0) ;

-- Functions
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(0, 'No Function', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(1, 'Sum', '12,17,49,50,51', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(2, 'Count', '82', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(3, 'Distinct', '', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(4, 'Velocity', '', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(5, 'Service Violation', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(6, 'Per Call', '12,17,19,50,51', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(7, 'Overlap', '12', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(8, 'IP Duration', '12', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(9, 'IP Value', '17', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(10, 'QoS Violation', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(11, 'Count Changes', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(12, 'Odd Value topup', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(13, 'Suspicious Recharge', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(14, 'Invalid Subscriber', '17', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(15, 'Distinct Destination', '', 1) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(16, 'Match Function', '', 0) ;
insert into functions(id ,function_name, associated_accumulation_fields,is_counter_response_reqd) values(20,'Alarm Link Match Function','', 0);
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(22, 'Other Party Country Code', '', 0) ;
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(23, 'Negative Rule Function', '', 0) ;

--Profiling Functions
insert into functions(id, function_name, associated_accumulation_fields) values(24, 'Profile Sum', '12,17,49,50,51') ;
insert into functions(id, function_name, associated_accumulation_fields) values(25, 'Profile Count', '82') ;

--Fingerprint Rule Functions
insert into functions(id, function_name, associated_accumulation_fields) values(26, 'Fingerprint Rule Function', '') ;

--Statistical Rule Functions
insert into functions(id, function_name, associated_accumulation_fields) values(27, 'Statistical Rule Function', '') ;

--Called TO & Called By Rule Functions
insert into functions(id, function_name, associated_accumulation_fields) values(28, 'Called To Called By Function', '') ;

--Sequential Dialing 
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(30, 'Sequential Dialing', '', 1) ;

--AVG/MIN/MAX
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(31, 'Average', '', 1) ;
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(32, 'Min', '', 1) ;
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(33, 'Max', '', 1) ;

-- Per Session Function
insert into functions values (51, 'Per Session', '49,50,51', 0);

-- Per Record Function
insert into functions(id, function_name, associated_accumulation_fields,is_counter_response_reqd) values(52, 'Per Record', '', 0) ;

-- Invalid Referrer Function
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values (54, 'Invalid Referrer', '17', 0) ;

-- Distinct Count Function
insert into functions(id, function_name, associated_accumulation_fields, is_counter_response_reqd) values(55, 'Distinct Count', '', 1) ;

-- Functions

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (0, 'No Function', '', 0, 0) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (1, 'Cumulative Value', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 1, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (2, 'Cumulative Duration', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 1, 12) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (3, 'Cumulative Upload Data Volume', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 1, 50) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (4, 'Cumulative Download DataVolume', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 1, 49) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (5, 'Cumulative Data Volume', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 1, 51) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (6, 'Count Of Records', 'TEMPLATE RULE PROFILE_FIELD ONDEMAND_OFFLINE_TEST CUSTOMER_ALERT_RULE', 2, 1) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (7, 'Service Violation', 'TEMPLATE RULE', 5, 6) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (8, 'Invalid Subscriber', 'TEMPLATE RULE', 14, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (10, 'Per Call Value', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 6, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (11, 'Per Call Duration', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 6, 12) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (12, 'Per Call Upload Data Volume', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 6, 50) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (13, 'Per Call Download DataVolume', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 6, 49) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (14, 'Per Call Data Volume', 'TEMPLATE RULEONDEMAND_OFFLINE_TEST', 6, 51) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (16, 'In Progress Duration', 'TEMPLATE RULE', 8, 12) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (17, 'In Progress Value', 'TEMPLATE RULE', 9, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (18, 'QoS Violation', 'TEMPLATE RULE', 10, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (21, 'Distinct Destination', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 15, 44) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (22, 'Called To', NULL, 28, 2) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (23, 'Called By', NULL, 28, 2) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (24, 'Smart Pattern', 'SMART_PATTERN_RULE', 0, 1) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (25, 'Count Changes', 'TEMPLATE RULE', 11, 1) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (36, 'Distinct Count on IMSI','TEMPLATE RULE ONDEMAND_OFFLINE_TEST',3,4);

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (38, 'Profile Match Function', 'PROFILE_MATCH', 26, 1) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (39, 'Distinct OtherParty Number', 'PROFILE_FIELD TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 3, 44) ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (40, 'Distinct Cellsite', 'PROFILE_FIELD TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 3, 14) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (46, 'In Progress Service Violation', 'TEMPLATE RULE', 5, 6) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (49, 'Sequential Dialing', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 30, 9) ;
insert into pseudo_functions (id, name, category, accumulation_field_id, accumulation_function_id) values (53, 'Per Record Check', 'RULE TEMPLATE', 0, 52) ;
insert into pseudo_functions(id, name, category, accumulation_function_id, accumulation_field_id) values (70, 'Invalid Employee', 'TEMPLATE RULE', 54, 17) ;  

-- Per Session Function Pseudo Functions
--insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (101, 'Per Session Download Data Volume', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 51, 49) ;
--insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (102, 'Per Session Upload Data Volume', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 51, 50) ;
--insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (103, 'Per Session Data Volume', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 51, 51) ;

-- Distinct Count Pseudo Functions
insert into pseudo_functions(id, name, category, accumulation_function_id, accumulation_field_id) values (104, 'Distinct Count On Specific B Number', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 55, 44) ;  

commit ;
