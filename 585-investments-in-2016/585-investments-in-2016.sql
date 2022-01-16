# Write your MySQL query statement below

#Method2 window function
select round(sum(tiv_2016),2) as tiv_2016 from 
    (select TIV_2016, count(pid) over(partition by tiv_2015) as c_, count(pid) over(partition by lat,lon) as c__ 
     from insurance
     order by pid) as t
where c_ > 1 and c__ =1