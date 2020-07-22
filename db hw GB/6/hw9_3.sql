use shop;

-- 1 

DELIMITER // 
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello ()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN 
   DECLARE result varchar(20); 
   declare hours INT;
   SET hours = HOUR(CURTIME());
   IF hours >= 0 and hours < 6 THEN
      SET result = 'Доброй ночи'; 
   ELSEIF hours >= 6 AND hours <= 12 THEN
      SET result = 'Доброе утро'; 
	ELSEIF hours >= 13 AND hours <= 18 THEN
      SET result = 'Добрый день'; 
	ELSEIF hours > 18 AND hours <= 23 THEN
      SET result = 'Добрый вечер'; 
   ELSE
      SET result = 'no result'; 
   END IF; 
   RETURN result; 
END; // 
DELIMITER ;



-- 2 
DELIMITER //
DROP TRIGGER check_products_value_insert//
CREATE TRIGGER check_products_value_insert before INSERT ON products
FOR EACH ROW
BEGIN
	IF (new.name is NULL) and (new.description_prod is NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert canceled';
	END IF;
END//

INSERT INTO shop.products (name, description_prod, price, catalog_id) VALUES
  (Null, 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1);
INSERT INTO shop.products (name, description_prod, price, catalog_id) VALUES
  ('Intel', NULL, 7890.00, 1);
INSERT INTO shop.products (name, description_prod, price, catalog_id) VALUES
  ('INTEL', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1);
INSERT INTO shop.products (name, description_prod, price, catalog_id) VALUES
  (NULL, NULL, 7890.00, 1);
