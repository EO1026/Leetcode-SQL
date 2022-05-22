# Write your MySQL query statement below
with t as (select *, 
           count(*) cnt, 
           sum(if(contact_email in (select email from customers),1,0)) trusted_cnt
           from contacts
           group by user_id)
           
select i.invoice_id, 
       c.customer_name, 
       i.price, 
       ifnull(t.cnt,0) contacts_cnt, 
       ifnull(t.trusted_cnt,0) trusted_contacts_cnt
from invoices i left join t on i.user_id = t.user_id 
left join customers c on i.user_id = c.customer_id 
order by i.invoice_id