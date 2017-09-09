--
conn system/root
set linesize 250
set pagesize 100 
spool C:\bd2\crea_usuario.log
prompt crear y borrar usuario
drop user test cascade;

create user test identified by test;

--
grant dba to test;


spool off


host "C:\Program Files (x86)\Notepad++\notepad++" C:\bd2\crea_usuario.log


exit

