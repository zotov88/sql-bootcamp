drop function if exists fnc_persons_male;
drop function if exists fnc_persons_female;

create or replace function fnc_person(in pgender varchar default 'female')
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
where gender = pgender;
$body$ language sql;

select *
from fnc_person();

select *
from fnc_person(pgender := 'male');