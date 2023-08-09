select *
from (select name as object_name
      from person
      order by object_name) as t1
union all
select *
from (select pizza_name as object_name
      from menu
      order by object_name) as t2;