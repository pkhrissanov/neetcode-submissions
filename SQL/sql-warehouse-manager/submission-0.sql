-- Write your query below
SELECT w.name AS warehouse_name, SUM(p.width * p.length * p.height * w.units) AS volume
FROM warehouse w 
LEFT JOIN (
    SELECT width, length, height, product_id
    FROM products
) p ON p.product_id = w.product_id
GROUP BY w.name
