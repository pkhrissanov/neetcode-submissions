SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id 
FROM(  
SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id) - log_id AS diff
FROM logs
)
GROUP BY diff
ORDER BY start_id