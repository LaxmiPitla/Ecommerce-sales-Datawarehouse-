/*
SCRIPT PURPOSE:
          This script do the bulk insert into tables  "bronze" schema, Truncating the  existing tables if they already exists

How to run Stored Procedure: EXEC bronze.load_bronze ;
    Above statement is for executing the stored procedure once creation of stored procedure bronze.load_bronze
  
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	BEGIN TRY 
		PRINT 'Loading bronze layer';
		PRINT '***************************************'
		PRINT '>>Truncating the table';
		TRUNCATE TABLE bronze.ecom_sales;
		PRINT '>>Loading the data into tables';
		BULK INSERT bronze.ecom_sales
		FROM 'C:\Users\Lakshmi\Downloads\Datawarehouse project\sql-data-warehouse-project\datasets\ecommerce_sales_analytics.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY 
	BEGIN CATCH 
		PRINT '=============================';
		PRINT 'ERROR OCCURED DURING LOADING TABLES ';
		PRINT 'ERROR_MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR_MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR_MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '===============================';
	END CATCH 
END
