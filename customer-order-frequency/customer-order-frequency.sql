# Write your MySQL query statement below
select o.customer_id, c.name
from (Orders o join Customers c on o.customer_id = c.customer_id)
join Product p on p.product_id = o.product_id
group by o.customer_id
having sum(case when order_date between '2020-06-01' and '2020-06-30' then quantity*price end) >=100
and sum(case when order_date between '2020-07-01' and '2020-07-31' then quantity*price end) >=100
