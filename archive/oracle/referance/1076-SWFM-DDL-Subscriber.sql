spool SWFM-DDL-Subscriber.log ;
set feedback off ;
set serveroutput off ;
-- Additional columns for subscriber
alter table subscriber add fathers_name 			varchar2(256);
alter table subscriber add nationality 				varchar2(256);
alter table subscriber add company_name 			varchar2(256);
alter table subscriber add alternate_msisdn 		varchar2(256);
alter table subscriber add contact_name 			varchar2(256);
alter table subscriber add customer_id 				varchar2(256);
alter table subscriber add email_id 				varchar2(256);
alter table subscriber add customer_segment 		varchar2(256);
alter table subscriber add customer_product_type	varchar2(256);
alter table subscriber add package_plan_1 			varchar2(256);
alter table subscriber add package_plan_2 			varchar2(256);
alter table subscriber add additional_services 		varchar2(256);
alter table subscriber add store_name 				varchar2(256);
alter table subscriber add retailer_name 			varchar2(256);
alter table subscriber add retailer_area_code 		varchar2(256);
alter table subscriber add id_type 					varchar2(256);

-- Additional columns for archived_subscriber 
alter table archived_subscriber  add fathers_name 			varchar2(256);
alter table archived_subscriber  add nationality 			varchar2(256);
alter table archived_subscriber  add company_name 			varchar2(256);
alter table archived_subscriber  add alternate_msisdn 		varchar2(256);
alter table archived_subscriber  add contact_name 			varchar2(256);
alter table archived_subscriber  add customer_id 			varchar2(256);
alter table archived_subscriber  add email_id 				varchar2(256);
alter table archived_subscriber  add customer_segment 		varchar2(256);
alter table archived_subscriber  add customer_product_type	varchar2(256);
alter table archived_subscriber  add package_plan_1 		varchar2(256);
alter table archived_subscriber  add package_plan_2 		varchar2(256);
alter table archived_subscriber  add additional_services 	varchar2(256);
alter table archived_subscriber  add store_name 			varchar2(256);
alter table archived_subscriber  add retailer_name 			varchar2(256);
alter table archived_subscriber  add retailer_area_code 	varchar2(256);
alter table archived_subscriber  add id_type 				varchar2(256);

-- Additional columns for precheck_subscriber
alter table precheck_subscriber  add  fathers_name 		   	varchar2(256);
alter table precheck_subscriber  add  nationality 		   	varchar2(256);
alter table precheck_subscriber  add  company_name 		   	varchar2(256);
alter table precheck_subscriber  add  alternate_msisdn 	   	varchar2(256);
alter table precheck_subscriber  add  contact_name 		   	varchar2(256);
alter table precheck_subscriber  add  customer_id 		   	varchar2(256);
alter table precheck_subscriber  add  email_id 			   	varchar2(256);
alter table precheck_subscriber  add  customer_segment 	   	varchar2(256);
alter table precheck_subscriber  add  customer_product_type  varchar2(256);
alter table precheck_subscriber  add  package_plan_1 	   	varchar2(256);
alter table precheck_subscriber  add  package_plan_2 	   	varchar2(256);
alter table precheck_subscriber  add  additional_services   varchar2(256);
alter table precheck_subscriber  add  store_name 		   	varchar2(256);
alter table precheck_subscriber  add  retailer_name 		   varchar2(256);
alter table precheck_subscriber  add  retailer_area_code    varchar2(256);
alter table precheck_subscriber  add  id_type 			   	varchar2(256);

-- View for subscriber_mlh

create or replace view subscriber_mlh
as
select s.*, 0 as parent_id, 0 as hierarchy_id
from subscriber s ;

-- View for subscriber_precheck_v

create or replace view subscriber_precheck_v
as
(
  select * from subscriber where subscriber_type=2
);

-- View for subscriber_v

