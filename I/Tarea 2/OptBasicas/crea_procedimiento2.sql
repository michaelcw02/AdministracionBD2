-- crea procedimiento para tabla 2
conn CHEN/CHEN123
set linesize 250
set pagesize 100 
spool C:\CHEN\OptBasicas\logs\crea_procedimiento2.log

CREATE OR REPLACE PROCEDURE PRC_INS_10_REGISTROS_2 AS
    NOMBRE VARCHAR2(25);
BEGIN 
    FOR i IN 1..10 LOOP
        NOMBRE := 'NOM_MASCOTA' || TO_CHAR(i);
        INSERT INTO CHEN.MASCOTA
        VALUES (i, NOMBRE);
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR

spool off
exit
