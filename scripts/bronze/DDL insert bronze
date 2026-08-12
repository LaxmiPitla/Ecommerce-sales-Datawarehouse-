/*
Script Purpose: This script creates the Table in bronze layer ,with table name ecom_sales ,
              If tables already exists then it is dropped and recreates new table
*/
IF OBJECT_ID('bronze.ecom_sales' , 'U') IS NOT NULL
	DROP TABLE bronze.ecom_sales;
CREATE TABLE bronze.ecom_sales(
order_id INT,
order_date DATE,
customer_id INT ,
product_category NVARCHAR(50),
region NVARCHAR(50),
quantity INT,
unit_price FLOAT,
discount FLOAT,
payment_method NVARCHAR(50),
delivery_days INT,
customer_rating FLOAT,
revenue FLOAT
);
