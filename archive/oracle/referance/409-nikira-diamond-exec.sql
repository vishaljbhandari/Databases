delete from table_dfn    where tbd_id between 400 and 500;
delete from table_inst   where tbd_id between 400 and 500;
delete from table_column where tbd_id between 400 and 500;

--------------------------------------Entries For DUDUBAI_UNF_CONVERSION-----------------------------------------------


insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
    values(401,1,'DUDUBAI_UNF_CONVERSION','DUDUBAI_UNF_CONVERSION','N','N','N','N',1,1);
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
    values(401,401,1,'DUDUBAI_UNF_CONVERSION','DUDUBAI_UNF_CONVERSION','DUDUBAI_UNF_CONVERSION','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4001,401,'ID','ID',0,'Y','int',5,'Y','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4002,401,'DS_NAME','DS_NAME',1,'N','string',20,'N','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4003,401,'PREFIX_STRING','PREFIX_STRING',2,'N','string',20,'N','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4004,401,'REPLACE_STRING','REPLACE_STRING',3,'N','string',20,'N','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4005,401,'NUMBER_FORMAT','NUMBER_FORMAT',4,'N','string',20,'N','N',1,1);


------------------------------------------Entries For ACCOUNT Table-----------------------------------------------------------------


insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
    values(402,1,'ACCOUNT','ACCOUNT','N','N','N','N',1,1);
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
    values(402,402,1,'ACCOUNT','ACCOUNT','ACCOUNT','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4006,402,'GROUPS','GROUPS',0,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4007,402,'ACCOUNT_NAME','ACCOUNT_NAME',1,'Y','string',40,'Y','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4008,402,'ACCOUNT_TYPE','ACCOUNT_TYPE',2,'Y','int',20,'Y','N',1,1);

------------------------------------------Entries For SS7_OPC_DPC-------------------------------------------------------

insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
    values(403,1,'DUDUBAI_SS7_OPC_DPC','DUDUBAI_SS7_OPC_DPC','N','N','N','N',1,1);
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
    values(403,403,1,'DUDUBAI_SS7_OPC_DPC','DUDUBAI_SS7_OPC_DPC','DUDUBAI_SS7_OPC_DPC','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4009,403,'ID','ID',0,'Y','int',4,'Y','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4010,403,'POINT_CODE','POINT_CODE',1,'N','int',16,'Y','N',1,1);

----------------------------------------------Entries For Du_Dubai_Local_call_Check---------------------------------------

insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
    values(404,1,'DU_DUBAI_LOCAL_CALL_CHECK','DU_DUBAI_LOCAL_CALL_CHECK','N','N','N','N',1,1);
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
    values(404,404,1,'DU_DUBAI_LOCAL_CALL_CHECK','DU_DUBAI_LOCAL_CALL_CHECK','DU_DUBAI_LOCAL_CALL_CHECK','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4011,404,'ID','ID',0,'Y','int',5,'Y','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4012,404,'LOCAL_PREFIX','LOCAL_PREFIX',1,'N','STRING',20,'N','N',1,1);

----------------------------------------------Entries For Configurations---------------------------------------------

insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
    values(405,1,'CONFIGURATIONS','CONFIGURATIONS','N','N','N','N',1,1);
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
    values(405,405,1,'CONFIGURATIONS','CONFIGURATIONS','CONFIGURATIONS','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4013,405,'CONFIG_KEY','CONFIG_KEY',0,'Y','string',50,'Y','N',1,1);
insert into table_column (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
    values(4014,405,'VALUE','VALUE',1,'N','string',500,'Y','N',1,1);




commit;
quit;


