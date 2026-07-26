-- Write your query below
SELECT user_id, MAX(biggest_window) AS biggest_window
FROM(
SELECT user_id, CASE
WHEN LEAD(user_id) OVER(PARTITION BY user_id ORDER BY visit_date) != user_id THEN CAST('2021-1-1' AS DATE) - visit_date 
WHEN LEAD(user_id) OVER(PARTITION BY user_id ORDER BY visit_date) = user_id THEN LEAD(visit_date) OVER() - visit_date
WHEN LEAD(user_id) OVER(PARTITION BY user_id ORDER BY visit_date) IS NULL THEN CAST('2021-1-1' AS DATE) - visit_date
END AS biggest_window
FROM user_visits
)
GROUP BY user_id
