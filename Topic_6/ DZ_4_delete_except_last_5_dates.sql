/*(по желанию) Пусть имеется любая таблица с календарным полем created_at.
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.*/

DROP TABLE IF EXISTS dates;
CREATE TABLE dates (date DATE);
INSERT INTO dates VALUES ('2018-08-01'), ('2018-08-04'), ('2018-08-16'),
('2018-08-17'), ('2018-08-10'), ('2018-08-14'), ('2018-08-20'), ('2018-08-25');

DROP TABLE IF EXISTS temp;
CREATE TEMPORARY TABLE temp (date DATE);

INSERT INTO temp SELECT * FROM DATES ORDER BY date DESC LIMIT 5;

DELETE FROM dates WHERE date NOT IN (SELECT * FROM temp);