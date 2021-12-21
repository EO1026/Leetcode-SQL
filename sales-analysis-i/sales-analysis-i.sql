# Write your MySQL query statement below
SELECT seller_id 
from (select seller_id, rank()over(order by sum(price) desc) as rk
     from sales
      group by seller_id) a
where rk = 1