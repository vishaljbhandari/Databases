DROP VIEW PRECHK_SUBSCRIBER_V ;
DROP VIEW BLKLIST_SUBSCRIBER_V ;

CREATE OR REPLACE VIEW PRECHK_SUBSCRIBER_V
(
    account_id
  , account_name
  , account_doa
  , network_id
  , date_of_birth
  , passport_number
  , company_registration_number
  , first_name
  , middle_name
  , last_name
  , address_line_1
  , address_line_2
  , address_line_3
  , city
  , post_code
  , subscriber_id
  , phone_number
  , subscriber_doa
  , home_phone_number
  , office_phone_number
  , contact_phone_number
  , status
)
AS
SELECT
	A.ID,
	A.ACCOUNT_NAME,
	A.ACCOUNT_DOA,
	S.NETWORK_ID,
	S.DATE_OF_BIRTH,
	S.PASSPORT_NUMBER,
	S.COMPANY_REGISTRATION_NUMBER,
	A.FIRST_NAME,
	A.MIDDLE_NAME,
	A.LAST_NAME,
	A.ADDRESS_LINE_1,
	A.ADDRESS_LINE_2,
	A.ADDRESS_LINE_3,
	A.CITY,
	A.POST_CODE,
	S.ID,
	S.PHONE_NUMBER,
	S.SUBSCRIBER_DOA,
	S.HOME_PHONE_NUMBER,
	S.OFFICE_PHONE_NUMBER,
	S.CONTACT_PHONE_NUMBER,
	S.STATUS
FROM ACCOUNT A, SUBSCRIBER S
WHERE A.ID = S.ACCOUNT_ID
AND S.SUBSCRIBER_TYPE = 0
AND A.ACCOUNT_TYPE = 0  ;

CREATE OR REPLACE VIEW BLKLIST_SUBSCRIBER_V
(
    account_id
  , account_name
  , account_doa
  , network_id
  , date_of_birth
  , passport_number
  , company_registration_number
  , first_name
  , middle_name
  , last_name
  , address_line_1
  , address_line_2
  , address_line_3
  , city
  , post_code
  , subscriber_id
  , phone_number
  , subscriber_doa
  , home_phone_number
  , office_phone_number
  , contact_phone_number
  , status
)
AS
SELECT
	A.ID,
	A.ACCOUNT_NAME,
	A.ACCOUNT_DOA,
	S.NETWORK_ID,
	S.DATE_OF_BIRTH,
	S.PASSPORT_NUMBER,
	S.COMPANY_REGISTRATION_NUMBER,
	A.FIRST_NAME,
	A.MIDDLE_NAME,
	A.LAST_NAME,
	A.ADDRESS_LINE_1,
	A.ADDRESS_LINE_2,
	A.ADDRESS_LINE_3,
	A.CITY,
	A.POST_CODE,
	S.ID,
	S.PHONE_NUMBER,
	S.SUBSCRIBER_DOA,
	S.HOME_PHONE_NUMBER,
	S.OFFICE_PHONE_NUMBER,
	S.CONTACT_PHONE_NUMBER,
	S.STATUS
FROM ACCOUNT A, SUBSCRIBER S
WHERE A.ID = S.ACCOUNT_ID
AND S.SUBSCRIBER_TYPE = 2
AND A.ACCOUNT_TYPE = 2  ;

--commit;
--quit;
/

