# Write your MySQL query statement below
WITH cte AS (
    SELECT machine_id, process_id,
    (SUM(CASE WHEN activity_type = 'end' THEN timestamp END) -
    SUM(CASE WHEN activity_type = 'start' THEN timestamp END)) AS 'diff'
    FROM Activity
    GROUP BY 1,2
)
SELECT machine_id, ROUND((SUM(diff) / COUNT(process_id)), 3) AS 'processing_time'
FROM cte
GROUP BY 1
ORDER BY 1
 
