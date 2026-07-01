-- Write your query below
SELECT t.team_id, t.team_name, SUM(COALESCE(hp.host_points, 0) +
COALESCE(hg.guest_points, 0)) AS num_points
FROM teams t

LEFT JOIN(
SELECT host_team, SUM(CASE
    WHEN host_goals > guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    WHEN host_goals < guest_goals THEN 0
END) AS host_points
FROM matches
GROUP BY host_team 
) hp ON hp.host_team = t.team_id
LEFT JOIN(
SELECT guest_team, SUM(CASE
    WHEN host_goals < guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    WHEN host_goals > guest_goals THEN 0
END) AS guest_points
FROM matches
GROUP BY guest_team 
) hg ON hg.guest_team = t.team_id
GROUP BY t.team_id
ORDER BY  SUM(COALESCE(hp.host_points, 0) +
COALESCE(hg.guest_points, 0)) DESC, team_id

