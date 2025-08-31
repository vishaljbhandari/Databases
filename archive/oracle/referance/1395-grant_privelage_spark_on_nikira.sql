set feedback off ;
set heading off ;
set pages 1000 ;
prompt Tables to grant access on nikira schema
spool grant_spark.sql ;
select 'grant all on ' || table_name || ' to public ;' from spark_synonym_maps ;
spool off ;
@grant_spark
host rm grant_spark.sql ;
prompt Tables to grant access on spark schema
spool grant_nikira.sql ;
select 'grant all on ' || TABLE_NAME || ' to public ; ' from user_synonyms ;
spool off ;
