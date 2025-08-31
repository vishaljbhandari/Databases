set feedback off ;
set serveroutput on ;
spool Migration_after_7.4.log


--<START>
	--	Files		:   utility_package.sql.parse.in
	--	Bug Details	:   Bug 36493 -  DB2 -Exporting the data to CSV/ PDF/Word/Text is not working and throws error.
	
	--	Comments 	:   Utilitiy Package dynamic cursor implementation changed
	--	                Mask functions is not working becuase of wrong signature of procedure
	
	--	Impacts		:   Nil	
	--	Patches		:

	
	@ ../utility_package.sql
	
--<END>

--<START>
	--	Files		:   nikira-DML-new-record-config.sql
	--	Bug Details	:   38425
	--	Comments 	:   Archive alarm not working in DB2, Archive alarm history not working in DB2
	--	Impacts		:   Nil	
	--	Patches		:	
update record_view_configs set where_clause = 'MODIFIED_DATE < ((select trunc(to_date(value, ''YYYY/MM/DD HH24:MI:SS'')) from configurations  where config_key=''CLEANUP.ALARMS.LAST_RUN_DATE'') - (select to_number(value) from configurations where config_key= ''CLEANUP.ALARMS.INTERVAL_IN_DAYS''))' where name = 'Archived Alarms' ;

update record_view_configs set where_clause = 'MODIFIED_DATE < ((select trunc(to_date(value, ''YYYY/MM/DD HH24:MI:SS'')) from configurations  where config_key=''CLEANUP.ALARMS.LAST_RUN_DATE'') - (select to_number(value) from configurations where config_key= ''CLEANUP.ALARMS.INTERVAL_IN_DAYS''))' where id=119 and name = 'Archived History Alarms' ;
--<END>

--<START>
	--	Files		: 	dbutils.sql.parse.in, nikira-DDL-db.sql.parse.in, cleanup_package.sql.parse.in, DBFunctions/util.c
	--	Comments 	:   Cleanup modified to work with DB2 (Make sure that latest libdbfunctions.so* is used)
	--	Impacts		:   Nil	
	--	Patches		:	


	@ ../dbutils.sql
	@ ../cleanup_package.sql
	@ ../precheck_field_info.sql
--<END>

--<START>
	--	Files		: 	generateRTFEntitySummary.sql.parse.in	
	--	Comments 	:  	Added WaitForDetach call after Detach (done for DB2)
	--	Impacts		:   Nil	
	--	Patches		:	

	@ ../generateRTFEntitySummary.sql
--<END>

--<START>

	--	Files		:   cdr_summary_package.sql.parse.in	
	--	Comments 	:  	UT Fix for cdr summary package
	--	Impacts		:   Nil	
	--	Patches		:	

	@ ../cdr_summary_package.sql

--<END>

--<START>

	--	Files		:   nikira-DML-help-files.sql	
	--	Comments 	:   Help files integrated for NRTRDE Partners addition
	--	Impacts		:   Nil	
	--	Patches		:	

	insert into help_files_maps values (help_files_maps_seq.nextval,'NRTRDE_PARTNER_CREATE','add_nrtrde_partner_rv.htm') ;

--<END>


--<START>
	--	Files		:   summary_package.sql.parse.in cdr_summary_package.sql.parse.in pkg_country.sql.parse.in highriskdestination_summary_procedure.sql.parse.in
	--	Comments 	:  	Modifications to work with DB2 
	--	Impacts		:   Nil	
	--	Patches		:	

	@ ../summary_package.sql
	@ ../cdr_summary_package.sql
	@ ../pkg_country.sql
	@ ../highriskdestination_summary_procedure.sql
--<END>


--<START>

	--	Files		:   nikira-DML-reports-exec.sql 
	--	Comments 	:   Alarm Detail Report from closed case view is throwing fatal error 
	--	Impacts		:   Nil	
	--	Patches		:	

	insert into record_view_configs_reports(record_view_config_id,report_id) (select 50, id from reports where name='AlarmDetails') ;

--<END>

