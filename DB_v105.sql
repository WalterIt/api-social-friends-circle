/*
Navicat MySQL Data Transfer

Source Server         : TWEBDEVANGPHP
Source Server Version : 50723
Source Host           : 192.168.99.100:3306
Source Database       : default

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-27 14:51:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `friend_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friends_friend_id_index` (`friend_id`),
  KEY `friends_user_id_index` (`user_id`),
  CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('5', '1', '5');
INSERT INTO `friends` VALUES ('6', '5', '1');
INSERT INTO `friends` VALUES ('9', '4', '5');
INSERT INTO `friends` VALUES ('10', '5', '4');
INSERT INTO `friends` VALUES ('11', '6', '5');
INSERT INTO `friends` VALUES ('12', '5', '6');
INSERT INTO `friends` VALUES ('13', '6', '3');
INSERT INTO `friends` VALUES ('14', '3', '6');
INSERT INTO `friends` VALUES ('15', '8', '3');
INSERT INTO `friends` VALUES ('16', '3', '8');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('4', '2018_10_26_192119_create_posts_table', '2');
INSERT INTO `migrations` VALUES ('5', '2014_10_12_000000_create_users_table', '3');
INSERT INTO `migrations` VALUES ('6', '2014_10_12_100000_create_password_resets_table', '3');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'Hello Girls!', '3', '100', '2018-10-27 18:42:00', '2018-10-27 18:42:00');
INSERT INTO `posts` VALUES ('2', 'Hello Girls!', '3', '200', '2018-10-27 18:42:38', '2018-10-27 18:42:38');
INSERT INTO `posts` VALUES ('3', 'Tonight, I am giving a party! Are you coming?', '3', '200', '2018-10-27 18:43:17', '2018-10-27 18:43:17');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Valto', 'Silva', 'wshiruba@gmail.com', '$2y$10$Lp1p3rJga/frNF9L0NgbpO.mkJIoBYcOBBf15CoxzzIt5Ony4b132', null, '2018-10-25 16:15:35', '2018-10-25 16:15:35');
INSERT INTO `users` VALUES ('2', 'Juciel', 'Leão', 'ju@leao.com', '$2y$10$XgRa.I4MpGrI4ZNSyySt8.YwH7qlZjG4iYHKR2Q/mzjllP5Ao7Gqi', null, '2018-10-25 22:49:47', '2018-10-25 22:49:47');
INSERT INTO `users` VALUES ('3', 'Maria', 'Betânia', 'maria@betania.com', '$2y$10$6gZ9QXqTq9ifHhQz9BTFyeOGUTzpttAbFAkp.L6AFBAulwkyvUC7q', null, '2018-10-26 00:12:04', '2018-10-26 00:12:04');
INSERT INTO `users` VALUES ('4', 'Maria', 'Silva', 'maria@silva.com', '$2y$10$zf2GCdKTONSCrhKWbIEZ5u.DVsqYj9sLgwlGpzZg1El6YvsP6eXa6', null, '2018-10-26 00:21:19', '2018-10-26 00:21:19');
INSERT INTO `users` VALUES ('5', 'Paula', 'Fernandes', 'paula@fernandes.com', '$2y$10$D0ygMBYn/Djyy0UVvahwzOq6FFeoE2EAaRS08u/Pf.wZVZbNWiDJW', null, '2018-10-27 17:46:00', '2018-10-27 17:46:00');
INSERT INTO `users` VALUES ('6', 'Marcos', 'Antônio', 'marcos@antonio.com', '$2y$10$zsZNFPx5zYy6lD0Sjw.7f.c/s8Ii7Aj5zhh2v7/5hSW5x.3cnqfCK', null, '2018-10-27 18:07:47', '2018-10-27 18:07:47');
INSERT INTO `users` VALUES ('7', 'Paulo', 'Antônio', 'paulo@antonio.com', '$2y$10$rNWcHPWgoQkWDAkCerA5OeTAoGWU/LFyj/2ek.Q.2mQcfEPvnKg9q', null, '2018-10-27 18:08:29', '2018-10-27 18:08:29');
INSERT INTO `users` VALUES ('8', 'Cátia', 'Abreu', 'catia@abreu.com', '$2y$10$msNs5YU1ozNDpU17q.EiUu4z5mPNx4z1oi8E8k1kZuEcvOt3I5/Nu', null, '2018-10-27 18:33:59', '2018-10-27 18:33:59');
