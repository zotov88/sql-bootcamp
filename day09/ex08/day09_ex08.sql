drop function if exists fnc_fibonacci(pstop integer);

create or replace function fnc_fibonacci(in pstop integer default 10)
    returns setof integer as
$body$
with recursive fib(id, current, previous) as (select 1, 0, 0
                                              union all
                                              select 2, 1, 0
                                              union all
                                              select id + 1,
                                                     current + previous,
                                                     current
                                              from fib
                                              where current + previous < pstop
                                                and id > 1)
select current
from fib
$body$ language sql;

select *
from fnc_fibonacci(100);

select *
from fnc_fibonacci(2);

select *
from fnc_fibonacci();