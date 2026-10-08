# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-10-08

User stories: code-corhuila/barber-saas-docs#4, code-corhuila/barber-saas-docs#59, code-corhuila/barber-saas-docs#76

### Added

- **deploy:** add the migration runner with its own changelog tables
- **ddl:** create the barbershop schema
- **ddl:** create barbershop
- **ddl:** create service
- **ddl:** create barber profile
- **ddl:** create barber specialty
- **ddl:** create idempotency key
- **ddl:** add foreign keys
- **dcl:** create roles
- **dcl:** grants
- **ddl:** keep a snapshot of the barber's name and photo

### Changed

- **ddl:** create indexes

### Documentation

- **readme:** explain how the schema is migrated and where the data is
- **readme:** point the header to Barber Saas and barber-saas-docs

### Tests

- **ci:** rebuild the schema from an empty database on every pull request

### Maintenance

- **db:** ignore local env files and liquibase output
- **github:** add the pull request template
- **github:** track the story environment on the board
- **liquibase:** add the master changelog and the ddl, dml, dcl and tcl families
- use the new repository name barber-saas-infra-postgres

[2.0.0]: https://github.com/code-corhuila/barber-saas-barbershop-db/releases/tag/v2.0.0
