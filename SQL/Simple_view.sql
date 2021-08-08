/* 5 Kyu Kata
https://www.codewars.com/kata/5811527d9d278b242f000006/train/sql
For this challenge you need to create a VIEW. This VIEW is used by a sales store to give out vouches to members who have spent over $1000 in departments that have brought in more than $10000 total ordered by the members id.
The VIEW must be called members_approved_for_voucher then you must create a SELECT query using the view.

*/

create view members_approved_for_voucher as
select members.id,
members.name,
email,
sum(products.price) as total_spending
from sales join members on members.id = sales.member_id
join products on products.id = sales.product_id
join departments on departments.id = sales.department_id
where department_id in 
  (select department_id
   from sales join departments on departments.id = sales.department_id
   join products on products.id = sales.product_id
   group by department_id
   having sum(price) > 10000)
group by members.id,members.name,email
having sum(products.price) > 1000
order by members.id asc;

select *
from members_approved_for_voucher



#Best answer

CREATE VIEW members_approved_for_voucher AS
SELECT m.id, m.name, m.email, SUM(p.price) AS total_spending
FROM members m
INNER JOIN sales s ON s.member_id = m.id
INNER JOIN products p ON p.id = s.product_id
WHERE s.department_id IN (
  SELECT s2.department_id
  FROM sales s2
  INNER JOIN products p2 ON p2.id = s2.product_id
  GROUP BY s2.department_id
  HAVING SUM(p2.price) > 10000
)
GROUP BY m.id, m.name, m.email
HAVING SUM(p.price) > 1000
ORDER BY m.id;

SELECT * FROM members_approved_for_voucher;

