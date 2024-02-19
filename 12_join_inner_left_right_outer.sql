-- Объединение таблиц
-- XII
-- INNER, LEFT, RIGHT, FULL OUTER joins

-- INNER JOINS
-- Объединение таблиц, у которых есть одинаковые колонки

-- Таблица  Таблица
-- [pen]    [apple]

-- Таблица
-- [apple+pen]

-- Для того, чтобы провести INNER JOIN, берем таблицу bicycle
-- с велосипедами, которые будем давать служащим за службу

-- Кстати дефолтный JOIN - INNER JOIN

SELECT * FROM bicycle;

SELECT * FROM employee
    JOIN bicycle ON employee.bicycle_id = bicycle.id;

SELECT employee.first_name, bicycle.make, bicycle.type, bicycle.price
    FROM employee
    JOIN bicycle ON employee.bicycle_id = bicycle.id;


-- Теперь о том как работает LEFT JOIN
-- Таблица  Таблица
-- [motor]    [bicycle]

-- Все записи из левой таблицы, и плюс записи с совпадением из правой таблицы
-- Таблица
-- [motor+cycle]

-- То есть если у нас левая таблица - employee,
-- то у нас будет полно записей из employee,
-- и только одна запись - из таблицы bicycle.

SELECT * FROM employee
    LEFT JOIN bicycle ON bicycle.id = employee.bicycle_id;
-- id | ... | email | date_of_birth| country_of_birth | bicycle_id | id | 
-- и тут будет все слева заполнено, а справа только у тех у кого есть велосипед...

-- Но иногда это неудобно, слишком много пустых,
-- поэтому мы можем вывести всех работников, у которых есть велосипед,
-- используя NOT NULL
SELECT * FROM employee
    LEFT JOIN bicycle ON bicycle.id = employee.bicycle_id WHERE bicycle_id IS NOT NULL;
-- И в такой ситуации использование INNER JOIN даже более оправдано...
SELECT * FROM employee
    INNER JOIN bicycle ON bicycle.id = employee.bicycle_id WHERE bicycle_id IS NOT NULL;

-- LEFT JOIN с условием, это то же что INNER JOIN без условия.

-- К примеру если нам нужно увидеть, кто имеет велосипед, то INNER JOIN более оправдан
-- Если же нужно увидеть, у кого нет велосипеда, то LEFT JOIN более оправдан


-- RIGHT JOINS
-- Таблица    Таблица
-- [british]  [exit]

-- Выдача всех значений из правой таблицы, а также значений из левой таблицы, если он отсутствуют
-- Таблица
-- [br+exit]

-- Например, мы выведем все велосипеды справа,
-- но слева будет только работник, у котого есть велосипед
SELECT * FROM employee
    RIGHT JOIN bicycle ON bicycle.id = employee.bicycle_id;


-- Ну и самый последний JOIN, это FULL OUTER JOIN, который соединит вообще все
-- соответственно, пустые поля могут быть как слева, так и справа
SELECT * FROM employee
    FULL OUTER JOIN bicycle ON bicycle.id = employee.bicycle_id;
-- И у нас представлена вся таблица employee, и пустые поля могут быть как слева, так и справа
