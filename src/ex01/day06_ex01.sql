INSERT INTO person_discounts (id, person_id, pizzeria_id, discounts)
SELECT ROW_NUMBER() OVER () AS id,
       all_combintations.person_id,
       all_combintations.id AS pizzeria_id,
       CASE
           WHEN count(all_combintations.id) = 1 THEN 10.5::numeric
           WHEN count(all_combintations.id) = 2 THEN 22::numeric
           ELSE 30::numeric
           END AS discount
FROM (SELECT person_id, zz.id
                  FROM person_order po
                           JOIN menu m ON po.menu_id = m.id
                           JOIN pizzeria zz ON m.pizzeria_id = zz.id) all_combintations,
     (SELECT person_id, zz.id
                     FROM person_order po
                              JOIN menu m ON po.menu_id = m.id
                              JOIN pizzeria zz ON m.pizzeria_id = zz.id
                     GROUP BY person_id, zz.id) unique_combinations
WHERE all_combintations.person_id = unique_combinations.person_id
  AND all_combintations.id = unique_combinations.id
GROUP BY all_combintations.person_id, pizzeria_id;