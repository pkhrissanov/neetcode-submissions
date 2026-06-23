-- Write your query below
SELECT MIN(ABS(point.x - x2.x)) as shortest
FROM point
LEFT JOIN(
SELECT x
FROM POINT 
) x2 ON point.x != x2.x

