use electronics;

-- Ищем транзисторы и сортируем по цене.
select id, name, price from goods where type_goods_id = (select id from type_goods where name = 'Транзисторы') order by price;

-- Покупаем самый дешевый паяльник.
select * from goods where type_goods_id = (select id from type_goods where name = 'Паяльник электрический') order by price limit 1;

-- Посмотрим много ли у нас эл. компонентов, произведенных в Тайване.
select count(id) from goods where catalog_id = (select id from catalogs where name = 'Электронные компоненты') and manufacturer_id = (select id from manufacturer where name = 'Тайвань');

-- Допустим мы хотим поддержать отечественного производителя и посмотреть соответсвующие товары.
select * from goods where manufacturer_id = (select id from manufacturer where name = 'РФ');

-- Поиск аналога для 2SK163.
select * from goods where name = (select analog_name from radio_analog where original_name = '2SK163');

-- Допустим хотим купить набор в подарок, но бюджет ограничен.
select * from goods where type_goods_id = (select id from type_goods where name = 'Программирование микроконтроллеров') and price <= 2000;
 
-- Самый дорогой подарок для ребенка.
select * from goods where type_goods_id = (select id from type_goods where name = 'Игры для детей') order by price desc limit 1;

-- А что такое 'GDM-8245'? Сейчас узнаем.
select description_prod from goods where name = 'GDM-8245';

-- Посмотреть имя владельца карты, у которого самая большая сумма покупок.
select id, firstname, lastname from users where id = (select user_id from accounts where user_id = (select acc_id from cardholders order by purchase_amount desc limit 1));

-- Соотношение типа товара к товару.
SELECT type_goods.name, goods.name  FROM type_goods INNER JOIN goods where type_goods.id = goods.type_goods_id;

-- соотношение каталога к подкаталогу
SELECT * FROM catalogs INNER JOIN type_goods where catalogs.id = type_goods.catalog_id;

-- Полная информация о пользователе.
SELECT * FROM users INNER JOIN accounts where users.id = accounts.user_id;

-- Товар <-> Отзыв
SELECT goods.id, goods.name, reviews.like_dislike, reviews.review_text FROM goods INNER JOIN reviews where goods.id = reviews.goods_id;

-- ТОП-5 заказов и их авторов по цене.
SELECT users.firstname, users.lastname,orders.price FROM users INNER JOIN orders where users.id = orders.user_id order by orders.price desc limit 5;

-- Посмотрим среднюю сумму заказа.
select AVG(price) as average from orders;

-- Посмотрим отрицательные отзывы, чтобы понять над чем работать.
select * from reviews where goods_rating <= 5;

-- Выберем самый простой проект, если только начинаем заниматься радиоделом.
select * from projects order by complexity limit 1;

-- Посмотрим, что может взять в подарок за счет скоплений на карте пользователь с заданным именем. 
select * from goods where price < (select accumulation_amount from cardholders where acc_id = (select user_id from accounts where user_id = (select id from users where firstname = 'Alexandrine')));
