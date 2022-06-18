# Write your MySQL query statement below
with t1 as (select order_id, sum(quantity)/count(product_id) as prod_avg from ordersdetails
group by order_id),
t2 as (select order_id, max(quantity) as max_qty from ordersdetails
group by order_id)
select order_id from t2 where max_qty > (select max(prod_avg) from t1)