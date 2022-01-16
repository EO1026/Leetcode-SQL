# Write your MySQL query statement below
select round(sum(TIV_2016),2) TIV_2016
from insurance
where TIV_2015 in (select TIV_2015 from insurance group by TIV_2015 having count(PID) > 1) -- Have the same TIV_2015 value as one or more other policyholders.
and (LAT,LON) in (select LAT,LON from insurance group by LAT,LON having count(PID) = 1)
-- Are not located in the same city as any other policyholder