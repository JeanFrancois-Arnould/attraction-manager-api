-- Deploy o_parck:veiw_reservation to pg

BEGIN;

-- création de la view booking
CREATE VIEW public.booking AS
SELECT 
    visitor.id,
    attraction.public_name,
    reserve.places_number,
    reserve.reservation_hour
FROM visitor
JOIN reserve ON reserve.visitor_id = visitor.id
JOIN attraction on attraction.id = reserve.attraction_id;

COMMIT;
	
