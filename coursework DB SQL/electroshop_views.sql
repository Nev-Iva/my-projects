use electronics;

  
-- Товар <-> Каталог <-> Тип товара
CREATE VIEW goods_info AS SELECT goods.id id, goods.name name, catalogs.name catalog, type_goods.name type_good FROM goods, catalogs, type_goods where goods.catalog_id = catalogs.id and goods.type_goods_id = type_goods.id;
  
  -- Информация о владельце карты  
create view cardholder_info as select users.firstname firstname, users.lastname lastname, accounts.gender gender, accounts.birthday birthday, cardholders.card_number card_namber, cardholders.purchase_amount purchase_amount, cardholders.accumulation_amount accumulation_amount, cardholders.last_purchase last_purchase from users, accounts, cardholders where users.id = accounts.user_id and accounts.user_id = cardholders.acc_id; 

-- Информация о доставке (имя заказчика, телефон, адрес доставки и стоимость заказа)
create view delivery_info as select users.firstname firstname, users.lastname lastname, users.phone phone, delivery.address, orders.price price from users, orders, delivery where users.id = orders.user_id and orders.id = delivery.order_id; 

