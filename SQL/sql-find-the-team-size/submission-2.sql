-- Write your query below
SELECT employee_id, b.team_size
FROM employee a
LEFT JOIN(
SELECT team_id, COUNT(team_id) as team_size
FROM employee
GROUP BY team_id 
) b ON a.team_id = b.team_id

