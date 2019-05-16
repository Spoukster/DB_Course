/*Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT
	p.id, p.name, p.price, c.name AS catalog_name
FROM
	products AS p JOIN catalogs AS c
ON
	c.id = p.catalog_id
    