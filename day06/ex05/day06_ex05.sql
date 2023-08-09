comment on table person_discounts is 'table with personal discounts';
comment on column person_discounts.id is 'primary key the table';
comment on column person_discounts.person_id is 'foreign key for the visitor';
comment on column person_discounts.pizzeria_id is 'foreign key for the pizzeria';
comment on column person_discounts.discount is 'a value of personal discount for a client';