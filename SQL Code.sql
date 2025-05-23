SELECT transaction_date, 
TO_CHAR (transaction_date, 'YYYYMM') AS month_id, 
COUNT (TRANSACTION_ID) number_of_sales, 
COUNT (PRODUCT_ID) AS unique_products_sold, 
SUM (TRANSACTION_QTY * TO_NUMBER (REPLACE (UNIT_PRICE, ',', '.'))) AS Total_Amount, 
product_category, 
product_detail, 
product_type, 
store_location, 
CASE  
WHEN transaction_time BETWEEN '07:00:00' AND '11:59:59' THEN 'Morning' 
WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon' 
WHEN transaction_time BETWEEN '17:00:00' AND '20:59:00' THEN 'Evening' 
ELSE 'Night' 
END AS time_buckets 
FROM "SHOP"."COFFEE_SHOP"."BRIGHT_COFFEE_SHOP" 
GROUP BY ALL 
ORDER BY transaction_date DESC;