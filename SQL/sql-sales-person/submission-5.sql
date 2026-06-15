-- Write your query below
SELECT sp.name
FROM sales_person sp
LEFT JOIN(
SELECT sales_id 
FROM orders o 
LEFT JOIN(
    SELECT name, com_id
    FROM company c
) AS c ON c.com_id = o.com_id
WHERE c.name = 'CRIMSON' 
) AS ord ON sp.sales_id = ord.sales_id 
WHERE ord.sales_id IS NULL
