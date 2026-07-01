-- Write your query below
SELECT a.player_id, a.device_id
FROM activity a
JOIN( 
SELECT player_id, MIN(event_date) AS event_date
FROM activity 
GROUP BY player_id
) d ON d.player_id = a.player_id AND a.event_date = d.event_date 
 