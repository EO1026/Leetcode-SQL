# Write your MySQL query statement below
#SELECT project_id
#FROM (SELECT PROJECT_ID, rank()over(partition by PROJECT_ID order by count(employee_id) desc) as rk
#     from project) as a
#where rk = 1

select t.project_id 
from (select project_id, count(employee_id), dense_rank() over (order by count(employee_id) desc) as my_rank
from project
group by project_id
order by count(employee_id) desc) as t
where my_rank = 1