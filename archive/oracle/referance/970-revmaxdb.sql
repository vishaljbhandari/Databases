-- Things you should know before you modify this file:
-- Every table creation script, must be preceeded with that table's deletion script
-- Deletion of foreign key tables of a table must preceed the table deletion
-- Insert a one line comment for each table explaining its purpose ----YET TOBE DONE FOR REVMAX---
-- Scripts for deletion and creation of sequences used by a table must preceed table creation
-- Use all names consistent with coding conventions and conventions of this script

set feedback off ;

drop table rip_user cascade constraints ;
drop table rip_loadable_modules cascade constraints ;
drop table rip_configuration cascade constraints ;

create table rip_user
(
		username	varchar2(15)	not null,
		password	varchar2(128)	not null,
		constraint  rip_pk_rev_usr_usr  primary key(username) 
) ;

create table rip_loadable_modules
(
		id		number(3) not null, 
		module	varchar2(256)	not null,
		project varchar2(256),
		constraint  rip_pk_loa_mod  primary key(id)
) ;

create table rip_configuration
(
		key		varchar2(256)	not null,
		value	varchar2(1024),
		constraint  rip_pk_rip_con_key primary key(key)
) ;

quit ;
