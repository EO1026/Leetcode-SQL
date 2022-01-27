# Write your MySQL query statement below
SELECT e.business_id
FROM Events as e
LEFT JOIN (SELECT event_type, AVG(occurences) as avg_activity FROM Events GROUP BY event_type) as x
ON e.event_type = x.event_type
WHERE e.occurences > x.avg_activity
GROUP BY e.business_id
HAVING COUNT(e.business_id) >=2