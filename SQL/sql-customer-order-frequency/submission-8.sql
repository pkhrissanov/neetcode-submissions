-- Write your query below
SELECT c.customer_id, c.name 
FROM orders o 
LEFT JOIN(
    SELECT product_id, price 
    FROM product 
) p ON p.product_id = o.product_id
LEFT JOIN(
    SELECT customer_id, name
    FROM customers
) c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING
SUM(
    CASE WHEN EXTRACT(YEAR FROM order_date) = 2020 AND EXTRACT(MONTH FROM order_date) = 7 THEN o.quantity * p.price
    ELSE 0
    END
) >= 100 AND
SUM(
    CASE WHEN EXTRACT(YEAR FROM order_date) = 2020 AND EXTRACT(MONTH FROM order_date) = 6 THEN o.quantity * p.price
    ELSE 0
    END
) >= 100