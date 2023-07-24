with filtred_pizza as (select person_id, m.pizza_name
                       from menu m
                                join person_order po on m.id = po.menu_id
                       where m.pizza_name = 'pepperoni pizza'
                          or m.pizza_name = 'cheese pizza'
                       group by person_id, m.pizza_name)
select p.name
from person p
         join filtred_pizza fp on p.id = fp.person_id
where p.gender = 'female'
group by p.name
having count(p.name) = 2
order by p.name;