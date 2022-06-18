# Write your MySQL query statement below
with cte as
(select home_team_id as team_id, home_team_goals as goal_for,away_team_goals as goal_against
from matches
union all
select away_team_id as team_id, away_team_goals as goal_for,home_team_goals as goal_against
from matches),
goals as (select team_id,goal_for, goal_against
, case when goal_for > goal_against then 3
when goal_for = goal_against then 1
else 0 end as points
from cte )

select t.team_name
, count(*) as matches_played
, sum(g.points) as points
, sum(g.goal_for) as goal_for
, sum(g.goal_against) as goal_against
, sum(g.goal_for)-sum(goal_against) as goal_diff
from goals g join Teams t on g.team_id=t.team_id
group by g.team_id,t.team_name
order by 3 desc,6 desc, 1 asc