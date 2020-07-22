DROP DATABASE IF EXISTS shop_2;
CREATE DATABASE shop_2;
USE shop_2;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- 1 задание
INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
select name, floor((TO_DAYS(now()) - TO_DAYS(birthday_at)) / 365.25) AS age from users;
select AVG (timestampdiff(YEAR, birthday_at, now())) as age from users;

-- 2 задание
select date_format((concat_ws('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at))), '%W') as days, count(*) as summ from users group by days;


