-- crea tablas persona y mascota
conn CHEN/CHEN123
set linesize 250
set pagesize 100 
spool C:\CHEN\OptBasicas\logs\crea_tablas.log

CREATE TABLE PERSONA (ID NUMBER, NOMBRE VARCHAR2(25));
CREATE TABLE MASCOTA (ID NUMBER, NOMBRE VARCHAR2(25));

spool off
exit
