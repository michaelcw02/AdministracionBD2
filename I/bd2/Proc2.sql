--Sinónimos:
--Publicos (Global, para todos los usuarios es el mismo)
--Privados  (para un usuario específico)

--Puntero
--Facilidad, unificar, 
--Seguridad, para ocultar.

--Cuando un usuario crea objetos globales
--Ej: ROLES, SINONIMOS PUBLICOS, TABLESPACES, USUARIOS
--cuando el usuario se borra aunque sea cascade, el objeto permanece!

--con el drop user cascade lo que se borra son los objetos propios del usuario (usuario.objeto)
--ej: tablas (PK, FK, CK, TRIGGERS), vistas, secuencias, sinonimos privados, procedimientos, funciones, paquetes.

host cls
spool Proc2.log

 
prompt CONECTADO CON SYSTEM 
conn system/root


prompt DROP USER PROYECTO
drop user proyecto cascade;
drop user ana cascade;
drop user juan cascade;
drop user pedro cascade;
drop role ROL_GIMNASIO;
drop public synonym prc_ins_instructor;
drop public synonym prc_prueba;

--CREATE USER
create user proyecto identified by pro1234;
create user ana identified by ana123;
create user juan identified by juan123;
create user pedro identified by pedro123;

--seccion de permisos
grant dba to proyecto;
grant create session to ana;
grant create session to juan;
grant create session to pedro;


conn proyecto/pro1234;
create role ROL_GIMNASIO;

--CREATE TABLES--
prompt CREACION DE TABLAS

create table INSTRUCTORES(
cedula 		number,
nombre 		varchar2(20) not null,
apellidos 	varchar2(25) not null, 
genero 		varchar(1) not null,
edad 		number not null);

create table CLIENTES(
cedula_Cliente 		number,
nombre 				varchar2(20) not null,
apellidos 			varchar2(25) not null, 
genero 				varchar2(1) not null,
edad 				number not null,
estado 				varchar2(2) not null,
peso 				number not null,
unidad_peso 		varchar2(2) not null,
instructor 			number not null,
matricula 			number not null,
fecha_incripcion	date not null,
fecha_vencimiento 	date not null);


--PK--
prompt LLAVES PRIMARIAS

alter table INSTRUCTORES add constraint instructor_pk primary key(cedula);


alter table CLIENTES add constraint cliente_pk primary key(cedula_Cliente);


--FK--
prompt LLAVES FORANEAS

alter table CLIENTES add constraint cliente_fk01 foreign key (instructor) references INSTRUCTORES;


--CK--
prompt CHECK CONSTRAINTS

alter table CLIENTES add constraint cliente_ck01 check (genero in ('M','F'));


alter table CLIENTES add constraint cliente_ck04 check(edad > 13);

alter table INSTRUCTORES add constraint instructor_ck01 check (genero in('M','F'));

alter table INSTRUCTORES add constraint instructor_ck02 check(edad > 19);

---
---------------------------------------------------------
PROMPT Proyecto2 Inicia acá
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------

--host cls

 
--conn system/root

conn proyecto/pro1234;

-----------------PROCEDURES-------------------------
prompt Procedimientos inserts

prompt prc insert Instructores

create or replace procedure prc_ins_instructor(PCedInst in number,PNombreInst in varchar2,PApellInst in varchar2,PGeneroInst in varchar2,PEdadInst in number) is

begin
insert into INSTRUCTORES(cedula,nombre,apellidos,genero,edad) values (PCedInst,PNombreInst,PApellInst,PGeneroInst,PEdadInst);
commit;

end prc_ins_instructor;
/
show error
--No valida que el objeto apuntado exista!
create public synonym prc_ins_instructor for proyecto.prc_ins_instructor;

create public synonym prc_prueba for proyecto.prc_ins_instructor;

--
prompt prc insert Clientes
create or replace procedure prc_ins_cliente(PCedCliente in number, PNomClie in varchar2,PApellClie in varchar2,PGenClie in varchar2,PEdadClie in number,PEstClie in varchar2,PPesoClie in number,PUniPesoClie in varchar2,PInstru in number,PMatri in number,PFechInsc in date, PFechVen in date) is

begin
insert into CLIENTES(cedula_Cliente,nombre,apellidos,genero,edad,estado,peso,unidad_peso,instructor,matricula,fecha_incripcion,fecha_vencimiento) values (PCedCliente,PNomClie,PApellClie,PGenClie,PEdadClie,PEstClie,PPesoClie,PUniPesoClie,PInstru,PMatri,PFechInsc,PFechVen);
commit;
end prc_ins_cliente;
/
show error





---------------------------Fin de Procedures INSERTS------------------------
---------------------------PROCEDURE ACTUALIZAR-----------------------------
prompt PRC ACTUALIZAR INSTRUCTORES

prompt PRC ACTUALIZAR NOMBRE INSTRUCTORES
create or replace procedure prc_act_nom_instructor(PCedInst in number, PNombreInst in varchar2) is

begin
update INSTRUCTORES set nombre=PNombreInst where cedula=PCedInst;
commit;

end prc_act_nom_instructor;
/
show error

prompt PRC ACTUALIZAR APELLIDOS INSTRUCTORES
create or replace procedure prc_act_apell_instructor(PCedInst in number, PApellInst in varchar2) is

begin
update INSTRUCTORES set apellidos=PApellInst where cedula=PCedInst;
commit;

end prc_act_apell_instructor;
/
show error

