create view v_generated_dates as
select days::date
from generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day') as days
order by days;