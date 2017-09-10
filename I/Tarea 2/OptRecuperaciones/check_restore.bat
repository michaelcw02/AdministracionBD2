rem check_restore
echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

sqlplus /nolog @C:\CHEN\OptRecuperaciones\check_restore.sql
START %VAR01% C:\CHEN\OptRecuperaciones\logs\check_restore.log

EXIT