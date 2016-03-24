-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2016 at 01:20 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `is_active`) VALUES
(1, 'Chinese Food', 0, 1),
(2, 'Western Food', 0, 1),
(3, 'Indonesian Food', 0, 1),
(5, 'Japanese Food', 0, 1),
(7, 'Warong Kopi', 0, 1),
(8, 'Cafe & Bar', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL,
  `page_header` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `page_header`, `title`, `content`, `is_active`) VALUES
(1, 'about-us', 'About Us', 'About Us content Coming Soon.', 1),
(2, 'terms', 'Terms of Use', 'Terms of Use content coming soon.', 1),
(3, 'contact-us', 'Contact Us', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta, justo ac pretium facilisis, dolor erat ultrices risus, vitae condimentum dolor nisl vitae mauris. Curabitur non ultricies risus. Sed viverra enim non lacus congue, in varius nibh convallis. Nullam ornare justo eleifend tortor ultricies lacinia. Vivamus non urna turpis. Suspendisse posuere dolor ac mi condimentum tincidunt. Vestibulum aliquam convallis lectus, a molestie velit. Integer et eros ac neque pulvinar tempus id ullamcorper lectus. Sed vulputate leo mauris, placerat ultrices leo ultricies ac. Cras eleifend, sapien eu fermentum dapibus, nulla nulla rhoncus metus, in lacinia ex nunc sed mi. Aenean fermentum sed mi nec auctor. Mauris vitae arcu posuere, imperdiet mauris eget, dignissim sem. Nullam ultricies velit diam, sit amet feugiat urna tempus in. Nam pretium viverra molestie. Donec tortor tortor, sodales at finibus at, auctor eget ligula.\r\n\r\nVivamus felis ante, porttitor nec dui fringilla, rutrum euismod metus. Aenean tempor dapibus nulla vel tristique. Etiam a posuere turpis. Vivamus lobortis tellus eget urna hendrerit ultrices. Duis in fermentum leo. Duis finibus magna ut nisl vulputate, nec egestas enim sollicitudin. Integer laoreet justo est, nec pharetra erat dignissim eu. Nulla nec sapien est. Duis placerat, erat rutrum iaculis porta, ipsum metus fringilla lacus, non hendrerit elit dui ac felis. Mauris vitae tortor tristique sapien porta scelerisque quis eu massa. Proin orci arcu, euismod sit amet pellentesque at, rutrum id est. Proin eu metus dapibus, interdum neque vitae, accumsan ipsum. Donec pretium lectus nisi, lobortis facilisis purus hendrerit venenatis. ', 1),
(4, 'faq', 'FAQ', ' Sed suscipit diam in ante feugiat congue. Vivamus lacinia arcu sed sapien consectetur laoreet. Phasellus tempus malesuada fermentum. Praesent venenatis urna ut neque condimentum pulvinar. Aenean ac urna ultrices, volutpat tortor a, finibus nisi. Vivamus eu dui ultricies, ultricies mi vel, tristique lectus. Aenean dignissim tortor at odio ullamcorper, sit amet dapibus elit placerat. Integer in eros sit amet tortor volutpat ultrices vel ac quam. Pellentesque mollis non orci sed volutpat. Fusce vel urna lectus. Aliquam porta odio dapibus, lacinia nisl ut, efficitur orci. Suspendisse sit amet augue pharetra, blandit quam vel, mollis lectus. Praesent finibus, ex eget eleifend consectetur, erat purus ullamcorper enim, finibus sollicitudin sem risus vel massa. Nullam consequat malesuada sollicitudin.\r\n\r\nVivamus est risus, imperdiet sit amet eleifend ut, tincidunt sit amet ex. Duis sapien tellus, consequat a felis rutrum, malesuada venenatis mi. Suspendisse semper ac felis non finibus. Integer eu laoreet dui. Ut condimentum molestie fringilla. Vivamus ipsum est, rutrum eu molestie in, dapibus elementum tortor. In sollicitudin at ex quis posuere. Etiam a sollicitudin leo. Curabitur luctus fringilla sapien, id semper libero finibus vel. Duis luctus, nulla sit amet suscipit tincidunt, quam quam sodales ligula, id tincidunt lorem diam vel sapien. Vivamus convallis, lorem eu ultrices lacinia, ex dolor finibus diam, id imperdiet nisl mi ac eros.\r\n\r\nMorbi tempor diam magna, a congue quam accumsan non. Nunc eu justo sed sem interdum iaculis. Praesent maximus elit ac risus finibus varius. Integer quis viverra neque. Nulla at urna porttitor, tempor mauris vel, vulputate magna. Duis neque mauris, dictum fermentum posuere vitae, eleifend non metus. Integer neque quam, feugiat laoreet sagittis non, maximus id lacus. Sed ut felis vitae turpis bibendum cursus. Maecenas quis mauris nec arcu convallis pharetra. Nulla facilisi.\r\n\r\nCurabitur gravida purus tortor, vel gravida mauris dignissim vitae. Phasellus vel nibh vel dui convallis maximus. Duis odio odio, facilisis sit amet malesuada id, scelerisque non ex. Vestibulum a lacinia enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut ut metus blandit, porttitor magna id, sollicitudin magna. Nullam pulvinar leo in interdum ornare.\r\n\r\nNullam felis nunc, eleifend sit amet malesuada non, tristique ut quam. Aliquam vitae gravida mi. Donec hendrerit tristique turpis, ac congue turpis vulputate at. Nunc hendrerit mi euismod diam placerat, et lobortis mi suscipit. Quisque dictum bibendum pellentesque. Cras ultricies quis quam vel suscipit. Fusce sodales nulla metus. Nulla ullamcorper pulvinar suscipit. Duis consectetur, odio in commodo cursus, urna orci tincidunt felis, ut mollis elit elit sed diam. Duis tristique massa eget ex volutpat, ut efficitur ipsum efficitur. Ut auctor fermentum nulla et vestibulum. Donec id orci nulla. Fusce eu luctus elit, id sollicitudin dolor. Praesent venenatis consectetur metus. ', 1),
(5, 'privacy', 'Privacy Policy', ' Nunc vel sapien sit amet metus finibus tempor. Vestibulum ligula ante, aliquet ut orci ut, pharetra laoreet libero. Donec mollis molestie justo id blandit. Maecenas venenatis porta dolor, iaculis scelerisque magna pellentesque eget. Curabitur ac auctor arcu. Curabitur congue, quam vitae congue commodo, nunc dui blandit mauris, eu pulvinar leo nisl et odio. Aliquam erat volutpat. In ut felis eget velit gravida lobortis non vitae orci.\r\n\r\nSed ultricies elementum condimentum. Morbi accumsan tempor iaculis. Donec ut arcu rutrum, placerat ipsum non, pharetra neque. Curabitur placerat scelerisque leo quis semper. Nunc eget lorem magna. In scelerisque sapien ac neque euismod, ut efficitur sapien semper. Fusce maximus a mi sed dictum. Fusce dapibus nunc vel ultricies venenatis. Sed gravida felis eu fermentum porttitor. Nam dapibus nisl a varius aliquam. Curabitur vitae mollis nulla. Donec at mauris suscipit, tincidunt lectus nec, aliquet turpis. Aliquam hendrerit ultricies enim, id commodo nisi congue eget. In tincidunt elementum dolor, vel hendrerit nulla.\r\n\r\nEtiam placerat sagittis ligula, vitae pellentesque massa euismod eu. Sed tincidunt ex sapien, elementum fringilla quam eleifend ac. Phasellus porttitor fermentum pretium. Sed lacinia tellus sed metus pulvinar faucibus. Suspendisse efficitur, mi ut cursus vehicula, elit enim gravida dui, id hendrerit felis dolor ac felis. Pellentesque magna justo, condimentum quis erat pellentesque, mollis pellentesque turpis. In eu feugiat magna. Pellentesque lobortis ligula et tellus fermentum porta. Fusce cursus finibus lorem, et rutrum sem tincidunt non. Cras pretium nunc ac viverra rhoncus. Praesent vestibulum, risus ac euismod posuere, lectus dolor aliquet nisi, et suscipit nunc ipsum a nulla. Suspendisse lobortis iaculis nunc ut rhoncus. Pellentesque commodo sapien erat, nec auctor purus hendrerit id. Aenean efficitur in lorem a vulputate.\r\n\r\nNulla ut nulla est. Aenean placerat eros quam, quis gravida ante sodales ac. Nulla tempor viverra nunc, non euismod nibh tempus sit amet. Vestibulum a mi eu elit porta dignissim cursus iaculis turpis. Sed in ex sit amet lectus mollis hendrerit vel quis risus. Sed suscipit ante et ex consectetur mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut iaculis vehicula turpis, ac vulputate sem gravida venenatis. Nunc at odio in sem aliquam volutpat. Ut condimentum nibh augue, vitae scelerisque eros ornare sit amet. Vestibulum id rhoncus eros. Sed gravida sit amet arcu non malesuada. Ut tincidunt neque nec rhoncus vestibulum. ', 1);

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
-- Table structure for table `interested_swap`
--

DROP TABLE IF EXISTS `interested_swap`;
CREATE TABLE IF NOT EXISTS `interested_swap` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `swap_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `voucher_url` varchar(1000) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interested_swap`
--

INSERT INTO `interested_swap` (`id`, `user_id`, `swap_id`, `date`, `voucher_url`, `voucher_id`, `subject`, `comment`, `status`, `is_active`) VALUES
(5, 2, 3, '2016-03-24 02:29:30', 'http://107.170.152.166/mFood/#/voucherdetail/11', 11, 'rty', 'sd', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `is_active`) VALUES
(1, 'Arsanal', 1),
(2, 'Aminia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location_category_map`
--

DROP TABLE IF EXISTS `location_category_map`;
CREATE TABLE IF NOT EXISTS `location_category_map` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_category_map`
--

INSERT INTO `location_category_map` (`id`, `category_id`, `location_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `is_banner` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image`, `date`, `user_id`, `views`, `is_banner`, `is_active`) VALUES
(2, 'News test 2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'n-pix.png', '2016-03-16 00:00:00', 1, 6, 0, 1),
(3, 'News test 3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'n-pix-n.jpg', '2016-03-09 00:00:00', 1, 13, 0, 1),
(4, 'News test ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'pix1.png', '2016-03-14 00:00:00', 1, 2, 0, 1),
(5, 'News test 5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'pro-1.png', '2016-03-16 00:00:00', 1, 22, 0, 1),
(6, 'Lorem Ipsum', '<p>dfg dfg d</p>\n', '', '2016-03-25 06:53:23', 0, 0, 0, 0),
(7, 'dfgdfgd g', '<p>df gdfg d</p>\n', '', '2016-03-25 06:54:51', 0, 0, 0, 0),
(8, 'hgjghj', '<p>ghjghj</p>\n', '/9j/4AAQSkZJRgABAgEAzQDNAAD/4RqdRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAcAAAAcgEyAAIAAAAUAAAAjodpAAQAAAABAAAApAAAANAAH1mWAAAnEAAfWZYAACcQQWRvYmUgUGhvdG9zaG9wIENTNCBXaW5kb3dzADIwMTI6MDY6MTUgMTI6MDQ6NTM', '2016-03-25 07:42:54', 0, 0, 0, 0),
(9, 'Expired', '<p>gfhfgh</p>\n', '01.jpg', '2016-03-25 10:04:52', 0, 0, 0, 0),
(10, 'Updated By Bikash', '<p>jgh jghj ghj</p>\n', 'VID-20150826-WA0012.mp4', '0000-00-00 00:00:00', 0, 0, 0, 1),
(11, 'New Crepes in Town', '<p>df gdfg</p>\n', '01.jpg', '2016-03-25 10:45:29', 0, 0, 0, 1),
(12, 'Tony Romas Special Promo for New Opening Outlet', '<p>&nbsp;fdfg dfg df Updated</p>\n', 'junk-food-3.jpg', '2016-03-25 10:59:44', 0, 4, 0, 1),
(13, 'mFoodGate Schedules', '<p>We believe, our experiences in providing hospitality business solutions to more than 100 customers in major cities of Indonesia, together with our principles worldwide product will <strong>&ldquo;bring new meaning in partnership..&rdquo;</strong> to&nbsp; you to grow and become the market leader in your hospitality industry.</p>\n\n<p>We invite you to be part of our successful partnership community&hellip;</p>\n\n<p>&nbsp;</p>\n', 'Schedule Planner 2016 - 20160204.pdf', '2016-03-25 17:07:57', 0, 1, 1, 0);

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
  `benefits` text NOT NULL,
  `price` double(10,2) NOT NULL,
  `mpoints` int(11) NOT NULL,
  `offer_price` double(10,2) DEFAULT NULL,
  `offer_percent` int(11) NOT NULL,
  `offer_from_date` datetime NOT NULL,
  `offer_to_date` datetime NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `buy_count` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `special_tag` text NOT NULL,
  `offer_type_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created_on`, `title`, `description`, `benefits`, `price`, `mpoints`, `offer_price`, `offer_percent`, `offer_from_date`, `offer_to_date`, `image`, `is_active`, `merchant_id`, `restaurant_id`, `location`, `lat`, `lng`, `is_featured`, `buy_count`, `category_id`, `city`, `is_special`, `special_tag`, `offer_type_id`) VALUES
(1, '2016-03-17 00:00:00', 'Asia Kitchen by Mainland China', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n\n<h1>Validity</h1>\n\n<ul>\n	<li>Valid until: 30.04.2016</li>\n	<li>Valid 6 days a week (Monday - Saturday)</li>\n	<li>Timings: 12:00 Noon to 10:30PM</li>\n	<li>Offer 4 &amp; 5: Valid for 2 Persons</li>\n	<li>Offers 1, 2 &amp; 3 are valid for dine in &amp; takeaway</li>\n	<li>Offers 4 &amp; 5 are valid for dine-in only</li>\n</ul>\n\n<h1>General Fine Print</h1>\n\n<ul>\n	<li>Prior appointment mandatory (Upon purchase, you will receive a voucher with the reservation number). Rescheduling may result in additional charges</li>\n	<li>For weekend appointments, we recommend calling 2 - 3 days in advance</li>\n	<li>Voucher printout is mandatory</li>\n</ul>\n', '<h1>Benefits</h1> <ul> <li><strong>Offer</strong> Any time 20% off</li> <li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>  year subscription<li><strong>Offer 3: 3</strong> Chicken Biryani</li> <li><strong>Offer 4:</strong> Chinese Combo Meal</li> <li><strong>Offer 5:</strong> Indian Combo Meal</li> </ul>', 23.00, 5, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', '01.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 1, 3, 1, NULL, 1, 'Christmas Promo,Lebaran Promo', 1),
(2, '2016-02-25 00:00:00', 'The Last Supper', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\r\n\r\n<ul>\r\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\r\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\r\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\r\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\r\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\r\n</ul>', 50.00, 10, 45.00, 10, '2016-02-26 00:00:00', '2016-04-06 00:00:00', 'Thamel-Food.jpg', 1, 3, 2, 'Mumbai', '18.9750', '72.8258', 1, 4, 1, NULL, 1, 'Valentine Promo', 2),
(3, '2016-02-25 00:00:00', 'Suruchi Veg Restaurant', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '', 50.00, 10, 45.00, 10, '2016-02-26 00:00:00', '2016-03-31 00:00:00', 'junk-food-3.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 0, '', 1),
(4, '2016-02-25 00:00:00', ' Hotel Shivam Restaurant & Bar', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '', 50.00, 10, 45.00, 10, '2016-02-26 00:00:00', '2016-03-31 00:00:00', 'junk-food.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, 'New Year Promo,Lebaran Promo', 3),
(8, '2016-02-25 00:00:00', 'Pepper Chino - Samilton Hotel', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\r\n\r\n<h1>Highlights</h1>\r\n\r\n<ul>\r\n	<li>Located at Park Street</li>\r\n	<li>Inclusive of all taxes and service charges</li>\r\n</ul>\r\n\r\n<h1>What You Get</h1>\r\n\r\n<ul>\r\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\r\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\r\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\r\n	\r\n</ul>\r\n\r\n<h1>Indian Combo Meal Inclusions:</h1>\r\n\r\n<ul>\r\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\r\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\r\n	<li>Dal (ANY 1)</li>\r\n	<li>Rice (ANY 1)</li>\r\n	<li>Indian Breads (2pcs)</li>\r\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\r\n	\r\n	<li>Rice (ANY 1)</li>\r\n	<li>Noodles / Chop Suey (ANY 1)</li>\r\n	<li>Desserts</li>\r\n</ul>\r\n', '', 100.00, 10, 90.00, 10, '2016-02-26 00:00:00', '2016-03-27 00:00:00', 'healthy-organic-food.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, 'New Year Promo,Lebaran Promo', 2),
(9, '2016-02-25 00:00:00', 'Rang De Basanti Dhaba', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\r\n\r\n<h1>Highlights</h1>\r\n\r\n<ul>\r\n	<li>Located at Park Street</li>\r\n	<li>Inclusive of all taxes and service charges</li>\r\n</ul>\r\n\r\n<h1>What You Get</h1>\r\n\r\n<ul>\r\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\r\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\r\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\r\n	\r\n</ul>\r\n\r\n<h1>Indian Combo Meal Inclusions:</h1>\r\n\r\n<ul>\r\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\r\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\r\n	<li>Dal (ANY 1)</li>\r\n	<li>Rice (ANY 1)</li>\r\n	<li>Indian Breads (2pcs)</li>\r\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\r\n	\r\n	<li>Rice (ANY 1)</li>\r\n	<li>Noodles / Chop Suey (ANY 1)</li>\r\n	<li>Desserts</li>\r\n</ul>\r\n', '', 100.00, 10, 90.00, 10, '2016-02-26 00:00:00', '2016-04-07 00:00:00', '56ae4e020b04512cde6c39ea.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, 'New Year Promo,Lebaran Promo', 3);

-- --------------------------------------------------------

--
-- Table structure for table `offer_images`
--

DROP TABLE IF EXISTS `offer_images`;
CREATE TABLE IF NOT EXISTS `offer_images` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_images`
--

INSERT INTO `offer_images` (`id`, `offer_id`, `image`, `position`) VALUES
(1, 2, '1457623026317684_231_RL_product.jpg', NULL),
(2, 2, '1457624201219497_g-icon.png', NULL),
(3, 2, '1457624219245187_2_2_leftbottom_corner.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offer_types`
--

DROP TABLE IF EXISTS `offer_types`;
CREATE TABLE IF NOT EXISTS `offer_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_types`
--

INSERT INTO `offer_types` (`id`, `name`, `is_active`) VALUES
(1, 'Menu Voucher', 1),
(2, 'Payment Voucher', 1),
(3, 'Merchant Membership', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_paid` enum('U','P','C') NOT NULL DEFAULT 'U' COMMENT '''U'' - Unpaid,''P'' - Paid, ''C'' - Cancel'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `amount`, `payment_id`, `date`, `is_paid`) VALUES
(1, 4, 20.00, 'PAY-2TK53514BM067851GK32S5HY', '2016-03-25 12:27:11', 'P'),
(2, 4, 45.00, 'PAY-68E24476KG286774GK32TV7I', '2016-03-25 13:19:56', 'P'),
(3, 2, 45.00, 'PAY-1C43246098778962SK32TX6Q', '2016-03-25 13:24:10', 'P'),
(4, 2, 20.00, 'PAY-3YC038626J9868549K32TYRI', '2016-03-25 13:25:25', 'P'),
(5, 2, 20.00, 'PAY-3VU36221068361138K32TZRY', '2016-03-25 13:27:35', 'P'),
(6, 4, 90.00, 'PAY-98A27285D7626992HK32UQIA', '2016-03-25 14:16:00', 'P'),
(7, 4, 40.00, 'PAY-66N67491G14470250K32WHSA', '2016-03-25 16:14:00', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `user_id`, `offer_id`, `order_id`, `price`, `offer_price`, `quantity`) VALUES
(1, 4, 1, 1, 23.00, 20.00, 1),
(2, 4, 3, 2, 50.00, 45.00, 1),
(3, 2, 2, 3, 50.00, 45.00, 1),
(4, 2, 1, 4, 23.00, 20.00, 1),
(5, 2, 1, 5, 23.00, 20.00, 1),
(6, 4, 9, 6, 100.00, 90.00, 1),
(7, 4, 1, 7, 23.00, 20.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE IF NOT EXISTS `points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `source` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemed_points` int(11) NOT NULL DEFAULT '0',
  `remaining_points` int(11) NOT NULL,
  `redeemed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `points`, `source`, `date`, `expire_date`, `redeemed_points`, `remaining_points`, `redeemed_date`) VALUES
(1, 4, 10, 'earn by Register Member', '2016-03-02 10:35:55', '2016-03-31 04:00:00', 10, 0, '0000-00-00 00:00:00'),
(2, 4, 10, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-06 04:00:00', 10, 0, '0000-00-00 00:00:00'),
(3, 4, 10, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-22 04:00:00', 10, 0, '0000-00-00 00:00:00'),
(4, 4, 20, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-22 04:00:00', 5, 15, '0000-00-00 00:00:00'),
(5, 4, 20, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-22 04:00:00', 0, 20, '0000-00-00 00:00:00'),
(6, 2, 20, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-22 04:00:00', 0, 20, '0000-00-00 00:00:00'),
(7, 2, 30, 'earn by Register Member', '2016-03-02 10:35:55', '2016-04-22 04:00:00', 0, 30, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `address` text,
  `category_id` int(11) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `user_id`, `title`, `logo`, `address`, `category_id`, `is_featured`) VALUES
(1, 3, 'Salathip at Shangri-La Hotel, Bangkok', '', 'Gc-211, Saltlake, sector -III, Kolkata', 3, 1),
(2, 3, 'Raan thanitha Thai Cuisine', '', 'Park Street, Kolkata', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int(11) NOT NULL,
  `facebook_url` varchar(1500) NOT NULL,
  `twitter_url` varchar(1500) NOT NULL,
  `youtube_url` varchar(1500) NOT NULL,
  `pininterest_url` varchar(1500) NOT NULL,
  `google_store_link` varchar(1500) NOT NULL,
  `app_store_link` varchar(1500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `facebook_url`, `twitter_url`, `youtube_url`, `pininterest_url`, `google_store_link`, `app_store_link`) VALUES
(1, 'https://www.facebook.com/', 'http://twitter.com/', 'https://www.youtube.com/', 'https://www.pinterest.com/', 'https://play.google.com/store?utm_source=apac_med&utm_medium=hasem&utm_content=Jun2515&utm_campaign=evergreen&pcampaignid=MKT-DR-apac-in-all-med-hasem-py-evergreen-Jun2515-1-en-bkws&gclid=Cj0KEQjwzq63BRCrtIuGjImRoIIBEiQAGLHdYT7z3GaJyAPj3q9T0zqoX5Try5Eh6WEgR8Dvh7EEnMgaAscR8P8HAQ&gclsrc=aw.ds', 'https://linkmaker.itunes.apple.com/en-us/');

-- --------------------------------------------------------

--
-- Table structure for table `swap`
--

DROP TABLE IF EXISTS `swap`;
CREATE TABLE IF NOT EXISTS `swap` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `swap`
--

INSERT INTO `swap` (`id`, `voucher_id`, `user_id`, `offer_id`, `is_active`) VALUES
(1, 2, 4, 3, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `merchant_name`, `email`, `username`, `password`, `txt_pwd`, `registration_date`, `is_active`, `user_type_id`, `is_logged_in`, `last_login`, `unique_code`, `is_social_login`, `fb_id`, `image`, `phone`, `about_me`, `media_notification`, `expire_date_notification`, `promo_notification`, `news_letter_notification`, `address`) VALUES
(1, 'admin', 'admin', 'abc', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-12 09:02:28', 1, 1, 0, '2016-03-25 05:03:13', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(2, 'Abhishek', 'Kundu', NULL, 'nits.abhishek85@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '12345', '2016-02-15 10:02:57', 1, 2, 0, '2016-03-25 10:03:52', '123', 0, NULL, '1458903352153779_231_RL_product.jpg', NULL, NULL, 0, 0, 0, 0, ''),
(3, 'krish', NULL, 'abcd', 'nits.krishnendu@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-15 11:02:06', 1, 3, 0, '2016-03-15 06:03:58', NULL, 0, NULL, '1457524492160540_231_RL_product.jpg', '3698745221', 'test', 0, 0, 0, 0, 'kolkata'),
(4, 'Anup', 'Chakraborty', NULL, 'nits.anup@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-16 12:02:27', 1, 2, 0, '2016-03-25 05:03:57', '1455626727299005', 0, NULL, '1457954085503359_profile.png', '968745', 'abcd', 0, 0, 0, 0, ''),
(6, 'Rahul', 'Roy', NULL, 'nits.santanu@gmail.com', NULL, NULL, NULL, '2016-02-22 03:02:46', 1, 2, 0, '2016-02-29 12:02:54', '1456156186779391', 0, '1670701249873793', '1456745423267591_134_man1.jpg', NULL, NULL, 0, 0, 0, 0, ''),
(9, 'Arup', 'Chakraborty', 'a', 'nits.sarojkumar@gmail.com', 'saroj', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-25 08:02:26', 0, 2, 0, NULL, '1456387586434984', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(15, NULL, NULL, NULL, 'nits.ananya15@gmail.com', NULL, '827ccb0eea8a706c4c34a16891f84e7b', '12345', '2016-03-03 06:03:52', 1, 2, 0, '2016-03-03 08:03:57', '1456987192653171', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, ''),
(17, NULL, NULL, NULL, 'deddyokt@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-03-25 04:03:03', 1, 2, 0, '2016-03-25 05:03:39', '1458924543454365', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '');

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
  `offer_percent` int(11) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `offer_id`, `created_on`, `view_id`, `price`, `offer_price`, `offer_percent`, `from_date`, `to_date`, `is_used`, `is_active`) VALUES
(1, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(2, 3, '2016-02-25 00:00:00', '', 50.00, 45.00, 10, '2016-02-26 00:00:00', '2016-03-31 00:00:00', 0, 1),
(3, 2, '2016-02-25 00:00:00', '', 50.00, 45.00, 10, '2016-02-26 00:00:00', '2016-04-06 00:00:00', 0, 1),
(4, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(5, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(6, 9, '2016-02-25 00:00:00', '', 100.00, 90.00, 10, '2016-02-26 00:00:00', '2016-04-07 00:00:00', 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_bids`
--

INSERT INTO `voucher_bids` (`id`, `voucher_id`, `user_id`, `bid_price`, `voucher_resale_id`, `is_accepted`, `m_points`, `is_active`) VALUES
(1, 1, 2, 300, 1, 0, NULL, 1),
(2, 4, 4, 150, 2, 0, NULL, 1),
(3, 1, 1, 251, 1, 0, NULL, 1);

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
  `offer_percent` double(10,2) NOT NULL,
  `buy_price` double(10,2) NOT NULL,
  `transfer_type` varchar(255) NOT NULL COMMENT '"Gift" / ""'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_owner`
--

INSERT INTO `voucher_owner` (`id`, `offer_id`, `voucher_id`, `voucher_view_id`, `from_user_id`, `to_user_id`, `purchased_date`, `sold_date`, `is_active`, `price`, `offer_price`, `offer_percent`, `buy_price`, `transfer_type`) VALUES
(1, 1, 1, '', 0, 4, '2016-03-25 12:28:34', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(2, 3, 2, '', 0, 4, '2016-03-25 01:21:07', '0000-00-00 00:00:00', 1, 50.00, 45.00, 10.00, 45.00, ''),
(3, 2, 3, '', 0, 2, '2016-03-25 01:24:35', '0000-00-00 00:00:00', 1, 50.00, 45.00, 10.00, 45.00, ''),
(4, 1, 4, '', 0, 2, '2016-03-25 01:25:58', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(5, 1, 5, '', 0, 2, '2016-03-25 01:27:53', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(6, 9, 6, '', 0, 4, '2016-03-25 02:16:56', '0000-00-00 00:00:00', 1, 100.00, 90.00, 10.00, 90.00, '');

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
  `is_active` tinyint(1) NOT NULL,
  `voucher_bid_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_resales`
--

INSERT INTO `voucher_resales` (`id`, `voucher_id`, `price`, `points`, `user_id`, `is_sold`, `created_on`, `sold_on`, `is_active`, `voucher_bid_id`) VALUES
(1, 1, 200.00, 0, 4, 0, '2016-03-25 12:03:42', '0000-00-00 00:00:00', 1, 0),
(2, 4, 100.00, 0, 2, 0, '2016-03-25 01:03:36', '0000-00-00 00:00:00', 1, 0),
(3, 3, 500.00, 0, 2, 0, '2016-03-25 01:03:29', '0000-00-00 00:00:00', 1, 0);

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
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interested_swap`
--
ALTER TABLE `interested_swap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_category_map`
--
ALTER TABLE `location_category_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
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
-- Indexes for table `offer_types`
--
ALTER TABLE `offer_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swap`
--
ALTER TABLE `swap`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `interested_swap`
--
ALTER TABLE `interested_swap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `location_category_map`
--
ALTER TABLE `location_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `offer_images`
--
ALTER TABLE `offer_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `offer_types`
--
ALTER TABLE `offer_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `swap`
--
ALTER TABLE `swap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `voucher_bids`
--
ALTER TABLE `voucher_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `voucher_owner`
--
ALTER TABLE `voucher_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
