/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи
в таблицах users, catalogs и products в таблицу logs помещается время
и дата создания записи, название таблицы, идентификатор первичного ключа
и содержимое поля name.*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    time DATETIME,
    table_name VARCHAR(15),
    id_pk BIGINT,
    name VARCHAR(20)
) ENGINE=Archive;

DELIMITER //
DROP TRIGGER IF EXISTS insert_to_users//
CREATE TRIGGER insert_to_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs
		VALUES (DEFAULT, NOW(), 'users', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS insert_to_catalogs//
CREATE TRIGGER insert_to_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs
		VALUES (DEFAULT, NOW(), 'catalogs', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS insert_to_products//
CREATE TRIGGER insert_to_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs
		VALUES (DEFAULT, NOW(), 'products', NEW.id, NEW.name);
END//
DELIMITER ;