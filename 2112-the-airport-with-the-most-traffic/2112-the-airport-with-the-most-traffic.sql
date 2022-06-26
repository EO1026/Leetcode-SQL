# Write your MySQL query statement below
select airport_id
from (select distinct airport_id, dense_rank() over (order by sum(flights_count) desc) busy_rank 
      from (select departure_airport as airport_id, flights_count from flights f1
            Union ALL
            select arrival_airport as airport, flights_count from flights f2
            ) cte group by airport_id
     ) xyz 
where busy_rank = 1;