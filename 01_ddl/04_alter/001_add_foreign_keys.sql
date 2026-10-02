ALTER TABLE barbershop.service
    ADD CONSTRAINT fk_service_barbershop
    FOREIGN KEY (barbershop_id) REFERENCES barbershop.barbershop (id) ON DELETE CASCADE;

ALTER TABLE barbershop.barber_profile
    ADD CONSTRAINT fk_barber_profile_barbershop
    FOREIGN KEY (barbershop_id) REFERENCES barbershop.barbershop (id) ON DELETE CASCADE;

ALTER TABLE barbershop.barber_specialty
    ADD CONSTRAINT fk_barber_specialty_profile
    FOREIGN KEY (barber_profile_id) REFERENCES barbershop.barber_profile (id) ON DELETE CASCADE;
