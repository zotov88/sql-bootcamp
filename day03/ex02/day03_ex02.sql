with not_order_menu_id as (select id as menu_id
                           from menu
                           except
                           select menu_id
                           from person_order)
select pizza_name,
       price,
       pz.name as pizzeria_name
from not_order_menu_id no
         join menu m on no.menu_id = m.id
         join pizzeria pz on m.pizzeria_id = pz.id
order by 1, 2
