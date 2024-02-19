-- Внешние ключи (Foreign Keys)

CREATE TABLE bicycle (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULLM
    type VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);


ALTER TABLE employee ADD bicycle_id BIGINT REFERENCES bicycle.id
ALTER TABLE employee ADD bicycle_id BIGINT REFERENCES bicycle(id);

-- Добавим ограничение, что одному работнику должен принадлежать только один велосипед
ALTER TABLE employee ADD UNIQUE(bicycle_id);


-- Заполним таблицу bicycle велосипедами
INSERT INTO bicycle (make, type, price)
    VALUES ('Indi ATB', 'Mountain Bike', '100.00');

INSERT INTO bicycle (make, type, price)
    VALUES ('Apollo Cafe', 'Women Hybrid Bike', '160.00');
    
INSERT INTO bicycle (make, type, price)
    VALUES ('Brompton', 'Folding Bike', '1045.00');

SELECT * FROM bicycle;

-- Выберем первые 10 работников из нашей компании
SELECT * FROM employee LIMIT(10);


UPDATE employee SET bicycle_id = 2 WHERE id = 4;

SELECT * FROM employee WHERE id = 4;
