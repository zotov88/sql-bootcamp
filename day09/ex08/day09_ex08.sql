drop function if exists fnc_fibonacci(pstop integer);

create or replace function fnc_fibonacci(in pstop integer default 10)
    returns setof decimal as
$body$
with recursive fib(id, current, previous) as (select 1, 0::decimal, 0::decimal
                                              union all
                                              select 2, 1::decimal, 0::decimal
                                              union all
                                              select id + 1,
                                                     (current + previous)::decimal,
                                                     current::decimal
                                              from fib
                                              where id < pstop
                                                and id > 1)
select current
from fib
limit pstop;
$body$ language sql;

select *
from fnc_fibonacci(100);

select *
from fnc_fibonacci(2);

select *
from fnc_fibonacci();