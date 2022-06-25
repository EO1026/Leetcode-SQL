# Write your MySQL query statement below
select count(distinct sub.account_id) as accounts_count
from Subscriptions sub 
left join Streams stream 
on sub.account_id =  stream.account_id
where (year(sub.end_date) = 2021 or year(sub.start_date) = 2021) and year(stream.stream_date)!= 2021
