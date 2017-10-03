REM proceso de generar archivo .SQL de forma dinamica
sqlplus /nolog @C:\bd2\sistema.sql

rem invoco el script dinamico generado anteriormente
sqlplus /nolog @C:\bd2\Crear_Triggers.sql