ALTER TABLE barbershop.barber_specialty DROP CONSTRAINT IF EXISTS fk_barber_specialty_profile;
ALTER TABLE barbershop.barber_profile DROP CONSTRAINT IF EXISTS fk_barber_profile_barbershop;
ALTER TABLE barbershop.service DROP CONSTRAINT IF EXISTS fk_service_barbershop;
