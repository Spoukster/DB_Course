/*Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
Поля from, to и label содержат английские названия городов, поле name — русское.
Выведите список рейсов flights с русскими названиями городов.*/

SELECT
	f.id, c1.name, c2.name
FROM
	flights AS f
    JOIN cities AS c1 ON c1.label = f.from
    JOIN cities AS c2 ON c2.label = f.to
    ORDER BY f.id;