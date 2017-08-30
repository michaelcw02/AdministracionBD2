rem Archivo: c:\bd2\hr.bat
exp parfile=C:\bd2\hr.par

rem comprimimos el archivo
rem C:\bd27z a C:\bd2\hr.7z C:\bd2\hr.dmp 1> C:\bd2\hr7z.log

rem borrar archivo hr.dmp (salidas a nulo)
rem del C:bd2\hr.dmp 1> nul 2> nul

rem Renombra archivo comprimido
rem C:bd2\namedate /Y /ZZ:"F[Y-m-d] (H-M-S).X" C:bd2\hr.7z