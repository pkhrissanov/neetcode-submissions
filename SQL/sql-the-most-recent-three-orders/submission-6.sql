-- Write your query below
SELECT ranked.name AS customer_name, ranked.customer_id AS customer_id, ranked.order_id AS order_id, ranked.order_date
FROM(
SELECT c.name, o.customer_id, o.order_id, o.order_date, DENSE_RANK() OVER(
    PARTITION BY o.customer_id
    ORDER BY o.order_date DESC
) AS rank
FROM orders o 
JOIN customers c ON c.customer_id = o.customer_id
) ranked
WHERE ranked.rank BETWEEN 1 AND 3 
ORDER BY ranked.name , ranked.customer_id, ranked.order_date DESC