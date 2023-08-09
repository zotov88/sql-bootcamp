select m.pizza_name as pizza_name,
       p.name       as pizzeria_name,
       m.price      as price
from menu m
         join pizzeria p on p.id = m.pizzeria_id
where m.pizza_name ilike 'pepperoni pizza'
   or m.pizza_name ilike 'mushroom pizza'
order by 1, 2;