--/*******************************************************************************
	-- *    Copyright (c) Subex Azure Limited 2001. All rights reserved.               *
	-- *    The copyright to the computer program(s) herein is the property of Subex   *
	-- *    Azure Limited. The program(s) may be used and/or copied with the written   *
	-- *    permission from Subex Systems Limited or in accordance with the terms and  *
	-- *    conditions stipulated in the agreement/contract under which the program(s) *
	-- *    have been supplied.                                                        *
	-- *******************************************************************************/
SET SERVEROUTPUT ON ;
SET FEEDBACK ON ;
create or replace package ArchiveMigratePrecheckRecords
as
	PROCEDURE ArchiveMigrate  ;
	FUNCTION ResetStrings  return pls_integer ;
    current_matched_result_id	pls_integer := 0  ;
	field_ids_str		    	varchar2(2048) := ''  ;    	
	field_values_str			varchar2(2048)   ;	 
	match_types_str				varchar2(2048)   ;	 
	ret_val						pls_integer	 ;	
	current_matched_record		pls_integer  ;
	is_insertion_required		pls_integer  ;

end ArchiveMigratePrecheckRecords ;
/
show err ;
create or replace package body ArchiveMigratePrecheckRecords
as
	FUNCTION ResetStrings
	return pls_integer 
	is
	begin
		current_matched_result_id := 0 ;
		field_ids_str := '' ;
		field_values_str := '' ;
		match_types_str := '' ; 
		return 0 ;				
	end;

	PROCEDURE ArchiveMigrate 
	is
	begin
		ret_val := ResetStrings() ;
		FOR current_record in 
				(
				 select matched_results_id, matched_record, field_id, field_value, match_type
				 from 
				 archived_matched_details
				 order by matched_results_id
				)
		LOOP
				if current_matched_result_id = 0 
				then
					current_matched_result_id := current_record.matched_results_id ;
					field_ids_str :=  current_record.field_id ;
					field_values_str := current_record.field_value ;
					match_types_str := current_record.match_type ;
					current_matched_record := current_record.matched_record ;
					is_insertion_required := 1 ;
				elsif current_matched_result_id != current_record.matched_results_id 
				then
					field_ids_str := field_ids_str || '|' ;
					field_values_str := field_values_str || '|' ;
					match_types_str := match_types_str || '|' ;
					insert into	mig_archived_matched_details (matched_results_id, matched_record, field_ids, field_values, match_types) 
						values (current_matched_result_id, current_matched_record, field_ids_str,field_values_str, match_types_str) ;
					field_ids_str :=  current_record.field_id ;
					field_values_str := current_record.field_value ;
					match_types_str := current_record.match_type ;
					current_matched_record := current_record.matched_record ;
					current_matched_result_id := current_record.matched_results_id ;
				else
					field_ids_str := field_ids_str || '|' || current_record.field_id ;
					field_values_str := field_values_str || '|' ||current_record.field_value ;
					match_types_str := match_types_str || '|' ||current_record.match_type ;
					current_matched_record := current_record.matched_record ;
					current_matched_result_id := current_record.matched_results_id ;
				end if ;
		END LOOP ;
		field_ids_str := field_ids_str || '|' ;
		field_values_str := field_values_str || '|' ;
		match_types_str := match_types_str || '|' ;
		if is_insertion_required = 1
		then
			insert into	mig_archived_matched_details (matched_results_id, matched_record, field_ids, field_values, match_types) 
				values (current_matched_result_id, current_matched_record, field_ids_str,field_values_str, match_types_str) ;
		end if ;		
	end ;
end ArchiveMigratePrecheckRecords ;	
/
show err ;

