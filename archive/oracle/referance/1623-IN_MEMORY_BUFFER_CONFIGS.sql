spool IN_MEMORY_BUFFER_CONFIGS.log



---------------------------insert statements ---------------
insert into IN_MEMORY_BUFFER_CONFIGS(pr_index_write_buffer_size,im_dump_read_buffer_size,pr_delta_read_ahead_count,im_dump_write_buffer_size,pr_index_read_buffer_size,counter_detail_id,counter_instance_id,pr_store_read_buffer_size,pr_store_write_buffer_size) values (16384,16384,16384,16384,16384,1045,0,16384,16384);
spool off ;
