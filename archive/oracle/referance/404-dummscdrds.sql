SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=10005 AND name='dummscdrds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('10005','dummscdrds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10120','0','DU_MMS_CDR_Start','40','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10121','4','DU_MMS_LFT','240','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10122','2','DU_MMS_Translator','360','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10123','3','DU_MMS_End','960','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10125','8','LookUp to Populate Record_Type','480','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10129','5','Is_Prepaid','800','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10162','5','Is_Incoming_Record','600','240','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10194','5','Is_Outroamer_Incoming','720','120','1','10005');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10195','5','Is_Outroamer_Outgoing','720','360','1','10005');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10120','10121','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10121','10122','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10122','10125','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10125','10162','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10129','10123','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10129','10123','10005','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10162','10194','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10162','10195','10005','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10194','10123','10005','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10194','10129','10005','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10195','10123','10005','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10195','10129','10005','0','1');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','localdirectory','$RANGERHOME/RangerData/DataSourceMMSCDRData_Load');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10121','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10122','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10122','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10122','samplefile','C:\Documents and Settings\niranjanb\Desktop\MMSCDRData_Sample.dat');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10122','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10123','directory','$RANGERHOME/RangerData/DataSourceRaterMMSCDRData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10123','fieldseparator',',');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10123','output_group_id','10003');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10123','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10123','touchfileinsuccessdir','true');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('10122','|1|MMSC|971556225022|1|1|424030004070118|60|Breeze-1.0/arcsoft-mmsua-3.1.0||||0|9715509300|1|971556409661|1|1|||||0||RgplQAoTEQUAAAnLAAAAIwAAAK8AAAAA|1|H|20070328165320|14400|GSMT**B*****SG0I|1||263|0|0|0|0|0|0|263|1|0|0|1|1|42403|51|424030004070129|9715509300||S|0|0|0|0|128|0|0|0|0|0|0||0|0|N||||||I|1|2|4|3|1|2|1|1|
|1|MMSC|971555222155|1|1|424030004118664|60|Nokia3250/1.00 Series60/3.0 Pr||||0|9715509300|1|971555333155|1|1|||||0||RgpmUQoTEQQAAAnYAAAAJAAAAcYAAAAA|1|H|20070328165753|14400|GSMT**B*****SG0I|1||1282|0|0|0|0|1051|1|0|0|0|0|1|1|42403|51|424030004014787|9715509300||S|0|0|0|0|128|0|0|1|0|0|0||0|0|N||||||I|1|2|4|3|1|2|4|1|
|2|MMSC|971552144844|1|1|424030003962932|60|SonyEricssonK800i/R1GB||||0|9715509300|1|princessamira05@hotmail.com|21|1|||||||RgpkvgoTEQUAAAnLAAAAJAAAAaoAAAAA|1|H|20070328165110|14400|GSMT**B*****SG0I|1||47112|0|0|0|0|46713|1|0|0|0|0|1|1|42403|51||||S|0|0|0|1|128|0|1|0|4|0|0||0|0|Y||0.45|44|||I|1|2|4|3|1|2|4|1|
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10200','I_sBSCS_Map_ref',NULL,'1','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10201','I_sBSCS_Stream',NULL,'2','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10202','I_dTimeStamp',NULL,'3','4','10005','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10203','I_iDuration',NULL,'4','1','10005','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10204','I_sPhone_number',NULL,'5','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10205','I_sIMSI',NULL,'6','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10206','I_rData_Volume',NULL,'7','2','10005','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10207','I_sSender_Terminal_type',NULL,'8','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10208','I_sSender_Term_IP_Addr',NULL,'9','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10209','I_sOrig_Vasp_Id',NULL,'10','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10210','I_sOrig_Vas_Id',NULL,'11','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10211','I_sSender_Roaming_Class',NULL,'12','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10212','I_sRecipient_term_ip_addr',NULL,'13','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10213','I_sAddress_Hiding_Status',NULL,'14','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10214','I_sDest_Vasp_Id',NULL,'15','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10215','I_sDest_vas_Id',NULL,'16','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10216','I_sRecipient_roaming_class',NULL,'17','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10217','I_sForwarded_By',NULL,'18','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10218','I_sMsg_Id',NULL,'19','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10219','I_sPriority',NULL,'20','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10220','I_sCNT_SIZE_Video',NULL,'21','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10221','I_sCNT_Number_Video',NULL,'22','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10222','I_sCNT_Size_Audio',NULL,'23','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10223','I_sCNT_Number_Audio',NULL,'24','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10224','I_sCNT_Size_Image',NULL,'25','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10225','I_sCNT_Number_Image',NULL,'26','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10226','I_sCNT_Size_Text',NULL,'27','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10227','I_sCNT_Number_Text',NULL,'28','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10228','I_sCNT_Size_Other',NULL,'29','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10229','I_sCNT_Number_Other',NULL,'30','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10230','I_sRecipient_Number',NULL,'31','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10231','I_sNo_of_sucfl_recipients',NULL,'32','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10232','I_sDest_MMSC',NULL,'33','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10233','I_sDelivery_status',NULL,'34','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10234','I_sError_cause',NULL,'35','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10235','I_sTariff_Class',NULL,'36','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10236','I_sMessage_class',NULL,'37','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10237','I_sSender_Charging_Type',NULL,'38','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10238','I_sRecipient_Charging_type',NULL,'39','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10239','I_sSender_Prepaid_status',NULL,'40','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10240','I_sRecipient_prepaid_status',NULL,'41','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10241','I_sOther_Party_Number',NULL,'42','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10242','I_sCharged_Party',NULL,'43','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10243','I_sPre_Postpaid_Flag',NULL,'44','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10253','it_Record_Type',NULL,'45','1','10005','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10254','it_Cdr_Type',NULL,'46','1','10005','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10255','it_ServiceType',NULL,'47','1','10005','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10256','st_RatePlan_ID',NULL,'48','3','10005','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10257','st_SubscriberLess_Indicator',NULL,'49','3','10005','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10258','sT_BSCS_STREAM',NULL,'50','3','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10259','sT_BSCS_MAP_REF',NULL,'51','3','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10260','iT_VALUE',NULL,'52','1','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10261','rt_Upload_Data_Volume',NULL,'53','2','10005','4','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10262','rt_Download_Data_Volume',NULL,'54','2','10005','4','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10263','sT_STARTING_IMSI',NULL,'55','3','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10265','s_TCOUNTRY_CODE',NULL,'56','3','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10267','st_Phonenumber',NULL,'57','3','10005','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10274','it_MMS_Service',NULL,'58','1','10005','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10378','iT_Service_Type',NULL,'59','1','10005','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10379','I_sORG_MSC',NULL,'60','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10380','I_sDEST_MSC',NULL,'61','3','10005','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10385','I_rIN_Charge',NULL,'62','2','10005','1','0.0','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10103','Is_Record_Type_Populate',NULL,' I_sBSCS_Map_ref  ==  sT_BSCS_MAP_REF  &&  I_sBSCS_Stream  ==  sT_BSCS_STREAM ','
2^10200
1^8
2^10259
1^1
2^10201
1^8
2^10258
','10005','1','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10104','Is_Incoming_Record_Type',NULL,' it_Record_Type  ==  2  ','
2^10253
1^8
4^2
','10005',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10105','Is_Outroamer_outgoing',NULL,' I_sORG_MSC  BW  sDU_PHONENUMBER_PREFIX ','
2^10379
1^10
2^10264
','10005',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10106','Is_Prepaid_Check',NULL,' I_sPre_Postpaid_Flag  ==  Y ','
2^10243
1^8
6^Y
','10005',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10107','Is_PostPaid_Check',NULL,' I_sPre_Postpaid_Flag  ==  N ','
2^10243
1^8
6^N
','10005',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10109','Is_IMSI_ONE_Check',NULL,' I_sIMSI  ==  1 ','
2^10205
1^8
6^1
','10005',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10110','Is_Outroamer_Check',NULL,' I_sDEST_MSC  BW  sDU_PHONENUMBER_PREFIX ','
2^10380
1^10
2^10264
','10005',NULL,'0');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10200','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10201','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10202','0','yyyymmddhh24miss','7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10203','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10204','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10205','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10206','0',NULL,'0',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10207','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10208','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10209','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10210','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10211','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10212','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10213','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10214','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10215','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10216','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10217','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10218','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10219','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10220','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10221','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10222','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10223','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10224','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10225','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10226','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10227','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10228','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10229','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10230','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10231','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10232','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10233','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10234','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10235','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10236','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10237','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10238','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10239','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10240','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10241','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10242','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10243','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10379','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10380','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10385','0',NULL,'0',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('10005','10122','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10390','10200');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10391','10201');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10392','10202');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10393','10204');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10394','10205');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10396','10207');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10397','10208');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10398','10209');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10399','10210');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10400','10211');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10401','10212');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10402','10213');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10403','10214');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10404','10215');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10405','10216');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10406','10217');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10407','10218');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10408','10219');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10409','10220');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10410','10221');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10411','10222');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10412','10223');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10413','10224');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10414','10225');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10415','10226');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10416','10227');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10417','10228');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10418','10229');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10419','10230');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10420','10231');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10421','10232');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10422','10233');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10423','10234');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10424','10235');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10425','10236');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10426','10237');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10427','10238');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10428','10239');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10429','10240');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10430','10241');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10432','10243');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10433','10206');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10504','10379');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10505','10380');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10509','10385');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10390','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10391','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10392','28');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10393','4');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10394','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10396','9');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10397','10');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10398','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10399','12');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10400','13');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10401','19');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10402','20');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10403','21');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10404','22');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10405','23');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10406','24');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10407','25');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10408','31');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10409','34');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10410','35');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10411','36');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10412','37');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10413','38');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10414','39');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10415','40');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10416','41');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10417','42');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10418','43');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10419','44');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10420','45');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10421','50');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10422','52');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10423','54');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10424','55');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10425','56');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10426','58');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10427','59');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10428','60');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10429','61');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10430','16');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10432','66');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10433','33');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10504','14');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10505','49');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10005','10509','68');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10125','10253','10260','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10125','10255','10378','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10129','10254','10139','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10129','10254','33','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10162','10261','10206','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10162','10262','10206','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10162','10274','10271','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10162','10274','10272','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10194','10254','10190','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10195','10254','10190','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','10200','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','10259','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','10201','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','10258','5','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10103','1','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10104','10253','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10104','2 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10104','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10105','10379','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10105','10264','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10105','10','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10106','10243','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10106','Y','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10106','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10107','10243','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10107','N','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10107','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10109','10205','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10109','1','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10109','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10110','10380','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10110','10264','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10110','10','3','1');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','5015','10130');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10202','10071');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10203','10072');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10204','10073');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10205','10084');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10207','10092');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10208','10093');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10209','10094');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10210','10095');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10211','10096');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10212','10097');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10213','10098');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10214','10099');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10215','10100');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10216','10101');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10217','10102');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10218','10103');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10219','10104');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10220','10105');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10221','10106');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10222','10107');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10223','10108');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10224','10109');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10225','10110');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10226','10111');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10227','10112');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10228','10113');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10229','10114');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10230','10115');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10231','10116');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10232','10117');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10233','10118');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10234','10119');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10235','10120');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10236','10121');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10237','10122');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10238','10123');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10239','10124');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10240','10125');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10241','10126');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10249','10078');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10250','10079');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10252','10082');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10253','10070');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10254','10075');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10255','10074');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10261','10076');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10262','10077');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10269','10086');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10274','10083');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10322','10089');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10123','10385','10134');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10106','10129');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10104','10162');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10110','10194');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10105','10195');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10125','1','10103');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10258','1','BSCS_STREAM','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10259','1','BSCS_MAP_REF','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10260','1','VALUE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10263','5','STARTING_IMSI','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10265','5','country_code','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10378','1','SERVICE_TYPE','0');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10125','0','1025');
COMMIT;
quit;
