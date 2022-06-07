# Write your MySQL query statement below

SELECT b.product_name, a.product_id, a.order_id, a.order_date
FROM(SELECT order_id, product_id, order_date,
rank() over(partition by product_id order by order_date DESC) AS sale_rank
FROM Orders
)a JOIN Products b ON a.product_id = b.product_id
WHERE a.sale_rank =1
ORDER BY b.product_name ASC, a.product_id ASC, a.order_id ASC;

