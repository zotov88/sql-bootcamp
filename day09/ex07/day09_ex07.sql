drop function if exists func_minimum(arr numeric[]);

create or replace function func_minimum(variadic arr numeric[])
    returns numeric as
$body$
select min(arr[i])
from generate_subscripts(arr, 1) gs(i)
$body$ language sql;

SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);