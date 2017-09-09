-- crea procedimiento para tabla 1
conn CHEN/CHEN123
set linesize 250
set pagesize 100 
spool C:\CHEN\OptBasicas\logs\crea_procedimiento1.log

CREATE OR REPLACE PROCEDURE PRC_INS_10_REGISTROS_1 AS
    NOMBRE VARCHAR2(25);
BEGIN 
    FOR i IN 1..10 LOOP
        NOMBRE := 'NOM_PERSONA' || TO_CHAR(i);
        INSERT INTO CHEN.PERSONA
        VALUES (i, NOMBRE);
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR

spool off
exit
