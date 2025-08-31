spool nikira-DDL-summary_tables.log
set feedback off ;
set serveroutput off ;


create table investigated_record
(
	network_id				number(16),
	type_id					number(8),
	week					number(8),
	geographic_position		varchar2(32),
	country_code			varchar2(32),
	record_count			number(16)
) ;

create table temp_highrisk_dest_summary
(
 	network_id						number(20),
	type_id							number(20),
	week							number(20),
	geographic_position    			varchar2(40),
	country_code					varchar2(40), 
	total_value						number(16,6),
	total_duration					number(20),
	total_frd_cdr_count				number(20),
	total_alert_count				number(20),
	total_callers					number(20)
) ;
commit ;

