spool nikira-DML-field-categories-recharge.log
set feedback off ;
set serveroutput off ;

-- RECHARGE_TYPE
insert into field_categories(id, name, category, data_type) values(2077, 'Recharge Type', '', 1);

-- For Credit Card
insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id, maskable_positions, is_maskable) values(218, 'Credit Card', '', 3, 5, '218', '0,1,2,3', 1);

-- Serial Number
insert into field_categories (name,category,regular_expression_id,data_type,id,maskable_positions,common_category_id,is_maskable) values ('Serial Number','NICKNAME','7','3','6016','','','') ;

--- PIN
insert into field_categories (name,category,regular_expression_id,data_type,id,maskable_positions,common_category_id,is_maskable) values ('PIN Number','NICKNAME','7','3','6017','','','') ;

---- Action Type
insert into field_categories (name,category,regular_expression_id,data_type,id,maskable_positions,common_category_id,is_maskable) values ('Action Type','','','3',6020,'','','') ;

insert into translation_indices(id, description) values (17,'Recharge Type') ;
insert into translation_indices(id, description) values (98,'Recharge Type for Recharge Log View') ;



insert into translations(id, tr_id, key, value) values(53, 17, '1', 'Voucher Recharge');
insert into translations(id, tr_id, key, value) values(54, 17, '2', 'Manual Recharge');
-- translations for tr_id = 98 (Recharge Type for Recharge Log View)
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '1', 'Voucher Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '2', 'Manual Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '3', 'Electronic Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '4', 'Reversal Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '5', 'Unknown Recharge') ;


-- translations for tr_id = 17 (Recharge Type)
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 17, '3', 'Electronic Recharge') ;

-- Action Type
insert into translation_indices (sort_on,id,description,is_dynamic) values ('','1559','Action Type','0') ;
insert into translations (id,value,key,tr_id) values (translations_seq.nextval,'Received','2','1559') ;
insert into translations (id,value,key,tr_id) values (translations_seq.nextval,'Transferred','1','1559') ;

commit ;

