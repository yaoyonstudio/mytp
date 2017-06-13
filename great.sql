/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : great

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-13 21:37:39
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
INSERT INTO `admin` VALUES ('1', 'admin', 'admin@qq.com', '123456', 'jdslfsdfsdfsdfw8sdfsd87fsd85f8sd', '1', null, null, null, null, null, '13925542760', 'http://www.test.com/img/1.jpg', 'kenny');

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
  `news_isopen` tinyint(1) unsigned NOT NULL COMMENT '是否开启',
  `img_id` int(20) DEFAULT NULL COMMENT '缩略图',
  `news_source` varchar(50) DEFAULT NULL COMMENT '来源',
  `news_source_link` varchar(255) DEFAULT NULL COMMENT '来源网址',
  `news_file_url` varchar(255) DEFAULT NULL COMMENT '附件地址',
  `news_hits` int(11) unsigned DEFAULT NULL COMMENT '点击量',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `news_good_count` int(11) unsigned zerofill DEFAULT NULL COMMENT '好评数',
  `news_bad_count` int(11) unsigned zerofill DEFAULT NULL COMMENT '差评数',
  `news_isrecommend` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('46', '37', '1', '测试文章d', '这是一条测试文章d', '体育,NBA,a,c', '<p>这是一条测试文章这是一条测试文章这是一条测试文章这是一条测试文章这是一条测试文章dd</p>', '0', '70', '腾讯网d', 'http://www.qqd.com', null, null, '1497360885', '1497360885', null, null, '0');
