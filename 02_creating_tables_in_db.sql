-- Создание Таблиц в Базе Данных при помощи SQL

CREATE TABLE table_name (
    column_name + datatype + constraints (if any) 
)

CREATE TABLE employee (
    id BIGSERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(6),
    email VARCHAR(150),
    date_of_birth DATE,
);

CREATE TABLE employee (id BIGSERIAL, first_name VARCHAR(50), last_name VARCHAR(50), gender(50), email VARCHAR(150), date_of_birth DATE);

-- Набираем бэкслэш d чтобы посмотреть список таблиц 
\d

--          List of relations
-- Schema |     Name        |   Type   | Owner
-- ----------------------------------------------
-- public |    employee     |   table  | postgres
-- public | employee_id_seq | sequence | postgres
-- (2 rows)

-- Теперь посмотрим что у таблицы внутри
\d employee

DROP TABLE employee; -- Таки опасная команда!
-- DROP TABLE
\d employee
-- Did not find any relation named "employee".

-- Давайте пересоздадим нашу таблицу, только в этот раз добвим к ней ограничения
CREATE TABLE employee(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    email VARCHAR(150),
    date_of_birth DATE NOT NULL
);
