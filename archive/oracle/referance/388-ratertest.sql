whenever sqlerror exit 5;
whenever oserror exit 5;
set feedback off;
@dynamicscript.sql
commit;
exit;
