use vk_1;

-- 1 задание (№2 в ПЗ)
SELECT from_user_id, COUNT(*) FROM messages where to_user_id = 1 GROUP BY from_user_id limit 1;

-- 2 задание (№3 в ПЗ)
SELECT user_id from `profiles` where exists (select 1 from likes where user_id = profiles.user_id) order by birthday desc limit 10 ;

-- 3 задание (№4 в ПЗ)

SELECT 	COUNT(*) as m_likes FROM likes WHERE user_id IN (SELECT user_id FROM `profiles` WHERE gender = 'm');
SELECT 	COUNT(*) as f_likes FROM likes WHERE user_id IN (SELECT user_id FROM `profiles` WHERE gender = 'f');

-- 4 задание (№5 в пз)
SELECT user_id from `profiles` where not exists (select 1 from media where user_id = profiles.user_id) limit 10 ;



