-- DROP TABLES africa,asia...
DROP TABLES africa,asia,europe,north_america,oceania,south_america;

-- first, how many entries from each continent?
SELECT Region, count(*)
FROM top_albums
GROUP BY Region;


SELECT Artist, Album, `RYM Rating`
FROM top_albums
WHERE Region = "Oceania"
ORDER BY "RYM Rating" DESC