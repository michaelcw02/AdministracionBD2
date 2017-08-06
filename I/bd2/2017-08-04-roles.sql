spool 2017-08-04-roles.log
host cls
conn system/root
--el password se puede reutilizar ilimitadamente
--alter profile DEFAULT limit PASSWORD_REUSE_TIME unlimited;
-- el tiempo de vida del password es ilimitado
--alter profile DEFAULT limit PASSWORD_LIFE_TIME unlimited;
--asigna el perfil default al usuario system
--alter user system profile DEFAULT;
--finalmente cambia la clave de system
--alter user system identified by root;
drop user ana cascade;
drop user juan cascade;
drop role rol_conecta;
drop role pla_admin;
drop role vet_admin;

create user ana identified by ana123;
create user juan identified by juan123;
create role rol_conecta;

grant create session to rol_conecta;
grant create table to rol_conecta;
grant create role to rol_conecta;


alter user ana quota unlimited on system;
alter user juan quota unlimited on system;
grant rol_conecta to ana;
grant rol_conecta to juan;

prompt USUARIO ANA
conn ana/ana123

create table empleados(cod number, nom varchar2(10));
create role pla_admin;
insert into ana.empleados(cod,nom) values (1,'Ana');
commit;
--grant insert, select on empleados to juan;
--Buena práctica  USUARIO.OBJETO 
grant insert, select on ana.empleados to pla_admin;
grant pla_admin to juan;

prompt USUARIO JUAN
conn juan/juan123
--TAREA:  Que juan le brinde permisos a ANA
--de insertar en la tabla mascotas por medio del rol
create table mascotas(cod number, nom varchar2(10));
create role vet_admin;
insert into ana.empleados(cod,nom) values (2,'Juan');
commit;
select * from ana.empleados;
spool off








































