-- invoca procedimiento de tabla 1
conn CHEN/CHEN123
set linesize 250
set pagesize 100 
spool C:\CHEN\OptBasicas\logs\invoca_procedimiento2.log

EXECUTE PRC_INS_10_REGISTROS_2

PROMPT SELECT * FROM MASCOTA;
SELECT * FROM MASCOTA;

spool off
exit
