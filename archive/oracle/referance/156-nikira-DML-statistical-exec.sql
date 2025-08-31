spool nikira-DML-statistical-exec.log
set feedback off;
set serveroutput off ;

-- Statistical Rule Evaluator
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Statistical Rule Evaluator',
'statistical_rule_evaluator/stats_rule_orchestrator.rb,StatisticalRuleEvaluatorPID', 0, 0) ;

spool off ;
commit ;

