-- Write your query below
SELECT e.left_operand, e.operator, e.right_operand,  
CASE
WHEN e.operator = '<' THEN vl.value < vr.value 
WHEN e.operator = '=' THEN vl.value = vr.value
WHEN e.operator = '>' THEN vl.value > vr.value
END AS value
FROM expressions e
LEFT JOIN variables vl
ON vl.name = left_operand
LEFT JOIN variables vr 
ON vr.name = right_operand
