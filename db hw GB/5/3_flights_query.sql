use routes;

select id, (select name_city from cities where label_city = from_city) as 'departure', (select name_city from cities where label_city = to_city) as 'arrival' from flights;