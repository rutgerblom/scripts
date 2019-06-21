/*
Values within angle brackets (< >) are example values. When replacing the example value,
remove the angle brackets. The database name is case sensitive. Make sure you enter the database name the same in all instances.
*/


CREATE DATABASE vidm
COLLATE Latin1_General_CS_AS;
ALTER DATABASE vidm SET READ_COMMITTED_SNAPSHOT ON;
GO

IF NOT EXISTS
(SELECT name
FROM master.sys.server_principals
WHERE name=N'DEMO\Administrator')
BEGIN
CREATE LOGIN [DEMO\Administrator] FROM WINDOWS;
END
GO

USE vidm; 
IF EXISTS (SELECT * FROM sys.database_principals WHERE name=N'DEMO\Administrator')
DROP USER [DEMO\Administrator]
GO

CREATE USER [DEMO\Administrator] FOR LOGIN [DEMO\Administrator] 
WITH DEFAULT_SCHEMA=saas;
GO

CREATE SCHEMA saas AUTHORIZATION "DEMO\Administrator"
GRANT ALL ON DATABASE::vidm TO "DEMO\Administrator";
GO

ALTER ROLE db_owner ADD MEMBER "DEMO\Administrator";
GO