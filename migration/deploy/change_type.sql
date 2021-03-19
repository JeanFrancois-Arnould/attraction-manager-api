-- Deploy o_parck:change_type to pg

BEGIN;

-- Je suprime la table attraction 
DROP TABLE reserve, impact, attraction;

-- Création de la table attraction Formats: hh:mm:ss
CREATE TABLE attraction (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    public_name text NOT NULL UNIQUE,
    capacity posint NOT NULL,
    oppening_hour time NOT NULL,
    closing_hour time NOT NULL,
    duration INTERVAL NOT NULL     
);

-- Création de la pseudo  entité réserve 
CREATE TABLE reserve (

    places_number text NOT NULL UNIQUE,
    reservation_hour time NOT NULL,
    visitor_id posint REFERENCES visitor(id),
    attraction_id posint REFERENCES attraction(id)
);
--Création de la pseudo entité impacte
CREATE TABLE impact (

    noted_date date NOT NULL,
    attraction_id posint REFERENCES attraction(id),
    incident_id posint REFERENCES incident(id)

);

-- Enleve la contrainte NOT NULL a la column resolution_date
ALTER TABLE incident ALTER COLUMN resolution_date DROP NOT NULL;

-- Change le type de colone resolution_date en DATE Formats: AAAA-MM-JJ	
ALTER TABLE incident ALTER COLUMN resolution_date TYPE date;

--  Change le type des column resolution_date en type DATE Formats: hh:mm:ss
ALTER TABLE tracing_issue ALTER COLUMN resolution_date  TYPE date;

--  Change le type des column noted_date en type DATE Formats: hh:mm:ss
ALTER TABLE tracing_issue ALTER COLUMN noted_date TYPE date;

--  Change le type des column resolution_date en type DATE Formats: AAAA-MM-JJ	
ALTER TABLE tracing_issue ALTER COLUMN resolution_date  TYPE date;

COMMIT;
