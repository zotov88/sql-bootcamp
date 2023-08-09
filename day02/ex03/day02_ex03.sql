with visits_days as (select visit_date
                     from person_visits
                     where visit_date between '2022-01-01' and '2022-01-10'
                     group by visit_date),
     filtered_visit_persons as (select person_id, visit_date
                                from person_visits
                                where person_id = 1
                                   or person_id = 2
                                group by person_id, visit_date)
select vd.visit_date as missing_date
from visits_days vd
         left join filtered_visit_persons fvp on vd.visit_date = fvp.visit_date
where person_id is null
order by missing_date