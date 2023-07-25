with andrey_visits as (select pz.name
                       from person p
                                join person_visits pv on p.id = pv.person_id
                                join pizzeria pz on pz.id = pv.pizzeria_id
                       where p.name = 'Andrey'),
     andrey_orders as (select pz.name
                       from person p
                                join person_order po on p.id = po.person_id
                                join menu m on m.id = po.menu_id
                                join pizzeria pz on m.pizzeria_id = pz.id
                       where p.name = 'Andrey')
select name as pizzeria_name
from andrey_visits
except all
select *
from andrey_orders
order by 1;