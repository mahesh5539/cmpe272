/*
 Navicat Premium Data Transfer

 Source Server         : bonnie
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost
 Source Database       : citizenspot

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : utf-8

 Date: 11/25/2014 15:03:57 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_name` varchar(40) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('aaa', 'TDVw4/3eqpyQEvvvjXIqWxtghZlQ8QWRmhVHaJqpgVE=#$#lhwu9jedGPFVhvaOdqFzPQwQMrLCOIVb4U9BynHIhbE=', 'null', null, null), ('abc', '2pY6Red8RUtrG40djlN8YrWHQfGKgRvZOLgcyqJb5fg=#$#Gbr9gTSpnB7S1cyHeCPRjQ9DKpIRYsqkyVArzUzfmcg=', 'null', null, null), ('asd', 'Up97NqNMMvhvZgayEV3JphVs3NyrkgPd87XEpG45El8=#$#wIx9sMxnwj97FrEzCrsPcHzJMAKZ8PBX9HPK0tRwZIE=', 'null', null, null), ('asdasd', 'B7QJJDLuvytePr1hItEf5fMJPTTBI7koV3n2UC3yF2g=#$#+dXNAWQmBh7Jlrm1qVL4IGc6/RKIymb78Kw1nw6o7rA=', 'null', null, null), ('bbb', 'bbb', 'bbb', null, null), ('ccc', 'ccc', 'ccc', null, null), ('ddd', 'ddd', 'ddd', null, null), ('eee', 'eee', 'eee', null, null), ('fff', 'fff', 'fffff', null, null), ('ggg', 'gggg', 'gggg', null, null), ('hhh', 'hhh', 'hhhh', null, null), ('jyo', 'pwd', 'Joy', 'banerjee', 'jyo@gmail.com'), ('manami', 'password', 'Manami', 'Bhunia', 'manami@gmail.com');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
