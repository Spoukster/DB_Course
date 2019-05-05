-- Подсчитайте средний возраст пользователей в таблице users.
SELECT SUM(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) DIV COUNT(*) AS 'average age' FROM users;