DECLARE
    TYPE field_id_arr IS TABLE OF varchar2(20)  -- Associative array type
      INDEX BY pls_integer;

    TYPE field_value_arr IS TABLE OF varchar2(20)  -- Associative array type
      INDEX BY pls_integer;
  
    TYPE match_type_arr IS TABLE OF varchar2(20)  -- Associative array type
      INDEX BY pls_integer;

	fid field_id_arr ;
	fval field_value_arr ;
	fmt match_type_arr ;
	new_field_val varchar2(20000) ;
	new_mt varchar2(20000) ;
   	colval varchar2(20000) ; 
	i pls_integer ;
	cnt integer ;
	string_val varchar2(20) ;
    is_associated integer(2) ;
    mr_id integer(20) ;
    lk integer(20) ;
    mc_id integer(20) ;
    new_fid integer(20) ;
    rule_id_var integer(20) ;
    new_field_id varchar(512) ;
    delimiter_var varchar(512) ;
    record_conf_id integer(20) ;

  BEGIN
    -- Add new elements to associative array:
  
    FOR rec IN (SELECT * FROM matched_details) LOOP
		i := 0 ;
		for string_val in (select * from TABLE(SplitStringToColumns(rec.field_ids, '|'))) LOOP
			if string_val.column_value is null then
				fid(i) := -1 ;
			else
	  			fid(i) := string_val.column_value;
			end if ;
			i := i + 1 ;
		end loop ;
		cnt := i ;
		i := 0 ;
		for string_val in (select * from TABLE(SplitStringToColumns(rec.field_values, '|'))) LOOP
			if string_val.column_value is null then
				fval(i) := -1 ;
			else
				fval(i) := string_val.column_value;
			end if ;
			i := i + 1 ;
		end loop ;
		i := 0 ;
		for string_val in (select * from TABLE(SplitStringToColumns(rec.match_types, '|'))) LOOP
			if string_val.column_value is null then
				fmt(i) := -1 ;
			else
				fmt(i) := string_val.column_value;
			end if ;
			i := i + 1 ;
		end loop ;
		i := 0 ;

	   	mr_id := rec.matched_results_id ;

		select max(id) into rule_id_var from rules where key = (select rule_key from matched_results where id = mr_id) ;
	   	select nvl(record_config_id, 3) into record_conf_id from record_configs_rules where rule_id = rule_id_var ;

		select delimeter into delimiter_var from record_configs where id = record_conf_id ;

    	while i < cnt loop
			select instr(fid(i), '.') into is_associated from dual ;
			if is_associated > 0 then
				
				select field_id into new_fid from field_configs where record_config_id = record_conf_id and associated_field = fid(i) ;

				if new_field_id is null then
					new_field_id := new_fid ;
					new_field_val := fval(i) ;
					new_mt := fmt(i) ;
				else
   					new_field_id := new_field_id ||delimiter_var||new_fid ;
					new_field_val := new_field_val||delimiter_var||fval(i) ;
					new_mt := new_mt||delimiter_var||fmt(i) ;
				end if ;                      
			else                                                                                                                        
				select count(*) into new_fid from field_configs where record_config_id = record_conf_id and to_char(field_id) = fid(i) ;
				if new_fid > 0 then				
					if new_field_id is null then
						new_field_id := fid(i) ;
						new_field_val := fval(i) ;
						new_mt := fmt(i) ;
					else
						new_field_id := new_field_id||delimiter_var||fid(i) ;
						new_field_val := new_field_val||delimiter_var||fval(i) ;
						new_mt := new_mt||delimiter_var||fmt(i) ;
					end if ;
				end if ;
	   		end if ;
			i := i + 1 ;
		end loop ;
		---------------------Remove -1 update table------------------------
		new_field_id := new_field_id||delimiter_var ;
		new_field_val := new_field_val||delimiter_var ;
		new_mt := new_mt||delimiter_var ;
		---------------------------------------------------------------------------

		select replace(new_field_id,'-1','') into new_field_id from dual ;
		select replace(new_field_val,'-1','') into new_field_val from dual ;
		select replace(new_mt,'-1','') into new_mt from dual ;

		update matched_details set field_ids = new_field_id , FIELD_VALUES = new_field_val , MATCH_TYPES = new_mt where id = rec.id ;
		new_field_id := null ;
		new_field_val := null ;
		new_mt := null ;
	                                                                      --- while loop end
    END LOOP;
  END;                                                      ---- rec id end
  /
commit ;
