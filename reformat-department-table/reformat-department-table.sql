# Write your MySQL query statement below
SELECT id,
sum(IF(month='Jan', revenue, null)) AS Jan_Revenue,
sum(IF(month='Feb', revenue, null)) AS Feb_Revenue,
sum(IF(month="Mar", revenue, null)) AS Mar_Revenue,
sum(IF(month="Apr", revenue, null)) AS Apr_Revenue,
sum(IF(month="May", revenue, null)) AS May_Revenue,
sum(IF(month="Jun", revenue, null)) AS Jun_Revenue,
sum(IF(month="Jul", revenue, null)) AS Jul_Revenue,
sum(IF(month="Aug", revenue, null)) AS Aug_Revenue,
sum(IF(month="Sep", revenue, null)) AS Sep_Revenue,
sum(IF(month="Oct", revenue, null)) AS Oct_Revenue,
sum(IF(month="Nov", revenue, null)) AS Nov_Revenue,
sum(IF(month="Dec", revenue, null)) AS Dec_Revenue
FROM Department
GROUP BY id;