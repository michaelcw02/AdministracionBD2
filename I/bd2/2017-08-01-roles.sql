-- HOW TO CONNECT
-- sqlplus
-- @nameOfFile

--script para que la clave no tenga vencimientos

--rol_conecta es un rol personalizado
--existen roles por default como el DBA
--tambien existen permisos(predefinidos) de sistema como: create session, create table
----> permisos personalizados para roles personalizados


spool 2017-08-01-roles3.log
host cls
conn system/root

drop user ana cascade;
drop user juan cascade;

drop role rol_conecta;
drop role pla_admin;
drop role vet_admin;


--el rol es global y tiene los permisos minimos
create role rol_conecta;
grant create session to rol_conecta;
grant create table   to rol_conecta;
grant create role    to rol_conecta;


create user ana identified by ana123;
create user juan identified by juan123;
-- el permiso especifico del tablespace
---- se lo debo dar al usuario directamente y no al rol
alter user ana  quota unlimited on system; 
alter user juan quota unlimited on system; 
--es el unico permiso que se le da a un usuario
grant rol_conecta to ana;
grant rol_conecta to juan;

prompt USUARIO ANA
conn ana/ana123;
create table empleados(cod number, nom varchar2(10));
create role  pla_admin;

--NO OCUPAN PERMISOS PARA HACER INSERTS
INSERT INTO EMPLEADOS(COD, NOM) VALUES (1, 'ANA');
COMMIT;

GRANT INSERT, SELECT ON EMPLEADOS TO juan;

prompt USUARIO JUAN
conn juan/juan123;
create table mascotas(cod number, nom varchar2(10));
create role  vet_admin;

INSERT INTO ANA.EMPLEADOS(COD, NOM) VALUES (2, 'JUAN');
COMMIT;

SELECT * FROM ANA.EMPLEADOS;

spool off




/* crear el usuario juan, darle el rol_conecta
conectarse con juancrear un rol Ver_admin
crear tabla mascotas (cod number, nom varchar2(10))

drop usuario 
drop role
*/
