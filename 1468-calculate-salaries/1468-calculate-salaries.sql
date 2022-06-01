Select A.company_id, A.employee_id, A.employee_name,
case when max(B.salary)>10000 then round(A.salary*0.51,0)
when max(B.salary)>=1000 and max(B.salary)<=10000 then round(A.salary*0.76,0)
else A.salary end as salary
From Salaries A Left join Salaries B on A.company_id=B.company_id
group by 1,2
