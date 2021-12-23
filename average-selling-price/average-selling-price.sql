# Write your MySQL query statement below

select p.product_id, round(sum(price*units)/sum(units),2) as average_price
from prices as p
inner join unitssold as u
on p.product_id = u.product_id 
where purchase_date between start_date and end_date
group by p.product_id
