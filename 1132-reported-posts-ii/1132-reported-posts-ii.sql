# Write your MySQL query statement below
SELECT ROUND(avg(avg_pct),2) average_daily_percent 
FROM (
SELECT a.action_date,
(count(distinct b.post_id)/COUNT(distinct a.post_id)*100) avg_pct
FROM actions a
LEFT JOIN Removals b
on a.post_id = b.post_id
WHERE a.extra = 'spam'
group by a.action_date) a