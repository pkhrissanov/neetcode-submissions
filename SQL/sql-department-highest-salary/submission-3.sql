-- Write your query below
SELECT d.name AS department, e.name AS employee, e.salary AS salary
FROM(
SELECT name, salary, department_id,  RANK() OVER (
    PARTITION BY department_id 
    ORDER BY salary DESC
) as rank
FROM employee 
) e
JOIN department d ON e.department_id = d.id
WHERE e.rank = 1