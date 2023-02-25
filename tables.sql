
--QUIZ 2 FILE 
--sudo -u postgres psql
--CREATE DATABASE music;
--CREATE ROLE music WITH LOGIN PASSWORD '1564';
--psql --host=localhost --dbname=music --username=music;



--table 1 Albums 

DROP TABLE IF EXISTS tracks_albums CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;

CREATE TABLE albums
(
album_ID serial PRIMARY KEY,
title VARCHAR(100) NOT NULL,
artist text NOT NULL,
released DATE NOT NULL
);

--Insert data into table Albums

INSERT INTO albums(title, artist, released )
VALUES 
('The Eminem Show','Eminem', 'May 26, 2002'),
('Therapy Session', 'NF', 'April 22,2016'),
('The Search', 'NF','July 26,2019'),
('My Dear Melancholy','The Weekend', ' March 30,2018'),
('All Eyes On Me', 'Tupac','February 13, 1996'),
('Greatest Hits', ' Notorious B.I.G', 'March 6, 2007' ),
('Noeasy', 'Stray Kids', ' August 23, 2021'),
('Oddinary','Stray Kids', 'March 18,2022'),
('Proof','BTS', 'June 10, 2022'),
('The Chaos Chapter: Freeze','TXT','March 31, 2021');

--table 2 tracks 


CREATE TABLE tracks
(
track_ID serial PRIMARY KEY,
title VARCHAR(100) NOT NULL,
artist text NOT NULL,
length_time time NOT NULL,
track_URL VARCHAR(1000) NOT NULL
);

--Insert data into table Albums

INSERT INTO tracks(title, artist, length_time,track_URL)
VALUES 

('Superman', 'Eminem', '05:50', 'https://youtu.be/Mx_yZk47YN4'),
('Intro 2',' NF', '05:31', 'https://youtu.be/zzcOPNpKvRY') ,
('Only', 'NF', '03:45','https://youtu.be/KzWP7APhsO4'),
('Call out my name','The Weekend', '03:48','https://youtu.be/M4ZoCHID9GI' ),
('Thug Passion', 'Tupac', '05:15','https://youtu.be/RkZhx6kCtR8' ),
('Dead Wrong','Notorious B.I.G','05:15','https://youtu.be/oiPV4yXgL08' ),
('CHEESE', 'Stray Kids', ' 03:03', 'https://youtu.be/YLtEc-kvOqA'), 
('Maniac', 'Stray Kids','03:02','https://youtu.be/APB-AKpnKT4'),
('Boys with luv', ' BTS', '03:49',' https://youtu.be/XsX3ATc3FbA' ),
('Frost', 'TXT','03:15',' https://youtu.be/X3lA4EeeXtM' );



----link table
CREATE TABLE tracks_albums
(
id serial PRIMARY KEY,
album_ID integer REFERENCES albums(album_ID),
track_ID integer REFERENCES tracks(track_ID)
);

-- data for link table
INSERT INTO tracks_albums(album_ID,track_ID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);



    --Select from albums to display data 
    SELECT * FROM albums;
    --Select from tracks to display data 
    SELECT * FROM tracks;
    --Select from link table to display data 
    SELECT * FROM tracks_albums;

--1. Write an SQL query to see the albums and the tracks that belong to that album.
    SELECT a.title,a.released, t.title,t.length_time
    FROM tracks AS T
    INNER JOIN tracks_albums AS TA
    ON T.track_ID=TA.track_ID
    INNER JOIN albums AS A
    ON A.album_ID=TA.album_ID;


--2. Write an SQL query to see the album or albums that each track belongs to.
    SELECT t.title, t.artist, t.length_time , a.title,a.artist, a.released 
    FROM tracks as T
    INNER JOIN tracks_albums AS TA
    ON T.track_ID = TA.track_ID
    INNER JOIN albums AS A
    ON T.track_ID=TA.album_ID;

--3. Write a query to see the number of songs an album has.
    SELECT COUNT(t.title),t.title
    FROM tracks AS T
    INNER JOIN tracks_albums AS TA
    ON T.track_ID= TA.track_ID
    INNER JOIN albums AS A
    ON A.album_ID = TA.album_ID
    GROUP BY  t.title;

   
--4. Write a query to see how many albums a particular track is included on.
    SELECT COUNT(a.title),a.title
    FROM tracks AS T
    INNER JOIN tracks_albums AS TA
    ON T.track_ID= TA.track_ID
    INNER JOIN albums AS A
    ON A.album_ID = TA.album_ID
    GROUP BY  a.title;


