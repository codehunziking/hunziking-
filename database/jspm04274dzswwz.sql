/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm04274dzswwz

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-11-28 17:41:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2020-11-28 15:15:53');

-- ----------------------------
-- Table structure for `dianziyoujian`
-- ----------------------------
DROP TABLE IF EXISTS `dianziyoujian`;
CREATE TABLE `dianziyoujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanxinxiid` int(10) unsigned NOT NULL COMMENT '订单信息id',
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `dingdanxinxi` text NOT NULL COMMENT '订单信息',
  `zongji` decimal(18,2) NOT NULL COMMENT '总计',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `dizhi` varchar(255) NOT NULL COMMENT '地址',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `neirong` text NOT NULL COMMENT '内容',
  `shoujianren` varchar(255) NOT NULL COMMENT '收件人',
  `fajianren` varchar(50) NOT NULL COMMENT '发件人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `dianziyoujian_dingdanxinxiid_index` (`dingdanxinxiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianziyoujian
-- ----------------------------
INSERT INTO `dianziyoujian` VALUES ('1', '1', '11281559565401', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281504362</td><td>大疆</td><td>专业教育人工智能编程机器人</td><td>家用电器</td><td>黑色</td><td>3000.00</td><td>10</td><td>30000.00</td></tr></tbody>\r\n</table>', '30000.00', '陈先生', '56555556552', '测试', '001', '测试', '001@qq.com', 'admin', '2020-11-28 16:13:23');
INSERT INTO `dianziyoujian` VALUES ('2', '5', '11281734038511', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281423022</td><td>容声</td><td>529升 对开门冰箱</td><td>家用电器</td><td>金色</td><td>5000.00</td><td>20</td><td>100000.00</td></tr></tbody>\r\n</table>', '100000.00', '陈先生', '45865454646', '测试', '003', '测试', '003@qq.comm', 'admin', '2020-11-28 17:36:33');

-- ----------------------------
-- Table structure for `dianziyoujian_dingdanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `dianziyoujian_dingdanxinxi`;
CREATE TABLE `dianziyoujian_dingdanxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dianziyoujianid` int(10) unsigned NOT NULL,
  `shangpinxinxiid` int(10) unsigned NOT NULL COMMENT '商品信息ID',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dianziyoujian_dingdanxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianziyoujian_dingdanxinxi
-- ----------------------------

-- ----------------------------
-- Table structure for `dingdanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `dingdanxinxi`;
CREATE TABLE `dingdanxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `dingdanxinxi` text NOT NULL COMMENT '订单信息',
  `zongji` decimal(18,2) NOT NULL COMMENT '总计',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `dizhi` varchar(255) NOT NULL COMMENT '地址',
  `zhuangtai` varchar(50) NOT NULL COMMENT '状态',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdanxinxi
-- ----------------------------
INSERT INTO `dingdanxinxi` VALUES ('1', '11281559565401', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281504362</td><td>大疆</td><td>专业教育人工智能编程机器人</td><td>家用电器</td><td>黑色</td><td>3000.00</td><td>10</td><td>30000.00</td></tr></tbody>\r\n</table>', '30000.00', '陈先生', '56555556552', '测试', '已签收', '001', '是', '2020-11-28 16:00:10');
INSERT INTO `dingdanxinxi` VALUES ('2', '11281626291358', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281413224</td><td> 莫小仙</td><td>自热米饭</td><td>食品</td><td>麻辣</td><td>50.00</td><td>10</td><td>500.00</td></tr></tbody>\r\n</table>', '500.00', '陈先生', '45565656565', '测试', '待发货', '001', '是', '2020-11-28 16:26:47');
INSERT INTO `dingdanxinxi` VALUES ('3', '11281627521488', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281118431</td><td>惠威</td><td>低音炮音箱</td><td>家用电器</td><td>黑色</td><td>500.00</td><td>20</td><td>10000.00</td></tr></tbody>\r\n</table>', '10000.00', '陈先生', '56526354564', '测试', '待支付', '001', '否', '2020-11-28 16:28:02');
INSERT INTO `dingdanxinxi` VALUES ('4', '11281709247951', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281113452</td><td> 小米</td><td>小米电视4A </td><td>家用电器</td><td>70寸</td><td>3000.00</td><td>1</td><td>3000.00</td></tr></tbody>\r\n</table>', '3000.00', '陈先生', '65656565545', '测试', '待支付', '002', '否', '2020-11-28 17:09:35');
INSERT INTO `dingdanxinxi` VALUES ('5', '11281734038511', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281423022</td><td>容声</td><td>529升 对开门冰箱</td><td>家用电器</td><td>金色</td><td>5000.00</td><td>20</td><td>100000.00</td></tr></tbody>\r\n</table>', '100000.00', '陈先生', '45865454646', '测试', '已签收', '003', '是', '2020-11-28 17:34:19');

-- ----------------------------
-- Table structure for `dingdanxinxi_dingdanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `dingdanxinxi_dingdanxinxi`;
CREATE TABLE `dingdanxinxi_dingdanxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanxinxiid` int(10) unsigned NOT NULL,
  `shangpinxinxiid` int(10) unsigned NOT NULL COMMENT '商品信息ID',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dingdanxinxi_dingdanxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdanxinxi_dingdanxinxi
-- ----------------------------
INSERT INTO `dingdanxinxi_dingdanxinxi` VALUES ('1', '1', '8', '2011281504362', '大疆', '专业教育人工智能编程机器人', '1', '黑色', '3000.00', '10', '30000.00', '2020-11-28 16:00:10');
INSERT INTO `dingdanxinxi_dingdanxinxi` VALUES ('2', '2', '5', '2011281413224', ' 莫小仙', '自热米饭', '2', '麻辣', '50.00', '10', '500.00', '2020-11-28 16:26:47');
INSERT INTO `dingdanxinxi_dingdanxinxi` VALUES ('3', '3', '2', '2011281118431', '惠威', '低音炮音箱', '1', '黑色', '500.00', '20', '10000.00', '2020-11-28 16:28:02');
INSERT INTO `dingdanxinxi_dingdanxinxi` VALUES ('4', '4', '1', '2011281113452', ' 小米', '小米电视4A ', '1', '70寸', '3000.00', '1', '3000.00', '2020-11-28 17:09:35');
INSERT INTO `dingdanxinxi_dingdanxinxi` VALUES ('5', '5', '6', '2011281423022', '容声', '529升 对开门冰箱', '1', '金色', '5000.00', '20', '100000.00', '2020-11-28 17:34:19');

-- ----------------------------
-- Table structure for `fenlei`
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES ('1', '家用电器', '2020-11-28 15:33:55');
INSERT INTO `fenlei` VALUES ('2', '食品', '2020-11-28 15:24:21');

-- ----------------------------
-- Table structure for `goumairizhi`
-- ----------------------------
DROP TABLE IF EXISTS `goumairizhi`;
CREATE TABLE `goumairizhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpin` varchar(255) NOT NULL COMMENT '商品',
  `leixing` varchar(50) NOT NULL COMMENT '类型',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `caozuoren` varchar(50) NOT NULL COMMENT '操作人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goumairizhi
-- ----------------------------
INSERT INTO `goumairizhi` VALUES ('3', '低音炮音箱', '购买', '10000.00', '001', '2020-11-28 16:27:36');
INSERT INTO `goumairizhi` VALUES ('4', '小米电视4A ', '购买', '3000.00', '002', '2020-11-28 17:06:56');
INSERT INTO `goumairizhi` VALUES ('5', '529升 对开门冰箱', '购买', '100000.00', '003', '2020-11-28 17:33:49');

-- ----------------------------
-- Table structure for `gouwulan`
-- ----------------------------
DROP TABLE IF EXISTS `gouwulan`;
CREATE TABLE `gouwulan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpinxinxiid` int(10) unsigned NOT NULL COMMENT '商品信息id',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  `issh` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否审核',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `gouwulan_shangpinxinxiid_index` (`shangpinxinxiid`),
  KEY `gouwulan_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gouwulan
-- ----------------------------

-- ----------------------------
-- Table structure for `liulanjilu`
-- ----------------------------
DROP TABLE IF EXISTS `liulanjilu`;
CREATE TABLE `liulanjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpinxinxiid` int(10) unsigned NOT NULL COMMENT '商品信息id',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `liulanren` varchar(50) NOT NULL COMMENT '浏览人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `liulanjilu_shangpinxinxiid_index` (`shangpinxinxiid`),
  KEY `liulanjilu_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liulanjilu
-- ----------------------------
INSERT INTO `liulanjilu` VALUES ('8', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:20:59');
INSERT INTO `liulanjilu` VALUES ('9', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:23:04');
INSERT INTO `liulanjilu` VALUES ('10', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:25:43');
INSERT INTO `liulanjilu` VALUES ('11', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:25:55');
INSERT INTO `liulanjilu` VALUES ('12', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:25:55');
INSERT INTO `liulanjilu` VALUES ('13', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '001', '2020-11-28 16:25:55');
INSERT INTO `liulanjilu` VALUES ('14', '5', '2011281413224', '自热米饭', '2', ' 莫小仙', '50.00', '001', '2020-11-28 16:26:04');
INSERT INTO `liulanjilu` VALUES ('15', '5', '2011281413224', '自热米饭', '2', ' 莫小仙', '50.00', '001', '2020-11-28 16:26:12');
INSERT INTO `liulanjilu` VALUES ('16', '5', '2011281413224', '自热米饭', '2', ' 莫小仙', '50.00', '001', '2020-11-28 16:27:08');
INSERT INTO `liulanjilu` VALUES ('17', '2', '2011281118431', '低音炮音箱', '1', '惠威', '500.00', '001', '2020-11-28 16:27:30');
INSERT INTO `liulanjilu` VALUES ('18', '2', '2011281118431', '低音炮音箱', '1', '惠威', '500.00', '001', '2020-11-28 16:27:38');
INSERT INTO `liulanjilu` VALUES ('19', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', 'admin', '2020-11-28 17:02:59');
INSERT INTO `liulanjilu` VALUES ('23', '1', '2011281113452', '小米电视4A ', '1', ' 小米', '3000.00', '002', '2020-11-28 17:07:00');
INSERT INTO `liulanjilu` VALUES ('24', '7', '2011281501511', '迷你手持云台相机', '1', ' 大疆 ', '0.00', '002', '2020-11-28 17:07:13');
INSERT INTO `liulanjilu` VALUES ('28', '6', '2011281423022', '529升 对开门冰箱', '1', '容声', '5000.00', '003', '2020-11-28 17:33:51');
INSERT INTO `liulanjilu` VALUES ('29', '6', '2011281423022', '529升 对开门冰箱', '1', '容声', '5000.00', '003', '2020-11-28 17:34:35');
INSERT INTO `liulanjilu` VALUES ('30', '6', '2011281423022', '529升 对开门冰箱', '1', '容声', '5000.00', '003', '2020-11-28 17:35:01');
INSERT INTO `liulanjilu` VALUES ('31', '2', '2011281118431', '低音炮音箱', '1', '惠威', '500.00', '003', '2020-11-28 17:35:15');
INSERT INTO `liulanjilu` VALUES ('32', '2', '2011281118431', '低音炮音箱', '1', '惠威', '500.00', '003', '2020-11-28 17:35:18');
INSERT INTO `liulanjilu` VALUES ('33', '2', '2011281118431', '低音炮音箱', '1', '惠威', '500.00', '003', '2020-11-28 17:35:25');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `liuyanneirong` text NOT NULL COMMENT '留言内容',
  `liuyanren` varchar(50) NOT NULL COMMENT '留言人',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('1', '小强', '68565655656', '测试', '001', '测试', '2020-11-28 15:57:05');
INSERT INTO `liuyanban` VALUES ('2', '小米', '56555555455', ' cs 测试', '002', '测试测试', '2020-11-28 17:07:06');
INSERT INTO `liuyanban` VALUES ('3', '小明', '86545656565', '测试测试', '003', '测试xx', '2020-11-28 17:32:36');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '22', 'upload/1606549769697.png', 'www', '2020-11-28 15:49:36');
INSERT INTO `lunbotu` VALUES ('2', '566', 'upload/1606549804812.png', 'www', '2020-11-28 15:50:10');

-- ----------------------------
-- Table structure for `qianshou`
-- ----------------------------
DROP TABLE IF EXISTS `qianshou`;
CREATE TABLE `qianshou` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanxinxiid` int(10) unsigned NOT NULL COMMENT '订单信息id',
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `dingdanxinxi` text NOT NULL COMMENT '订单信息',
  `zongji` decimal(18,2) NOT NULL COMMENT '总计',
  `shouhuoren` varchar(50) NOT NULL COMMENT '收货人',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `dizhi` varchar(255) NOT NULL COMMENT '地址',
  `pingjia` varchar(255) NOT NULL COMMENT '评价',
  `qianshouren` varchar(50) NOT NULL COMMENT '签收人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `qianshou_dingdanxinxiid_index` (`dingdanxinxiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qianshou
-- ----------------------------
INSERT INTO `qianshou` VALUES ('1', '1', '11281559565401', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281504362</td><td>大疆</td><td>专业教育人工智能编程机器人</td><td>家用电器</td><td>黑色</td><td>3000.00</td><td>10</td><td>30000.00</td></tr></tbody>\r\n</table>', '30000.00', '陈先生', '56555556552', '测试', '中评', '001', '2020-11-28 16:19:11');
INSERT INTO `qianshou` VALUES ('2', '5', '11281734038511', '<table class=\"table\">\r\n<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><td>2011281423022</td><td>容声</td><td>529升 对开门冰箱</td><td>家用电器</td><td>金色</td><td>5000.00</td><td>20</td><td>100000.00</td></tr></tbody>\r\n</table>', '100000.00', '陈先生', '45865454646', '测试', '中评', '003', '2020-11-28 17:38:41');

-- ----------------------------
-- Table structure for `qianshou_dingdanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `qianshou_dingdanxinxi`;
CREATE TABLE `qianshou_dingdanxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qianshouid` int(10) unsigned NOT NULL,
  `shangpinxinxiid` int(10) unsigned NOT NULL COMMENT '商品信息ID',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `qianshou_dingdanxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qianshou_dingdanxinxi
-- ----------------------------

-- ----------------------------
-- Table structure for `shangpinxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `shangpinxinxi`;
CREATE TABLE `shangpinxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `pinpai` varchar(50) NOT NULL COMMENT '品牌',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `xiaoliang` int(11) NOT NULL COMMENT '销量',
  `kucun` int(11) NOT NULL COMMENT '库存',
  `shifoutuijian` varchar(255) NOT NULL COMMENT '是否推荐',
  `tupian` text NOT NULL COMMENT '图片',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `shangpinxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpinxinxi
-- ----------------------------
INSERT INTO `shangpinxinxi` VALUES ('1', '2011281113452', ' 小米', '小米电视4A ', '1', '70寸,65寸,50寸', '3000.00', '0', '100', '是', 'upload/1606549647178.png,upload/1606549658284.png,upload/1606549670250.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"小米L70M5-4A\">商品名称：小米L70M5-4A</li><li title=\"100008268466\">商品编号：100008268466</li><li title=\"28.16kg\">商品毛重：28.16kg</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"70-75英寸\">屏幕尺寸：70-75英寸</li><li title=\"二级能效\">能效等级：二级能效</li><li title=\"4k超高清（3840&amp;times;2160）\">分辨率：4k超高清（3840&amp;times;2160）</li><li title=\"人工智能，大屏，教育电视，4K超清\">电视类型：人工智能，大屏，教育电视，4K超清</li><li title=\"新品电视\">用户优选：新品电视</li><li title=\"10.0-8.0\">选购指数：10.0-8.0</li><li title=\"3.5m以上（70英寸以上）\">观看距离：3.5m以上（70英寸以上）<img src=\"upload/20201128/79691606549688348.png\" _src=\"upload/20201128/79691606549688348.png\"/></li></ul>', '2020-11-28 15:47:53');
INSERT INTO `shangpinxinxi` VALUES ('2', '2011281118431', '惠威', '低音炮音箱', '1', '黑色,咖啡色', '500.00', '0', '100', '是', 'upload/1606549534543.png,upload/1606549548820.png,upload/1606549559501.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"惠威HiVi Sub10G\">商品名称：惠威HiVi Sub10G</li><li title=\"4100812\">商品编号：4100812</li><li title=\"18.08kg\">商品毛重：18.08kg</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"低音炮\">产品类别：低音炮</li><li title=\"其他\">声道：其他</li><li title=\"木质箱体\">材质：木质箱体</li><li title=\"其他\">连接方式：其他</li><li title=\"客厅，书房\">适用场景：客厅，书房<img src=\"upload/20201128/6161606549586387.png\" _src=\"upload/20201128/6161606549586387.png\"/></li></ul>', '2020-11-28 15:52:13');
INSERT INTO `shangpinxinxi` VALUES ('3', '2011281122523', '全聚德', '北京烤鸭', '2', '五香味,原味,香辣味', '150.00', '0', '100', '是', 'upload/1606549435348.png,upload/1606549450227.png,upload/1606549461613.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"全聚德 北京烤鸭百年经典礼盒鸭饼酱套装1380g 五香烤鸭1000g+烤鸭酱180g+饼200g\">商品名称：全聚德 北京烤鸭百年经典礼盒鸭饼酱套装1380g 五香烤鸭1000g+烤鸭酱180g+饼200g</li><li title=\"18227564362\">商品编号：18227564362</li><li title=\"全聚德官方旗舰店\">店铺：&nbsp;<a href=\"https://qjd1864.jd.com/\" target=\"_blank\" rel=\"noopener\">全聚德官方旗舰店</a></li><li title=\"1.38kg\">商品毛重：1.38kg</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"礼盒装\">包装：礼盒装</li><li title=\"混合口味\">口味：混合口味</li><li title=\"加热\">食用方法：加热</li><li title=\"鸭肉\">类别：鸭肉<img src=\"./upload/1606549468192.png\"/><img src=\"/up/2020/11/28/112216-472298737.png\"/><img src=\"./upload/1606549468364.png\"/></li></ul>', '2020-11-28 16:11:20');
INSERT INTO `shangpinxinxi` VALUES ('4', '2011281129254', ' 载缘记', '伍仁金腿', '2', '1斤,2斤,3斤', '50.00', '0', '100', '是', 'upload/1606549304775.png,upload/1606549319387.png,upload/1606549328144.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"月饼伍仁金腿大月饼2斤装4斤装600g酥皮金华五仁火腿大饼吴川产3款礼盒可选 （伍仁金腿大饼1000g）\">商品名称：月饼伍仁金腿大月饼2斤装4斤装600g酥皮金华五仁火腿大饼吴川产3款礼盒可选 （伍仁金腿大饼1000g）</li><li title=\"10021987754813\">商品编号：10021987754813</li><li title=\"翰御亭休闲食品专营店\">店铺：&nbsp;<a href=\"https://mall.jd.com/index-10310931.html?from=pc\" target=\"_blank\" rel=\"noopener\">翰御亭休闲食品专营店</a></li><li title=\"100.00g\">商品毛重：100.00g</li><li title=\"礼盒装\">包装：礼盒装</li><li title=\"五仁\">月饼馅类别：五仁</li><li title=\"酥皮\">月饼皮类别：酥皮</li><li title=\"广式月饼\">分类：广式月饼<img src=\"./upload/1606549352967.png\"/><img src=\"./upload/1606549353269.png\"/></li></ul>', '2020-11-28 16:01:21');
INSERT INTO `shangpinxinxi` VALUES ('5', '2011281413224', ' 莫小仙', '自热米饭', '2', '原味,麻辣', '50.00', '10', '90', '是', 'upload/1606549156945.png,upload/1606549170707.png,upload/1606549184682.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"莫小仙自热米饭\">商品名称：莫小仙自热米饭</li><li title=\"100008362287\">商品编号：100008362287</li><li title=\"360.00g\">商品毛重：360.00g</li><li title=\"中国四川\">商品产地：中国四川</li><li title=\"盒装\">包装：盒装</li><li title=\"其它\">口味：其它</li><li title=\"1人份\">套餐份量：1人份<img src=\"./upload/1606549206957.png\" alt=\"老四款详情.jpg\"/></li></ul>', '2020-11-28 16:17:07');
INSERT INTO `shangpinxinxi` VALUES ('6', '2011281423022', '容声', '529升 对开门冰箱', '1', '黑色,白色,金色', '5000.00', '20', '80', '是', 'upload/1606549018269.png,upload/1606549038298.png,upload/1606549054936.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"容声BCD-529WD11HP\">商品名称：容声BCD-529WD11HP</li><li title=\"3459483\">商品编号：3459483</li><li title=\"104.0kg\">商品毛重：104.0kg</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"二级能效\">能效等级：二级能效</li><li title=\"变频（节能）\">压缩机：变频（节能）</li><li title=\"精细存储，多口之家\">特色推荐：精细存储，多口之家</li><li title=\"170.1-180cm\">高度：170.1-180cm</li><li title=\"对开门\">门款式：对开门</li><li title=\"电脑控温\">控温方式：电脑控温</li><li title=\"线上专供\">产品渠道：线上专供</li><li title=\"风冷（无霜）\">制冷方式：风冷（无霜）</li><li title=\"90.1-95cm\">宽度：90.1-95cm</li><li title=\"501-600升\">总容积：501-600升</li><li title=\"延保服务\">用户优选：延保服务</li><li title=\"金色\">面板颜色：金色</li><li title=\"其他\">系列：其他</li><li title=\"彩钢\">面板材质：彩钢</li><li title=\"60.1-65cm\">深度：60.1-65cm<img src=\"upload/20201128/25491606549109893.png\" _src=\"upload/20201128/25491606549109893.png\"/></li></ul>', '2020-11-28 16:23:55');
INSERT INTO `shangpinxinxi` VALUES ('7', '2011281501511', ' 大疆 ', '迷你手持云台相机', '1', '黑色,白色', '0.00', '0', '100', '是', 'upload/1606548843156.png,upload/1606548857323.png', '<p>&nbsp;</p><ul class=\"parameter2 p-parameter-list\"><li title=\"大疆大疆\">商品名称：大疆大疆</li><li title=\"100015768844\">商品编号：100015768844</li><li title=\"250.00g\">商品毛重：250.00g</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"Vlog，直播，慢动作录制，无线控制\">使用场景：Vlog，直播，慢动作录制，无线控制</li><li title=\"其他\">配件：其他</li><li title=\"4K\">分辨率：4K</li><li title=\"触屏操作，视频直播，电子防抖，延时摄影\">功能：触屏操作，视频直播，电子<img src=\"upload/20201128/56591606548901758.png\" _src=\"upload/20201128/56591606548901758.png\"/></li></ul>', '2020-11-28 16:32:03');
INSERT INTO `shangpinxinxi` VALUES ('8', '2011281504362', '大疆', '专业教育人工智能编程机器人', '1', '黑色,白色', '3000.00', '0', '100', '是', 'upload/1606548658063.png,upload/1606548691762.png', '<ul class=\"parameter2 p-parameter-list\"><li title=\"大疆RoboMaster S1\">商品名称：大疆RoboMaster S1</li><li title=\"100006194348\">商品编号：100006194348</li><li title=\"4.89kg\">商品毛重：4.89kg</li><li title=\"中国大陆\">商品产地：中国大陆</li><li title=\"其他\">屏幕尺寸：其他</li><li title=\"可移动\">硬件形态：可移动</li><li title=\"WIFI\">联网方式：WIFI</li><li title=\"其他\">产品包装：其他</li><li title=\"1~2小时\">续航时间：1~2小时</li><li title=\"3-6岁，7-12岁\">适用年龄：3-6岁，7-12岁</li><li title=\"学习工具，亲子互动\">特色功能：学习工具，亲子互动</li><li title=\"送儿童，送朋友\">适用人群：送儿童，送朋友</li><li title=\"其他\">运行内存：其他</li><li title=\"充电\">电源类型：充电</li><li title=\"智能学习，娱乐陪伴\">使用场景：智能学习，娱乐陪伴<img src=\"upload/20201128/16541606548789777.png\" _src=\"upload/20201128/16541606548789777.png\"/></li></ul>', '2020-11-28 16:40:27');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `xwid` int(10) unsigned NOT NULL,
  `biao` varchar(255) NOT NULL,
  `biaoti` varchar(255) NOT NULL,
  `url` varchar(512) NOT NULL,
  `ziduan` varchar(255) NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES ('1', '001', '1', 'shangpinxinxi', '小米电视4A ', 'http://localhost:8080/jspm04274dzswwz/shangpinxinxidetail.jsp?id=1', 'mingcheng', '2020-11-28 16:03:13');
INSERT INTO `shoucangjilu` VALUES ('2', '002', '1', 'shangpinxinxi', '小米电视4A ', 'http://localhost:8080/jspm04274dzswwz/shangpinxinxidetail.jsp?id=1', 'mingcheng', '2020-11-28 17:06:59');
INSERT INTO `shoucangjilu` VALUES ('3', '003', '2', 'shangpinxinxi', '低音炮音箱', 'http://localhost:8080/jspm04274dzswwz/shangpinxinxidetail.jsp?id=2', 'mingcheng', '2020-11-28 17:35:16');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(50) NOT NULL COMMENT '身份证',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '001', '001', '小强', '男', '68565655656', '001@qq.com', '459456545656425', 'upload/1606550200461.jpg', '2020-11-28 15:56:43');
INSERT INTO `yonghu` VALUES ('2', '002', '002', '小米', '女', '56555555455', '002@qq.com', '554565654846444', 'upload/1606554331529.jpg', '2020-11-28 17:05:35');
INSERT INTO `yonghu` VALUES ('3', '003', '003', '小明', '男', '86545656565', '003@qq.com', '455455556551255', 'upload/1606555923654.jpg', '2020-11-28 17:32:05');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2020-11-28 15:17:30');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2020-11-28 15:17:30');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2020-11-28 15:17:30');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com', '2020-11-28 15:17:30');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com', '2020-11-28 15:17:30');
