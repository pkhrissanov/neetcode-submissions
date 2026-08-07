SELECT transaction_id 
FROM (
SELECT transaction_id, RANK() OVER (
    PARTITION BY DATE(day)
    ORDER BY amount DESC 
) AS rank
FROM transactions
) t
WHERE t.rank = 1
ORDER BY t.transaction_id 