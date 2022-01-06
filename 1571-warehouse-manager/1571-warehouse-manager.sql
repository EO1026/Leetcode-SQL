# Write your MySQL query statement below
select distinct w.name as warehouse_name, sum(t.vol*w.units)as volume
from warehouse w
left join (select product_id, Width*Length*Height as vol
          from products) as t
on w.product_id = t.product_id
group by w.name 

