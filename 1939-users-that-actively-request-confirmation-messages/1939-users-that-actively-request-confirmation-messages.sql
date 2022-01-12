# Write your MySQL query statement below
select distinct c1.user_id
from confirmations c1 join confirmations c2
on c1.user_id = c2.user_id
and abs(timestampdiff(second,c1.time_stamp,c2.time_stamp)) <= 86400
where c1.time_stamp < c2.time_stamp