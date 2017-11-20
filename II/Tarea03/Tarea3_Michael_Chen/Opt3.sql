conn mineria/mineria

spool C:\bd2\Tarea3_Michael_Chen\ConteoRegistro.log
--Borra todo
PROMPT === Opcion 3: 
PROMPT Realizando conteo de registros


SELECT COUNT(*) AS CANTIDAD_EN_TABLA_PADRON FROM PADRON;

SELECT COUNT(*) AS CANTIDAD_EN_TABLA_DISTRITOS FROM DISTRITOS;

spool off
exit