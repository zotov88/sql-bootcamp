select order_date             AS action_date,
       (select name
        from person
        where id = person_order.person_id) AS person_name
from person_order
intersect
select visit_date,
       (select name
        from person
        where id = person_visits.person_id)
from person_visits
order by action_date, person_name desc;