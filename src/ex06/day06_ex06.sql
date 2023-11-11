-- ALTER TABLE  person_discounts
-- ALTER COLUMN id
-- SET DEFAULT 0;
--
-- DROP SEQUENCE seq_person_discounts;

CREATE SEQUENCE seq_person_discounts;

SELECT setval('seq_person_discounts' , 1);

ALTER TABLE person_discounts
    ALTER COLUMN id
        SET DEFAULT currval('seq_person_discounts');

-- SELECT currval(''seq_person_discounts'');

SELECT setval('seq_person_discounts', count(po.id) + 1)
FROM person_discounts po;
-- SELECT currval('seq_person_discounts');

-- SELECT * from person_discounts;
--
-- INSERT INTO person_discounts (person_id, pizzeria_id, discounts)
-- VALUES (1, 1, 13);
--
-- DELETE FROM person_discounts WHERE id > 12;