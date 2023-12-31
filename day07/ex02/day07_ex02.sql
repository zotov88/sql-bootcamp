with orders as (select pz.name,
                       count(*) as count,
                       'visit'  as action_type
                from pizzeria pz
                         join person_visits pv on pz.id = pv.pizzeria_id
                group by pz.name
                limit 3),
     visits as (select pz.name,
                       count(*) as count,
                       'order'  as action_type
                from person p
                         join person_order po on p.id = po.person_id
                         join menu m on m.id = po.menu_id
                         join pizzeria pz on pz.id = m.pizzeria_id
                group by pz.name
                limit 3)
select *
from orders
union
select *
from visits
order by action_type, count desc