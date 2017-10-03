conn system/root
spool C:\bd2\ejecuta_clonar4.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
select 'conn system/root' 
from dual;

select 'spool C:\bd2\ejecuta_clonar4.log' from dual;

select 'drop public synonym &4_'||table_name||'; '||chr(10)
from   dba_tables 
where  owner='&2' 
order by table_name; 


select 'create public synonym &4_'||table_name||' for &2'||'.'||table_name||';'||chr(10)
from   dba_tables 
where  owner='&2' 
order by table_name; 

select 'spool off' 
from dual; 

select 'host pause' from dual;

select 'exit' 
from dual;

spool off;

set feedback on
set termout on
exit


