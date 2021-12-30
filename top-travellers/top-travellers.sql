# Write your MySQL query statement below
select name, ifnull(sum(distance),0) as travelled_distance
from Users u 
left join Rides r
on r.user_id = u.id
group by name
order by travelled_distance desc, name asc
