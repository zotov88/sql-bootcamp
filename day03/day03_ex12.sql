insert into person_order(id, person_id, menu_id, order_date)
select t                                                      as id,
       p.id                                                   as person_id,
       (select id from menu where pizza_name = 'greek pizza') as menu_id,
       '2022-02-25'
from person p
         join generate_series((select max(id) from person_order),
                              (select max(id) from person_order) + (select max(id) from person),
                              1) as t
              on p.id = t - (select max(id) from person_order);