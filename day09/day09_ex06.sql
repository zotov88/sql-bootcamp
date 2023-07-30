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
                  from person p
                           join public.person_order po on p.id = po.person_id
                           join public.menu m on m.id = po.menu_id
                           join public.pizzeria pz on pz.id = m.pizzeria_id
                           join public.person_visits pv on pz.id = pv.pizzeria_id
                  where p.name = pperson
                    and m.price < pprice
                    and po.order_date = pdate
                    and pv.visit_date = pdate);
end;
$body$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
