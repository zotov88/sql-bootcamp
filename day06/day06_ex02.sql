select p.name,
       pizza_name,
       price,
       (price - price * discount / 100) as discount_price,
       pz.name as pizzeria_name
from person p
         join person_discounts pd on p.id = pd.person_id
         join pizzeria pz on pd.pizzeria_id = pz.id
         join menu m on pz.id = m.pizzeria_id
order by 1, 2;