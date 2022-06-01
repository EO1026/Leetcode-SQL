# Write your MySQL query statement below
select company_id, employee_id, employee_name,
case when mx < 1000 then salary
    when mx <= 10000 then round(salary * (1-0.24))
    else round (salary * 0.51)
    end as salary
from (select company_id, employee_id, employee_name, salary, max(salary) over(partition by company_id) mx
from salaries) temp