create unique index idx_person_order_order_date on person_order (person_id, menu_id)
    where order_date = '2022-01-01';

set enable_seqscan = off;

explain analyze
select menu_id
from person_order
where order_date = '2022-01-01';

select *
from person_order;

-- already exists
insert into person_order
values ((select max(id) + 1 from person_order), 1, 1, '2022-01-01');

drop index idx_person_order_order_date;
