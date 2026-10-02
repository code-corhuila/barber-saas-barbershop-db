GRANT USAGE ON SCHEMA barbershop TO barbershop_reader, barbershop_writer;
GRANT SELECT ON ALL TABLES IN SCHEMA barbershop TO barbershop_reader;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA barbershop TO barbershop_writer;
ALTER DEFAULT PRIVILEGES IN SCHEMA barbershop GRANT SELECT ON TABLES TO barbershop_reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA barbershop GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO barbershop_writer;

-- The domain grants its writer role to its own login user (Annex J J.7). The user exists only
-- where the infrastructure created it, so the grant is conditional. No other domain is granted
-- barbershop_reader: other domains read this data through barbershop-api (Annex J J.3.3).
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'barbershop_app') THEN
        GRANT barbershop_writer TO barbershop_app;
    END IF;
END
$$;
