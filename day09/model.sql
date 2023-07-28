drop table if exists person cascade;
drop table if exists pizzeria cascade;
drop table if exists menu cascade;
drop table if exists person_visits cascade;
drop table if exists person_order cascade;
drop table if exists person_discounts cascade;
drop table if exists person_audit cascade;
drop sequence if exists seq_person_discounts;
-- functions and triggers
drop table if exists person_audit cascade;
drop function if exists fnc_trg_person_insert_audit() cascade;
drop function if exists fnc_trg_person_update_audit() cascade;
--

create table person
(
    id      bigint primary key,
    name    varchar not null,
    age     integer not null default 10,
    gender  varchar          default 'female' not null,
    address varchar
);

alter table person
    add constraint ch_gender check ( gender in ('female', 'male') );

insert into person
values (1, 'Anna', 16, 'female', 'Moscow');
insert into person
values (2, 'Andrey', 21, 'male', 'Moscow');
insert into person
values (3, 'Kate', 33, 'female', 'Kazan');
insert into person
values (4, 'Denis', 13, 'male', 'Kazan');
insert into person
values (5, 'Elvira', 45, 'female', 'Kazan');
insert into person
values (6, 'Irina', 21, 'female', 'Saint-Petersburg');
insert into person
values (7, 'Peter', 24, 'male', 'Saint-Petersburg');
insert into person
values (8, 'Nataly', 30, 'female', 'Novosibirsk');
insert into person
values (9, 'Dmitriy', 18, 'male', 'Samara');


create table pizzeria
(
    id     bigint primary key,
    name   varchar not null,
    rating numeric not null default 0
);

alter table pizzeria
    add constraint ch_rating check ( rating between 0 and 5);

insert into pizzeria
values (1, 'Pizza Hut', 4.6);
insert into pizzeria
values (2, 'Dominos', 4.3);
insert into pizzeria
values (3, 'DoDo Pizza', 3.2);
insert into pizzeria
values (4, 'Papa Johns', 4.9);
insert into pizzeria
values (5, 'Best Pizza', 2.3);
insert into pizzeria
values (6, 'DinoPizza', 4.2);


create table person_visits
(
    id          bigint primary key,
    person_id   bigint not null,
    pizzeria_id bigint not null,
    visit_date  date   not null default current_date,
    constraint uk_person_visits unique (person_id, pizzeria_id, visit_date),
    constraint fk_person_visits_person_id foreign key (person_id) references person (id),
    constraint fk_person_visits_pizzeria_id foreign key (pizzeria_id) references pizzeria (id)
);

insert into person_visits
values (1, 1, 1, '2022-01-01');
insert into person_visits
values (2, 2, 2, '2022-01-01');
insert into person_visits
values (3, 2, 1, '2022-01-02');
insert into person_visits
values (4, 3, 5, '2022-01-03');
insert into person_visits
values (5, 3, 6, '2022-01-04');
insert into person_visits
values (6, 4, 5, '2022-01-07');
insert into person_visits
values (7, 4, 6, '2022-01-08');
insert into person_visits
values (8, 5, 2, '2022-01-08');
insert into person_visits
values (9, 5, 6, '2022-01-09');
insert into person_visits
values (10, 6, 2, '2022-01-09');
insert into person_visits
values (11, 6, 4, '2022-01-01');
insert into person_visits
values (12, 7, 1, '2022-01-03');
insert into person_visits
values (13, 7, 2, '2022-01-05');
insert into person_visits
values (14, 8, 1, '2022-01-05');
insert into person_visits
values (15, 8, 2, '2022-01-06');
insert into person_visits
values (16, 8, 4, '2022-01-07');
insert into person_visits
values (17, 9, 4, '2022-01-08');
insert into person_visits
values (18, 9, 5, '2022-01-09');
insert into person_visits
values (19, 9, 6, '2022-01-10');


create table menu
(
    id          bigint primary key,
    pizzeria_id bigint  not null,
    pizza_name  varchar not null,
    price       numeric not null default 1,
    constraint fk_menu_pizzeria_id foreign key (pizzeria_id) references pizzeria (id)
);

insert into menu
values (1, 1, 'cheese pizza', 900);
insert into menu
values (2, 1, 'pepperoni pizza', 1200);
insert into menu
values (3, 1, 'sausage pizza', 1200);
insert into menu
values (4, 1, 'supreme pizza', 1200);

insert into menu
values (5, 6, 'cheese pizza', 950);
insert into menu
values (6, 6, 'pepperoni pizza', 800);
insert into menu
values (7, 6, 'sausage pizza', 1000);

