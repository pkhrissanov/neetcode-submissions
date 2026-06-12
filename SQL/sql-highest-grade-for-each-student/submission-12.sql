-- Write your query below
-- Write your query below

SELECT u.student_id,MIN(exam_id) AS exam_id, u.score
FROM exam_results u
JOIN(
SELECT student_id, MAX(score) AS score
FROM exam_results
GROUP BY student_id
) l
ON u.student_id = l.student_id AND u.score = l.score
GROUP BY u.student_id, u.score
ORDER BY u.student_id

