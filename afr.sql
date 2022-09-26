DROP TABLE IF EXISTS afr_temp;
CREATE TABLE afr_temp AS 
SELECT top_albums.id,
    temp.Artist,
    temp.Album,
    top_albums.`Date`,
    temp.RYM_Rating,
    top_albums.Region,
    top_albums.Genres,
    temp.Artist_Location FROM
    (SELECT 
        MAX(album) AS Album,
            MAX(artist) AS Artist,
            MAX(`RYM_Rating`) AS RYM_Rating,
            MAX(City) AS Artist_Location
    FROM
        topeachgenre
    GROUP BY artist
    HAVING MAX(Region) = 'Africa'
        AND (MAX(Genres) IN (SELECT 
            Genres
        FROM
            top_genres))) AS temp
        INNER JOIN
    top_albums ON temp.Album = top_albums.Album;
    
# adjust some locations manually
SET SQL_SAFE_UPDATES = 0;

UPDATE afr_temp
SET Artist_Location = "Lagos, Lagos, Nigeria"
WHERE Artist = "Monomono";

UPDATE afr_temp
SET Artist_Location = "Johannesberg, South Africa"
WHERE Artist = "Hedzoleh Soundz";

UPDATE afr_temp
SET Artist_Location = "Yaoundé, Cameroon"
WHERE Artist = "Francis the Great";

UPDATE afr_temp
SET Artist_Location = "Kitwe, Gambia"
WHERE Artist = "the Witch" or Artist = "Witch";

UPDATE afr_temp
SET Artist_Location = "Accra, Ghana"
WHERE Artist = "Sweet Talks";

UPDATE afr_temp
SET Artist_Location = "Lusaka, Nigeria"
WHERE Artist = "Ngozi Family";

UPDATE afr_temp
SET Artist_Location = "Kitwe, Zambia"
WHERE Artist = "Amanaz";

UPDATE afr_temp
SET Artist_Location = "Agona, Zambia"
WHERE Artist = "Marijata";

UPDATE afr_temp
SET Artist_Location = "Livingstone, Zambia"
WHERE Artist = "Musi-O-Tunya";

UPDATE afr_temp
SET Artist_Location = "Kumasi, Ghana"
WHERE Artist = "Vis-a-Vis";

UPDATE afr_temp
SET Artist_Location = "Ndola, Zambia"
WHERE Artist = "The Peace";

UPDATE afr_temp
SET Artist_Location = "Kinshasa, Congo (Kinshasa)"
WHERE Artist = "Colomach";

UPDATE afr_temp
SET Artist_Location = "Ibadan, Nigeria"
WHERE Artist = "The Lijadu Sisters";

UPDATE afr_temp
SET Artist_Location = "Accra, Ghana"
WHERE Artist = "Rob";

UPDATE afr_temp
SET Artist_Location = "Ibadan, Nigeria"
WHERE Artist = "The Lijadu Sisters";

UPDATE afr_temp
SET Artist_Location = "Freetown, Sierra Leone"
WHERE Artist = "Joni Haastrup";

UPDATE afr_temp
SET Artist_Location = "Bamako, Mali"
WHERE Artist = "Salif Keita";

DROP TABLE IF EXISTS afr_final;
CREATE TABLE afr_final AS
SELECT *
FROM afr_temp INNER JOIN world_cities ON SUBSTRING_INDEX(afr_temp.Artist_Location,',',1) = world_cities.City;

#manually dropp duplicated non-African cities
DELETE FROM afr_final 
WHERE country = "United States" OR country = "Portugal";