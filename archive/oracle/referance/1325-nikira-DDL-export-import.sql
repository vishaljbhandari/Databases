CREATE SEQUENCE imported_elements_seq INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER; 
CREATE TABLE imported_elements (
	id number(10),
	src_element_name varchar2(256) not null,
	config_uid varchar2(100) not null,
	element_type varchar2(20) not null,
	target_element_name varchar2(256) not null,
	target_element_id number(10) not null
);
