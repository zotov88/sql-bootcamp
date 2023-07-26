set enable_seqscan = off;

explain analyze

select m.pizza_name,
       p.name as pizzeria_name
from menu m join pizzeria p on p.id = m.pizzeria_id;

set enable_seqscan = on;