set feedback off ;
spool ranger-new-field-categories.log ;

--Granularity And Priority of Aggregation Types
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 2, 1, 1) ;

commit ;
spool off ;
QUIT ;

