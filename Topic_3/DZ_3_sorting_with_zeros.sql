/* В таблице складских запасов storehouses_products в поле value 
могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value.
Однако, нулевые запасы должны выводиться в конце, после всех записей*/

/*Мой вариант
SELECT
	id, storehouse_id, product_id, value
FROM
	storehouses_products
ORDER BY
	CASE WHEN value=0 THEN '9999999' END, value;*/

-- Другой вариант
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;