/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : great

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-07 18:56:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(60) NOT NULL COMMENT '管理员名称',
  `admin_email` varchar(60) NOT NULL COMMENT '管理员邮箱',
  `admin_password` varchar(32) NOT NULL COMMENT '管理员密码',
  `admin_token` varchar(32) DEFAULT NULL COMMENT '管理员token',
  `admin_roleid` smallint(5) unsigned NOT NULL COMMENT '管理员角色ID',
  `admin_last_login` int(11) DEFAULT NULL COMMENT '管理员最后登录时间',
  `admin_login_ip` varchar(15) DEFAULT NULL COMMENT '管理员最后登录IP',
  `admin_right` text COMMENT '管理员权限',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  `admin_mobile` varchar(20) DEFAULT NULL,
  `admin_headpic` varchar(255) DEFAULT NULL,
  `admin_nickname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `admin_role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `admin_role_list` text COMMENT '权限列表',
  `admin_role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`admin_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(64) NOT NULL COMMENT '配置项',
  `config_value` varchar(512) NOT NULL COMMENT '配置值',
  `config_group` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `config_desc` varchar(100) DEFAULT NULL COMMENT '配置描述',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻资讯ID',
  `cat_id` int(5) unsigned NOT NULL COMMENT '类别ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `news_title` varchar(150) NOT NULL COMMENT '新闻摘要',
  `news_description` varchar(250) DEFAULT NULL COMMENT '新闻资讯描述',
  `news_keywords` varchar(250) DEFAULT NULL COMMENT '新闻资讯关键词',
  `news_content` longtext NOT NULL COMMENT '新闻资讯内容',
  `news_type` tinyint(1) unsigned NOT NULL,
  `news_isopen` tinyint(1) unsigned NOT NULL COMMENT '是否开启',
  `img_id` varchar(10) DEFAULT NULL COMMENT '缩略图',
  `news_source` varchar(50) DEFAULT NULL COMMENT '来源',
  `news_source_link` varchar(255) DEFAULT NULL COMMENT '来源网址',
  `news_file_url` varchar(255) DEFAULT NULL COMMENT '附件地址',
  `news_hits` int(11) unsigned DEFAULT NULL COMMENT '点击量',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `news_good_count` int(11) unsigned zerofill DEFAULT NULL COMMENT '好评数',
  `news_bad_count` int(11) unsigned zerofill DEFAULT NULL COMMENT '差评数',
  `news_isrecommend` tinyint(1) unsigned zerofill NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `editor_id` (`user_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `news_category` (`cat_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_category`
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻类别ID',
  `cat_name` varchar(20) NOT NULL,
  `parent_id` smallint(6) unsigned zerofill NOT NULL COMMENT '父级ID',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_category
-- ----------------------------

-- ----------------------------
-- Table structure for `news_comment`
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻评论ID',
  `news_id` bigint(20) NOT NULL COMMENT '新闻ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `comment_is_show` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否显示',
  `comment_good_count` int(10) unsigned zerofill DEFAULT NULL,
  `comment_bad_count` int(10) unsigned zerofill DEFAULT NULL,
  `create_time` int(11) unsigned zerofill DEFAULT NULL COMMENT '评论时间',
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `news_image`
-- ----------------------------
DROP TABLE IF EXISTS `news_image`;
CREATE TABLE `news_image` (
  `img_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻图片ID',
  `img_title` varchar(100) DEFAULT NULL COMMENT '新闻图片标题',
  `img_thumbUrl` varchar(255) NOT NULL COMMENT '新闻图片缩略图地址',
  `img_commonUrl` varchar(255) NOT NULL COMMENT '新闻图片地址',
  `img_originUrl` varchar(255) NOT NULL COMMENT '新闻图片原地址',
  `img_thumbWidth` smallint(5) DEFAULT NULL COMMENT '图片缩略图宽度',
  `img_thumbHeight` smallint(5) DEFAULT NULL COMMENT '图片缩略图高度',
  `img_commonWidth` smallint(5) DEFAULT NULL COMMENT '图片通用宽度',
  `img_commonHeight` smallint(5) DEFAULT NULL COMMENT '图片通用高度',
  `img_originWidth` smallint(5) DEFAULT NULL COMMENT '图片原宽度',
  `img_originHeight` smallint(5) DEFAULT NULL COMMENT '图片原高度',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_image
-- ----------------------------

-- ----------------------------
-- Table structure for `slide`
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `slide_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_title` varchar(50) DEFAULT NULL,
  `slide_link` varchar(255) DEFAULT NULL,
  `slide_src` varchar(255) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slide
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_password` varchar(32) NOT NULL COMMENT '密码',
  `user_name` varchar(20) NOT NULL COMMENT '帐户名',
  `user_sex` tinyint(1) unsigned DEFAULT NULL COMMENT '性别',
  `user_email` varchar(60) DEFAULT NULL,
  `user_birthday` int(11) unsigned zerofill DEFAULT NULL COMMENT '生日',
  `user_mobile` varchar(20) NOT NULL COMMENT '手机',
  `user_qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `user_headpic` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_province` int(6) DEFAULT NULL COMMENT '省',
  `user_city` int(6) DEFAULT NULL COMMENT '城市',
  `user_district` int(6) DEFAULT NULL COMMENT '市区',
  `user_address_id` mediumint(8) unsigned zerofill DEFAULT NULL COMMENT '默认收货地址',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `user_level` tinyint(1) DEFAULT NULL COMMENT '会员级别',
  `user_discount` decimal(10,2) DEFAULT '1.00' COMMENT '用户折扣',
  `user_token` varchar(64) DEFAULT NULL COMMENT 'token',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL COMMENT '注册时间',
  `user_last_login` int(11) unsigned zerofill DEFAULT NULL COMMENT '最后登录时间',
  `user_last_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `user_oauth` varchar(10) DEFAULT NULL COMMENT '第三方授权来源：wx/weibo/alipay',
  `user_openid` varchar(100) DEFAULT NULL COMMENT '第三方标示',
  `user_islock` tinyint(1) unsigned NOT NULL COMMENT '是否被锁定冻结',
  `user_email_validated` tinyint(1) unsigned DEFAULT NULL COMMENT '是否验证邮箱',
  `user_money` decimal(10,2) unsigned zerofill DEFAULT NULL COMMENT '用户金额',
  `user_pay_points` int(10) unsigned DEFAULT NULL COMMENT '消费积分',
  `user_frozen_money` decimal(10,2) DEFAULT NULL COMMENT '冻结金额',
  `user_validcode` tinyint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
