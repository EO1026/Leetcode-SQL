                       
select p.product_id, coalesce(new_price, 10) as price
from (select product_id 
      from products 
      group by 1) as p
left join (select product_id, new_price, 
           rank() OVER (PARTITION BY product_id ORDER BY change_date DESC) as p_rank 
           from Products 
           where change_date <= '2019-08-16') as b
on p.product_id = b.product_id and p_rank = 1
