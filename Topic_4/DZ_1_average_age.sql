-- Подсчитайте средний возраст пользователей в таблице users.

-- Мой вариант
-- SELECT SUM(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) DIV COUNT(*) AS 'average age' FROM users;

-- Более правильный вариант
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS 'average age' FROM users;