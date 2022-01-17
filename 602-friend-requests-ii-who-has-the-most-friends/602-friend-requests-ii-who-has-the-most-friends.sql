# Write your MySQL query statement below
SELECT id, COUNT(*) AS 'num'
FROM (SELECT requester_id AS 'id', accepter_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id, requester_id
    FROM RequestAccepted) as t
GROUP BY 1
ORDER BY COUNT(*) DESC LIMIT 1