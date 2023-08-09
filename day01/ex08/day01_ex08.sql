select order_date,
       concat(p.name, ' (age:', p.age, ')') as person_information
from person_order po
         natural join (select id as person_id, name, age from person) p
order by order_date, person_information;
