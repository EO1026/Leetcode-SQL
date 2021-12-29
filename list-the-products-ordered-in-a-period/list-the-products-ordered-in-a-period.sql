# Write your MySQL query statement below
select p.product_name, sum(o.unit) as  unit
from Products p
join orders o
on o.product_id = p.product_id
where order_Date between '2020-02-01' and '2020-02-29'
group by product_name
having sum(unit)>=100