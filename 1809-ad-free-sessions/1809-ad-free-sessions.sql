# Write your MySQL query statement below
select session_id
from Playback p
left join Ads a
on timestamp between start_time and end_time and p.customer_id = a.customer_id 
where a.customer_id is null