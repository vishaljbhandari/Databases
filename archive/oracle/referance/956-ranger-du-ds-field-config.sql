-- ********************************************************************************
-- *  Copyright(c) Subexazure Limited 2006. All Rights Reserved.               *
-- *  The copyright to the Computer Program(s) herein is the property of Subex    *
-- *  systems limited. the program(s) may be used and/or copied with the written  *
-- *  permission from subex systems limited or in accordance with the terms and   *
-- *  conditions stipulated in the agreement/contract under which the program(s)  *
-- *  have been supplied.                                                         *
-- ********************************************************************************

SET FEEDBACK OFF

-- ******************* Ds_field configuration set up for Account ********************
insert into ds_field_config values ('Account Name',3,1,1,2,'ACCOUNT_NAME','','SMM.AG.POSTPAID SMM.AG.PREPAID',1,41);
insert into ds_field_config values ('Date of Activation',4,2,2,2,'ACCOUNT_DOA','DD/MM/YYYY','SMM.PRECHECK',1,9);
insert into ds_field_config values ('Network',1,3,3,2,'NETWORK_ID','','',1,23);
insert into ds_field_config values ('First Name',3,4,4,2,'FIRST_NAME','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,41);
insert into ds_field_config values ('Middle Name',3,5,5,2,'MIDDLE_NAME','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,41);
insert into ds_field_config values ('Last Name',3,6,6,2,'LAST_NAME','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,41);
insert into ds_field_config values ('Address Line 1',3,7,7,2,'ADDRESS_LINE_1','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,257);
insert into ds_field_config values ('Address Line 2',3,8,8,2,'ADDRESS_LINE_2','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,257);
insert into ds_field_config values ('Address Line 3',3,9,9,2,'ADDRESS_LINE_3','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,257);
insert into ds_field_config values ('City',3,10,10,2,'CITY','','SMM.PRECHECK SMM.AG.POSTPAID SMM.AG.PREPAID',1,41);
insert into ds_field_config values ('Post Code',3,11,11,2,'POST_CODE','','SMM.PRECHECK CMM.STATIC.FORMULA SMM.AG.POSTPAID SMM.AG.PREPAID',1,21);
insert into ds_field_config values ('Credit Limit',3,0,12,2,'CREDIT_LIMIT','','SMM.AG.POSTPAID SMM.AG.PREPAID CMM.STATIC.FORMULA CMM.DYNAMIC.FORMULA',1,11);
insert into ds_field_config values ('Rate Plan',3,27,28,2,'RATE_PLAN','','CMM.STATIC.RULE CMM.DYNAMIC.RULE',0,1);
insert into ds_field_config values ('Expiry Date',4,28,29,2,'','','',0,1);
insert into ds_field_config values ('Grace Period ',1,29,30,2,'','','',0,1);
insert into ds_field_config values ('Activation Amount',2,30,31,2,'','','',1,1);
insert into ds_field_config values ('Bill Cycle',3,31,32,2,'BILL_CYCLE','','SMM.AG.POSTPAID',0,21) ;

-- ************Ds_field configuration set up for SUBSCRIBER ******************************
insert into ds_field_config values ('Phone No.',3,12,13,5,'PHONE_NUMBER','','SMM.PRECHECK',1,41);
insert into ds_field_config values ('Date of Activation',4,13,14,5,'SUBSCRIBER_DOA','DD/MM/YYYY','',1,9);
insert into ds_field_config values ('Home Phone No.',3,14,15,5,'HOME_PHONE_NUMBER','','SMM.PRECHECK',1,41);
insert into ds_field_config values ('Office Phone No.',3,15,16,5,'OFFICE_PHONE_NUMBER','','SMM.PRECHECK',1,41);
insert into ds_field_config values ('Contact Phone No.',3,16,17,5,'CONTACT_PHONE_NUMBER','','SMM.PRECHECK',1,41);
insert into ds_field_config values ('MCN1',3,17,18,5,'MCN1','','',1,41);
insert into ds_field_config values ('MCN2',3,18,19,5,'MCN2','','',1,41);
insert into ds_field_config values ('IMSI',3,19,20,5,'IMSI','','SMM.PRECHECK',1,21);
insert into ds_field_config values ('Equipment ID',3,20,21,5,'IMEI','','SMM.PRECHECK',1,21);
insert into ds_field_config values ('Connection Type',1,21,22,5,'CONNECTION_TYPE','','',1,1);
insert into ds_field_config values ('Groups',3,22,23,5,'GROUPS','','',1,257);
insert into ds_field_config values ('Services',1,23,24,5,'SERVICES','','',1,4);
insert into ds_field_config values ('QoS',1,24,25,5,'QoS','','',1,1);
insert into ds_field_config values ('Product Type',1,25,26,5,'PRODUCT_TYPE','','',1,1);
insert into ds_field_config values ('Action Indicator',1,26,27,5,'','','',1,1);
insert into ds_field_config values('Rate Plan',3,0,33,5,'RATEPLAN','','',1,1);
insert into ds_field_config values('Date Of Birth',3,0,34,5,'DATE_OF_BIRTH','','',1,1);
insert into ds_field_config values('Bill Cycle',3,0,35,5,'BILLCYCLE','','',1,1);
insert into ds_field_config values('Subscription Type',3,0,36,5,'SUBSCRIPTION_TYPE','','',1,1);
insert into ds_field_config values('Credit Class',3,0,37,5,'CREDIT_CLASS','','',1,1);
insert into ds_field_config values('End Service Date',3,0,38,5,'END_SERVICE_DATE','','',1,1);
insert into ds_field_config values('Nationality',3,0,39,5,'NATIONALITY','','',1,1);
insert into ds_field_config values('Passport Number',3,0,40,5,'PASSPORT_NUMBER','','SMM.PRECHECK',1,51);
insert into ds_field_config values('Company Registration Number',3,0,41,5,'COMPANY_REGISTRATION_NUMBER','','',1,1);
insert into ds_field_config values('Co ID',3,0,42,5,'OPTIONAL_FIELD1','','',0,1);
insert into ds_field_config values('Company Name',3,0,43,5,'OPTIONAL_FIELD2','','',1,1);
insert into ds_field_config values('Subscriber First Name',3,0,44,5,'OPTIONAL_FIELD3','','',1,1);
insert into ds_field_config values('Payment Responsibility Customer ID',3,0,45,5,'OPTIONAL_FIELD4','','',1,1);
insert into ds_field_config values('Optional Field5',3,0,46,5,'OPTIONAL_FIELD5','','',0,1);
insert into ds_field_config values('Optional Field6',3,0,47,5,'OPTIONAL_FIELD6','','',0,1);
insert into ds_field_config values('Optional Field7',2,0,48,5,'OPTIONAL_FIELD7','','',0,1);
insert into ds_field_config values('Optional Field8',2,0,49,5,'OPTIONAL_FIELD8','','',0,1);
insert into ds_field_config values('Optional Field9',2,0,50,5,'OPTIONAL_FIELD9','','',0,1);
insert into ds_field_config values('Optional Field10',2,0,51,5,'OPTIONAL_FIELD10','','',0,1);
insert into ds_field_config values('Group Description',3,0,52,5,'GROUP_DESCRIPTION','','',0,1);
insert into ds_field_config values('Rate Plan ID',3,0,53,5,'RATEPLAN_ID','','',1,1);
insert into ds_field_config values('Main Directory Number Flag',3,0,54,5,'MAIN_DIR_NO_FLAG','','',1,1);
insert into ds_field_config values('Dummy',3,0,81,5,'','','',1,1);

-- ************Ds_field configuration set up for postpaid subscriber Details ******************************
insert into ds_field_config values('Static Credit Limit',2,32,55,11,'STATIC_CREDIT_LIMIT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Dynamic Credit Limit',2,33,56,11,'DYNAMIC_CREDIT_LIMIT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA',1,17) ;
insert into ds_field_config values('Total Slippage',1,34,57,11,'TOTAL_SLIPPAGE','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,21) ;
insert into ds_field_config values('Total Open Amount',2,35,58,11,'OUTSTANDING_AMOUNT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Total Payment',2,36,59,11,'TOTAL_PAYMENT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Total Unbilled Amount',2,37,60,11,'UNBILLED_AMOUNT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Last Due Date',4,38,61,11,'LAST_DUE_DATE','DD/MM/YYYY','SMM.AG.POSTPAID',1,9) ;
insert into ds_field_config values('Last Payment Date',4,39,62,11,'LAST_PAY_DATE','DD/MM/YYYY','SMM.AG.POSTPAID',1,9) ;
insert into ds_field_config values('Last Payment Amount',2,40,63,11,'LAST_PAID_AMOUNT','','SMM.AG.POSTPAID',1,17) ;
insert into ds_field_config values('No Of Suspensions',1,41,64,11,'NO_OF_SUSPENSIONS','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,21) ;
insert into ds_field_config values('No Of Full Payments',1,42,65,11,'NO_OF_FULL_PAYMENTS','','SMM.AG.POSTPAID',1,21) ;
insert into ds_field_config values('No Of Part Payments',1,43,66,11,'NO_OF_PART_PAYMENTS','','SMM.AG.POSTPAID',1,21) ;
insert into ds_field_config values('No Of Slippages',1,44,67,11,'NO_OF_SLIPPAGES','','SMM.AG.POSTPAID',1,21) ;
insert into ds_field_config values('Exposure',2,45,68,11,'EXPOSURE','','SMM.AG.POSTPAID CMM.EM.COLOR.RULE',1,17) ;
insert into ds_field_config values('Percentage Exposure',2,46,69,11,'PERCENTAGE_EXPOSURE','','SMM.AG.POSTPAID CMM.EM.COLOR.RULE',1,17) ;
insert into ds_field_config values('Credit Expiry Date',4,47,70,11,'CREDIT_EXPIRY_DATE','DD/MM/YYYY','SMM.AG.POSTPAID',1,9) ;
insert into ds_field_config values('Actual Invoice Amount',3,0,71,11,'ACTUAL_INVOICE_AMOUNT','','', 0 ,9) ;
insert into ds_field_config values('Interim Total Slippage',1,48,72,11,'INTERIM_TOTAL_SLIPPAGE','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,21) ;
insert into ds_field_config values('Interim Outstanding Amount',2,49,73,11,'INTERIM_OUTSTANDING_AMOUNT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Interim Total Payment',2,50,74,11,'INTERIM_TOTAL_PAYMENT','','SMM.AG.POSTPAID CMM.DYNAMIC.FORMULA CMM.DYNAMIC.RULE',1,17) ;
insert into ds_field_config values('Interim Last Due Date',4,51,75,11,'INTERIM_LAST_DUE_DATE','DD/MM/YYYY','SMM.AG.POSTPAID',1,9) ;
insert into ds_field_config values('Interim Last Pay Date',4,52,76,11,'INTERIM_LAST_PAY_DATE','DD/MM/YYYY','SMM.AG.POSTPAID',1,9) ;
insert into ds_field_config values('Interim Last Paid Amount',2,53,77,11,'INTERIM_LAST_PAID_AMOUNT','','SMM.AG.POSTPAID',1,17) ;
insert into ds_field_config values('Interim No Of Slippages',1,54,78,11,'INTERIM_NO_OF_SLIPPAGES','','SMM.AG.POSTPAID',1,21) ;
insert into ds_field_config values('Interim No Of Payments',1,55,79,11,'INTERIM_NO_OF_PAYMENTS','','SMM.AG.POSTPAID',1,21) ;
insert into ds_field_config values('Current Amount',2,0,80,11,'PREVIOUS_OUTSTANDING_AMOUNT','','SMM.AG.POSTPAID',1,21) ;

-- ************Ds_field configuration set up for Prepaid subscriber Details ******************************
insert into ds_field_config values('Voucher Expiry Date',4,0,55,12,'VOUCHER_EXPIRY_DATE','DD/MM/YYYY','SMM.AG.PREPAID',1,9) ;
insert into ds_field_config values('Grace Period Expiry Date',4,0,56,12,'GRACE_PERIOD_EXPIRY_DATE','DD/MM/YYYY','SMM.AG.PREPAID',1,9) ;
insert into ds_field_config values('Current Balance',2,0,57,12,'CURRENT_BALANCE','','SMM.AG.PREPAID',1,17) ;
insert into ds_field_config values('Previous Balance',2,0,58,12,'PREVIOUS_BALANCE','','SMM.AG.PREPAID',1,17) ;
insert into ds_field_config values('Last Recharge Date',4,0,59,12,'LAST_RECHARGE_DATE','DD/MM/YYYY','SMM.AG.PREPAID',1,9) ;
insert into ds_field_config values('Last Cdr Time',4,0,60,12,'LAST_CDR_TIME','DD/MM/YYYY HH24:MI:SS','SMM.AG.PREPAID',1,9) ;
insert into ds_field_config values('Diff Balance Percentage',2,0,61,12,'DIFF_BALANCE_PERCENTAGE','','',1,17) ;

-- ************Ds_field configuration for postpaid_subscriber_v ****************
insert into ds_field_config select name, data_type, id, position, 13, database_field, format, ds_category, is_visible, width from ds_field_config where ds_type in (2, 5, 11) ; 

-- ************Ds_field configuration for prepaid_subscriber_v  ****************
insert into ds_field_config select name, data_type, id, position, 14, database_field, format, ds_category, is_visible, width from ds_field_config where ds_type in (2, 5, 12) ; 

-- ************Ds_field configuration set up for CDR******************************

insert into ds_field_config values('Receive Time',4,1,1,1,'','yyyy/mm/dd hh24:mi:ss','',0,1);
insert into ds_field_config values('Network',1,2,2,1,'NETWORK_ID','','',1,20);
insert into ds_field_config values('Caller Number',3,3,3,1,'CALLER_NUMBER','','',1,40);
insert into ds_field_config values('Called Number',3,4,4,1,'CALLED_NUMBER','','',1,40);
insert into ds_field_config values('Forwarded Number',3,5,5,1,'FORWARDED_NUMBER','','',1,40);
insert into ds_field_config values('Record Type',1,6,6,1,'RECORD_TYPE','','',1,20);
insert into ds_field_config values('Duration',1,7,7,1,'DURATION','','',1,20);
insert into ds_field_config values('Time Stamp',4,8,8,1,'TIME_STAMP','yyyy/mm/dd hh24:mi:ss','',1,19);
insert into ds_field_config values('Equipment ID',3,9,9,1,'EQUIPMENT_ID','','',1,40);
insert into ds_field_config values('IMSI Number',3,10,10,1,'IMSI_NUMBER','','',1,40);
insert into ds_field_config values('Geographic Position',3,11,11,1,'GEOGRAPHIC_POSITION','','',1,32);
insert into ds_field_config values('Call Type',1,12,12,1,'CALL_TYPE','','',1,20);
insert into ds_field_config values('Subscriber ID',1,13,13,1,'SUBSCRIBER_ID','','',0,20);
insert into ds_field_config values('Value',2,14,14,1,'VALUE','','',1,16);
insert into ds_field_config values('CDR Type',1,15,15,1,'CDR_TYPE','','',1,20);
insert into ds_field_config values('Service Type',1,16,16,1,'SERVICE_TYPE','','',1,20);
insert into ds_field_config values('CDR Category',1,17,17,1,'CDR_CATEGORY','','',1,20);
insert into ds_field_config values('Is Complete',1,18,18,1,'IS_COMPLETE','','',1,20);
insert into ds_field_config values('Co-Related Field',3,19,19,1,'','','',0,1);
insert into ds_field_config values('Is Attempted',1,20,20,1,'IS_ATTEMPTED','','',1,20);
insert into ds_field_config values('Service',1,21,21,1,'SERVICE','','', 1,20);
insert into ds_field_config values('Phone Number',3,22,22,1,'PHONE_NUMBER','','',1,40);
insert into ds_field_config values('VPMN',3,0,23,1,'VPMN','','',1,31);
insert into ds_field_config values('Source',3,0,24,1,'SOURCE','','',1,255);
insert into ds_field_config values('Cell Site Name',3,0,25,1,'CELL_SITE_NAME','','',1,256);
insert into ds_field_config values('Is Conference',1,0,26,1,'IS_CONFERENCE','','',1,10);
insert into ds_field_config values('Type Of Call',3,0,27,1,'IS_SUBSCRIBERLESS','','',1,10);
insert into ds_field_config values('IN_Charge',2,0,28,1,'IN_CHARGE','','',1,16);

-- *********** DS_FIELD configuration for Delegator *****************************

insert into ds_field_config select name, data_type, id, position, 16, database_field, format, ds_category, is_visible, width from ds_field_config where ds_type = 1 ;

insert into ds_field_config values('Id',3,23,29,16,'ID','','',0,1);
insert into ds_field_config values('Is Late',1,24,30,16,'','','',1,1);

-- *********** DS_FIELD configuration for recharge *****************************
insert into ds_field_config values('Time Stamp',4,1,1,4,'TIME_STAMP','yyyy/mm/dd hh24:mi:ss','',1,21);
insert into ds_field_config values('Phone Number',3,2,2,4,'PHONE_NUMBER','','',1,40);
insert into ds_field_config values('Amount',2,3,3,4,'AMOUNT','','',1,16);
insert into ds_field_config values('Recharge Type',1,4,4,4,'RECHARGE_TYPE','','',1,16);
insert into ds_field_config values('Status',1,5,5,4,'STATUS','','',1,20);
insert into ds_field_config values('Credit Card',3,6,6,4,'CREDIT_CARD','','',1,40);
insert into ds_field_config values('PIN Number',3,7,7,4,'PIN_NUMBER','','',1,40);
insert into ds_field_config values('Network',1,8,8,4,'NETWORK_ID','','',1,20);
insert into ds_field_config values('Account ID',1,9,9,4,'ACCOUNT_ID','','',0,20);
insert into ds_field_config values('Subscriber ID',1,10,10,4,'SUBSCRIBER_ID','','',0,20);
insert into ds_field_config values('Serial Number',3,0,11,4,'SERIAL_NUMBER','','',1,40);
insert into ds_field_config values('Expiry Date',4,11,12,4,'','yyyy/mm/dd hh24:mi:ss','',0,0) ;
insert into ds_field_config values('Grace Period',1,12,13,4,'','','',0,0) ;
insert into ds_field_config values('Acct ID',3,0,14,4, 'ACCT_ID','','',1,255) ;
insert into ds_field_config values('Acct Ref ID',3,0,15,4,'ACCT_REF_ID','','',1,255);
insert into ds_field_config values('User',3,0,16,4,'DU_USER','','',1,255);
insert into ds_field_config values('Account Type',3,0,17,4,'ACCOUNT_TYPE','','',1,255);
insert into ds_field_config values('Balance Type',3,0,18,4,'BALANCE_TYPES','','',1,255);
insert into ds_field_config values('Balances',3,0,19,4,'BALANCES','','',1,255);
insert into ds_field_config values('Acs Cust ID',3,0,20,4,'ACS_CUST_ID','','',1,255); 
insert into ds_field_config values('Bonus Type',3,0,21,4,'BONUS_TYPE','','',1,255);
insert into ds_field_config values('CS',3,0,22,4,'CS','','',1,255);
insert into ds_field_config values('PI',3,0,23,4,'PI','','',1,255);
insert into ds_field_config values('Reference',3,0,24,4,'REFERENCE','','',1,255);
insert into ds_field_config values('Wallet Type',3,0,25,4,'WALLET_TYPE','','',1,255);
insert into ds_field_config values('Batch Description',3,0,26,4,'BATCH_DESCRIPTION','','',1,255);
insert into ds_field_config values('Type Description',3,0,27,4,'TYPE_DESCRIPTION','','',1,255);
insert into ds_field_config values('Voucher',3,0,28,4,'VOUCHER','','',1,255);
insert into ds_field_config values('NACK',3,0,29,4,'NACK','','',1,255);
insert into ds_field_config values('Redeeming Acct Ref',3,0,30,4,'REDEEMING_ACCT_REF','','',1,255);
insert into ds_field_config values('Host',3,0,31,4,'HOST','','',1,255);
insert into ds_field_config values('Voucher Type',3,0,32,4,'VOUCHER_TYPE','','',1,255);
insert into ds_field_config values('BadPins',3,0,33,4,'BADPINS','','',1,255);
insert into ds_field_config values('Charge Name',3,0,34,4,'CHARGE_NAME','','',1,255);
insert into ds_field_config values('TCS',3,0,35,4,'TCS','','',1,255);
insert into ds_field_config values('Event Calss',3,0,36,4,'EVENT_CLASS','','',1,255);
insert into ds_field_config values('Event Name',3,0,37,4,'EVENT_NAME','','',1,255);
insert into ds_field_config values('Event Cost',3,0,38,4,'EVENT_COST','','',1,255);
insert into ds_field_config values('Event Time Cost',3,0,39,4,'EVENT_TIME_COST','','',1,255);
insert into ds_field_config values('Event Count',3,0,40,4,'EVENT_COUNT','','',1,255);
insert into ds_field_config values('Discount',3,0,41,4,'DISCOUNT','','',1,255);
insert into ds_field_config values('Cascade',3,0,42,4,'CASCADE','','',1,255);
insert into ds_field_config values('CDR Type',3,0,43,4,'CDR_TYPE','','',1,255) ;
insert into ds_field_config values('Result Reason',3,0,44,4,'RESULT_REASON','','',1,255) ;

-- *********** DS_FIELD configuration for DCCM *****************************
insert into ds_field_config values ('Account Id',3,1,1,3,'','','',1,1);
insert into ds_field_config values ('Due Date',4,2,2,3,'','DD/MM/YYYY','',1,1);
insert into ds_field_config values ('Pay Date',4,3,3,3,'','DD/MM/YYYY','',1,1);
insert into ds_field_config values ('Due Amount',2,4,4,3,'','','',1,1);
insert into ds_field_config values ('Paid Amount',2,5,5,3,'','','',1,1);
insert into ds_field_config values ('Is interim Record',1,6,6,3,'','','',1,1) ;

-- *********** DS_FIELD configuration for Prepaid Subscriber *****************************
insert into ds_field_config values ('Phone Number',3,1,1,7,'PHONE_NUMBER','','',1,1);
insert into ds_field_config values ('Voucher Expiry Date',4,2,2,7,'VOUCHER_EXPIRY_DATE','DD/MM/YYYY','',1,1);
insert into ds_field_config values ('Current Balance',2,3,3,7,'CURRENT_BALANCE','','',1,1);
insert into ds_field_config values ('Previous Balance',2,4,4,7,'PREVIOUS_BALANCE','','',1,1);
insert into ds_field_config values ('Diff Balance Percentage',2,5,5,7,'DIFF_BALANCE_PERCENTAGE','','',1,1);
insert into ds_field_config values ('Last Recharge Date',4,6,6,7,'LAST_RECHARGE_DATE','DD/MM/YYYY','',1,1);
insert into ds_field_config values ('Last CDR Time',4,7,7,7,'LAST_CDR_TIME','DD/MM/YYYY HH24:MI:SS','',1,1);
insert into ds_field_config values ('Network',1,8,8,7,'NETWORK_ID','','',1,1);
insert into ds_field_config values ('QoS',1,9,9,7,'QOS','','',1,1);
insert into ds_field_config values ('Status',1,0,10,7,'STATUS','','',1,1);
insert into ds_field_config values ('Rate Plan',3,10,11,7,'RATE_PLAN','','',1,1);
insert into ds_field_config values ('IMSI Number',3,0,12,7,'IMSI_NUMBER','','',1,1);
insert into ds_field_config values ('Grace Period Expiry Date',4,11,13,7,'GRACE_PERIOD_EXPIRY_DATE','DD/MM/YYYY','',1,1);
insert into ds_field_config values ('Services',1,12,14,7,'SERVICES','','',1,1);
insert into ds_field_config values ('Connection Type',1,13,15,7,'CONNECTION_TYPE','','',1,1);

-- *********** DS_FIELD configuration for ISP *****************************
insert into ds_field_config values('Network ID', 1, 1, 1, 10, 'NETWORK_ID', '', '', 1,1);
insert into ds_field_config values('Time Stamp', 4, 2, 2, 10, 'TIME_STAMP', 'YYYY/MM/DD HH24:MI:SS', '', 1,1);
insert into ds_field_config values('Duration', 1, 3, 3, 10, 'DURATION', '', '', 1,1);
insert into ds_field_config values('Phone Number', 3, 4, 4, 10, 'PHONE_NUMBER', '', '', 1,1);
insert into ds_field_config values('Framed IP Address', 3, 5, 5, 10, 'FRAMED_IP_ADDRESS', '', '', 1,1);
insert into ds_field_config values('IPDR Type', 1, 6, 6, 10, 'IPDR_TYPE', '', '', 1,1);
insert into ds_field_config values('Upload Data Volume', 2, 7, 7, 10, 'UPLOAD_DATA_VOLUME', '', '', 1,1);
insert into ds_field_config values('Download Data Volume', 2, 8, 8, 10, 'DOWNLOAD_DATA_VOLUME', '', '', 1,1);
insert into ds_field_config values('ISP Qos', 1, 9, 9, 10, 'ISP_QOS', '', '', 1,1);
insert into ds_field_config values('Value', 2, 10, 10, 10, 'VALUE', '', '', 1,1);
insert into ds_field_config values('Subscriber ID', 1, 11, 11, 10, 'SUBSCRIBER_ID', '', '', 1,1);
insert into ds_field_config values('User Name', 3, 12, 12, 10, 'USER_NAME', '', '', 1,1);
insert into ds_field_config values('Session ID', 3, 13, 13, 10, 'SESSION_ID', '', '', 1,1);
insert into ds_field_config values('Session Status', 1, 14, 14, 10, 'SESSION_STATUS', '', '', 1,1);

-- ************Ds_field configuration set up for GPRS CDR******************************
insert into ds_field_config values('Receive Time',4,1,1,8,'','yyyy/mm/dd hh24:mi:ss','',1,1);
insert into ds_field_config values('Network',1,2,2,8,'NETWORK_ID','','',1,20);
insert into ds_field_config values('Record Type',1,3,3,8,'RECORD_TYPE','','',1,20);
insert into ds_field_config values('Time Stamp',4,4,4,8,'TIME_STAMP','yyyy/mm/dd hh24:mi:ss','',1,20);
insert into ds_field_config values('Duration',1,5,5,8,'DURATION','','',1,20);
insert into ds_field_config values('Phone Number',3,6,6,8,'PHONE_NUMBER','','',1,32);
insert into ds_field_config values('Service Type',1,7,7,8,'SERVICE_TYPE','','',1,20);
insert into ds_field_config values('CDR Type',1,8,8,8,'CDR_TYPE','','',1,20);
insert into ds_field_config values('Upload Data Volume',2,9,9,8,'UPLOAD_DATA_VOLUME','','',1,20);
insert into ds_field_config values('Download Data Volume',2,10,10,8,'DOWNLOAD_DATA_VOLUME','','',1,20);
insert into ds_field_config values('QoS Requested',1,11,11,8,'QOS_REQUESTED','','',1,20);
insert into ds_field_config values('QoS Negotiated',1,12,12,8,'QOS_NEGOTIATED','','',1,20);
insert into ds_field_config values('Value',2,13,13,8,'VALUE','','',1,16);
insert into ds_field_config values('Subscriber ID',1,14,14,8,'SUBSCRIBER_ID','','',0,20);
insert into ds_field_config values('Charging ID',3,15,15,8,'CHARGING_ID','','',1,26);
insert into ds_field_config values('Service',1,16,16,8,'SERVICE','','',1,20);
insert into ds_field_config values('IMSI Number',3,17,17,8,'IMSI_NUMBER','','',1,32);
insert into ds_field_config values('Equipment ID',3,18,18,8,'IMEI_NUMBER','','',1,32);
insert into ds_field_config values('Session Status',1,19,19,8,'SESSION_STATUS','','',1,2);
insert into ds_field_config values('Access Point Name',3,0,20,8,'ACCESS_POINT_NAME','','',1,64);
insert into ds_field_config values('Geographic Position',3,20,21,8,'GEOGRAPHIC_POSITION','','',1,32);
insert into ds_field_config values('Cause for Session Closing',1,21,22,8,'CAUSE_FOR_SESSION_CLOSING','','',1,2);
insert into ds_field_config values('PDP Type',3,0,23,8,'PDP_TYPE','','',1,32);
insert into ds_field_config values('Served PDP Address',3,0,24,8,'SERVED_PDP_ADDRESS','','',1,32);
insert into ds_field_config values('Sender Terminal Type',3,0,25,8,'SENDER_TERMINAL_TYPE','','',1,256);
insert into ds_field_config values('Sender Terminal IP Address/Content Type',3,0,26,8,'SENDER_TERMINAL_IP_ADDRESS','','',1,256);
insert into ds_field_config values('Orig Vasp ID/SDP Application ID',3,0,27,8,'ORIG_VASP_ID','','',1,256);
insert into ds_field_config values('Orig Vas ID/Content Title',3,0,28,8,'ORIG_VAS_ID','','',1,256);
insert into ds_field_config values('Sender Roaming Class/Provider ID',3,0,29,8,'SENDER_ROAMING_CLASS','','',1,256);
insert into ds_field_config values('Recipient Terminal IP Address',3,0,30,8,'RECIPIENT_TERMINAL_IP_ADDRESS','','',1,256);
insert into ds_field_config values('ADDRESS HIDING STATUS/FIELD ID',3,0,31,8,'ADDRESS_HIDING_STATUS','','',1,256);
insert into ds_field_config values('DEST VASP ID/RECORD SEQUCNCE',3,0,32,8,'DEST_VASP_ID','','',1,256);
insert into ds_field_config values('DEST VAS ID/GGSN ADDRESS',3,0,33,8,'DEST_VAS_ID','','',1,256);
insert into ds_field_config values('RECIPIENT ROAMING CLASS/SGSN ADDRESS',3,0,34,8,'RECIPIENT_ROAMING_CLASS','','',1,256);
insert into ds_field_config values('FORWARDED BY/NETWORK INITIATED PDP CONTEXT',3,0,35,8,'FORWARDED_BY','','',1,256);
insert into ds_field_config values('MSG ID/RECORD OPENING TIME/TYPE OF CALL',3,0,36,8,'MSG_ID','','',1,256);
insert into ds_field_config values('PRIORITY/SGSN CHANGE',3,0,37,8,'PRIORITY','','',1,256);
insert into ds_field_config values('CNT SIZE VIDEO/PDP HLR INDEX',3,0,38,8,'CNT_SIZE_VIDEO','','',1,256);
insert into ds_field_config values('CNT NUMBER VIDEO/OPTIONAL DATA',3,0,39,8,'CNT_NUMBER_VIDEO','','',1,256);
insert into ds_field_config values('CNT SIZE AUDIO/S CHARGING TYPE',3,0,40,8,'CNT_SIZE_AUDIO','','',1,256);
insert into ds_field_config values('CNT NUMBER AUDIO/PLMN ID',3,0,41,8,'CNT_NUMBER_AUDIO','','',1,256);
insert into ds_field_config values('CNT SIZE IMAGE/CAMEL APN NETWORK',3,0,42,8,'CNT_SIZE_IMAGE','','',1,256);
insert into ds_field_config values('CNT NUMBER IMAGE/CAMEL APN OPERATOR',3,0,43,8,'CNT_NUMBER_IMAGE','','',1,256);
insert into ds_field_config values('CNT SIZE TEXT/CAMEL APPEND',3,0,44,8,'CNT_SIZE_TEXT','','',1,256);
insert into ds_field_config values('CNT NUMBER TEXT/CAMEL FFD',3,0,45,8,'CNT_NUMBER_TEXT','','',1,256);
insert into ds_field_config values('CNT SIZE OTHER/APN OPERATOR',3,0,46,8,'CNT_SIZE_OTHER','','',1,256);
insert into ds_field_config values('CNT NUMBER OTHER/ROUTING AREA',3,0,47,8,'CNT_NUMBER_OTHER','','',1,256);
insert into ds_field_config values('RECIPIENT NUMBER/SERVICE AREA CODE',3,0,48,8,'RECIPIENT_NUMBER','','',1,256);
insert into ds_field_config values('NO OF SUCCESSFUL RECIPIENTS/TOLLFREE UPLINK',3,0,49,8,'NO_OF_SUCCESSFUL_RECIPIENTS','','',1,256);
insert into ds_field_config values('DEST MMSC/TOLLFREE DOWNLINK',3,0,50,8,'DEST_MMSC','','',1,256);
insert into ds_field_config values('DELIVERY STATUS/SESSION ID',3,0,51,8,'DELIVERY_STATUS','','',1,256);
insert into ds_field_config values('ERROR CAUSE/CHARGING PROFILE',3,0,52,8,'ERROR_CAUSE','','',1,256);
insert into ds_field_config values('TARIFF CLASS/UPLINK HITS',3,0,53,8,'TARIFF_CLASS','','',1,256);
insert into ds_field_config values('MESSAGE CLASS/DOWNLINK HITS',3,0,54,8,'MESSAGE_CLASS','','',1,256);
insert into ds_field_config values('SENDER CHARGING TYPE/SA CHARGING_CLASS',3,0,55,8,'SENDER_CHARGING_TYPE','','',1,256);
insert into ds_field_config values('RECIPIENT CHARGING TYPE/SA SERVICE ID',3,0,56,8,'RECIPIENT_CHARGING_TYPE','','',1,256);
insert into ds_field_config values('SENDER PREPAID STATUS/WALLET ID',3,0,57,8,'SENDER_PREPAID_STATUS','','',1,256);
insert into ds_field_config values('RECIPIENT PREPAID STATUS/WALLET CHARGING TYPE',3,0,58,8,'RECIPIENT_PREPAID_STATUS','','',1,256);
insert into ds_field_config values('OTHER PARTY NUMBER/ACCESS TYPE',3,0,59,8,'OTHER_PARTY_NUMBER','','',1,256);
insert into ds_field_config values('Source',3,0,60,8,'SOURCE','','',1,256);
insert into ds_field_config values('Cell Site Name',3,0,61,8,'CELL_SITE_NAME','','',1,256);
insert into ds_field_config values('IN Charge/Purchase Price',2,0,62,8,'IN_CHARGE','','',1,16);

COMMIT ;
QUIT;
