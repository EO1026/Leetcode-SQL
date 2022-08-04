# Write your MySQL query statement below

select project_id from
(
select project_id,
rank() over(order by count(employee_id) desc) as rnk
from 
project group by project_id ) a
where rnk=1