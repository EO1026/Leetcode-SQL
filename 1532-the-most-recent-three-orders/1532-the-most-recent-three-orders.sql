# Write your MySQL query statement below
Select customer_name, customer_id, order_id, order_date
from (Select name customer_name, o.customer_id, order_id, order_date,
row_number() over (partition by customer_id order by order_date desc) order_num 
from
orders o inner join customers c on o.customer_id = c.customer_id) k 
where order_num <=3  
order by 1,2,4 desc