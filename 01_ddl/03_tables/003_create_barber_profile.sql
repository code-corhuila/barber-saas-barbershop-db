-- The barber's name and photo live in identity_auth.app_user; this keeps only user_id (OQ-08).
CREATE TABLE barbershop.barber_profile (
    id                uuid         NOT NULL,
    barbershop_id     uuid         NOT NULL,
    user_id           uuid         NOT NULL,   -- owned by the identity-auth domain: referenced by id, no FK
    experience_years  integer      NOT NULL DEFAULT 0,
    bio               text         NULL,
    rating_avg        numeric(3,2) NOT NULL DEFAULT 0,
    rating_count      integer      NOT NULL DEFAULT 0,
    CONSTRAINT pk_barber_profile PRIMARY KEY (id),
    CONSTRAINT uq_barber_profile_user UNIQUE (user_id),
    CONSTRAINT chk_barber_profile_experience CHECK (experience_years >= 0),
    CONSTRAINT chk_barber_profile_bio        CHECK (char_length(bio) <= 500),
    CONSTRAINT chk_barber_profile_rating     CHECK (rating_avg BETWEEN 0 AND 5 AND rating_count >= 0)
);
