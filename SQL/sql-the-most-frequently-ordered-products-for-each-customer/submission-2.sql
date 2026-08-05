-- Write your query below

SELECT DISTINCT o.customer_id, o.product_id, p.product_name
FROM (
SELECT o.customer_id, o.product_id, RANK() OVER(
    PARTITION BY o.customer_id
    ORDER BY o.product_count DESC
) AS rank
FROM(
SELECT o.customer_id, o.product_id, COUNT(o.product_id) OVER(
    PARTITION BY o.customer_id, o.product_id
) AS product_count 
FROM orders o 
) o 
) o
JOIN products p ON p.product_id = o.product_id 
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.rank = 1

