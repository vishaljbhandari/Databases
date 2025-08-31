set serveroutput on
set headding off echo off
set line size 300
set pages 0 long 999999
spool Nickname_migration.log

	DECLARE
		category		varchar(500);
		update_query	varchar(1000);
	BEGIN

		SELECT CATEGORY INTO category FROM FIELD_CATEGORIES WHERE name = 'Geographic Position';

		category := category || ' NICKNAME';

		update_query := 'UPDATE FIELD_CATEGORIES SET CATEGORY =''' || category || ''' WHERE name = ''Geographic Position'' ';

		execute immediate update_query ;

	END;
/


spool off;
commit;
quit;
