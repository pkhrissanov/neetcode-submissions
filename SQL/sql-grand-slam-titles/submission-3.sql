-- Write your query below


SELECT p.player_id, p.player_name, counter.count AS grand_slams_count
FROM players p
JOIN(
SELECT player_id, COUNT(player_id) AS count
FROM(
SELECT year, wimbledon as player_id
FROM championships c 
UNION ALL 
SELECT year, fr_open as player_id
FROM championships c 
UNION ALL 
SELECT year, us_open as player_id
FROM championships c 
UNION ALL 
SELECT year, au_open as player_id
FROM championships c
)
GROUP BY player_id
) counter ON counter.player_id = p.player_id
