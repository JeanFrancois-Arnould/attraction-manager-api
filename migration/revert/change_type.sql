-- Revert o_parck:change_type from pg

BEGIN;


ALTER TABLE tracing_issue ALTER COLUMN resolution_date  TYPE timestamptz ;

ALTER TABLE tracing_issue ALTER COLUMN noted_date TYPE timestamptz ;

ALTER TABLE tracing_issue ALTER COLUMN resolution_date TYPE timestamptz;

DROP TABLE reserve, impact, attraction;


CREATE TABLE attraction (

    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    public_name text NOT NULL UNIQUE,
    capacity posint NOT NULL,
    oppening_hour timestamptz NOT NULL,
    closing_hour timestamptz NOT NULL,
    duration INTERVAL NOT NULL     
);

CREATE TABLE reserve (

    places_number text NOT NULL UNIQUE,
    reservation_hour timestamptz NOT NULL,
    visitor_id posint REFERENCES visitor(id),
    attraction_id posint REFERENCES attraction(id)
);

CREATE TABLE impact (

    noted_date timestamptz NOT NULL,
    attraction_id posint REFERENCES attraction(id),
    incident_id posint REFERENCES incident(id)

);


ALTER TABLE incident ALTER COLUMN resolution_date TYPE timestamptz;

ALTER TABLE incident ALTER COLUMN resolution_date SET NOT NULL;



COMMIT;
