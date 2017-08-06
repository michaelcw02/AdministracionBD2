spool 2017-08-04-roles3.log
host cls
conn system/root
drop user ana cascade;
drop user juan cascade;
drop user pedro cascade;
drop role rol_conecta;
drop role pla_admin;
drop role pla_jefe;
drop role pla_consulta;

drop role vet_admin;

create user ana identified by ana123;
create user juan identified by juan123;
create user pedro identified by pedro123;
create role rol_conecta;

grant create session to rol_conecta;
grant create table to rol_conecta;
grant create role to rol_conecta;


alter user ana quota unlimited on system;
alter user juan quota unlimited on system;
grant rol_conecta to ana;
grant rol_conecta to juan;
grant rol_conecta to pedro;

prompt USUARIO ANA
conn ana/ana123

create table empleados(cod number, nom varchar2(10));
create role pla_admin;
create role pla_jefe;
create role pla_consulta;
insert into ana.empleados(cod,nom) values (1,'Ana');
commit;
--grant insert, select on empleados to juan;
--Buena práctica  USUARIO.OBJETO 
--grant insert, select on ana.empleados to pla_admin;

--consulta
grant select on ana.empleados to pla_consulta;
--jefe
grant insert on ana.empleados to pla_jefe;
grant pla_consulta to pla_jefe;
--Admin
grant update, delete on ana.empleados to pla_admin;
grant pla_jefe to pla_admin;

--no se permite referencia circular de roles
--grant pla_admin to pla_consulta;
--host pause

--grant pla_admin to juan with admin option;
grant pla_admin to juan;


prompt USUARIO JUAN
conn juan/juan123
--TAREA #1:  Que juan le brinde permisos a ANA
--de insertar en la tabla mascotas por medio del rol
--TAREA #2. Que pedro inserte en la tabla ana.empleados
--TAREA #3. vet_admin, vet_consulta vet_jefe y separar los roles.
--similar como pla_consulta, pla_jefe, pla_admin
create table mascotas(cod number, nom varchar2(10));
create role vet_admin;
insert into ana.empleados(cod,nom) values (2,'Juan');
commit;
select * from ana.empleados;
PROMPT Permisos a Ana
grant insert, select on juan.mascotas to vet_admin;
grant vet_admin to ana;
--grant pla_admin to pedro;


prompt USUARIO ANA #2
conn ana/ana123
insert into juan.mascotas(cod,nom) values (1,'Boby');
commit;
select * from juan.mascotas;

prompt USUARIO PEDRO #1
conn pedro/pedro123
--insert into ana.empleados(cod,nom) values (3,'Pedro');
--commit;
--select * from ana.empleados;


spool off











