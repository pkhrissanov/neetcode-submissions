-- Write your query below
SELECT ranked.project_id, ranked.employee_id
FROM(
SELECT p.project_id, p.employee_id, DENSE_RANK() OVER(
    PARTITION BY p.project_id
    ORDER BY e.experience_years DESC
) as rank
FROM project p
JOIN employee e ON p.employee_id = e.employee_id
) ranked 
WHERE ranked.rank = 1
