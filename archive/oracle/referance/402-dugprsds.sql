SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=10021 AND name='dugprsds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('10021','dugprsds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10181','0','GPRS_DS_START','80','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10182','4','LFT_GPRS_DS','200','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10183','2','GPRS_Translator','320','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10184','3','GPRS_END','1080','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10185','8','Looku Up table to populate Session_Status','600','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10190','5','Is Postpaid_cdr_type','880','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10192','8','Look up to fetch Valid Id','440','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10196','5','Is SA_CDR_Check','720','120','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10197','5','Is_Hoamer_Check','920','240','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10198','5','Is Prepaid_Postpaid_Null','800','60','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10200','5','Is_Cause_for_Session_Null','520','60','1','10021');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10201','5','Is IMSI_NULL','800','240','1','10021');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10181','10182','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10182','10183','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10183','10192','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10185','10196','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10185','10196','10021','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10190','10184','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10190','10184','10021','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10192','10200','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10196','10198','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10196','10201','10021','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10197','10184','10021','1','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10198','10184','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10198','10190','10021','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10200','10185','10021','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10200','10196','10021','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10201','10197','10021','1','1');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','localdirectory','$RANGERHOME/RangerData/DataSourceGPRSCDRData_Load');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10182','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10183','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10183','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10183','samplefile','C:\Documents and Settings\niranjanb\Desktop\gprs_data.txt');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10183','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10184','directory','$RANGERHOME/RangerData/DataSourceRaterGPRSCDRData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10184','fieldseparator',',');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10184','output_group_id','10003');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10184','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10184','touchfileinsuccessdir','true');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('10183','|225|1823481||971552877699|424030003885237|1476775381||00000000000000000000000050E3180D|0000000000000000000000000AF04368||14400|20070501010911|0|84||0272964A4A7482FFFF|0|||||0|0||||8|42403||||||||1594|558|962609956|0|0|0|2|6|0||1|
|18|1823481||971552877699|424030003885237|1476775381||00000000000000000000000050E3180D|0000000000000000000000000AF04368||14400|20070501020911|0|84||0272964A4A7482FFFF|0|||||0|0||||8|42403||||||||1594|558|962609956|0|0|0|2|6|0||1|
|225|1823481||971552877699|424030003885237|1476775381||00000000000000000000000050E3180D|0000000000000000000000000AF04368||14400|20070502010911|0|84||0272964A4A7482FFFF|0|||||0|0||||8|42403||||||||1594|558|962609956|0|0|0|2|6|0||1|
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10323','I_sField_Id',NULL,'1','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10324','I_sRecord_Sequence',NULL,'2','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10325','I_sPhone_Number',NULL,'3','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10326','I_dTimestamp',NULL,'4','4','10021','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10327','I_iDuration',NULL,'5','1','10021','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10328','I_sPre_Post_Indicator',NULL,'6','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10329','I_sIMSI',NULL,'7','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10330','I_sIMEI',NULL,'8','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10331','I_sServedPDPAddress',NULL,'9','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10332','I_rUpLink',NULL,'10','2','10021','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10333','I_rDownLink',NULL,'11','2','10021','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10334','I_sAPN',NULL,'12','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10335','I_sCharging_Id',NULL,'13','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10336','I_sCause_For_Session_close',NULL,'14','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10337','I_sGGSN_Address',NULL,'15','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10338','I_sSGSN_Address',NULL,'16','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10339','I_sNetwork_int_pdp_cntxt',NULL,'17','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10340','I_sRecord_Opening_Time',NULL,'18','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10341','I_sSGSN_Change',NULL,'19','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10342','I_sPDP_HLR_Index',NULL,'20','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10343','I_sOptional_Data',NULL,'21','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10344','I_sCharging_Type',NULL,'22','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10345','I_sPLMN_ID',NULL,'23','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10346','I_sCamel_APN_Network',NULL,'24','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10347','I_sCamel_APN_Operator',NULL,'25','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10348','I_sCamel_Append',NULL,'26','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10349','I_sCamel_FFD',NULL,'27','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10350','I_sAPN_Operator',NULL,'28','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10351','I_sRouting_Area',NULL,'29','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10352','I_sService_Area_Code',NULL,'30','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10353','I_sToll_Free_Uplink',NULL,'31','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10354','I_sToll_Free_Downlink',NULL,'32','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10355','I_sSession_Id',NULL,'33','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10356','I_sCharging_Profile',NULL,'34','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10357','I_sUplink_Hits',NULL,'35','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10358','I_sDownlink_Hits',NULL,'36','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10359','I_sSA_Charging_Class',NULL,'37','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10360','I_sSA_Service_ID',NULL,'38','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10361','I_sWallet_ID',NULL,'39','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10362','I_sWallet_Charging_Type',NULL,'40','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10363','I_sAccess_Type',NULL,'41','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10364','sT_Cause_for_session',NULL,'42','3','10021','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10365','iT_Session_Status',NULL,'43','1','10021','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10366','it_Serssion_Status',NULL,'44','1','10021','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10367','I_sGeographic_Position',NULL,'45','3','10021','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10369','it_CDR_Type',NULL,'46','1','10021','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10371','sT_Field_ID',NULL,'47','3','10021','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10372','sT_CDR_Type',NULL,'48','3','10021','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10381','it_Subscriber_Id',NULL,'49','1','10021','4','0','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10141','Is Cause_for_session_check',NULL,' I_sCause_For_Session_close  ==  sT_Cause_for_session ','
2^10336
1^8
2^10364
','10021','17','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10142','Is_S_CDR_Check',NULL,' I_sField_Id  ==  18 ','
2^10323
1^8
6^18
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10143','Is_SA_CDR_Check',NULL,' I_sField_Id  ==  225 ','
2^10323
1^8
6^225
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10144','Is_G_CDR',NULL,' I_sField_Id  ==  19 ','
2^10323
1^8
6^19
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10146','Is Postpaid_check',NULL,' I_sPre_Post_Indicator  ==  02  ||  I_sPre_Post_Indicator  ==  08  ||  I_sPre_Post_Indicator  ==  2  ||  I_sPre_Post_Indicator  ==  8 ','
2^10328
1^8
6^02
1^2
2^10328
1^8
6^08
1^2
2^10328
1^8
6^2
1^2
2^10328
1^8
6^8
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10148','Is Valid_Field_Id',NULL,' I_sField_Id  ==  sT_Field_ID ','
2^10323
1^8
2^10371
','10021','18','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10150','I_sHoamer_check',NULL,' I_sIMSI  BW  s_DU_IMSI_PREFIX ','
2^10329
1^10
2^5040
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10151','Is_Prepaid_Postpaid_Indicator_Null',NULL,' I_sPre_Post_Indicator  ==  sNULL ','
2^10328
1^8
2^5015
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10153','Is_Cause_for_Session_Null_Check',NULL,' I_sCause_For_Session_close  ==  sNULL ','
2^10336
1^8
2^5015
','10021',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10154','Is IMSI_NULL_Check',NULL,' I_sIMSI  ==  sNULL ','
2^10329
1^8
2^5015
','10021',NULL,'0');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10323','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10324','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10325','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10326','0','yyyymmddhh24miss','7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10327','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10328','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10329','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10330','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10331','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10332','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10333','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10334','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10335','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10336','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10337','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10338','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10339','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10340','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10341','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10342','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10343','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10344','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10345','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10346','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10347','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10348','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10349','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10350','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10351','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10352','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10353','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10354','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10355','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10356','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10357','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10358','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10359','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10360','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10361','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10362','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10363','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10367','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('10021','10183','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10461','10323');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10462','10324');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10463','10325');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10464','10326');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10465','10327');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10466','10328');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10467','10329');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10468','10330');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10469','10331');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10470','10332');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10471','10333');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10472','10334');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10473','10335');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10474','10336');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10475','10337');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10476','10338');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10477','10339');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10478','10340');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10479','10341');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10480','10342');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10481','10343');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10482','10344');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10483','10345');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10484','10346');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10485','10347');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10486','10348');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10487','10349');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10488','10350');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10489','10351');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10490','10352');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10491','10353');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10492','10354');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10493','10355');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10494','10356');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10495','10357');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10496','10358');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10497','10359');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10498','10360');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10499','10361');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10500','10362');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10501','10363');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10502','10367');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10461','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10462','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10463','5');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10464','13');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10465','18');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10466','15');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10467','6');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10468','19');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10469','10');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10470','23');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10471','24');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10472','20');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10473','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10474','14');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10475','8');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10476','9');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10477','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10478','12');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10479','25');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10480','26');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10481','27');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10482','28');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10483','29');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10484','30');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10485','31');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10486','32');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10487','33');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10488','34');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10489','35');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10490','36');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10491','37');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10492','38');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10493','39');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10494','40');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10495','41');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10496','42');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10497','43');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10498','44');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10499','45');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10500','46');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10501','47');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10021','10502','21');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10185','10366','10365','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10185','10366','10278','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10190','10369','33','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10190','10369','10139','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10197','10369','5045','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10197','10381','5046','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10198','10369','33','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10200','10336','10322','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10200','10366','5047','0');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10141','10336','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10141','10364','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10141','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10142','10323','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10142','18','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10142','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10143','10323','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10143','225','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10143','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10144','10323','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10144','19','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10144','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','10328','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','02','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','10328','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','08','5','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','2','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','10328','8','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','2','9','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','8','10','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','2','11','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','10328','12','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','8','13','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','8','14','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10146','2','15','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10148','10323','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10148','10371','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10148','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10150','10329','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10150','5040','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10150','10','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10151','10328','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10151','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10151','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10153','10336','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10153','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10153','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10154','10329','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10154','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10154','8','3','1');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','5015','10130');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','5050','10134');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','7022','10070');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10045','10074');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10249','10078');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10250','10079');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10321','10083');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10323','10098');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10324','10099');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10325','10073');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10326','10071');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10327','10072');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10329','10084');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10330','10085');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10331','10091');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10332','10076');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10333','10077');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10334','10087');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10335','10082');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10336','10089');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10337','10100');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10338','10101');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10339','10102');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10340','10103');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10341','10104');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10342','10105');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10343','10106');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10344','10107');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10345','10108');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10346','10109');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10347','10110');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10348','10111');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10349','10112');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10350','10113');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10351','10114');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10352','10115');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10353','10116');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10354','10117');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10355','10118');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10356','10119');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10357','10120');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10358','10121');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10359','10122');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10360','10123');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10361','10124');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10362','10125');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10363','10126');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10366','10086');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10367','10088');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10369','10075');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10184','10381','10081');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10146','10190');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10143','10196');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10150','10197');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10151','10198');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10153','10200');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10154','10201');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10185','17','10141');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10192','18','10148');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10364','17','CAUSE_FOR_SESSION','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10365','17','OUTPUT','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10371','18','FIELD_ID','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10372','18','CDR_TYPE','0');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10192','1','7044');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10197','1','7046');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10201','1','7048');
COMMIT;
quit;
