-- Generation time: Thu, 28 May 2020 02:43:07 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_24
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `like_from_user_id` bigint(20) unsigned NOT NULL,
  `like_to_user_id` bigint(20) unsigned NOT NULL,
  `like_set_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`like_from_user_id`,`like_to_user_id`),
  KEY `likes_from_user_id` (`like_from_user_id`),
  KEY `likes_to_user_id` (`like_to_user_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`like_from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`like_to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`like_from_user_id`) REFERENCES `media_files` (`media_file_id`),
  CONSTRAINT `likes_ibfk_4` FOREIGN KEY (`like_to_user_id`) REFERENCES `media_files` (`media_file_id`),
  CONSTRAINT `likes_ibfk_5` FOREIGN KEY (`like_from_user_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `likes_ibfk_6` FOREIGN KEY (`like_to_user_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `media_files`;
CREATE TABLE `media_files` (
  `media_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_file_created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`media_file_id`),
  CONSTRAINT `media_files_ibfk_1` FOREIGN KEY (`media_file_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('read','not read') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `posts` VALUES ('101','Debitis voluptas repellat necessitatibus minima error ducimus in. Fuga rem in dolorem aut sit consequatur. Minima voluptates praesentium voluptatem officia.','2002-03-27 20:37:12'),
('102','Beatae est maiores vel non quidem nihil perspiciatis. Et aut ullam iure amet quibusdam. Quaerat minus quis nisi voluptatem.','1986-10-29 04:56:37'),
('103','Voluptatem distinctio vitae magni qui. Sequi impedit beatae ducimus eum amet. Similique voluptas vitae quibusdam quis. Atque omnis saepe magnam rem.','2010-03-10 17:45:49'),
('104','Quo quaerat enim enim aut. Expedita dolores dolor incidunt. Mollitia veritatis et quis non et in. Ipsa facere nobis delectus velit minima ut odio incidunt.','1974-09-13 14:51:05'),
('105','Reiciendis expedita minima qui ut. Cumque tenetur et aspernatur distinctio tempore sit a perspiciatis. Rerum saepe doloribus illo vero labore praesentium sequi. Quasi mollitia enim ad illo.','2004-04-29 20:13:30'),
('106','A maxime quis voluptatum praesentium consequuntur. Rerum voluptatem temporibus eius est cum enim architecto quia. Similique eveniet id quam necessitatibus sint nostrum sunt.','1970-12-29 09:28:16'),
('107','Reiciendis ullam molestiae architecto ut ducimus consequuntur dolore saepe. Maiores reprehenderit laborum cum dolores. Quia dolor cupiditate molestias quidem dolorem. Aliquid dolores temporibus qui facilis dolore.','2000-12-11 12:52:01'),
('108','Harum maxime sunt non laudantium repellat. Iste est omnis illum et aut. Laudantium voluptas molestiae distinctio nihil tempora amet quo aut.','1974-12-06 22:29:50'),
('110','Velit consequatur tenetur dolorem est non. Omnis amet vel rerum ut optio. Assumenda tenetur qui ut minima. Ratione reprehenderit unde officiis magni ut ut sed.','2000-07-09 13:36:13'),
('111','Ducimus qui ut ratione debitis impedit. Aut aut ab consequatur nam consequuntur nulla.','2008-06-26 20:55:44'),
('113','Vitae voluptates repudiandae occaecati eos. Provident nemo enim alias voluptates consequatur. Hic ipsum aperiam repellat ipsa numquam iste aperiam tempore. Quae repellendus tempora consequatur.','1994-02-18 20:02:26'),
('115','Qui sit unde unde voluptas officiis sit dolorum totam. Vel quidem omnis fugiat nihil assumenda. Dolore eum qui nulla earum asperiores qui. Sit vel molestias adipisci quis autem.','2005-07-25 13:48:39'),
('116','Impedit molestiae quam deleniti est et. Dolore omnis eum ex perspiciatis quos. Quia sit non fugiat blanditiis. Aut vitae totam cum qui ducimus rem. Aut in deserunt ea rerum autem.','1973-06-28 04:43:32'),
('117','Quia dicta voluptas doloribus qui dolorem dolorem. Nostrum autem totam eligendi animi. Dignissimos quo ut est. Excepturi quo dolore aut deleniti et necessitatibus eos.','2005-12-31 16:21:00'),
('120','Deserunt rerum quia facilis asperiores ipsa. Labore maxime iusto qui ipsum iusto ab voluptatem itaque. Repudiandae debitis dignissimos architecto similique inventore qui. Non voluptatem autem animi voluptates.','1980-10-27 12:55:47'),
('121','Praesentium est vel debitis sequi excepturi exercitationem. Et commodi quos recusandae facere. Aliquid sit error aut autem minus minus veritatis.','2001-03-14 10:56:45'),
('123','Dolorem doloribus id repellat nihil sint enim et. Nostrum quia fuga exercitationem unde.','1972-11-11 14:31:07'),
('124','Voluptatum doloribus asperiores blanditiis accusamus. Eaque voluptas ut aut pariatur eos veritatis sequi. Perspiciatis laborum at vel sed.','2006-12-22 05:22:03'),
('131','Recusandae omnis sit asperiores vero. Ut iure non veniam doloribus. Expedita facilis quibusdam vitae voluptas ea quo. Ex dicta est eius et quo. Incidunt non dolorem qui placeat dolor et numquam.','1989-04-16 02:57:30'),
('135','Dignissimos quo necessitatibus omnis sit ad beatae. Iste quam unde qui et. Nihil qui et sint quia aut expedita assumenda. Sint non quas voluptate et inventore nobis et sunt.','2013-06-02 16:32:33'),
('139','Voluptatum suscipit qui et consequatur. Veritatis atque ullam placeat illo beatae temporibus. Numquam rerum aut quis aut. Et ab accusamus voluptatibus eum.','1982-10-12 02:55:06'),
('142','Veritatis et mollitia ad necessitatibus tempore consequuntur voluptas voluptas. Iste illum illo molestias ut. Porro et unde ut et ut dolores adipisci.','2019-08-09 18:14:59'),
('143','Quos qui blanditiis pariatur eos. Deleniti laboriosam minus est rerum nostrum dolor.','1989-08-22 15:34:47'),
('145','Suscipit dignissimos odio nemo ducimus consequuntur sed natus minus. Non et adipisci dolorum ad quis atque. Reiciendis delectus placeat mollitia est iusto.','1997-08-16 17:49:19'),
('147','Voluptas esse repellat doloribus asperiores rerum iusto. Assumenda in qui quos autem eveniet qui.','1997-12-15 22:15:50'),
('149','Aspernatur aut facere dolor. Et expedita tempore ipsam eveniet omnis magni. Hic et corrupti vel corporis amet non. Nihil ut occaecati odio labore nostrum.','1996-12-29 14:37:55'),
('151','Est veritatis velit sunt in aut. Consequuntur aspernatur voluptatum voluptate. Doloribus facere molestias ut enim eos. Sint eos aliquam fugit sit doloribus totam explicabo.','1987-06-07 21:14:21'),
('152','Architecto consectetur aut necessitatibus totam in. Totam rem laboriosam esse qui inventore repellat autem. Minima maiores molestiae dolores nisi et. A in nihil nihil rerum esse.','2011-09-25 03:41:49'),
('153','Placeat voluptas eos voluptatum reprehenderit quasi. Ea aliquid hic voluptate nulla est. Sit aut sapiente et dolorem similique voluptatem alias. Qui et at in sed maxime deserunt nobis.','2005-10-26 04:39:40'),
('156','Aut aspernatur sint voluptate. Molestiae iste sint occaecati quisquam. Aspernatur similique cumque voluptas aut.','2018-07-14 04:55:11'),
('157','Sed dolorem quos omnis est omnis aut qui. Est asperiores cum voluptatem fugit et debitis quo. Eos rerum nulla corporis nemo provident quam voluptatum.','2015-03-24 10:39:48'),
('158','Repellendus nulla hic non dolorum similique. Dignissimos nihil illo voluptate hic modi dolorem magni ut. Beatae voluptas quis aut sunt blanditiis enim.','2011-10-05 22:56:29'),
('159','Velit doloremque beatae debitis quisquam temporibus sunt. Et ipsam nostrum quibusdam sunt. Asperiores culpa quaerat et et amet nobis soluta. Qui nam nihil dolor est et voluptatem vitae.','2000-04-06 12:25:46'),
('160','Qui pariatur laborum est ipsam et. Amet voluptatem assumenda aut quis autem reprehenderit rem. Explicabo sunt nemo nemo architecto nobis culpa voluptatum.','2011-11-01 08:07:26'),
('161','Qui nihil sed in ipsum perspiciatis tempora error. Nihil quia labore praesentium aut velit.','1982-04-14 05:53:30'),
('162','Id reprehenderit voluptatem inventore incidunt quis. Rerum amet tenetur aperiam quis. Vel ex accusantium esse rerum alias sit.','1991-09-10 17:06:58'),
('166','Harum iusto dolorem voluptates. Est veniam aspernatur quibusdam officia tempore facilis. Voluptas qui recusandae velit quod. Nihil voluptates nemo voluptatum voluptas.','1981-03-12 06:08:45'),
('167','Illo doloribus exercitationem numquam et deleniti adipisci aperiam. Hic quis et ducimus doloribus. Qui dolorem est asperiores consequatur ut molestiae.','2014-06-05 03:32:24'),
('169','Eos id molestias id fugiat quisquam. Sunt eaque ipsam aut voluptate ipsa. Voluptas consequatur sit voluptatum esse laboriosam.','2006-09-13 10:59:56'),
('170','Corporis vitae id est sit rem. Nisi quas perspiciatis dolor consequatur error necessitatibus. Minima quo aliquid pariatur et totam.','1997-02-02 21:39:53'),
('172','Non optio debitis vel consequuntur distinctio dolor hic. Qui repellendus aspernatur in ex ducimus voluptates ullam. Id asperiores eos qui quod.','1976-08-20 07:40:15'),
('173','In id nobis quis dolor error quo quia explicabo. Ea numquam minima autem cupiditate eaque aut. Omnis ut modi sed sit dolorum. Quo ut earum eum consequatur.','1972-01-12 15:53:34'),
('176','Ut molestias mollitia et illo sunt facilis. Assumenda tempora iusto nesciunt placeat. Repellat consequuntur labore voluptatibus ea et ut architecto. Unde doloremque ad quos sunt tenetur accusamus repellendus.','1990-05-10 19:44:08'),
('177','Quia quos neque at voluptates explicabo voluptatem. Quam inventore praesentium et ex. Tenetur voluptas doloremque totam cupiditate molestiae.','2017-05-04 16:24:29'),
('178','Recusandae nobis nulla consequatur rerum ab pariatur ut rem. Suscipit eveniet reprehenderit necessitatibus doloremque perferendis sed. Itaque vel ut consequatur dignissimos quis consequuntur dolorum unde. Sunt aperiam distinctio quaerat inventore quos. Occaecati voluptatem ab id natus officia saepe commodi voluptatum.','2020-05-01 01:22:55'),
('179','Ad quis rerum perspiciatis sunt. Magni esse minus consequatur voluptatem qui. Non ut tempore sit et velit modi non.','1973-12-18 12:19:27'),
('181','Earum aut reiciendis qui rerum provident. Ullam et nulla autem doloribus atque quidem fugit provident. Consequuntur nisi est blanditiis dignissimos corrupti accusamus.','1996-09-28 11:33:19'),
('183','Nobis dolorem quo eum dolorem dignissimos quo. Ipsa est et rem. Iusto alias inventore assumenda voluptatem voluptas assumenda commodi.','1985-07-28 19:53:42'),
('184','Est maxime voluptatibus dolorum pariatur. Quia nam occaecati itaque corrupti necessitatibus atque repellat. Sint assumenda ducimus quibusdam nihil animi quas molestiae porro.','2018-02-12 07:55:13'),
('185','Consequatur numquam excepturi est aperiam et. Est at quia adipisci culpa. Possimus similique ullam illum cupiditate magni facilis voluptas.','1976-08-05 20:56:38'),
('186','Quam minus distinctio nisi dolorem. Voluptatem eos iure distinctio neque quos est. Dicta numquam perferendis nisi suscipit autem sit.','2001-10-30 14:29:25'),
('187','Vero occaecati veniam unde vero tempore itaque nobis. Est ipsam asperiores et porro.','2018-04-28 19:06:55'),
('189','Sint sit non qui rem. Nihil rerum eum dolores aliquid non. Neque vel adipisci est soluta.','1981-03-18 07:39:58'),
('190','Ab fugit atque aut eligendi voluptates repellendus sint et. Dolorem consequuntur illum sit sed nesciunt. Nesciunt tenetur et et necessitatibus eos. Officiis voluptas ab cumque illo.','2018-01-26 22:17:23'),
('191','Omnis ut iste quia sed qui reiciendis qui. Soluta magni quas et atque ipsam ad. Ad qui perspiciatis expedita neque totam. Quam eum reiciendis molestiae repudiandae non fugiat et et.','1989-12-24 18:39:23'),
('193','Velit totam quia veritatis ducimus. Veniam aut qui sequi ut quo nisi. Maxime odit harum ut omnis occaecati est.','1983-09-16 13:11:51'),
('196','Et rem unde est recusandae impedit. Aut eum tenetur voluptas modi atque ut saepe nemo. Vitae sed magnam non soluta reiciendis.','1993-03-26 14:38:28'),
('197','Qui minus aliquid nulla voluptas eaque. Suscipit aut provident nisi. Corrupti libero dicta magni quis porro.','1995-07-12 22:30:37'),
('198','Laudantium consequuntur pariatur error. In sed sit numquam aperiam. Quis nemo impedit pariatur magnam ut. Cumque numquam dolorum dolorem aspernatur odit animi. Dolore quos dolores earum iusto.','1986-04-18 20:31:09'),
('199','Totam illum dicta at ex voluptatem. Asperiores tenetur harum neque at id praesentium nobis. Velit et animi eos dolorem. Quibusdam quos accusamus laborum impedit sapiente odio aut.','2020-05-21 01:14:34'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('101','M','2000-12-11','2','2003-06-22 01:55:15','Perrymouth'),
('102','M','2019-12-21','5','1994-08-29 09:53:11','Port Quinnport'),
('103','M','1989-05-26','5','1998-10-24 11:41:52','Port Holden'),
('104','M','1977-05-31','3','1979-05-21 19:07:09','Schinnermouth'),
('105','D','2011-01-02','4','2008-09-22 11:18:12','Lillahaven'),
('106','M','2013-07-27','6','2015-08-16 23:52:49','West Boris'),
('107','M','2009-02-26','7','1992-11-09 21:21:41','Lynchfurt'),
('108','M','2007-06-09','6','1986-08-04 14:47:13','South Wade'),
('110','M','2005-04-18','3','1977-05-27 22:04:30','Port Leslie'),
('111','D','1996-12-01','7','1992-07-20 09:38:06','West Meredithfurt'),
('113','P','1994-05-07','1','1981-12-11 04:08:19','Gorczanytown'),
('115','D','1980-11-14','6','2011-10-22 22:46:04','Port Bryonmouth'),
('116','M','1995-12-01','9','1973-12-20 17:11:26','Veumside'),
('117','P','1990-11-12','5','1976-09-24 17:20:22','Kraigchester'),
('120','P','1985-10-01','4','2001-01-15 06:15:42','New Arleneport'),
('121','P','1983-06-14','7','2008-08-18 21:14:20','New Vivien'),
('123','P','1991-02-06','6','1983-12-19 03:44:53','South Malcolm'),
('124','M','1985-09-17','5','1994-08-20 02:54:04','Runolfsdottirmouth'),
('131','M','1978-12-15','8','1997-06-05 16:37:36','West Mariannatown'),
('135','M','1991-09-07','2','2001-12-22 06:09:46','Alishachester'),
('139','P','1985-10-11','2','1971-09-15 03:13:37','Jaskolskimouth'),
('142','P','2007-08-29','8','2019-04-08 06:48:02','Emiestad'),
('143','M','2001-08-21','6','1992-01-08 13:02:14','Jeanieton'),
('145','M','1992-08-11','3','1991-08-28 15:20:12','Nicolaston'),
('147','D','2001-10-19','7','1982-02-09 13:18:34','South Judsonberg'),
('149','M','2013-08-09','6','2010-01-08 05:44:30','Port Anissa'),
('151','M','1981-10-27','9','1970-08-17 03:22:58','Gusikowskifort'),
('152','M','1996-01-04','5','1975-03-11 23:08:01','North Carolynport'),
('153','M','2001-08-25','8','2001-11-08 00:10:45','New Haileetown'),
('156','M','1995-08-28','6','1975-10-16 05:08:31','South Pietroview'),
('157','D','1982-08-17','1','1975-11-15 18:45:03','Schimmelville'),
('158','D','1992-10-03','8','1990-10-27 11:38:23','South Rowland'),
('159','P','2019-07-30','6','1979-04-09 00:01:57','Boyerview'),
('160','P','2000-05-18','8','2010-07-28 20:30:04','South Samanthaland'),
('161','P','1970-03-24','3','1975-08-29 12:48:38','South Yadira'),
('162','D','2000-10-12','3','2002-07-01 22:17:11','East Bruce'),
('166','M','1973-02-26','5','1994-04-05 17:39:13','North Jarvisfort'),
('167','M','2011-03-15','5','2018-05-05 03:59:51','Vincentland'),
('169','D','2000-05-14','1','1997-05-11 20:55:01','Lake Holly'),
('170','P','2008-11-12','6','2002-05-25 20:14:26','Ollieland'),
('172','M','1975-07-24','9','1997-10-18 00:18:32','Lindgrenview'),
('173','M','2010-04-08','8','2003-03-20 02:27:56','Kozeychester'),
('176','M','1986-05-22','6','1976-04-25 02:12:40','Windlerborough'),
('177','M','2010-06-03','7','2016-05-31 19:35:03','Port Kirsten'),
('178','M','1980-08-15','4','1979-03-23 00:12:46','New Vicky'),
('179','M','1984-09-14','6','1997-05-20 00:15:23','Port Brandt'),
('181','P','1973-03-27','9','2008-08-28 20:47:29','East Idellaland'),
('183','P','1994-07-17','1','1989-03-03 08:03:26','Jaydenhaven'),
('184','D','1988-02-26','7','2017-12-23 20:40:41','North Brennanport'),
('185','M','2004-10-07','8','1998-10-11 03:30:36','Port Gregghaven'),
('186','M','2009-07-22','2','1972-12-02 07:29:57','West Ardith'),
('187','D','2005-04-26','7','2011-08-11 09:18:08','Revaport'),
('189','M','1992-12-25','7','2011-01-28 20:44:15','East Maverickmouth'),
('190','M','2002-08-16','9','1979-01-10 09:09:13','Lake Jerod'),
('191','D','2015-01-22','8','2012-03-06 00:45:10','Hermanville'),
('193','M','1992-02-12','8','2018-08-19 20:10:25','Liamport'),
('196','M','2008-09-10','6','1971-03-02 09:18:16','South Arjun'),
('197','M','1993-11-07','8','1996-12-18 23:35:59','Lake Arjun'),
('198','D','1995-11-25','5','1996-01-10 06:41:36','South Nya'),
('199','P','1994-02-01','6','2014-05-09 12:26:02','South Jacques'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('101','Ayana','Lueilwitz','madisyn72@example.net','3'),
('102','Lera','Stoltenberg','helen78@example.org','543'),
('103','Bettye','Littel','waelchi.burnice@example.com','634288'),
('104','Zena','Nikolaus','joe.harvey@example.org','1'),
('105','Rose','Lindgren','carlos.bosco@example.net','597'),
('106','Misty','Collier','fd\'amore@example.com','7898421473'),
('107','Kennedi','Torphy','mcasper@example.com','58214'),
('108','Caesar','Metz','murray.kiara@example.net','39'),
('110','Dina','Zieme','gmorar@example.org','0'),
('111','Kayden','Satterfield','umarks@example.net','265711'),
('113','Ezequiel','Conn','nona.schmitt@example.com','409'),
('115','Dante','Kemmer','easter.watsica@example.org','9315548578'),
('116','Tom','Williamson','khayes@example.com','734208'),
('117','Gerardo','Lesch','jmuller@example.net','713371'),
('120','Frank','Ward','koch.simeon@example.com','149'),
('121','Dorthy','Sporer','qlakin@example.com','514116'),
('123','Josefina','VonRueden','mante.heaven@example.org','66'),
('124','Elda','Rodriguez','syost@example.org','659649'),
('131','Ophelia','Turner','wisoky.serena@example.org','303626'),
('135','Makenna','Frami','emanuel02@example.org','911'),
('139','Aylin','Grimes','sabbott@example.com','451140'),
('142','Rhiannon','Pouros','dhomenick@example.org','152'),
('143','Wyman','Runolfsdottir','gaston97@example.com','2'),
('145','Mable','Mitchell','evonrueden@example.org','183'),
('147','Teresa','Feeney','ykunde@example.org','799'),
('149','Freida','Shanahan','hanna.marks@example.org','838359'),
('151','Georgette','Greenholt','domenick13@example.com','4847238752'),
('152','Aurore','Erdman','santina.armstrong@example.com','154'),
('153','Dahlia','Hettinger','dariana61@example.com','253248'),
('156','Bobby','Metz','ecummerata@example.org','537'),
('157','Queen','Metz','celestine70@example.org','3992428235'),
('158','Mckenzie','Zemlak','arturo69@example.com','105611'),
('159','Imani','O\'Keefe','cruickshank.katlynn@example.com','360'),
('160','Caleigh','Mosciski','ucummerata@example.org','755394'),
('161','Aleen','Hodkiewicz','heber.gottlieb@example.net','2285074949'),
('162','Roger','Veum','elinor98@example.net','9546082298'),
('166','Kaylah','Halvorson','eliseo02@example.net','460'),
('167','Tony','Mosciski','hayes.joelle@example.org','56'),
('169','Clyde','Wehner','celestino69@example.net','4'),
('170','Demarcus','Herzog','ocorkery@example.org','750218'),
('172','Shayne','Hudson','kellie.berge@example.net','68'),
('173','Lavon','Kuhic','fhilpert@example.net','843'),
('176','Omari','VonRueden','davion.larkin@example.com','386294'),
('177','Kamron','Heller','jayda37@example.net','693808'),
('178','Elna','Murray','colton.langosh@example.org','8546820590'),
('179','Julie','Koelpin','hrippin@example.com','6525894078'),
('181','Karianne','Crona','donny18@example.net','631'),
('183','Demond','Turcotte','kailyn.hermiston@example.org','796'),
('184','Floyd','Collier','prohan@example.org','952'),
('185','Ahmed','Keeling','antonio.rodriguez@example.net','71364'),
('186','Daisha','Lockman','king.catalina@example.net','401'),
('187','Annamae','O\'Connell','allan67@example.org','896'),
('189','Herta','Luettgen','christop74@example.com','855964'),
('190','Adriel','Cummerata','westley36@example.org','665'),
('191','Donnell','Jones','fadel.shane@example.net','591'),
('193','Emanuel','Gorczany','janderson@example.com','600328'),
('196','Cordelia','Zemlak','iswift@example.com','932180'),
('197','Myrtis','McCullough','hmcclure@example.net','3070533436'),
('198','Marisol','Daniel','cleveland.wiegand@example.com','828'),
('199','Stewart','Eichmann','noemi.roob@example.org','617473'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

