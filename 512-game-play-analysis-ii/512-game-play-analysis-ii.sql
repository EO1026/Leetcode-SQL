# Write your MySQL query statement below
select player_id, device_id
from (select *, rank()over (partition by player_id order by event_date asc) as rk from Activity) a
where rk=1