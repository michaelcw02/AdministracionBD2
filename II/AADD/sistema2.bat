REM proceso de generar archivo .SQL de forma dinamica
sqlplus /nolog @C:\bd2\sistema2.sql CON

rem invoco el script dinamico generado anteriormente
sqlplus /nolog @C:\bd2\Crear_Triggers2.sql