create or replace view subscriber_v (
    account_id,
    account_name,
	account_doa,
	network_id,
	first_name,
	middle_name,
	last_name,
	address_line_1,
    address_line_2,
    address_line_3,
    city,
    post_code,
	credit_limit,
	rate_plan,
	modified_date,
	subscriber_id,
	phone_number,
	subscriber_doa,
	home_phone_number,
	office_phone_number,
	contact_phone_number,
	cust_alert_email_id,
	cust_alert_contact_number,
	mcn1,
	mcn2,
	imsi,
	imei,
	connection_type,
	groups,
	notification_groups,
	services,
	status,
	qos,
	product_type,
	subscriber_type,
	service_number_type,
	ssid,
	subscriber_uid,
	subscriber_uid_doa,
	id_number	,	
	dealer_name		,
	date_of_birth	,
	current_balance	,
	file_name		,
	ds_name			,
	optional_field_1	,
	optional_field_2	,
	optional_field_3	,
	optional_field_4	,
	optional_field_5	,
	optional_field_6	,
	optional_field_7	,
	optional_field_8	,
	optional_field_9	,
	optional_field_10	,
	optional_field_11	,
	optional_field_12	,
	optional_field_13	,
	optional_field_14	,
	optional_field_15  , 
    fathers_name 	   ,    
    nationality 	   ,    
    company_name 	   ,    
    alternate_msisdn   ,    
    contact_name 	   ,    
    customer_id 	   ,    
    email_id 		   ,    
    customer_segment   ,    
    customer_product_type,
    package_plan_1	   	 ,     	   
    package_plan_2 	   	 ,   	
    additional_services  ,
    store_name 		   	 ,   
    retailer_name 	   	 ,   
    retailer_area_code   ,
    id_type 			   
	)
	as select
		 a.id,
		 a.account_name,
		 a.account_doa,
		 s.network_id,
		 a.first_name,
		 a.middle_name,
		 a.last_name,
		 a.address_line_1,
		 a.address_line_2,
	     a.address_line_3,
	     a.city,
	     a.post_code,
	     a.credit_limit,
	     a.rate_plan,
	     s.modified_date,
	     s.id,
		 s.phone_number,
		 s.subscriber_doa,
		 s.home_phone_number,
		 s.office_phone_number,			
		 s.contact_phone_number,
		 s.cust_alert_email_id,
		 s.cust_alert_contact_number,
		 s.mcn1,
		 s.mcn2,
		 s.imsi,
		 s.imei,
		 s.connection_type,
		 s.groups,
    	 s.notification_groups,
		 s.services,
		 s.status,
		 s.qos,
		 s.product_type,
		 s.subscriber_type,
		 s.service_number_type,
		 s.ssid,
		 s.subscriber_uid,
		 s.subscriber_uid_doa,
		 s.id_number	,	
		 s.dealer_name		,
		 s.date_of_birth	,
		 s.current_balance	,
		 s.file_name		,
		 s.ds_name			,
		 s.optional_field_1	,
		 s.optional_field_2	,
		 s.optional_field_3	,
		 s.optional_field_4	,
		 s.optional_field_5	,
		 s.optional_field_6	,
		 s.optional_field_7	,
		 s.optional_field_8	,
		 s.optional_field_9	,
		 s.optional_field_10	,
		 s.optional_field_11	,
		 s.optional_field_12	,
		 s.optional_field_13	,
		 s.optional_field_14	,
		 s.optional_field_15   ,
    	 s.fathers_name 	   ,    
    	 s.nationality 	   ,    
         s.company_name 	   ,    
         s.alternate_msisdn   ,    
         s.contact_name 	   ,    
         s.customer_id 	   ,    
         s.email_id 		   ,    
         s.customer_segment   ,    
         s.customer_product_type,
         s.package_plan_1	   	 ,     	   
         s.package_plan_2 	   	 ,   	
         s.additional_services  ,
         s.store_name 		   	 ,   
         s.retailer_name 	   	 ,   
         s.retailer_area_code   ,
         s.id_type 			   
	 from account a, subscriber s
	 where  a.id = s.account_id
	 and s.subscriber_type in (0,1)
	 and a.account_type in (0,1)  ;

-- View for total_subscriber_v

create or replace view total_subscriber_v
as
(
 select * from subscriber where subscriber_type = 0
 union all
 select * from precheck_subscriber
 );
