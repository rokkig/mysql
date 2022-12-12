-- s03 - CRUD OPERATIONS

--  Add a record in our artists table

--  Syntax: INSERT INTO table_name (column_name) VALUES (value1)

	INSERT INTO artists (name) VALUES ("Blackpink");
	INSERT INTO artists (name) VALUES ("Twice");
	INSERT INTO artists (name) VALUES ("Taylor Swift");

-- Display all columns of all artists
	SELECT * FROM artists;

-- Display a specific column of records
-- Syntax SELECT column_name FROM table_name;
	SELECT name FROM artists;

-- Add records / rows in albums TABLE;
-- Add a record with multiple columns
-- Syntax: INSERT INTO table_name (column_name, column_name) VALUES (value1, value2)
	INSERT INTO albums (album_title, date_released, artist_id) VALUES ("The Album", "2020-10-2", 1);
	INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Fancy You", "2019-4-22", 2);
	INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Red", "2012-10-2", 3);

-- Add multiple records in songs TABLE
	INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Fancy", 333, "K-Pop", 2), ("How You Like That", 301, "K-Pop", 1), ("Lovesick Girls", 312, "K-Pop", 1), ("All Too Well (Taylor's Version)", 1000, "Pop", 3);

-- Displaying / retrieving records with selected columns
-- Syntax SELECT (column_name1, column_name2) FROM table_name;
	SELECT song_name, genre FROM songs;

-- Display / retrieve records with certain conditions
-- WHERE clause / keyword
-- syntax: SELECT column_name FROM table_name WHERE condition;
	SELECT song_name FROM songs WHERE genre = "K-Pop";
	SELECT song_name FROM songs WHERE length >= 301;

-- Retrieve records with multiple conditions using the AND CLAUSE and OR CLAUSE
-- AND
	SELECT song_name FROM songs WHERE genre = "Pop" AND length = 1000;
-- OR
	SELECT song_name FROM songs WHERE genre = "K-Pop" OR length < 200;

-- Update Records
-- ex. Add a record to update
	INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Paraluman", 410, "OPM", 2);

	SELECT * FROM songs;

-- Update the records
-- Syntax: UPDATE table_name SET column_name = value WHERE condition;
	UPDATE songs SET song_name = "Feel Special" WHERE song_name = "Paraluman";
	SELECT * FROM songs;

-- Update multiple columns in our records
-- Syntax: UPDATE table_name SET column_name = value, column_name2 = value 2 WHERE condition;
	UPDATE songs SET length = 510, genre = "K-Pop" WHERE song_name = "Feel Special";
	SELECT * FROM songs;

-- Deleting Records
-- Syntax: DELETE FROM table_name WHERE condition;
	DELETE FROM songs WHERE genre = "Pop" AND length >=1000;
	SELECT * FROM songs;