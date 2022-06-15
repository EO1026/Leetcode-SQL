# Write your MySQL query statement below
 With cte as (Select product_id, year(purchase_date) as year_
 From Orders 
 group by product_id, year(purchase_date)
 having count(1) >= 3)
 
 Select distinct c1.product_id
 From cte c1 join cte c2
 on c1.product_id = c2.product_id and c1.year_ = c2.year_+1