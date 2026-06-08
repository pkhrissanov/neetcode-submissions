-- Write your query below
SELECT DISTINCT customers.customer_id, customer_name
FROM customers 
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id IN(
SELECT DISTINCT customer_id
FROM orders
WHERE product_name = 'A'
)
AND customers.customer_id IN(
SELECT DISTINCT customer_id
FROM orders
WHERE product_name = 'B'

)
AND customers.customer_id NOT IN(
SELECT DISTINCT customer_id
FROM orders
WHERE product_name = 'C'

)
ORDER BY customer_name




