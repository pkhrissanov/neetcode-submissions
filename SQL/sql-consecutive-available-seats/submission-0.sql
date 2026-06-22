-- Write your query below
SELECT seat_id
FROM (
    SELECT CASE
    WHEN (free = 1 AND( (LAG(free) OVER (ORDER BY seat_id)) = 1 OR LEAD(free) OVER (ORDER BY seat_id) = 1) ) THEN seat_id
    else NULL
    END AS seat_id
    FROM cinema
)
WHERE seat_id IS NOT NULL

