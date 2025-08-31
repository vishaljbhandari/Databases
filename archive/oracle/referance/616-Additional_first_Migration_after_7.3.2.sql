CREATE OR REPLACE PROCEDURE MigrateDefaultRolesForTask (task_id IN NUMBER) IS
BEGIN

    INSERT INTO ranger_groups_tasks(ranger_group_id, task_id)
        SELECT id, task_id FROM ranger_groups WHERE name IN ( 'radmin', 'default', 'nadmin' ) ;
END ;
/

exec MigrateDefaultRolesForTask (GetParentID('Import Workflow','Workflows')) ;
exec MigrateDefaultRolesForTask (GetParentID('Export Workflow','Workflows')) ;
exec MigrateDefaultRolesForTask (GetParentID('Add NRTRDE Partner','NRTRDE Partners')) ;
exec MigrateDefaultRolesForTask (GetParentID('Modify NRTRDE Partner','NRTRDE Partners')) ;
exec MigrateDefaultRolesForTask (GetParentID('Show NRTRDE Partner','NRTRDE Partners')) ;
exec MigrateDefaultRolesForTask (GetParentID('Delete NRTRDE Partner','NRTRDE Partners')) ;
exec MigrateDefaultRolesForTask (GetParentID('Multiple Delete NRTRDE Partner','NRTRDE Partners')) ;
