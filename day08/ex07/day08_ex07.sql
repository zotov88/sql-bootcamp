-- session 1
begin transaction;

-- session 2
begin transaction;

-- session 1
update pizzeria set rating = 3.5 where name = 'Pizza Hut';

-- session 2
update pizzeria set rating = 1 where name = 'DinoPizza';

-- session 1
update pizzeria set rating = 3.5 where name = 'DinoPizza';

-- session 2
update pizzeria set rating = 4.5 where name = 'Pizza Hut';

-- session 1
commit;

-- session 2
commit;