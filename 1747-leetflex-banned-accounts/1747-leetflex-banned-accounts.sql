# Write your MySQL query statement below
SELECT DISTINCT l1.account_id
FROM LogInfo as l1
left join LogInfo as l2
on l1.account_id = l2.account_id
where l1.login between l2.login and l2.logout and l1.ip_address <> l2.ip_address