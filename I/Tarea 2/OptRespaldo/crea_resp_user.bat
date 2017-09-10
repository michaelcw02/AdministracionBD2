echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

exp parfile=C:\CHEN\OptRespaldo\crea_resp_user.par

START %VAR01% C:\CHEN\OptRespaldo\logs\crea_resp_user.log
EXIT