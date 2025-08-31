--/*******************************************************************************
-- * Copyright (c) Subex Systems Limited 2009. All rights reserved.	             *
-- * The copyright to the computer program(s) herein is the property of Subex    *
-- * Systems Limited. The program(s) may be used and/or copied with the written  *
-- * permission from Subex Systems Limited or in accordance with the terms and   *
-- * conditions stipulated in the agreement/contract under which the program(s)  *
-- * have been supplied.                                                         *
-- *******************************************************************************/
SPOOL between_operator.log
SET SERVEROUTPUT ON 
SET FEEDBACK OFF

    drop table filter_tokens_bak ;
    CREATE TABLE FILTER_TOKENS_BAK AS SELECT * FROM FILTER_TOKENS ;

CREATE OR REPLACE PROCEDURE BetweenOperator AS
	RightField1					VARCHAR(20);
	RightField2					VARCHAR(20);
	RightField					varchar(500) ;
	LeftField					varchar(500) ;
	RightFieldIndicator				number(20) ;
	OperatorId					number(20) ;
	ExpressionID					number(20) ;
	Priority					number(20) ;

    CURSOR filters_with_between_op IS
	    SELECT  distinct filter_id
	    FROM    filter_tokens_bak ft, expressions e, filters f
	    WHERE   f.id = ft.filter_id AND e.id = ft.expression_id AND e.OPERATOR_ID =10 ;
	
    CURSOR fetch_filter_tokens (FilterId number) IS
		SELECT  id, filter_id, contained_filter_id, system_filter, begin_group_ind, combining_operator, end_group_ind, expression_id 
		FROM    filter_tokens_bak ftb
		WHERE   ftb.filter_id = FilterId
		ORDER BY ftb.id ;
   filtertokencursor fetch_filter_tokens%ROWTYPE;

BEGIN
	
	   <<OUTER_LOOP>>
    FOR Filter IN filters_with_between_op LOOP

	    open fetch_filter_tokens(Filter.filter_id) ;
	    
	   <<INNER_LOOP>>
            loop
	    filtertokencursor := null ;
	    FETCH fetch_filter_tokens INTO filtertokencursor ;

	    if (filtertokencursor.id is null)
	    then 
		 exit INNER_LOOP ;
	    end if ;
		
	    if (filtertokencursor.expression_id is null)
	    then
		INSERT INTO filter_tokens(id, filter_id, expression_id, contained_filter_id, system_filter, begin_group_ind, end_group_ind, combining_operator) values(filter_tokens_seq.nextval, filtertokencursor.filter_id, null, filtertokencursor.contained_filter_id, filtertokencursor.system_filter, filtertokencursor.begin_group_ind, filtertokencursor.end_group_ind, filtertokencursor.combining_operator) ;
	    else
		    SELECT  e.id, left_field, right_field, right_field_indicator,operator_id, priority 
		    INTO    ExpressionID, LeftField, RightField, RightFieldIndicator, OperatorId, Priority	
		    FROM    expressions e WHERE id = filtertokencursor.expression_id ;

		    if ( OperatorId = 10 )
		    then
			RightField1 := Split(RightField, 1, ',') ;
			RightField2 := Split(RightField, 2, ',') ;

			INSERT INTO expressions(id, left_field, right_field, right_field_indicator, operator_id, priority, is_between_operator ) VALUES ( expressions_seq.nextval, LeftField, RightField1 , RightFieldIndicator, 2, Priority, 1);

			INSERT INTO filter_tokens(id, filter_id, expression_id, contained_filter_id, system_filter, begin_group_ind, end_group_ind, combining_operator) values(filter_tokens_seq.nextval, filtertokencursor.filter_id, expressions_seq.currval, filtertokencursor.contained_filter_id, filtertokencursor.system_filter, filtertokencursor.begin_group_ind, null, filtertokencursor.combining_operator) ;
			 
			INSERT INTO expressions(id, left_field, right_field, right_field_indicator, operator_id, priority, is_between_operator ) VALUES ( expressions_seq.nextval, LeftField, RightField2, RightFieldIndicator, 3, Priority, 1);

			INSERT INTO filter_tokens(id, filter_id, expression_id, contained_filter_id, system_filter, begin_group_ind, end_group_ind, combining_operator) values(filter_tokens_seq.nextval, filtertokencursor.filter_id, expressions_seq.currval, filtertokencursor.contained_filter_id, filtertokencursor.system_filter, null, filtertokencursor.end_group_ind, 'AND') ;
		    else
			INSERT INTO expressions(id, left_field, right_field, right_field_indicator, operator_id, priority, is_between_operator ) VALUES ( expressions_seq.nextval, LeftField, RightField, RightFieldIndicator, OperatorId, Priority, 0);

			INSERT INTO filter_tokens(id, filter_id, expression_id, contained_filter_id, system_filter, begin_group_ind, end_group_ind, combining_operator) values(filter_tokens_seq.nextval, filtertokencursor.filter_id, expressions_seq.currval, filtertokencursor.contained_filter_id, filtertokencursor.system_filter, filtertokencursor.begin_group_ind, filtertokencursor.end_group_ind, filtertokencursor.combining_operator) ;
		    end if ;

		    delete from filter_tokens where id = filtertokencursor.id ;	
		    delete from expressions where id = filtertokencursor.expression_id ;
	    end if;
	    delete from filter_tokens where id = filtertokencursor.id ;	
	    commit ;

	    end loop ;
    	    close fetch_filter_tokens ;

    END LOOP;
    execute immediate 'drop table filter_tokens_bak' ;
 

END;
/

SHOW ERROR ;

spool off;

commit ;
/
