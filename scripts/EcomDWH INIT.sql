/*
==============================================================
Create Database and Schemas
==============================================================
Script Usage: 
		This script creates Database named 'EcommerceDatawarehouse' ,if it already exists then it is
		Dropped  and recreated database 'EcommerceDatawarehouse'. Additionally, the script sets up three schemas
		within database 'bronze','silver','gold'

*/
--Create database ecommercedatawarehouse

USE master;
GO
---Drop and recreate the database EcommerceDatawarehouse
IF EXISTS (SELECT 1 FROM sys.databases where name = 'EcommerceDatawarehouse')
BEGIN
	ALTER DATABASE EcommerceDatawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE EcommerceDatawarehouse;
END;

GO
--Create the 'EcommerceDatawarehouse' database
CREATE DATABASE EcommerceDatawarehouse;
GO

use EcommerceDatawarehouse;
GO

--Create schemas 
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO