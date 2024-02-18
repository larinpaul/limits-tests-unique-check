CREATE TABLE employee(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    email VARCHAR(150),
    date_of_birth DATE NOT NULL
);


INSERT INTO employee (
    first_name, last_name, gender, email, date_of_birth
) VALUES (
    'John', 'Doe', 'MALE', 'Jd@mail.com', '2000-01-10'
);
-- INSERT 0 1

-- Теперь пишем бакслэш dt чтобы убедиться, что количество записей изменилось с нуля на единицу
\dt employee

-- Естественно, заполнять всё вручную одной жизни не хватит,
-- поэтому воспользуемся mockaroo.com
create table employee (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	email VARCHAR(50),
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL
);
-- insert into employee...

-- Проверим что все поля совпадают
\d employee

-- Дропним ее, поскольку файл с mockaroo позволит создать новую таблицу (через терминал)
DROP TABLE employee;

-- Ну а теперь создадим ее снова...
-- И заполним...
-- Чтобы заполнить эту таблицу, мы пишем бакслэш и, как импорт и имя таблицы с полным путем к ней 
\i C:Users/vladi/Documents/Courses/YouTube/'02- Production'/Db/Postgresql/employee.sql
-- А теперь посмотрим как она выглядит! :)
\d employee
SELECT * FROM employee;


