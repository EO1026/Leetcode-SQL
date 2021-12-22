# Write your MySQL query statement below
SELECT product_id, product_name
FROM product 
where product_id not in (select product_id
                        from sales 
                        where sale_date >"2019-03-31" 
                        or sale_date <"2019-01-01")
and product_id in (select product_id
                   from sales 
                   where sale_date between "2019-01-01" and "2019-03-31")