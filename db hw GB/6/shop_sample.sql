DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Негеннадий', '2001-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
  id SERIAL PRIMARY KEY,
  created_at DATE COMMENT 'Дата'
);


INSERT INTO dates (created_at) VALUES ('2018-08-01');
INSERT INTO dates (created_at) VALUES ('2016-08-04');
INSERT INTO dates (created_at) VALUES ('2018-08-16');
INSERT INTO dates (created_at) VALUES ('2018-08-17');


DROP TABLE IF EXISTS datetimes;
CREATE TABLE datetimes (
  id SERIAL PRIMARY KEY,
  created_at DATE COMMENT 'Дата',
   body TEXT
);


INSERT INTO datetimes (created_at, body) VALUES ('2020-08-01', 'Запись 1');
INSERT INTO datetimes (created_at, body) VALUES ('2016-08-04', 'Запись 2');
INSERT INTO datetimes (created_at, body) VALUES ('2018-08-16', 'Запись 3');
INSERT INTO datetimes (created_at, body) VALUES ('2017-08-17', 'Запись 4');
INSERT INTO datetimes (created_at, body) VALUES ('2000-08-01', 'Запись 5');
INSERT INTO datetimes (created_at, body) VALUES ('2006-08-04', 'Запись 6');
INSERT INTO datetimes (created_at, body) VALUES ('2010-08-16', 'Запись 7');
INSERT INTO datetimes (created_at, body) VALUES ('2008-08-17', 'Запись 8');
INSERT INTO datetimes (created_at, body) VALUES ('1998-08-01', 'Запись 9');
INSERT INTO datetimes (created_at, body) VALUES ('2016-08-16', 'Запись 11');
INSERT INTO datetimes (created_at, body) VALUES ('2017-08-17', 'Запись 12');
INSERT INTO datetimes (created_at, body) VALUES ('2020-08-01', 'Запись 13');
INSERT INTO datetimes (created_at, body) VALUES ('2007-08-04', 'Запись 14');
INSERT INTO datetimes (created_at, body) VALUES ('2018-08-16', 'Запись 15');
INSERT INTO datetimes (created_at, body) VALUES ('2018-08-17', 'Запись 16');