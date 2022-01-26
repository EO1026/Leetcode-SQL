# Write your MySQL query statement below
select b.book_id, name
from books b left join (select * from orders
where timestampdiff(year, dispatch_date, '2019-06-23') < 1) o using(book_id)
where timestampdiff(month, available_from, '2019-06-23') > 1
group by 1
having ifnull(sum(quantity),0) < 10