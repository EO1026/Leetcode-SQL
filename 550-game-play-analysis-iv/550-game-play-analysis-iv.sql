# Write your MySQL query statement below
SELECT ROUND(COUNT(DISTINCT(A2.player_id)) /(SELECT COUNT(DISTINCT(player_id)) FROM Activity),2) AS fraction
FROM(
SELECT player_id,
min(event_date) AS event_date
FROM Activity
GROUP BY player_id) A1
JOIN Activity A2
ON A1.player_id = A2.player_id AND datediff(A2.event_date,A1.event_date) = 1