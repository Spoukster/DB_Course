/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/

SELECT
	id, name
FROM
	users
WHERE
	id IN (SELECT user_id FROM orders);