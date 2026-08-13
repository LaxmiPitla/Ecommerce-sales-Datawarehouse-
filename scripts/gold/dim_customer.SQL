Create view gold.dim_customer AS 
select 
ROW_NUMBER() over(order by customer_id) AS customer_key ,
customer_id,
customer_rating,
region
from silver.ecom_sales;
