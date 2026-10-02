CREATE TABLE barbershop.barber_specialty (
    id                 uuid NOT NULL,
    barber_profile_id  uuid NOT NULL,
    specialty_name     text NOT NULL,
    CONSTRAINT pk_barber_specialty PRIMARY KEY (id),
    CONSTRAINT chk_barber_specialty_name CHECK (char_length(specialty_name) BETWEEN 1 AND 80)
);
