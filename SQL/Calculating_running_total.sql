
/* 5 Kyu Kata
https://www.codewars.com/kata/589cf45835f99b2909000115/train/sql
Given a posts table that contains a created_at timestamp column write a query that returns date (without time component), 
a number of posts for a given date and a running (cumulative) total number of posts up until a given date. 
The resulting set should be ordered chronologically by date.

*/


select CAST (created_at AS date) as date,count(created_at) as count 
,cast (sum(count(created_at)) over (order by CAST (created_at AS date)) as int) as total

from posts

group by date
order by date asc



# Best answer

SELECT
  CREATED_AT::DATE AS DATE,
  COUNT(CREATED_AT) AS COUNT,
  SUM(COUNT(CREATED_AT)) OVER (ORDER BY CREATED_AT::DATE ROWS UNBOUNDED PRECEDING)::INT AS TOTAL
FROM
  POSTS
GROUP BY
  CREATED_AT::DATE


# Another answer


SELECT created_at::date AS "date", COUNT(*) AS count,
    SUM(COUNT(*)::int) OVER (ORDER BY created_at::date) AS total
  FROM posts
  GROUP BY created_at::date
  ORDER BY created_at::date

