DROP TABLE IF EXISTS person_discounts;

create table person_discounts (
    id bigint primary key,
    person_id bigint,
    pizzeria_id bigint,
    discount numeric DEFAULT 0,
    constraint fk_person_id foreign key (person_id) references person (id),
    constraint fk_pizzeria_id foreign key (pizzeria_id) references pizzeria (id)
);