# Write your MySQL query statement below
select country_name, case when avg(weather_state) <= 15 then 'Cold'
                     when avg(weather_state) >= 25 then 'Hot'
                     else 'Warm' end weather_type
from Countries c 
inner join Weather w 
on c.country_id = w.country_id
#where date_format(day,'%Y-%m') = '2019-11'
where datediff("2019-11-30",day) <30 and day <= "2019-11-30"
group by country_name