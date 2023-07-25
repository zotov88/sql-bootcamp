with men as (select pz.name
             from person p
                      join person_visits pv on p.id = pv.person_id
                      join pizzeria pz on pv.pizzeria_id = pz.id
             where p.gender = 'male'),
     women as (select pz.name
               from person p
                        join person_visits pv on p.id = pv.person_id
                        join pizzeria pz on pv.pizzeria_id = pz.id
               where p.gender = 'female'),
     only_women as (select *
                    from women
                    except all
                    select *
                    from men),
     only_men as (select *
                  from men
                  except all
                  select *
                  from women)
select name as pizzeria_name
from only_men
union all
select *
from only_women
order by pizzeria_name;


