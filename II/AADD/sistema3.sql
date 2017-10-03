--Tema:
--Aplicaciones Avanzadas con el Diccionario de Datos

--create user prueba01 identified by prueba1;

--select username from dba_users
--where username = 'PRUEBA01';

--drop user prueba01;

--select username from dba_users
--where username = 'PRUEBA01';

-- Caso de Negocio.
-- que hay un Sistema Completo
-- Incluye modulos como Planilla, Contabilidad
-- Facturacion y Compras
--
conn system/root
drop user sistema cascade;
create user sistema identified by sistema;
grant dba to sistema;
conn sistema/sistema
prompt Tablas de planillas: PLA
create table PLA01(a number);
create table PLA02(a number);
create table PLA03(a number);
create table PLA04(a number);
create table PLA05(a number);
prompt Tablas de Conta:   CON
create table CON01(a number);
create table CON02(a number);
create table CON03(a number);

--  Caso de negocio:
--  Se requiere hacer una actualización urgente en el
--  sistema de planillas, y es necesario
--  que ningun usuario pueda insertar datos
--  en ninguna de las tablas de planilla

-- Vamos a crear una herramienta, que a partir del
-- diccionario de datos, cree un trigger por cada tabla
-- de planilla e impida que se pueda hacer un insert

spool C:\bd2\Crear_Triggers3.sql
set pagesize 0
set linesize 300
set feedback off
set termout off
SET VERIFY OFF

--ESTO AYUDA PARA QUE DESDE EL SPOOL QUE SE GENERA PUEDA CONECTARSE A LA BD
SELECT 'CONNECT sistema/sistema'
FROM DUAL;

select 'create or replace trigger '||table_name||'_bir'||chr(10)||
'before insert'||chr(10)||
'on '||table_name||chr(10)||
'for each row'||chr(10)||
'declare'||chr(10)||
'begin'||chr(10)||
' raise_application_error(-20001,''Planillas en Mantenimiento'');'||chr(10)||
'end;'||chr(10)||
'/'
from   dba_tables
where  owner='SISTEMA'
and    table_name like '&1%'
order by table_name;

select 'host pause'
from dual;

select 'exit'
from dual;

spool off;

set feedback on
set termout on
exit