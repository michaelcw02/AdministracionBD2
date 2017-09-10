echo off
(
    set /p var1=
    set /p var2=
    set /p var3=
) < C:\CHEN\config.ini

SET NotepadPP=%var1:~20,100%
SET SevenZip=%var2:~20,100%
SET NameDate=%var3:~20,100%

exp parfile=C:\CHEN\OptRespaldo\crea_resp_full.par

%SevenZip% a C:\CHEN\OptRespaldo\respaldos\crea_resp_full.7z C:\CHEN\OptRespaldo\respaldos\full.dmp 1> C:\CHEN\OptRespaldo\logs\crea_resp_full7z.log

DEL C:\CHEN\OptRespaldo\respaldos\full.dmp 1>nul 2>nul

%NameDate% /Y /ZZ:"F[Y-m-d] (H-M-S).X" C:\CHEN\OptRespaldo\respaldos\crea_resp_full.7z

START %NotepadPP% C:\CHEN\OptRespaldo\logs\crea_resp_full.log

EXIT