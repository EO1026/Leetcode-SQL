# Write your MySQL query statement below
with temp_transaction as (
    SELECT account_id,
           day,
           date_format(day,'%Y%m') as trans_month,
           sum(amount)

    FROM
        Transactions
    WHERE type='Creditor'
    Group by account_id, date_format(day,'%Y%m')
    Having sum(amount)> (SELECT max_income FROM Accounts where account_id= Transactions.account_id)
), monthly_transaction as (
    SELECT *,
        lag(trans_month, 1) over(partition by  account_id order by trans_month) as prev_mnth
FROM temp_transaction
) 
SELECT DISTINCT account_id
FROM monthly_transaction
WHERE prev_mnth=date_format(DATE_ADD(day, INTERVAL -1 MONTH),'%Y%m')