insert into menu
values (8, 2, 'cheese pizza', 800);
insert into menu
values (9, 2, 'mushroom pizza', 1100);

insert into menu
values (10, 3, 'cheese pizza', 780);
insert into menu
values (11, 3, 'supreme pizza', 850);

insert into menu
values (12, 4, 'cheese pizza', 700);
insert into menu
values (13, 4, 'mushroom pizza', 950);
insert into menu
values (14, 4, 'pepperoni pizza', 1000);
insert into menu
values (15, 4, 'sausage pizza', 950);

insert into menu
values (16, 5, 'cheese pizza', 700);
insert into menu
values (17, 5, 'pepperoni pizza', 800);
insert into menu
values (18, 5, 'supreme pizza', 850);

create table person_order
(
    id         bigint primary key,
    person_id  bigint not null,
    menu_id    bigint not null,
    order_date date   not null default current_date,
    constraint fk_order_person_id foreign key (person_id) references person (id),
    constraint fk_order_menu_id foreign key (menu_id) references menu (id)
);

insert into person_order
values (1, 1, 1, '2022-01-01');
insert into person_order
values (2, 1, 2, '2022-01-01');

insert into person_order
values (3, 2, 8, '2022-01-01');
insert into person_order
values (4, 2, 9, '2022-01-01');

insert into person_order
values (5, 3, 16, '2022-01-04');

insert into person_order
values (6, 4, 16, '2022-01-07');
insert into person_order
values (7, 4, 17, '2022-01-07');
insert into person_order
values (8, 4, 18, '2022-01-07');
insert into person_order
values (9, 4, 6, '2022-01-08');
insert into person_order
values (10, 4, 7, '2022-01-08');

insert into person_order
values (11, 5, 6, '2022-01-09');
insert into person_order
values (12, 5, 7, '2022-01-09');

insert into person_order
values (13, 6, 13, '2022-01-01');

insert into person_order
values (14, 7, 3, '2022-01-03');
insert into person_order
values (15, 7, 9, '2022-01-05');
insert into person_order
values (16, 7, 4, '2022-01-05');

insert into person_order
values (17, 8, 8, '2022-01-06');
insert into person_order
values (18, 8, 14, '2022-01-07');

insert into person_order
values (19, 9, 18, '2022-01-09');
insert into person_order
values (20, 9, 6, '2022-01-10');

-- from day03

insert into menu(id, pizzeria_id, pizza_name, price)
values (19, 2, 'greek pizza', 800);

insert into menu(id, pizzeria_id, pizza_name, price)
values ((select max(id) + 1 from menu),
        (select id from pizzeria where name = 'Dominos'),
        'sicilian pizza',
        900);

insert into person_visits(id, person_id, pizzeria_id, visit_date)
values ((select max(id) + 1 from person_visits),
        (select id from person where name = 'Denis'),
        (select id from pizzeria where name = 'Dominos'),
        '2022-02-24'),
       ((select max(id) + 2 from person_visits),
        (select id from person where name = 'Irina'),
        (select id from pizzeria where name = 'Dominos'),
        '2022-02-24');

insert into person_order(id, person_id, menu_id, order_date)
values ((select max(id) + 1 from person_order),
        (select id from person where name = 'Denis'),
        (select id from menu where pizza_name = 'sicilian pizza'),
        '2022-02-24'),
       ((select max(id) + 2 from person_order),
        (select id from person where name = 'Irina'),
        (select id from menu where pizza_name = 'sicilian pizza'),
        '2022-02-24');

update menu
set price = price * 0.9
where pizza_name = 'greek pizza';

insert into person_order(id, person_id, menu_id, order_date)
select t                                                      as id,
       p.id                                                   as person_id,
       (select id from menu where pizza_name = 'greek pizza') as menu_id,
       '2022-02-25'
from person p
         join generate_series((select max(id) from person_order),
                              (select max(id) from person_order) + (select max(id) from person),
                              1) as t
              on p.id = t - (select max(id) from person_order);

delete
from person_order
where order_date = '2022-02-25';

delete
from menu
where pizza_name = 'greek pizza';

insert into person_visits(id, person_id, pizzeria_id, visit_date)
values ((select max(id) + 1 from person_visits),
        (select id from person where name = 'Dmitriy'),
        (select pz.id
         from pizzeria pz
                  join menu m on pz.id = m.pizzeria_id
         where m.price < 800
           and pz.id <> 4
         order by random()
         limit 1),
        '2022-01-08');

