-- Выборка Данных
-- Часть 1
-- IV
-- SELECT, ORDER BY, DISTINCT, WHERE, AND, OR, LIMIT, OFFSET, FETCH

-- выбрать всё
SELECT * FROM employee;

-- Если убрать звёздочку, то Постгрес просто выдаст нам число записей в таблице
SELECT FROM employee;
-- --
-- (1000 rows)

-- Мы можем работать и более точечно, например получив список только имён всех работников
SELECT first_name FROM employee;
-- first_name
-- ---------------
-- Raphael
-- Liza
-- Dunn
-- Clerc
-- Kyle
-- ...

-- Аналогично, мы можем добавлять в выборку несколько параметров, например:
SELECT first_name, last_name FROM employee;
-- first_name | last_name 
-- ----------------------
-- Raphael    | Hatley
-- Liza       | Frail
-- Dunn       | Lincke
-- Clerc      | Bedo
-- Kyle       | Kaar
-- ...

-- Некоторые поля, как мы помним, могут быть пустыми...
SELECT email FROM employee;
--      email
-- ------------------
-- cc@mail.ru
-- dsdfgs@gmail.com
-- 
-- sdgdsgs@mail.ru
-- ...

-- Мы можем также сортировать выборку при помощи ключевых команд
SELECT * FROM employee ORDER BY country_of_birth ASC; -- есть ещё DESC
-- Причём ASC итак вставляется по умолчанию, так что она тут не так то и нужна
SELECT * FROM employee ORDER BY country_of_birth;
-- id | first_name | last_name | gender | email | date_of_birth | country_of_birth
-- 44 | Elke | Leke | Male | emem@mail.com | 2001-01-02 | Albania
-- 44 | Poeke | Oiwee | Feale | emem@mail.com | 2001-01-02 | Albania
-- 44 | Jkee | Posiek | Male |               | 2001-01-02 | Bosnia
-- 44 | Esee | Iyuin | Male | emem@mail.com | 2001-01-02 | Russia

-- Очистим список
\! cls

-- Выведем список, но теперь в убывающем порядке
SELECT * FROM employee ORDER BY country_of_birth DESC;

-- Сделаем выборку не по стране рождения, а по имэйлу, у нас получится очень интересный результат...
SELECT * FROM employee ORDER BY email DESC;
-- Первыми нам выдадут людей, которые имэйлом не обрадают, а потом будут люди на z, потом на w и так далее

-- Если хотим чтобы наша выдача не содержала повторений, мы можем написать ключевое слово DISTINCT
SELECT country_of_birth FROM employee ORDER BY country_of_birth;
-- Angola
-- Angola
-- Brazil
-- ...
SELECT DISTINCT country_of_birth FROM employee ORDER BY country_of_birth;
-- Angola
-- Brazil
-- ...

-- Поедположим что мы решили узнать сколько у нас женщин
SELECT * FROM employee WHERE gender = 'Female';
-- И аналогичным образом мы можем объединять несколько условий в одной выборке
-- Например сколько у нас женщин, которовые родились в Ааргентине.
SELECT * FROM employee WHERE gender = 'Female' AND country_of_birth = 'Argentina';

-- Мы можем также комбинировать несколько логических обераторов в одной выборке,
-- Например добавим сюда оператор OR
SELECT * FROM employee WHERE gender = 'Female' AND (country_of_birth = 'Czech Republic' OR country_of_birth = 'Slovakia')

-- Если мы не хотим смотреть все записи в таблице, а только первые двадцать,
-- то мы можем использовать ключевое слово LIMIT, то есть ограничить выборку первыми 20 записями в нашей таблице
SELECT * FROM employee LIMIT 20;
-- id | first_name | ...
-- 1  | Liza | ...
-- 2  | Rola | ...
-- ...
-- Если же мы хотим посмотреть их не с самого начала, а с определенной позиции,
-- то воспользуемся ключевым словом OFFSET
SELECT * FROM employee OFFSET 10 LIMIT 5;
-- id | first_name | ...
-- 11 | Klara | ...
-- 12 | Ivan | ...
-- 13 | John | ...
-- 14 | Vasya | ...
-- 15 | Olga | ...
-- (5 rows)

-- Также есть еще один способ добиться аналогичного результата, но с помощью другой команды
-- Она более длинная, более вербозная, в ней больше букв, но ее все равно нужно знать.
SELECT * FROM employee OFFSET 10 FETCH FIRST 5 ROW ONLY;
-- id | first_name | ...
-- 11 | Klara | ...
-- 12 | Ivan | ...
-- 13 | John | ...
-- 14 | Vasya | ...
-- 15 | Olga | ...
-- (5 rows)
