ALTER TABLE IF EXISTS person_discounts
    ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_discount CHECK (discounts IS NOT NULL),
    ADD CONSTRAINT ch_range_discount CHECK ( discounts >= 0 AND discounts <= 100);