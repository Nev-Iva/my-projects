DROP DATABASE IF EXISTS electronics;
CREATE DATABASE electronics;
USE electronics;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL primary key, -- BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия пользователя',
    email VARCHAR(120) UNIQUE,
    phone BIGINT,
    INDEX users_phone_idx(phone), 
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    hometown VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS cardholders;
CREATE TABLE cardholders (
	card_id SERIAL PRIMARY KEY,
	acc_id bigint UNSIGNED not null,
    card_number VARCHAR(100),
    purchase_amount DECIMAL (11,2) COMMENT 'Сумма покупок',
    accumulation_amount DECIMAL (11,2) COMMENT 'Накопленные деньги с покупок(кэшбэк)',
    last_purchase datetime,
    FOREIGN KEY (acc_id) REFERENCES accounts(user_id)
);

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))  
) COMMENT = 'Разделы интернет-магазина';
  
DROP TABLE IF EXISTS type_goods;
CREATE TABLE type_goods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10)),
  catalog_id bigint UNSIGNED not null,
  FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
) COMMENT = 'Разделы интернет-магазина';

  
DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';
  
DROP TABLE IF EXISTS goods;
CREATE TABLE goods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  datasheet TEXT COMMENT 'Характеристики',
  description_prod TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id bigint UNSIGNED not null,
  manufacturer_id bigint UNSIGNED not null,
  type_goods_id bigint UNSIGNED not null,
  FOREIGN KEY (catalog_id) REFERENCES catalogs(id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id),
  FOREIGN KEY (type_goods_id) REFERENCES type_goods(id)
) COMMENT = 'Товары';

DROP TABLE IF EXISTS radio_analog;
CREATE TABLE radio_analog (
  id SERIAL PRIMARY KEY,
  original_id bigint unsigned not null,
  original_name VARCHAR(255) COMMENT 'Наименование оригинала',
  analog_id bigint unsigned not null,
  analog_name VARCHAR(255) COMMENT 'Наименование аналога',
  FOREIGN KEY (original_id) REFERENCES goods(id),
  FOREIGN KEY (analog_id) REFERENCES goods(id)
) COMMENT = 'Аналоги радиоэлементов';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id bigint unsigned not null,
  price DECIMAL (11,2),
  created_at datetime default now(),
  received_at datetime default now(),
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS delivery;
CREATE TABLE delivery (
  id SERIAL PRIMARY KEY,
  order_id bigint unsigned not null,
  address VARCHAR(100),
  price_fror_delivery DECIMAL (11,2),
  delivered_at datetime default now(),
  FOREIGN KEY (order_id) REFERENCES orders(id)
) COMMENT = 'Доставка';

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id bigint unsigned not null,
  goods_id bigint unsigned not null,
  goods_rating TINYINT UNSIGNED COMMENT 'Оценка от 1 до 10',
  review_text TEXT COMMENT 'Комментарий к отзыву',
  created_at datetime default now(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (goods_id) REFERENCES goods(id)
) COMMENT = 'Отзывы покупателей о товарах';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  goods_id bigint unsigned not null,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  foreign key(goods_id) references goods(id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название проекта',
  goods_id bigint unsigned not null COMMENT 'Основной товар, который вам понадобится в проекте',
  goods_list varchar(255) comment 'Список всех товаров',
  description_proj TEXT COMMENT 'Описание проекта',
  complexity int unsigned not null comment 'Сложность проекта от 1 до 10',
  foreign key(goods_id) references goods(id)
) COMMENT = 'Проекты с указанными товарами';

