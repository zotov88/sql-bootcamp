create or replace function fnc_persons_male()
    returns table
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
as
$body$
select *
from person
where gender = 'male';

$body$ language sql;

create or replace function fnc_persons_female()
    returns table
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
as
$body$
select *
from person
where gender = 'female';

$body$ language sql;

select *
from fnc_persons_male();

select *
from fnc_persons_female();