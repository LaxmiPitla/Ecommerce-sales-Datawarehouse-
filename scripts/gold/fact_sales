create view gold.fact_sales AS 
select 
ROW_NUMBER() over(order by customer_id) AS customer_key,
customer_id,
order_id,
product_category,
order_date,
quantity,
unit_price,
discount,
payment_method,
delivery_days,
revenue
from silver.ecom_sales; 
