set feedback off ;
spool gbxus_packages_procedures.log ;

@generatehighcostsummary_procedure.sql ;
@switchtrunksummary_procedure.sql ;

quit ;
