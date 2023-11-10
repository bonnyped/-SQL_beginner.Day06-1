SET enable_seqscan = ON;
EXPLAIN ANALYSE
SELECT discounts
FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 2;

DROP INDEX IF EXISTS idx_person_discounts_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT discounts
FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 2;