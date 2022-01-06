# Write your MySQL query statement below
select name, sum(t.amount) as balance
from users as u
left join transactions as t
on u.account =t.account 
group by name
having sum(t.amount) >10000