/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : zhihu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-20 23:22:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_11_15_215137_create_questions_table', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '编辑新闻分类', '<p>23123<br/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-15 23:00:02', '2017-11-15 23:00:02');
INSERT INTO `questions` VALUES ('2', 'fsadfsdfs', '<p><img src=\"http://zhihu.dev/storage/uploads/image/2017/11/19/6dfae83f56b74dc0842b42a9c6e67a56.jpg\" title=\"/uploads/image/2017/11/19/6dfae83f56b74dc0842b42a9c6e67a56.jpg\" alt=\"11.jpg\"/></p><p>sdfsfsdf</p>', '2', '0', '1', '0', 'F', 'F', '2017-11-19 23:28:18', '2017-11-19 23:28:18');
INSERT INTO `questions` VALUES ('3', '风景图片风景图片风景图片', '<p>434234<img src=\"http://zhihu.dev/storage/uploads/image/2017/11/20/d7a5697821e8f6b4157c06145ec0f495.jpg\" title=\"/uploads/image/2017/11/20/d7a5697821e8f6b4157c06145ec0f495.jpg\" alt=\"u=1035436093,3470577695&amp;fm=27&amp;gp=0.jpg\"/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-20 00:03:41', '2017-11-20 00:03:41');
INSERT INTO `questions` VALUES ('4', '例化编辑器的时候配置', '<p><img src=\"http://zhihu.dev/storage/uploads/image/2017/11/20/695a264847385eede950db47bcd5bdd4.jpg\" title=\"/uploads/image/2017/11/20/695a264847385eede950db47bcd5bdd4.jpg\" alt=\"下载.jpg\"/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-20 00:04:47', '2017-11-20 00:04:47');
INSERT INTO `questions` VALUES ('5', '国家税务总局机关党委关于学习宣传贯彻党的十八届五中全', '<p style=\"text-align: center;\"><img src=\"http://zhihu.dev/storage/uploads/image/2017/11/20/c331e9e654ec9c96c4fbb33e756bf593.jpg\" title=\"/uploads/image/2017/11/20/c331e9e654ec9c96c4fbb33e756bf593.jpg\" alt=\"timg.jpg\"/></p>', '2', '0', '1', '0', 'F', 'F', '2017-11-20 00:07:28', '2017-11-20 00:07:28');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'djs', '1819661095@qq.com', '$2y$10$YRWOR0dCYyaJHaEUl9x/z.EAJSScbLEF/FLTTL4NIBm9ctEps542.', '/public/images/avatars/default.jpg', '0', '0', '0', '0', '0', '0', '0', null, '1', 'PG42AXYJWwKcApXvdiKC4z0ILiOV8PHIOoISGITk', 'vFlCfdWpNtJ0pfktE3f0uL0vn9tCm4eGRjLNJAtzqyjIG7Bf0jxH8UQzlneI', '2017-09-09 11:30:12', '2017-09-10 12:49:31');
