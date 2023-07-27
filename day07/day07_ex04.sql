select name,
       count(*) as count_of_visits
from person
         join person_visits pv on person.id = pv.person_id
group by name
having count(*) > 3
order by count_of_visits desc, name;
