# Write your MySQL query statement below
select count(account_id) as accounts_count
from(SELECT account_id,session_id
     FROM Subscriptions left join (select* from Streams 
                                   where year(stream_date)=2021)a 
     using (account_id)
     where year(start_date)=2021 or year(end_date)=2021 )b
where session_id is null