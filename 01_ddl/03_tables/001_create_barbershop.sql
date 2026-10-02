-- The tenant. status and plan_id are changed by platform-admin through this domain's API,
-- never by writing this schema (OQ-10).
CREATE TABLE barbershop.barbershop (
    id                         uuid          NOT NULL,
    name                       text          NOT NULL,
    address                    text          NULL,
    city                       text          NOT NULL,
    latitude                   numeric(10,7) NULL,
    longitude                  numeric(10,7) NULL,
    phone                      text          NULL,
    whatsapp_number            text          NULL,
    logo_url                   text          NULL,
    status                     text          NOT NULL DEFAULT 'TRIAL',
    plan_id                    uuid          NULL,      -- owned by the platform-admin domain: referenced by id, no FK
    timezone                   text          NOT NULL DEFAULT 'America/Bogota',
    cancellation_policy_hours  integer       NOT NULL DEFAULT 2,
    trial_ends_at              timestamptz   NOT NULL,  -- created_at + 60 days, fixed once (INV-SHOP-001)
    created_at                 timestamptz   NOT NULL DEFAULT now(),
    updated_at                 timestamptz   NOT NULL DEFAULT now(),
    CONSTRAINT pk_barbershop PRIMARY KEY (id),
    CONSTRAINT chk_barbershop_name      CHECK (char_length(name) BETWEEN 1 AND 120),
    CONSTRAINT chk_barbershop_address   CHECK (char_length(address) <= 255),
    CONSTRAINT chk_barbershop_city      CHECK (char_length(city) BETWEEN 1 AND 80),
    CONSTRAINT chk_barbershop_latitude  CHECK (latitude BETWEEN -90 AND 90),
    CONSTRAINT chk_barbershop_longitude CHECK (longitude BETWEEN -180 AND 180),
    CONSTRAINT chk_barbershop_phone     CHECK (char_length(phone) <= 20 AND char_length(whatsapp_number) <= 20),
    CONSTRAINT chk_barbershop_logo_url  CHECK (char_length(logo_url) <= 255),
    CONSTRAINT chk_barbershop_status    CHECK (status IN ('TRIAL','ACTIVE','SUSPENDED','CANCELLED')),
    CONSTRAINT chk_barbershop_timezone  CHECK (char_length(timezone) <= 50),
    CONSTRAINT chk_barbershop_cancellation_policy CHECK (cancellation_policy_hours >= 0)
);
