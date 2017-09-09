--
conn system/root

set linesize 250
set pagesize 100 

spool C:\CHEN\OptBasicas\logs\crea_usuario.log
prompt crear y borrar usuario

drop user CHEN cascade;
create user CHEN identified by CHEN123;
--
grant dba to CHEN;

spool off
exit