alter table service_number_types add (STATUS number default 1 not null) ;


create table IM_RULES_REC_PARTICIPATED
(
 ID number(20) not null,
 AGGREGATION_TYPE number(20) not null,
 RULE_KEY number(20) not null,
 THRESHOLD_ID number(20) not null,
 COUNTER_DETAIL_ID number(20) not null,
 COUNTER_INSTANCE_ID number(20) not null,
 START_TIME date,
 END_TIME date,
 RECORDS_PARTICIPATED number(20)
);

create sequence IM_RULES_REC_PARTICIPATED_SEQ increment by 1 nomaxvalue minvalue 0 nocycle cache 20 order; 
