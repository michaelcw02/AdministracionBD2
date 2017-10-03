REM SE SOLICITA POR PANTALLA EL PARAMETRO DEL MODULO DEL SISTEMA A BLOQUEAR CON TRIGGERS
CLS @ECHO OFF
set /p Val2=Ingrese Modulo a crear funciones

sqlplus /nolog @C:\bd2\sistema4.sql CON

rem invoco el script dinamico generado anteriormente
sqlplus /nolog @C:\bd2\Crear_funciones.sql %Val2%