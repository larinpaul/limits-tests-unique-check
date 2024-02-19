-- Агрегаты и Базовая Арифметика
CREATE TABLE holiday (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    destination_country VARCHAR(100) NOT NULL,
    destination_country VARCHAR(100) NOT NULL,
    price VARCHAR(50)
);

SELECT * FROM holiday;


SELECT MAX(price) FROM holiday;

SELECT MIN(price) FROM holiday;

SELECT AVG(price) FROM holiday;

SELECT SUM(price) FROM holiday;

SELECT ROUND(AVG(price)) FROM holiday;

-- Самые дорогие путевки в определенную страну, в определенный город
SELECT destination_country, destination_city, MAX(price)
    FROM holiday GROUP BY destination_country, destination_city;
-- destination_country | destination_city | max
-- --------------------+------------------+-----
-- France              |    Brignoles     | 2555.16
-- China              |    Huniao     | 4370.75

-- Самые дешевые...
SELECT destination_country, destination_city, MIN(price)
    FROM holiday GROUP BY destination_country, destination_city;

-- А теперь только по стране,
-- то есть какая у нас самая дешевая путевка по конкретной стране
SELECT destination_country, MIN(price) FROM holiday GROUP BY destination_country;

-- Стоимость всех путевок, которые мы разыгрываем
SELECT SUM(price) FROM holiday;


-- Выдай мне сумму путевок в конкретную страну
SELECT destination_country, SUM(price) FROM holiday GROUP BY destination_country;


-- Если нужно производить расчёты прямо в запросе

SELECT 100 + 2;
-- 102
SELECT 100 * 2;
-- 200
SELECT 100 / 2;
-- 50
SELECT 100 - 2;
-- 98
SELECT 100 ^ 2;
-- 10000
SELECT 100 % 2; -- Деление по модулю, то есть возврат остатка от деления
-- 0
SELECT 5!; -- Также для особых любителей есть функция "факториал"
-- 120


-- Снова пробежимся по функции округления, то есть ROUND
-- Это выдаст нам price с копейками
SELECT id, destination_country, destination_city, price FROM holiday;
-- А это его округлит
SELECT id, destination_country, destination_city, ROUND(price) FROM holiday;
