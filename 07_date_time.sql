-- Работа с Датой и Временем

-- Выдает сколько сейчас времени
SELECT NOW();
-- 2020-03-05 11:26:06.472689+00

-- Можно и отлфильтровать результат,
-- Например, вот тут Постгрес выдаст только Дату
SELECT NOW()::DATE;
-- 2020-03-05

SELECT NOW()::TIME;
-- 11:28:28.240359
-- Довольно полезная штука, когда нужно сделать таймстэмп...


-- Далее, функция INTERVAL()

SELECT NOW();

SELECT NOW() - INTERVAL '1 YEAR';
-- 2019-03-05 11:32:19.591868+00

SELECT NOW() - INTERVAL '100 YEAR';
-- 1920-03-05 11:32:31.53564+00

SELECT NOW() - INTERVAL '10 MONTHS';
-- 2019-05-05 11:32:51.175982+01

SELECT NOW() - INTERVAL '10 DAYS';
-- 2020-02-04 11:33:00.775854+00

SELECT NOW() + INTERVAL '100 YEAR';
-- 2120-03-05 11:34:35.919578+00

-- В нокоторых случаях нам может потребоваться извлечь чатсь данных из общей выдачи
SELECT NOW();

SELECT EXTRACT(YEAR FROM NOW());

SELECT EXTRACT(MONTH FROM NOW());

SELECT EXTRACT(DAY FROM NOW());

-- Мы можем также извлечь и день недели
SELECT EXTRACT (DOW FROM NOW());
-- 4 - среда
-- 1 - Воскресенье
-- 2 - Вторник
-- 7 - Суббота

-- С помощью AGE() можно узнать возраст с какого-либо момента
SELECT first_name, last_name, gender, country_of_birth, date_of_birth
    FROM employee;
SELECT
    first_name,
    last_name,
    gender,
    country_of_birth,
    date_of_birth,
    AGE(NOW(), date_of_birth) AS age
    FROM employee;
