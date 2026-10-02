-- NOLOGIN roles carry the permissions. The login user barbershop_app is created by
-- barber-saas-infra from a secret; no password is ever versioned here.
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'barbershop_reader') THEN
        CREATE ROLE barbershop_reader NOLOGIN;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'barbershop_writer') THEN
        CREATE ROLE barbershop_writer NOLOGIN;
    END IF;
END
$$;
