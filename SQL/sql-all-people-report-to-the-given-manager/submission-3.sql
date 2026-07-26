-- Write your query below
SELECT DISTINCT b.employee_id 
FROM employees b
LEFT JOIN employees f ON b.manager_id = f.employee_id
LEFT JOIN employees s ON f.manager_id = s.employee_id
LEFT JOIN employees thr ON s.manager_id = thr.employee_id
WHERE (thr.manager_id = 1 OR s.manager_id = 1 OR f.manager_id = 1) AND b.employee_id != 1 