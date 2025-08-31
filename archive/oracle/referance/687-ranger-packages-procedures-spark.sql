--set feedback off ;
spool ranger-packages-procedures.log
set serverout on;
@fieldutil_spark.sql
@summary_package_spark.sql
@comparecsv_procedure.sql
@ranger-spark-procedures.sql
@utility_package-spark.sql
commit ;

