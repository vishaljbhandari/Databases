
------### Defs ###-----

--- Operator 
---	4 - Less than
---	5 - Greater than
---	3 - Greater than eq 	
---	6 - Equal
---	7 - Not Equal

--- Data Type
---	1 - Int
---	2 - Double
---	3 - String
---	6 - Boolean

--- Action Type
---	1 - Direct
---	2 - Action Result


------### Document Verification Activity ###------
set feedback off;
set serveroutput off ;
SPOOL nikira-DML-demo-2-workflow.log

delete from workflow_transactions ;
delete from workflow_trans_variables ;
delete from alarm_workflow_info ;

delete from workflow_paths ;
delete from workflow_activity_steps  where id between 6001 and 6030; 
delete from workflow_activity_map ;
delete from workflow_keys where id between 2024 and 2053 ;
delete from workflows where id = 4000 ;
delete from activities_output_maps  where id between 911 and 978;
delete from activity_templates_actions where id between 511 and 513 ;
delete from activities where id between 801 and 820 ;
delete from activity_templates where id between 500 and 503 ;
delete from activity_inputs where id between 601 and 620 ;
delete from activity_outputs_labels where id between 700 and 800;
delete from activity_outputs where id between 700 and 720;

insert into activity_templates (id,name,description,template_type,execution_type) values (501,'Observe Action','Input Copy',2,0);
insert into activity_templates (id,name,description,template_type,execution_type) values (502,'Dummy Action','Yes Always',2,0);
insert into activity_templates (id,name,description,template_type,execution_type) values (503,'Payment Action','Payment Action',2,0);

insert into activity_templates_actions (id, activity_template_id, action) values (511,501, 'input_dummy');
insert into activity_templates_actions (id, activity_template_id, action) values (512,502, 'yes_dummy');
insert into activity_templates_actions (id, activity_template_id, action) values (513,501, 'payment_dummy');

insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (601,'Outstanding Amount','Enrichment Outstanding Amount ',2,'50.226.6','75');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (602,'Static Credit Limit','Enrichment Static Credit Limit ',2,'50.226.3','150');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (603, 'Payment Ready Status', 'Ready for Payment ', 1, 6, null);
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (604,'Customer Account Number','Enrichment Alarms.Alarm-Subscriber.Account Name ',2,'62.1','Default');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (605,'Paying Amount','Paying amount ',1,'2',null);
Insert into ACTIVITY_INPUTS (ID,NAME,DESCRIPTION,PROPERTY_INDICATOR,VALUE,DEFAULT_VALUE) values (610,'Last Payment Date',null,1,'4','1');
Insert into ACTIVITY_INPUTS (ID,NAME,DESCRIPTION,PROPERTY_INDICATOR,VALUE,DEFAULT_VALUE) values (611,'Customer Phonenumber',null,2,'62.12','+12345');
Insert into ACTIVITY_INPUTS (ID,NAME,DESCRIPTION,PROPERTY_INDICATOR,VALUE,DEFAULT_VALUE) values (612,'Customer Address',null,1,'3','0');
Insert into ACTIVITY_INPUTS (ID,NAME,DESCRIPTION,PROPERTY_INDICATOR,VALUE,DEFAULT_VALUE) values (613,'Last Payed Amount',null,1,'1','10');
	
