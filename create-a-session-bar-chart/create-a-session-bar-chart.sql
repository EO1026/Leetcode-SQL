# Write your MySQL query statement below

SELECT '[0-5>' as bin, count(duration) total from sessions where duration/60<5
union 
SELECT '[5-10>' as bin, count(duration) total from sessions where duration/60>=5 and duration/60<10
union 
SELECT '[10-15>' as bin, count(duration) total from sessions where duration/60<15 and duration/60>=10
union  
SELECT '15 or more' as bin, count(duration) total from sessions where duration/60>=15
