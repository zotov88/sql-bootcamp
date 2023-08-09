create unique index idx_person_discounts_unique on person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;

explain analyze
select *
from person_discounts
where person_id = 1;

select *
from person_discounts;

-- already exists
insert into person_discounts
values ((select max(id) + 1 from person_discounts), 9, 6, 100);

drop index idx_person_discounts_unique;

