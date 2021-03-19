-- Revert o_parck:init from pg

BEGIN;

-- Je suprime les table "impact, reserve, incident, attraction, visiteur"
DROP TABLE impact, reserve, incident, attraction, visitor;

-- Je suprime le domaine posint 
DROP DOMAIN posint;

COMMIT;
