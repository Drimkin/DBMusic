create table if not exists Genre (
	id SERIAL primary key,
	title VARCHAR(60) not NULL
);

create table if not exists Musician (
	id SERIAL primary key,
	nickname VARCHAR(30) not null
);

create table if not exists GenreMusician (
	genre_id INTEGER references Genre(id),
	musician_id INTEGER references Musician(id),
	constraint pk primary key (genre_id, musician_id)
);

create table if not exists Album (
	id SERIAL primary key,
	title VARCHAR(30) not null,
	year date not null
);


create table if not exists MusicianAlbum (
	musician_id INTEGER references Musician(id),
	album_id INTEGER references Album(id),
	constraint pk primary key (musician_id, album_id)
);

create table if not exists Track (
	id integer primary key references Album(id),
	name VARCHAR(30)not null,
	year date not null
);

create table if not exists Collection (
	id SERIAL primary key,
	title VARCHAR(30) not null,
	year date not null
);

create table if not exists TrackCollection (
	id SERIAL primary key,
	track_id INTEGER not null references Track(id),
	collection_id INTEGER not null references Collection(id) 
);