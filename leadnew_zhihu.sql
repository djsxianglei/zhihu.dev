/*
Navicat MySQL Data Transfer

Source Server         : Homestead
Source Server Version : 50719
Source Host           : 127.0.0.1:33060
Source Database       : leadnew_zhihu

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 22:51:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_user_id_index` (`user_id`),
  KEY `answers_question_id_index` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('1', '2', '5', '<p>342343423523452</p>', '0', '0', 'F', 'F', '2017-12-11 22:36:13', '2018-01-04 22:50:55');
INSERT INTO `answers` VALUES ('2', '2', '5', '<p>就是雷锋精神多了附件是浪费大家<br/></p>', '1', '0', 'F', 'F', '2017-12-11 22:45:51', '2018-01-04 22:50:51');

-- ----------------------------
-- Table structure for followers
-- ----------------------------
DROP TABLE IF EXISTS `followers`;
CREATE TABLE `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` int(10) unsigned NOT NULL,
  `followed_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_follower_id_index` (`follower_id`),
  KEY `followers_followed_id_index` (`followed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of followers
-- ----------------------------
INSERT INTO `followers` VALUES ('16', '2', '3', '2018-01-03 23:23:02', '2018-01-03 23:23:02');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_11_15_215137_create_questions_table', '2');
INSERT INTO `migrations` VALUES ('4', '2017_12_05_210208_create_topics_table', '3');
INSERT INTO `migrations` VALUES ('5', '2017_12_05_211142_cerate_question_topic_table', '3');
INSERT INTO `migrations` VALUES ('6', '2017_12_11_212750_create_answers_table', '4');
INSERT INTO `migrations` VALUES ('7', '2017_12_12_220239_create_user_question_table', '5');
INSERT INTO `migrations` VALUES ('9', '2017_12_22_225854_create_followers_table', '6');
INSERT INTO `migrations` VALUES ('10', '2018_01_02_232538_create_notifications_table', '7');
INSERT INTO `migrations` VALUES ('11', '2018_01_04_221707_create_votes_table', '8');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('03adb0a9-d4e7-4af2-80fd-73dc291685e7', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 22:59:59', '2018-01-03 22:59:59');
INSERT INTO `notifications` VALUES ('1117d934-0f9b-46ba-b7db-3c281534b52b', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 22:58:32', '2018-01-03 22:58:32');
INSERT INTO `notifications` VALUES ('37536b1c-8931-4cbb-aec2-bf722b582370', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 22:57:28', '2018-01-03 22:57:28');
INSERT INTO `notifications` VALUES ('82d06f65-7d0e-41e7-82c6-891aa71f084a', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 23:06:19', '2018-01-03 23:06:19');
INSERT INTO `notifications` VALUES ('8c95dceb-d176-4337-b4f1-c46562329099', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 23:23:02', '2018-01-03 23:23:02');
INSERT INTO `notifications` VALUES ('b5b7c156-a6ab-4058-a1aa-2494cd098bc1', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 23:08:31', '2018-01-03 23:08:31');
INSERT INTO `notifications` VALUES ('d4fd935d-a171-4e5e-ab0f-05d6fcbcf838', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 23:02:46', '2018-01-03 23:02:46');
INSERT INTO `notifications` VALUES ('d9652837-039b-4b08-bb4e-5d87bde0893e', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-03 23:01:24', '2018-01-03 23:01:24');
INSERT INTO `notifications` VALUES ('d97994ff-c74f-4417-98d6-1d64675b3bc2', 'App\\Notifications\\NewUserFollowNotification', '3', 'App\\Models\\User', '{\"name\":\"djs\"}', null, '2018-01-02 23:35:19', '2018-01-02 23:35:19');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('1819661095@qq.com', '$2y$10$XjgH6A03yZgOnTZiYq07vuWoUTKpPq2GqhPNR7tUD/KOFrMkinRFO', '2017-11-15 21:43:06');

-- ----------------------------
-- Table structure for question_topic
-- ----------------------------
DROP TABLE IF EXISTS `question_topic`;
CREATE TABLE `question_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_topic_question_id_index` (`question_id`),
  KEY `question_topic_topic_id_index` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of question_topic
-- ----------------------------
INSERT INTO `question_topic` VALUES ('1', '6', '2', '2017-12-08 23:35:43', '2017-12-08 23:35:43');
INSERT INTO `question_topic` VALUES ('2', '6', '15', '2017-12-08 23:35:43', '2017-12-08 23:35:43');
INSERT INTO `question_topic` VALUES ('4', '7', '3', '2017-12-09 00:23:35', '2017-12-09 00:23:35');
INSERT INTO `question_topic` VALUES ('5', '5', '2', '2017-12-11 22:13:01', '2017-12-11 22:13:01');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '1',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '编辑新闻分类', '<p>23123<br/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-15 23:00:02', '2017-11-15 23:00:02');
INSERT INTO `questions` VALUES ('2', 'fsadfsdfs', '<p><img src=\"http://zhihu.dev/storage/uploads/image/2017/11/19/6dfae83f56b74dc0842b42a9c6e67a56.jpg\" title=\"/uploads/image/2017/11/19/6dfae83f56b74dc0842b42a9c6e67a56.jpg\" alt=\"11.jpg\"/></p><p>sdfsfsdf</p>', '2', '0', '1', '0', 'F', 'F', '2017-11-19 23:28:18', '2017-11-19 23:28:18');
INSERT INTO `questions` VALUES ('3', '风景图片风景图片风景图片', '<p>434234<img src=\"http://zhihu.dev/storage/uploads/image/2017/11/20/d7a5697821e8f6b4157c06145ec0f495.jpg\" title=\"/uploads/image/2017/11/20/d7a5697821e8f6b4157c06145ec0f495.jpg\" alt=\"u=1035436093,3470577695&amp;fm=27&amp;gp=0.jpg\"/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-20 00:03:41', '2017-11-20 00:03:41');
INSERT INTO `questions` VALUES ('5', '国家税务总局机关党委关于学习宣传贯彻党的十八届五中全', '<p style=\"text-align: center;\"><img src=\"http://zhihu.dev/storage/uploads/image/2017/11/20/c331e9e654ec9c96c4fbb33e756bf593.jpg\" title=\"/uploads/image/2017/11/20/c331e9e654ec9c96c4fbb33e756bf593.jpg\" alt=\"timg.jpg\"/></p>', '3', '2', '2', '0', 'F', 'F', '2017-11-20 00:07:28', '2017-12-22 22:43:42');
INSERT INTO `questions` VALUES ('7', '地方撒发生发射点发', '<p>dfasdfasdfsadfsdfasfdsfadfasfsadfafasdfa123123</p>', '2', '0', '1', '0', 'F', 'T', '2017-12-09 00:01:10', '2017-12-09 00:23:35');

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `questions_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', 'vue', 'Est incidunt voluptatem illum dolor. Dolores perferendis ad architecto repellendus consequatur. Sunt expedita blanditiis quia laborum. Ducimus iusto deserunt delectus omnis possimus dolores. Architecto quos impedit dolorem et numquam.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('2', 'laravel', 'Praesentium nam vitae eum aut praesentium cupiditate dolor. Rerum adipisci atque excepturi ut eum porro. Illo ut sint nam earum tempore iure. Et ipsa est optio quibusdam veniam veniam. Illum qui commodi optio delectus.', '6', '1', '2017-12-07 23:15:47', '2017-12-11 22:13:01');
INSERT INTO `topics` VALUES ('3', 'laravel 学院', 'Laboriosam sint consequatur est. Voluptatem sit iure quibusdam aliquam. Exercitationem dolorum natus qui saepe. Nihil aperiam veritatis eos enim accusantium laborum ea veritatis.', '3', '1', '2017-12-07 23:15:47', '2017-12-09 00:28:36');
INSERT INTO `topics` VALUES ('4', 'consequatur', 'Accusamus inventore repellendus pariatur accusamus harum tenetur libero. Veniam reiciendis et aut voluptatem nulla mollitia. Culpa est voluptas modi exercitationem tempore quas sapiente. Cupiditate et quia dolore cupiditate. Eius amet dolores eligendi repellendus officiis inventore.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('5', 'quo', 'Voluptatem non ea aut laboriosam maxime eius omnis. Est explicabo et necessitatibus aut. Voluptatum eveniet enim ab similique ex pariatur. Ut error dignissimos a dolor.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('6', 'est', 'Dolor qui autem maxime deserunt fugiat repudiandae et. Exercitationem ipsa debitis velit fugit. Rerum eum incidunt ullam minima. Vitae pariatur atque culpa.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('7', 'ut', 'Quaerat ea vero accusamus voluptatibus numquam rem. Consequatur enim et dolore itaque illo atque. Dolorum laudantium similique totam voluptatum reprehenderit.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('8', 'assumenda', 'Doloribus nobis nostrum saepe assumenda nostrum. Accusantium dolorem nulla quia eum nisi eius aperiam velit. Iste voluptates velit ea itaque deleniti inventore officia. Quae expedita qui sint omnis fuga et voluptas.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('9', 'ducimus', 'Ad odio labore est veritatis quos eaque. Sed expedita labore recusandae corporis eligendi est qui accusamus. Et vel et quas tenetur a.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('10', 'autem', 'Quia neque temporibus in omnis dolor voluptatum. Blanditiis ducimus expedita molestiae illum recusandae ut nemo. Impedit perferendis aliquam optio minima non in suscipit. Dolores amet id quia exercitationem.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('11', 'quia', 'Laborum et voluptatem libero enim possimus. Et amet voluptatibus rem est omnis laboriosam est. Et enim totam sed beatae voluptatem dolor eos magnam. Aliquid nobis dicta ipsum repellendus praesentium.', '1', '1', '2017-12-07 23:15:47', '2017-12-07 23:15:47');
INSERT INTO `topics` VALUES ('14', '路由', null, '1', '0', '2017-12-08 23:28:37', '2017-12-08 23:28:37');
INSERT INTO `topics` VALUES ('15', '控制器', null, '1', '0', '2017-12-08 23:35:43', '2017-12-08 23:35:43');

-- ----------------------------
-- Table structure for user_question
-- ----------------------------
DROP TABLE IF EXISTS `user_question`;
CREATE TABLE `user_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_question_user_id_index` (`user_id`),
  KEY `user_question_question_id_index` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_question
-- ----------------------------
INSERT INTO `user_question` VALUES ('18', '2', '5', '2017-12-22 22:43:42', '2017-12-22 22:43:42');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_count` int(11) NOT NULL DEFAULT '0',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `favorites_count` int(11) NOT NULL DEFAULT '0',
  `likes_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `followings_count` int(11) NOT NULL DEFAULT '0',
  `settings` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `confirmation_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'djs', '1819661095@qq.com', '$2y$10$YRWOR0dCYyaJHaEUl9x/z.EAJSScbLEF/FLTTL4NIBm9ctEps542.', '/images/avatars/default.jpg', '0', '0', '0', '0', '0', '0', '0', null, '1', 'PG42AXYJWwKcApXvdiKC4z0ILiOV8PHIOoISGITk', 'IH0mARWDjt4rZuPaaqtahDP0rp7r1dxHbHkUU7NSHpxOCaBnybUWHuChSMNH', 'M05sXHjjbrDAqgHfel2MD5Z7eCRgKXZAdfrIdCGjVauaQEDj0n7hVIOm4j0y', '2017-09-09 11:30:12', '2017-09-10 12:49:31');
INSERT INTO `users` VALUES ('3', 'shushu', '3235897628@qq.com', '$2y$10$YRWOR0dCYyaJHaEUl9x/z.EAJSScbLEF/FLTTL4NIBm9ctEps542.', '/images/avatars/default.jpg', '0', '0', '0', '0', '0', '1', '0', null, '1', 'PG42AXYJWwKcApXvdiKC4z0ILiO3423HIOoISGITk', 'RXNdpFb4puk8S0apkPzYY2Q8H5ZNS4bVDkKl5WO8P7zh43U445VXBxi3arMr', 'M05sXHjjbrDAqgHfel2MD5Z7eCRgKXZAdfrIdCGjVauaQEDj0n75433IOm4j0y', null, '2018-01-03 23:23:03');

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `answer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_user_id_index` (`user_id`),
  KEY `votes_answer_id_index` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of votes
-- ----------------------------
INSERT INTO `votes` VALUES ('2', '2', '2', '2018-01-04 22:50:51', '2018-01-04 22:50:51');
