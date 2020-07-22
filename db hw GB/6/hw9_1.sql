use shop;
use sample;

-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION; 
DELETE FROM sample.users WHERE id = 1;
INSERT INTO sample.users SELECT * FROM shop.users where id = 1;
COMMIT;


-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.
create view namecat as select id, name, (select name from catalogs where id = catalog_id) as 'catalog name' from products; 





