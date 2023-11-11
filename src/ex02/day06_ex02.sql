SELECT p.name,
       mn.pizza_name,
       mn.price,
       (mn.price * (1 - (pd.discount / 100))) AS disount_price,
       zz.name                                AS pizzeria_name
FROM person_order po
         JOIN menu mn on po.menu_id = mn.id
         JOIN person p on po.person_id = p.id
         JOIN person_discounts pd on p.id = pd.person_id AND mn.pizzeria_id = pd.pizzeria_id
         JOIN pizzeria zz ON pd.pizzeria_id = zz.id
ORDER BY 1, 2;