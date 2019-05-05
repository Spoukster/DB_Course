/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

SELECT 
    DAYNAME(
		DATE_FORMAT(
			DATE_ADD(birthday_at, INTERVAL (YEAR(NOW()) - YEAR(birthday_at)) YEAR), '%Y-%m-%d'
		) -- День рождения в текщем году
	) AS day_of_birthday,
    COUNT(*)
FROM users
GROUP BY day_of_birthday;