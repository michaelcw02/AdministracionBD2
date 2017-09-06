cls
echo off
(
    set /p var1=
    set /p var2=
    set /p var3=
) < C:\bd2\config.ini
echo Mostrar mensajes
echo %var1%
echo %var2%
echo %var3%

start %var1% c:\bd2\config.ini 