create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);

set enable_seqscan = off;

explain analyse
select pizzeria_id, pizza_name
from menu;

select *
from menu;

-- already exists
insert into menu
values ((select max(id) + 1 from menu),
        2,
        'sicilian pizza',
        111);

drop index idx_menu_unique;

set enable_seqscan = on;