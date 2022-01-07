# Write your MySQL query statement below
select sub.machine_id, round(avg(sub.total_time),3) as processing_time from (
    select machine_id, process_id, (max(timestamp) - min(timestamp)) as total_time
    from Activity
    group by machine_id, process_id) sub
group by sub.machine_id
