-- Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users, catalogs и products
-- в таблицу logs помещается 
-- время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
use shop;


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	name_table VARCHAR(45) NOT NULL,
	id BIGINT(20) NOT NULL,
	content VARCHAR(45) NOT NULL,
	created_at DATETIME NOT NULL
) ENGINE = ARCHIVE;

SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM catalogs;
SELECT * FROM logs;

DELIMITER //
DROP TRIGGER IF EXISTS logs_users //
CREATE TRIGGER logs_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (name_table, id, content, created_at)
	VALUES ('users', NEW.id, NEW.name, NOW());
END //
DELIMITER ;

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES ('Имя 1', '1988-02-14', NOW(), NOW());


DELIMITER //
DROP TRIGGER IF EXISTS logs_products //
CREATE TRIGGER logs_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (name_table, id, content, created_at)
	VALUES ('products', NEW.id, NEW.name, NOW());
END //
DELIMITER ;

INSERT INTO products (name, description_prod, price, catalog_id, created_at, updated_at)
VALUES ('Продукт 1', 'Описание продукта 1', 10.00, 4, now(), now());


DELIMITER //
DROP TRIGGER IF EXISTS logs_catalogs //
CREATE TRIGGER logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (name_table, id, content, created_at)
	VALUES ('catalogs', NEW.id, NEW.name, NOW());
END //
DELIMITER ;

INSERT INTO catalogs (name)
VALUES ('1 Каталог');	
	

SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM catalogs;
SELECT * FROM logs;
