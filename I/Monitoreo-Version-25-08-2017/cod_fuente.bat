REM dentro del .bat invoca el Notepad++

sqlplus /nolog @C:\bd2\cod_fuente.sql
C:\bd2\notepad++.exe C:\bd2\cod_fuente_out.sql
exit