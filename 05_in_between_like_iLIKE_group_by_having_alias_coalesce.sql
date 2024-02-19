-- Выборка Данных
-- Часть 2

-- IN, BETWEEN, LIKE, iLIKE, GROUP BY, HAVING, ALIAS aka AS, COALESCE

-- Мы можем выбрать так, чтобы показывались
-- только определенныестраны из списка: WHERE
SELECT * FROM employee WHERE country_of_birth = 'Russia' 
    OR country_of_birth = 'United Kingdom' OR country_of_birth = 'Ukraine';

-- Но можно и более короткой записью: IN
SELECT * FROM employee WHERE country_of_birth IN ('Chine', 'Argentina', 'Israel');

-- Условия, находящиеся в определенном промежутке: BETWEEN 
SELECT * FROM employee
    WHERE date_of_birth
    BETWEEN '2019-01-01' AND '2020-01-01';

-- Показ некоего шаблона, по которому будет производиться поиск: LIKE '%.com', % это Wildcard
SELECT * FROM employee WHERE email LIKE '%.com'; -- % означает, что перед ним может быть любое количество символов
SELECT * FROM employee WHERE email LIKE '%gmail.com';
-- Можно % использовать и чтобы показать что-то после него, после этой вайлдкарты
SELECT * FROM epmpoyee WHERE email LIKE 'p%';
-- Но он воспринимает буквально,
-- то есть он будет вести только по тому формату буквы (т.е. маленькая p)
-- Поэтому попробуем так:
SELECT * FROM e employee WHERE email LIKE 'P%';
-- Или даже так:
SELECT *  FROM employee WHERE email iLIKE '%p';

-- Попробуем использовать счетчик, то есть функцию COUNT(*)
SELECT country_of_birth, COUNT(*) FROM employee GROUP BY country_of_birth;
SELECT first_name, COUNT(*) FROM employee GROUP BY first_name;

-- Использование ключевого слова HAVING
SELECT country_of_birth, COUNT(*) FROM employee
    GROUP BY country_of_birth HAVING COUNT(*) > 10
    ORDER BY country_of_birth DESC;

-- AS - Сокращение от Alias, то есть Псевдоним
-- Мы можем с помощью AS присваивать временные переменные нашим сущностям
SELECT id, first_name AS name, last_name AS surname, gender AS sex, email, date_of_birth, country_of_birth
    FROM employee;
-- Теперь в выводе у нас вместо названий колонок, псевдонимы
-- id | name | surname | sex |   email   | date_of_birth | country_of_birth
-- ---+------+--------+------+-----------+---------------+------------------
-- 1 | John | Seheruy | Male | e@mail.ru | '2000-01-01' | Italy

-- COALESCE возвращает первое ненулевое значение,
-- которое присутствует в списке ее аргументов.
-- И обычно эти аргументы представлены столбцом таблицы, к которй обращен запрос.
-- Например, не каждый работник имеет email.
-- И мы можем возвращать не пустое поле, а возвращать 'Not applicable', то есть 'Не прилагается'
-- То есть каждый раз когда будет попадаться пустое поле,
-- мы будем заменять его на 'Not applicable'
SELECT COALESCE(email, 'Not applicable') FROM employee;
-- rhatley@mozilla.org
-- Not applicable
-- mysjs@mail.ru
-- Not applicable
-- myys3@gmail.com
-- ...


















