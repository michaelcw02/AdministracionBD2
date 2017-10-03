spool C:\bd2\Crear_Triggers.sql

select 'create or replace trigger'||'table_name'|| '_bir'||chr(10)|| 'BEFORE INSERT'
from dba_tables
where owner='SISTEMA'
AND TABLE_NAME LIKE 'PLA%';

SPOOL OFF