SET FEEDBACK OFF
SET DEFINE OFF ;
DELETE FROM rip_datasource_info WHERE id=10001 AND name='dusubscriberds' ;
COMMIT; 
SET DEFINE OFF ;
INSERT INTO rip_datasource_info(id,name,description,status,processid,versionid,globalversionid,isvdftmode) 
 VALUES('10001','dusubscriberds',NULL,'1','0','0','0','0');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10001','0','Du_Subscriber_Start','40','60','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10002','2','Du_Subscriber_Translator','200','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10003','4','Du_Subscriber_LFT','120','120','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10004','3','Du_Subscriber_End','2480','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10011','8','Du Look up for populating Group_name','1200','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10014','12','Du Lookup for Fetching DateOf Activation from Account Table','1640','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10018','8','Du ordered look up for populating rate plan','1400','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10019','8','Lookup To Populate Du_Subscriber_ Service','720','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10023','8','Lookup To Fetch Status','600','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10025','5','Is Date Of Activation Null Check','1800','60','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10026','5','Is Date Of Activation Greater Check','1800','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10027','5','Is Date Of Activation Null Check 1','1800','360','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10039','6','Du_ LPM for Phone_number Conversion','1000','60','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10040','5','Is Phone Number UNF Converted','920','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10041','5','Is IMSI Homer','400','300','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10043','5','Is Rate Plan Null','1320','60','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10044','5','Is Short Code More Than 14','2000','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10069','11','Assignment of DummyRatePlan Description','1520','240','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10146','5','Is_DOB_Null','2120','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10147','5','Is End_Service_Date Null','2240','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10150','8','Look up to Populate Connection Type','480','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10151','5','Is_Group_Name_Null','1120','120','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10155','11','Calculating Expiry Date','2360','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10206','5','Is_IMSI_Null','320','180','1','10001');
INSERT INTO rip_node_instance_info(node_config_id,node_type,name,xpos,ypos,is_configured,data_stream_id) 
 VALUES('10208','5','Is_GSM','800','240','1','10001');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10001','10003','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10002','10206','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10003','10002','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10011','10043','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10011','10043','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10014','10025','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10014','10027','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10018','10014','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10018','10069','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10019','10040','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10019','10208','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10023','10019','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10025','10026','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10025','10044','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10026','10044','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10026','10044','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10027','10044','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10027','10044','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10039','10151','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10039','10151','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10040','10039','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10040','10151','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10041','10150','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10043','10014','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10043','10018','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10044','10146','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10044','10146','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10069','10014','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10069','10014','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10146','10147','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10146','10147','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10147','10155','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10147','10155','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10150','10023','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10151','10011','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10151','10043','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10155','10004','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10206','10041','10001','1','2');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10206','10150','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10208','10040','10001','0','1');
INSERT INTO rip_node_link_info(source_node,destination_node,data_stream_id,linktype,sequence) 
 VALUES('10208','10040','10001','1','2');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10002','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10002','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10002','samplefile','C:\WINNT40\Profiles\lekhaa\Desktop\subscribersample.txt');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10002','textqualifier',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','fileignoremask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','fileselectionmask',NULL);
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','localdirectory','$RANGERHOME/RangerData/DataSourceSubscriberData');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','orderby','time');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','pickfromsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','preprocessshell','$RANGERHOME/bin/duremovezerobytefile.sh');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10003','retainsourcefile','false');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10004','directory','$RANGER7HOME/RangerData/5_4_DS_DATA/Subscriber/Process');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10004','fieldseparator','|');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10004','output_group_id','10001');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10004','recordseparator','
');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10004','touchfileinsuccessdir','true');
INSERT INTO rip_ds_comp_config(id,name,value) 
 VALUES('10014','sql_query','select to_char(ACCOUNT_DOA,''DD/MM/YYYY hh24:mi:ss'') into ${10090} from account where account_name=${10001}');
