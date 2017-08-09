host cls
spool Proyecto2.log
 
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
--



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


spool off









