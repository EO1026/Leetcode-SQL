# Write your MySQL query statement below
SELECT gender,day, SUM(score_points) over(partition by gender order by day asc) AS total
FROM Scores
ORDER BY gender ASC, day ASC