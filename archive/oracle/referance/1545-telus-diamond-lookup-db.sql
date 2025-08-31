--Deleting previous entries from table_dfn,table_inst,table_column
spool $RANGERHOME/LOG/telus-diamond-lookup-db.log

delete from table_dfn where tbd_id between 251 and 259 ;
delete from table_inst where tbd_id between 251 and 259 ;
delete from table_column where tbd_id  between 251 and 259 ;

--Subscriber table entries for look up from back end

insert into table_dfn
	(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id)
	 values(251,1,'SUBSCRIBER','SUBSCRIBER','N','N','N','N',1,1
	);

insert into table_inst
	(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
	values(	251,251, 1,'SUBSCRIBER','SUBSCRIBER','SUB','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4002,251,'ID','ID',1,'Y','long',20,'Y','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4003,251,'ACCOUNT_ID','ACCOUNT_ID',2,'N','long',20,'Y','N',1,1
	);


insert into table_column(tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4004,251,'PHONE_NUMBER','PHONE_NUMBER',3,'N','string',20,'Y','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4005,251,'SUBSCRIBER_DOA','SUBSCRIBER_DOA',4,'N','date',20,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4006,251,'HOME_PHONE_NUMBER','HOME_PHONE_NUMBER',5,'N','string',40,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4007,251,'OFFICE_PHONE_NUMBER','OFFICE_PHONE_NUMBER',6,'N','string',40,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4008,251,'CONTACT_PHONE_NUMBER','CONTACT_PHONE_NUMBER',7,'N','string',40,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4009,251,'MCN1','MCN1',8,'N','string',40,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4010,251,'MCN2','MCN2',9,'N','string',40,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4011,251,'IMSI','IMSI',10,'N','string',20,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4012,251,'IMEI','IMEI',11,'N','string',20,'N','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4013,251,'CONNECTION_TYPE','CONNECTION_TYPE',12,'Y','long',20,'Y','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4014,251,'GROUPS','GROUPS',13,'N','string',256,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4015,251,'SERVICES','SERVICES',14,'N','long',20,'N','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4016,251,'STATUS','STATUS',15,'N','long',20,'Y','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4017,251,'QOS','QOS',16,'N','long',20,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4018,251,'PRODUCT_TYPE','PRODUCT_TYPE',17,'N','long',20,'Y','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4019,251,'MODIFIED_DATE','MODIFIED_DATE',18,'N','DATE',20,'N','N',1,1
	);
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4020,251,'NETWORK_ID','NETWORK_ID',19,'Y','long',20,'N','N',1,1	);

--UNF_CONVERSION table entries from back end into diamond tables

insert into table_dfn
	(tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
	 values(252,1,'UNF_CONVERSION','UNF','N','N','N','N',1,1
	);

insert into table_inst
	(tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
	values(	252,252, 1,'UNF_CONVERSION','UNF_CONVERSION','ST_UNF','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4021,252,'UNF_ID','UNF_ID',1,'Y','int',10,'Y','N',1,1
	);
  
insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4022,252,'PREFIX_STRING','PREFIX_STRING',2,'N','string',20,'Y','N',1,1
	);

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4023,252,'REPLACE_STRING','REPLACE_STRING',3,'N','string',20,'Y','N',1,1
	);


