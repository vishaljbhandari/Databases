SET FEEDBACK OFF
SPOOL ranger-spark-procedures.log

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
