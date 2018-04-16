SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL,
  `role_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pri_role_id` (`role_id`),
  CONSTRAINT `pri_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `create_user_id` int(50) DEFAULT NULL,
  `create_date` date NOT NULL,
  `modify_user_id` int(50) DEFAULT NULL,
  `modify_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1001', 'adminaster', '管理员', null, '2018-04-12', null, '2018-04-12');

-- ----------------------------
-- Table structure for `t_sys_btn`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_btn`;
CREATE TABLE `t_sys_btn` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `btn_name` varchar(100) DEFAULT NULL,
  `btn_class` varchar(50) DEFAULT NULL,
  `menu_id` int(50) DEFAULT NULL,
  `role_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `btn_role_id` (`role_id`),
  CONSTRAINT `btn_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_btn
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `applicationid` int(50) DEFAULT NULL,
  `menu_order` int(50) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `isvisible` varchar(10) DEFAULT NULL,
  `role_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_role_id` (`role_id`),
  CONSTRAINT `menu_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_unite`
-- ----------------------------
DROP TABLE IF EXISTS `t_unite`;
CREATE TABLE `t_unite` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unite_desc` varchar(255) DEFAULT NULL,
  `rank` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_unite
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(150) DEFAULT NULL,
  `login_paswrd` varchar(255) DEFAULT NULL,
  `deptNo` varchar(20) DEFAULT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `e_meail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10087 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('10086', 'join', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `role_id` int(50) DEFAULT NULL,
  `create_user_id` int(50) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `modify_user_id` int(50) DEFAULT NULL,
  `mosify_date` date DEFAULT NULL,
  `availible` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `to_user_id` (`user_id`),
  KEY `from_role_id` (`role_id`),
  CONSTRAINT `from_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `to_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10097 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('10096', '10086', '1001', null, null, null, null, '0');

-- ----------------------------
-- Table structure for `t_word`
-- ----------------------------
DROP TABLE IF EXISTS `t_word`;
CREATE TABLE `t_word` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `eng_main` varchar(255) DEFAULT NULL,
  `chi_main` varchar(255) DEFAULT NULL,
  `unite_id` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_unit_id` (`unite_id`),
  CONSTRAINT `from_unit_id` FOREIGN KEY (`unite_id`) REFERENCES `t_unite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_word
-- ----------------------------
