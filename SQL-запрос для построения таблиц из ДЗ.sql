create table if not exists Genre(
	id SERIAL primary key,
	name varchar(80),
	UNIQUE NULLS NOT distinct (name)
);

create table if not exists Performer(
	id SERIAL primary key,
	name varchar(80),
	UNIQUE NULLS NOT distinct (name)
);

create table if not exists Genre_Performer(
	genre_id integer references Genre(id),
	performer_id integer references Performer(id),
	constraint pk primary key (genre_id, performer_id)
);

create table if not exists Album(
	id SERIAL primary key,
	name varchar(100) not null,
	year_release date,
	CHECK (year_release > '19700101')
);

create table if not exists Album_performer(
	album_id integer references Album(id),
	performer_id integer references Performer(id),
	constraint pk2 primary key (album_id, performer_id)
);

create table if not exists Track(
	id SERIAL primary key,
	album_id integer not null references Album(id),
	name varchar(100) not null,
	duration integer not null,
	CHECK (duration > 0)	
);

create table if not exists Mix(
	id SERIAL primary key,
	name varchar(80) not null,
	year_release date not null,
	CHECK (year_release > '19700101'),
	UNIQUE NULLS NOT distinct (name)
);

create table if not exists Mixed_tracks(
	track_id integer references Track(id),
	mix_id integer references Mix(id),
	constraint mix_track_uniq primary key (track_id, mix_id)
);