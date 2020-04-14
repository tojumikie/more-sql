drop database ig_clone;
create database ig_clone;
use ig_clone;

create table users(
	id integer AUTO_INCREMENT PRIMARY KEY,
	username varchar(255) UNIQUE not null,
	created_at timestamp DEFAULT now()
);



insert into users(username) VALUES
('BlueTheCat'), ('CharlieBrown'), ('ColtSteele');

create table photos(
	id integer AUTO_INCREMENT PRIMARY KEY,
	image_url varchar(255) not null,
	user_id integer not null,
	created_at timestamp DEFAULT now(),
	FOREIGN key(user_id) REFERENCES users(id)
);

insert into photos(image_url, user_id) VALUES
('/jfeiaojfioea;jejiof', 1),
('/jffeajifo;ejaifeavr', 2),
('/90afjeio;ajcmieojio', 2);

# SELECT photos.image_url, users.username from photos
# INNER JOIN users
# on photos.user_id =  users.id;

create table comments (
	id integer AUTO_INCREMENT PRIMARY key,
	comment_text varchar(255) not null,
	user_id integer not null,
	photo_id integer not null,
	created_at timestamp DEFAULT now(),
	foreign key(user_id) REFERENCES users(id),
	foreign key(photo_id) REFERENCES photos(id)
);

insert into comments(comment_text, user_id, photo_id) VALUES
('Meow!', 1, 2),
('Amazing Shot!', 3, 2),
('I <3 This', 2, 1);

create table likes(
	user_id integer not null,
	photo_id integer not null,
	created_at timestamp DEFAULT now(),
	foreign key(user_id) references users(id),
	foreign key(photo_id) references photos(id),
	PRIMARY key(user_id, photo_id)
);

insert into likes(user_id, photo_id) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(3, 3);


-- won't work because of primary key constraint
insert into likes(user_id, photo_id) values (1,1);

create table follows(
	follower_id integer not null,
	followee_id integer not null,
	created_at timestamp DEFAULT now(),
	foreign key(follower_id) references users(id),
	foreign key(followee_id) references users(id),
	primary key(follower_id, followee_id)
);

insert into follows(follower_id, followee_id) values
(1, 2),
(1, 3), 
(3, 1),
(2, 3);


create table tags(
	id integer AUTO_INCREMENT primary key,
	tag_name varchar(255) UNIQUE,
	created_at timestamp DEFAULT now()
);

create table photo_tags(
	photo_id integer not null,
	tag_id integer not null,
	foreign key(photo_id) references photos(id),
	foreign key(tag_id) references tags(id),
	primary key(photo_id, tag_id)
);

insert into tags(tag_name) values
('adorable'),
('cute'),
('sunrise');

insert into photo_tags(photo_id, tag_id) values
(1, 1),
(1, 2),
(2, 3),
(3, 2);
















