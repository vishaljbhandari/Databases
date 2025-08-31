
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

delete from workflow_activity_steps where workflow_id = 4000 ;
delete from workflow_paths where workflow_id = 4000 ;
delete from workflow_keys where workflow_id = 4000 ;
delete from workflow_activity_map ;
delete from workflows where id = 4000 ;
delete from activities_output_maps where id between 900 and 999 ;
delete from activity_templates_actions where id between 511 and 512 ;
delete from activities where id between 801 and 810 ;
delete from activity_templates where id between 500 and 502 ;
delete from activity_inputs where id between 601 and 610 ;
delete from activity_outputs_labels where id between 700 and 800;
delete from activity_outputs where id between 700 and 710;

insert into activity_templates (id,name,description,template_type,execution_type) values (501,'Observe Action','Input Copy',2,0);
insert into activity_templates (id,name,description,template_type,execution_type) values (502,'Dummy Action','Yes Always',2,0);

insert into activity_templates_actions (id, activity_template_id, action) values (511,501, 'input_dummy');
insert into activity_templates_actions (id, activity_template_id, action) values (512,502, 'yes_dummy');

insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (601,'Outstanding Amount','Enrichment Outstanding Amount ',2,'50.226.6','75');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (602,'Static Credit Limit','Enrichment Static Credit Limit ',2,'50.226.3','150');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (603, 'Payment Ready Status', 'Ready for Payment ', 1, 6, null);
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (604,'Customer Account Number','Enrichment Alarms.Alarm-Subscriber.Account Name ',2,'62.1','Default');
insert into activity_inputs (id,name,description,property_indicator,value,default_value) values (605,'Paying Amount','Paying amount ',1,'2',null);
	
insert into activity_outputs (id,name,description,action_type,data_type) values (701,'Outstanding Amount ','Action Result',2,2);
insert into activity_outputs (id,name,description,action_type,data_type) values (702,'Having a valid static credit Limit?','Question',1,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (703,'Readiness to pay','Action Result',2,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (704,'Paid Amount','Action Result',2,2);
insert into activity_outputs (id,name,description,action_type,data_type) values (705,'Having a valid address?','Question',1,6);
insert into activity_outputs (id,name,description,action_type,data_type) values (706,'Email status ?','Action Ressult',2,6);

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

	
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(911,801,711,6,'0','Nil amount; Has to verify credit limit','Nil found');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(912,801,712,10,'1,99','Nominal ','Nominal amount found');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(913,801,713,3,'100','Huge payment pending ','Huge amount found');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(921,802,721,6,'1','Has to send intimation','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(922,802,722,6,'-1','Has to send intimation','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(923,802,723,6,'0','Closure of Account ','Email');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(931,803,731,6,'1','Check for Amount','Payment');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(932,803,732,6,'-1','Verify Address required','Verify Identity');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(933,803,733,6,'0','Verify Address required','Verify Idendity');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(941,804,741,10,'0,99','Not allow to continue','Less');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(942,804,742,10,'100,999','Send some warning','Considerable');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(943,804,743,3,'1000','Encourage the subscriber with new offers','Remarkable');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(951,805,751,6,'1','Has to verify credit limit','Verify CL');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(952,805,752,6,'-1','Has to verify credit limit','Verify CL');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(953,805,753,6,'0','Closure of Account','Email');

--- always return yes for the actions of activities 806,807,808 --

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(961,806,761,6,'1','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(962,807,761,6,'1','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(963,808,761,6,'1','Send Account closure notification','Email');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(964,806,762,6,'-1','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(965,807,762,6,'-1','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(966,808,762,6,'-1','Send Account closure notification','Email');

insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(967,806,763,6,'0','Send intimation','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(968,807,763,6,'0','Send reminder','Email');
insert into activities_output_maps (id,activity_id,label_id,operator_id,value,memo,additional_info) values 
(969,808,763,6,'0','Send Account closure notification','Email');

insert into workflows (id, name, description) values (4000, 'Credit Card Fraud Cases', 'Workflow to investigate the credit card fraud cases.') ;

insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3001, 4000, 000, 'Start', 1, '[405.0, 69.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3002, 4000, 808, 'Closure', 2, '[536.0, 575.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3003, 4000, 803, 'ReadyNess', 3, '[571.0, 236.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3004, 4000, 804, 'Amount', 4, '[360.0, 388.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3005, 4000, 805, 'Address', 5, '[745.0, 409.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3006, 4000, 806, 'Intimation', 6, '[381.0, 547.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3007, 4000, 801, 'Outstanding', 7, '[404.0, 162.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3008, 4000, 807, 'Reminder', 8, '[169.0, 570.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3009, 4000, 802, 'CreditLimit', 9, '[162.0, 318.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3010, 4000, 000, 'EndYes', 10, '[326.0, 744.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3011, 4000, 000, 'EndNo', 11, '[504.0, 741.0]') ;
insert into workflow_activity_steps ( id,workflow_id,activity_id,activity_label,step_id,position) 
	values(3012, 4000, 000, 'EndNotApplicable', 12, '[955.0, 719.0]') ;

insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5000, 4000, 1, 000, 7) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5001, 4000, 2, 963, 10) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5002, 4000, 2, 969, 11) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5003, 4000, 2, 966, 12) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5004, 4000, 3, 931, 4) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5005, 4000, 3, 932, 6) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5006, 4000, 3, 933, 5) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5007, 4000, 4, 941, 2) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5008, 4000, 4, 942, 8) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5009, 4000, 4, 943, 6) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5010, 4000, 5, 951, 9) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5011, 4000, 5, 953, 2) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5012, 4000, 5, 952, 12) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5013, 4000, 6, 964, 12) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5014, 4000, 6, 967, 11) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5015, 4000, 6, 961, 10) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5016, 4000, 7, 912, 9) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5017, 4000, 7, 911, 2) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5018, 4000, 7, 913, 3) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5019, 4000, 8, 968, 11) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5020, 4000, 8, 962, 10) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5021, 4000, 8, 965, 12) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5022, 4000, 9, 923, 2) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5023, 4000, 9, 922, 12) ;
insert into workflow_paths ( id,workflow_id,current_step_id,activities_output_map_id,next_step_id) values(5024, 4000, 9, 921, 6) ;

insert into workflow_keys (id, workflow_id, fraud_type, reference_type, network_id) values(6000, 4000, 1, 1, 1024) ;
insert into workflow_keys (id, workflow_id, fraud_type, reference_type, network_id) values(6001, 4000, 1, 1, 1025) ;
insert into workflow_keys (id, workflow_id, fraud_type, reference_type, network_id) values(6002, 4000, 1, 1, 1026) ;
insert into workflow_keys (id, workflow_id, fraud_type, reference_type, network_id) values(6003, 4000, 1, 1, 1027) ;
insert into workflow_keys (id, workflow_id, fraud_type, reference_type, network_id) values(6004, 4000, 1, 1, 1028) ;

commit;
spool off;

