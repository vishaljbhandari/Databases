update field_configs set reg_exp_id = 13, data_type = 1 where id between 23 and 39 and id not in (25, 30) ;
update field_configs set data_type = 3, translation_id = null, reg_exp_id = 0 where id = 41 ;


alter table cdr add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table cdr drop column OP_BILLED_PHONE_NUMBER ;
alter table cdr  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_0 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_0 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_0  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_1 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_1 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_1  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_2 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_2 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_2  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_3 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_3 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_3  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_4 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_4 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_4  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_5 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_5 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_5  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_6 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_6 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_6  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_7 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_7 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_7  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_8 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_8 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_8  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_9 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_9 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_9 rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_10 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_10 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_10  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_11 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_11 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_11  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_12 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_12 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_12  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_13 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_13 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_13  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_14 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_14 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_14  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_15 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_15 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_15  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_16 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_16 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_16  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_17 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_17 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_17  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_18 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_18 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_18  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_19 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_19 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_19  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_20 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_20 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_20  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_21 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_21 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_21  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_22 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_22 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_22  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table TEMP_CDR_23 add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table TEMP_CDR_23 drop column OP_BILLED_PHONE_NUMBER ;
alter table TEMP_CDR_23  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

alter table ARCHIVED_CDR add OP_BILLED_PHONE_NUMBER_TEMP VARCHAR2(40);
alter table ARCHIVED_CDR drop column OP_BILLED_PHONE_NUMBER ;
alter table ARCHIVED_CDR  rename column OP_BILLED_PHONE_NUMBER_TEMP to OP_BILLED_PHONE_NUMBER;

insert into AUDIT_LOG_EVENT_CODES values (140,'Account Closed', 'Account ''$1'' closed on receiving ''$2''') ;
insert into AUDIT_LOG_EVENT_CODES values (141,'Phone Number Automatically Disconnected', 'PhoneNumber ''$1'' for Account ID ''$2'' disconnected on receiving activation for Account ID ''$3''') ;
insert into AUDIT_LOG_EVENT_CODES values (142,'Subscriber Alarm Closed', 'Aggregation Value ''$1'' belonging to Account ''$2'', Closed as NFR by System') ;
insert into AUDIT_LOG_EVENT_CODES values (143,'Account Alarm Closed', 'Account ''$1'', Closed as NFR by System') ;
insert into AUDIT_LOG_EVENT_CODES values (144,'Subscriber Group Promoted', 'Local Group ''$1'' promoted to Global group') ;
insert into AUDIT_LOG_EVENT_CODES values (145,'Invalid Subscriber Alarm Closed', 'Invalid Subscriber ''$1'', Closed as NFR by System') ;

insert into translations(id, tr_id, key, value) values (300, 20, '63', 'Account') ;
insert into translations(id, tr_id, key, value) values (301, 20, '62', 'Subscriber') ;
insert into translations(id, tr_id, key, value) values (302, 20, '29', 'Groups') ;
insert into translations(id, tr_id, key, value) values (303, 20,'6000', 'Nikira User') ;
insert into translations(id, tr_id, key, value) values (304, 20,'6001', 'Nikira Group') ;
commit ;
