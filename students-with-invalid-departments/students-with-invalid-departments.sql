# Write your MySQL query statement below
select s.id, s.name 
from Students as s
left join Departments d
on d.id = s.department_id
where d.id is null