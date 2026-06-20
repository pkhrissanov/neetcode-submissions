-- Write your query below
SELECT DISTINCT s.sale_date , (a.sold_num_apples - o.sold_num_oranges) AS diff 
FROM sales s
LEFT JOIN( 
SELECT sold_num AS sold_num_apples, sale_date  
FROM sales 
WHERE fruit = 'apples'
) a ON a.sale_date = s.sale_date
LEFT JOIN (
SELECT sold_num AS sold_num_oranges, sale_date
from sales 
WHERE fruit = 'oranges' 
) o ON o.sale_date = s.sale_date 
ORDER BY s.sale_date