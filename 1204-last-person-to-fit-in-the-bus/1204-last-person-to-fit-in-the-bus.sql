# Write your MySQL query statement below
SELECT person_name
FROM (SELECT *, SUM(weight) OVER(ORDER BY Turn) AS Total_Weight
      FROM Queue) as a
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC
LIMIT 1