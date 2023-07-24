select m.pizza_name as pizza_name,
       p.name       as pizzeria_name
from person ps
         join person_order po on ps.id = po.person_id
         join menu m on m.id = po.menu_id
         join pizzeria p on m.pizzeria_id = p.id
where ps.name = 'Anna'
   or ps.name = 'Denis'
order by 1, 2
