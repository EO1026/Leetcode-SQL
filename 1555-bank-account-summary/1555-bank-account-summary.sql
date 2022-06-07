# Write your MySQL query statement below

WITH transations_new
     AS (SELECT paid_by  AS user_id, amount * -1 AS amount
         FROM   transactions
         UNION ALL
         SELECT paid_to AS user_id, amount
         FROM   transactions)
SELECT u.user_id, u.user_name,
       credit + Sum(COALESCE(t.amount, 0)) AS credit,
       CASE
         WHEN credit + Sum(COALESCE(t.amount, 0)) < 0 THEN 'Yes'
         ELSE 'No'
       END AS credit_limit_breached
FROM   users u
       LEFT JOIN transations_new t using (user_id)
GROUP  BY u.user_id,
          u.user_name
 

