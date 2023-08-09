select (case
            when p.name is null then '-'
            else p.name
        end)                  as person_name,
       v.visit_date           as visit_date,
       coalesce(pz.name, '-') as pizzeria_name
from person p
         full join (select *
                    from person_visits
                    where visit_date between '2022-01-01' and '2022-01-03') v on p.id = v.person_id
         full join pizzeria pz on pz.id = v.pizzeria_id
order by 1, 2, 3