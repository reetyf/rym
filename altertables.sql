
-- import all continents into separate tables (Done with csv import wizard)




-- since we don't have a PK in our tables (added after importing to final table)
-- we need to be able to update columns. disable safe update
SET SQL_SAFE_UPDATES = 0;


-- after data loaded, need to drop `Rank` and add `Region` for each continent
-- as well as removing commas from the int fields of reviews and ratings
ALTER TABLE africa
DROP COLUMN `Rank`;
ALTER TABLE africa
ADD Region text;
UPDATE africa
SET Region = 'Africa'
WHERE Ratings >0;
UPDATE africa
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE africa
SET Reviews = REPLACE(Reviews, ',', '');


ALTER TABLE asia
DROP COLUMN `Rank`;
ALTER TABLE asia
ADD Region text;
UPDATE asia
SET Region = 'Asia'
WHERE Ratings >0;
UPDATE asia
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE asia
SET Reviews  = REPLACE(Reviews, ',', '');

ALTER TABLE europe
DROP COLUMN `Rank`;
ALTER TABLE europe
ADD Region text;
UPDATE europe
SET Region = 'Europe'
WHERE Ratings >0 ;
UPDATE europe
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE europe
SET Reviews  = REPLACE(Reviews, ',', '');


ALTER TABLE north_america
DROP COLUMN `Rank`;
ALTER TABLE north_america
ADD Region text;
UPDATE north_america
SET Region = 'North America'
WHERE Ratings >0 ;
UPDATE north_america
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE north_america
SET Reviews  = REPLACE(Reviews, ',', '');

ALTER TABLE oceania
DROP COLUMN `Rank`;
ALTER TABLE oceania
ADD Region text;
UPDATE oceania
SET Region = 'Oceania'
WHERE Ratings >0 ;
UPDATE oceania
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE oceania
SET Reviews  = REPLACE(Reviews, ',', '');

ALTER TABLE south_america
DROP COLUMN `Rank`;
ALTER TABLE south_america
ADD Region text;
UPDATE south_america
SET Region = 'South America'
WHERE Ratings >0 ;
UPDATE south_america
SET Ratings  = REPLACE(Ratings, ',', '');
UPDATE south_america
SET Reviews  = REPLACE(Reviews, ',', '');

-- reset safe updates
SET SQL_SAFE_UPDATES = 1;
