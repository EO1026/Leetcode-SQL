# Write your MySQL query statement below
select team_id, team_name, sum(num_points) as num_points
from
((select team_id, team_name, 
       case when host_goals > guest_goals then 3 
            when host_goals = guest_goals then 1 else 0 end as     
            num_points
  from Teams t left join Matches m on t.team_id = m.host_team)
union all
(select team_id, team_name, 
       case when guest_goals > host_goals then 3 
            when host_goals = guest_goals then 1 else 0 end as    
            num_points
       from Teams t left join Matches m on t.team_id = m.guest_team)) as a
group by team_id
order by num_points desc, team_id asc