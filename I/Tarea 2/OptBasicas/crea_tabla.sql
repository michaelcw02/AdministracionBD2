--
conn test/test
set linesize 250
set pagesize 100 
spool C:\bd2\crea_tabla.log
--crear table
create table tab1(a number);


spool off
host "C:\Program Files (x86)\Notepad++\notepad++" C:\bd2\crea_tabla.log


exit
