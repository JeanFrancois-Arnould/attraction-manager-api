-- Deploy o_parck:init to pg

BEGIN;

-- un domaine qui n'autorise que les valeurs positives 
CREATE DOMAIN posint AS int CHECK (value > 0);

-- Création de la table visiteur
CREATE TABLE visitor (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticket_number text NOT NULL UNIQUE,
    start_validity timestamptz NOT NULL,
    end_validity timestamptz NOT NULL

);

-- Création de la table attraction
CREATE TABLE attraction (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    public_name text NOT NULL UNIQUE,
    capacity posint NOT NULL,
    oppening_hour timestamptz NOT NULL,
    closing_hour timestamptz NOT NULL,
    duration INTERVAL NOT NULL     
);

-- Création de la table Incident
CREATE TABLE incident (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    incident_number text NOT NULL UNIQUE,
    nature text NOT NULL,
    technician_assigned text NOT NULL UNIQUE,
    resolution_date timestamptz NOT NULL
);

-- Création de la pseudo  entité réserve 
CREATE TABLE reserve (

    places_number text NOT NULL UNIQUE,
    reservation_hour timestamptz NOT NULL,
    visitor_id posint REFERENCES visitor(id),
    attraction_id posint REFERENCES attraction(id)
);

--Création de la pseudo entité impacte
CREATE TABLE impact (

    noted_date timestamptz NOT NULL
    attraction_id posint REFERENCES attraction(id),
    incident_id posint REFERENCES incident(id)

);

COMMIT;
