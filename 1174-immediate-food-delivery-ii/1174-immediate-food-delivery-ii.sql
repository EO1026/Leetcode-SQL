# Write your MySQL query statement below
select round(sum(case when d.order_date  = customer_pref_delivery_date then 1 else 0 end) * 1.0 * 100/ count(*),2) immediate_percentage 
from Delivery d join 
               (select customer_id, min(order_date) order_date from Delivery group by customer_id) as min_order 
on min_order.order_date = d.order_date and min_order.customer_id  = d.customer_id 