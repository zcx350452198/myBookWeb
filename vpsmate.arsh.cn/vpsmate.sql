/*
Navicat MySQL Data Transfer

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2014-10-10 17:27:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ar_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ar_admin`;
CREATE TABLE `ar_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '登录名',
  `pwd` char(32) DEFAULT NULL COMMENT '登录密码',
  `email` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `find_code` char(5) DEFAULT NULL COMMENT '找回账号验证码',
  `time` int(10) DEFAULT NULL COMMENT '开通时间',
  `status` int(11) DEFAULT '1' COMMENT '账号状态',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ar_admin
-- ----------------------------
INSERT INTO `ar_admin` VALUES ('1', 'admin', '75d86253b243c4c39a15547fc8b6531e', 'admin@arsh.com', '', '', '1380585600', '1');

-- ----------------------------
-- Table structure for `ar_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ar_auth_group`;
CREATE TABLE `ar_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_auth_group
-- ----------------------------
INSERT INTO `ar_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户组', '1', '1,2,3,4,5,6,');

-- ----------------------------
-- Table structure for `ar_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ar_auth_group_access`;
CREATE TABLE `ar_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_auth_group_access
-- ----------------------------
INSERT INTO `ar_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `ar_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ar_auth_rule`;
CREATE TABLE `ar_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`module`,`name`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_auth_rule
-- ----------------------------
INSERT INTO `ar_auth_rule` VALUES ('1', 'admin', '1', 'Admin/Index/index', '后台首页', '1', '');
INSERT INTO `ar_auth_rule` VALUES ('2', 'admin', '1', 'Admin/Index/upload', '软件上传', '1', '');
INSERT INTO `ar_auth_rule` VALUES ('3', 'admin', '1', 'Admin/Index/config', '网站配置', '1', '');

-- ----------------------------
-- Table structure for `ar_config`
-- ----------------------------
DROP TABLE IF EXISTS `ar_config`;
CREATE TABLE `ar_config` (
  `name` varchar(20) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户信息表';

-- ----------------------------
-- Records of ar_config
-- ----------------------------
INSERT INTO `ar_config` VALUES ('title', 'Linux 服务器 WEB 管理面板');
INSERT INTO `ar_config` VALUES ('webroot', 'http://vpsmate.arsh.cn');
INSERT INTO `ar_config` VALUES ('demo_url', 'http://xh.arsh.cn');
INSERT INTO `ar_config` VALUES ('name', 'VPSMate');
INSERT INTO `ar_config` VALUES ('description', '		<ul>\r\n			<li><p>快速在线安装、小巧且节省资源</p></li>\r\n			<li><p>当前支持 CentOS/Redhat 5.4+、6.x</p></li>\r\n			<li><p>基于发行版软件源的软件管理机制</p></li>\r\n			<li><p>轻松构建 Linux + Nginx + MySQL + PHP 环境</p></li>\r\n			<li><p>强大的在线文件管理和回收站机制</p></li>\r\n			<li><p>快速创建和安装多种站点</p></li>\r\n			<li><p>丰富实用的系统工具</p></li>\r\n		</ul>');

-- ----------------------------
-- Table structure for `ar_download`
-- ----------------------------
DROP TABLE IF EXISTS `ar_download`;
CREATE TABLE `ar_download` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` smallint(3) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(200) DEFAULT NULL COMMENT '软件名称',
  `version` varchar(10) DEFAULT NULL COMMENT '版本号',
  `build` smallint(6) DEFAULT NULL COMMENT '编译标记',
  `releasetime` int(10) DEFAULT NULL COMMENT '发布时间',
  `download_url` varchar(100) DEFAULT NULL COMMENT '下载地址',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of ar_download
-- ----------------------------
INSERT INTO `ar_download` VALUES ('1', '1', 'VPSMate', '1.0', '1', '1349798400', '/Uploads/releases/vpsmate-1.0b1.tar.gz', '<p>初始版本发布</p>');
INSERT INTO `ar_download` VALUES ('2', '1', 'VPSMate', '1.0', '2', '1349971200', '/Uploads/releases/vpsmate-1.0b2.tar.gz', '<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>修正 Nginx 设置黑白名单时，黑白名单为空时服务重启失败的问题。</li>\r\n				<li>修正登录评论模块时跳转到首页的问题，以及评论模块中的错误链接。</li>\r\n				<li>修正 unzip 时，因为输出太多超出缓冲区导致进程卡死的问题。</li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>VPSMate 帐户密码修改时，需要确认新密码，并将原密码放前面。</li>\r\n				<li>MYSQL 修改密码时，也需要确认新密码，并将原密码放前面。</li>\r\n				<li>改进文件和目录选择器。</li>\r\n				<li>同时只允许一个 YUM 操作，防止后台启动过多的YUM进程。</li>\r\n				<li>增加 DEMO 演示模式。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('3', '1', 'VPSMate', '1.0', '3', '1351008000', '/Uploads/releases/vpsmate-1.0b3.tar.gz', '<p><strong>新功能：</strong></p>\r\n			<ul>\r\n				<li>增加对 Nginx 站点路径的 Rewrite 支持。</li>\r\n				<li>增加 MySQL 忘记 root 密码强制重置功能。</li>\r\n			</ul>\r\n			<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>DEMO 模式下快速安装网站失败的问题。</li>\r\n				<li>解决未安装 Nginx 时 Nginx 模块加载时提示未知错误的问题。</li>\r\n				<li>解决 Nginx 站点列表为空时提示未知错误的问题。</li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>改进多窗口登录过期的检测。</li>\r\n				<li>登录和修改密码时，将密码MD5后再提交，防止密码明文泄漏，同时改用JS进行密码安全性检测。</li>\r\n				<li>改进多标签页模块中的URL定位，刷新后仍可保留在原来的标签页。</li>\r\n				<li>CentALT 官方的源不稳定，改用 VPSMate 的镜像。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('4', '1', 'VPSMate', '1.0', '4', '1351526400', '/Uploads/releases/vpsmate-1.0b4.tar.gz', '<p><strong>新功能：</strong></p>\r\n			<ul>\r\n				<li>增加对 PHP 的常用配置的支持。</li>\r\n				<li>增加对 PHP-FPM 常用配置的支持。</li>\r\n				<li>Nginx Rewrite 配置时检测文件是否存在。</li>\r\n				<li>增加对 Nginx 反代模式时缓存的支持。</li>\r\n				<li>文件管理中增加文件上传功能。</li>\r\n			</ul>\r\n			<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决文件管理功能中，同名目录覆盖时，原目录会写入为子目录的问题。</li>\r\n				<li>解决中文文件名操作失败的问题。</li>\r\n				<li>解决 Rewrite 格式检测出错的问题。</li>\r\n				<li>解决修改 Nginx 配置后，配置紊乱的问题。</li>\r\n				<li>解决 OpenVZ 虚拟机下进入面板出错的问题。</li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>站点列表按域名字母顺序排列。</li>\r\n				<li>删除右下角评论模块，改为链接到官网论坛。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('7', '1', 'VPSMate', '1.0', '7', '1352217600', '/Uploads/releases/vpsmate-1.0b7.tar.gz', '<p><strong>新功能：</strong></p>\r\n			<ul>\r\n				<li>增加对 ssh 服务的配置，支持公钥验证方式。</li>\r\n				<li>增加远程管理密钥功能，以支持 ECSMate 的远程管理。</li>\r\n			</ul>\r\n			<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决部分使用了LVM的系统进入面板首页报未知错误的问题。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('5', '1', 'VPSMate', '1.0', '5', '1351612800', '/Uploads/releases/vpsmate-1.0b5.tar.gz', '<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决自动创建缓存区目录报错的问题。</li>\r\n				<li>解决中文文件名操作失败的问题。</li>\r\n				<li>解决自动创建缓存区目录报错的问题。</li>\r\n				<li>解决时区不可识别时显示为空的问题。</li>\r\n				<li>解决 Nginx 版本低于 v1.1.8 时连接限制配置出错的问题。</li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>时区设置时添加快速选择常用时区功能。</li>\r\n				<li>增加对 OpenVZ simfs 文件系统的支持。</li>\r\n				<li>增加对操作系统虚拟平台的识别。</li>\r\n				<li>改进对网络接口类型的检测，支持 OpenVZ 的 venet0:0 格式的接口。</li>\r\n				<li>禁用 OpenVZ 平台下的 NTPD 服务。</li>\r\n				<li>禁用 OpenVZ 平台下的磁盘分区功能。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('8', '1', 'VPSMate', '1.0', '8', '1353340800', '/Uploads/releases/vpsmate-1.0b8.tar.gz', '<p><strong>新功能：</strong></p>\r\n			<ul>\r\n				<li>增加对 atomic 软件源的支持。</li>\r\n			</ul>\r\n			<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决远程控制设置保存失败的问题。</li>\r\n				<li>解决phpMyAdmin无法安装的问题。</li>\r\n				<li>解决部分系统因lvs版本不同导致500错误的问题。</li>\r\n				<li>解决数据库密码修改后进入数据库管理异常的问题。</li>\r\n				<li>解决在数据库管理中修改root@localhost用户密码后进入数据库管理异常的问题。</li>\r\n				<li>解决zip文件解压或压缩时安装zip命令无响应的问题。</li>\r\n				<li>解决文件管理中批量删除后，再次点击批量删除时提示文件不存在的问题。</li>\r\n				<li>解决强制修改mysql root密码时无响应的问题。</li>\r\n				<li>解决 centos 5.4 下强制修改 root 密码失败的问题。</li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>网站管理和文件管理增加加载提示。</li>\r\n				<li>增加对软件 release 的识别管理。</li>\r\n				<li>消除登录超时后重登录时URL后面的s=参数串。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('6', '1', 'VPSMate', '1.0', '6', '1351958400', '/Uploads/releases/vpsmate-1.0b6.tar.gz', '<p><strong>新功能：</strong></p>\r\n			<ul>\r\n				<li>增加 MySQL 数据库管理功能。</li>\r\n			</ul>\r\n			<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决中文文件内容读取出错的问题，添加对多种字符集的支持。</li>\r\n				<li>解决并发写入配置文件导致部分配置丢失的问题。</li>\r\n				<li>解决添加只返回错误的Nginx站点后站点列表无法加载的问题。</li>\r\n				<li>解决Nginx黑白名单网段保存后变乱的问题。</li>\r\n				<li>解决文件名中含有中文时许多操作无响应的问题。</li>\r\n				<li>解决Nginx反代网站中，添加多个域名保存后，代理后端配置丢失的问题。</li>\r\n				<li>解决首页在线更新按钮点击出现无法找到页面的问题。</li>\r\n				<li>解决自动创建缓存区目录报错的问题。</a></li>\r\n			</ul>\r\n			<p><strong>功能改进：</strong></p>\r\n			<ul>\r\n				<li>文件保存时自动生成备份文件。</li>\r\n				<li>增加对Nginx跳转地址格式的检测。</li>\r\n				<li>文件保存时支持选择指定字符集进行保存。</li>\r\n				<li>优化 VPSMate 的加载提示。</li>\r\n				<li>优化 Nginx 站点列表、创建Nginx、用户列表、用户组列表的界面。</li>\r\n				<li>文件管理增加批量复制、批量剪切功能。</li>\r\n				<li>删除文件时，同时删除备份文件。</li>\r\n				<li>JS压缩并合并为一个文件，加快下载和加载速度。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('9', '1', 'VPSMate', '1.0', '9', '1354723200', '/Uploads/releases/vpsmate-1.0b9.tar.gz', '<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>修复文件名中存在乱码时文件列表加载失败的问题。</li>\r\n				<li>修复系统类型为i686时获取软件版本失败的问题。</li>\r\n				<li>解决安装MySQL时提示软件冲突/安装失败的问题。</li>\r\n				<li>解决安装软件时总是提示已有一个YUM进程正在安装的问题。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('10', '1', 'VPSMate', '1.0', '10', '1358438400', '/Uploads/releases/vpsmate-1.0b10.tar.gz', '<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决“Error: No matching Packages to list”的问题。</li>\r\n				<li>解决软件源版本更新导致安装失败的问题。</li>\r\n			</ul>');
INSERT INTO `ar_download` VALUES ('11', '1', 'VPSMate', '2.0', '1', '1393571259', '/Uploads/releases/vpsmate-2.0b1.tar.gz', '<p><strong>Bug 修复：</strong></p>\r\n			<ul>\r\n				<li>解决软件源版本更新导致安装失败的问题。</li>\r\n			</ul> ');
