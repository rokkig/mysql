-- To run the MySQL / MariaDB

	mysql -u root

-- "u" stands for username
-- "root" is the default username for SQL


-- show/retrieve all databases:

	SHOW DATABASES;
	-- For the code readability, use all caps to distinguish commands with table names, column names and value inputs.
	-- make sure semi-colons are added at the end of the syntax

-- creating / adding a database
-- Syntax:
	create database database_name;

	CREATE DATABASE music_store;

	-- naming convention in SQL uses the snake_case

-- Dropping / deleting a database
-- Syntax:
	DROP DATABASE database_name;

	DROP DATABASE music_store;

-- Select a database
	-- Syntax:
	USE database_name;

	USE music_db;

-- Creating / adding tables:
-- Syntax:
	CREATE TABLE table_name(
			column1,
			column2,
			PRIMARY KEY(id)
		)

	-- Column Syntax:

	column_name data_type other_options

	CREATE TABLE singers(
			id INT NOT NULL AUTO_INCREMENT,
			name VARCHAR(50),
			PRIMARY KEY (id)
		);

	CREATE TABLE artists(
			id INT NOT NULL AUTO_INCREMENT,
			name VARCHAR(50) NOT NULL,
			PRIMARY KEY (id)
		);


-- Deleting / Dropping tables:
-- Syntax:
	DROP TABLE table_name;

-- Describe tables - allows us to see the table columns, data_types, and extra_options set
-- Syntax:
	DESCRIBE table_name;

-- Add "records" table.
-- Tables with foreign key
-- Syntax:
	CONSTRAINT foreign_key_name
		FOREIGN KEY (column_name)
		REFERENCES table_name(id)
		ON UPDATE ACTION
		ON DELETE ACTION

	CREATE TABLE records(
			id INT NOT NULL AUTO_INCREMENT,
			album_title VARCHAR(25) NULL,
			artists_id INT NOT NULL,
			PRIMARY KEY (id),
			CONSTRAINT fk_albums_artist_id
				FOREIGN KEY (artists_id)
				REFERENCES artists(id)
				ON UPDATE CASCADE
				ON DELETE RESTRICT
		);

-- Rename "records" tables to "albums"
	ALTER TABLE records
		RENAME TO albums;

-- Add a column to an existing table
	ALTER TABLE albums
		ADD date_released DATE NOT NULL;

-- DELETE COLUMNS
	ALTER TABLE albums
		DROP COLUMN date_released;

-- Adding a column to a specific position
	ALTER TABLE albums
		ADD year DATE NOT NULL
		AFTER album_title;

-- Renaming a column:
	ALTER TABLE albums
		CHANGE COLUMN year date_released DATE NOT NULL;

	ALTER TABLE albums
		CHANGE COLUMN artists_id artist_id INT NOT NULL;

-- Modifying a column
	ALTER TABLE albums
		MODIFY album_title VARCHAR(50) NOT NULL;

-- Create "songs" table
	CREATE TABLE songs(
			id INT NOT NULL AUTO_INCREMENT,
			song_name VARCHAR(50) NOT NULL,
			length TIME NOT NULL,
			genre VARCHAR(50) NOT NULL,
			album_id INT NOT NULL,
			PRIMARY KEY (id),
			CONSTRAINT fk_songs_album_id
				FOREIGN KEY (album_id)
				REFERENCES albums(id)
				ON UPDATE CASCADE
				ON DELETE RESTRICT
		);

-- Create "users" table
	CREATE TABLE users(
			id INT NOT NULL AUTO_INCREMENT,
			username VARCHAR(50) NOT NULL,
			password VARCHAR(50) NOT NULL,
			full_name VARCHAR(50) NOT NULL,
			contact_number INT NOT NULL,
			email VARCHAR(50),
			address VARCHAR(50),
			PRIMARY KEY (id)
	);

	CREATE TABLE playlists(
			id INT NOT NULL AUTO_INCREMENT,
			datetime_created DATETIME NOT NULL,
			user_id INT NOT NULL,
			PRIMARY KEY (id),
			CONSTRAINT fk_playlists_user_id
				FOREIGN KEY (user_id)
				REFERENCES users(id)
				ON UPDATE CASCADE
				ON DELETE RESTRICT
	);

-- Create joining playlists songs table. Linking table

CREATE TABLE playlists_songs(
	id INT NOT NULL AUTO_INCREMENT,
	playlist_id INT NOT NULL,
	song_id INT NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_playlists_songs_playlist_id
		FOREIGN KEY(playlist_id) REFERENCES playlists(id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT fk_playlists_songs_song_id
		FOREIGN KEY(song_id) REFERENCES songs(id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);