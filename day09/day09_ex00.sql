create table if not exists person_audit
(
    created    timestamp with time zone default now() not null,
    type_event char(1)                  default 'I'   not null,
    row_id     bigint                                 not null,
    name       varchar                                not null,
    age        integer,
    gender     varchar,
    address    varchar,
    constraint ch_type_event check (type_event = 'D' or type_event = 'U' or type_event = 'I')
);

create or replace function fnc_trg_person_insert_audit() returns trigger as
$BODY$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit
        select now() at time zone 'utc-3', 'I', new.*;
    end if;
    return null;
end;

$BODY$ language plpgsql;

create or replace trigger trg_person_insert_audit
    after insert
    on person
    for each row
execute procedure fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');