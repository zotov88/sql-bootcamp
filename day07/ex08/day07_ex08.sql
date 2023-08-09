select address,
       pz.name,
       count(*) as count_of_orders
from person p
         join person_order po on p.id = po.person_id
         join menu m on po.menu_id = m.id
         join pizzeria pz on pz.id = m.pizzeria_id
group by pz.name, address
order by 1, 2;