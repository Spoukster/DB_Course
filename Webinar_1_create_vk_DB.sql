CREATE DATABASE vk;
USE vk;

CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120),
    phone INT,
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

CREATE TABLE profiles (
	user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sex CHAR(1),
    birthday DATETIME,
    hometown VARCHAR(100)
);

CREATE TABLE messages (
	from_user_id INT UNSIGNED NOT NULL,
    to_user_id INT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    PRIMARY KEY (from_user_id, created_at),
    INDEX messages_from_user_id_idx(from_user_id),
    INDEX messages_to_user_id_id_idx(to_user_id)
);

CREATE TABLE friendship (
	user_id INT UNSIGNED NOT NULL,
    friend_id INT UNSIGNED NOT NULL,
    status VARCHAR(20),
    requested_at DATETIME DEFAULT NOW(),
    confirmed_at DATETIME,
    PRIMARY KEY (user_id, friend_id),
    INDEX friendship_user_id_idx(user_id)
);

CREATE TABLE communities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    INDEX communities_name_idx(name)
);

CREATE TABLE communities_users (
	community_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (community_id, user_id)
);

CREATE TABLE media (
	id SERIAL PRIMARY KEY,
    media_type_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    filename VARCHAR(255),
    size INT,
    metadata JSON,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX media_user_id_idx(user_id),
    INDEX media_media_type_id_idx(media_type_id)
);

CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE likes (
	from_user_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    PRIMARY KEY (from_user_id, subject_id)
);

CREATE TABLE subjects (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);