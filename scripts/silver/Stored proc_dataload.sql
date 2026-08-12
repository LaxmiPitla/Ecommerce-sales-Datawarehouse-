/*Inserting cleaned and transformed data from bronze layer to silver layer 
Script Purpose: Truncating the silver tables then inserting the data , Loading data into silver stored procedure

Stored Procedure can be executed with : EXEC silver.load_silver
*/
CREATE OR ALTER PROCEDURE silver.load_silver AS 
BEGIN
    BEGIN TRY 
        PRINT 'Loading silver layer';
        PRINT '****************************';
        PRINT '>>Truncating the table';
        TRUNCATE TABLE silver.ecom_sales
        PRINT '>>Inserting data into: silver.ecom_sales';
        INSERT INTO silver.ecom_sales(
            order_id,
            order_date,
            customer_id,
            product_category,
            region,
            quantity,
            unit_price,
            discount,
            payment_method,
            delivery_days,
            customer_rating,
            revenue)
        SELECT 
            order_id,
            order_date,
            customer_id,
            product_category,
            region,
            quantity,
            unit_price,
            discount,
            payment_method,
            delivery_days,
            customer_rating,
            revenue
        from bronze.ecom_sales
        where order_date<=GETDATE();
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

