REM Se solicita por pantalla el parámetro del modulo 
REM del sistema a bloquear con triggers
cls

echo off
(
    set /p Val1=
    set /p Val2=
    set /p Val3=
) < C:\bd2\config.ini
cd c:\bd2


REM Preparar el usuario base sistema 
sqlplus /nolog @C:\bd2\clonar0.sql

REM Borrar y crear usuario destino
sqlplus /nolog @C:\bd2\clonar1.sql %Val1% %Val2% %Val3%

REM Crear script de tablas a clonar
sqlplus /nolog @C:\bd2\clonar2.sql %Val1% %Val2% %Val3%

REM Invoco el script dinámico generado anteriormente
sqlplus /nolog @C:\bd2\ejecuta_clonar1.sql

REM Crear script de tablas a dropear
sqlplus /nolog @C:\bd2\clonar3.sql %Val1% %Val2% %Val3%

REM Invoco el script dinámico generado anteriormente
rem sqlplus /nolog @C:\bd2\ejecuta_borrar.sql

REM Crear script de tablas a dropear
sqlplus /nolog @C:\bd2\clonar4.sql %Val1% %Val2% %Val3%

REM Invoco el script dinámico generado anteriormente
sqlplus /nolog @C:\bd2\ejecuta_clonar4.sql











