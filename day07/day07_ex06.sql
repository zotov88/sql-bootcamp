with orders as (select name,
                       count(order_date)                        as count_of_orders,
                       round(sum(price) / count(order_date), 2) as average_price,
                       max(price)                               as max_price,
                       min(price)                               as min_price
                from pizzeria pz
                         join menu m on pz.id = m.pizzeria_id
                         left join person_order po on m.id = po.menu_id
                where order_date is not null
                group by name),
     orders_is_null as (select name,
                               0 as count_of_orders,
                               0 as average_price,
                               0 as max_price,
                               0 as min_price
                        from pizzeria pz
                                 join menu m on pz.id = m.pizzeria_id
                                 left join person_order po on m.id = po.menu_id
                        group by name
                        having count(order_date) = 0)
select *
from orders
union
select *
from orders_is_null
order by name;
