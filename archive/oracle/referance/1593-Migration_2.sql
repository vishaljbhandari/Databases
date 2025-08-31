alter table fp_elements drop constraint FK_FING_PRT_ELE_ENT_TYPE;
alter table fp_entities drop constraint UK_FING_PRT_ENT_TYPE;
DROP INDEX UK_FING_PRT_ENT_TYPE;
Commit;

