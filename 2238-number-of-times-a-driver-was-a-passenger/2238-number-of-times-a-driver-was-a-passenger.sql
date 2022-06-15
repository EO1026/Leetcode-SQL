# Write your MySQL query statement below
select a.driver_id, count(r.passenger_id) as cnt
from
	(select distinct driver_id from Rides)a
	left join Rides r on a.driver_id = r.passenger_id
group by a.driver_id