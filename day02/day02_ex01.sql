select vd_1.visit_date as missing_date
from (select visit_date
      from person_visits
      where visit_date between '2022-01-01' and '2022-01-10'
      group by visit_date) vd_1
         left join (select person_id, visit_date
                    from person_visits
                    where person_id = 1
                       or person_id = 2
                    group by person_id, visit_date) vd_2
                   on vd_1.visit_date = vd_2.visit_date
where person_id is null
order by missing_date;