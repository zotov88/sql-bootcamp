select
    (select name
    from person
    where id = person_id) AS person_name,
    (select name
    from pizzeria
    where id = pizzeria_id) AS pizzeria_name
from (select person_id, pizzeria_id
      from person_visits
      where visit_date between '2022-01-07' and '2022-01-09') AS pv
order by person_name, pizzeria_name desc;