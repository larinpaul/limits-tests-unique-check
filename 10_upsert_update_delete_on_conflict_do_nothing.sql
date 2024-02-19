-- UPDATE, DELETE, UPSERT
-- и работа с конфликтами
-- ON CONFLICT DO NOTHING

-- Для начала рассмотрим операцию DELETE
SELECT * FROM employee;
-- Если мы сделаем так, то вся наша таблица опустеет...
DELETE FROM employee; 
-- Но всегда лучше делать так:
DELETE FROM employee WHERE id = 2;
-- Удалилась запись только под номером 2

SELECT * FROM employee WHERE email LIKE '%google%' AND country_of_birth = 'China';
-- А чтобы удалить, ЗВЁЗДОЧКА НЕ НУЖНА!
DELETE FROM employee WHERE email LIKE '%google%' AND country_of_birth = 'China';


-- LET'S CREATE A SAVEPOINT! :)
SAVEPOINT savepoint1;


UPDATE employee SET email = 'curry@mail.com' -- OH NO, DON'T DO THAT, YOU FORGOT THIS: WHERE id = 3; LOOOL
-- I guess it's time to get back to our savepoint1...
ROLLBACK TO SAVEPOINT savepoint1;
-- Now let's really do what we actually wanted...
UPDATE employee SET email = 'curry@mail.com' WHERE id = 3;

SELECT * FROM employee WHERE id = '3';

-- Представим, что он поменял не только имэйл но и имя
UPDATE employee SET first_name = 'John', last_name = 'Doe', email = 'Jphn.Doe.gmail.com'
    WHERE id = 3; -- <-- Yep, don't forget WHERE at the end! :D

INSERT INTO employee (id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
    VALUES (3, 'John', 'Doe', 'Male', ' John.Doe@gmail.com', DATE '2019-12-10', 'Russia');
-- ERROR: duplcate key alue violates unique constrant "employee_pkey"

-- Но мы можем этот запрет обойти...
ON CONFLICT (id) DO NOTHING;
ON CONFLICT (email) DO NOTHING;

ON CONFLICT (first_name) DO NOTHING;
-- ERROR: there is no unique or exclusion constraint matching the ON CONFLICT specification

-- Но с помощью DO NOTHING мы просто отключаем ошибку..
-- А вот с помощью DO UPDATE мы как раз позволим переделывать..
INSERT INTO employee (id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
    VALUES (3, 'John', 'Doe', 'Male', 'John.Doe@google.com', DATE '2019-12-10', 'Russia')
        ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email;
-- Это и была операция, которая называется UPSERT, то есть UPDATE + INSERT
-- С помощью этой операции (это не ключевое слово), мы можем менять значения полей...
