COMMENT ON TABLE person_discounts IS 'This table calculates the discount for customers based on the number of their orders:
1 order - 10.5% discount
2 orders - 22% discount
3 or more orders - 30% discount';
COMMENT ON COLUMN person_discounts.id IS 'This column has the id''s of unique pare person_id & pizzeria_id';
COMMENT ON COLUMN person_discounts.person_id IS 'Unique person_id, to count discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Unique pizzeria_id, to count sum of orders';
COMMENT ON COLUMN person_discounts.discounts IS 'Counted discount'