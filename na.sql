# top NA genres/albums
DROP TABLE IF EXISTS na_temp;
CREATE TABLE na_temp AS 
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
    HAVING MAX(Region) = 'North America'
        AND (MAX(Genres) IN (SELECT 
            Genres
        FROM
            top_genres))) AS temp
        INNER JOIN
    top_albums ON temp.Album = top_albums.Album;
    
DROP TABLE IF EXISTS na_final;
CREATE TABLE na_final AS
SELECT *
FROM na_temp INNER JOIN usa_cities ON SUBSTRING_INDEX(na_temp.Artist_Location,',',1) = usa_cities.city;
-- WHERE usa_cities.state_id =SUBSTRING_INDEX(SUBSTRING_INDEX(na_temp.Artist_Location,',',2),',',-1) ;


# adjust some locations manually
UPDATE na_final
SET Artist_Location = "Long Beach, NY, United States"
WHERE Artist = "MF DOOM";

UPDATE na_final
SET Artist_Location = "Brooklyn, NY, United States"
WHERE Artist = "Black Star";

UPDATE na_final
SET Artist_Location = "Philadelphia, PA, United States"
WHERE Artist = "The Roots";

UPDATE na_final
SET Artist_Location = "Cinnicanti, OH, United States"
WHERE Artist = "The National";

UPDATE na_final
SET Artist_Location = "Amityville, NY, United States"
WHERE Artist = "De La Soul";

UPDATE na_final
SET Artist_Location = "Queens, NY, United States"
WHERE Artist = "Nas" OR Artist = "Beastie Boys" OR Artist = "Mobb Deep" or Artist = "Big L" OR Artist = "A Tribe Called Quest" OR Artist = "Organized Konfusion";

UPDATE na_final
SET Artist_Location = "Leesburg, VA, United States"
WHERE Artist = "Car Seat Headrest";

UPDATE na_final
SET Artist_Location = "Seattle, WA, United States"
WHERE Artist = "Mount Eerie" OR Artist = "Modest Mouse";

UPDATE na_final
SET Artist_Location = "Los Angeles, CA, United States"
WHERE Artist = "The Mountain Goats";

UPDATE na_final
SET Artist_Location = "Oberlin, OH, United States"
WHERE Artist = "Songs: Ohia";

UPDATE na_final
SET Artist_Location = "Olympia, WA, United States"
WHERE Artist = "The Microphones"  OR Artist = "Sleater-Kinney";

UPDATE na_final
SET Artist_Location = "Washington D.C., United States"
WHERE Artist = "The Dismemberment Plan";

UPDATE na_final
SET Artist_Location = "Hoboken, NJ, United States"
WHERE Artist = "Yo La Tengo" OR Artist = "Silver Jews";

UPDATE na_final
SET Artist_Location = "Toronto, ON, Canada"
WHERE Artist = "Broken Social Scene";

UPDATE na_final
SET Artist_Location = "Stockton, CA, United States"
WHERE Artist = "Pavement";

UPDATE na_final
SET Artist_Location = "Boise, ID, United States"
WHERE Artist = "Built to Spill";

UPDATE na_final
SET Artist_Location = "Staten Island, NY, United States"
WHERE Artist = "Wu-Tang Clan";

UPDATE na_final
SET Artist_Location = "Chicago, IL, United States"
WHERE Artist = "Wilco";

UPDATE na_final
SET Artist_Location = "Boston, MA, United States"
WHERE Artist = "Pixies";

UPDATE na_final
SET Artist_Location = "Montreal, QB, Canada"
WHERE Artist = "Arcade Fire";



