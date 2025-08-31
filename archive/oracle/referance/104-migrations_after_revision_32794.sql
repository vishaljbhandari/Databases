spool migrations_after_revision_32794.log

DECLARE
        CURSOR exp_cursor IS 
		SELECT  id, expression_id from filter_tokens where filter_id = (select filter_id from filters_rules 
				where rule_id = (select id from rules where name = 'Set Is New Flag')) ;
        exp_row exp_cursor%ROWTYPE ;

		v_filter_id                 number(20,0);
BEGIN
        open exp_cursor;
        loop
            fetch exp_cursor  into exp_row ;
            exit when exp_cursor%NOTFOUND;

			delete from filter_tokens where id = exp_row.id ;
			delete from expressions where id = exp_row.expression_id ;

            commit ;
        end loop;

			select filter_id into v_filter_id from filters_rules where rule_id = (select id from rules where name = 'Set Is New Flag') ;

			insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.32', '0', 1024, 26) ;
			insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
										begin_group_ind, combining_operator, end_group_ind) 
				values (filter_tokens_seq.nextval, v_filter_id, expressions_seq.currval, null, null, null, null) ;
			insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 4) ;
			insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
										begin_group_ind, combining_operator, end_group_ind) 
				values (filter_tokens_seq.nextval, v_filter_id, expressions_seq.currval, null, null, 'OR', null) ;
			insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '1024', 1024, 5) ;
			insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
										begin_group_ind, combining_operator, end_group_ind) 
				values (filter_tokens_seq.nextval, v_filter_id, expressions_seq.currval, null, '(', 'OR', null) ;
			insert into expressions (id, left_field, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.35', '35', 1029, 7) ;
			insert into filter_tokens (id, filter_id, expression_id, contained_filter_id, 
										begin_group_ind, combining_operator, end_group_ind) 
				values (filter_tokens_seq.nextval, v_filter_id, expressions_seq.currval, null, null, 'AND', ')') ;



END;
/

commit ;

spool off;
quit;