--  CDR_SERVICE table entries.
 
 insert into table_dfn 
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
			  values(253,1,'CDR_SERVICE','CDR_SERVICE','N','N','N','N',1,1);
 insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
			 values(253,253, 1,'CDR_SERVICE','CDR_SERVICE','CDR_SERVICE','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4024,253,'RECORD_TYPE','RECORD_TYPE',1,'N','int',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4025,253,'CALL_TYPE','CALL_TYPE',2,'N','int',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4026,253,'SERVICE_TYPE','SERVICE_TYPE',3,'N','int',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4027,253,'SERVICE','SERVICE',4,'N','int',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4028,253,'CDR_CATEGORY','CDR_CATEGORY',5,'N','int',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4029,253,'CDR_TYPE','CDR_TYPE',6,'N','int',10,'N','N',1,1) ;

--  Account table entries.

 insert into table_dfn 
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
			  values(254,1,'ACCOUNT','ACCOUNT','N','N','N','N',1,1);
 insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
			 values(254,254, 1,'ACCOUNT','ACCOUNT','ACCOUNT','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4030,254,'ID','ID',1,'Y','long',20,'Y','N',1,1) ;
 
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4031,254,'ACCOUNT_NAME','ACCOUNT_NAME',2,'N','string',40,'Y','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4032,254,'ACCOUNT_DOA','ACCOUNT_DOA',3,'N','date',20,'N','N',1,1) ;

 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4033,254,'NETWORK_ID','NETWORK_ID',4,'N','long',20,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4034,254,'FIRST_NAME','FIRST_NAME',5,'N','string',40,'N','N',1,1) ;

 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4035,254,'MIDDLE_NAME','MIDDLE_NAME',6,'N','string',40,'N','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4036,254,'LAST_NAME','LAST_NAME',7,'N','string',40,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
 			values(4037,254,'ADDRESS_LINE_1','ADDRESS_LINE_1',8,'N','string',256,'N','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4038,254,'ADDRESS_LINE_2','ADDRESS_LINE_2',9,'N','string',256,'N','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4039,254,'ADDRESS_LINE_3','ADDRESS_LINE_3',10,'N','string',256,'N','N',1,1);
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4040,254,'CITY','CITY',11,'N','string',40,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4041,254,'POST_CODE','POST_CODE',12,'N','string',20,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4042,254,'CREDIT_LIMIT','CREDIT_LIMIT',13,'N','string',10,'N','N',1,1) ;
 insert into table_column
        (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
			values(4043,254,'RATE_PLAN','RATE_PLAN',14,'N','string',256,'N','N',1,1) ;		

--TELUS_POINTCODES table entries from back end into diamond tables

insert into table_dfn
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
         values(255,1,'TELUS_POINTCODES','PNT','N','N','N','N',1,1
        );

insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
        values( 255,255, 1,'TELUS_POINTCODES','TELUS_POINTCODES','TL_PNT','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4044,255,'ITU_POINTCODES','ITU_POINTCODES',1,'Y','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4045,255,'ANSI_POINTCODES','ANSI_POINTCODES',2,'N','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4046,255,'OWNER_NAME','OWNER_NAME',3,'N','string',100,'Y','N',1,1
        );


--TELUS_LOCAL_CALL_LOOKUP table entries from back end into diamond tables

insert into table_dfn
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
         values(256,1,'TELUS_LOCAL_CALL_LOOKUP','LKP','N','N','N','N',1,1
        );

insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
        values( 256,256, 1,'TELUS_LOCAL_CALL_LOOKUP','TELUS_LOCAL_CALL_LOOKUP','TL_LKP','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4047,256,'CALLING_NPA','CALLING_NPA',1,'Y','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4048,256,'CALLED_NPA','CALLED_NPA',2,'N','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4049,256,'PROVINCE','PROVINCE',3,'N','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4050,256,'LOCAL_CALL','LOCAL_CALL',4,'N','string',10,'Y','N',1,1
        );


--TELUS_SPECIAL_NUMBER table entries from back end into diamond tables

insert into table_dfn
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
         values(257,1,'TELUS_SPECIAL_NUMBER','SPN','N','N','N','N',1,1
        );

insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
        values( 257,257, 1,'TELUS_SPECIAL_NUMBER','TELUS_SPECIAL_NUMBER','TL_SPN','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4051,257,'ID','ID',1,'Y','int',20,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4052,257,'SPECIAL_NUMBER','SPECIAL_NUMBER',2,'N','string',40,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4053,257,'UNF_NUMBER','UNF_NUMBER',3,'N','string',40,'Y','N',1,1
        );

--TELUS_OCN_NPA table entries from back end into diamond tables

insert into table_dfn
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
         values(258,1,'TELUS_OCN_NPA','OCN','N','N','N','N',1,1
        );

insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
        values( 258,258, 1,'TELUS_OCN_NPA','TELUS_OCN_NPA','TL_OCN','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4054,258,'OCN','OCN',1,'Y','string',10,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4055,258,'PROVINCE','PROVINCE',2,'N','string',10,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4056,258,'NPA','NPA',3,'N','string',10,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4057,258,'COMPANY','COMPANY',4,'N','string',100,'Y','N',1,1
        );


--TELUS_NPA table entries from back end into diamond tables

insert into table_dfn
        (tbd_id,sct_id,tbd_name,tbd_prefix,tbd_system_fl,TBD_INTERNAL_FL,TBD_TEMP_FL,tbd_delete_fl,tbd_version_id,ptn_id )
         values(259,1,'TELUS_NPA','NPA','N','N','N','N',1,1
        );

insert into table_inst
        (tin_id,tbd_id,SCH_ID,tin_table_name,tin_display_name,tin_alias,tin_delete_fl,tin_version_id,ptn_id)
        values( 259,259, 1,'TELUS_NPA','TELUS_NPA','TL_NPA','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4058,259,'ID','ID',1,'Y','int',20,'Y','N',1,1
        );

insert into table_column
              (tcl_id,tbd_id,tcl_name,tcl_display,tcl_order_no,tcl_primary_key_fl,tcl_type,tcl_length,tcl_mandatory_fl,tcl_delete_fl,tcl_version_id,ptn_id)
              values(4059,259,'NPA','NPA',2,'N','string',10,'Y','N',1,1
        );


commit;
spool off
quit;
