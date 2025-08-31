spool nikira-DML-non_partition_specific_entries.log
set feedback off ;
set serveroutput off ;

update counter_details set NO_OF_PARTITIONS = 1 where TABLE_NAME = 'RTF_ONDEMAND_COUNTER'; 
update counter_details set NO_OF_PARTITIONS = 1 where TABLE_NAME = 'RTF_OFFLINE_COUNTER'; 
update counter_details set NO_OF_PARTITIONS = 1 where TABLE_NAME = 'CDR_COUNTER'; 
update counter_details set NO_OF_PARTITIONS = 1 where TABLE_NAME = 'PROFILE_COUNTER'; 

update dbwriter_configurations set max_recs_per_subpartition = 1000, max_subpartitions = 2, reserved_subpartitions = '22,23' where id = 2 ;
update dbwriter_configurations set max_recs_per_subpartition = 1000, max_subpartitions = 2, reserved_subpartitions = '22,23' where id = 3 ;
update dbwriter_configurations set max_recs_per_subpartition = 1000, max_subpartitions = 2, reserved_subpartitions = '22,23' where id = 7 ;
update dbwriter_configurations set max_recs_per_subpartition = 1000, max_subpartitions = 2, reserved_subpartitions = '22,23' where id = 1 ;

update record_configs set is_partitioned = 0 where id = 83 ; 
update record_configs set is_partitioned = 0 where id = 7 ; 
update record_configs set is_partitioned = 0 where id = 2 ; 
update record_configs set is_partitioned = 0 where id = 1 ; 

update dbwriter_configurations set max_recs_per_subpartition = 1 where id = 4 ;
update dbwriter_configurations set max_recs_per_subpartition = 1 where id = 5 ;
update dbwriter_configurations set max_recs_per_subpartition = 1 where id = 6 ;

commit ;

