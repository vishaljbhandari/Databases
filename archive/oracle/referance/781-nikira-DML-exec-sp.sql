spool nikira-DML-exec-sp.log
set feedback off ;
set serveroutput off ;

--delete from sp_rule_relations ;
--
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(2, 7, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(7, 2, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(7, 7, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(4, 7, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(7, 4, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(4, 2, 2, 2) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(2, 4, 2, 2) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(2, 2, 2, 2) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(4, 4, 4, 4) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(3, 3, 3, 3) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(14, 14, 14, 14) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(213, 213, 213, 213) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(2, 54, 2, 2) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(54, 2, 2, 2) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(7, 54, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(54, 7, 7, 7) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(4, 54, 4, 4) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(54, 4, 4, 4) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(54, 54, 54, 54) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(44, 44, 44, 44) ; 
--insert into sp_rule_relations(source_aggregation, dest_aggregation, src_output_relation_id, dest_input_relation_id) values(225, 225, 225, 225) ; 
--
--delete from sp_relation_priorities ;
--
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 2, 1, 1) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 4, 1, 2) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 7, 1, 3) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 54, 1, 4) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 3, 2, 1) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 14, 3, 1) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 213, 4, 1) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 44, 1, 4) ;
--insert into sp_relation_priorities(id, relation_id, group_id, priority) values(sp_relation_priorities_seq.nextval, 225, 1, 1) ;

delete from configurations where config_key='SP_COUNTER_IDIncrement' ;
delete from configurations where config_key='SP_ALERT_DATA_IDIncrement' ;

insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'SP_COUNTER_IDIncrement', '1');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'SP_ALERT_DATA_IDIncrement', '1');

commit ;

