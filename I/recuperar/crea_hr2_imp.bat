rem crea usuario y realiza import
rem archivo: crea_hr2_imp.bat
sqlplus /nolog @C:\bd2\crea_hr2.sql

imp parfile=C:\bd2\imp_hr_to_hr2.par

