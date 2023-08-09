with same_pizza as (select pizza_name, price
                    from menu m
                             join pizzeria pz on pz.id = m.pizzeria_id
                    group by pizza_name, price
                    having count(pizza_name) > 1),
     selected_pizzerias as (select *
                            from pizzeria pz
                                     join menu m2 on pz.id = m2.pizzeria_id
                                     natural join same_pizza)
select sp1.pizza_name as pizza_name,
       sp1.name       as pizzeria_name_1,
       sp2.name       as pizzeria_name_2,
       sp1.price      as price
from selected_pizzerias sp1
         join selected_pizzerias sp2 on sp1.pizza_name = sp2.pizza_name
where sp1.name < sp2.name
order by sp1.pizza_name, sp1.name

