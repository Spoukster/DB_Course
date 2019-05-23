/*(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

DELIMITER //
DROP PROCEDURE IF EXISTS insert_1m//
CREATE PROCEDURE insert_1m()
BEGIN
	SET @x = 0;
    REPEAT
		INSERT INTO users1
			VALUES (NULL, 'User_name', '2018-05-22', NOW(), NOW()),
            (NULL, 'User_name', '2018-05-22', NOW(), NOW()),
            (NULL, 'User_name', '2018-05-22', NOW(), NOW()),
            (NULL, 'User_name', '2018-05-22', NOW(), NOW()),
            (NULL, 'User_name', '2018-05-22', NOW(), NOW());
		SET @x = @x + 1;
	UNTIL @x > 200000
	END REPEAT;
END//
DELIMITER ;