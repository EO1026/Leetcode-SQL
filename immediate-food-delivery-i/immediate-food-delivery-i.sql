# Write your MySQL query statement below
select round(count(case when order_date = customer_pref_delivery_date then 1 end)/count(delivery_id)*100,2) as immediate_percentage
from Delivery
