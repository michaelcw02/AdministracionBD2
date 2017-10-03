REM SE SOLICITA POR PANTALLA EL PARAMETRO DEL MODULO DEL SISTEMA A BLOQUEAR CON TRIGGERS
CLS @ECHO OFF
set /p Val2=Ingrese Modulo a crear triggers

sqlplus /nolog @C:\bd2\sistema3.sql CON

rem invoco el script dinamico generado anteriormente
sqlplus /nolog @C:\bd2\Crear_Triggers3.sql %Val2%