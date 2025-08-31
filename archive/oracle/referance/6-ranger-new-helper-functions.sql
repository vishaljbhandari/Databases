--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2006. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written *
-- *	permission from Subex Azure Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/

SPOOL ranger-new-helper-functions.log 
SET FEEDBACK OFF ;
set serveroutput off ;

@$DBScriptsFolder/comparecsv_procedure.sql
@$DBScriptsFolder/fieldutil.sql

CREATE OR REPLACE PACKAGE HelperFunctions
AS
	FUNCTION join (cursor_string sys_refcursor, delimiter varchar2 := ',' ) RETURN varchar2 ; 
END HelperFunctions;
/

CREATE OR REPLACE PACKAGE BODY HelperFunctions AS

	FUNCTION join(cursor_string sys_refcursor, delimiter varchar2 := ',') RETURN varchar2
	IS
		value 	varchar2(32767) ;
		output	varchar2(32767) ;
	BEGIN
		LOOP

       		FETCH cursor_string INTO value;
	        EXIT WHEN cursor_string%NOTFOUND;

        	IF output IS NOT NULL 
			THEN
            	output := output || delimiter ;
	        END IF ;
		
        	output := output || value;

	    END LOOP;

    	RETURN output ;

	END join ;

END HelperFunctions;
/


