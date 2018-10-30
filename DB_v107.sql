/*
Navicat MySQL Data Transfer

Source Server         : TWEBDEVANGPHP
Source Server Version : 50723
Source Host           : 192.168.99.100:3306
Source Database       : default

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-30 17:56:28
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `friends` VALUES ('21', '6', '2');
INSERT INTO `friends` VALUES ('22', '2', '6');
INSERT INTO `friends` VALUES ('23', '5', '2');
INSERT INTO `friends` VALUES ('24', '2', '5');
INSERT INTO `friends` VALUES ('25', '1', '2');
INSERT INTO `friends` VALUES ('26', '2', '1');
INSERT INTO `friends` VALUES ('31', '2', '7');
INSERT INTO `friends` VALUES ('32', '7', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'Hello Girls!', '3', '100', '2018-10-27 18:42:00', '2018-10-27 18:42:00');
INSERT INTO `posts` VALUES ('2', 'Hello Girls!', '3', '200', '2018-10-27 18:42:38', '2018-10-27 18:42:38');
INSERT INTO `posts` VALUES ('3', 'Tonight, I am giving a party! Are you coming?', '3', '200', '2018-10-27 18:43:17', '2018-10-27 18:43:17');
INSERT INTO `posts` VALUES ('4', 'Hi, every!! Come to join me!!', '9', '100', '2018-10-29 19:24:05', '2018-10-29 19:24:05');
INSERT INTO `posts` VALUES ('5', 'Maria Soares, tu viens ce soir?', '5', '100', '2018-10-29 21:56:58', '2018-10-29 21:56:58');
INSERT INTO `posts` VALUES ('6', 'Paula, Non je n\'y vais pas. Désolée', '10', '100', '2018-10-29 21:58:14', '2018-10-29 21:58:14');
INSERT INTO `posts` VALUES ('7', 'Hi Everybody!!', '11', '100', '2018-10-30 17:38:25', '2018-10-30 17:38:25');
INSERT INTO `posts` VALUES ('8', 'Are you having a nice day, guys??', '12', '100', '2018-10-30 17:39:07', '2018-10-30 17:39:07');
INSERT INTO `posts` VALUES ('9', 'Yes, we are!', '11', '100', '2018-10-30 17:39:34', '2018-10-30 17:39:34');
INSERT INTO `posts` VALUES ('10', 'Salut, France! Ça va?', '12', '200', '2018-10-30 17:40:58', '2018-10-30 17:40:58');
INSERT INTO `posts` VALUES ('11', 'Ça va bien, merci.', '11', '200', '2018-10-30 17:41:29', '2018-10-30 17:41:29');
INSERT INTO `posts` VALUES ('12', 'Tu m\'écoutes, Patricia?', '11', '200', '2018-10-30 17:42:43', '2018-10-30 17:42:43');
INSERT INTO `posts` VALUES ('13', 'こんにちは！御元気？', '12', '100', '2018-10-30 17:43:49', '2018-10-30 17:43:49');
INSERT INTO `posts` VALUES ('14', 'お蔭様で元気です。', '11', '100', '2018-10-30 17:44:54', '2018-10-30 17:44:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `users` VALUES ('9', 'Fernand', 'Charron', 'fernand@charron.com', '$2y$10$H.exn.vNvDh99cxmVq14WenPpREyc3w0Cmtggl0U8gFL0mmNqGCy6', null, '2018-10-29 18:18:58', '2018-10-29 18:18:58');
INSERT INTO `users` VALUES ('10', 'Maria', 'Soares', 'maria@soares.com', '$2y$10$2JAWKrZPBemFJQCjWiWvh.Q7xi/6uaW2Pr0jsmcWjiLrGadum3lDi', null, '2018-10-29 21:55:25', '2018-10-29 21:55:25');
INSERT INTO `users` VALUES ('11', 'France', 'D\'Amour', 'france@damour.com', '$2y$10$qpGx9nCZ.n52l0ydHVKudu7UeQjKS2cqWk6WIL6wPUoG3NvgymAFS', null, '2018-10-30 17:30:55', '2018-10-30 17:30:55');
INSERT INTO `users` VALUES ('12', 'Patricia', 'Santos', 'patricia@santos.com', '$2y$10$8R4OJbBDeRwxw.RdbhxjJ.4YktiHmxZ7ISjae4ZGOHdUmGsAGn5yy', null, '2018-10-30 17:36:41', '2018-10-30 17:36:41');
