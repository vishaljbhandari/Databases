SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=1 AND name='dusmscdrds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('1','dusmscdrds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('1','0','Du SMS Ds Start','40','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('2','4','Du SMS Ds LFT','160','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('3','2','Du SMS Ds Translator','320','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('4','3','Du SMS Ds End','1280','240','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('8','8','Du_RecordTYpe_Ordered _LookUp','480','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('17','5','Is_Incoming','680','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('18','11','Caller_Number assigned to Called_Number','880','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('19','11','st_Temp_B_Number assigned to I_sCALLERNUMBER','1040','60','1','1');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10154','5','Is_Prepaid_CDR','1160','240','1','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('1','2','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('2','3','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('3','8','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('8','17','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('17','18','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('17','10154','1','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('18','19','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('19','10154','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10154','4','1','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10154','4','1','1','2');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','localdirectory','$RANGERHOME/RangerData/DataSourceSMSCDRData_Load');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('2','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('3','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('3','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('3','samplefile','C:\DU\SMSSample1.txt');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('3','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('4','directory','$RANGERHOME/RangerData/DataSourceSMSRaterCDRData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('4','fieldseparator',',');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('4','output_group_id','1');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('4','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('4','touchfileinsuccessdir','true');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('3','|3|SMSC|971550040115|1|1||60|971555515515|1|888121|21|1||00000165|2|H|20060723172415|14400|GSMT21B*****S**I|1|42403|51|S|0|0000||0002|3|0|0|N|||||I|1|2|4|3|1|2|1|
|3|SMSC|971550040115|1|1||60|971555515515|1|888121|21|1||00000166|2|H|20060723172416|14400|GSMT21B*****S**I|1|42403|51|S|0|0000||0002|3|0|0|N|||||I|1|2|4|3|1|2|1|
|1|SMSC|971550040316|1|1|424030000000944|60|971555515515|1|971550123456|1|1||00000169|1|H|20060723173321|14400|GSMT22B*****S**I|1|42403|51|S|0|0000||0001|1|0|0|N|||||I|1|2|4|3|1|2|1|
|1|SMSC|971550040177|1|1|424030000000359|60|971555515515|1|971550040338|1|1||00000150|1|H|20060723170659|14400|GSMT22B*****S**I|1|42403|51|S|0|0000||0001|1|0|0|N|||||I|1|2|4|3|1|2|1|
|2|SMSC|971550930010|1|1|424030003530037|60|971555515515|1|888111|21|0||00000156|1|H|20060723171137|14400|GSMT22B*****S**I|1|42403|51|S|0|0000||0001|1|0|0|N|||||I|1|2|4|3|1|2|1|
|2|SMSC|971550930010|1|1|424030003530083|60|971555515515|1|888111|21|0||00000160|1|H|20060723172157|14400|GSMT22B*****S**I|1|42403|51|S|0|0000||0001|1|0|0|N|||||I|1|2|4|3|1|2|1|
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('1','I_sBSCS_MAPPING_REF',NULL,'1','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('2','I_sBSCS_STREAM',NULL,'2','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('3','I_sCALLERNUMBER',NULL,'3','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('4','I_sIMSINUMBER',NULL,'4','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5','I_sCALLEDNUMBER',NULL,'5','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('6','I_dTIME_STAMP',NULL,'6','4','1','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('7','I_sGEOGRAPHIC_POSITION',NULL,'7','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('8','I_sEQUIPMENT_ID',NULL,'8','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('9','I_sPRE_POSTPAID_INDICATOR',NULL,'9','3','1','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10','sT_BSCS_STREAM',NULL,'10','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('11','sT_BSCS_MAP_REF',NULL,'11','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('12','iT_VALUE',NULL,'12','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('13','it_Record_Type',NULL,'13','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('14','st_Phone_Number_Prefix',NULL,'14','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('15','iT_Call_Type_Value',NULL,'15','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('16','it_Call_Type Value',NULL,'16','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('21','iT_NetworkId',NULL,'17','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('22','sT_LocalNumber',NULL,'18','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('23','CustomOperandAddModifyDialog.cmbStartIndex_ConfigVal_1',NULL,'19','1','1','6','1','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('24','CustomOperandAddModifyDialog.cmbSubstringLength_ConfigVal_1',NULL,'19','1','1','6','7','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('25','st_Phone_number_prefix6',NULL,'19','3','1','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('31','st_Phone_Number',NULL,'20','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('32','st_Temp_B_Number',NULL,'21','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('38','it_CDR_Type',NULL,'22','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('39','it_CDR_Category',NULL,'23','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('40','it_Service_Type',NULL,'24','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('41','it_Subscriber_Id',NULL,'25','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('44','iT_RecordType',NULL,'26','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('45','iT_CallType',NULL,'27','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('46','iT_Service',NULL,'28','1','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('47','it_Service_value',NULL,'29','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('57','st_Rate_Type',NULL,'30','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('58','st_Call_Type_SMS',NULL,'31','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('59','rt_Rate_SMS',NULL,'32','2','1','4','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('60','sT_Rate_Type_SMS',NULL,'33','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('61','sT_Call_Type',NULL,'34','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('63','rT_Rate',NULL,'35','2','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10065','st_RatePlan',NULL,'36','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10140','it_Product_type',NULL,'37','1','1','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10167','st_Phone_number_final',NULL,'38','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10176','st_Typeof_Call',NULL,'39','3','1','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10376','sT_Type_Of_Call',NULL,'40','3','1','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10387','I_rIN_Charge',NULL,'41','2','1','1','0.0','0');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('25','5','2');
INSERT INTO rip_function_substring(custom_operand_id,start_index,length,matchtype) 
 VALUES('25','23','24','1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('1','Is_RecordType_Check',NULL,' (  I_sBSCS_MAPPING_REF  ==  sT_BSCS_MAP_REF  &&  I_sBSCS_STREAM  ==  sT_BSCS_STREAM  ) ','
0^(
2^1
1^8
2^11
1^1
2^2
1^8
2^10
0^)
','1','1','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('6','Is_Incoming_Record_Type',NULL,' it_Record_Type  ==  2  ','
2^13
1^8
4^2
','1',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('7','Caller_Number assigned to Called_Number',NULL,' I_sCALLERNUMBER ','
2^3
','1',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('8','st_Temp_B_Number assigned to I_sCALLERNUMBER',NULL,' st_Temp_B_Number ','
2^32
','1',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('12','Is_RecordType_CallType_Check',NULL,' it_Record_Type  ==  iT_RecordType  &&  it_Call_Type Value  ==  iT_CallType ','
2^13
1^8
2^44
1^1
2^16
1^8
2^45
','1','2','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10131','Is_Prepaid_CDR',NULL,' I_sPRE_POSTPAID_INDICATOR  ==  Y ','
2^9
1^8
6^Y
','1',NULL,'0');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('1','0',NULL,'6',NULL,NULL,'^[1-3]$',NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('2','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('3','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('4','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('6','0','yyyymmddhh24miss','7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('7','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('8','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('9','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10387','0',NULL,'0',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('1','3','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('1','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('2','2');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('3','3');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('4','4');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5','5');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('6','6');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('7','7');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('8','8');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10437','9');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10511','10387');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','1','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','2','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','3','4');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','4','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','5','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','6','18');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','7','22');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','8','36');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','10437','32');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('1','10511','34');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('8','13','12','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('8','10176','10376','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('17','32','5','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10154','38','10139','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10154','38','33','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','1','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','11','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','2','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','10','5','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('1','1','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('6','13','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('6','2 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('6','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('7','3','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('8','32','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','13','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','44','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','16','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','45','5','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('12','1','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10131','9','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10131','Y','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10131','8','3','1');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('7','18','5');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('8','19','3');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','3','3');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','4','10');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','5','4');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','6','8');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','7','11');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','8','9');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','13','6');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','36','14');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','37','13');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','38','23');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','43','15');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','50','7');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','65','17');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','10128','10059');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','10176','10064');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('4','10387','10137');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('6','17');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10131','10154');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('8','1','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10','1','BSCS_STREAM','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('11','1','BSCS_MAP_REF','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('12','1','VALUE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('21','3','NETWORK_ID','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('22','3','LOCAL_NUMBER','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('44','2','RECORD_TYPE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('45','2','CALL_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('46','2','service','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('60','4','RATE_TYPE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('61','4','CALL_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('63','4','RATE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10376','1','TYPE_OF_CALL','0');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('3','4','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('4','3','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('8','0','1025');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('18','5','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('19','5','1');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('3','4');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('8','4');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('18','4');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('19','4');
COMMIT;
quit;
