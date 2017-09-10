--dropear y crear usuario con permisos de dba
conn system/root
spool C:\bd2\crea_hr2.log
drop user hr2 cascade;
create user hr2 identified by hr234;
grant dba to hr2;
spool off
exit