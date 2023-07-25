create view v_price_with_discount as
select p.name,
       m.pizza_name as pizza_name,
       price,
       round((price - price * 0.1), 0) as discount_price
from person p
         join person_order po on p.id = po.person_id
         join menu m on m.id = po.menu_id
order by 1, 2