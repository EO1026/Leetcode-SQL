# Write your MySQL query statement below
select Department,Employee,Salary from (
Select d.Name as Department, e.Name Employee, Salary, Rank() OVER(partition by DepartmentId order by Salary desc) as 'rank' 
from Employee e inner join Department d 
on e.DepartmentId  = d.id
 )  a
where a.rank = 1
order by a.Department,a.Employee
