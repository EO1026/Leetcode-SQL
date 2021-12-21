# Write your MySQL query statement below
SELECT p.product_name, s.year, s.price
FROM sales as s
inner join product as p
on s.product_id = p.product_id
