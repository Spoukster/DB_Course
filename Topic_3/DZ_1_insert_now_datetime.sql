/*Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.*/
UPDATE
	test
SET
	created_at = now(),
    updated_at = now();