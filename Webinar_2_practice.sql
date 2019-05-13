SELECT * FROM users LIMIT 1;
SELECT * FROM users WHERE id = 1;
SELECT firstname, lastname FROM users WHERE id = 1;
SELECT firstname, lastname, 'main_photo', 'city' FROM users WHERE id = 1;

SELECT
	firstname,
	lastname,
    (SELECT filename FROM media WHERE id = (SELECT photo_id FROM profiles WHERE user_id = 1)) AS main_photo,
    (SELECT hometown FROM profiles WHERE user_id = 1) AS city
FROM users
WHERE id = 1;

SELECT * FROM media_types WHERE name LIKE 'photo';

SELECT filename FROM media
	WHERE user_id = 3 AND media_type_id = (SELECT id FROM media_types WHERE name LIKE 'photo');

SELECT * FROM subject_types;        

SELECT 
	body,
    created_at
FROM news
WHERE user_id = 1;

SELECT
	COUNT(*)
FROM media
WHERE user_id = 3 AND media_type_id = (SELECT id FROM media_types WHERE name LIKE 'photo');

DESC friendship;

SELECT * FROM friendship WHERE user_id = 1;

DESC likes;

SELECT * FROM friendship WHERE user_id = 1 AND status IS TRUE;
SELECT * FROM friendship WHERE user_id = 1 AND status;

SELECT * FROM news WHERE user_id IN (
	SELECT friend_id FROM friendship WHERE user_id = 1 AND status
);

SELECT * FROM news WHERE user_id = 1;
-- Новости пользователя и друзей
SELECT * FROM news WHERE user_id = 1
UNION
SELECT * FROM news WHERE user_id IN (
	SELECT friend_id FROM friendship WHERE user_id = 1 AND status
)
ORDER BY created_at DESC
LIMIT 10;

-- Вывод likes
SELECT to_subject_id FROM news WHERE user_id = 1
UNION
SELECT to_subject_id FROM news WHERE user_id IN (
	SELECT friend_id FROM friendship WHERE user_id = 1 AND status
);
-- Все лайки из новостей
SELECT * FROM likes WHERE to_subject_id IN (
	SELECT to_subject_id FROM news WHERE user_id = 1
	UNION
	SELECT to_subject_id FROM news WHERE user_id IN (
		SELECT friend_id FROM friendship WHERE user_id = 1 AND status
	)
);
-- Количество лайков к сущностям(фото, новости и тд)
SELECT to_subject_id, COUNT(*) FROM likes WHERE to_subject_id IN (
	SELECT to_subject_id FROM news WHERE user_id = 1
	UNION
	SELECT to_subject_id FROM news WHERE user_id IN (
		SELECT friend_id FROM friendship WHERE user_id = 1 AND status
	)
)
GROUP BY to_subject_id;

-- Архив новостей по месяцам
SELECT
	COUNT(id) AS news,
    MONTHNAME(created_at) AS month
FROM news
GROUP BY month;


SELECT
	COUNT(id) AS news,
    user_id AS user
FROM news
GROUP BY user;

SELECT
	COUNT(id) AS news,
    MONTHNAME(created_at) AS month
FROM news
GROUP BY month
ORDER BY FIELD(month, 'January', 'Febrary', ...) DESC;

-- Сообщения
SELECT * FROM messages
WHERE from_user_id = 1
	OR to_user_id = 1
ORDER BY created_at DESC;
-- Недоставленные сообщения
SELECT * FROM messages
WHERE from_user_id = 1
	AND delivered IS NOT TRUE
ORDER BY created_at DESC;

-- Друзья
SELECT
	user_id,
    CASE (sex)
		WHEN 'm' THEN 'man',
        WHEN 'f' THEN 'women'
	END AS sex,
    'age'
FROM profiles
WHERE user_id IN (
	SELECT friend_id
    FROM friendship
    WHERE user_id = 1
		AND confirmed_at IS NOT NULL
);