INSERT INTO rip_sample_file_data(node_config_id,file_data) 
 VALUES('10002','|806|Qusai||Abu Hijleh|Dubai|||Dubai|||||||C1|10||01/05/2006|+971552000100|s|424030000000101|||10|GSM|03/03/2000||23/05/2006|1200|223|9874566||||||||||||^M
|941|NAGABUSHAN||GUNTUPALLI|Dubai|||Dubai|||||||C3|13||05/06/2006|+971552000077|d|424030000000078|||8|GSM|25/04/1976||02/07/2006|1200|223|123456||||||||||||^M
|944|SIT||Kalyan1|Dubai|||Dubai|||||||C1|11||05/06/2006|+971552000081|d|424030000000081|||20|GSM|||02/07/2006|1000|223|||||||||||||^M
|1004|SIT-05062006||BUSHAN|Dubai|||Dubai|||||||C3|10||05/06/2006|+971550043350|a|424030000000750|||10|GSM|12/03/1969||05/06/2006|1200|223|1234567||||||||||||^M
|1034|Riyad||Al-Masri|Dubai|||Dubai|||||||C1|10||06/06/2006|+971550043360|a|424030000000136|||10|GSM|01/01/1980||06/06/2006|1200|223|1111111111111111||||||||||||^M
|1035|RIYAD||AL-MASRI|Dubai|||Dubai|||||||C1|11||06/06/2006|+971550043362|a|424030000000137|||10|GSM|01/01/2000||06/06/2006|1200|223|5555555555||||||||||||^M
|1038|Sandeep Du||Pamidimarri Du|SIT03 567567|Dubai|Mr.|Dubai|||||||C3|12||06/06/2006|+971550043354|a|424030000000754|||10|GSM|||06/06/2006|1200|223|||||||||||||^M
|1070|RIYAD||AL-MASRI|Dubai|||Dubai|||||||C3|11||07/06/2006|+971550043355|a|424030000000144|||8|GSM|01/01/2000||07/06/2006|1200|223|505050||||||||||||^M
|1306|sahil||Khan|Dubai|||Dubai|||||||C3|13||13/07/2006|+971550043155|a|424030000000554|||10|GSM|||13/07/2006|900|99|A55543||||||||||||^M
|1307|raju||rangarajan|Sharjah|||Sharjah|||||||C3|40||13/07/2006|+971550043153|a|424030000000556|||10|GSM|07/08/1982||13/07/2006|800|99|E2468||||||||||||^M
|1308|John||Cool|Dubai|||Dubai|||||||C3|10||13/07/2006|+971550043156|a|424030000000557|||10|GSM|||13/07/2006|1200|223|7258||||||||||||^M
|1309|MOHAMMAD||Huzi|Dubai|||Dubai||50502020||50502020|50502020||C3|10||13/07/2006|+971550043182|d|424030000000559|||10|GSM|||03/08/2006|900|223|P12345||||||||||||^M
|1310|Hamda||Mohamad|Sharjah|||Sharjah|||||||C3|13||13/07/2006|+971550043183|a|424030000000558|||8|GSM|||13/07/2006|1100|223|U6354||||||||||||^M
|1311|Sid||Mazumder|Sharjah|||Sharjah|||||||C3|40||13/07/2006|+971550043160|a|424030000000555|||8|GSM|||13/07/2006|1300|223|U3692||||||||||||^M
');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10001','I_sAccount_Id',NULL,'1','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10002','I_sFirst_Name',NULL,'2','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10003','I_sMiddle_Name',NULL,'3','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10004','I_sLast_Name',NULL,'4','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10005','I_sAddress_Line1',NULL,'5','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10006','I_sAddress_Line2',NULL,'6','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10007','I_sAddress_Line3',NULL,'7','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10008','I_sCity','     ','8','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10009','I_sPost_Code',NULL,'9','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10010','I_sHome_Phone_Number',NULL,'10','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10011','I_sOffice_Phone_Number',NULL,'11','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10012','I_sContact_Phone_NUmber',NULL,'12','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10013','I_sMCN1',NULL,'13','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10014','I_sMCN2',NULL,'14','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10015','I_sGroup_Name',NULL,'15','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10016','I_iBill_Cycle',NULL,'16','1','10001','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10017','I_dCredit_Expiry_Date',NULL,'17','4','10001','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10018','I_dDate_Of_Activation',NULL,'18','4','10001','1','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10019','I_sPhone_Number',NULL,'19','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10020','I_sStatus',NULL,'20','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10021','I_sIMSI',NULL,'21','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10022','I_sEquipment_Id',NULL,'22','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10024','I_sRate_Plan',NULL,'24','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10025','I_sSubscription_Type',NULL,'25','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10027','I_sCredit_Class',NULL,'27','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10030','I_sNationality',NULL,'30','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10031','I_sPassport_Number',NULL,'31','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10032','I_sCompany_Registration_Number',NULL,'32','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10033','I_rOptional_Field8',NULL,'33','2','10001','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10034','I_rOptional_Field9',NULL,'34','2','10001','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10035','I_rOptional_Field10',NULL,'35','2','10001','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10036','I_rOptional_Field7',NULL,'36','2','10001','1','0.0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10037','I_sOptional_Field6',NULL,'37','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10038','I_sOptional_Field5',NULL,'38','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10039','I_sPayment_CustomID',NULL,'39','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10040','I_sFirstName_Subscriber',NULL,'40','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10041','I_sCompany_Name',NULL,'41','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10042','I_sCo_Id',NULL,'42','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10058','sT_Code',NULL,'43','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10059','sT_Description',NULL,'44','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10060','sT_Short_Code',NULL,'45','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10061','t_sDescription',NULL,'46','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10062','t_sShort_Code',NULL,'47','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10063','t_sGroup_Name',NULL,'48','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10072','I_sEnd_Service_Date',NULL,'49','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10073','I_sDate_Of_Birth',NULL,'50','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10074','T_sRateplan_code',NULL,'51','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10075','T_sRateplan',NULL,'52','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10076','t_sRatePlan_ID',NULL,'53','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10077','t_sRateplan_Description',NULL,'54','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10079','T_iService_Value',NULL,'56','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10080','t_iServicevalue',NULL,'57','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10085','I_sServices',NULL,'58','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10086','T_sService_Input',NULL,'59','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10090','t_sDate_O_Activation',NULL,'61','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10092','I_sDateofActivation',NULL,'63','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10093','T_sStatus_input',NULL,'64','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10094','T_iStatus_Value',NULL,'65','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10095','t_iStatus',NULL,'66','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10097','I_sCreditLimit',NULL,'68','3','10001','1','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10098','t_dSubscriberDOA',NULL,'69','4','10001','4','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10104','t_dAccountDOA',NULL,'71','4','10001','4','01/01/1970 00:00:00','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10106','c_dAccountActivationDate',NULL,'72','4','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10118','CustomOperandAddModifyDialog.cmbStartIndex_ConfigVal_1',NULL,'74','1','10001','6','1','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10119','CustomOperandAddModifyDialog.cmbSubstringLength_ConfigVal_1',NULL,'74','1','10001','6','14','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10120','c_sGroup_Name',NULL,'74','3','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10121','c_iShort_Code_Length',NULL,'75','1','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10122','t_sGroup_Short_Code',NULL,'76','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10141','T_iProduct_type',NULL,'77','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10142','t_iProductType',NULL,'78','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10143','t_iProducttypefromtable',NULL,'79','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10144','t_istatusfromTable',NULL,'80','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10147','T_iProductType_ratePlan',NULL,'81','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10276','c_sSYS_Date',NULL,'82','3','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10277','t_sDOB',NULL,'83','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10279','t_sEnd_Service_Date',NULL,'84','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10281','I_sCredit_Exp_Date',NULL,'85','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10283','T_sInput',NULL,'86','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10284','T_iValue',NULL,'87','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10285','t_iConnection_Type',NULL,'88','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10293','t_iFinalExpiryDate_Seconds',NULL,'90','1','10001','4','0','0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10295','c_dExpiry_Date',NULL,'91','4','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10300','c_iInitial_Expirty_Date',NULL,'92','1','10001','2',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10302','I_sSubscriber_Bill_Cycle',NULL,'93','3','10001','1',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10395','t_sSubscription_Type',NULL,'94','3','10001','4',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10396','T_sSubscription',NULL,'95','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10404','iT_CS_Input',NULL,'96','3','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10405','iT_CS_Service_Value',NULL,'97','1','10001','3',NULL,'0');
INSERT INTO rip_operand(id,name,description,position,data_type,source,operand_type,value,globalversionid) 
 VALUES('10407','I_sMain_Dir_Flag',NULL,'98','3','10001','1',NULL,'0');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10106','10090','4');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10120','10062','2');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10121','10062','1');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10276','65005','22');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10295','10293','21');
