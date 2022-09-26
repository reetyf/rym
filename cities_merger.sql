CREATE VIEW usa_cities AS
SELECT DISTINCT uscities.city as city, state_id, uscities.lat, uscities.lng, country
FROM uscities INNER JOIN worldcities ON uscities.city = worldcities.city
WHERE country = "United States"