prompt PRC ACTUALIZAR EDAD INSTRUCTORES
create or replace procedure prc_act_edad_instructor(PCedInst in number, PEdadInstr in number) is

begin
update INSTRUCTORES set edad=PEdadInstr where cedula=PCedInst;
commit;

end prc_act_edad_instructor;
/
show error

prompt PRC ACTUALIZAR GENERO INSTRUCTORES
create or replace procedure prc_act_gen_instructor(PCedInst in number, PGenInst in varchar2) is

begin
update INSTRUCTORES set genero=PGenInst where cedula=PCedInst;
commit;

end prc_act_gen_instructor;
/
show error


prompt PRC ACTUALIZAR CLIENTES
prompt PRC ACTUALIZAR NOMBRE CLIENTES
create or replace procedure prc_act_nom_cliente(PCedCliente in number, PNomClie in varchar2) is

begin
update CLIENTES set nombre=PNomClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_nom_cliente;
/
show error

prompt PRC ACTUALIZAR APELLIDOS CLIENTES
create or replace procedure prc_act_apell_cliente(PCedCliente in number, PApellClie in varchar2) is

begin
update CLIENTES set apellidos=PApellClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_apell_cliente;
/
show error

prompt PRC ACTUALIZAR GENERO CLIENTES
create or replace procedure prc_act_gen_cliente(PCedCliente in number, PGenClie in varchar2) is

begin
update CLIENTES set genero=PGenClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_gen_cliente;
/
show error

prompt PRC ACTUALIZAR EDAD CLIENTES
create or replace procedure prc_act_edad_cliente(PCedCliente in number, PEdadClie in number) is

begin
update CLIENTES set edad=PEdadClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_edad_cliente;
/
show error

prompt PRC ACTUALIZAR PESO CLIENTES
create or replace procedure prc_act_peso_cliente(PCedCliente in number, PPesoClie in number) is

begin
update CLIENTES set peso=PPesoClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_peso_cliente;
/
show error

prompt PRC ACTUALIZAR ESTADO CLIENTES
create or replace procedure prc_act_est_cliente(PCedCliente in number, PEstClie in varchar2) is

begin
update CLIENTES set estado=PEstClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_est_cliente;
/
show error


prompt PRC ACTUALIZAR INSTRUCTOR CLIENTES
create or replace procedure prc_act_inst_cliente(PCedCliente in number, PInstClie in number) is

begin
update CLIENTES set instructor=PInstClie where cedula_Cliente=PCedCliente;
commit;
end prc_act_inst_cliente;
/
show error


prompt PRC ACTUALIZAR FECHA INSCRIPCION CLIENTES
create or replace procedure prc_act_fecIns_cliente(PCedCliente in number, PFechIns in date) is

begin
update CLIENTES set fecha_incripcion=PFechIns where cedula_Cliente=PCedCliente;
commit;
end prc_act_fecIns_cliente;
/
show error












------------------------FIN PROCEDURES ACTUALIZAR----------------------------
------------------------PROCEDURES BORRAR------------------------------------
prompt procedures borrado

prompt procedure BORRAR INSTRUCTOR

create or replace procedure prc_bor_instructor(PCedInst in number) is
begin
delete INSTRUCTORES where cedula=PCedInst;
commit;

end prc_bor_instructor;
/
show error




prompt procedure BORRAR CLIENTE
create or replace procedure prc_bor_cliente(PCedCliente in number) is
begin
delete CLIENTES where cedula_Cliente=PCedCliente;
commit;

end prc_bor_cliente;
/
show error





------------------------FIN ROCEDURES BORRAR----------------------------------
---------------------------EXUCUTE DE PROCEDURES INSERTAR-------------------
prompt EXECUTE INSERTAR INSTRUCTORES

execute prc_ins_instructor(12345,'A','A C','M',30);
execute prc_ins_instructor(123456,'B','B C','F',25);


prompt EXECUTE INSERTAR CLIENTES

execute prc_ins_cliente(402300598,'C1','C1','M',21,'AD',60,'KG',123456,1,sysdate,sysdate);
execute prc_ins_cliente(402200675,'C3','C2','M',23,'AT',150,'LB',12345,2,sysdate,sysdate);

grant execute on prc_ins_instructor to juan;
grant execute on prc_ins_instructor to ROL_GIMNASIO;
grant execute on prc_ins_cliente to ana;
grant execute on prc_ins_cliente to ROL_GIMNASIO;
--host pause
grant ROL_GIMNASIO to pedro;
--host pause
prompt usuario ana
conn ana/ana123

prompt Ana ejecuta procedimiento
execute proyecto.prc_ins_cliente(402200679,'C3','C2','M',23,'AT',150,'LB',12345,2,sysdate,sysdate);

prompt usuario juan
conn juan/juan123

prompt Juan ejecuta procedimiento Insertar INSTRUCTOR
execute proyecto.prc_ins_instructor(12349,'A','A C','M',30);
--select * from proyecto.INSTRUCTORES;
PROMPT no puedo insertar directamente
--insert into proyecto.INSTRUCTORES(cedula,nombre,apellidos,genero,edad) values (12348,'A','A C','M',30);
--commit;

prompt usuario pedro
conn pedro/pedro123

execute proyecto.prc_ins_cliente(102200679,'C3','C2','M',23,'AT',150,'LB',12345,2,sysdate,sysdate);
prompt Con sinonimo global prc_prueba
execute prc_prueba(22349,'A','A C','M',30);

spool off