INSERT INTO rip_custom_operand_function(custom_operand_id,base_operand_id,function_type) 
 VALUES('10300','10098','23');
INSERT INTO rip_function_substring(custom_operand_id,start_index,length,matchtype) 
 VALUES('10120','10118','10119','1');
INSERT INTO rip_function_datetostring(custom_operand_id,dateformat) 
 VALUES('10276','dd/mm/yyyy');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10005','Is_Group_Name_Check',NULL,' I_sGroup_Name  ==  sT_Code ','
2^10015
1^8
2^10058
','10001','10','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10008','Is Date of birth Null',NULL,' I_sDate_Of_Birth  ==  sNULL ','
2^10073
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10009','Is Rate Plan Check',NULL,' I_sRate_Plan  ==  T_sRateplan_code ','
2^10024
1^8
2^10074
','10001','11','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10010','Is_Du_Subscriber_Service Check',NULL,' I_sServices  ==  T_sService_Input ','
2^10085
1^8
2^10086
','10001','12','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10013','Is Date of Activation Null Check',NULL,' I_sDateofActivation  ==  sNULL ','
2^10092
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10015','Is Status_Check',NULL,' I_sStatus  ==  T_sStatus_input ','
2^10020
1^8
2^10093
','10001','13','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10017','Is Date Of Activation Greater Check',NULL,' I_dDate_Of_Activation  >  c_dAccountActivationDate ','
2^10018
1^4
2^10106
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10027','Is Phone Number UNF Converted',NULL,' I_sPhone_Number  NBW  + ','
2^10019
1^11
6^+
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10041','Is IMSI Homer Check',NULL,' I_sIMSI  BW  42403 ','
2^10021
1^10
6^42403
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10043','Is Rate Plan Null Check',NULL,' I_sRate_Plan  ==  sNULL ','
2^10024
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10044','Is Short Code More Than 14 Check',NULL,' c_iShort_Code_Length  >  14  ','
2^10121
1^4
4^14
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10061','Is_status_disconnected',NULL,' t_istatusfromTable  ==  iSUBSCRIBER_DISCONNECTED ','
2^10144
1^8
2^10145
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10064','Assignment of DummyRatePlan Description',NULL,' sTDUMMYRATEPLANDESCRIPTION  ||  I_sRate_Plan ','
2^10149
1^100
2^10024
','10001',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10116','Is_DOB_Null',NULL,' I_sDate_Of_Birth  ==  sNULL ','
2^10073
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10117','Is End_Service_Date_Null',NULL,' I_sEnd_Service_Date  ==  sNULL ','
2^10072
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10118','Is_Prepaid_Subscriber',NULL,' t_iProductType  ==  2  ','
2^10142
1^8
4^2
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10119','Is_Credit_Expiry_Date_Null',NULL,' I_sCredit_Exp_Date  ==  sNULL ','
2^10281
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10120','Is Connectiontype_fetch',NULL,' I_sSubscription_Type  ==  T_sConnection_Input ','
2^10025
1^8
2^10283
','10001','16','0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10121','Is_Group_Name_Null',NULL,' I_sGroup_Name  ==  sNULL ','
2^10015
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10132','Calculating Expiry Date',NULL,' c_iInitial_Expirty_Date  +  iSECONDS_PER_YEAR ','
2^10300
1^100
2^10294
','10001',NULL,'1');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10137','Is_Product_Type_Matches',NULL,' t_iProductType  ==  t_iProducttypefromtable  ||  t_iProducttypefromtable  ==  0  ','
2^10142
1^8
2^10143
1^2
2^10143
1^8
4^0
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10159','Is IMSI_Null_Check',NULL,' I_sIMSI  ==  sNULL ','
2^10021
1^8
2^5015
','10001',NULL,'0');
INSERT INTO rip_rule(id,name,description,expression,notation,source,table_id,is_rule) 
 VALUES('10161','Is_GSM_Check',NULL,' t_iConnection_Type  ==  1  ','
2^10285
1^8
4^1
','10001',NULL,'0');
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10001','40',NULL,'15',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10002','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10003','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10004','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10005','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10006','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10007','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10008','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10009','20',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10010','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10011','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10012','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10013','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10014','40',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10015','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10016','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10017','0','dd/mm/yyyy','6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10018','0','dd/mm/yyyy','6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10019','40',NULL,'15',NULL,NULL,'^[+]?[0-9]*$',NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10020','0',NULL,'7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10021','20',NULL,'14',NULL,NULL,'^[0-9]*$',NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10022','20',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10024','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10025','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10027','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10030','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10031','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10032','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10033','0',NULL,'6',NULL,'999999999999.999999',NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10034','0',NULL,'6',NULL,'999999999999.999999',NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10035','0',NULL,'6',NULL,'999999999999.999999',NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10036','0',NULL,'6',NULL,'999999999999.999999',NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10037','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10038','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10039','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10040','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10041','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10042','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10072','256',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10073','256',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10085','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10092','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10097','10',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10281','0',NULL,'6',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10302','256',NULL,'14',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_operand_validation(operand_id,field_size,input_field_format,field_flag,min_limit,max_limit,field_pattern,rule_id,decoder_id) 
 VALUES('10407','0',NULL,'0',NULL,NULL,NULL,NULL,NULL);
INSERT INTO rip_parser_info(parser_id,node_id,parser_type) 
 VALUES('10001','10002','1');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10049','10001');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10050','10002');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10051','10003');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10052','10004');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10053','10005');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10054','10006');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10055','10007');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10056','10008');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10057','10009');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10058','10010');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10059','10011');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10060','10012');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10061','10013');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10062','10014');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10063','10015');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10066','10018');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10067','10019');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10068','10020');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10069','10021');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10070','10022');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10072','10024');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10073','10025');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10075','10027');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10077','10097');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10078','10030');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10079','10031');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10080','10032');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10146','10072');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10147','10073');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10148','10042');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10149','10041');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10150','10040');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10151','10039');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10152','10038');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10153','10037');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10154','10036');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10155','10033');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10156','10034');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10157','10035');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10159','10085');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10160','10092');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10440','10302');
