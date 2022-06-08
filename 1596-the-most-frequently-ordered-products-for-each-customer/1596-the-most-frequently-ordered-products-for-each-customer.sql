SELECT customer_id, product_id, product_name
FROM ( SELECT  
o.customer_id,p.product_id, p.product_name,
RANK() OVER(PARTITION BY customer_id ORDER BY count(*) DESC) rk
FROM  orders o
JOIN  products p
ON  p.product_id= o.product_id
GROUP BY  o.customer_id, p.product_id
ORDER BY  customer_id) t
WHERE rk=1 ;