INSERT INTO `news` VALUES ('47', '32', '1', '测试文章1', '这是一条测试文章', '体育,NBA', '<p>这是一条测试文章这是一条测试文章这是一条测试文章这是一条测试文章这是一条测试文章</p>', '1', null, '腾讯网', 'http://www.qq.com', null, null, '1497254041', '1497254041', null, null, '0');
INSERT INTO `news` VALUES ('48', '29', '1', '财经新闻测试', '测试财经新闻描述', '财经新闻,服务', '<p>测试财经新闻内容</p><p>测试财经新闻内容</p><p><img src=\"/ueditor/php/upload/image/20170613/1497331650443313.jpg\" title=\"1497331650443313.jpg\" alt=\"img.jpg\" width=\"1\" height=\"1\"/><img src=\"/ueditor/php/upload/image/20170613/1497331672110075.jpg\" title=\"1497331672110075.jpg\" alt=\"img.jpg\" width=\"753\" height=\"548\"/></p><p>测试财经新闻内容</p>', '1', null, '中金在线', 'http://www.test.com', null, null, '1497331928', '1497331928', null, null, '0');
INSERT INTO `news` VALUES ('49', '29', '1', '财经新闻测试', '测试财经新闻描述', '财经新闻,服务', '<p>测试财经新闻内容</p><p>测试财经新闻内容</p><p><img src=\"/ueditor/php/upload/image/20170613/1497331650443313.jpg\" title=\"1497331650443313.jpg\" alt=\"img.jpg\" width=\"1\" height=\"1\"/><img src=\"/ueditor/php/upload/image/20170613/1497331672110075.jpg\" title=\"1497331672110075.jpg\" alt=\"img.jpg\" width=\"753\" height=\"548\"/></p><p>测试财经新闻内容</p>', '1', null, '中金在线', 'http://www.test.com', null, null, '1497332760', '1497332760', null, null, '1');
INSERT INTO `news` VALUES ('50', '29', '1', '财经新闻测试', '测试财经新闻描述', '财经新闻,服务', '<p>测试财经新闻内容</p><p>测试财经新闻内容</p><p><img src=\"/ueditor/php/upload/image/20170613/1497331650443313.jpg\" title=\"1497331650443313.jpg\" alt=\"img.jpg\" width=\"1\" height=\"1\"/><img src=\"/ueditor/php/upload/image/20170613/1497331672110075.jpg\" title=\"1497331672110075.jpg\" alt=\"img.jpg\" width=\"753\" height=\"548\"/></p><p>测试财经新闻内容</p>', '1', null, '中金在线', 'http://www.test.com', null, null, '1497333093', '1497333093', null, null, '0');
INSERT INTO `news` VALUES ('51', '29', '1', '财经新闻测试', '测试财经新闻描述', '财经新闻,服务', '<p>测试财经新闻内容</p><p>测试财经新闻内容</p><p><img src=\"/ueditor/php/upload/image/20170613/1497331650443313.jpg\" title=\"1497331650443313.jpg\" alt=\"img.jpg\" width=\"1\" height=\"1\"/><img src=\"/ueditor/php/upload/image/20170613/1497331672110075.jpg\" title=\"1497331672110075.jpg\" alt=\"img.jpg\" width=\"753\" height=\"548\"/></p><p>测试财经新闻内容</p>', '1', null, '中金在线', 'http://www.test.com', null, null, '1497333103', '1497333103', null, null, '1');
INSERT INTO `news` VALUES ('52', '29', '1', '财经新闻测试', '测试财经新闻描述', '财经新闻,服务', '<p>测试财经新闻内容</p><p>测试财经新闻内容</p><p><img src=\"/ueditor/php/upload/image/20170613/1497331650443313.jpg\" title=\"1497331650443313.jpg\" alt=\"img.jpg\" width=\"1\" height=\"1\"/><img src=\"/ueditor/php/upload/image/20170613/1497331672110075.jpg\" title=\"1497331672110075.jpg\" alt=\"img.jpg\" width=\"753\" height=\"548\"/></p><p>测试财经新闻内容</p>', '1', null, '中金在线', 'http://www.test.com', null, null, '1497333116', '1497333116', null, null, '0');
INSERT INTO `news` VALUES ('56', '34', '1', '测试资讯', '测试资讯描述', '关键词1,关键词2', '<p>测试资讯内容1111</p><p><img src=\"/ueditor/php/upload/image/20170613/1497333769113345.jpg\" title=\"1497333769113345.jpg\" alt=\"domo-wallpaper-1920x1080-wallpaper-1.jpg\" width=\"343\" height=\"219\"/></p><p style=\"white-space: normal;\">测试资讯内容2222</p><p><br/></p>', '1', null, '来源', 'http://localhost/img/test.jpg', null, null, '1497333813', '1497333813', null, null, '0');
INSERT INTO `news` VALUES ('57', '34', '1', '测试资讯', '测试资讯描述', '关键词1,关键词2', '<p>测试资讯内容1111</p><p><img src=\"/ueditor/php/upload/image/20170613/1497333769113345.jpg\" title=\"1497333769113345.jpg\" alt=\"domo-wallpaper-1920x1080-wallpaper-1.jpg\" width=\"343\" height=\"219\"/></p><p style=\"white-space: normal;\">测试资讯内容2222</p><p><br/></p>', '1', null, '来源', 'http://localhost/img/test.jpg', null, null, '1497333842', '1497333842', null, null, '0');
INSERT INTO `news` VALUES ('58', '33', '1', '哈哈哈', '在干嘛在干嘛中在干嘛', 'haha,hihi,hehe', '<p>夺在夺&nbsp;</p><p>dsfsdfsdsdfsd</p><p>hngf4324</p><p>fds</p>', '1', null, '哈哈', 'kdflsd', null, null, '1497334014', '1497334014', null, null, '0');
INSERT INTO `news` VALUES ('59', '33', '1', '哈哈哈', '在干嘛在干嘛中在干嘛', 'haha,hihi,hehe', '<p>夺在夺&nbsp;</p><p>dsfsdfsdsdfsd</p><p>hngf4324</p><p>fds</p>', '1', null, '哈哈', 'kdflsd', null, null, '1497334028', '1497334028', null, null, '0');
INSERT INTO `news` VALUES ('60', '38', '1', '试一下发布文章333', '娱乐文章描述，测试一下2222', '娱乐,明星,搞笑,11,22', '<p>娱乐文章内容2222</p><p><img src=\"/ueditor/php/upload/image/20170613/1497351158368567.jpg\" title=\"1497351158368567.jpg\" alt=\"headpic.jpg\"/></p><p>娱乐文章内容3333</p><p><img src=\"/ueditor/php/upload/image/20170613/1497351163545083.jpg\" title=\"1497351163545083.jpg\" alt=\"dingdong.jpg\" width=\"197\" height=\"200\"/></p><p>娱乐文章内容444</p>', '1', '69', '凤凰网2222', 'http://www.fenghuang222.com', null, null, '1497360670', '1497360670', null, null, '1');

