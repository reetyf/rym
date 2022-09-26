CREATE VIEW topeachgenre AS 
SELECT  
     id,Artist, Album, `Date`, RYM_Rating, Region, top_albums.Genres, City 
FROM
    top_albums INNER JOIN artists ON top_albums.Artist = artists.Name
WHERE
	(top_albums.Genres,top_albums.Region) IN (SELECT 
            Genres, Region
        FROM
            top_genres);
