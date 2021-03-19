-- Revert o_parck:remove_impact from pg

BEGIN;

ALTER TABLE incident DROP COLUMN attraction_id; 

CREATE TABLE impact (

    noted_date date NOT NULL,
    attraction_id posint REFERENCES attraction(id),
    incident_id posint REFERENCES incident(id)

);

COMMIT;
