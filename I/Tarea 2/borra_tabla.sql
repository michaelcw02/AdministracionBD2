--
conn test/test

set linesize 250
set pagesize 100 
spool C:\bd2\borra_tabla.log

--crear table
drop table tab1;
spool off

host "C:\Program Files (x86)\Notepad++\notepad++" C:\bd2\borra_tabla.log



exit