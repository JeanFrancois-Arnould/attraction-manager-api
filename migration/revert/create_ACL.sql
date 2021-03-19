-- Revert o_parck:create_ACL from pg

BEGIN;

-- Supression des privilége au role oparck_reservation
REVOKE
    ALL PRIVILEGES
    ON TABLE visitor, reserve, attraction
    FROM oparck_reservation;

-- Supression du role oparck_reservation
DROP ROLE oparck_reservation;

-- Supression des privilége au role oparck_maintenance
REVOKE
    ALL  PRIVILEGES 
    ON TABLE  incident, impact, attraction 
    FROM oparck_maintenance;

-- Supression du role oparck_reservation
DROP ROLE oparck_maintenance;


COMMIT;
