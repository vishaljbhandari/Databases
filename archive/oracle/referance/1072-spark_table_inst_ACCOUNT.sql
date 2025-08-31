-------------------------------------Delete all existing entriess-------------------------
---------------------------------------------------------------------------------------
create sequence table_column_order_no_seq start with 1 increment by 1 ;
delete from table_column where tbd_id = (select tbd_id from table_dfn where lower(tbd_name) ='account' ); 
delete from table_dfn where lower(tbd_name) = 'account'; 
delete from table_inst where lower(tin_table_name) = 'account'; 
-------------------------------------Entry For Table Definitions-------------------------
---------------------------------------------------------------------------------------
insert into table_dfn(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,TBD_HYBRID_FL,tbd_version_id,ptn_id,SYSTEM_GENERATED_FL) 
   	values((select NOI_CURRENT_NO + 1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableDfn'),1,'ACCOUNT','ACCOUNT','Y','N','N','N','N',1,1,'N');
-------------------------------------Entry For Table Instance-------------------------
---------------------------------------------------------------------------------------
insert into table_inst(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id,SYSTEM_GENERATED_FL,dsc_name) 
		values((select NOI_CURRENT_NO + 1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableInst'), (select tbd_id from table_dfn where tbd_name = 'ACCOUNT'), 2,'ACCOUNT','ACCOUNT','ACCOUNT','N',1,1,'N','fms');
-------------------------------------Entry For Table columns-------------------------
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ACCOUNT_NAME','ACCOUNT_NAME', table_column_order_no_seq.nextval,'N','string',40,'Y','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 2 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ACCOUNT_DOA','ACCOUNT_DOA', table_column_order_no_seq.nextval,'N','datetime',11,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 3 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'NETWORK_ID','NETWORK_ID', table_column_order_no_seq.nextval,'N','int',20,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 4 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'FIRST_NAME','FIRST_NAME', table_column_order_no_seq.nextval,'N','string',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 5 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'MIDDLE_NAME','MIDDLE_NAME', table_column_order_no_seq.nextval,'N','string',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 6 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'LAST_NAME','LAST_NAME', table_column_order_no_seq.nextval,'N','string',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 7 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ADDRESS_LINE_1','ADDRESS_LINE_1', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 8 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ADDRESS_LINE_2','ADDRESS_LINE_2', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 9 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ADDRESS_LINE_3','ADDRESS_LINE_3', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 10 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'CITY','CITY', table_column_order_no_seq.nextval,'N','string',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 11 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'POST_CODE','POST_CODE', table_column_order_no_seq.nextval,'N','string',20,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 12 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'CREDIT_LIMIT','CREDIT_LIMIT', table_column_order_no_seq.nextval,'N','decimal',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 13 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'RATE_PLAN','RATE_PLAN', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 14 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ACCOUNT_TYPE','ACCOUNT_TYPE', table_column_order_no_seq.nextval,'N','int',20,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 15 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'FRD_INDICATOR','FRD_INDICATOR', table_column_order_no_seq.nextval,'N','int',38,'Y','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 16 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'ID','ID', table_column_order_no_seq.nextval,'Y','long',1,'Y','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 17 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'GROUPS','GROUPS', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 18 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'COMMENTS','COMMENTS', table_column_order_no_seq.nextval,'N','string',512,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 19 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'PARENT_ID','PARENT_ID', table_column_order_no_seq.nextval,'N','long',20,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 20 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'HIERARCHY_ID','HIERARCHY_ID', table_column_order_no_seq.nextval,'N','long',20,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 21 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'MODIFIED_DATE','MODIFIED_DATE', table_column_order_no_seq.nextval,'N','datetime',1,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 22 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'CUST_ALERT_EMAIL_ID','CUST_ALERT_EMAIL_ID', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 23 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'CUST_ALERT_CONTACT_NUMBER','CUST_ALERT_CONTACT_NUMBER', table_column_order_no_seq.nextval,'N','string',40,'N','N',1,1);
insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
         values((select NOI_CURRENT_NO + 24 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='TableColumn'),(select tbd_id from table_dfn where lower(tbd_name) = 'account'),'NOTIFICATION_GROUPS','NOTIFICATION_GROUPS', table_column_order_no_seq.nextval,'N','string',256,'N','N',1,1);
drop sequence table_column_order_no_seq ;

update next_object_id set NOI_CURRENT_NO = (select tbd_id + 1 from table_dfn where lower(tbd_name) = 'account') where NOI_OBJECT_NAME = 'TableDfn';

update next_object_id set NOI_CURRENT_NO = ((select max(TCL_ID)+1 from table_column))  where NOI_OBJECT_NAME = 'TableColumn';

update next_object_id set NOI_CURRENT_NO = (select tin_id +1 from table_inst where lower(TIN_TABLE_NAME) ='account') where NOI_OBJECT_NAME = 'TableInst';
