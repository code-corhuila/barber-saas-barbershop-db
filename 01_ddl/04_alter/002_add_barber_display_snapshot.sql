-- A copy of the barber's name and photo, taken from identity-auth's internal user read when the
-- profile is created (ADR-014): every barber read stays inside this schema, the anonymous catalog
-- included. NULL for profiles created before; the owner of the data is still identity_auth.app_user.
ALTER TABLE barbershop.barber_profile
    ADD COLUMN full_name         varchar(120) NULL,
    ADD COLUMN profile_photo_url text         NULL;
