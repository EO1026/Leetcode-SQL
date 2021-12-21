# Write your MySQL query statement below
select distinct buyer_id 
from sales as s 
inner join product as p
on s.product_id = p.product_id
where product_name= "S8"
and buyer_id not in (select s.buyer_id as buyiphone
     from sales as s 
     inner join product as p
     on s.product_id = p.product_id
     where product_name = "iPhone")