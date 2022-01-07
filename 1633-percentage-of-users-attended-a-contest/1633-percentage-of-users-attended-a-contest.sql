# Write your MySQL query statement below
select contest_id, round(count(distinct user_id) /(select count(user_id) c from users)*100,2) percentage
from register
group by contest_id
order by percentage desc,contest_id
