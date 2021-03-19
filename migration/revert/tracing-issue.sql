-- Revert o_parck:tracing-issue from pg

BEGIN;

-- Supresion de la table tracing_issue 
DROP TABLE tracing_issue;

COMMIT;
