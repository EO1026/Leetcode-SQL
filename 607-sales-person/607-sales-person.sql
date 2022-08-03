# Write your MySQL query statement below
SELECT s.name
from salesperson as s
where sales_id not in (
    select sales_id
    from orders as o left join company as c
    on c.com_id = o.com_id
    where c.name = "RED")
