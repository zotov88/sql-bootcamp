select p.name       as person_name,
       m.pizza_name as pizza_name,
       pz.name      as pizzeria_name
from person p
         join person_order po on p.id = po.person_id
         join menu m on po.menu_id = m.id
         join pizzeria pz on m.pizzeria_id = pz.id
order by person_name, pizza_name, pizzeria_name

