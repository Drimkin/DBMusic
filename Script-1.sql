create table if not exists Genre (
	genre_id SERIAL primary key,
	title VARCHAR(60) unique not NULL
);

create table if not exists Musician (
	musician_id SERIAL primary key,
	nickname VARCHAR(30) NOT NULL UNIQUE
);

create table if not exists GenreMusician (
	genre_id INTEGER references Genre(id),
	musician_id INTEGER references Musician(id),
	constraint pk primary key (genre_id, musician_id)
);

create table if not exists Album (
	album_id SERIAL primary key,
	title VARCHAR(30) not null,
	year integer not NULL CHECK (YEAR > 1900 AND YEAR < 2024)
);


create table if not exists MusicianAlbum (
	musician_id INTEGER references Musician(id),
	album_id INTEGER references Album(id),
	constraint pf primary key (musician_id, album_id)
);

create table if not exists Track (
	track_id SERIAL primary key,
	name VARCHAR(30)not null,
	duration time not null,
	constraint fk_album foreign key (album_id) references Album(album_id)
	
);

create table if not exists Collection (
	collection_id SERIAL primary key,
	title VARCHAR(30) not null,
	year integer not NULL CHECK (YEAR > 1900 AND YEAR < 2024)
);

create table if not exists TrackCollection (
	id SERIAL primary key,
	track_id INTEGER not null references Track(id),
	collection_id INTEGER not null references Collection(id) 
);