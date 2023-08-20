-- drop function if exists fnc_person_visits_and_eats_on_date(pperson varchar, pprice numeric, pdate date);

create or replace function fnc_person_visits_and_eats_on_date(
    in pperson varchar default 'Dmitriy',
    in pprice numeric default 500,
    in pdate date default '2022-01-08'
)
    returns table
            (
                name_pizzeria varchar
            )
as
$body$
begin
    return query (select distinct pz.name
                  from menu m
                           join pizzeria pz on pz.id = m.pizzeria_id
                           join person_visits pv on m.pizzeria_id = pv.pizzeria_id
                           join person p on pv.person_id = p.id
                  where p.name = pperson
                    and m.price < pprice
                    and pv.visit_date = pdate);
end;
$body$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
