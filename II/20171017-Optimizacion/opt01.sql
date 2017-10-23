conn system/root

--Borra todo
drop user mineria cascade;
drop tablespace PADRON_DAT including contents and datafiles;
drop tablespace PADRON_IDX including contents and datafiles;
drop role ROL_DISTRITO;
drop role ROL_PADRON;


--crea tablespaces
--otros tamaños pueden se 10M // 1G
CREATE TABLESPACE PADRON_DAT datafile 'C:\oraclexe\app\oracle\oradata\XE\PADRON_DAT.DBF'  
SIZE 256M REUSE AUTOEXTEND ON;

CREATE TABLESPACE PADRON_IDX datafile 'C:\oraclexe\app\oracle\oradata\XE\PADRON_IDX.DBF'  
SIZE 64M REUSE AUTOEXTEND ON;


--crea usuario
create user mineria identified by mineria default tablespace PADRON_DAT;

grant dba to mineria;

create role ROL_DISTRITO;
create role ROL_PADRON;
