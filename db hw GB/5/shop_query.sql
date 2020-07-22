use shop;


-- 1 задание
 select id, name from users where exists (select 1 from orders where user_id = users.id);
 
 -- 2 задание
 select id, name, (select name from catalogs where id = catalog_id) as 'catalog' from products;