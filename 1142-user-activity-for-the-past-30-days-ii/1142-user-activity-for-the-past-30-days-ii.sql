# Write your MySQL query statement below
SELECT IfNULL(ROUND(AVG(sessions), 2), 0.00) AS average_sessions_per_user
FROM (SELECT user_id, COUNT(DISTINCT session_id)*1.00 as sessions
FROM Activity
WHERE datediff("2019-07-27",activity_date) <30 and activity_date <= "2019-07-27"
GROUP BY user_id) AS temp_table
