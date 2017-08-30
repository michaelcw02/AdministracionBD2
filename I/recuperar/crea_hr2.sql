--dropear y crear usuario con permisos de dba
connect system/root

spool C:\bd2\crea_hr2.log

drop user hr2 cascade;
create user hr2 identified by hr123;
grant dba to hr2;

spool off;

exit