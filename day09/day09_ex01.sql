create or replace function fnc_trg_person_update_audit() returns trigger as
$BODY$
begin
    if (tg_op = 'UPDATE') then
        insert into person_audit
        select now() at time zone 'utc-3', 'U', old.*;
    end if;
    return null;
end;

$BODY$ language plpgsql;

create or replace trigger trg_person_update_audit
    after update
    on person
    for each row
execute procedure fnc_trg_person_update_audit();

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;