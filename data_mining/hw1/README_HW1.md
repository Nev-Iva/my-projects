**Основы клиент-серверного взаимодействия. Парсинг API**
Источник: https://5ka.ru/special_offers/

Задача организовать сбор данных,
необходимо иметь метод сохранения данных в .json файлы

результат: Данные скачиваются с источника, при вызове метода/функции сохранения в файл скачанные данные сохраняются в Json вайлы, для каждой категории товаров должен быть создан отдельный файл и содержать товары исключительно соответсвующие данной категории.

пример структуры данных для файла:

{
"name": "имя категории",
"code": "Код соответсвующий категории (используется в запросах)",
"products": [{PRODUCT},  {PRODUCT}........] # список словарей товаров соответсвующих данной категории
}
