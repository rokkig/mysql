-- Advanced Selects and Joining Tables

-- Insert / Add more artists to expand the data we can use

INSERT INTO artists (name) VALUES ("Lady Gaga");
INSERT INTO artists (name) VALUES ("Justin Bieber");
INSERT INTO artists (name) VALUES ("Ariana Grande");
INSERT INTO artists (name) VALUES ("Bruno Mars");

-- Taylor Swift
-- add albums:
INSERT INTO albums (album_title, date_released, artist_id) VALUES("Fearless", "2008-11-11", 3);

-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES("Fearless", 246, "Pop Rock", 4), ("Love Story", 213, "Country Pop", 4), ("State of Grace", 243, "Rock, Alternative Rock, Arena Rock", 3), ("Red", 204, "Country", 3);

-- Lady Gaga
-- Albums
INSERT INTO albums (album_title, date_released, artist_id) VALUES("A Star is Born", "2018-10-10", 4);
INSERT INTO albums (album_title, date_released, artist_id) VALUES("Born This Way", "2011-06-29", 4);

-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES("Shallow", 201, "Country, Rock, Folk Rock", 5), ("Born This Way", 252, "Electro Pop", 6);

-- Justin Bieber
INSERT INTO albums (album_title, date_released, artist_id) VALUES("Purpose", "2015-11-13", 5), ("Believe", "2012-06-15", 5);
INSERT INTO songs (song_name, length, genre, album_id) VALUES("Sorry", 132, "Dancehall-poptropical", 7), ("Boyfriend", 251, "Pop", 8);

-- Ariana Grande
INSERT INTO albums (album_title, date_released, artist_id) VALUES("Dangerous Woman", "2016-05-20", 6), ("Thank U, Next", "2019-02-08", 6);
INSERT INTO songs (song_name, length, genre, album_id) VALUES("Into You", 242, "EDM house", 9), ("Thank U, Next", 156, "Pop, R&B", 10);

-- Bruno Mars
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("24K Magic", "2016-11-18", 7), ("Earth to Mars", "2011-01-20", 7);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("24K Magic", 207, "Funk, disco", 11), ("Lost", 152, "Pop", 12);

-- Field Projection
-- Exlude Records
-- ! Not

SELECT * FROM songs WHERE id != 11;
SELECT * FROM songs WHERE album_id != 5 AND album_id != 6;

-- Finding records using comparison
SELECT * FROM songs WHERE length > 230 OR length < 200;

-- Getting records with specific conditions
-- querying multiple values
SELECT * FROM songs WHERE id = 1 OR id = 3 OR id = 5;

-- querying multiple values in a single column using IN clause
SELECT * FROM songs WHERE id IN (1, 3, 5);
SELECT * FROM songs WHERE genre IN ("Pop", "K-Pop");

-- Show records with a partial match
-- LIKE clause

-- Find values with a match at the starts
-- % - wildcard operator which represents zero or multiple characters
SELECT * FROM songs WHERE song_name LIKE "th%";

-- Find values with a match at the end
SELECT * FROM songs WHERE song_name LIKE "%ce";

-- match at any position
SELECT * FROM songs WHERE song_name LIKE "%u%";

-- underscore( _ ) - another wildcard that represents a single character

-- Find values with a match of a specific length / pattern
SELECT * FROM songs WHERE song_name LIKE "___t";

-- Find values with a match at certain positions
SELECT * FROM songs WHERE song_name LIKE "_ea%";

-- Sorting records
-- Syntax: SELECT column_name FROM table_name ORDER BY column_name ORDER
-- ASC for ascending and DESC for descending
SELECT * FROM songs ORDER BY song_name;
SELECT * FROM songs ORDER BY song_name ASC; --Default
SELECT * FROM songs ORDER BY song_name DESC;
SELECT * FROM songs ORDER BY length DESC;

-- Secondary sort
SELECT * FROM albums
	JOIN songs ON albums.id = songs.album_id
	ORDER BY album_title DESC, song_name ASC;

-- Limiting Records
SELECT * FROM songs LIMIT 7;

-- Showing with distinct values
SELECT genre FROM songs;
-- to remove the duplicates and only retrieve with distinct values
SELECT DISTINCT genre FROM songs;

-- Joining two tables

-- Syntax:
SELECT column_name FROM table1
	JOIN table2 ON table1.id = table2.foreign_key_column;

SELECT * FROM artists
	JOIN albums ON artists.id = albums.artist_id;

SELECT name, album_title FROM artists
	JOIN albums ON artists.id = albums.artist_id;

-- Selecting columns to be displayed from joining multiple tables
-- Syntax
SELECT column_name FROM table1
	JOIN table2 ON table1.id = table2.foreign_key_column
	JOIN table3 ON table2.id = table3.foreign_key_column;

SELECT * FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

SELECT name, album_title, date_released, song_name, length, genre FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

SELECT artists.name, albums.album_title, songs.song_name FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

-- Providing aliases for joining tables
-- Syntax
SELECT column_name AS alias FROM table1
	JOIN table2 ON table1.id = table2.foreign_key_column
	JOIN table3 ON table2.id = table3.foreign_key_column;

SELECT name AS band, album_title AS albums, song_name AS song, genre FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

-- Displaying data from joining tables
-- Create user information, playlist, and songs added to their user playlist:

INSERT INTO users (username, password, full_name, contact_number, email, address) VALUES ("john", "john1234", "John Doe", 09123456789, "john@mail.com", "New York");

INSERT INTO playlists (datetime_created, user_id) VALUES ("2022-07-07 06:36:00", 1);

INSERT INTO playlists_songs (playlist_id, song_id) VALUES (1,1), (1,10), (1,11), (1,7);

-- Join multiple tables of playlists_songs and songs
SELECT * FROM songs
	JOIN playlists_songs ON songs.id = playlists_songs.song_id;

-- Join multiple tables of playlists_songs and songs
SELECT * FROM songs
	JOIN playlists_songs ON songs.id = playlists_songs.song_id
	JOIN playlists ON playlists.id = playlists_songs.playlist_id;

SELECT user_id, datetime_created, song_name, length, genre FROM songs
	JOIN playlists_songs ON songs.id = playlists_songs.song_id
	JOIN playlists ON playlists.id = playlists_songs.playlist_id;

SELECT user_id, datetime_created, song_name, length, genre FROM playlists
	JOIN playlists_songs ON playlists.id = playlists_songs.playlist_id
	JOIN songs ON playlists_songs.id = songs.id;

-- Joining full_name, datetime_created, song_name, length, genre, album_title from the tables playlists, users, playlists_songs, songs, albums

SELECT full_name, datetime_created, song_name, length, genre, album_title, artists.name AS artist FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id
	JOIN playlists_songs ON songs.id = playlists_songs.song_id
	JOIN playlists ON playlists.id = playlists_songs.playlist_id
	JOIN users ON users.id = playlists.user_id;