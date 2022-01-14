# Write your MySQL query statement below
SELECT CASE WHEN a.tmp > b.tmp THEN 'New York University'
            WHEN a.tmp < b.tmp THEN 'California University'
            ELSE 'No Winner'
            END AS winner
FROM (SELECT SUM(IF(ny.score>=90,1,0)) as tmp
    FROM NewYork ny)a,
    (SELECT SUM(IF(ca.score>=90,1,0)) as tmp
    FROM California ca)b