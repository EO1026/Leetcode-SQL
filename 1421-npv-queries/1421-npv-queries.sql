# Write your MySQL query statement below

select q.id, q.year, ifnull(npv,0) as npv 
from Queries q
left join NPV n
on q.year = n.year and q.id = n.id 
