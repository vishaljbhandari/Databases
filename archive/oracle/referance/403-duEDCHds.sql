SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=10003 AND name='duEDCHds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('10003','duEDCHds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10071','0','DU EDCH Start','80','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10072','4','DU EDCH LocalFileTransfer','200','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10073','2','DU EDCH Translator','360','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10074','3','DU EDCH End','1400','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10082','8','DU OrderedLookUp to populate Service_type and Record_type','480','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10084','5','Is Call type National ','1120','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10085','5','Is Call type International','1240','120','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10101','5','Is Record type forwarded','640','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10106','5','Is Call conference ','960','60','1','10003');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10160','11','Assigning Null to CalledNumber','800','0','1','10003');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10071','10072','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10072','10073','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10073','10082','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10082','10101','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10084','10074','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10084','10085','10003','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10085','10074','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10085','10074','10003','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10101','10106','10003','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10101','10160','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10106','10084','10003','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10106','10084','10003','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10160','10106','10003','0','1');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','localdirectory','$RANGERHOME/RangerData/DataSourceEDCHData_Load');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10072','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10073','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10073','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10073','samplefile','C:\Documents and Settings\santoshk\Desktop\EDCH.txt');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10073','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10074','directory','$RANGERHOME/RangerData/DataSourceEDCHRaterCDRData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10074','fieldseparator',',');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10074','output_group_id','5001');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10074','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10074','touchfileinsuccessdir','true');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('10073','|971554063021|971554455667||1|600|20070203123456|334578569109234|424031235678912|1|||||
|971554063021|971554455667||1|600|20070203123456|334578569109234|424031235678912|1|F||||
|971554063021|971554455667||1|600|20070203124456|334578569109234|424031235678912|1|I||||
|971554063021|971554455667||1|600|20070203125456|334578569109234|424031235678912|1|L||||
|971554063021|971554455667||1|600|20070203123456|334578569109234|424031235678912|1||||1|
|971554063021|919845835003||1|600|20070203123456|334578569109234|424031235678912|1||||1|
|971554063021|971554443344|919845835003|1|600|20070203123456|111578569109111|424037777777777|1||||1|
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10151','I_sCallernumber',NULL,'1','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10152','I_sCallednumber',NULL,'2','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10153','I_dTimeStamp',NULL,'3','4','10003','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10154','I_sIMSI',NULL,'4','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10155','I_iDuartion',NULL,'5','1','10003','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10156','I_sCallconferenceIndicator',NULL,'6','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10157','I_sForwardednumber',NULL,'7','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10158','I_sRecordType',NULL,'8','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10159','I_sEquipmentId',NULL,'9','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10160','I_sGeographicposition',NULL,'10','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10162','I_sISComplete',NULL,'12','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10163','I_sISattempted',NULL,'13','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10168','sT_Input',NULL,'14','3','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10169','iT_Recordtype',NULL,'15','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10170','iT_Servicetype',NULL,'16','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10171','it_Record_Type',NULL,'17','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10172','it_Service_type',NULL,'18','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10173','it_Call_type',NULL,'19','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10177','it_Service',NULL,'20','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10178','iT_Recordtype_cdrservice',NULL,'21','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10179','iT_Calltype_cdrservice',NULL,'22','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10180','iT_Servicetype_cdrservice',NULL,'23','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10181','iT_Service_cdrservice',NULL,'24','1','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10182','sT_ph_number_prefix_prsnumber',NULL,'25','3','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10191','it_Isattempted',NULL,'33','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10193','it_IsComplete',NULL,'34','1','10003','4','1','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10194','it_IsCallconference',NULL,'35','1','10003','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10195','sT_InputValue',NULL,'36','3','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10196','sT_OutputValue',NULL,'37','3','10003','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10197','st_TypeOf_Call',NULL,'38','3','10003','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10291','I_sCallType',NULL,'39','3','10003','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10377','sT_Type_Of_Call',NULL,'40','3','10003','3',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10067','Is Forwarded number null check',NULL,' I_sForwardednumber  ==  sNULL ','
2^10157
1^8
2^5015
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10070','Is Record type and Service type population',NULL,' I_sRecordType  ==  sT_Input ','
2^10158
1^8
2^10168
','10003','14','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10085','Is Record type Incoming',NULL,' it_Record_Type  ==  2  ','
2^10171
1^8
4^2
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10087','Is Record type forwarded',NULL,' it_Record_Type  ==  3  ','
2^10171
1^8
4^3
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10090','Is Attempted Call check',NULL,' I_sISattempted  ==  sNULL ','
2^10163
1^8
2^5015
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10092','Is Call conference',NULL,' I_sCallconferenceIndicator  ==  sNULL ','
2^10156
1^8
2^5015
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10101','Is Record type outgoing check for caller number population',NULL,' it_Record_Type  ==  1  ','
2^10171
1^8
4^1
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10122','Is_First_Leg',NULL,' I_sISComplete  ==  F ','
2^10162
1^8
6^F
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10124','Is_Last_Leg_Call',NULL,' I_sISComplete  ==  L ','
2^10162
1^8
6^L
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10125','Is_Intermediate_Call',NULL,' I_sISComplete  ==  I ','
2^10162
1^8
6^I
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10129','Is International Call',NULL,' I_sCallType  ==  2 ','
2^10291
1^8
6^2
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10130','Is LongDistance Call',NULL,' I_sCallType  ==  1 ','
2^10291
1^8
6^1
','10003',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10135','Assigning Null to CalledNumber',NULL,' sNULL ','
2^5015
','10003',NULL,'1');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10151','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10152','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10153','0','yyyymmddhh24miss','7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10154','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10155','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10156','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10157','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10158','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10159','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10160','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10162','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10163','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10291','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('10003','10073','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10375','10151');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10376','10152');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10378','10157');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10379','10155');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10380','10153');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10381','10159');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10382','10154');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10383','10160');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10385','10162');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10386','10163');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10387','10156');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10388','10158');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10436','10291');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10375','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10376','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10378','4');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10379','6');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10380','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10381','8');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10382','9');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10383','12');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10385','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10386','13');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10387','14');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10388','5');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10003','10436','10');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10082','10171','10169','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10082','10172','10170','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10082','10197','10377','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10084','10173','28','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10085','10173','17','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10085','10173','10278','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10101','10157','10152','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10106','10194','10128','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10106','10194','10127','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10067','10157','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10067','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10067','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10070','10158','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10070','10168','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10070','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10085','10171','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10085','2 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10085','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10087','10171','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10087','3 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10087','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10090','10163','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10090','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10090','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10092','10156','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10092','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10092','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10101','10171','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10101','1 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10101','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10122','10162','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10122','F','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10122','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10124','10162','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10124','L','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10124','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10125','10162','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10125','I','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10125','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10129','10291','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10129','2','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10129','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10130','10291','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10130','1','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10130','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10135','5015','1','2');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('10135','10160','10152');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','36','5017');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','65','5020');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','5050','10136');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','5054','5018');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10151','5003');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10152','5004');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10153','5008');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10154','5010');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10155','5007');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10157','5005');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10159','5009');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10160','5011');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10171','5006');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10172','5016');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10173','5012');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10190','5015');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10194','10058');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10074','10197','10063');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10130','10084');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10129','10085');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10087','10101');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10092','10106');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10082','14','10070');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10168','14','INPUT','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10169','14','RECORD_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10170','14','SERVICE_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10178','2','RECORD_TYPE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10179','2','CALL_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10180','2','service_type','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10181','2','service','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10182','6','ph_number_prefix','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10195','15','INPUT','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10196','15','OUTPUT','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10377','14','TYPE_OF_CALL','0');
INSERT INTO rip_node_logger_map(node_id,logger_id,output_state) 
 VALUES('10073','126','1');
INSERT INTO rip_node_logger_map(node_id,logger_id,output_state) 
 VALUES('10082','126','1');
INSERT INTO rip_node_logger_map(node_id,logger_id,output_state) 
 VALUES('10085','126','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10073','4','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10074','3','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10082','0','1025');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('10073','10074');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('10082','10074');
COMMIT;
quit;