insert into activity_outputs (id,name,description,action_type,data_type) values (701,'Outstanding Amount ','Action Result',2,2);
insert into activity_outputs (id,name,description,action_type,data_type) values (702,'Having a valid static credit Limit?','Question',1,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (703,'Readiness to pay','Action Result',2,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (704,'Paid Amount','Action Result',2,2);
insert into activity_outputs (id,name,description,action_type,data_type) values (705,'Having a valid address?','Question',1,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (706,'Email status ?','Action Ressult',2,6);
Insert into ACTIVITY_OUTPUTS (ID,NAME,DESCRIPTION,ACTION_TYPE,DATA_TYPE) values (707,'Payement on time? ',null,2,4);
Insert into ACTIVITY_OUTPUTS (ID,NAME,DESCRIPTION,ACTION_TYPE,DATA_TYPE) values (708,'Output readiness confirmed?',null,1,6);
Insert into ACTIVITY_OUTPUTS (ID,NAME,DESCRIPTION,ACTION_TYPE,DATA_TYPE) values (709,'Enough Payment?',null,2,1);


insert into activity_outputs_labels (id,activity_output_id,name) values (711,701,'Nil');
insert into activity_outputs_labels (id,activity_output_id,name) values (712,701,'Nominal');
insert into activity_outputs_labels (id,activity_output_id,name) values (713,701,'Huge');

insert into activity_outputs_labels (id,activity_output_id,name) values (721,702,'Yes');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (722,702,'Not Applicable');          
insert into activity_outputs_labels (id,activity_output_id,name) values (723,702,'No');                      
                                                                                                             
insert into activity_outputs_labels (id,activity_output_id,name) values (731,703,'Yes');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (732,703,'Not Applicable');          
insert into activity_outputs_labels (id,activity_output_id,name) values (733,703,'No');                      
                                                                                                             
insert into activity_outputs_labels (id,activity_output_id,name) values (741,704,'Less');                    
insert into activity_outputs_labels (id,activity_output_id,name) values (742,704,'Considerable');            
insert into activity_outputs_labels (id,activity_output_id,name) values (743,704,'Remarkable');              
                                                                                                             
insert into activity_outputs_labels (id,activity_output_id,name) values (751,705,'Yes');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (752,705,'Not Applicable');          
insert into activity_outputs_labels (id,activity_output_id,name) values (753,705,'No');                      
                                                                                                             
insert into activity_outputs_labels (id,activity_output_id,name) values (761,706,'Yes');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (762,706,'Not Applicable');        
insert into activity_outputs_labels (id,activity_output_id,name) values (763,706,'No');

Insert into ACTIVITY_OUTPUTS_LABELS (ID,ACTIVITY_OUTPUT_ID,NAME) values (764, 707,'Yes');
Insert into ACTIVITY_OUTPUTS_LABELS (ID,ACTIVITY_OUTPUT_ID,NAME) values (765, 707,'No');
Insert into ACTIVITY_OUTPUTS_LABELS (ID,ACTIVITY_OUTPUT_ID,NAME) values (766, 707,'Not Applicable');

insert into activity_outputs_labels (id,activity_output_id,name) values (767,708,'Yes');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (768,708,'Not Applicable');          
insert into activity_outputs_labels (id,activity_output_id,name) values (769,708,'No');                      


insert into activity_outputs_labels (id,activity_output_id,name) values (770,709,'Large Amount');                     
insert into activity_outputs_labels (id,activity_output_id,name) values (771,709,'Medium Amount');          
insert into activity_outputs_labels (id,activity_output_id,name) values (772,709,'Less Amount');                      

insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (801,'Check for Outstanding Amount ','Check for Outstanding Amount',1,501,1,'601',701);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (802,'Static Credit Limit Verification','Static Credit Limit Verification',1,502,0,'602',702);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (803,'Ask for Outstanding Amount Payment Readiness','Ask for Outstanding Amount Payment',1,501,0,'603',703);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (804,'Amount Verification ','Amount Verification',1,501,1,'605',704);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (805,'Customer Address Verification','Address Verification',1,502,1,'604',705);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (806,'Send Intimation','Send Intimation',1,502,0,'604',706);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (807,'Send Reminder','Send Reminder',1,502,1,'604',706);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
	values (808,'Send Account Closure Notification','Send Account Closure Notification',1,502,1,'604',706);
insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
  values (809,'payment check','payment check',1,501,0,'610',707);

insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
  values (810,'check address manually?','check address manually?',1,502,0,'611,612',708);

insert into activities (id,name,description,jeopardy_period,activity_template_id,is_automatic,input_ids,output_id) 
  values (811,'check the payment value','check the payment value?',0,501,0,'613',709);


----insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
----(911,801,711,6,'0','Nil amount; Has to verify credit limit','Nil found');
----insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
----(912,801,712,10,'1,99','Nominal ','Nominal amount found');
	
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(911,801,711,10,'1,60','Nil amount; Has to verify credit limit','Nil found');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(912,801,712,10,'61,99','Nominal ','Nominal amount found');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(913,801,713,3,'100','Huge payment pending ','Huge amount found');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(921,802,721,6,'1','Has to send intimation','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(922,802,722,6,'-1','Has to send intimation','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(923,802,723,6,'0','Closure of Account ','Email');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(931,803,731,6,'1','Check for Amount','Payment');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(932,803,732,6,'-1','Verify Address required','Verify Identity');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(933,803,733,6,'0','Verify Address required','Verify Idendity');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(941,804,741,10,'0,99','Not allow to continue','Less');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(942,804,742,10,'100,999','Send some warning','Considerable');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(943,804,743,3,'1000','Encourage the subscriber with new offers','Remarkable');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(951,805,751,6,'1','Has to verify credit limit','Verify CL');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(952,805,752,6,'-1','Has to verify credit limit','Verify CL');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(953,805,753,6,'0','Closure of Account','Email');

--- always return yes for the actions of activities 806,807,808 --

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(961,806,761,6,'1','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(962,807,761,6,'1','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(963,808,761,6,'1','Send Account closure notification 1','Email');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(964,806,762,6,'-1','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(965,807,762,6,'-1','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(966,808,762,6,'-1','Send Account closure notification 2','Email');

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(967,806,763,6,'0','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(968,807,763,6,'0','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(969,808,763,6,'0','Send Account closure notification 3','Email');

Insert into ACTIVITIES_OUTPUT_MAPS (ID,ACTIVITY_ID,LABEL,OPERATOR_ID,VALUE,MEMO,ADDITIONAL_INFO) values 
(970,809,'764',6,'2010/09/01','on time payement','on time payement');
Insert into ACTIVITIES_OUTPUT_MAPS (ID,ACTIVITY_ID,LABEL,OPERATOR_ID,VALUE,MEMO,ADDITIONAL_INFO) values 
(971,809,'765',10,'2010/06/01,2010/07/01','no payment on time',null);
Insert into ACTIVITIES_OUTPUT_MAPS (ID,ACTIVITY_ID,LABEL,OPERATOR_ID,VALUE,MEMO,ADDITIONAL_INFO) values 
(972,809,'766',10,'2010/08/01,2010/08/09','not applicable',null);

insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(973,810,767,6,'1','Valid Address','');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(974,810,769,6,'0','Invalid Adress','');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(975,810,768,6,'-1','Not applicable','');


insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(976,811,770,5,'1000','Large Amount','');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(977,811,771,10,'100,1000','Medium Amount','');
insert into activities_output_maps (id,activity_id,label,operator_id,value,memo,additional_info) values 
(978,811,772,4,'99','Less Amount','');


insert into workflows (id, name, description) values (4000, 'Credit Card Fraud Cases', 'Workflow to investigate the credit card fraud cases.') ;

insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2024, 4000, 7, 1, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2025, 4000, 7, 2, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2026, 4000, 7, 3, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2027, 4000, 7, 4, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2028, 4000, 7, 5, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2029, 4000, 7, 6, 1024) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2030, 4000, 7, 1, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2031, 4000, 7, 2, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2032, 4000, 7, 3, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2033, 4000, 7, 4, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2034, 4000, 7, 5, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2035, 4000, 7, 6, 1025) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2036, 4000, 7, 1, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2037, 4000, 7, 2, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2038, 4000, 7, 3, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2039, 4000, 7, 4, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2040, 4000, 7, 5, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2041, 4000, 7, 6, 1026) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2042, 4000, 7, 1, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2043, 4000, 7, 2, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2044, 4000, 7, 3, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2045, 4000, 7, 4, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2046, 4000, 7, 5, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2047, 4000, 7, 6, 1027) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2048, 4000, 7, 1, 1028) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2049, 4000, 7, 2, 1028) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2050, 4000, 7, 3, 1028) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2051, 4000, 7, 4, 1028) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2052, 4000, 7, 5, 1028) ;
insert into workflow_keys ( id, workflow_id, fraud_type, reference_type, network_id) values (2053, 4000, 7, 6, 1028) ;

insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6001, 4000, 801, 1, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6002, 4000, 802, 2, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6003, 4000, 803, 3, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6004, 4000, 804, 4, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6005, 4000, 805, 5, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6006, 4000, 808, 6, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6007, 4000, 807, 7, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6008, 4000, 806, 8, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6009, 4000, 809, 9, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6010, 4000, 810, 10, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6010, 4000, 811, 11, 'L,R,T,B') ;
insert into workflow_activity_steps (id, workflow_id, activity_id, step_id, position) values (6019, 4000,   0, 15, 'L,R,T,B') ;

---A0-->A1--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7000, 4000, 0, 0, 1) ;

---A1-->A2:A3:A3--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7001, 4000, 1, 911, 2) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7002, 4000, 1, 912, 3) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7003, 4000, 1, 913, 3) ;

---A2-->A6:A6:A8--

  
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7004, 4000, 2, 921, 8) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7005, 4000, 2, 923, 15) ;
-- insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7005, 4000, 2, 922, 8) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7006, 4000, 2, 963, 6) ;
  

-----A3-->A4:A5:A5--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7008, 4000, 3, 932, 5) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7009, 4000, 3, 933, 9) ;
-----  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7009, 4000, 3, 933, 5) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7007, 4000, 3, 931, 4) ;
 -- insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7008, 4000, 3, 932, 5) ;
 -- insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7009, 4000, 3, 933, 5) ;

-----A4-->A8:A7:A6--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7010, 4000, 4, 941, 6) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7011, 4000, 4, 942, 7) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7012, 4000, 4, 943, 8) ;

-----A5-->A2:A2:A8--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7013, 4000, 5, 951, 2) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7014, 4000, 5, 952, 2) ;
----  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7015, 4000, 5, 963, 6) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7015, 4000, 5, 953, 8) ;

-----A6:0--A7:0--A8:0--

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7016, 4000, 6, 963, 15) ;
 ---- insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7016, 4000, 6, 961, 9) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7017, 4000, 7, 962, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7018, 4000, 8, 961, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7019, 4000, 8, 963, 15) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7020, 4000, 6, 964, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7021, 4000, 7, 965, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7022, 4000, 8, 966, 15) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7023, 4000, 6, 967, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7024, 4000, 7, 968, 15) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7025, 4000, 8, 969, 15) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7026, 4000, 9, 970, 10) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7027, 4000, 9, 971, 11) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7028, 4000, 9, 972, 8) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7029, 4000,10, 973, 8) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7030, 4000,10, 974, 4) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7031, 4000,10, 975, 8) ;

  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7032, 4000,11, 976, 4) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7033, 4000,11, 977, 4) ;
  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7034, 4000,11, 978, 8) ;


  insert into workflow_paths (id, workflow_id, current_step_id, activities_output_map_id, next_step_id) values (7055, 4000, 15, 0, 0) ;


commit;
spool off;

