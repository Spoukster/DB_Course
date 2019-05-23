/*(по желанию) Напишите хранимую функцию для вычисления произвольного
числа Фибоначчи. Числами Фибоначчи называется последовательность в которой
число равно сумме двух предыдущих чисел. Вызов функции FIBONACCI(10)
должен возвращать число 55.*/

-- Формула Бине
DELIMITER //
DROP FUNCTION IF EXISTS fibonacci//
CREATE FUNCTION fibonacci (n INT)
RETURNS INT
BEGIN
	DECLARE sq FLOAT DEFAULT SQRT(5);
    RETURN (POW(((1 + sq) / 2), n) - POW(((1 - sq) / 2), n)) / sq;
END//
DELIMITER ;

-- Решение через цикл
DELIMITER //
DROP FUNCTION IF EXISTS fibonacci//
CREATE FUNCTION fibonacci (n INT)
RETURNS INT
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE a INT DEFAULT 0;
	DECLARE b INT DEFAULT 1;
    DECLARE c INT;
    IF n < 0 THEN
		RETURN 'Не правильно введено число';
    ELSEIF (n = 0) OR (n = 1) THEN
		RETURN n;
	ELSE
		WHILE i <= n DO
			SET c := a + b,
				a := b,
                b := c,
                i := i + 1;
        END WHILE;
		RETURN c;
    END IF;
END//
DELIMITER ;