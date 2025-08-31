--DDL changes--
alter table payments add (
	is_slippage             NUMBER(10),
        slippage                NUMBER(10),
        is_part_payment         NUMBER(10),
        is_full_payment         NUMBER(10)
) ;

CREATE SEQUENCE unbilled_seq INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE unbilled
(
        id                      NUMBER(10) NOT NULL,
        account_id              NUMBER(10) NOT NULL ,
        unbilled_amount         NUMBER(20, 4),
        CONSTRAINT pk_unb_id PRIMARY KEY(id)
) ;
CREATE INDEX ix_unb_id ON unbilled(account_id) ;


--Unbilled Feed--
INSERT INTO feeds(id, name, feed_type,poll_directory,entity_name, filter_priority) VALUES (2, 'Unbilled', 0, '@prefix@/data/unbilled','Unbilled', 4) ;

--Invoice input field position change for "invoice_number"
update field_configuration set input_field_position = 7 where id = 42 ; 

--Payment - additional fields
INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, possible_values, display_index) VALUES (31, 'payments', 'is_slippage', 'Is Slippage', 1, 9, 1, 1, 3, '0:Not Slipped, 1:Slipped', 9) ;
INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, display_index)
        VALUES (32, 'payments', 'slippage', 'Slippage', 1, 10, 1, 1, 3, 10) ;
INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, possible_values, display_index)VALUES (33, 'payments', 'is_part_payment', 'Is Part Payment', 1, 11, 1, 1, 3, '0:No, 1:Yes', 11) ;
INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, possible_values, display_index)VALUES (34, 'payments', 'is_full_payment', 'Is Full Payment', 1, 12, 1, 1, 3, '0:No, 1:Yes', 12) ;
--Payment - profile_field_inputs
INSERT INTO profile_field_inputs (id, level_id, field_configuration_id) VALUES (profile_field_inputs_seq.nextval, 1, 31) ;
INSERT INTO profile_field_inputs (id, level_id, field_configuration_id) VALUES (profile_field_inputs_seq.nextval, 1, 33) ;
INSERT INTO profile_field_inputs (id, level_id, field_configuration_id) VALUES (profile_field_inputs_seq.nextval, 1, 34) ;

--Feed ID 2 : Unbilled
INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, display_index)
        VALUES (62, 'unbilled', 'unbilled_amount', 'Unbilled Amount', 2, 2, 1, 1, 2, 2) ;

INSERT INTO field_configurations (id, table_name, column_name, name, data_type, input_field_position, is_filter, is_visible, feed_id, is_key_field, display_index)  VALUES (61, 'unbilled', 'account_id', 'Account ID', 1, 1, 0, 0, 2, 1, 1) ;
--Unbilled - profile_field_inputs
INSERT INTO profile_field_inputs (id, level_id, field_configuration_id) VALUES (profile_field_inputs_seq.nextval, 1, 62) ;

--Profile Fields

--Number of Full Payments = sum(payment.is_full_payment)
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('512','Number Of Full Payments',null,'1','34',null,'1','1','1','512',null,'0');

--Number of Part Payments = sum(payment.is_part_payment)
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('513','Number Of Part Payments',null,'1','33',null,'1','1','1','513',null,'0');

--Number of Slippages = sum(payment.is_slippage)
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('514','Number Of Slippages',null,'1','31',null,'1','1','1','514',null,'0');

--Last Paid Date = payment.payment_date 
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('509','Last Paid Date',null,'3','29',null,'1',null,'1','509',null,'0');

--Bill Cycle = subscriber.bill_cycle_day
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('510','Bill Cycle',null,'1','113',null,'1',null,'1','510',null,'0');

--Last Due Date = invoice.due_date 
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('511','Last Due Date',null,'4','39',null,'1',null,'1','511',null,'0');

--Unbilled Amount = unbilled.unbilled_amount
Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('508','Unbilled Amount',null,'2','62',null,'1',null,'1','508',null,'0');


--Percentage Exposure = ((Unbilled Amount + Outstanding Amount) / (Static Credit Limit + Dynamic Credit Limit))*100

Insert into expressions (ID,STRING) VALUES ('515',null);
Insert into expressions (ID,STRING) VALUES ('516',null);

Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('522','516','2','16','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('523','516','2','16','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('524','516','0','508','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('525','516','2','1','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('526','516','0','505','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('527','516','2','17','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('528','516','2','4','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('529','516','2','16','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('530','516','0','506','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('531','516','2','1','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('532','516','0','507','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('533','516','2','17','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('534','516','2','17','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('535','516','2','3','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('536','516','5','100','1');

Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('517','Percentage Exposure',null,'2',null,null,'1',null,'1','517','516','0');

Insert into profile_field_conditions (ID,PROFILE_FIELD_ID,CONDITION_NAME,CONDITION_ID,EXPRESSION_NAME,EXPRESSION_ID) VALUES ('506','517','Default','515','Default Expression','516');

--Exposure = Unbilled Amount + Outstanding Amount - Static Credit Limit - Dynamic Credit Limit
Insert into expressions (ID,STRING) VALUES ('517',null);
Insert into expressions (ID,STRING) VALUES ('518',null);

Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('537','518','0','508','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('538','518','2','1','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('539','518','0','505','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('540','518','2','2','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('541','518','0','506','2');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('542','518','2','2','0');
Insert into expression_tokens (ID,EXPRESSION_ID,TOKEN_TYPE,VALUE,DATA_TYPE) VALUES ('543','518','0','507','2');

Insert into profile_fields (ID,NAME,DESCRIPTION,DATA_TYPE,FIELD_CONFIGURATION_ID,PROFILE_FIELD_ID,LEVEL_ID,AGGREGATOR_ID,IS_ACTIVE,INTERNAL_ID,EXPRESSION_ID,PF_TYPE) VALUES ('518','Exposure',null,'2',null,null,'1',null,'1','518','518','0');

Insert into profile_field_conditions (ID,PROFILE_FIELD_ID,CONDITION_NAME,CONDITION_ID,EXPRESSION_NAME,EXPRESSION_ID) VALUES ('507','518','Default','517','Default Expression','518');

commit ;
