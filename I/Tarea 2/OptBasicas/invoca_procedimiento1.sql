-- invoca procedimiento de tabla 1
conn CHEN/CHEN123
set linesize 250
set pagesize 100 
spool C:\CHEN\OptBasicas\logs\invoca_procedimiento1.log

EXECUTE PRC_INS_10_REGISTROS_1 

PROMPT SELECT * FROM PERSONA;
SELECT * FROM PERSONA;

spool off
exit
