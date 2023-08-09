create materialized view mv_dmitriy_visits_and_eats as
select pz.name
from person p
         join person_visits pv on p.id = pv.person_id
         join pizzeria pz on pv.pizzeria_id = pz.id
         join menu m on pz.id = m.pizzeria_id
where visit_date = '2022-01-08'
  and price < 800
  and p.name = 'Dmitriy';

