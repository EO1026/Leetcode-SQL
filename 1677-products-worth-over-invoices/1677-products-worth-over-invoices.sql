# Write your MySQL query statement below
#select name,coalesce(sum(rest),0) rest,coalesce(sum(paid),0) paid, coalesce(sum(canceled),0) canceled, coalesce(sum(refunded),0) refunded
#from product p left join invoice i on i.product_id = p.product_id
#group by name order by 1

select name, coalesce(sum(rest),0) as rest, coalesce(sum(paid),0) as paid, coalesce(sum(canceled),0) as canceled, coalesce(sum(refunded),0) as refunded
from product p
left join invoice i
on p.product_id = i.product_id
group by name
order by 1

