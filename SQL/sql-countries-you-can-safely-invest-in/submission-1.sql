-- Write your query below
-- Write your query below

SELECT name AS country
FROM (
SELECT name, duration 
FROM country 
LEFT JOIN(
SELECT duration, callee_country.name AS callee_name, caller_country.name AS caller_name 
FROM calls c,
person callee,
person caller,
country callee_country,
country caller_country
WHERE c.caller_id = caller.id AND c.callee_id = callee.id
AND callee_country.country_code = SUBSTRING(callee.phone_number, 1, 3)
AND caller_country.country_code = SUBSTRING(caller.phone_number, 1, 3) 
) dur ON  country.name = dur.caller_name
UNION ALL
SELECT name, duration 
FROM country 
LEFT JOIN(
SELECT duration, callee_country.name AS callee_name, caller_country.name AS caller_name 
FROM calls c,
person callee,
person caller,
country callee_country,
country caller_country
WHERE c.caller_id = caller.id AND c.callee_id = callee.id
AND callee_country.country_code = SUBSTRING(callee.phone_number, 1, 3)
AND caller_country.country_code = SUBSTRING(caller.phone_number, 1, 3) 
) dur ON country.name = dur.callee_name 
) as combined
GROUP BY name
HAVING AVG(duration) >(
    SELECT AVG(duration)
    FROM calls
)
