-- Write your query below
SELECT u.name,
CASE
    WHEN travelled_distance IS NULL THEN 0
    WHEN travelled_distance IS NOT NULL THEN travelled_distance
    END AS travelled_distance
FROM users u 
LEFT JOIN(
    SELECT user_id,SUM(distance) as travelled_distance
    FROM rides r
    GROUP BY user_id
) r ON u.id = r.user_id
ORDER BY travelled_distance DESC, u.name