INSERT INTO rip_inputfield_operand_map(field_id,operand_id) 
 VALUES('10515','10407');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10049','2');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10050','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10051','4');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10052','5');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10053','6');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10054','7');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10055','8');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10056','9');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10057','10');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10058','11');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10059','12');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10060','13');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10061','14');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10062','15');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10063','16');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10066','19');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10067','20');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10068','21');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10069','22');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10070','23');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10072','25');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10073','26');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10075','28');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10077','30');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10078','31');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10079','32');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10080','33');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10146','29');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10147','27');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10148','34');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10149','35');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10150','3');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10151','36');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10152','38');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10153','39');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10154','40');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10155','41');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10156','42');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10157','43');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10159','24');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10160','19');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10440','17');
INSERT INTO rip_ascii_parser_config_info(parser_id,field_id,input_position) 
 VALUES('10001','10515','44');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10011','10062','10060','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10011','10062','10015','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10018','10076','10024','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10018','10076','10024','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10018','10077','10075','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10018','10142','10147','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10018','10142','10137','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10019','10080','10079','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10023','10095','10094','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10025','10098','65005','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10025','10098','10018','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10025','10104','10106','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10026','10104','10106','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10026','10104','10018','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10027','10098','65005','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10027','10098','10018','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10027','10104','65005','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10027','10104','10018','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10043','10076','10116','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10043','10077','10116','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10043','10142','10137','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10044','10122','10120','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10044','10122','10062','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10146','10277','10276','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10146','10277','10073','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10147','10279','10276','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10147','10279','10072','1');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10150','10285','10284','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10150','10395','10396','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10151','10062','10116','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10208','10080','10082','0');
