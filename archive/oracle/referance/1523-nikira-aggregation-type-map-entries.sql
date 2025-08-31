set feedback off ;
spool ranger-new-field-categories.log ;

--Granularity And Priority of Aggregation Types
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 1000, 1, 1) ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 1001, 1, 1) ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 1002, 1, 1) ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 1003, 1, 1) ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 1004, 1, 2) ;

commit ;
QUIT ;

