spool migration_after_7.0.2.0_dashboard.log

update CHART set CHR_DESCRIPTION = 'Last files loaded into system by individual data stream.' where CHR_ID = 98;

commit;
quit;
/
