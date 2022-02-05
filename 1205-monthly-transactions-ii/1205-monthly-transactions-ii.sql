# Write your MySQL query statement below
WITH u AS ((SELECT * FROM Transactions WHERE state = "approved")
UNION ALL
(SELECT t.id, country, "chargebacks" AS state, amount, c.trans_date
FROM Transactions t
RIGHT JOIN Chargebacks c ON t.id = c.trans_id))

SELECT LEFT(trans_date,7) month,country,
COUNT(CASE WHEN state='approved' THEN 1 ELSE null END)approved_count,
SUM(CASE WHEN state='approved'THEN amount ELSE 0 END) approved_amount,
COUNT(CASE WHEN state='chargebacks' THEN 1 ELSE null END)chargeback_count,
SUM(CASE WHEN state='chargebacks' THEN amount ELSE 0 END)chargeback_amount
FROM u
GROUP BY 1,2