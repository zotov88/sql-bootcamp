drop function if exists fnc_trg_person_delete_audit() cascade;
drop function if exists fnc_trg_person_update_audit() cascade;
drop function if exists fnc_trg_person_insert_audit() cascade;
truncate table person_audit;

create or replace function fnc_trg_person_audit() returns trigger as
$BODY$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit
        select now() at time zone 'utc-3', 'I', new.*;
    elsif (tg_op = 'UPDATE') then
        insert into person_audit
        select now() at time zone 'utc-3', 'U', old.*;
    elsif (tg_op = 'DELETE') then
        insert into person_audit
        select now() at time zone 'utc-3', 'D', old.*;
    end if;
    return null;
end;

$BODY$ language plpgsql;

create or replace trigger trg_person_audit
    after insert or update or delete
    on person
    for each row
execute procedure fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;