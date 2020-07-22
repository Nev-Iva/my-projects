DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL primary key, -- BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия пользователя',
    email VARCHAR(120) UNIQUE,
    phone BIGINT,
    INDEX users_phone_idx(phone), 
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 
    INDEX messages_from_user_id (from_user_id),
    INDEX messages_to_user_id (to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL PRIMARY KEY, -- изменили на композитный ключ (initiator_user_id, target_user_id)
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    -- `status` TINYINT UNSIGNED,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	confirmed_at DATETIME,
	
    PRIMARY KEY (initiator_user_id, target_user_id),
	INDEX (initiator_user_id), -- потому что обычно будем искать друзей конкретного пользователя
    INDEX (target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id serial primary key,
    community_name varchar(150),
    
    index communities_name_idx(community_name)
);

DROP TABLE IF EXISTS user_communities;
CREATE TABLE user_communities(
	   user_id bigint unsigned not null,
	   community_id bigint unsigned not null,
    
		primary key (user_id, community_id),
        foreign key (user_id) references users(id),
        foreign key (community_id) references communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	  id serial primary key,
      media_name varchar(255),
      created_at datetime default now(),
      updated_at datetime default current_timestamp on update current_timestamp
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	  id serial primary key,
      media_type_id bigint unsigned not null,
      user_id bigint unsigned not null,
      bode text,
      filename varchar(255),
      size int,
      metadata json,      
      created_at datetime default now(),
      updated_at datetime default current_timestamp on update current_timestamp,
      
      index (user_id),
      foreign key (user_id) references users(id),
      foreign key(media_type_id) references media_types(id)      
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	  id serial primary key,
      user_id bigint unsigned not null,
      media_id bigint unsigned not null,
      created_at datetime default now()      
);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` serial,
	`album_name` varchar(255) DEFAULT NULL,
	`user_id` bigint unsigned DEFAULT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY key(`id`)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id serial,
	`album_id` bigint unsigned NOT NULL,
	`media_id` bigint unsigned NOT NULL,
	
	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    author_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 
    INDEX posts_author_id (author_id),    
    FOREIGN KEY (author_id) REFERENCES users(id)    
);





    
 
