select pizzeria.name,
       pizzeria.rating
from pizzeria
         left join person_visits pv on pizzeria.id = pv.pizzeria_id
where pv.id is null;
