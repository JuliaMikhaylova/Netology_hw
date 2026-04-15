CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	musician_id SERIAL PRIMARY KEY,
	musician_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_title VARCHAR(80) NOT NULL,	
	year_release INTEGER  NOT NULL CHECK (year_release <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL CHECK (duration > 0),
	album INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	collection_title VARCHAR(80) NOT NULL,
	year_release INTEGER NOT NULL CHECK (year_release <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE IF NOT EXISTS MusicianGenre (
	id SERIAL PRIMARY KEY,
	genre_id INTEGER NOT NULL REFERENCES Genre(genre_id),
	musician_id INTEGER NOT NULL REFERENCES Musician(musician_id)
);

CREATE TABLE IF NOT EXISTS AlbumMusician (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album(album_id),
	musician_id INTEGER NOT NULL REFERENCES Musician(musician_id)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	id SERIAL PRIMARY KEY,
	collection_id INTEGER NOT NULL REFERENCES Collection(collection_id),
	track_id INTEGER NOT NULL REFERENCES Track(track_id)
);

