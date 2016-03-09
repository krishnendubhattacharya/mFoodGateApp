-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2016 at 03:02 PM
-- Server version: 5.5.44-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mfoodgate`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `is_active`) VALUES
(1, 'Chinese Food', 0, 1),
(2, 'Western Food', 0, 1),
(3, 'Indonesian Food', 0, 1),
(5, 'Japanese Food', 0, 1),
(7, 'Warong Kopi', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_des` text NOT NULL,
  `discount_percent` float NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `user_id`, `title`, `short_des`, `discount_percent`, `start_date`, `end_date`) VALUES
(4, 2, 'New Year Offer', 'Amazing', 15, '2016-02-12', '2016-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double(10,2) NOT NULL,
  `offer_price` double(10,2) NOT NULL,
  `offer_percent` double(10,2) NOT NULL,
  `offer_from_date` datetime NOT NULL,
  `offer_to_date` datetime NOT NULL,
  `image` varchar(500) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `buy_count` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created_on`, `title`, `description`, `price`, `offer_price`, `offer_percent`, `offer_from_date`, `offer_to_date`, `image`, `is_active`, `merchant_id`, `restaurant_id`, `location`, `lat`, `lng`, `is_featured`, `buy_count`, `category_id`) VALUES
(1, '2016-02-25 00:00:00', 'offer 1', 'aabbccdd', 23.00, 20.00, 10.00, '2016-02-26 00:00:00', '2016-03-16 00:00:00', '', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 1, 3, 1),
(2, '2016-02-25 00:00:00', 'offer 2', 'sdfb', 50.00, 45.00, 10.00, '2016-02-26 00:00:00', '2016-03-17 00:00:00', '', 1, 3, 1, 'Mumbai', '18.9750', '72.8258', 1, 2, 1),
(3, '2016-02-25 00:00:00', 'offer 3', 'sdfb', 50.00, 45.00, 10.00, '2016-02-26 00:00:00', '2016-03-15 00:00:00', '', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2),
(4, '2016-02-25 00:00:00', 'offer 4', 'sdfb', 50.00, 45.00, 10.00, '2016-02-26 00:00:00', '2016-03-16 00:00:00', '', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `offer_images`
--

DROP TABLE IF EXISTS `offer_images`;
CREATE TABLE IF NOT EXISTS `offer_images` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE IF NOT EXISTS `points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `old_points` int(11) NOT NULL,
  `new_points` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `type` enum('D','C') NOT NULL DEFAULT 'D' COMMENT '''D'' - Debit, ''C'' - Credit',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `voucher_id`, `old_points`, `new_points`, `points`, `type`, `date`, `expire_date`) VALUES
(1, 4, 0, 0, 10, 10, 'C', '2016-03-02 10:35:55', '2016-03-31 04:00:00'),
(2, 4, 0, 0, 10, 10, 'C', '2016-03-02 10:35:55', '2016-03-07 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_details`
--

DROP TABLE IF EXISTS `restaurant_details`;
CREATE TABLE IF NOT EXISTS `restaurant_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `address` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_details`
--

INSERT INTO `restaurant_details` (`id`, `user_id`, `title`, `logo`, `address`) VALUES
(1, 3, 'Shiraz', 'shiraz_logo.png', 'Shambazar');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `merchant_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `txt_pwd` varchar(255) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `user_type_id` int(11) NOT NULL DEFAULT '0',
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `unique_code` varchar(255) DEFAULT NULL,
  `is_social_login` int(10) NOT NULL DEFAULT '0',
  `fb_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `about_me` text,
  `media_notification` tinyint(1) NOT NULL DEFAULT '0',
  `expire_date_notification` tinyint(1) NOT NULL DEFAULT '0',
  `promo_notification` tinyint(1) NOT NULL DEFAULT '0',
  `news_letter_notification` tinyint(1) NOT NULL DEFAULT '0',
  `address` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `merchant_name`, `email`, `username`, `password`, `txt_pwd`, `registration_date`, `is_active`, `user_type_id`, `is_logged_in`, `last_login`, `unique_code`, `is_social_login`, `fb_id`, `image`, `phone`, `about_me`, `media_notification`, `expire_date_notification`, `promo_notification`, `news_letter_notification`, `address`) VALUES
(1, 'admin', 'admin', 'abc', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-12 09:02:28', 1, 1, 0, '2016-03-09 02:03:36', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(2, NULL, NULL, NULL, 'nits.anup1@gmail.com', NULL, '827ccb0eea8a706c4c34a16891f84e7b', '12345', '2016-02-15 10:02:57', 1, 3, 0, '2016-02-16 12:02:45', '123', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(3, 'krish', NULL, 'abcd', 'nits.krishnendu@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-15 11:02:06', 1, 3, 0, '2016-03-09 02:03:54', NULL, 0, NULL, '1457524492160540_231_RL_product.jpg', '3698745221', 'test', 0, 0, 0, 0, 'kolkata'),
(4, 'Anup', 'Chakraborty', NULL, 'nits.anup@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-16 12:02:27', 1, 2, 0, '2016-03-09 02:03:19', '1455626727299005', 0, NULL, '1456900270690476_232_RL_product.jpg', '968745', 'abcd', 0, 0, 0, 0, ''),
(6, 'Rahul', 'Roy', NULL, 'nits.santanu@gmail.com', NULL, NULL, NULL, '2016-02-22 03:02:46', 1, 2, 0, '2016-02-29 12:02:54', '1456156186779391', 0, '1670701249873793', '1456745423267591_134_man1.jpg', NULL, NULL, 0, 0, 0, 0, ''),
(9, 'Arup', 'Chakraborty', 'a', 'nits.sarojkumar@gmail.com', 'saroj', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-25 08:02:26', 0, 2, 0, NULL, '1456387586434984', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(15, NULL, NULL, NULL, 'nits.ananya15@gmail.com', NULL, '827ccb0eea8a706c4c34a16891f84e7b', '12345', '2016-03-03 06:03:52', 1, 2, 0, '2016-03-03 08:03:57', '1456987192653171', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'merchant');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` bigint(20) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `view_id` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `offer_price` double(10,2) NOT NULL,
  `offer_percent` double(10,2) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `offer_id`, `created_on`, `view_id`, `price`, `offer_price`, `offer_percent`, `from_date`, `to_date`, `is_used`, `is_active`, `user_id`) VALUES
(1, 1, '2016-02-26 00:00:00', 'vch0001', 23.00, 20.00, 10.00, '2016-02-24 00:00:00', '2016-03-16 00:00:00', 0, 1, 4),
(2, 2, '2016-02-26 00:00:00', 'vch0002', 50.00, 45.00, 10.00, '2016-02-26 00:00:00', '2016-03-15 00:00:00', 0, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_bids`
--

DROP TABLE IF EXISTS `voucher_bids`;
CREATE TABLE IF NOT EXISTS `voucher_bids` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bid_price` double DEFAULT NULL,
  `voucher_resale_id` int(11) DEFAULT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `m_points` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_bids`
--

INSERT INTO `voucher_bids` (`id`, `voucher_id`, `user_id`, `bid_price`, `voucher_resale_id`, `is_accepted`, `m_points`, `is_active`) VALUES
(1, 1, 2, 555, 1, 1, NULL, 1),
(3, 1, 9, 825, 1, 0, NULL, 1),
(4, 1, 4, 2250, 1, 0, NULL, 1),
(5, 1, 6, 2250, 2, 0, '110', 1),
(6, 1, 4, 23, 2, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_owner`
--

DROP TABLE IF EXISTS `voucher_owner`;
CREATE TABLE IF NOT EXISTS `voucher_owner` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `voucher_view_id` varchar(255) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `purchased_date` datetime NOT NULL,
  `sold_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `offer_price` double(10,2) NOT NULL,
  `offer_percent` double(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_owner`
--

INSERT INTO `voucher_owner` (`id`, `offer_id`, `voucher_id`, `voucher_view_id`, `from_user_id`, `to_user_id`, `purchased_date`, `sold_date`, `is_active`, `price`, `offer_price`, `offer_percent`) VALUES
(1, 1, 1, 'vch0001', 3, 4, '2016-02-24 00:00:00', '2016-03-07 01:06:34', 0, 23.00, 20.00, 10.00),
(2, 1, 1, 'vch0001', 3, 4, '2016-03-07 01:06:34', '0000-00-00 00:00:00', 1, 200.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_resales`
--

DROP TABLE IF EXISTS `voucher_resales`;
CREATE TABLE IF NOT EXISTS `voucher_resales` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `points` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_sold` tinyint(1) NOT NULL,
  `created_on` datetime NOT NULL,
  `sold_on` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_resales`
--

INSERT INTO `voucher_resales` (`id`, `voucher_id`, `price`, `points`, `user_id`, `is_sold`, `created_on`, `sold_on`, `is_active`) VALUES
(1, 1, 662.00, 0, 4, 1, '2016-03-01 10:03:54', '2016-03-07 01:06:34', 1),
(2, 1, 662.00, 0, 5, 0, '2016-03-01 10:03:54', '0000-00-00 00:00:00', 1),
(3, 2, 369.00, 0, 4, 0, '2016-03-03 11:03:39', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wine`
--

DROP TABLE IF EXISTS `wine`;
CREATE TABLE IF NOT EXISTS `wine` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `grapes` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `description` blob,
  `picture` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wine`
--

INSERT INTO `wine` (`id`, `name`, `year`, `grapes`, `country`, `region`, `description`, `picture`) VALUES
(1, 'CHATEAU DE SAINT COSME', '2009', 'Grenache / Syrah', 'France', 'Southern Rhone / Gigondas', 0x5468652061726f6d6173206f6620667275697420616e642073706963652067697665206f6e6520612068696e74206f6620746865206c69676874206472696e6b6162696c697479206f662074686973206c6f76656c792077696e652c207768696368206d616b657320616e20657863656c6c656e7420636f6d706c656d656e7420746f2066697368206469736865732e, 'saint_cosme.jpg'),
(2, 'LAN RIOJA CRIANZA', '2006', 'Tempranillo', 'Spain', 'Rioja', 0x4120726573757267656e6365206f6620696e74657265737420696e20626f7574697175652076696e65796172647320686173206f70656e65642074686520646f6f7220666f72207468697320657863656c6c656e7420666f72617920696e746f2074686520646573736572742077696e65206d61726b65742e204c6967687420616e6420626f756e63792c207769746820612068696e74206f6620626c61636b2074727566666c652c20746869732077696e652077696c6c206e6f74206661696c20746f207469636b6c652074686520746173746520627564732e, 'lan_rioja.jpg'),
(3, 'MARGERUM SYBARITE', '2010', 'Sauvignon Blanc', 'USA', 'California Central Cosat', 0x546865206361636865206f6620612066696e652043616265726e657420696e206f6e65732077696e652063656c6c61722063616e206e6f77206265207265706c6163656420776974682061206368696c646973686c7920706c617966756c2077696e6520627562626c696e67206f76657220776974682074656d7074696e6720746173746573206f660a626c61636b2063686572727920616e64206c69636f726963652e20546869732069732061207461737465207375726520746f207472616e73706f727420796f75206261636b20696e2074696d652e, 'margerum.jpg'),
(4, 'OWEN ROE "EX UMBRIS"', '2009', 'Syrah', 'USA', 'Washington', 0x41206f6e652d74776f2070756e6368206f6620626c61636b2070657070657220616e64206a616c6170656e6f2077696c6c2073656e6420796f75722073656e736573207265656c696e672c20617320746865206f72616e676520657373656e636520736e61707320796f75206261636b20746f207265616c6974792e20446f6e2774206d6973730a746869732061776172642d77696e6e696e672074617374652073656e736174696f6e2e, 'ex_umbris.jpg'),
(5, 'REX HILL', '2009', 'Pinot Noir', 'USA', 'Oregon', 0x4f6e652063616e6e6f7420646f756274207468617420746869732077696c6c206265207468652077696e65207365727665642061742074686520486f6c6c79776f6f642061776172642073686f77732c20626563617573652069742068617320756e64656e6961626c65207374617220706f7765722e2042652074686520666972737420746f2063617463680a74686520646562757420746861742065766572796f6e652077696c6c2062652074616c6b696e672061626f757420746f6d6f72726f772e, 'rex_hill.jpg'),
(6, 'VITICCIO CLASSICO RISERVA', '2007', 'Sangiovese Merlot', 'Italy', 'Tuscany', 0x54686f75676820736f667420616e6420726f756e64656420696e20746578747572652c2074686520626f6479206f6620746869732077696e652069732066756c6c20616e64207269636820616e64206f682d736f2d61707065616c696e672e20546869732064656c6976657279206973206576656e206d6f726520696d7072657373697665207768656e206f6e652074616b6573206e6f7465206f66207468652074656e6465722074616e6e696e732074686174206c656176652074686520746173746520627564732077686f6c6c79207361746973666965642e, 'viticcio.jpg'),
(7, 'CHATEAU LE DOYENNE', '2005', 'Merlot', 'France', 'Bordeaux', 0x54686f7567682064656e736520616e642063686577792c20746869732077696e6520646f6573206e6f74206f766572706f7765722077697468206974732066696e656c792062616c616e63656420646570746820616e64207374727563747572652e2049742069732061207472756c79206c75787572696f757320657870657269656e636520666f72207468650a73656e7365732e, 'le_doyenne.jpg'),
(8, 'DOMAINE DU BOUSCAT', '2009', 'Merlot', 'France', 'Bordeaux', 0x546865206c6967687420676f6c64656e20636f6c6f72206f6620746869732077696e652062656c696573207468652062726967687420666c61766f7220697420686f6c64732e204120747275652073756d6d65722077696e652c206974206265677320666f722061207069636e6963206c756e636820696e20612073756e2d736f616b65642076696e65796172642e, 'bouscat.jpg'),
(9, 'BLOCK NINE', '2009', 'Pinot Noir', 'USA', 'California', 0x576974682068696e7473206f662067696e67657220616e642073706963652c20746869732077696e65206d616b657320616e20657863656c6c656e7420636f6d706c656d656e7420746f206c69676874206170706574697a657220616e642064657373657274206661726520666f72206120686f6c6964617920676174686572696e672e, 'block_nine.jpg'),
(10, 'DOMAINE SERENE', '2007', 'Pinot Noir', 'USA', 'Oregon', 0x54686f75676820737562746c6520696e2069747320636f6d706c657869746965732c20746869732077696e65206973207375726520746f20706c65617365206120776964652072616e6765206f6620656e7468757369617374732e204e6f746573206f6620706f6d656772616e6174652077696c6c2064656c6967687420617320746865206e757474792066696e69736820636f6d706c65746573207468652070696374757265206f6620612066696e652073697070696e6720657870657269656e63652e, 'domaine_serene.jpg'),
(11, 'BODEGA LURTON', '2011', 'Pinot Gris', 'Argentina', 'Mendoza', 0x536f6c6964206e6f746573206f6620626c61636b2063757272616e7420626c656e64656420776974682061206c6967687420636974727573206d616b6520746869732077696e6520616e206561737920706f757220666f72207661726965642070616c617465732e, 'bodega_lurton.jpg'),
(12, 'LES MORIZOTTES', '2009', 'Chardonnay', 'France', 'Burgundy', 0x427265616b696e6720746865206d6f6c64206f662074686520636c6173736963732c2074686973206f66666572696e672077696c6c20737572707269736520616e6420756e646f75627465646c792067657420746f6e677565732077616767696e672077697468207468652068696e7473206f6620636f6666656520616e6420746f626163636f20696e0a7065726665637420616c69676e6d656e742077697468206d6f726520747261646974696f6e616c206e6f7465732e20427265616b696e6720746865206d6f6c64206f662074686520636c6173736963732c2074686973206f66666572696e672077696c6c20737572707269736520616e640a756e646f75627465646c792067657420746f6e677565732077616767696e672077697468207468652068696e7473206f6620636f6666656520616e6420746f626163636f20696e0a7065726665637420616c69676e6d656e742077697468206d6f726520747261646974696f6e616c206e6f7465732e205375726520746f20706c6561736520746865206c6174652d6e696768742063726f776420776974682074686520736c69676874206a6f6c74206f6620616472656e616c696e65206974206272696e67732e, 'morizottes.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_images`
--
ALTER TABLE `offer_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_details`
--
ALTER TABLE `restaurant_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_bids`
--
ALTER TABLE `voucher_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_owner`
--
ALTER TABLE `voucher_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_resales`
--
ALTER TABLE `voucher_resales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wine`
--
ALTER TABLE `wine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `offer_images`
--
ALTER TABLE `offer_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `restaurant_details`
--
ALTER TABLE `restaurant_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `voucher_bids`
--
ALTER TABLE `voucher_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `voucher_owner`
--
ALTER TABLE `voucher_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `voucher_resales`
--
ALTER TABLE `voucher_resales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wine`
--
ALTER TABLE `wine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
