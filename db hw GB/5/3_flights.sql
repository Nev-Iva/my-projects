DROP DATABASE IF EXISTS routes;
CREATE DATABASE routes;
USE routes;


DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_city VARCHAR(255) COMMENT 'Откуда',
  to_city VARCHAR(255) COMMENT 'Куда'
) COMMENT = 'Рейсы';

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label_city VARCHAR(255) COMMENT 'eng',
  name_city VARCHAR(255) COMMENT 'rus'
) COMMENT = 'города';


INSERT INTO flights (from_city, to_city) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
  
  INSERT INTO cities (label_city, name_city) VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
  
  
