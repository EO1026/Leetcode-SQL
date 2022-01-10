# Write your MySQL query statement below
select customer_id
from 
(select customer_id, sum(revenue) as revenue from customers where year = '2021' group by customer_id having sum(revenue) > 0 
) as table1
