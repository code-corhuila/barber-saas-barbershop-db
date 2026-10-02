-- "barbershops in a city", the client's search
CREATE INDEX IF NOT EXISTS idx_barbershop_city_status ON barbershop.barbershop (city, status);
-- "trials that end", the worker's trial-expiration job (FR-026)
CREATE INDEX IF NOT EXISTS idx_barbershop_trial_ends_at ON barbershop.barbershop (trial_ends_at) WHERE status = 'TRIAL';
-- foreign key columns are always indexed
CREATE INDEX IF NOT EXISTS idx_service_barbershop_id ON barbershop.service (barbershop_id);
CREATE INDEX IF NOT EXISTS idx_barber_profile_barbershop_id ON barbershop.barber_profile (barbershop_id);
CREATE INDEX IF NOT EXISTS idx_barber_specialty_profile_id ON barbershop.barber_specialty (barber_profile_id);
