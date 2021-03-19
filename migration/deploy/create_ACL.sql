-- Deploy o_parck:create_ACL to pg

BEGIN;

-- Création du role oparck_maintenance
CREATE ROLE oparck_maintenance LOGIN PASSWORD 'oparck';

-- Ajout des privileges au role oparck_maintenance
GRANT 
    ALL  PRIVILEGES 
    ON TABLE  incident, impact, attraction 
    TO oparck_maintenance;

-- Création du role oparck_reservation
CREATE ROLE oparck_reservation LOGIN PASSWORD 'oparck';

-- Ajout des privileges au role oparck_reservation
GRANT 
    ALL PRIVILEGES
    ON TABLE visitor, reserve, attraction
    TO oparck_reservation;

COMMIT;
