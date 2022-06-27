# Write your MySQL query statement below
select city_id, day, degree
from (
	select city_id, 
	   day, 
	   degree, 
	   rank() over(partition by city_id order by degree desc, day asc) as 'rnk'
	from Weather) as subq
where rnk = 1
order by city_id asc	