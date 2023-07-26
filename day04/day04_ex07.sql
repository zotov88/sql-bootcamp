insert into person_visits(id, person_id, pizzeria_id, visit_date)
values ((select max(id) + 1 from person_visits),
        (select id from person where name = 'Dmitriy'),
        (select pz.id
         from pizzeria pz
                  join menu m on pz.id = m.pizzeria_id
         where m.price < 800
           and pz.id <> 4
         order by random()
         limit 1),
        '2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;