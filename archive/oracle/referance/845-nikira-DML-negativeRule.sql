spool nikira-DML-negativeRule.log
set feedback off ;
set serveroutput off ;

delete from field_record_config_maps where field_category_id in (205, 206, 207, 208, 209, 210, 211) ;
delete from  expandable_field_maps where id in (136, 137, 138, 139) ;

-- For Profiled Entity Categories
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
	values (field_record_config_map_seq.nextval, 212, 3, '32') ;

insert into field_categories(id, name, category, data_type, regular_expression_id) 
	values(205, 'IMSI - Query Rule', 'NEGATIVE_RULE_AGG_TYPE', 3, 3);

insert into field_categories(id, name, category, data_type, regular_expression_id) 
	values(206, 'Account Name - Query Rule', 'NEGATIVE_RULE_AGG_TYPE', 3, 8);

--insert into field_categories(id, name, category, data_type) 
--	values(207, 'Subscriber ID', 'NEGATIVE_RULE_AGG_TYPE', 1);

----

insert into field_categories(id, name, category, data_type, regular_expression_id) 
	values(208, 'IMSI-To-PhoneNumber', '', 3, 1);

insert into field_categories(id, name, category, data_type) 
	values(209, 'IMSI-To-SubscriberID', '', 1);

insert into field_categories(id, name, category, data_type) 
	values(210, 'AccountName-To-AccountID', '', 1);

insert into field_categories(id, name, category, data_type, regular_expression_id) 
	values(211, 'SubscriberID-To-PhoneNumber', '', 3, 1);

----

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) 
	values (reference_types_maps_seq.nextval, 205, 1, 208, 209) ;

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) 
	values (reference_types_maps_seq.nextval, 206, 3, 206, 210) ;

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) 
	values (reference_types_maps_seq.nextval, 207, 1, 211, 207) ;

--

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (136, 'NegativeRuleData-Phonenumber-Subscriber', 61, 'AGGREGATION_VALUE', 21, 'PHONE_NUMBER', 
								0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (137, 'NegativeRuleData-IMSI-Subscriber', 61, 'AGGREGATION_VALUE', 21, 'IMSI', 0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (138, 'NegativeRuleData-AccountName-Account', 61, 'AGGREGATION_VALUE', 4, 'ACCOUNT_NAME', 
							0, 2, 'RECORD_VIEW');

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) 
						values (139, 'NegativeRuleData-SubscriberID-Susbcriber', 61, 'AGGREGATION_VALUE', 21, 'ID', 
							0, 2, 'RECORD_VIEW');

-- Entries for Negative Rule Data Record --

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 2, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 3, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 4, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 5, 50, '3') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 7, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 14, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 16, 50, '136.32') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 24, 50, '138.19') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 45, 50, '5') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 200, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 202, 50, '4') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 205, 50, '2') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 206, 50, '2') ; 

--insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		--values (field_record_config_map_seq.nextval, 207, 50, '139.32') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 208, 50, '137.12') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 209, 50, '137.32') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 210, 50, '138.19') ; 

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 211, 50, '139.12') ; 
--DUMMY
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 29, 50, '136.22') ; 

--DUMMY
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) 
		values (field_record_config_map_seq.nextval, 203, 50, '136.5.20') ; 

insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) 
		values (aggre_types_map_seq.nextval, 205, 0, null, 3) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) 
		values (aggre_types_map_seq.nextval, 206, 0, null, 3) ;
--insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) 
		--values (aggre_types_map_seq.nextval, 207, 0, null, 3) ;

commit ;

