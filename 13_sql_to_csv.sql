-- Экспортируем SQL таблицу в CSV

SELECT * FROM employee

LEFT JOIN bicycle ON bicycle.id = employee.bicycle_id
    WHERE bicycle_id IS NOT NULL;

\copy (SELECT * FROM employee LEFT JOIN bicycle ON bicycle.id = employee.bicycle_id WHERE bicycle_id IS NOT NULL) TO '/Users/Public/Liza' DELIMITER ',' CSV HEADER;
-- COPY 1

-- Теперь если мы хотим без хедеров, мы просто можем убрать из SQL запроса HEADER
\copy (SELECT * FROM employee LEFT JOIN bicycle ON bicycle.id = employee.bicycle_id WHERE bicycle_id IS NOT NULL) TO '/Users/Public/Liza' DELIMITER ',' CSV HEADER;
-- COPY 1
