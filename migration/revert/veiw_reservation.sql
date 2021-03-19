-- Revert o_parck:veiw_reservation from pg

BEGIN;

DROP VIEW public.booking;

COMMIT;
