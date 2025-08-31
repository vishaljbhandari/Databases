--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2006. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written *
-- *	permission from Subex Azure Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/
SPOOL import-functions.log 
SET FEEDBACK OFF ;
set serveroutput off ;

create or replace function getDayCodebyDescription(description IN varchar2) return varchar2
is
	day_code varchar(8) ;
	begin
		select key into day_code from translations where tr_id = 52 and value = description ;
		return day_code ;
	exception when others then 
		return '' ;
end;
/

create or replace function getServiceCodebyDescription(service_description IN varchar2) return varchar2
is
	service_code varchar2(8) ;
	begin
		select code into service_code from service_categories where description = service_description ;
		return service_code ;
	exception when others then
		return '';
end;
/

create or replace function getKeybyValue(input_value IN varchar2, translationid IN number) return varchar2
is
	out_key varchar(8) ;
	begin
		select key into out_key from translations where tr_id = translationid and value = input_value ;
		return out_key ;
	exception when others then 
		return '' ;
end;
/

create or replace function getKeyStringbyValueString(input_value IN varchar2, translationid IN number, delimiter IN varchar2) return varchar2
is
	out_string_key varchar(128) ;
	curr_value varchar2(64) ;
	curr_key varchar2(64) ;
	i number(20) := 1 ;
	begin
		LOOP
			curr_value := split(input_value, i, ',') ;
			EXIT WHEN curr_value IS NULL ;
			begin
				select key into curr_key from translations where tr_id = translationid and value = curr_value ;
			exception when NO_DATA_FOUND
			then	
				null ;
			end;
			if i > 1
			then
				out_string_key := out_string_key||','||curr_key ;
			else
				out_string_key := curr_key ;
			end if;
			i := i + 1 ;
		end LOOP ;
		return out_string_key ;
	exception when others then 
		return '' ;
end;
/

create or replace function getIDbyNetworkDescription(in_description IN varchar2) return number
is
	network_id number(20) ;
	begin
		select id into network_id from networks where description = in_description ;
		return network_id ;
	exception when others then
			return 0;
					
end;
/
commit ;
