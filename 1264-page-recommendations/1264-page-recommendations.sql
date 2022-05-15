# Write your MySQL query statement below
select distinct b.page_id as recommended_page
from Friendship a
inner join likes b
on a.user1_id = b.user_id or a.user2_id = b.user_id
where (a.user1_id = 1 or a.user2_id = 1) and b.page_id not in (select page_id from likes where user_id = 1)