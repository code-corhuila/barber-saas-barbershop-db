DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'barbershop_app') THEN
        REVOKE barbershop_writer FROM barbershop_app;
    END IF;
END
$$;
ALTER DEFAULT PRIVILEGES IN SCHEMA barbershop REVOKE ALL ON TABLES FROM barbershop_reader, barbershop_writer;
REVOKE ALL ON ALL TABLES IN SCHEMA barbershop FROM barbershop_reader, barbershop_writer;
REVOKE USAGE ON SCHEMA barbershop FROM barbershop_reader, barbershop_writer;
