# Write your MySQL query statement below
SELECT
    LEFT(trans_date, 7) as month,
    country,
    COUNT(*) as trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 ELSE NULL END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM Transactions
GROUP BY 1,2