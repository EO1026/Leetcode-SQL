# Write your MySQL query statement below
select a.project_id, a.employee_id
from (select p.project_id, p.employee_id, dense_rank()over(partition by project_id order by experience_years desc) as rk
     from project as p
     left join employee as e
     on e.employee_id = p.employee_id) as a
where rk=1