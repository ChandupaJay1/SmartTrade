/*
 Navicat Premium Dump SQL

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : smarttrade

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 12/09/2024 12:30:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `line2` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mobile` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `city_id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_address_city1_idx`(`city_id` ASC) USING BTREE,
  INDEX `fk_address_user1_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_address_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 'LC, 59 National Housing Scheme', 'Airport Road Anuradhapura', '50000', '0773729462', 3, 8, 'Chandupa', 'Jayalath');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_product1_idx`(`product_id` ASC) USING BTREE,
  INDEX `fk_cart_user1_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Apple');
INSERT INTO `category` VALUES (2, 'Samsung');
INSERT INTO `category` VALUES (3, 'Sony');
INSERT INTO `category` VALUES (4, 'Xiomi');
INSERT INTO `category` VALUES (5, 'Google');
INSERT INTO `category` VALUES (6, 'Oppo');
INSERT INTO `category` VALUES (7, 'Huawei');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 'Bandarawela');
INSERT INTO `city` VALUES (2, 'Badulla');
INSERT INTO `city` VALUES (3, 'Colombo');
INSERT INTO `city` VALUES (4, 'Haliela');

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, 'Black');
INSERT INTO `color` VALUES (2, 'White');
INSERT INTO `color` VALUES (3, 'Red');
INSERT INTO `color` VALUES (4, 'Blue');
INSERT INTO `color` VALUES (5, 'Green');
INSERT INTO `color` VALUES (6, 'Gold');
INSERT INTO `color` VALUES (7, 'Purple');
INSERT INTO `color` VALUES (8, 'Orange');
INSERT INTO `color` VALUES (9, 'Two Color Combinations');
INSERT INTO `color` VALUES (10, 'Other');
INSERT INTO `color` VALUES (11, 'Silver');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_model_category_idx`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_model_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES (1, 'Galaxy A06', 2);
INSERT INTO `model` VALUES (2, 'Galaxy F14 4G', 2);
INSERT INTO `model` VALUES (3, 'Galaxy Z Fold6', 2);
INSERT INTO `model` VALUES (4, 'Galaxy M35', 2);
INSERT INTO `model` VALUES (5, 'Galaxy F55', 2);
INSERT INTO `model` VALUES (6, 'Galaxy C55', 2);
INSERT INTO `model` VALUES (7, 'iPhone 13 Pro Max (2024)', 1);
INSERT INTO `model` VALUES (8, 'iPad Pro 11 (2024)', 1);
INSERT INTO `model` VALUES (9, 'iPhone 15 Pro Max', 1);
INSERT INTO `model` VALUES (10, 'Phone 14 Pro Max', 1);
INSERT INTO `model` VALUES (11, 'iPhone SE (2022)', 1);
INSERT INTO `model` VALUES (12, 'MatePad Air (2024)', 7);
INSERT INTO `model` VALUES (13, 'Pura 70 Pro', 7);
INSERT INTO `model` VALUES (14, 'MatePad 11.5 S', 7);
INSERT INTO `model` VALUES (15, 'Huawei nova Flip', 7);
INSERT INTO `model` VALUES (16, 'Nova 12 SE', 7);
INSERT INTO `model` VALUES (17, 'Pixel 9 Pro XL', 5);
INSERT INTO `model` VALUES (18, 'Pixel Fold', 5);
INSERT INTO `model` VALUES (19, 'Pixel 6 Pro', 5);
INSERT INTO `model` VALUES (20, 'Pixel 4a 5G', 5);
INSERT INTO `model` VALUES (21, 'Reno12 F 4G', 6);
INSERT INTO `model` VALUES (22, 'Oppo Find X7', 6);
INSERT INTO `model` VALUES (23, 'F25 Pro', 6);
INSERT INTO `model` VALUES (24, 'Xiaomi Redmi 14C', 4);
INSERT INTO `model` VALUES (25, 'Poco Pad 5G', 4);
INSERT INTO `model` VALUES (26, 'Redmi K70 Ultra', 4);
INSERT INTO `model` VALUES (27, 'Poco X6 Neo', 4);
INSERT INTO `model` VALUES (28, 'Xperia 10 VI', 3);
INSERT INTO `model` VALUES (29, 'Xperia XZ Premium', 3);
INSERT INTO `model` VALUES (30, 'Xperia XZ1 Compact', 3);
INSERT INTO `model` VALUES (31, 'Samsung A04E', 2);
INSERT INTO `model` VALUES (32, 'Galaxy A05', 2);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_item_order1_idx`(`order_id` ASC) USING BTREE,
  INDEX `fk_order_item_product1_idx`(`product_id` ASC) USING BTREE,
  INDEX `fk_order_item_order_status1_idx`(`order_status_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_item_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (5, 1, 3, 17, 1);
INSERT INTO `order_item` VALUES (6, 1, 4, 15, 1);
INSERT INTO `order_item` VALUES (7, 1, 5, 17, 1);
INSERT INTO `order_item` VALUES (8, 1, 11, 17, 1);
INSERT INTO `order_item` VALUES (9, 1, 12, 17, 1);
INSERT INTO `order_item` VALUES (10, 1, 13, 17, 1);

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES (1, 'Pending');
INSERT INTO `order_status` VALUES (2, 'Approved');
INSERT INTO `order_status` VALUES (3, 'Rejected');
INSERT INTO `order_status` VALUES (4, 'Fulfilled');
INSERT INTO `order_status` VALUES (5, 'Closed');
INSERT INTO `order_status` VALUES (6, 'Paid');
INSERT INTO `order_status` VALUES (7, 'Delivered');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` double NOT NULL,
  `qty` int NOT NULL,
  `date_time` datetime NOT NULL,
  `model_id` int NOT NULL,
  `storage_id` int NOT NULL,
  `color_id` int NOT NULL,
  `user_id` int NOT NULL,
  `condition_id` int NOT NULL,
  `product_status_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_model1_idx`(`model_id` ASC) USING BTREE,
  INDEX `fk_product_storage1_idx`(`storage_id` ASC) USING BTREE,
  INDEX `fk_product_color1_idx`(`color_id` ASC) USING BTREE,
  INDEX `fk_product_user1_idx`(`user_id` ASC) USING BTREE,
  INDEX `fk_product_condition1_idx`(`condition_id` ASC) USING BTREE,
  INDEX `fk_product_product_status1_idx`(`product_status_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_condition1` FOREIGN KEY (`condition_id`) REFERENCES `product_condition` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_status` FOREIGN KEY (`product_status_id`) REFERENCES `product_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_storage1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (13, 'iPhone 13 Pro 128 GB Blue', 'APPLPE IPHONE 13 BLUE <br/>\r\n5G CONNECTIVITY <br/>\r\n128GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 3000, 27, '2024-09-11 02:32:20', 7, 5, 4, 8, 1, 1);
INSERT INTO `product` VALUES (14, ' Apple iPhone 13 Red 256 GB', 'APPLPE IPHONE 13 RED <br/>\r\n5G CONNECTIVITY <br/>\r\n256GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 4000, 26, '2024-09-11 02:36:53', 7, 6, 3, 8, 1, 1);
INSERT INTO `product` VALUES (15, ' Apple iPhone 13 Blue 512GB', 'APPLPE IPHONE 13 GOLD<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 5000, 9, '2024-09-11 02:38:03', 7, 7, 6, 8, 1, 1);
INSERT INTO `product` VALUES (16, ' Apple iPhone 13 Green 128GB', 'APPLPE IPHONE 13 GREEN<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 3500, 12, '2024-09-11 02:39:18', 7, 5, 5, 8, 1, 1);
INSERT INTO `product` VALUES (17, ' Apple iPhone 14 Indigo 512GB', 'APPLPE IPHONE 14 INDIGO<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 4500, 21, '2024-09-11 02:41:01', 10, 7, 9, 8, 1, 1);

-- ----------------------------
-- Table structure for product_condition
-- ----------------------------
DROP TABLE IF EXISTS `product_condition`;
CREATE TABLE `product_condition`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_condition
-- ----------------------------
INSERT INTO `product_condition` VALUES (1, 'Brand New');
INSERT INTO `product_condition` VALUES (2, 'Used');

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user1_idx`(`user_id` ASC) USING BTREE,
  INDEX `fk_order_address1_idx`(`address_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_order
-- ----------------------------
INSERT INTO `product_order` VALUES (3, 8, '2024-09-11 15:29:47', 1);
INSERT INTO `product_order` VALUES (4, 8, '2024-09-11 15:32:46', 1);
INSERT INTO `product_order` VALUES (5, 8, '2024-09-11 15:34:58', 1);
INSERT INTO `product_order` VALUES (6, 8, '2024-09-11 15:35:04', 1);
INSERT INTO `product_order` VALUES (7, 8, '2024-09-11 15:35:05', 1);
INSERT INTO `product_order` VALUES (8, 8, '2024-09-11 15:35:05', 1);
INSERT INTO `product_order` VALUES (9, 8, '2024-09-11 15:35:06', 1);
INSERT INTO `product_order` VALUES (10, 8, '2024-09-11 15:35:43', 1);
INSERT INTO `product_order` VALUES (11, 8, '2024-09-11 15:36:40', 1);
INSERT INTO `product_order` VALUES (12, 8, '2024-09-11 15:38:34', 1);
INSERT INTO `product_order` VALUES (13, 8, '2024-09-11 15:39:50', 1);

-- ----------------------------
-- Table structure for product_status
-- ----------------------------
DROP TABLE IF EXISTS `product_status`;
CREATE TABLE `product_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_status
-- ----------------------------
INSERT INTO `product_status` VALUES (1, 'Active');
INSERT INTO `product_status` VALUES (2, 'Inactive');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (1, '8 GB');
INSERT INTO `storage` VALUES (2, '16 GB');
INSERT INTO `storage` VALUES (3, '32 GB');
INSERT INTO `storage` VALUES (4, '64 GB');
INSERT INTO `storage` VALUES (5, '128 GB');
INSERT INTO `storage` VALUES (6, '256 GB');
INSERT INTO `storage` VALUES (7, '512 GB');
INSERT INTO `storage` VALUES (8, '1 TB');
INSERT INTO `storage` VALUES (9, '6 GB');
INSERT INTO `storage` VALUES (10, '4 GB');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `verification` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'Chandupa', 'Jayalath', 'chandupajayalath20@gmail.com', 'Chandupa@2022', 'Verified');

SET FOREIGN_KEY_CHECKS = 1;
