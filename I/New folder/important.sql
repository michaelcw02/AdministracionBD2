SELECT OWNER, COUNT(*)
FROM    DBA_OBJECTS
WHERE   OWNER IN ('HR', 'HR3')
GROUP BY OWNER;



--importar de fll solo dos tablas
SELECT  TABLE_NAME
FROM    DBA_TABLES
WHERE   OWNER = 'HR'
ORDER BY 1;