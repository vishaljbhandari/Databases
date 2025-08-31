spool nikira-DML-dashboard-exec.sql.log
set feedback off;
set serveroutput off ;

insert into scheduler_command_maps (job_name,command,is_parameter_required,is_network_based,report_file_name,machine_id,is_mandatory) values ('Dashboard Log','dashboard_logs.sh,DashboardLogsPid',0,0,null,null,1);

spool off ;
commit ;


