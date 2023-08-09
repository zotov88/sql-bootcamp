select days as missing_date
from v_generated_dates
         left join person_visits on v_generated_dates.days = person_visits.visit_date
where visit_date is null
order by 1