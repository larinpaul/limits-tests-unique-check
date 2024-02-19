-- Первчиные Ключи (Primary Keys)
CREATE TABLE employee(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    email VARCHAR(150),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL
);

-- Выведем только одного работника
SELECT * FROM employee LIMIT 1;
-- Если мы под тем же id попробуем вставить кого-то, например
-- INSERT INTO employee (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES ...
-- То мы получим ошибку:
-- ERROR: duplicate key value violates unique constrant "employee_pkey"
-- DETAIL: Key (id)=(1) already exists.

ALTER TABLE employee DROP CONSTRAINT employee_pkey;
-- Теперь вот наша вставка INSERT сработает
SELECT * FROM employee WHERE id = 1;
-- Теперь нам выдаст двух людей с одинаковым id

-- Теперь вернем наш ограничитель
ALTER TABLE employee ADD PRIMARY KEY(id);
-- У нас уже есть два чувака с одним и тем же id...
-- ERROR: could not create unique index "employee_pkey"
-- DETAIL: Key (id)=(1) is duplicated.

-- Если мы попробуем удалить по айди 1, у нас удалится сразу две строки...
DELETE FROM employee WHERE id = 1;
-- DELETE 2
SELECT * FROM employee WHERE id = 1;
-- id | first_name | last_name | gender | email | date_of_birth | country_of_birth
-- ---+------------+-----------+-------+-------+---------------+------------------
-- (0 rows)

-- Добавим первичный ключ...
ALTER TABLE employee ADD PRIMARY KEY (id);
-- ALTER TABLE
-- Да, это сработало без проблем...
