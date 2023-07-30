drop function if exists func_minimum(arr numeric[]);

create or replace function func_minimum(variadic arr numeric[])
    returns numeric as
$body$
select min(arr[index])
from generate_subscripts(arr, 1) gs(index)
$body$ language sql;

SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);