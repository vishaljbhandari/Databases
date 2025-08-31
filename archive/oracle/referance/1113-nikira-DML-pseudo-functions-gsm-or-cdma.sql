spool nikira-DML-functions-gsm-or-cdma.log ;
set feedback off;
set serveroutput off ;
DECLARE
	is_gsm_selected number(20);
	is_cdma_selected number(20);
	BEGIN
		select value into is_gsm_selected from configurations where config_key = 'INSTALLATION.GSM' ; 
		select value into is_cdma_selected from configurations where config_key = 'INSTALLATION.CDMA' ; 
		if (is_gsm_selected = 1 or is_cdma_selected = 1) then
			insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (9, 'Velocity', null, 4, 45) ;
			insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (15, 'Call Collision', null, 7, 12) ;
		end if ;
END ;
/		

commit ;