INSERT INTO rip_lk_assignment(node_id,lhs_field,rhs_field,path_status) 
 VALUES('10208','10080','10394','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10005','10015','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10005','10058','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10005','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10008','10073','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10008','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10008','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10009','10024','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10009','10074','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10009','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10010','10085','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10010','10086','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10010','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10013','10092','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10013','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10013','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10015','10020','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10015','10093','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10015','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10017','10018','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10017','10106','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10017','4','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10027','10019','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10027','+','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10027','11','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10041','10021','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10041','42403','2','6');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10041','10','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10043','10024','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10043','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10043','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10044','10121','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10044','14 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10044','4','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10061','10144','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10061','10145','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10061','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10064','10149','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10064','10024','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10064','100','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10116','10073','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10116','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10116','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10117','10072','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10117','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10117','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10118','10142','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10118','2 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10118','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10119','10281','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10119','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10119','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10120','10025','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10120','10283','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10120','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10121','10015','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10121','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10121','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10132','10300','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10132','10294','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10132','100','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','10142','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','10143','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','10143','4','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','0 ','5','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','8','6','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10137','2','7','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10159','10021','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10159','5015','2','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10159','8','3','1');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10161','10285','1','2');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10161','1 ','2','4');
INSERT INTO rip_rule_tokens(rule_id,token,sequence,token_type) 
 VALUES('10161','8','3','1');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('10064','10069','10077');
