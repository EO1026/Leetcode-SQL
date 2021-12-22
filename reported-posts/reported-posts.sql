# Write your MySQL query statement below
select extra as report_reason, count(distinct post_id) as report_count
from actions
WHERE
ACTION = 'report' and action_date = '2019-07-04'
group by extra