select p.name
from person p
         join person_order po on p.id = po.person_id
         join menu m on po.menu_id = m.id
where (p.address = 'Moscow' or p.address = 'Samara')
  and p.gender = 'male'
  and (m.pizza_name = 'pepperoni pizza' or m.pizza_name = 'mushroom pizza' or
       (m.pizza_name = 'pepperoni pizza' and m.pizza_name = 'mushroom pizza'))
order by 1 desc