
CREATE OR REPLACE PACKAGE CleanupAte
AS
    Number_Of_Versions				number(10,0) ;
    Number_Of_Days					number(10,0) ;
	min_version_allowed				number(10, 0) ;
	type aggregation_look_back_type is table of date index by varchar2(30);
    aggregation_look_back aggregation_look_back_type ;

	procedure Initialize ;
	procedure DeleteAllRecords ;
end CleanupAte ;
/
show error;

create or replace package body CleanupAte
as

procedure Initialize
is
begin
	select to_number(value) into Number_Of_Versions from configurations where config_key = 'CLEANUP.ATE.NUMBER_OF_VERSIONS_TO_RETAIN' ;
	select to_number(value) into Number_Of_Days from configurations where config_key = 'CLEANUP.ATE.NUMBER_OF_DAYS_TO_RETAIN' ;
end Initialize ;

procedure DeleteAllRecords
is
begin

	for ate_config in (select last_run_ref_time, entity_type from ate_counter_configs)
	loop
		aggregation_look_back(to_char(ate_config.entity_type)) := ate_config.LAST_RUN_REF_TIME ;
	end loop ;
	
	--Delete off the old thresholds based on look back entry
	for ate in 
	(	
		select 
		 	at.aggregation_value, at.reference_id, max(at.modified_date) as latest_updated_date, t.aggregation_type, r.is_active as enabled_rule, at.threshold_id as threshold_id
		from 
		 	auto_thresholds at, thresholds t, rules r 
		where 
		 	t.id = at.threshold_id and 
			r.key = t.rule_key and
			r.version = t.rule_version
		group by at.aggregation_value, at.reference_id, t.aggregation_type, r.is_active, at.threshold_id
	)
    loop
		if (ate.latest_updated_date < (aggregation_look_back(to_char(ate.aggregation_type)) - Number_Of_Days) or (ate.enabled_rule <> 1))
		then
			delete from auto_thresholds where aggregation_value = ate.aggregation_value and reference_id = ate.reference_id and threshold_id = ate.threshold_id ;
			delete from archived_thresholds where aggregation_value = ate.aggregation_value and reference_id = ate.reference_id and threshold_id = ate.threshold_id ;
		end if ;
    end loop ;

	--Delete off the old thresholds based on number of versions to be maintained
	for ar_ate in 
	(	
		select 
		 	at.aggregation_value, count(at.aggregation_value) as number_of_versions, t.aggregation_type, at.reference_id, at.threshold_id as threshold_id, max(threshold_version) as max_version, t.is_active as active_threshold
		from 
		 	archived_thresholds at, thresholds t
		where 
		 	t.id = at.threshold_id
		group by 
			at.threshold_id, at.aggregation_value, t.aggregation_type, at.reference_id, t.is_active
	)
    loop
		if (ar_ate.active_threshold <> 1)
		then
			delete from archived_thresholds where aggregation_value = ar_ate.aggregation_value and reference_id = ar_ate.reference_id and threshold_id = ar_ate.threshold_id ;
		end if ;

		if (ar_ate.number_of_versions > Number_Of_Versions)
		then
			min_version_allowed := ar_ate.max_version - Number_Of_Versions + 1 ;
			delete from archived_thresholds where aggregation_value = ar_ate.aggregation_value and reference_id = ar_ate.reference_id and threshold_id = ar_ate.threshold_id and threshold_version <= min_version_allowed ;
		end if ;
    end loop ;

end DeleteAllRecords ;

end CleanupAte;
/
show error;
