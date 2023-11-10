INSERT INTO person_discounts (id, person_id, pizzeria_id, discounts)
SELECT ROW_NUMBER() OVER () AS id,
       ac.person_id,
       ac.id AS pizzeria_id,
       CASE
           WHEN count(ac.id) = 1 THEN 10.5::numeric
           WHEN count(ac.id) = 2 THEN 22::numeric
           ELSE 30::numeric
           END AS discount
FROM (SELECT person_id, zz.id
                  FROM person_order po
                           JOIN menu m ON po.menu_id = m.id
                           JOIN pizzeria zz ON m.pizzeria_id = zz.id) ac,
     (SELECT person_id, zz.id
                     FROM person_order po
                              JOIN menu m ON po.menu_id = m.id
                              JOIN pizzeria zz ON m.pizzeria_id = zz.id
                     GROUP BY person_id, zz.id) uc
WHERE ac.person_id = uc.person_id
  AND ac.id = uc.id
GROUP BY ac.person_id, pizzeria_id;