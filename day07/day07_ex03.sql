with orders as (select pz.name,
                       count(*) as count,
                       'visit'  as action_type
                from pizzeria pz
                         join public.person_visits pv on pz.id = pv.pizzeria_id
                group by pz.name),
     visits as (select pz.name,
                       count(*) as count,
                       'order'  as action_type
                from person p
                         join public.person_order po on p.id = po.person_id
                         join public.menu m on m.id = po.menu_id
                         join public.pizzeria pz on pz.id = m.pizzeria_id
                group by pz.name)
select orders.name                                as name,
       (orders.count + coalesce(visits.count, 0)) as total_count
from orders
         left join visits on visits.name = orders.name
order by total_count desc, name