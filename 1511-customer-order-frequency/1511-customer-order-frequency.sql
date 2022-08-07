# Write your MySQL query statement below
with cte as( 
select c.customer_id, c.name, sum(case when month(order_date)=06 then p.price*quantity else 0 end) as t6,
sum(case when month(order_date)=07 then price*quantity else 0 end) as t7
from Product p
join Orders o on p.product_id = o.product_id
join Customers c on c.customer_id=o.customer_id
group by 1,2
)


select customer_id, name
from cte
where t6>=100 and t7>=100
