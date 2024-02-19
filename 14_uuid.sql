-- Уникальные Идентификаторы UUID
-- А для того, чтобы использовать UUID, нужно сперва добавить соответствующее расширение
-- Сперва выведем список всех расширений.

SELECT * FROM pg_available_extensions

CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; -- generate universally unique identifiers (UUIDs)

-- Теперь для того, чтобы посмотреть какие функции есть в нашем расширении,
-- набираем бэкслэш ди эф
\df
-- Нас интересует в первую очередь uuid_generate_v4
SELECT uuid_generate_v4();
-- У нас сгенерировалась функция, её мы можем поставлять в SQL запрос
-- 12e9fba1-f545-4c68-a319-b1796601300e

-- Давайте создадим простенькую таблицу Паспорт
CREATE TABLE passport (
    passport_serial UUID NOT NULL PRIMARY KEY,
    issue_date DATE NOT NULL,
    expire_date DATE NOT NULL,
    country_of_issue VARCHAR(150) NOT NULL
);
\d passport

INSERT INTO passport (passport_serial, issue_date, expire_date, country_of_issue)
    VALUES (uuid_generate_v4(), '2020-03-03', '2020-03-03', 'United_Kingdom');

SELECT * FROM passport;
-- passport_serial                     | issue_date | expire_date | country_of_issue
-- ------------------------------------+------------+-------------+-----------------
-- 83081c57-c820-4174-b941-da82a344c45f| 2020-03-03 | 2020-03-03 | United_Kingdom
-- (1 row) 
