create table person_discounts (
    id bigint primary key NOT NULL ,
    person_id bigint NOT NULL ,
    pizzeria_id bigint NOT NULL ,
    discounts numeric NOT NULL DEFAULT 0,
    constraint fk_person_id foreign key (person_id) references person (id),
    constraint fk_pizzeria_id foreign key (pizzeria_id) references pizzeria (id)
);