/*В таблице products есть два текстовых поля: name с названием товара и
description с его описанием. Допустимо присутствие обоих полей или одно
из них. Ситуация, когда оба поля принимают неопределенное значение NULL
неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей
или оба поля были заполнены. При попытке присвоить полям NULL-значение
необходимо отменить операцию.*/

DELIMITER //
DROP TRIGGER IF EXISTS check_null_value_insert//
CREATE TRIGGER check_null_value_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorret value in name or description fields';
	END IF;
END//

DROP TRIGGER IF EXISTS check_null_value_update//
CREATE TRIGGER check_null_value_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorret value in name or description fields';
	END IF;
END//
DELIMITER ;