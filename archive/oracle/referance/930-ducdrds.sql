SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=5002 AND name='ducdrds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('5002','ducdrds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5001','0','DU Cdr Ds Start','40','60','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5002','4','DU_Cdr_Ds_LFT','120','120','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5003','2','DU Cdr Ds Translator','240','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5004','3','Du CDR DS End','2720','120','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5013','8','Du_RecordType_OrderedLookUp to populate Record_Type','440','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5015','5','Is_Supplementary_check','560','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5016','5','Is_call_Forward','840','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5018','5','Is_Incomming_Call_Check','920','360','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5019','11','Assigning  Caller Number to Called Number','1000','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5020','11','Assigning Temp _Called Number to Called number','1120','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5021','5','Is_SMS_CDR','1320','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5027','5','Is_Call_Conference','1480','240','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('5029','5','Is_First_Leg_Call','1920','300','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10005','5','Is_Last_Leg_Call','2160','360','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10009','5','Is_Partial_Indicator_Null1','1800','240','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10156','5','Is_Prepaid_CDR','1640','240','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10157','5','Is_Intermediate_Record','320','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10158','5','Is_Roaming_Call_Forward','1000','60','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10203','5','Is_3G_Call_Check','640','180','1','5002');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10204','11','Concate_3G_Call','720','120','1','5002');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5001','5002','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5002','5003','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5003','10157','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5013','5015','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5015','10203','5002','1','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5016','5018','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5016','10158','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5018','5019','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5018','5021','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5019','5020','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5020','5021','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5021','5004','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5021','5027','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5027','10156','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5027','10156','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5029','5004','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('5029','10005','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10005','5004','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10005','5004','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10009','5004','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10009','5029','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10156','5004','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10156','10009','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10157','5013','5002','1','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10158','5021','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10158','5021','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10203','5016','5002','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10203','10204','5002','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10204','5016','5002','0','1');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','localdirectory','$RANGERHOME/RangerData/DataSourceCDRData_Load');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5002','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5003','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5003','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5003','samplefile','C:\Documents and Settings\admin\Desktop\Sample_voice_roamer_SMS.txt');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5003','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5004','directory','$RANGERHOME/RangerData/DataSourceRaterCDRData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5004','fieldseparator',',');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5004','output_group_id','5001');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5004','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('5004','touchfileinsuccessdir','true');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('5003','|1|MSCC|971550040326|1|1|424030000000954|60|971550930010|1|971550040325|1|1|0550040325|1|0|||||||0|0|174932274|1|H|20060723152234|14400|GSMT11B*****S**I|I||||1|4240301C39A8A|51|S|0|6||||||0|N||||35836100154270|||||||||||||1|2|4|3|1|2||4240301C39A8A|1|C|N|
|1|MSCC|971550040326|1|1|424030000000954|60|971550930010|1|971550040325|1|1|0550040325|1|0|||||||0|0|174932274|5|H|20060723152234|14400|GSMT**B*****S43I|I||||1|4240301C39A8A|51|S|0|6||||||0|N||||35836100154270|||||||||||||1|2|4|3|1|2||4240301C39A8A|1|C|N|
|1|MSC|971550040326|1|1|424030000000954|60|971550930010|1|97143690171|1|1|043690171|1|0|||||||0|0|166084920|1|H|20060723155235|14400|GSMT11B*****S**I|I||||1|4240301C39A8A|51|S|0|1||||||0|N|0|||35836100154270|||||||||||||1|2|4|3|1|2||4240301C39A8A|1|C|N|
|1|MSC|971550040326|1|1|424030000000954|60|971550930010|1|97143690171|1|1|043690171|1|0|||||||0|0|183779636|1|H|20060723155248|14400|GSMT11B*****S**I|I||||1|4240301C39A8A|51|S|0|48||||||0|N|0|||35836100154270|||||||||||||1|2|4|3|1|2||4240301C39A8A|1|C|N|
|6|MSCC|971550043175|1|1|424030000000576|60|971550930010|1|97143693802|1|1|043693802|1|0|||||||0|0|176111926|1|H|20060723151639|14400|GSMT11B*****S**I|I||||1|4240301914E55|51|S|0|48||||||0|N|0|||35331300803965|||||||||||||1|2|4|3|1|2||4240301914E55|1|C|N|
|6|MSCC|971550043175|1|1|424030000000576|60|971550930010|1|97143693802|1|1|043693802|1|0|||||||0|0|176111926|5|H|20060723151701|14400|GSMT**B*****S41I|I||||1|4240301914E55|51|S|0|48||||||0|N|0|||35331300803965|||||||||||||1|2|4|3|1|2||4240301914E55|1|C|N|
|6|MSCC|971550043175|1|1|424030000000576|60|971550930010|1|97143693802|1|1|043693802|1|0|||||||0|0|176111926|5|H|20060723151711|14400|GSMT**B*****S42I|I||||1|4240301914E55|51|S|0|48||||||0|N|0|||35331300803965|||||||||||||1|2|4|3|1|2||4240301914E55|1|C|N|
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5001','I_sBSCS_Mapping_Ref',NULL,'1','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5002','I_sBSCS_Stream',NULL,'2','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5003','I_sCaller_Number',NULL,'3','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5004','I_sCalled_Number',NULL,'4','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5005','I_sForwarded_Number',NULL,'5','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5006','I_iDuration',NULL,'6','1','5002','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5007','I_dTimeStamp',NULL,'7','4','5002','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5008','I_sEquipment_Id',NULL,'8','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5009','I_sIMSI_Number',NULL,'9','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5010','I_sGeographic_Position',NULL,'10','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5011','I_sIS_Complete',NULL,'11','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5012','I_sCall_Conference_Indicator',NULL,'12','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5013','I_sPrepaid_Indicator',NULL,'13','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5016','it_Record_type',NULL,'14','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5017','it_Service_type',NULL,'15','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5018','st_Inroamer_Indicator',NULL,'16','3','5002','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5019','iT_value',NULL,'17','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5020','sT_BSCS_Stream',NULL,'18','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5021','sT_BSCS_Map_ref',NULL,'19','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5023','iT_Service_ty',NULL,'20','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5024','sT_Inroamer_Index',NULL,'21','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5026','iT_Nework_Id',NULL,'23','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5027','iT_Local_Number',NULL,'24','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5028','CustomOperandAddModifyDialog.cmbStartIndex_ConfigVal_1',NULL,'25','1','5002','6','1','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5029','CustomOperandAddModifyDialog.cmbSubstringLength_ConfigVal_1',NULL,'25','1','5002','6','7','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5032','st_SwapTemp_PhoneNum',NULL,'27','3','5002','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5039','st_Temp_Swap_Called_Number',NULL,'34','3','5002','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5041','it_CDR_Type',NULL,'35','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5042','it_Subscriber_Id',NULL,'36','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5048','it_Is_Complete',NULL,'37','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5052','sT_Roamer_IMSI_Prefix',NULL,'38','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5056','it_Service',NULL,'40','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5057','sT_Ph_Number_Prefix',NULL,'41','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5059','iT_Record_Type_for_Service',NULL,'42','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5060','iT_Call_Type_for_Service',NULL,'43','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5061','iT_Service_Type_for_Service',NULL,'44','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('5062','iT_Service_Value',NULL,'45','1','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10126','it_Isconference',NULL,'50','1','5002','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10296','I_sRCF_Forwarded_Number',NULL,'54','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10297','st_Forward_Number',NULL,'55','3','5002','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10374','sT_Type_of_Call',NULL,'56','3','5002','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10375','st_Typeof_Call',NULL,'57','3','5002','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10383','I_sCorelation_Field',NULL,'58','3','5002','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10386','I_rIN_Charge',NULL,'59','2','5002','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10390','I_s3G_Check',NULL,'60','3','5002','1',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5003','Is_Record_Type_check',NULL,' I_sBSCS_Mapping_Ref  ==  sT_BSCS_Map_ref  &&  I_sBSCS_Stream  ==  sT_BSCS_Stream ','
2^5001
1^8
2^5021
1^1
2^5002
1^8
2^5020
','5002','1','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5006','Is_Supplementary_Record',NULL,' it_Record_type  <  0  ','
2^5016
1^5
4^0
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5007','Is_Forwarded_Call',NULL,' it_Record_type  ==  3  ','
2^5016
1^8
4^3
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5009','Is_Incomming_Call_Check',NULL,' it_Record_type  ==  2  ','
2^5016
1^8
4^2
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5010','Assigning  Caller Number to Called Number',NULL,' I_sCaller_Number ','
2^5003
','5002',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5011','Assigning Temp _Called Number to Called number',NULL,' st_Temp_Swap_Called_Number ','
2^5039
','5002',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5012','IS_SMS_CDR',NULL,' st_Inroamer_Indicator  ==  Y ','
2^5018
1^8
6^Y
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5013','IsHomer',NULL,' I_sIMSI_Number  BW  s_DU_IMSI_PREFIX ','
2^5009
1^10
2^5040
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5014','Is_Pre_Paid_Check',NULL,' I_sPrepaid_Indicator  ==  Y ','
2^5013
1^8
6^Y
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5015','Is_Post_Paid_Check',NULL,' I_sPrepaid_Indicator  ==  N ','
2^5013
1^8
6^N
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('5017','Is_Call_Conference_Check',NULL,' I_sCall_Conference_Indicator  ==  Y ','
2^5012
1^8
6^Y
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10003','Is_Partial_CDRCheck1',NULL,' I_sIS_Complete  ==  N ','
2^5011
1^8
6^N
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10095','Is_outgoing_record',NULL,' it_Record_type  ==  1  ','
2^5016
1^8
4^1
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10126','Is_Partial_Indicator_Null',NULL,' I_sIS_Complete  ==  sNULL ','
2^5011
1^8
2^5015
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10127','Is_First_Leg_Call',NULL,' I_sIS_Complete  ==  sFIRST_LEG ','
2^5011
1^8
2^10286
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10128','Is_Last_Leg_Call',NULL,' I_sIS_Complete  ==  sLAST_LEG ','
2^5011
1^8
2^10289
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10133','Is_Roaming_Call_Forward',NULL,' st_Typeof_Call  ==  RCF ','
2^10375
1^8
6^RCF
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10156','Is_3G_Call',NULL,' I_s3G_Check  ==  sIS_3G  &&  it_Service_type  ==  1  ','
2^10390
1^8
2^10391
1^1
2^5017
1^8
4^1 
','5002',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10157','Concate_3G_Call',NULL,' s3G_CALL  ||  st_Typeof_Call ','
2^10392
1^100
2^10375
','5002',NULL,'1');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5001','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5002','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5003','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5004','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5005','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5006','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5007','0','yyyymmddhh24miss','7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5008','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5009','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5010','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5011','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5012','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('5013','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10296','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10383','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10386','0',NULL,'0',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10390','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('5001','5003','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5001','5001');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5002','5002');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5003','5003');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5004','5009');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5005','5004');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5006','5007');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5007','5010');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5008','5006');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5009','5013');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5010','5008');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5011','5011');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5012','5012');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('5013','5005');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10438','10296');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10507','10383');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10510','10386');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10513','10390');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5001','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5002','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5003','4');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5004','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5005','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5006','28');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5007','36');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5008','40');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5009','47');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5010','51');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5011','73');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5012','74');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','5013','75');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','10438','17');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','10507','25');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','10510','49');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('5001','10513','70');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5013','5016','5019','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5013','5017','5023','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5013','5018','5024','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5013','10375','10374','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5018','5039','5004','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5021','5006','50','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5021','5041','5045','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5021','5042','5046','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5021','5048','5047','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5027','10126','10127','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('5029','5048','5053','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10005','5048','10290','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10005','5048','5054','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10009','5048','5054','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10156','5041','10139','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10156','5041','33','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10156','5048','5054','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10158','10297','10296','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10158','10297','5005','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','5001','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','5021','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','5002','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','5020','5','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5003','1','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5006','5016','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5006','0 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5006','5','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5007','5016','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5007','3 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5007','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5009','5016','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5009','2 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5009','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5010','5003','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5011','5039','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5012','5018','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5012','Y','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5012','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5013','5009','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5013','5040','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5013','10','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5014','5013','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5014','Y','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5014','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5015','5013','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5015','N','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5015','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5017','5012','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5017','Y','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('5017','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10003','5011','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10003','N','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10003','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10095','5016','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10095','1 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10095','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10126','5011','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10126','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10126','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10127','5011','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10127','10286','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10127','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10128','5011','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10128','10289','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10128','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10133','10375','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10133','RCF','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10133','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','10390','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','10391','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','5017','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','1 ','5','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10156','1','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10157','10392','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10157','10375','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10157','100','3','1');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('5010','5019','5004');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('5011','5020','5003');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('10157','10204','10375');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','36','5017');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','65','5020');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5003','5003');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5004','5004');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5006','5007');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5007','5008');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5008','5009');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5009','5010');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5010','5011');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5016','5006');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5017','5016');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5041','5015');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5042','5013');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','5048','5018');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','10126','10058');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','10297','5005');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','10375','10063');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','10383','5019');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('5004','10386','10136');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5006','5015');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5007','5016');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5009','5018');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5012','5021');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5017','5027');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10127','5029');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10128','10005');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10126','10009');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('5014','10156');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10003','10157');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10133','10158');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10156','10203');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('5013','1','5003');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5019','1','VALUE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5020','1','BSCS_STREAM','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5021','1','BSCS_MAP_REF','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5023','1','SERVICE_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5024','1','INROAMER_INDICATOR','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5026','3','NETWORK_ID','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5027','3','LOCAL_NUMBER','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5052','5','STARTING_IMSI','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5057','6','ph_number_prefix','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5059','2','RECORD_TYPE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5060','2','CALL_TYPE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5061','2','service_type','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('5062','2','service','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10374','1','TYPE_OF_CALL','0');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5003','4','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5004','3','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5013','0','1025');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5015','1','5001');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5019','5','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('5020','5','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10157','1','7038');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('5003','5004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('5013','5004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('5015','5004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('5019','5004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('5020','5004');
COMMIT;
quit;
