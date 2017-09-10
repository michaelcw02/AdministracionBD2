--
conn system/root

set linesize 250
set pagesize 100 

spool C:\CHEN\OptRecuperaciones\logs\crea_usuario2.log
prompt crear y borrar usuario

drop user CHEN2 cascade;
create user CHEN2 identified by CHEN123;
--
grant dba to CHEN2;

spool off
exit