with men_orders as (select pz.name
                    from person p
                             join person_order po on p.id = po.person_id
                             join menu m on po.menu_id = m.id
                             join pizzeria pz on pz.id = m.pizzeria_id
                    where gender = 'male'),
     women_orders as (select pz.name
                      from person p
                               join person_order po on p.id = po.person_id
                               join menu m on po.menu_id = m.id
                               join pizzeria pz on pz.id = m.pizzeria_id
                      where gender = 'female'),
     only_men_orders as (select *
                         from men_orders
                         except
                         select *
                         from women_orders),
     only_women_orders as (select *
                           from women_orders
                           except
                           select *
                           from men_orders)
select *
from only_men_orders
union
select *
from only_women_orders