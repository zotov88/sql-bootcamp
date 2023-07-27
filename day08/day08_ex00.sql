-- session 1
begin transaction;
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- session 2;
select rating from pizzeria where name = 'Pizza Hut';

-- session 1
COMMIT;

-- session 2;
select rating from pizzeria where name = 'Pizza Hut';