select address,
       round(max(age) - min(age)::numeric / max(age), 2)  as formula,
       round(avg(age), 2)                                 as average,
       max(age) - min(age)::numeric / max(age) > avg(age) as comparison
from person
group by address
order by 1;