-- Money in integer cents, never a floating type (ADR-010).
CREATE TABLE barbershop.service (
    id                uuid        NOT NULL,
    barbershop_id     uuid        NOT NULL,
    name              text        NOT NULL,
    description       text        NULL,
    duration_minutes  integer     NOT NULL,
    price_cents       bigint      NOT NULL,
    is_active         boolean     NOT NULL DEFAULT true,
    created_at        timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_service PRIMARY KEY (id),
    CONSTRAINT chk_service_name        CHECK (char_length(name) BETWEEN 1 AND 100),
    CONSTRAINT chk_service_description CHECK (char_length(description) <= 255),
    CONSTRAINT chk_service_duration    CHECK (duration_minutes >= 5),
    CONSTRAINT chk_service_price       CHECK (price_cents >= 0)
);
