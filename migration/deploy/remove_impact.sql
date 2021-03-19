-- Deploy o_parck:remove_impact to pg

BEGIN;

-- Je surprime la table impact 
DROP TABLE impact; 

ALTER TABLE incident ADD COLUMN attraction_id int;

COMMIT;
