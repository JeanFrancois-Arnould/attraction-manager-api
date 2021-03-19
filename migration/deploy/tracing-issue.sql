-- Deploy o_parck:tracing-issue to pg

BEGIN;

-- Création de la table tracing_issue 
CREATE TABLE tracing_issue (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    incident_number text NOT NULL UNIQUE,
    public_name text NOT NULL UNIQUE,
    nature text NOT NULL,
    technician_assigned text NOT NULL,
    noted_date timestamptz NOT NULL,
    resolution_date timestamptz NOT NULL DEFAULT now()

);

COMMIT;
