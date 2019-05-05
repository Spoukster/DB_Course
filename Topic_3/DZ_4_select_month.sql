/*Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
Месяцы заданы в виде списка английских названий ('may', 'august')*/

SELECT
	name, birthday_at
FROM
	users
WHERE
	MONTHNAME(birthday_at) = 'may' OR MONTHNAME(birthday_at) = 'august';