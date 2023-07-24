select id as object_id, name as object_name
from person
union all
select id, pizza_name
from menu
order by object_id, object_name