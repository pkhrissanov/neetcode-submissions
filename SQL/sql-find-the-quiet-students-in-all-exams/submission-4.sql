SELECT student.student_id, student.student_name 
FROM student 
LEFT JOIN (
SELECT DISTINCT e.student_id 
FROM exam e
LEFT JOIN ( 
SELECT DISTINCT student_id
FROM (
SELECT student_id, exam_id 
FROM ( 
    SELECT student_id, RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS rank, exam_id
    FROM exam
    )
WHERE rank = 1
UNION
SELECT student_id, exam_id 
FROM ( 
    SELECT student_id, RANK() OVER (PARTITION BY exam_id ORDER BY score) AS rank, exam_id
    FROM exam
)
WHERE rank = 1
)
) loud ON loud.student_id = e.student_id
WHERE loud.student_id IS NULL
) nonloud ON nonloud.student_id = student.student_id
WHERE nonloud.student_id IS NOT NULL

