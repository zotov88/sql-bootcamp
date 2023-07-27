select p.name,
       count(*) as count_of_visits
from person p
         join public.person_visits pv on p.id = pv.person_id
group by p.name
order by 2 desc, 1
limit 4;