spool nikira-DML-agg-type-nrtrde-gprs-vpmn.log
set feedback off ;
set serveroutput off ;

DECLARE
        rec_conf_ids varchar(10);
BEGIN
        select RECORD_CONFIG_IDS into rec_conf_ids from aggregation_types where description = 'VPMN' and id = 200;
        if rec_conf_ids is NULL
        then
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || '7'  where description = 'VPMN' and id = 200;
        else
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',7'  where description = 'VPMN' and id = 200;
        end if ;
		commit ;

END ;
/
commit ;

