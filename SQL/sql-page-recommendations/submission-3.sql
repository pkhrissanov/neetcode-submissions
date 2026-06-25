-- Write your query below
SELECT DISTINCT page_id AS recommended_page
FROM likes 
WHERE user_id IN (
    SELECT GREATEST(user1_id, user2_id)
    FROM friendship
    WHERE LEAST(user1_id, user2_id) = 1

) AND page_id NOT IN (
    SELECT page_id
    FROM likes
    WHERE user_id = 1
)
