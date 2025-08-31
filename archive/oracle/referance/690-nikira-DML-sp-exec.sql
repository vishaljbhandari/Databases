spool nikira-DML-sp-exec.log 
set feedback off ;
set serveroutput off ;

insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(2, '4,2,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(3, '3') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(4, '4,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(7, '7,4,2,54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(14, '14') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(54, '54') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(213, '213') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(214, '214,213') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(225, '225') ;

delete from configurations where config_key='SP_BLOCK_ALERTS_SEQ_INCREMENT' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SP_BLOCK_ALERTS_SEQ_INCREMENT', '1');

delete from configurations where config_key='SP_BLOCK_ALERTS_RAW_COLUMNS_COUNT' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SP_BLOCK_ALERTS_RAW_COLUMNS_COUNT', '2');

delete from configurations where config_key='SMART_PATTERN_THREAD_QUEUE_SIZE' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_THREAD_QUEUE_SIZE', '200');

delete from configurations where config_key='SMART_PATTERN_ALERTS_PER_TRANSATION' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_ALERTS_PER_TRANSATION', '1');

delete from configurations where config_key='SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS' ;
insert into configurations(id, config_key, value)
	values(configurations_seq.nextval, 'SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS', '30');

commit ;
