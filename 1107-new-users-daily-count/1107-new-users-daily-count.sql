# Write your MySQL query statement below
select login_Date, count(distinct a1.user_id) as user_count
from( select user_id,min(activity_Date) as login_date
 from traffic where activity='login' group by user_id) a1 
where datediff('2019-06-30',a1.login_date)<=90
group by login_date