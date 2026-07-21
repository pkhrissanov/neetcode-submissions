-- Write your query below
SELECT DISTINCT p.product_name, o.product_id, o.order_id, o.order_date
FROM orders o
JOIN products p 
ON p.product_id = o.product_id
JOIN(
SELECT MAX(order_date) as order_date, product_id
FROM orders 
GROUP BY product_id
) AS maxdate ON maxdate.order_date = o.order_date
ORDER BY product_name, product_id, order_id


