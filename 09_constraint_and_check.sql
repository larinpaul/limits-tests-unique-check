-- 2024 02 18

create table employee (
    id BIGSEARIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAT(6) NOT NULL,
    email VARCHAR(150),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL
);

insert into employee (first_name, last_name, gender, email, date_of_birth, country_of_birth) values (1, 'Raphael', 'Watley', 'Male', 'rhatley0@mozilla.org', '2019-04-2', 'China');

SELECT email, count(*) FROM employee GROUP BY email;

SELECT email, count(*) FROM employee GROUP BY email HAVING COUNT(*) > 1;

SELECT email, count(*) FROM employee GROUP BY email HAVING COUNT(*) > 1;

SELECT * FROM employee WHERE email = 'rhatley0@mozilla.org';


-- Вставим ограничение
ALTER TABLE employee ADD CONSTRAINT unique_email_address UNIQUE (email);

SELECT * FROM employee WHERE email = 'rhatley0@mozilla.org';

DELETE FROM employee WHERE id = 1001;

-- Посмотрим структуру нашей таблицы
\d employee
-- Выводит структуру таблицы

SELECT * FROM employee;
-- Выводит все содержимое таблицы, т.е. хоть миллионы строк, и все столбцы


-- Следующее ограничение - ограничение CHECK, то есть мы можем заставить Postgres проверять определенные условия.

insert into employee (first_name, last_name, gender, email, date_of_birth, country_of_birth) values (1, 'Raphael', 'Watley', 'Pandamale', 'pandarhatley0@mozilla.org', '2019-04-2', 'China');
-- INSERT 0 1
-- Это значит что вставка прошла без проблем...

SELECT DISTINCT gender FROM employee;
-- gender
-- --------
-- Female
-- Panda
-- Male
-- (3 rows)

ALTER TABLE employee ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');
-- ERROR: check constraint "gender_constraint" is violated by some row

DELETE FROM employee WHERE gender = 'Panda';
-- DELETE 1
ALTER TABLE employee ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');
-- ALTER TABLE