-- ----------------------------
-- Table structure for `news_cate`
-- ----------------------------
DROP TABLE IF EXISTS `news_cate`;
CREATE TABLE `news_cate` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻类别ID',
  `cat_name` varchar(20) NOT NULL,
  `parent_id` smallint(6) unsigned zerofill NOT NULL COMMENT '父级ID',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_cate
-- ----------------------------
INSERT INTO `news_cate` VALUES ('29', '财经', '000000', '01496986765', '01496986765');
INSERT INTO `news_cate` VALUES ('30', '社会', '000000', '01496986802', '01496986802');
INSERT INTO `news_cate` VALUES ('31', '军事', '000000', '01496989253', '01496989253');
INSERT INTO `news_cate` VALUES ('32', '体育', '000000', '01496989283', '01496989283');
INSERT INTO `news_cate` VALUES ('33', '娱乐', '000000', '01496989290', '01496989290');
INSERT INTO `news_cate` VALUES ('34', '证券', '000000', '01496989303', '01496989303');
INSERT INTO `news_cate` VALUES ('35', '视频', '000000', '01496989310', '01496989310');
INSERT INTO `news_cate` VALUES ('36', '汽车', '000000', '01496989322', '01496989322');
INSERT INTO `news_cate` VALUES ('37', '房产', '000000', '01496989331', '01496989331');
INSERT INTO `news_cate` VALUES ('38', '教育', '000000', '01496989338', '01496989338');
INSERT INTO `news_cate` VALUES ('39', '文化', '000000', '01496989345', '01496989345');
INSERT INTO `news_cate` VALUES ('40', '公益', '000000', '01496989357', '01496989357');
INSERT INTO `news_cate` VALUES ('41', '科技', '000000', '01496989363', '01496989363');
INSERT INTO `news_cate` VALUES ('42', '游戏', '000000', '01496989370', '01496989370');
INSERT INTO `news_cate` VALUES ('43', '社会', '000031', '01497000568', '01497000568');
INSERT INTO `news_cate` VALUES ('45', '测试222', '000035', '01497232290', '01497232290');
INSERT INTO `news_cate` VALUES ('46', 'test', '000033', '01497247394', '01497247394');
INSERT INTO `news_cate` VALUES ('47', 'test222', '000000', '01497247407', '01497247407');

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
  `img_originUrl` varchar(255) DEFAULT NULL COMMENT '新闻图片原地址',
  `img_thumbWidth` smallint(5) DEFAULT NULL COMMENT '图片缩略图宽度',
  `img_thumbHeight` smallint(5) DEFAULT NULL COMMENT '图片缩略图高度',
  `img_commonWidth` smallint(5) DEFAULT NULL COMMENT '图片通用宽度',
  `img_commonHeight` smallint(5) DEFAULT NULL COMMENT '图片通用高度',
  `img_originWidth` smallint(5) DEFAULT NULL COMMENT '图片原宽度',
  `img_originHeight` smallint(5) DEFAULT NULL COMMENT '图片原高度',
  `create_time` int(11) unsigned zerofill DEFAULT NULL,
  `update_time` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_image
-- ----------------------------
INSERT INTO `news_image` VALUES ('65', null, '', '', 'upload/20170613/CR-pvMHXjAzVE.png', null, null, null, null, null, null, null, null);
INSERT INTO `news_image` VALUES ('66', null, '', '', 'upload/20170613/CR-zFKK1J6g54.png', null, null, null, null, null, null, null, null);
INSERT INTO `news_image` VALUES ('67', null, '', '', 'upload/20170613/CR-U4HOg0V8M1.png', null, null, null, null, null, null, null, null);
INSERT INTO `news_image` VALUES ('68', null, '', '', 'upload/20170613/CR-Rp6XPJOo5G.png', null, null, null, null, null, null, '01497360601', '01497360601');
INSERT INTO `news_image` VALUES ('69', null, '', '', 'upload/20170613/CR-uEvDgXNPIg.png', null, null, null, null, null, null, '01497360671', '01497360671');
INSERT INTO `news_image` VALUES ('70', null, '', '', 'upload/20170613/CR-AcK4yKdEin.png', null, null, null, null, null, null, '01497360697', '01497360697');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', '123456', 'kenny', null, 'ken@qq.com', null, '13925542760', '123456789', 'http://www.test.com/img/1.jpg', null, null, null, null, 'kenny', '1', '1.00', null, null, null, null, null, null, null, '0', null, null, null, null, null);
