USE rym;

DROP VIEW IF EXISTS afr_genres,asia_genres,eu_genres,na_genres,oceania_genres,sa_genres;
# top african genres
CREATE VIEW afr_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "Africa"
GROUP BY Genres
HAVING count(Genres) >= 5
ORDER BY count(Genres) DESC
);

# top asian genres for the rest, we will limit only the top 3 
CREATE VIEW asia_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "Asia"
GROUP BY Genres
ORDER BY count(Genres) DESC
LIMIT 5
);


# top european genres
CREATE VIEW EU_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "Europe"
GROUP BY Genres
ORDER BY count(Genres) DESC
LIMIT 5
);

# top oceania genres
CREATE VIEW oceania_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "Oceania"
GROUP BY Genres
ORDER BY count(Genres) DESC
LIMIT 5
);

# top NA genres
CREATE VIEW NA_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "North America"
GROUP BY Genres
ORDER BY count(Genres) DESC
LIMIT 5
);

# top SA genres
CREATE VIEW SA_genres AS 
(
SELECT Region,Genres,count(Genres) as numAlbums
FROM top_albums 
WHERE Region = "South America"
GROUP BY Genres
ORDER BY count(Genres) DESC
LIMIT 5
);

#combine
DROP TABLE IF EXISTS top_genres;
CREATE TABLE top_genres AS 
(
SELECT * FROM afr_genres
UNION ALL 
SELECT * FROM asia_genres
UNION ALL 
SELECT * FROM eu_genres
UNION ALL 
SELECT * FROM na_genres
UNION ALL 
SELECT * FROM oceania_genres
UNION ALL 
SELECT * FROM sa_genres
);

#drop excess tables
DROP VIEW afr_genres,asia_genres,eu_genres,na_genres,oceania_genres,sa_genres;