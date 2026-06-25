-- Write your query below
SELECT e.employee_id
FROM employees e
LEFT JOIN (
    SELECT *
    FROM salaries
) s ON s.employee_id = e.employee_id
WHERE s.salary IS NULL
UNION ALL
SELECT s.employee_id
FROM salaries s
LEFT JOIN (
    SELECT *
    FROM employees
) e ON s.employee_id = e.employee_id
WHERE e.name IS NULL
ORDER BY employee_id


