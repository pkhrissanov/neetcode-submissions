-- Write your query below
SELECT DISTINCT c.title 
FROM content c
JOIN(
    SELECT content_id, program_date
    FROM tv_program
    WHERE program_date LIKE '2020-06%'
) t ON c.content_id = t.content_id
WHERE kids_content LIKE 'Y' AND content_type = 'Movies'
