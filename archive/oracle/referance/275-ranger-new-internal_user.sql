SPOOL ranger-new-internal_user.log
SET FEEDBACK OFF
set serveroutput off 

CREATE OR REPLACE PROCEDURE assign_intuser_tasks(ranger_group_id in NUMBER)
AS
	CURSOR ranger_parent_tasks IS 
	SELECT id
	FROM tasks
	WHERE name in ('Alarm Management', 'Rule Management', 'Fingerprint Management', 'User Management', 'Internal User View')
	and parent_id = 1; 

	rparenttask ranger_parent_tasks%ROWTYPE ;	

	CURSOR ranger_sub_tasks IS
	SELECT distinct id
	FROM tasks
	WHERE name != 'Allow For All Roles'
	start with id = rparenttask.id
	connect by prior id = parent_id ;

	rsubtask ranger_sub_tasks%ROWTYPE ;

	CURSOR ranger_selected_tasks IS
	SELECT id
	FROM tasks
	WHERE name in ('Record View', 'Adjustment Logs', 'CRM Logs');

	rselectedtask ranger_selected_tasks%ROWTYPE ;	

BEGIN
   OPEN ranger_parent_tasks;
   LOOP
   		FETCH ranger_parent_tasks into rparenttask;
   		EXIT WHEN ranger_parent_tasks%NOTFOUND;
   		OPEN ranger_sub_tasks;
   		LOOP
			FETCH ranger_sub_tasks into rsubtask;
			EXIT WHEN ranger_sub_tasks%NOTFOUND;
			insert into ranger_groups_tasks values (ranger_group_id, rsubtask.id) ;
		END LOOP;
		CLOSE ranger_sub_tasks;
	END LOOP;
	COMMIT;
	CLOSE ranger_parent_tasks;

	OPEN ranger_selected_tasks;
	LOOP
		FETCH ranger_selected_tasks into rselectedtask;
		EXIT WHEN ranger_selected_tasks%NOTFOUND;
		insert into ranger_groups_tasks values (ranger_group_id, rselectedtask.id) ;
	END LOOP
	COMMIT;
	CLOSE ranger_selected_tasks;

END assign_intuser_tasks;
/
