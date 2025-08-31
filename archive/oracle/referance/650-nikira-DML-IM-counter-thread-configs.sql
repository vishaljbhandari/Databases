--@configure_input@
spool nikira-DML-IM-counter-thread-configs.sql.log
set feedback off;
set serveroutput off ;

delete from im_counter_thread_configs ;

DECLARE
    no_of_slaves number(10) ;
	slave_id number(10) ;

begin

		for im_counter_detail in (select id,COUNTER_INSTANCE_ID from in_memory_counter_details where SHM_ENABLED = 1 and DESCRIPTION != 'CUSTOMER NOTIFICATIONS') loop
			select NUMBER_OF_SLAVES into no_of_slaves from IN_MEMORY_COUNTER_DETAILS  
				where ID = im_counter_detail.id and COUNTER_INSTANCE_ID = im_counter_detail.COUNTER_INSTANCE_ID ; 

			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'MAP_SEGMENT_HASH_BUCKET_SIZE','5242880:1000000');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'SHM_GROW_RETRY_TOLERANCE','10');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'COMPRESSION_STATE_FOR_IM_CACHE','1:512');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'COMPRESSION_STATE_FOR_PR1_CACHE','0:512');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'COMPRESSION_STATE_FOR_PR2_CACHE','0:512');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'MIN_SIZE_FOR_PRSTORE_COMPRESSION','2048');
			insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'NO_OF_KEYS_TO_BE_CACHED_PER_SLAVE','10');

			for slave_id in 0..(no_of_slaves - 1) loop
				insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'IN_PROGRESS_TASKS_'|| slave_id,'0');
				insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'PR_ACTIVE_CACHE_KEY_SUFFIX_'|| slave_id,'0');
				insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'PR_SWEEP_STAGE_'|| slave_id,'1');
			end loop;
		end loop;
		for im_counter_detail in (select id from in_memory_counter_details where SHM_ENABLED = 1 and DESCRIPTION = 'CUSTOMER NOTIFICATIONS') loop
			select NUMBER_OF_SLAVES into no_of_slaves from IN_MEMORY_COUNTER_DETAILS where ID = im_counter_detail.id ; 
 
			insert into im_counter_thread_configs(counter_detail_id, COUNTER_INSTANCE_ID, config_key,value) values(im_counter_detail.id, 0,'MAP_SEGMENT_HASH_BUCKET_SIZE','5242880:1000000');
			insert into im_counter_thread_configs(counter_detail_id, COUNTER_INSTANCE_ID, config_key,value) values(im_counter_detail.id, 0,'SHM_GROW_RETRY_TOLERANCE','10');

			for slave_id in 0..(no_of_slaves - 1) loop
				insert into im_counter_thread_configs(counter_detail_id, COUNTER_INSTANCE_ID, config_key,value) values(im_counter_detail.id, 0,'IN_PROGRESS_TASKS_'|| slave_id,'0');
			end loop;
		end loop;
end ;

/

-- PR Sweep entries for profilemanager offline counter ids
DECLARE
    no_of_partitions_per_slave number(10) ;
	sl_id number(10) ;

begin
	for im_counter_detail in (select id,COUNTER_INSTANCE_ID from in_memory_counter_details where COUNTER_CATEGORY = 5 and DESCRIPTION != 'CUSTOMER NOTIFICATIONS' ) loop
		insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'NO_OF_KEYS_TO_BE_CACHED_PER_SLAVE','10');
		insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'MIN_SIZE_FOR_PRSTORE_COMPRESSION','2048');
		select number_of_partitions_per_slave into no_of_partitions_per_slave from IN_MEMORY_COUNTER_DETAILS  
			where ID = im_counter_detail.id and COUNTER_INSTANCE_ID = im_counter_detail.COUNTER_INSTANCE_ID  ;
		for sl_id in 0..(no_of_partitions_per_slave - 1) loop
				insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'PR_SWEEP_STAGE_'|| sl_id,'1');
		end loop;
	end loop;
end ;

/

-- PR Sweep entries for invalidsubscriber online counter 
DECLARE
    no_of_slaves number(10) ;
	sl_id number(10) ;

begin
	for im_counter_detail in (select id,COUNTER_INSTANCE_ID from in_memory_counter_details where COUNTER_CATEGORY = 6 and DESCRIPTION != 'CUSTOMER NOTIFICATIONS' ) loop
		select NUMBER_OF_SLAVES into no_of_slaves from IN_MEMORY_COUNTER_DETAILS  
			where ID = im_counter_detail.id and COUNTER_INSTANCE_ID = im_counter_detail.COUNTER_INSTANCE_ID  ;
		for sl_id in 0..(no_of_slaves - 1) loop
				insert into im_counter_thread_configs(counter_detail_id,COUNTER_INSTANCE_ID,config_key,value) values(im_counter_detail.id,im_counter_detail.COUNTER_INSTANCE_ID,'PR_SWEEP_STAGE_'|| sl_id,'1');
		end loop;
	end loop;
end ;

/
spool off ;
commit ;
