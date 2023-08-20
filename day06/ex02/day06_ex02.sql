select p.name,
       pizza_name,
       price,
       (price - price * discount / 100) as discount_price,
       p2.name                          as pizzeria_name
from person_order
         join menu m on m.id = person_order.menu_id
         join person p on p.id = person_order.person_id
         join person_discounts pd on p.id = pd.person_id
    and pd.pizzeria_id = m.pizzeria_id
         join pizzeria p2 on m.pizzeria_id = p2.id
order by 1, 2;