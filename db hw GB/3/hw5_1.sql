DROP DATABASE IF EXISTS shop_1;
CREATE DATABASE shop_1;
USE shop_1;

-- первое задание
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255),    
  created_at DATETIME,
  updated_at DATETIME 
);


insert into users (id, firstname, created_at, updated_at) values
('1', 'Геральт', NULL, NULL),
('2', 'Рагнар', NULL, NULL),
('3', 'Томми',  NULL, NULL),
('4', 'Гендальф', NULL, NULL),
('5', 'Дмитрий', NULL, NULL)
;


UPDATE users SET created_at = now(), updated_at = now();

-- второе задание

DROP TABLE IF EXISTS users_2;
CREATE TABLE users_2 (
	id SERIAL primary key, 
    firstname VARCHAR(255),
    created_at varchar(255),
    updated_at varchar(255)
);

insert into users_2 (id, firstname, created_at, updated_at) values
('1', 'Геральт', '1993-09-14 19:45:58', '1999-09-19 04:35:46'),
('2', 'Рагнар', '1993-09-14 19:45:58', '1999-09-19 04:35:46'),
('3', 'Томми', '1993-09-14 19:45:58', '1999-09-19 04:35:46'),
('4', 'Гендальф', '1993-09-14 19:45:58', '1999-09-19 04:35:46'),
('5', 'Дмитрий', '1985-11-25 16:56:25', '1993-09-14 19:45:58')
;

select str_to_date(created_at, '%Y-%m-%d %k:%i:%s') from users_2;
update users_2 set created_at = str_to_date(created_at, '%Y-%m-%d %k:%i:%s'), updated_at = str_to_date(updated_at, '%Y-%m-%d %k:%i:%s');

alter table users_2 change created_at created_at datetime default current_timestamp;
alter table users_2 change created_at created_at datetime default current_timestamp;



-- 3 задание

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value_count INT UNSIGNED ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into storehouses_products (storehouse_id, product_id, value_count) values
(1, 101, 3400),
(1, 102, 0),
(1, 103, 1000),
(1, 104, 0),
(1, 105, 380);

select * from storehouses_products order by if(value_count > 0, 0, 1), value_count;

-- 4 задание
DROP TABLE IF EXISTS users_3;
CREATE TABLE users_3 (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255),  
  birthday_at DATE ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

INSERT INTO users_3 (firstname, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

select firstname from users_3 where date_format(birthday_at, '%M') in ('may', 'august');


-- 5 задание
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  UNIQUE unique_name(name(10))
);

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

select * from catalogs where id in (5, 1, 2) order by field(id, 5, 1, 2);