INSERT INTO rip_expression(expression_id,node_id,lhs_operand) 
 VALUES('10132','10155','10293');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','29','10003');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','5050','10032');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10001','10001');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10002','10004');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10003','10005');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10004','10006');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10005','10007');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10006','10008');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10007','10009');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10008','10010');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10009','10011');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10010','10015');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10011','10016');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10012','10017');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10013','10018');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10014','10019');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10019','10013');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10021','10020');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10022','10021');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10027','10037');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10030','10039');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10031','10040');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10032','10041');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10033','10049');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10034','10050');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10035','10051');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10036','10048');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10037','10047');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10038','10046');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10039','10045');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10040','10044');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10041','10043');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10042','10042');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10076','10054');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10077','10033');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10080','10024');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10095','10027');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10097','10012');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10098','10014');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10104','10002');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10122','10023');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10142','10026');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10277','10035');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10278','10025');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10278','10031');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10279','10038');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10280','10066');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10285','10022');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10295','10028');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10302','10034');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10395','10036');
INSERT INTO rip_operand_output_mapping(node_id,operand_id,output_field_id) 
 VALUES('10004','10407','10139');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10013','10025');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10017','10026');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10013','10027');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10027','10040');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10041','10041');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10043','10043');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10044','10044');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10116','10146');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10117','10147');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10121','10151');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10159','10206');
INSERT INTO rip_br_rule(rule_id,node_id) 
 VALUES('10161','10208');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10011','10','10005');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10018','11','10009');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10019','12','10010');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10023','13','10015');
INSERT INTO rip_lk_data(node_id,table_id,rule_id) 
 VALUES('10150','16','10120');
INSERT INTO rip_lpm(node_id,operand_id,group_id) 
 VALUES('10039','10019','7003');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10058','10','CODE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10059','10','DESCRIPTION','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10060','10','SHORT_CODE ','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10074','11','code','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10075','11','rateplan','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10079','12','SERVICE_VALUE','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10086','12','SERVICE_INPUT','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10093','13','status_input','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10094','13','status_value','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10147','11','product_type','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10283','16','INPUT','0');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10284','16','VALUE','1');
INSERT INTO rip_lk_operand_mapping(operand_id,table_id,column_name,is_sequence_field) 
 VALUES('10396','16','SUBSCRIPTION_TYPE','0');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10002','4','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10004','3','1');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10023','0','7004');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10041','0','7024');
INSERT INTO rip_rec_term_point_info(term_component_id,termination_type,reason_id) 
 VALUES('10150','1','7037');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('10002','10004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('10023','10004');
INSERT INTO rip_rec_term_end_map(term_component_id,end_component_id) 
 VALUES('10041','10004');
INSERT INTO rip_function_string_to_date(custom_operand_id,date_format)
 VALUES('10106','dd/mm/yyyy hh24:mi:ss');
COMMIT;
