spool nikira-DML-triggers.log
set feedback off ;
set serveroutput off ;

CREATE or REPLACE PROCEDURE tokenizer ( iStart IN NUMBER, sPattern in VARCHAR2, sBuffer in VARCHAR2,
										 sResult OUT VARCHAR2, iNextPos OUT NUMBER)
AS
		nPos1 NUMBER;
		nPos2 NUMBER;
BEGIN
		nPos1 := INSTR (sBuffer ,sPattern ,iStart);
		IF nPos1 = 0 THEN
			sResult := NULL ;
		ELSE
			nPos2 := INSTR (sBuffer ,sPattern ,nPos1 + 1);
			IF nPos2 = 0 then
				sResult := Rtrim(Ltrim(Substr(sBuffer ,nPos1+1)));
				iNextPos := nPos2;
			ELSE
				sResult := Substr(sBuffer ,nPos1 + 1 , nPos2 - nPos1 - 1);
				iNextPos := nPos2;
			END IF;
		END IF;
END tokenizer ;
/

CREATE OR REPLACE TRIGGER DEL_EXP_FIELD_MAPS_TRIGGER
BEFORE DELETE ON EXPANDABLE_FIELD_MAPS 
FOR EACH ROW
	DECLARE
		excisting_associated_fld_del		EXCEPTION ;
		deletable								NUMBER := 0;
		sepr 									VARCHAR2(1);
		sres 									VARCHAR2(200);
		field_config_name						VARCHAR2(100);
		field_config_field_id					NUMBER;
		field_config_record_type				NUMBER;
		pos 									NUMBER;
		istart 									NUMBER;

    BEGIN
		FOR field_config_rec in (SELECT associated_field, name, field_id, record_config_id FROM field_configs WHERE associated_field IS NOT NULL) 
		LOOP
				BEGIN
					sepr := '.';
					istart := 1;
					tokenizer (istart ,sepr,'.'||field_config_rec.associated_field,sres,pos);

					IF (pos <> 0) THEN
						IF :old.id = to_number(sres) THEN
							deletable := 1 ;
						END IF ;
					END IF ;

					WHILE (pos <> 0 AND deletable <> 1 AND INSTR(field_config_rec.associated_field, sepr, pos+1) <> 0)
					LOOP
						istart := pos;
						tokenizer (istart ,sepr,field_config_rec.associated_field,sres,pos );
							IF :old.id = to_number(sres) THEN
								deletable := 1 ;
							END IF ;
					END LOOP;
						
					IF deletable = 1 THEN
						field_config_name := field_config_rec.name ;
						field_config_field_id := field_config_rec.field_id ;
						field_config_record_type := field_config_rec.record_config_id ;
						RAISE	excisting_associated_fld_del ;
					END IF ;
				END ;
		END LOOP;

	EXCEPTION
		WHEN excisting_associated_fld_del THEN
			RAISE_APPLICATION_ERROR (-20000, 'This record cannot be deleted since it is referenced by field_config with name ' 
									|| field_config_name || ' with field id ' || field_config_field_id || ' and record type '
									|| field_config_record_type);
		WHEN NO_DATA_FOUND THEN
				NULL ;
	END ; 
/


CREATE OR REPLACE TRIGGER INSERT_ON_TASK_LINK_PROPERTIES
BEFORE INSERT ON TASK_LINK_PROPERTIES
REFERENCING NEW as newRow
FOR EACH ROW
    BEGIN
    DECLARE
    countRow NUMBER;
    insertion_fail EXCEPTION;
    BEGIN
    SELECT COUNT(*) INTO countRow FROM Tasks WHERE id = :newRow.taskid and is_menu_item >0 AND link IS NOT NULL ;
    IF ( countRow = 0 ) THEN
        RAISE insertion_fail ;
    END IF;
    EXCEPTION
        WHEN insertion_fail THEN
            RAISE_APPLICATION_ERROR (-20010, 'This record cannot be inserted since the task in either not a menu item or link is null!!!');
        WHEN NO_DATA_FOUND THEN
            NULL ;
    END ;
    END ;
/

commit ;

