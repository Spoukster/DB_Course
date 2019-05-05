/*Подсчитайте произведение чисел в столбце таблицы*/
DROP TABLE IF EXISTS example;
CREATE TABLE example (
	id SERIAL,
    value INT UNSIGNED
);
INSERT INTO example
VALUES 
	(NULL, 1),
    (NULL, 2),
    (NULL, 3),
    (NULL, 4),
    (NULL, 5);

SELECT ROUND(EXP(SUM(LN(value)))) FROM example;