-- create final table skeleton
DROP TABLE IF EXISTS top_albums;
CREATE TABLE top_albums(
Artist text,
Album text,
`Date` text,
Genres text,
`RYM Rating` double,
Ratings int,
Reviews int,
Region text);


-- migrate all helper tables into the final skeleton
INSERT INTO top_albums
SELECT *
FROM africa;

INSERT INTO top_albums
SELECT *
FROM asia;

INSERT INTO top_albums
SELECT *
FROM europe;

INSERT INTO top_albums
SELECT *
FROM north_america;

INSERT INTO top_albums
SELECT *
FROM oceania;

INSERT INTO top_albums
SELECT *
FROM south_america;

-- now finally, create id as PK for each album entry
 ALTER TABLE top_albums 
 ADD id int NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- final table done, ready for EDA
