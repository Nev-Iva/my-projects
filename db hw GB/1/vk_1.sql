DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL primary key, -- BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия пользователя',
    email VARCHAR(120) UNIQUE,
    phone BIGINT NOT NULL UNIQUE,
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

DROP TABLE IF EXISTS media_files;
CREATE TABLE media_files (
	media_file_id SERIAL PRIMARY KEY,
    media_file_created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (media_file_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
	post_id SERIAL PRIMARY KEY,
    post_body TEXT,
    post_created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (post_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    `status` ENUM('read', 'not read'),
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


DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	like_from_user_id BIGINT UNSIGNED NOT NULL,
    like_to_user_id BIGINT UNSIGNED NOT NULL,
    like_set_at DATETIME DEFAULT NOW(), 
    PRIMARY KEY (like_from_user_id, like_to_user_id),
    INDEX likes_from_user_id (like_from_user_id),
    INDEX likes_to_user_id (like_to_user_id),
    FOREIGN KEY (like_from_user_id) REFERENCES users(id),
    FOREIGN KEY (like_to_user_id) REFERENCES users(id),
    FOREIGN KEY (like_from_user_id) REFERENCES media_files(media_file_id),
    FOREIGN KEY (like_to_user_id) REFERENCES media_files(media_file_id),
    FOREIGN KEY (like_from_user_id) REFERENCES posts(post_id),
    FOREIGN KEY (like_to_user_id) REFERENCES posts(post_id) 
);
