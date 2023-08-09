create or replace function fnc_trg_person_delete_audit() returns trigger as
$BODY$
begin
    if (tg_op = 'DELETE') then
        insert into person_audit
        select now() at time zone 'utc-3', 'D', old.*;
    end if;
    return null;
end;

$BODY$ language plpgsql;

create or replace trigger trg_person_delete_audit
    after delete
    on person
    for each row
execute procedure fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;