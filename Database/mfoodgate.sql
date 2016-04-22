-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 20, 2016 at 12:59 PM
-- Server version: 5.5.47-MariaDB
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
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `ad_image` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `position` varchar(255) NOT NULL COMMENT 'top/bottom',
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `is_active`) VALUES
(1, 'Chinese Food', 0, 1),
(2, 'Western Food', 0, 1),
(3, 'Indonesian Food', 0, 1),
(5, 'Japanese Food', 0, 1),
(8, 'Cafe & Bar', 0, 1),
(9, 'Italian', 0, 1),
(10, 'Asian', 0, 1),
(11, 'Foodcourt', 0, 1);

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People''s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People''s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'YU', 'Yugoslavia'),
(244, 'ZR', 'Zaire'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_on` datetime NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('O','C','E') NOT NULL DEFAULT 'O' COMMENT '''O'' - OPen, ''C'' - Completed,''E'' - Expired'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `description`, `created_on`, `from_date`, `to_date`, `image`, `is_active`, `status`) VALUES
(1, 4, 'dse', 'sdsdg', '2016-04-04 14:28:08', '2016-04-13 00:00:00', '2016-04-14 00:00:00', 'red-curry.jpg', 0, 'O'),
(2, 4, 'dse', 'sdsdg', '2016-04-04 14:29:14', '2016-04-13 00:00:00', '2016-04-29 00:00:00', 'red-curry.jpg', 0, 'C'),
(3, 4, 'fdgdf', 'gdfg', '2016-04-06 12:22:22', '2016-04-12 00:00:00', '2016-04-28 00:00:00', 'red-curry.jpg', 0, 'C'),
(4, 4, 'fdgdf', 'gdfg', '2016-04-06 12:23:57', '2016-04-12 00:00:00', '2016-04-13 00:00:00', 'red-curry.jpg', 0, 'O'),
(5, 4, 'fghfgh', 'fghfgh', '2016-04-06 12:30:56', '2016-04-06 00:00:00', '2016-04-07 00:00:00', 'red-curry.jpg', 0, 'O'),
(6, 4, 'fghfgh', 'fghfgh', '2016-04-06 12:32:05', '2016-04-06 00:00:00', '2016-04-07 00:00:00', 'red-curry.jpg', 0, 'O'),
(7, 4, 'Dodol 3', 'fghfgh', '2016-04-06 12:32:37', '2016-04-06 00:00:00', '2016-04-07 00:00:00', 'red-curry.jpg', 0, 'O'),
(8, 4, 'Dodol 2', 'fghfgh', '2016-04-06 12:33:22', '2016-04-06 00:00:00', '2016-04-07 00:00:00', 'red-curry.jpg', 0, 'O'),
(9, 4, 'Dodol', 'fghfgh', '2016-04-06 12:34:04', '2016-04-06 00:00:00', '2016-04-07 00:00:00', 'red-curry.jpg', 0, 'E'),
(10, 4, 'Forex Signal Seminar', 'Forex Signal Seminar for Professional', '2016-04-06 13:18:23', '2016-04-28 00:00:00', '2016-04-28 00:00:00', 'forexsignal.jpg', 1, 'O'),
(11, 4, 'Cooking Competitiom', 'Cooking Competition for Junior Chef', '2016-04-07 11:00:03', '2016-04-20 00:00:00', '2016-04-22 00:00:00', 'red-curry.jpg', 1, 'O'),
(12, 17, 'Annual Report Meeting', 'Lunch and 2 coffee break\nInfocus and Screen', '2016-04-14 15:03:23', '2016-04-21 00:00:00', '2016-04-21 00:00:00', 'logo2.png', 1, 'O'),
(13, 4, '', '', '2016-04-19 09:47:49', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', 0, 'O'),
(14, 4, '', '', '2016-04-19 12:25:19', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', 0, 'O'),
(15, 4, '', '', '2016-04-19 12:35:38', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', 0, 'O');

-- --------------------------------------------------------

--
-- Table structure for table `event_bids`
--

DROP TABLE IF EXISTS `event_bids`;
CREATE TABLE IF NOT EXISTS `event_bids` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `is_accepted` tinyint(2) NOT NULL DEFAULT '0' COMMENT '''0'' - pending, ''1'' - accepted,''2'' - Rejected'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_bids`
--

INSERT INTO `event_bids` (`id`, `event_id`, `user_id`, `price`, `description`, `is_accepted`) VALUES
(1, 2, 18, 56, 'dsf sdf sdfs', 1),
(2, 11, 3, 250, 'test test', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_category_map`
--

DROP TABLE IF EXISTS `event_category_map`;
CREATE TABLE IF NOT EXISTS `event_category_map` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_category_map`
--

INSERT INTO `event_category_map` (`id`, `event_id`, `category_id`) VALUES
(27, 11, 5),
(28, 10, 2),
(29, 10, 3),
(34, 9, 2),
(35, 9, 3),
(38, 8, 2),
(39, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `event_images`
--

DROP TABLE IF EXISTS `event_images`;
CREATE TABLE IF NOT EXISTS `event_images` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_images`
--

INSERT INTO `event_images` (`id`, `event_id`, `image`) VALUES
(1, 1, 'red-curry.jpg'),
(2, 1, '232_RL_product.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `event_location_map`
--

DROP TABLE IF EXISTS `event_location_map`;
CREATE TABLE IF NOT EXISTS `event_location_map` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_location_map`
--

INSERT INTO `event_location_map` (`id`, `event_id`, `location_id`) VALUES
(21, 11, 2),
(22, 10, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interested_swap`
--

INSERT INTO `interested_swap` (`id`, `user_id`, `swap_id`, `date`, `voucher_url`, `voucher_id`, `subject`, `comment`, `status`, `is_active`) VALUES
(5, 2, 3, '2016-03-24 02:29:30', 'http://107.170.152.166/mFood/#/voucherdetail/11', 11, 'rty', 'sd', '', 1),
(6, 4, 2, '2016-04-19 12:10:26', 'http://107.170.152.166/mFood/#/voucherdetail/12', 12, 'hi2', 'hello2', '', 1),
(7, 4, 3, '2016-04-19 12:29:14', 'http://107.170.152.166/mFood/#/voucherdetail/12', 12, 'hello', 'hii', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city`, `country_id`, `is_active`) VALUES
(1, 'Surabaya', 101, 1),
(2, 'Bandung', 101, 1),
(5, 'Jakarta', 101, 1),
(6, 'Bali', 101, 1),
(7, 'Medan', 101, 1);

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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`) VALUES
(1, 'nits.bikash@gmail.com'),
(2, 'nits.anup@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `membership_map`
--

DROP TABLE IF EXISTS `membership_map`;
CREATE TABLE IF NOT EXISTS `membership_map` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `membership_name` varchar(255) NOT NULL,
  `membership_id` varchar(255) NOT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `promo_id` varchar(255) NOT NULL COMMENT 'Foreign kkey of Offers table',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership_map`
--

INSERT INTO `membership_map` (`id`, `member_id`, `membership_name`, `membership_id`, `merchant_id`, `promo_id`, `start_date`, `expire_date`, `created_on`) VALUES
(1, 0, 'updated', '545', '3', '2', '2016-04-19 10:46:44', '2016-04-29 04:00:00', '2016-04-19 13:35:44'),
(4, 0, 'new', '545', '87', '3242', '1970-01-01 05:00:00', '0000-00-00 00:00:00', '2016-04-19 15:02:25'),
(5, 0, 'new', '545', '87', '3242', '1970-01-01 05:00:00', '0000-00-00 00:00:00', '2016-04-20 10:20:49'),
(6, 1, 'new', '545', '87', '3242', '1970-01-01 05:00:00', '0000-00-00 00:00:00', '2016-04-20 10:46:59'),
(7, 2, 'new', '545', '87', '3242', '1970-01-01 05:00:00', '0000-00-00 00:00:00', '2016-04-20 10:47:18'),
(8, 2, 'new', '545', '87', '3242', '1970-01-01 05:00:00', '0000-00-00 00:00:00', '2016-04-20 10:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''1'' - Active, ''0'' - Inactive'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `user_id`, `title`, `description`, `image`, `price`, `status`) VALUES
(1, 0, 'Lorem Ipsum', 'Lorem ipsum doller sit amet', '', 254.00, 0),
(2, 3, 'dfgdfg', ' fdgdfg dfg ', '', 120.00, 0),
(3, 3, 'fgh fg', 'h fgh fgh', '', 0.00, 0),
(4, 3, 'hj g', 'jhgj ghj', '', 0.00, 0),
(5, 3, 'fg dfg d', 'fg dfgdfg', '', 0.00, 1),
(6, 3, 'gfhfgh', 'fghfg', '', 0.00, 1),
(7, 3, '', '', '01.jpg', 0.00, 0),
(8, 3, 'dgdf', 'g dfg dfg ', '01.jpg', 0.00, 1),
(9, 3, 'fghfg', 'hfgh', '01.jpg', 0.00, 0),
(10, 3, 'j ', 'hgjgf j', '01.jpg', 0.00, 0),
(11, 3, 'Lorem Ipsum Doller Sit Amet', 'sdf sdfs df', '', 250.00, 1),
(12, 3, 'fgfgh', 'gfhfgh', 'fast-food.jpg', 0.00, 1),
(13, 3, 'Tom Yum Gung', 'This Thai masterpiece soup is teeming with shrimp, mushrooms, tomatoes, lemongrass, galangal and kaffir lime leaves. It can be ordered loaded with coconut milk (tom yum gung nam kohn) and cream or without (tom yum gung nam sai) for a slightly more sour and healthy version. This soup truly unifies a host of favorite Thai tastes: sour, salty, spicy and sweet, all in one bowl. This is an authentic Thai delicacy that many locals are passionate about and has spread around the world. ', 'healthfitnessrevolution-com.jpg', 200.00, 1),
(14, 3, 'Gang Som Pak Ruam', 'The Thai fusion of sweet, sour and spicy are all combined into another ultra vibrant soup. This soup base can be packed with vegetables like carrots, cabbage and green beans (pak ruam) or it can be served with a deep fried omelet made from eggs and a stringy green vegetable leaf (Thai acacia leaf) called cha om (gang som cha om kai).', 'thai.jpg', 300.00, 0),
(15, 18, 'Gaeng Daeng (Red Curry) Updated', 'Made with morsels of meat, red curry paste, smooth coconut milk and topped off with a sprinkling of finely sliced kaffir lime leaves, this rich, aromatic curry always gets those taste buds tingling. At its best when the meat is stunningly tender, it could be likened to a beautiful woman: it''s mild, sweet and delicately fragrant. And like all true love affairs, absence makes the heart grow fonder.', 'food-04.jpg', 250.00, 0),
(16, 18, 'Khao Pad (Fried Rice)', 'Fried rice, egg, onion, a few herbs - nothing more, nothing less. A popular lunch dish served typically with a wedge of lime and slices of cucumber, the secret of this unpretentious dish lies in its simplicity. The concept is this: you''re the one devouring it, so you dress it. To do so, Thais use everything from prawns, crab or chicken to basil, chili and left-over vegetables, in the process turning an unremarkable pauper into a gastronomic prince!', 'american-food-1.jpg', 253.00, 1),
(17, 18, 'Loghjrem ipsum5555hjghj', 'fghfgh', 'Thamel-Food.jpg', 123.00, 0),
(18, 18, 'Updated Menu', 'dfsdfsdf', 'thai.jpg', 350.00, 0),
(19, 18, 'fghfg', 'hfghf', '', 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `merchant_category_map`
--

DROP TABLE IF EXISTS `merchant_category_map`;
CREATE TABLE IF NOT EXISTS `merchant_category_map` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchant_category_map`
--

INSERT INTO `merchant_category_map` (`id`, `user_id`, `category_id`) VALUES
(151, 17, 1),
(152, 17, 3),
(153, 17, 5),
(202, 4, 2),
(203, 4, 2),
(204, 4, 2),
(205, 4, 2),
(206, 4, 2),
(207, 4, 2),
(208, 4, 2),
(209, 4, 2),
(210, 4, 2),
(211, 4, 2),
(212, 4, 2),
(213, 4, 2),
(214, 4, 2),
(215, 4, 2),
(216, 4, 2),
(217, 4, 2),
(218, 4, 3),
(219, 4, 3),
(220, 4, 3),
(221, 4, 3),
(222, 4, 3),
(223, 4, 3),
(224, 4, 3),
(225, 4, 3),
(226, 4, 3),
(227, 4, 3),
(228, 4, 3),
(229, 4, 3),
(230, 4, 3),
(231, 4, 3),
(232, 4, 3),
(233, 4, 3),
(234, 4, 5),
(235, 4, 5),
(236, 4, 5),
(237, 4, 5),
(238, 4, 5),
(239, 4, 5),
(240, 4, 5),
(241, 4, 5),
(242, 4, 5),
(243, 4, 5),
(244, 4, 5),
(245, 4, 5),
(246, 4, 5),
(247, 4, 5),
(248, 4, 5),
(249, 4, 5),
(250, 4, 2),
(251, 4, 2),
(252, 4, 2),
(253, 4, 2),
(254, 4, 2),
(255, 4, 2),
(256, 4, 2),
(257, 4, 2),
(258, 4, 2),
(259, 4, 2),
(260, 4, 2),
(261, 4, 2),
(262, 4, 2),
(263, 4, 2),
(264, 4, 2),
(265, 4, 2),
(266, 4, 3),
(267, 4, 3),
(268, 4, 3),
(269, 4, 3),
(270, 4, 3),
(271, 4, 3),
(272, 4, 3),
(273, 4, 3),
(274, 4, 3),
(275, 4, 3),
(276, 4, 3),
(277, 4, 3),
(278, 4, 3),
(279, 4, 3),
(280, 4, 3),
(281, 4, 3),
(282, 4, 5),
(283, 4, 5),
(284, 4, 5),
(285, 4, 5),
(286, 4, 5),
(287, 4, 5),
(288, 4, 5),
(289, 4, 5),
(290, 4, 5),
(291, 4, 5),
(292, 4, 5),
(293, 4, 5),
(294, 4, 5),
(295, 4, 5),
(296, 4, 5),
(297, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `merchant_location_map`
--

DROP TABLE IF EXISTS `merchant_location_map`;
CREATE TABLE IF NOT EXISTS `merchant_location_map` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchant_location_map`
--

INSERT INTO `merchant_location_map` (`id`, `user_id`, `location_id`) VALUES
(11, 18, 1),
(12, 18, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image`, `date`, `user_id`, `views`, `is_banner`, `is_active`) VALUES
(2, 'â€œI have been inside the kitchen since I was 14 years old â€“ I am 28 nowâ€', '<h4 class="p1" style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; line-height: 30px; color: rgb(51, 51, 51); margin: 0px 0px 30px; font-size: 21px;">Chef Giorgio is constantly traveling between both restaurants where he heads lunch, dinner and dessert, all by customer request. The Zomato team recently went behind the restaurant&rsquo;s doors to catch up with the Chef to get a glimpse into cooking up the classic Italian dishes in a dynamic and fast-paced country like the UAE.</h4>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">&nbsp;</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">How long have you lived in Abu Dhabi?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">I have been here for three and a half years, going on four in April.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Where are you from?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">I am originally Italian, from Genova, the city of pesto sauce and focaccia.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Where were you before coming to the UAE?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">From Italy I went to work in London as a chef. That was a very different experience and I was so young, and I learned a lot from being there.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">How long have you been cooking for?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">I have always been passionate about cooking; it&rsquo;s a part of my upbringing and lifestyle. So much so that I have been inside the kitchen since I was 14 years old &ndash; I am 28 now.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">What&rsquo;s your favourite dish to cook?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">I always love making starters, but also I love making the&nbsp;<em>real</em>, Italian tagliatelle for those who never tried authentic Italian food before. A lot of restaurants offer this dish and a lot of people abroad have tried it, but not the true Italian&nbsp;tagliatelle. That comes from ancient recipes from Italy.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Can you tell us what your day looks like as a chef?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">I wake up very early to go pick up fresh produce and ingredients to be used during the day in our menu. Then I go to our Khalifa Park restaurant in Abu Dhabi where I prepare the daily buffet with my staff. I change the buffet every day on the basis of the fresh ingredients I could find in the morning or else people will get bored of the same thing. Just yesterday, I was deciding what dessert to make for the buffet and I came up with a completely new chocolate whipped cake. In the afternoon, I come to the Marina Square First Clique location and interact with the customers. We have a lot of regulars here and I often take requests as to what they would like to try or what they&rsquo;re in the mood for. At night is when I make my specials. Anything from dinners to desserts, this is where I get very hands on in my dishes. During the weekend Khalifa Park restaurant is closed so I spent all my time in Marina Square Reem island restaurant.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Are there any food trends you have noticed that people like here in the UAE?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Everyone loves spaghetti seafood. I would say it&rsquo;s our most popular dish and people always come back for it. But people also love a good old fashion Italian pizza!</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">What&rsquo;s the difference, if any, from cooking in Italy and then in London and now in UAE?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">For me, honestly, there is no big difference. I cook with passion and don&rsquo;t let the location hinder my creations. At the end of the day, it&rsquo;s all about access to ingredients and most of these ingredients can be found here, in the UAE. Once I have my ingredients, my kitchen can be anywhere.</p>\n', 'GIORGIO3-e1457951140957.jpg', '2016-03-16 00:00:00', 1, 17, 0, 1),
(3, 'Restaurants infuse tea into wide range of menu items', '<p><span style="color: rgb(51, 51, 51); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; font-weight: bold;">The popularity of tea in dishes is strengthening among consumers</span></p>\n\n<div class="content-tools" style="overflow: hidden; margin-bottom: 1em; width: 595px; color: rgb(51, 51, 51); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif;">\n<div class="byline-date">\n<div class="byline" style="line-height: 1.3; font-size: 12px;"><span class="publish-date" style="line-height: 1.3; font-style: italic; float: right; padding-left: 0.5em;">Apr 12, 2016</span><span class="author-name" style="font-weight: bold;"><a href="http://nrn.com/author/fern-glazer" rel="author" style="color: rgb(14, 95, 139);">Fern Glazer</a></span></div>\n</div>\n</div>\n\n<div class="content clear-block" style="font-family: Georgia, Times, ''Times New Roman'', serif; color: rgb(51, 51, 51);">\n<div class="node-body article-body">\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em;">If you were to read the tea leaves, they would surely point to this: Tea is trending on menus &mdash; not as a British-style break or post-meal calm down &mdash; as an ingredient in appetizers, entr&eacute;es and other main menu items.&nbsp;</p>\n</div>\n</div>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">Like a tea bag newly dunked in hot water, it&rsquo;s a trend that has not yet reached its full strength, but one that is already showing strong growth and potential.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">According to Datassential MenuTrends, tea as an ingredient is currently found on just 2 percent of menus in appetizers, entr&eacute;es or side dishes. Though the penetration is small so far, tea is growing, appearing on 20 percent more menus than it did four years ago, and 6 percent more menus than just a year ago.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">At Sable Kitchen &amp; Bar in Chicago, executive&nbsp;<span class="keyword_link"><a href="http://nrn.com/menu/chef-insights" style="color: rgb(14, 95, 139);" title="More Info">chef</a></span>&nbsp;Lawrence Letrero draws on his Asian heritage by offering tea-smoked duck flatbread. Letrero takes the traditional northern Chinese technique of smoking dried chicken with tea-infused wood, and applies it to duck. The tea-smoked duck is shredded and then added to a wood-fired flatbread pizza with house-made hoisin sauce, pickled carrots and daikon.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">&ldquo;Depending on the type of tea you use, it can add a very distinct, earthy flavor,&rdquo; Letrero said. &ldquo;I like smoking tea because it imparts more depth and adds another dimension to the flavor layers of the dish.&rdquo;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">Added to the menu last November, Letrero says the duck flatbread sells very well. He said he plans to continue to experiment with tea on his spring menu, this the time with genmaicha, a toasted rice tea. He&rsquo;s still playing with ingredients for the new item, but says he&rsquo;s leaning towards scallops with bonito flakes, sweet corn and toasted rice tea steeped with dashi.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">MOzen Bistro, an Asian restaurant at the Mandarin Oriental in Las Vegas, is using tea as an ingredient for its health and wellness benefits. The restaurant is currently serving a Green Tea Waffle at brunch. It&rsquo;s made with stone-ground matcha tea powder and served alongside lychee compote and a passion fruit cr&egrave;me.&nbsp;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">&ldquo;We have taken a wellness and healthy approach in our menu creation. We planned to put this together in our new &agrave; la carte brunch menu and came up with the green tea matcha waffle,&rdquo; executive chef David Werly said.&nbsp;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">Introduced to the brunch menu in October, the green tea waffle has become a customer favorite.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">While tea is most commonly menued at restaurants serving Asian cuisines, it&rsquo;s spreading to other restaurants, too.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">At American Tea Room&rsquo;s Southern California locations, culinary director Valerie Gordon has created several innovative tea-infused savory dishes, such as a Chai Chicken Sandwich, which features organic chicken, apple and red onion in a chai curry sauce over Asian slaw; and Lapsang Souchong Short Rib Sandwich, made with Lapsang Souchong braised short rib served on thickly sliced Texas toast with roasted baby carrots.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">Additionally, Flatbush Farm, a farm-to-table concept in Brooklyn, N.Y., recently had on its seasonal menu risotto with domestic mushrooms, braised kale, salsify and black tea broth. Blue Smoke in New York City recently offered an early winter kale salad with sweet tea pecans, pickled grapes, carrots, red onion and buttermilk herb dressing.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">The potential for tea can be seen not just in the creative ways some chefs are menuing it, but also in that it has already popped up on menus at two national restaurant chains. &nbsp;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">When chef Cliff Pleau joined&nbsp;<span class="keyword_link"><a href="http://nrn.com/top-100/bonefish-grill" style="color: rgb(14, 95, 139);" title="Bonefish Grill">Bonefish Grill</a></span>&nbsp;in October 2014 as vice president of research and development, one of his first menu changes was adding steamed edamame sprinkled with green tea sea salt.<br />\n&nbsp;<br />\n&ldquo;We wanted to enhance the flavor and make it a little exotic, yet keep it simple,&rdquo; Pleau said. &ldquo;The green tea and the sea salt mix provide a subtle ethnic flavor coupled with an aromatic quality.&rdquo;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">Additionally, P.F. Chang&rsquo;s last year added to its menu an Oolong Chilean Sea Bass, featuring a line-caught, tea-marinated fillet broiled in sweet ginger soy and served over warm spinach.</p>\n\n<div class="related-content popular-now" style="background-color: rgb(248, 248, 248); border-width: 1px 0px; border-style: solid; border-color: rgb(204, 204, 204); padding: 10px 8px 6px 14px; margin: 0.5em 0px; display: inline-block; width: 573px; color: rgb(51, 51, 51); font-family: Georgia, Times, ''Times New Roman'', serif;">&nbsp;</div>\n', 'GreenTeaWaffle_600.jpg', '2016-03-09 00:00:00', 1, 19, 0, 1),
(4, 'Report: Restaurants report anemic February same-store sales growth', '<p><span style="color: rgb(51, 51, 51); font-size: 15px; font-family: Georgia, Times, ''Times New Roman'', serif;">The restaurant industry posted a same-store sales increase in February, after&nbsp;</span><a href="http://nrn.com/black-box/report-restaurant-same-store-sales-dip-negative-january" style="font-size: 15px; font-family: Georgia, Times, ''Times New Roman'', serif; color: rgb(14, 95, 139);">reporting disappointing January results</a><span style="color: rgb(51, 51, 51); font-size: 15px; font-family: Georgia, Times, ''Times New Roman'', serif;">, but the growth was far from robust.</span></p>\n\n<div class="content clear-block" style="font-family: Georgia, Times, ''Times New Roman'', serif;">\n<div class="node-body article-body">\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51);">February&rsquo;s anemic same-store sales growth of 0.4 percent continues to fuel fears that consumer spending at restaurants has slowed to a crawl, according to data reported by TDn2K&rsquo;s Black Box Intelligence through The Restaurant Industry Snapshot, based on weekly sales from over 23,000 restaurant units and more than 120 brands, representing $57 billion dollars in annual revenue.</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51);">The average growth rate reported for the five months since the beginning of the third quarter last year has been 0.1 percent.&nbsp;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51);">Several external factors outside the economy and consumer sentiment impacted sales in February, according to Victor Fernandez, executive director of insights and knowledge for TDn2K.On one hand, the 2015 Super Bowl was included in January&rsquo;s numbers, while this year, the game was played a week later and fell within February&rsquo;s results,&rdquo; Fernandez said. &ldquo;This meant February&rsquo;s restaurant same-store sales were negatively impacted by the shift, since restaurant sales are hurt by this event (especially true for full-service restaurants more dependent on the dinner daypart). On the other hand, severe winter weather continued to be a factor during February. As an example, the third week of the month saw same-store sales growth over 6 percent boosted by regions in the eastern part of the country that experienced soft sales comparisons due to bad weather last year, and which posted sales growth rates above 14 percent for the week.&rdquo;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51);">&nbsp;<br />\nSales growth in February was also challenging for the industry because of its strong performance a year ago. At 2.3-percent growth, February 2015 is tied with June for the best month based on same-store sales growth during the last 13 months. On a two-year basis, same-store sales growth was about 2.7 percent in February, boosted by an increase of almost 5 percent in average check.<br />\n&nbsp;<br />\nSame-store traffic fell 1.3 percent in February, an improvement of 1.8 percent from January&rsquo;s results, and the best traffic performance since September 2015. Although traffic growth is also affected by the same external factors that affect sales, there was an interesting dynamic regarding average check in February that may also be driving traffic improvement during the month.&nbsp;</p>\n\n<p style="margin-top: 1em; margin-bottom: 1em; font-size: 15px; line-height: 1.48em; color: rgb(51, 51, 51);">Average check grew only 1.8 percent in February, the lowest increase in almost two years. The slowdown in average check growth in February compared with the previous months suggests that brands may be relying more on price promotions to address consumer dining patterns.<br />\n&nbsp;<br />\nThe best performing region in February based on same-store sales growth was New England. This region benefited from favorable sales comparisons. New England had the worst same-store sales growth in February 2015. Weather has played a major part in this region&rsquo;s results during the winter months over the last few years. The opposite occurred in Florida, which was the softest region in February 2016, but among the nation&rsquo;s strongest a year ago.<br />\n&nbsp;<br />\nThe softness of February&rsquo;s sales results can also be seen at the individual market level. Only 95 of the 193 DMAs covered by Black Box Intelligence, or 49 percent, achieved positive same-store sales growth during the month.<br />\n&nbsp;<br />\n&ldquo;With the winter winding down, we should begin to see the true trend in consumer spending,&rdquo; said Joel Naroff, president of Naroff Economic Advisors and TDn2K economist. &ldquo;Right now, consumption is decent but not great. Government figures for January restaurant sales were down, the first negative month in two years. Since both declines were January sales figures, we need to look past any temporary factors and ask the question: Can household spending hold up? If you look at the income data, wages and salaries are rising at an accelerating pace. Job growth so far this year has been much stronger than anticipated. With confidence in good shape despite the issues in the stock markets, it appears that consumer demand for all types of goods and services should start rising with the better weather. The expectation is that we will see a rebound in the March numbers and sales and traffic should be solid the remainder of the year.&rdquo;</p>\n</div>\n</div>\n', '400.png', '2016-03-14 00:00:00', 1, 2, 0, 1),
(5, '25 Rapid-Fire Questions with Chef Matt Basile of Fidel Gastroâ€™s', '<h4 class="p1" style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; line-height: 30px; color: rgb(51, 51, 51); margin: 0px 0px 30px; font-size: 21px;">What you may not know is that Fidel Gastro&rsquo;s started off as a pop up, with Matt selling street food in Toronto&rsquo;s underground markets. Prior to that, Matt was working a cubicle job, far from a kitchen, where his indisputable talent would soon make a splash in the food scene.</h4>\n\n<h4 class="p1" style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; line-height: 30px; color: rgb(51, 51, 51); margin: 0px 0px 30px; font-size: 21px;"><span style="font-size: 15px;">Following the success of his pop-up events, Matt and his team launched the Fidel Gastro&rsquo;s food truck, also known as &ldquo;Priscilla&rdquo;, which was&nbsp;</span><span style="font-size: 15px; color: rgb(0, 0, 255);"><a href="http://www.canadianliving.com/food/cooking_school/canadas_best_food_trucks.php" style="color: rgb(0, 0, 255);">voted Canada&rsquo;s #1 food truck</a>&nbsp;</span><span style="font-size: 15px;">by Canadian Living Magazine. But they weren&rsquo;t done yet &ndash; the FG team opened brick &amp;&nbsp;mortar restaurant,&nbsp;</span><a href="https://www.zomato.com/toronto/lisa-marie-trinity-bellwoods" style="font-size: 15px; color: rgb(0, 0, 0);">Lisa Marie</a><span style="font-size: 15px;">, in downtown Toronto. Matt has also hosted TV program&nbsp;</span><span style="font-size: 15px; color: rgb(0, 0, 255);"><a href="http://www.cookingchanneltv.com/shows/rebel-without-a-kitchen.html" style="color: rgb(0, 0, 255);">Rebel Without A Kitchen</a></span><span style="font-size: 15px;">, appeared on The Food Network&rsquo;s hit show&nbsp;</span><span style="font-size: 15px; color: rgb(0, 0, 255);"><a href="http://eatst.foodnetwork.ca/tvshow/featured_cart/234/fidel-gastro/" style="color: rgb(0, 0, 255);">Eat Street</a></span><span style="font-size: 15px;">&nbsp;and released his first cookbook,&nbsp;</span><span style="font-size: 15px; color: rgb(0, 0, 255);"><a href="http://www.fidelgastros.com/streetfooddiaries.html" style="color: rgb(0, 0, 255);">Street Food Diaries</a></span><span style="font-size: 15px;">, in October 2014.</span></h4>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Favourite ingredient to cook with?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Fresh lemon but recently it&rsquo;s been root beer.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Favourite Toronto restaurant?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Pai is amazing.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Ingredient you&rsquo;re most afraid of?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Tofu &ndash; not my thing.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">Celebrity you would love to cook for?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Larry David.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;">What would you make Larry?</h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Oh, ribs for sure.</p>\n', 'Matt-Head-Shot-New-300x283.png', '2016-03-16 00:00:00', 1, 27, 0, 1),
(6, 'Lorem Ipsum', '<p>dfg dfg d</p>\n', '', '2016-03-25 06:53:23', 0, 0, 0, 0),
(8, 'hgjghj', '<p>ghjghj</p>\n', '/9j/4AAQSkZJRgABAgEAzQDNAAD/4RqdRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAcAAAAcgEyAAIAAAAUAAAAjodpAAQAAAABAAAApAAAANAAH1mWAAAnEAAfWZYAACcQQWRvYmUgUGhvdG9zaG9wIENTNCBXaW5kb3dzADIwMTI6MDY6MTUgMTI6MDQ6NTM', '2016-03-25 07:42:54', 0, 0, 0, 0),
(9, 'Expired', '<p>gfhfgh</p>\n', '01.jpg', '2016-03-25 10:04:52', 0, 0, 0, 0),
(11, 'â€œOnce I get going, there is a momentum like a Bulldozerâ€', '<h4 class="p1" style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; line-height: 30px; color: rgb(51, 51, 51); margin: 0px 0px 30px; font-size: 21px;">We spoke with the chef about Nicli Antica Pizzeria, Italian food, his nickname and of course, pizza.</h4>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">&nbsp;</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">Tell me about the Nicli Antica Pizzeria: How was it started? What was the concept?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Bill McCaig, the owner of Nicli Antica Pizzeria, was looking for a restaurant venture and noticed a huge gap in Vancouver for some really good pizza. He chose Gastown because having such a traditional style of cooking pizza, with the woodfire ovens, and even Gastown&rsquo;s history, it made for a great place to open up a Neapolitan style pizzeria.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">So, how did you personally get into Italian cooking?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Well, it really does start with pizza. I had a small stint with artisanal pizza when I worked at Central City. I helped open that kitchen in 2003, so while I was working there I really enjoyed the pizza aspect. A few days later, I thought &ldquo;I like this industry, I want to do something that makes me happy,&rdquo; so I started looking for pizzerias. I Googled two words: &ldquo;Woodfire Pizza&rdquo; and &ldquo;Organic&rdquo; and Rocky Mountain Flatbread came up. So I went there and asked for a job. I didn&rsquo;t even start on the pizza station, but once I got on that station, I loved it and excelled at it just because I wanted to do it so bad.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">Do you create the menu as well? What is the concept behind the menu?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">The menu changes seasonally, but the thing you have to remember is it&rsquo;s Neapolitan pizza. There are some things I will never change, like the Margherita or the Marinara</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">How many pizzas do you have on the menu?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">We have 9 pizzas&mdash;my favorite floats between the Margherita and the Marinara still. There are people who know that there are more than just 9 pizzas here. You have to be really curious when it comes to looking at the menu. And there are some pizzas that have fallen off the menu but if you&rsquo;ve been coming here since day one, you can still ask for them. We don&rsquo;t ever promise anything but if we have the ingredients to make them for you, we will.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">What&rsquo;s the secret behind the dough and the sauce?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">The secret behind the sauce is tomatoes and salt &ndash; and a lot people are surprised at that every time. They try our sauce and ask, &ldquo;What&rsquo;s in the sauce?&rdquo; Honestly, it&rsquo;s just tomatoes and salt. The secret is in the freshness and simplicity. A lot of times when you make the pizza sauce at home, you might want to cook it down so it gains flavor and aromatics, but then it loses its freshness.</p>\n\n<blockquote style="margin: 1em 40px; font-size: 20px; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif;">\n<p style="margin-top: 0.8em; line-height: 1.667em;">With the dough, the secret is time. We always make it the night before, leave it to it proof and ferment overnight, then we come in in the morning and we roll it. It&rsquo;s only four ingredients &nbsp;(water, flour, yeast, salt), whereas other pizza doughs might use oil or other ingredients. With Neapolitan dough, you just have the four ingredients and the high temperature oven, which allows for no oil. We cook the pizza so fast that it gets a little crispy on the outside but it&rsquo;s tender and moist on the inside</p>\n</blockquote>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">What are some favorite ingredients you like to use and what makes a pizza just right for you?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">My favorite ingredient right now is really boring, but I love sliced red onions. A good pizza for me has a simple Margherita or Bianca base, then cooked for 90 seconds. Once you get it out of the oven, you finish it with salami, some onions, and hit it with fresh arugula.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">What else do you love on the menu other than the pizza?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">Every Saturday and Sunday, we feature a brunch pizza which is reminiscent of a really good omelet or a full breakfast (potatoes, bacon egg), and those are always crowd pleasers. It&rsquo;s fun because I do it up two ways: I either cook an egg at the front of the oven in a pan and slide it sunny side up on the pizza or when it&rsquo;s really busy I will crack and egg right on the pizza before it goes in. And we have tricks to make sure the egg on the pizza cooks properly, like don&rsquo;t put toppings where the egg is, it has to be just the dough. It&rsquo;s always fun as they are both very specific&mdash;they&rsquo;re ready when they&rsquo;re ready. You can&rsquo;t tell an egg to be ready, and you can&rsquo;t tell a pizza to be ready; you just pray it happens at the same time. It&rsquo;s fun and it&rsquo;s also scary.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">What else do you make in-house? What ingredients are you most excited about?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">There are a lot of ingredients that we make in-house. Our bacon that we even cure in-house, for sure, ricotta, peperonata, garlic confit, Italian sausage, the stock in the Pasta e Fagioli soup&mdash;I could go on. [I&rsquo;m most excited about] local asparagus from BC because it&rsquo;s amazing. And strawberries, which is more of an early summer thing.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">How often do you change the menu beside the features?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">We&rsquo;re constantly tweaking; certain things you just fall in love with and become established on the menu. I like to make changes every season, depending on what comes in with the greens in the spring. I just wait to see what the local farmers are offering and bring that in as features or if they have abundance of it we can create a menu item for it.</p>\n\n<h5 style="font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-weight: bold; color: rgb(51, 51, 51); margin: 2em 0px 0px; font-size: 1.15em;"><span style="font-weight: bolder; line-height: 1.5em;">We read online you have a nickname?</span></h5>\n\n<p style="margin-top: 0.8em; margin-bottom: 0.8em; line-height: 1.667em; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">[Chuckles] Bulldozer Tozer. I am not a little person; let&rsquo;s just say once I get going, there is a momentum like a Bulldozer.</p>\n\n<div class="addtoany_share_save_container addtoany_content_bottom" style="clear: both; margin: 16px 0px; color: rgb(51, 51, 51); font-family: proxima_nova_rgregular, ''Helvetica Neue'', Helvetica, Calibri, Arial, sans-serif; font-size: 15px;">\n<div class="a2a_kit a2a_kit_size_32 addtoany_list a2a_target" id="" style="display: inline; line-height: 32px;">&nbsp;</div>\n</div>\n', 'chef-david-tozer-with-a-penchant-for-pizza-e1458845958210.jpg', '2016-03-25 10:45:29', 0, 5, 0, 1),
(12, 'Tony Romas Special Promo for New Opening Outlet', '<p align="left" style="font-size: 12px; text-align: justify; margin-top: 13px; margin-bottom: 13px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif;">From 1 Feb to 31 March 2016, tantalize your taste buds with our newly launched &quot;Spice It Up&quot; menu items with a glass of refreshing Pomegranate Romarita. We are sure that you&#39;ll get a kick of our these delectable dishes.<br />\n<br />\n<strong>POTATO CROQUETTES&nbsp;</strong>Rp. 60.000++<br />\nCrisp golden potato croquettes served with Sriracha ketchup and jalapeno ranch dressing.</p>\n\n<p align="left" style="font-size: 12px; text-align: justify; margin-top: 13px; margin-bottom: 13px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif;"><strong>CHIPOTLE CHICKEN CAESAR SALAD</strong>&nbsp;Rp. 140.000++<br />\nGrilled Fajita-seasoned chicken breast served on a bed of Romaine lettuce tossed with corn kernels, red onions, tomatoes, jalapeno peppers, avocado, tortilla strips, Cheddar and Mozzarella cheeses in Southwest Caesar dressing.</p>\n\n<p align="left" style="font-size: 12px; text-align: justify; margin-top: 13px; margin-bottom: 13px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif;"><strong>SALMON &amp; SRIRACHA LIME SHRIMP&nbsp;</strong>Rp. 235.000++<br />\nGrilled salmon fillet topped with shrimps saut&eacute;ed in Sriracha lime sauce. Served with fragrant rice.&nbsp;&nbsp;</p>\n\n<p align="left" style="font-size: 12px; text-align: justify; margin-top: 13px; margin-bottom: 13px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif;"><strong>BACON BBQ RIBS &amp; THREE PEPPER STEAK</strong>Rp. 375.000++<br />\nTender baby back ribs basted with bacon BBQ sauce, paired with&nbsp; three-pepper seasoned steak&nbsp;<br />\non a bed of fried Cajun onions.&nbsp; Served with cole slaw and mashed potatoes.&nbsp;&nbsp;</p>\n\n<p align="left" style="font-size: 12px; text-align: justify; margin-top: 13px; margin-bottom: 13px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif;"><strong>POMEGRANATE ROMARITA</strong>&nbsp;Rp. 120.000++<br />\nTequila, Grand Marnier, Pomegranate syrup, orange juice and Margarita mix.</p>\n', 'junk-food-3.jpg', '2016-03-25 10:59:44', 0, 7, 0, 1),
(13, 'mFoodGate Schedules', '<p>We believe, our experiences in providing hospitality business solutions to more than 100 customers in major cities of Indonesia, together with our principles worldwide product will <strong>&ldquo;bring new meaning in partnership..&rdquo;</strong> to&nbsp; you to grow and become the market leader in your hospitality industry.</p>\n\n<p>We invite you to be part of our successful partnership community&hellip;</p>\n\n<p>&nbsp;</p>\n', 'Schedule Planner 2016 - 20160204.pdf', '2016-03-25 17:07:57', 0, 1, 1, 0),
(14, 'Mc Donald''s Kids World', '<p><span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);">Anak-anak menyukai mainan McDonald&#39;s. Namun, mainan yang didesain tanpa memperhatikan faktor keamanan dapat membahayakan mereka. Karena itulah McDonald&#39;s memprioritaskan desain yang aman pada setiap mainannya.</span><br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);">McDonald&#39;s menggunakan jasa konsultan untuk menangani Safety Specification Manual. Perusahaan konsultan tersebut bertugas memastikan produk-produk mainan yang diproduksi bersifat aman. Mereka mengawasi proses pengembangan produk, uji coba produk pada tahap manufaktur, penyesuaian standar keamanan, penyediaan pelatihan keamanan produk serta secara proaktif melaksanakan riset untuk meningkatkan standar keamanan produk-produk mainan McDonald&#39;s secara berkala.</span><br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);">Dengan demikian, setiap mainan McDonald&#39;s telah lolos uji kriteria keamanan yang berlaku secara umum di berbagai negara. Standar yang digunakan oleh McDonald&#39;s adalah Core Safety yang secara umum lebih ketat dibandingkan dengan standar yang ditentukan Pemerintah.</span><br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);">Kajian terhadap desain dan konsep yang ketat memperhatikan hal-hal yang dapat menimbulkan resiko bahaya seperti sebagai berikut :</span><br style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px;" />\n<span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);">&nbsp;</span></p>\n\n<div class="list-resiko" style="margin: 0px 0px 0px 20px; padding: 0px; border: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; line-height: inherit; vertical-align: baseline; color: rgb(51, 51, 51);">\n<ul style="margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; list-style: none;">\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Tersedak</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Ujung atau sudut yang tajam</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Resiko penyalahgunaan</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Tersangkut</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Tingkat kebisingan</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Terlempar</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Sesak napas</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Tersedak</li>\n	<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-caps: inherit; line-height: inherit; vertical-align: baseline; float: none;">Tersedak</li>\n</ul>\n</div>\n', 'YUMMY-FAST-FOOD-fast-food-33414496-1280-720.jpg', '2016-04-07 14:56:13', 0, 7, 0, 1);
INSERT INTO `news` (`id`, `title`, `description`, `image`, `date`, `user_id`, `views`, `is_banner`, `is_active`) VALUES
(15, 'Mi Ayam Tumini Terjual 700 Mangkok Per Hari, Apa Istimewanya?', '<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;"><strong style="font-family: OpenSans-B, sans-serif;">YOGYAKARTA, KOMPAS.com&nbsp;</strong>&mdash; Bersama bakso, mi ayam adalah jenis kuliner yang mudah ditemui di mana saja.&nbsp;<br />\n<br />\nHampir semua daerah di Indonesia memiliki jagoan masing-masing untuk kuliner yang satu ini, tak terkecuali Yogyakarta. Dari sekian banyak tempat yang menjual mi ayam di Kota Pelajar ini, warung mi ayam Bu Tumini adalah salah satu yang terkenal.&nbsp;<br />\n<br />\nBeralamat di Jalan Imogiri Timur Nomor 187 Umbul Harjo, Yogyakarta, atau tepat di utara pintu masuk Terminal Giwangan, warung ini selalu ramai disesaki pelanggan.</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">Waluyo (35), salah satu pegawai Mie Ayam Bu Tumini menuturkan bahwa warung ini telah ada sejak awal tahun 1990-an.</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">Rasanya yang mantap dan memiliki ciri khas yang tidak Anda temukan di warung mi ayam lainnya membuat warung ini mampu bertahan di tengah menjamurnya warung mi ayam.</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">Mie Ayam Bu Tumini memiliki mi dengan ciri khas ukuran yang cukup besar serta kuah yang kental berwarna kecoklatan. Kuah dengan cita rasa gurih manis tersebut berasal dari proses pemasakan ayam yang digunakan untuk&nbsp;<em>toping</em>&nbsp;mi ayam.</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">&nbsp;</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;"><span style="color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Saat Anda mencicipi mi ayam ini, kenyalnya mi berpadu pas dengan gurih manisnya kuah. Rasanya akan semakin pas dengan tambahan sambal.</span></p>\n\n<div class="side-article txt-article" style="color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">\n<p style="line-height: 1.5; margin-top: 3px;">&quot;Untuk menjaga kualitas rasa, kami membuat sendiri mi-nya. Dalam sehari, kami menghabiskan terigu sekitar 70 kilogram. Jika ditotal dengan mi yang diambil pedagang lainnya, jumlahnya bisa mencapai dua kuintal,&quot; ujar Waluyo.</p>\n\n<p style="line-height: 1.5; margin-top: 3px;">Untuk ayam, dalam sehari, warung mi ayam yang buka mulai pukul 10.00 pagi tersebut menghabiskan ayam sekitar 50 kilogram. Waluyo menjelaskan, jika dihitung, dalam sehari warung tersebut bisa menjual lebih dari 700 porsi mi ayam.</p>\n\n<p style="line-height: 1.5; margin-top: 3px;">&quot;Setiap satu kilogram tepung terigu menghasilkan 11 porsi mi ayam,&quot; ujarnya.</p>\n\n<p style="line-height: 1.5; margin-top: 3px;">Di warung ini, pengunjung hanya bisa memesan mi ayam kerena tidak ada pilihan menu makanan lainnya. Namun, ada beberapa pilihan mi ayam, yakni mi ayam ceker, mi ayam jumbo, mi ayam ekstra ayam, dan ada juga pilihan sawi ayam.</p>\n\n<p style="line-height: 1.5; margin-top: 3px;">&nbsp;</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">Untuk harga, satu porsi mi ayam biasa cukup dibayar dengan Rp 8.000, mi ayam jumbo Rp 10.000, mi ayam ekstra ayam Rp 10.000, mi ayam ceker Rp 10.000, sedangkan sawi ayam Rp 5.000.</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">Meskipun setiap harinya selalu dipadati pembeli, Mie Ayam Bu Tumini tidak memiliki cabang. Setiap pembeli harus rela antre untuk mendapatkan satu porsi mi ayam legendaris ini, terlebih pada jam makan siang.<br />\n<br />\nHal tersebut juga harus dialami oleh Dian (28). &quot;Jika datang ke sini pasti selalu ramai dan antre. Meskipun harus antre, rasanya sebanding. Kuahnya yang kental dan gurih manis tidak ditemukan di mi ayam lainnya,&quot; ungkapnya.&nbsp;</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;">&nbsp;</p>\n\n<p style="line-height: 1.5; margin-top: 3px; color: rgb(75, 75, 75); font-family: Lucida, helvetica, sans-serif; font-size: 16px;"><em><strong style="font-family: OpenSans-B, sans-serif;">(Tribun Jogja/Hamim Thohari)</strong></em></p>\n</div>\n', 'mie-ayam-tumini_20151127_194653.jpg', '2016-04-13 15:14:55', 0, 20, 0, 1),
(16, 'Restaurant review: Duck King in Edgewater', '<div style="color: rgb(82, 18, 33); font-family: Lato, sans-serif; font-size: 12px;">\n<article style="color: rgb(0, 0, 0); font-family: -webkit-standard;">\n<p>I was just as heartened to hear that the same family had opened Duck King, a new Chinese restaurant in the Edgewater strip-mall spot that once housed John&#39;s Shanghai.</p>\n\n<p>Duck King originally opened in April 2010, says Ivy Ha, the daughter of owner Wai Lan Suen (Ha works at the restaurant and translates for her mother). But a month later, an early morning fire tore through the mall, and Duck King suffered so much damage it had to close for the next eight months. It reopened early this year.</p>\n\n<p>The setting is a vast improvement over the old Bergenfield digs. The 120-seat room is full of light; its walls are lined with mirrors and glass shelves bearing little Chinese figurines, teapots, cups and vases. Shiny, dark wood chairs fill the room &mdash; try to snag one of the more comfortable upholstered ones.</p>\n\n<p>Suen and her family have always treated all of their customers very well, but also very differently, depending on whether those customers are ethnic Chinese. The former Beijing Duck House had a Chinese menu and an English menu, with several dishes unique to each and others that were made differently depending on whether you ordered them in English or Chinese.</p>\n\n<p>Duck King is run largely the same way. But unlike the Bergenfield restaurant, which had a predominantly ethnic Chinese customer base, Duck King draws a clientele that&#39;s more evenly split &mdash; the dining room is filled mostly with Chinese guests on weekends, while on weekdays the crowd is more mixed. Because of this, the family decided to serve sushi and other Japanese food to keep some of the customers of John&#39;s Shanghai (which also served sushi), and this has caught on. We tried a $16.50 sushi platter, and it was perfectly acceptable, but that&#39;s the last reason you should come here.</p>\n\n<p>You&#39;ll probably see the main attraction paraded out on platters to nearby tables before you get any food. It&#39;s the Beijing duck, and ours was flawless: crisp, fatty skin; moist, tender and boldly flavored meat. The price has jumped to $32.95, and it was worth every penny. In fact, we had to restrain ourselves from returning the very next day.</p>\n\n<p>Zhong Lin Yan, the family&#39;s longtime chef, prepares the duck the same way no matter who orders it. The rest of the menu varies, and so does the treatment by the wait staff, who are unfailingly polite but used to catering to different sets of customers with different needs. I had one dinner here with a Mandarin-speaking friend and another with friends who, like me, spoke English; the food was mostly great on both visits, but we had very different experiences.</p>\n\n<p>If you want to come in here and order Chinese-American favorites like General Tso&#39;s chicken or orange peel beef, you&#39;ll have no problems and will probably be quite pleased. If you can communicate with the wait staff in Chinese, you&#39;ll also probably be happy. But if you do neither of these and are looking for a great meal, here are some tips:</p>\n\n<p>* Ask for the little bowl of seaweed served to Chinese diners instead of the fried wonton noodles. Our noodles were stale, and we couldn&#39;t help looking longingly at the seaweed on other tables. On the next dinner with my Mandarin-speaking friend, we tore into the incredible garlic-flecked seaweed so fast the waiter brought us another bowl.</p>\n\n<p>* Engage the waiter and tell him you&#39;re open to trying authentic Chinese dishes, and would like some suggestions. Be as specific as possible in terms of what you want. On our &quot;Chinese visit,&quot; we merely asked for a soup and were almost instantly rewarded with a gorgeous bowl filled with tofu, mustard greens and tender pork ($9.95). &quot;Better than hot and sour soup,&quot; the waiter joked. We also got an amazing fish: a fresh, steamed sea bass flavored with soy sauce and scallions; my friend considered drinking the sauce right off the platter ($32.95). And we tried a cold appetizer of strips of pork belly, slightly sweetened, also flavored with soy sauce and scallions ($6.95).</p>\n\n<p>But on our English-speaking visit, we simply asked for a vegetable dish and got the greenest, freshest pea shoots ever ($13.95), still with a little crisp in them. Ivy Ha says customers do often ask waiters to suggest dishes and that some non-Chinese customers prefer to order in the Chinese style.</p>\n\n<p>* Amendment to the last item: Just be sure to avoid the filet mignon. The waiter kept pushing this on our &quot;Chinese visit,&quot; and finally we gave in &mdash; only to get cubes of tough, cheap-tasting meat that were bleeding into the brown sauce ($16.95).</p>\n\n<p>* If you want xiaolongbao, this isn&#39;t your place. Our pork and crab &quot;juice buns&quot; ($7.95) &mdash; also known as soup dumplings &mdash; had a processed taste, and a few broke before we got to eat them. Ivy Ha says they&#39;re made in house, but for my money I&#39;m heading elsewhere for this particular item.</p>\n\n<p>* Lastly, go for noodles, not rice cakes. The &quot;Shanghai fat noodle&quot; dish &mdash; a lo mein made with big, round noodles &mdash; was terrific, with slivers of mushrooms and bamboo shoots; it&#39;s also always made the same way ($8.95). But Shanghai-style rice cakes &mdash; one of my favorites from Beijing Duck House &mdash; here showed up soft and gluey ($8.95), though the tender pork slices and the seasoning were just as delicious as I remembered from Bergenfield.</p>\n\n<p>E-mail: ung@northjersey.com. Blog: northjersey.com/foodblog. Twitter: elisaung.</p>\n\n<div>&nbsp;</div>\n\n<div class="clear" style="position: relative; margin: 0px; padding: 0px; width: auto; height: auto; clear: both;">\n<div style="position: relative; margin: 0px; padding: 0px; width: auto; height: auto;">\n<div class="articleadswr" style="position: relative; margin: 0px; padding: 0px; width: auto; height: auto;">&nbsp;</div>\n\n<div class="clear" style="position: relative; margin: 0px; padding: 0px; width: auto; height: auto; clear: both;">&nbsp;</div>\n\n<div style="position: relative; margin: 0px; padding: 0px; width: auto; height: auto; clear: both;">&nbsp;</div>\n</div>\n</div>\n</article>\n\n<aside style="color: rgb(0, 0, 0); font-family: -webkit-standard; text-align: center;">\n<div style="position: relative; margin: 25px 0px 0px; padding: 0px; width: auto; height: auto;">&nbsp;</div>\n</aside>\n</div>\n', 'duckking.jpg', '2016-04-13 15:22:38', 0, 27, 1, 1);

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
  `offer_type_id` int(11) NOT NULL,
  `mpoints_given` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created_on`, `title`, `description`, `benefits`, `price`, `mpoints`, `offer_price`, `offer_percent`, `offer_from_date`, `offer_to_date`, `image`, `is_active`, `merchant_id`, `restaurant_id`, `location`, `lat`, `lng`, `is_featured`, `buy_count`, `category_id`, `city`, `is_special`, `special_tag`, `offer_type_id`, `mpoints_given`, `quantity`) VALUES
(1, '2016-03-17 00:00:00', 'Asia Kitchen by Mainland China', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n\n<h1>Validity</h1>\n\n<ul>\n	<li>Valid until: 30.04.2016</li>\n	<li>Valid 6 days a week (Monday - Saturday)</li>\n	<li>Timings: 12:00 Noon to 10:30PM</li>\n	<li>Offer 4 &amp; 5: Valid for 2 Persons</li>\n	<li>Offers 1, 2 &amp; 3 are valid for dine in &amp; takeaway</li>\n	<li>Offers 4 &amp; 5 are valid for dine-in only</li>\n</ul>\n\n<h1>General Fine Print</h1>\n\n<ul>\n	<li>Prior appointment mandatory (Upon purchase, you will receive a voucher with the reservation number). Rescheduling may result in additional charges</li>\n	<li>For weekend appointments, we recommend calling 2 - 3 days in advance</li>\n	<li>Voucher printout is mandatory</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 25000.00, 80, 20000.00, 20, '2016-04-01 00:00:00', '2016-04-25 00:00:00', '01.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 1, 40, 1, NULL, 1, 'Christmas Promo,Lebaran Promo', 1, 5, 100),
(2, '2016-02-25 00:00:00', 'The Last Supper', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 50000.00, 100, 25000.00, 50, '2016-04-15 00:00:00', '2016-04-29 00:00:00', 'Thamel-Food.jpg', 1, 3, 2, 'Mumbai', '18.9750', '72.8258', 1, 4, 1, NULL, 1, 'Valentine Promo', 1, 0, 100),
(3, '2016-02-25 00:00:00', 'Suruchi Veg Restaurant', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 100000.00, 320, 80000.00, 20, '2016-02-15 00:00:00', '2016-03-31 00:00:00', 'junk-food-3.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 0, '', 1, 10, 200),
(4, '2016-05-13 00:00:00', 'Markham Station Restaurant - Member Card', '<p>&nbsp;</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Member Discount 15% on regular menu</li>\n	<li><strong>Offer 2: 1</strong>&nbsp;Member Discount 5% on promo menu</li>\n	<li><strong>Offer 3: 3</strong>&nbsp;New Opening Outlet Discount 20%</li>\n</ul>\n\n<h1>Point Collection:</h1>\n\n<ul>\n	<li>Free 10 points for join the membership</li>\n	<li>Get 1 point every purchase of 10.000 on Weekend</li>\n	<li>Get 2 points every purchase of 10.000 on Weekday</li>\n	<li>Get 10 points every purchase above1.000.000 on Weekend</li>\n	<li>Get 20 points every purchase above1.000.000 on Weekday</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 300000.00, 0, 270000.00, 10, '2016-04-17 00:00:00', '2016-04-29 00:00:00', 'member card1.png', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 1, 2, 2, NULL, 0, 'Valentine Promo', 3, 10, 1000),
(8, '2016-02-25 00:00:00', 'Pepper Chino - Samilton Hotel', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 35000.00, 100, 24500.00, 30, '2016-02-26 00:00:00', '2016-03-30 00:00:00', 'healthy-organic-food.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, 'New Year Promo,Lebaran Promo', 1, 0, 50),
(9, '2016-02-25 00:00:00', 'Rang De Basanti Dhaba', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 100000.00, 0, 90000.00, 10, '2016-02-26 00:00:00', '2016-04-28 00:00:00', 'Rewards-Card.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 0, 'New Year Promo,Lebaran Promo', 3, 0, 0),
(10, '2016-03-29 00:00:00', 'Garlic Bread', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 30000.00, 80, 21000.00, 30, '2016-03-29 00:00:00', '2016-04-07 00:00:00', '56c309700b04511bf2631ce2.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, 'New Year Promo,Lebaran Promo', 1, 10, 500),
(11, '2016-02-25 00:00:00', 'Mutton Biryani', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 40000.00, 150, 36000.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', '56af017f0b04512cde6d4309.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, '', 1, 25, 1000),
(12, '2016-03-30 00:00:00', 'Chicken Katshu', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Katshu</li>\n	<li><strong>Offer 2: 1</strong> Orange Juice</li>\n</ul>\n\n<h1>&nbsp;Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 120000.00, 400, 102000.00, 15, '2016-03-30 00:00:00', '2016-04-14 00:00:00', 'Chicken-Katsu.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, '', 1, 50, 500),
(13, '2016-03-31 00:00:00', 'Comptoir Gascon', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 25000.00, 100, 20000.00, 20, '2016-03-31 00:00:00', '2016-04-21 00:00:00', 'Comptoir_Gascon.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, '', 1, 0, 100),
(14, '2016-03-29 00:00:00', 'Chargrilled quail', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 150000.00, 500, 120000.00, 20, '2016-04-14 00:00:00', '2016-04-14 00:00:00', 'chicken140.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, '', 1, 50, 200),
(15, '2016-03-30 00:00:00', 'Charcuterie', '<p>An apple a day keeps the doctor away, is what they say. After you&rsquo;re done with the Apple how about some mouth-watering delicacies?</p>\n\n<h1>Highlights</h1>\n\n<ul>\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1>What You Get</h1>\n\n<ul>\n	<li><strong>Offer 1: 1</strong> Chicken Biryani</li>\n	<li><strong>Offer 2: 1</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n</ul>\n\n<h1>Indian Combo Meal Inclusions:</h1>\n\n<ul>\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks <strong>Chinese Combo Meal Inclusions:</strong></li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n', '<h1>Benefits</h1>\n\n<ul>\n	<li><strong>Offer</strong> Any time 20% off</li>\n	<li><strong>Offer 2</strong> Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li>year subscription</li>\n	<li><strong>Offer 3: 3</strong> Chicken Biryani</li>\n	<li><strong>Offer 4:</strong> Chinese Combo Meal</li>\n	<li><strong>Offer 5:</strong> Indian Combo Meal</li>\n</ul>\n', 150.00, 10, 135.00, 10, '2016-03-30 00:00:00', '2016-04-05 00:00:00', 'charcuterie.jpg', 1, 3, 1, 'Kolkata', '22.5667', '88.3667', 0, 2, 2, NULL, 1, '', 1, 0, 0),
(16, NULL, 'Spinach Lasagna Rolls', '<p>&nbsp;</p>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Highlights</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">What You Get</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li><span style="font-weight: 700;">Offer 1: 1</span>&nbsp;Chicken Biryani</li>\n	<li><span style="font-weight: 700;">Offer 2: 1</span>&nbsp;Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><span style="font-weight: 700;">Offer 3: 3</span>&nbsp;Chicken Biryani</li>\n	<li><span style="font-weight: 700;">Offer 4:</span>&nbsp;Chinese Combo Meal</li>\n	<li><span style="font-weight: 700;">Offer 5:</span>&nbsp;Indian Combo Meal</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Indian Combo Meal Inclusions:</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks&nbsp;<span style="font-weight: 700;">Chinese Combo Meal Inclusions:</span></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Validity</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Valid until: 30.04.2016</li>\n	<li>Valid 6 days a week (Monday - Saturday)</li>\n	<li>Timings: 12:00 Noon to 10:30PM</li>\n	<li>Offer 4 &amp; 5: Valid for 2 Persons</li>\n	<li>Offers 1, 2 &amp; 3 are valid for dine in &amp; takeaway</li>\n	<li>Offers 4 &amp; 5 are valid for dine-in only</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">General Fine Print</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Prior appointment mandatory (Upon purchase, you will receive a voucher with the reservation number). Rescheduling may result in additional charges</li>\n	<li>For weekend appointments, we recommend calling 2 - 3 days in advance</li>\n	<li>Voucher printout is mandatory</li>\n</ul>\n', '<p>asd asdasd asd asd asd</p>\n', 70000.00, 0, 49000.00, 30, '2016-04-10 00:00:00', '2016-04-30 00:00:00', 'Spinach-Lasagna-Rolls.jpg', 1, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '', 1, 0, 50),
(17, '2016-04-12 10:16:16', 'Lasagna Lite Cheese', '<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Highlights</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Located at Park Street</li>\n	<li>Inclusive of all taxes and service charges</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">What You Get</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li><span style="font-weight: 700;">Offer 1: 1</span>&nbsp;Chicken Biryani</li>\n	<li><span style="font-weight: 700;">Offer 2: 1</span>&nbsp;Chicken Reshmi / Tikka / Haryali Kebab</li>\n	<li><span style="font-weight: 700;">Offer 3: 3</span>&nbsp;Chicken Biryani</li>\n	<li><span style="font-weight: 700;">Offer 4:</span>&nbsp;Chinese Combo Meal</li>\n	<li><span style="font-weight: 700;">Offer 5:</span>&nbsp;Indian Combo Meal</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Indian Combo Meal Inclusions:</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Veg / Non-Veg Starter (ANY 1)</li>\n	<li>Veg / Non-Veg Main Course (ANY 1)</li>\n	<li>Dal (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Indian Breads (2pcs)</li>\n	<li>2 Cold Drinks&nbsp;<span style="font-weight: 700;">Chinese Combo Meal Inclusions:</span></li>\n	<li>2 Cold Drinks</li>\n	<li>Soup (1 by 2)</li>\n	<li>Starter (ANY 1)</li>\n	<li>Main Course (ANY 1)</li>\n	<li>Rice (ANY 1)</li>\n	<li>Noodles / Chop Suey (ANY 1)</li>\n	<li>Desserts</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">Validity</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Valid until: 30.04.2016</li>\n	<li>Valid 6 days a week (Monday - Saturday)</li>\n	<li>Timings: 12:00 Noon to 10:30PM</li>\n	<li>Offer 4 &amp; 5: Valid for 2 Persons</li>\n	<li>Offers 1, 2 &amp; 3 are valid for dine in &amp; takeaway</li>\n	<li>Offers 4 &amp; 5 are valid for dine-in only</li>\n</ul>\n\n<h1 style="color: rgb(122, 118, 118); background-color: rgb(255, 255, 255);">General Fine Print</h1>\n\n<ul style="background-color: rgb(255, 255, 255);">\n	<li>Prior appointment mandatory (Upon purchase, you will receive a voucher with the reservation number). Rescheduling may result in additional charges</li>\n	<li>For weekend appointments, we recommend calling 2 - 3 days in advance</li>\n	<li>Voucher printout is mandatory</li>\n</ul>\n', '<p>dsfsdf sdf sdfsd fsdf fsdf</p>\n', 60000.00, 0, 48000.00, 20, '2016-04-01 00:00:00', '2016-04-30 00:00:00', 'mg_9050.jpg', 1, 3, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', 1, 5, 10),
(18, '2016-04-14 15:30:48', 'Maystar - Voucher 100.000', '', '', 100000.00, 0, 70000.00, 30, '2016-04-13 00:00:00', '2016-04-13 00:00:00', 'voucher250.png', 0, 3, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', 2, 0, 100),
(21, '2016-04-16 01:36:37', 'Maystar - Voucher 100.000', '', '', 100000.00, 0, 75000.00, 25, '2016-04-15 00:00:00', '2016-05-06 00:00:00', 'voucher250.png', 1, 25, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', 2, 10, 100),
(22, '2016-04-16 01:38:04', 'Maystar - Voucher 250.000', '', '', 250000.00, 0, 175000.00, 30, '2016-04-15 00:00:00', '2016-05-05 00:00:00', 'voucher100.png', 1, 25, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '', 2, 20, 100),
(23, '2016-04-16 01:39:52', 'Maystar - Voucher 50.000', '', '', 50000.00, 0, 40000.00, 20, '2016-04-15 00:00:00', '2016-05-05 00:00:00', 'voucher50.png', 1, 25, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '', 2, 5, 200),
(24, '2016-04-18 11:44:52', 'Lorem Ipsum Doller Sit Amet', '<p>Lorem Ipsum Doller Sit Amet is a dummy text.</p>\n\n<p>Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.</p>\n\n<p>&nbsp; Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.</p>\n', '<p>Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.Lorem Ipsum Doller Sit Amet is a dummy text.</p>\n', 250.00, 10, 200.00, 10, '2016-04-16 00:00:00', '2016-04-21 00:00:00', 'fast-food.jpg', 1, 3, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '', 1, 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `offer_category_map`
--

DROP TABLE IF EXISTS `offer_category_map`;
CREATE TABLE IF NOT EXISTS `offer_category_map` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_category_map`
--

INSERT INTO `offer_category_map` (`id`, `offer_id`, `category_id`) VALUES
(25, 17, 8),
(26, 17, 3),
(27, 17, 1),
(40, 1, 11),
(41, 1, 9),
(42, 1, 3),
(43, 1, 1),
(44, 3, 11),
(45, 3, 9),
(46, 3, 8),
(47, 3, 1),
(52, 24, 10),
(53, 24, 5),
(54, 24, 2),
(55, 24, 9);

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
-- Table structure for table `offer_outlet_map`
--

DROP TABLE IF EXISTS `offer_outlet_map`;
CREATE TABLE IF NOT EXISTS `offer_outlet_map` (
  `id` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_outlet_map`
--

INSERT INTO `offer_outlet_map` (`id`, `outlet_id`, `offer_id`) VALUES
(12, 1, 17),
(13, 2, 17),
(15, 1, 12),
(21, 1, 1),
(30, 19, 22),
(31, 20, 23),
(32, 19, 23),
(34, 19, 21),
(35, 4, 24);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(7, 4, 40.00, 'PAY-66N67491G14470250K32WHSA', '2016-03-25 16:14:00', 'U'),
(8, 17, 20.00, 'PAY-6G142847AY366650FK34K2XQ', '2016-03-28 04:04:46', 'P'),
(9, 4, 20.00, 'PAY-97651947N2508925PK4G5ERA', '2016-04-13 04:59:47', 'U'),
(10, 4, 123000.00, 'PAY-4GR73918VB259780CK4IKMZI', '2016-04-15 08:29:25', 'U'),
(11, 17, 68000.00, 'PAY-8MJ315719V131530SK4IK7KA', '2016-04-15 09:08:55', 'U'),
(12, 17, 115000.00, 'PAY-4YA34944AM451923NK4IR5GA', '2016-04-15 17:02:16', 'U'),
(13, 4, 49000.00, 'PAY-5AJ176581U7679712K4K4XEI', '2016-04-19 06:09:21', 'P'),
(14, 4, 49000.00, 'PAY-1R3341354Y963643CK4K44SA', '2016-04-19 06:20:56', 'P'),
(15, 4, 36000.00, 'PAY-0VJ85407H29130820K4K47PI', '2016-04-19 06:27:08', 'P'),
(16, 4, 68000.00, 'PAY-2WK80624462511704K4K5CSI', '2016-04-19 06:33:44', 'U'),
(17, 4, 68000.00, 'PAY-3A131420FD5125548K4K5CSI', '2016-04-19 06:33:44', 'P'),
(18, 4, 49000.00, 'PAY-64A10717WS564574CK4LCCHA', '2016-04-19 12:14:20', 'U'),
(19, 2, 217000.00, 'PAY-41N98901AN1954203K4LCCIY', '2016-04-19 12:14:27', 'P'),
(20, 4, 49000.00, 'PAY-3C267058FD9330421K4LCEOY', '2016-04-19 12:19:06', 'P'),
(21, 2, 56000.00, 'PAY-5UK369817R861383SK4LCH3Q', '2016-04-19 12:26:22', 'P'),
(22, 17, 306000.00, 'PAY-3W033635P34814025K4LFL4Q', '2016-04-19 15:59:46', 'U');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
(7, 4, 1, 7, 23.00, 20.00, 2),
(8, 17, 1, 8, 23.00, 20.00, 1),
(9, 4, 1, 9, 23.00, 20.00, 1),
(10, 4, 2, 10, 50000.00, 25000.00, 3),
(11, 4, 17, 10, 60000.00, 48000.00, 1),
(12, 17, 1, 11, 25000.00, 20000.00, 1),
(13, 17, 20, 11, 60000.00, 48000.00, 1),
(14, 17, 1, 12, 25000.00, 20000.00, 1),
(15, 17, 2, 12, 50000.00, 25000.00, 1),
(16, 17, 18, 12, 100000.00, 70000.00, 1),
(17, 4, 16, 13, 70000.00, 49000.00, 1),
(18, 4, 16, 14, 70000.00, 49000.00, 1),
(19, 4, 11, 15, 40000.00, 36000.00, 1),
(20, 4, 17, 16, 60000.00, 48000.00, 1),
(21, 4, 1, 16, 25000.00, 20000.00, 1),
(22, 4, 17, 17, 60000.00, 48000.00, 1),
(23, 4, 1, 17, 25000.00, 20000.00, 1),
(24, 4, 16, 18, 70000.00, 49000.00, 1),
(25, 2, 17, 19, 60000.00, 48000.00, 1),
(26, 2, 16, 19, 70000.00, 49000.00, 1),
(27, 2, 14, 19, 150000.00, 120000.00, 1),
(28, 4, 16, 20, 70000.00, 49000.00, 1),
(29, 2, 11, 21, 40000.00, 36000.00, 1),
(30, 2, 13, 21, 25000.00, 20000.00, 1),
(31, 17, 11, 22, 40000.00, 36000.00, 1),
(32, 17, 4, 22, 300000.00, 270000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

DROP TABLE IF EXISTS `outlets`;
CREATE TABLE IF NOT EXISTS `outlets` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outlets`
--

INSERT INTO `outlets` (`id`, `title`, `user_id`, `restaurant_id`, `location_id`, `address`, `lat`, `lng`, `is_active`) VALUES
(1, 'Tony Roma''s Pondok Indah', 3, 1, 5, 'Mall Pondok Indah 1 Ground Floor Suite G007', '28.6561592', '77.2410203', 1),
(2, 'Tony Roma''s UOB Tower', 3, 1, 5, 'Jl. Bunderan HI, Jakarta Pusat', '22.5189747', '88.3615507', 1),
(4, 'Mad for Garlic - Grand Indonesia', 3, 2, 5, 'East Mall Grand Indonesia - Ground Floor Suite G100', '', '', 0),
(5, 'Duck King Taman Anggrek', 18, 3, 5, '2nd Floor Taman Anggrek Mall', '', '', 1),
(6, 'Duck King Senayan City', 18, 3, 5, 'Senayan City, Special Capital Region of Jakarta, Indonesia', '-6.2274387', '106.7968203', 1),
(7, 'Grand Duck King Grand Indonesia', 18, 9, 5, 'Grand Indonesia, Special Capital Region of Jakarta, Indonesia', '-6.1950243', '106.8213902', 1),
(8, 'Eat N Eat Mall Kelapa Gading', 22, 13, 5, 'Mal Kelapa Gading, Special Capital Region of Jakarta, Indonesia', '-6.1572355', '106.9084208', 1),
(9, 'Eat N Eat Kota Kasablanka', 22, 13, 5, 'Kota Kasablanka, Special Capital Region of Jakarta, Indonesia', '-6.2216706', '106.8423461', 1),
(10, 'Eat N Eat Pluit Village', 22, 13, 5, 'Pluit Village, Pluit, North Jakarta City, Special Capital Region of Jakarta, Indonesia', '-6.1178212', '106.7862959', 1),
(11, 'Torridol Yakitori Kota Kasablanka', 22, 14, 5, 'Kota Kasablanka, Special Capital Region of Jakarta, Indonesia', '-6.2216706', '106.8423461', 1),
(12, 'Mama Malaka Grand Indonesia', 22, 15, 5, 'Grand Indonesia, Special Capital Region of Jakarta, Indonesia', '-6.1950243', '106.8213902', 1),
(13, 'Dante Coffee Central Park', 22, 17, 5, 'Central Park, Special Capital Region of Jakarta, Indonesia', '-6.2251609', '106.831162', 1),
(14, 'Young Tau Fu Artha Gading', 22, 12, 5, 'Mall Artha Gading, Special Capital Region of Jakarta, Indonesia', '-6.1458137', '106.8919472', 1),
(15, 'Imperial Chef Medan Merdeka', 18, 11, 7, 'Medan Mall, Jalan M. T. Haryono, Pusat Pasar, Medan City, North Sumatra, Indonesia', '', '', 1),
(16, 'Mocca Coffee Puri Indah Mall', 22, 16, 5, 'Puri Indah Mall, Puri Lingkar Luar, South Kembangan, West Jakarta City, Special Capital Region of Jakarta, Indonesia', '-6.188259', '106.7337275', 1),
(17, 'California Pizza Kitchen Panglima Polim', 3, 10, 5, 'Jalan Panglima Polim I, Melawai, South Jakarta City, Special Capital Region of Jakarta, Indonesia', '-6.2476714', '106.7999339', 1),
(18, 'Duck King Paris Van Java', 18, 3, 2, 'Paris Van Java, West Java, Indonesia', '-6.8892843', '107.5958053', 1),
(19, 'Maystar - Le Grendeuer', 25, 18, 5, 'Jalan Mangga Besar VIII, Taman Sari, West Jakarta City, Special Capital Region of Jakarta, Indonesia', '-6.1520664', '106.8259437', 1),
(20, 'Maystar Lembang Bandung', 25, 18, 2, 'Lembang, West Bandung Regency, West Java, Indonesia', '-6.8162073', '107.6227961', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outlet_category_map`
--

DROP TABLE IF EXISTS `outlet_category_map`;
CREATE TABLE IF NOT EXISTS `outlet_category_map` (
  `id` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outlet_category_map`
--

INSERT INTO `outlet_category_map` (`id`, `outlet_id`, `category_id`) VALUES
(29, 1, 2),
(30, 2, 2),
(31, 4, 2),
(32, 19, 10),
(33, 19, 1);

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
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Inactive, 1- active'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `user_id`, `title`, `logo`, `address`, `category_id`, `is_featured`, `is_active`) VALUES
(1, 3, 'Tony Roma''s', 'tony romas.png', 'Gc-211, Saltlake, sector -III, Kolkata', 3, 1, 1),
(2, 3, 'Mad for Garlic', 'madforgarlic.jpg', 'Park Street, Kolkata', 3, 0, 1),
(3, 18, 'Duck King', 'duckking_logo.png', NULL, 0, 1, 1),
(9, 18, 'Grand Duck King', 'grandduckking.jpg', NULL, 0, 1, 1),
(10, 3, 'California Pizza Kitchen', 'cpk.jpg', NULL, 0, 1, 1),
(11, 18, 'Imperial Chef', 'logo-imperial-chef.jpg', NULL, 0, 0, 1),
(12, 22, 'Yong Tau Fu', 'yong-tau-fu-logo.jpg', NULL, 0, 0, 1),
(13, 22, 'Eat N Eat', 'eatneat.jpg', NULL, 0, 1, 1),
(14, 22, 'Torridoll Yakitori', 'toridoll-yakitori_logo.png', NULL, 0, 1, 1),
(15, 22, 'Mama Malaka', 'mamamalaka.jpg', NULL, 0, 0, 1),
(16, 22, 'Mocca Coffee Cabana', 'moccacoffee.jpg', NULL, 0, 0, 1),
(17, 22, 'Dante Coffee', 'Dante_Coffee.png', NULL, 0, 1, 1),
(18, 25, 'Maystar Restaurant', 'maystar logo.png', NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `resturant_category_map`
--

DROP TABLE IF EXISTS `resturant_category_map`;
CREATE TABLE IF NOT EXISTS `resturant_category_map` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resturant_category_map`
--

INSERT INTO `resturant_category_map` (`id`, `restaurant_id`, `category_id`) VALUES
(8, 7, 5),
(9, 7, 3),
(91, 1, 2),
(101, 10, 9),
(107, 2, 2),
(110, 17, 8),
(112, 13, 11),
(113, 15, 10),
(114, 16, 8),
(117, 3, 1),
(118, 3, 10),
(119, 9, 1),
(120, 9, 10),
(121, 11, 1),
(122, 11, 10),
(123, 12, 10),
(124, 18, 10),
(125, 18, 1),
(130, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `resturant_images`
--

DROP TABLE IF EXISTS `resturant_images`;
CREATE TABLE IF NOT EXISTS `resturant_images` (
  `id` int(11) NOT NULL,
  `resturant_id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `app_store_link` varchar(1500) NOT NULL,
  `new_promo_days` int(11) NOT NULL COMMENT 'Promo days as new',
  `hot_percentage` decimal(10,2) NOT NULL COMMENT 'Promo will be marked as hot selling.',
  `last_day_promo` int(11) NOT NULL COMMENT 'no. of days of last day promo'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `facebook_url`, `twitter_url`, `youtube_url`, `pininterest_url`, `google_store_link`, `app_store_link`, `new_promo_days`, `hot_percentage`, `last_day_promo`) VALUES
(1, 'https://www.facebook.com/', 'http://twitter.com/', 'https://www.youtube.com/', 'https://www.pinterest.com/', 'https://play.google.com/store?utm_source=apac_med&utm_medium=hasem&utm_content=Jun2515&utm_campaign=evergreen&pcampaignid=MKT-DR-apac-in-all-med-hasem-py-evergreen-Jun2515-1-en-bkws&gclid=Cj0KEQjwzq63BRCrtIuGjImRoIIBEiQAGLHdYT7z3GaJyAPj3q9T0zqoX5Try5Eh6WEgR8Dvh7EEnMgaAscR8P8HAQ&gclsrc=aw.ds', 'https://linkmaker.itunes.apple.com/en-us/', 6, 30.00, 5);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `swap`
--

INSERT INTO `swap` (`id`, `voucher_id`, `user_id`, `offer_id`, `is_active`, `description`) VALUES
(1, 2, 4, 3, 1, ''),
(2, 13, 3, 1, 1, ''),
(3, 17, 2, 11, 1, ''),
(4, 12, 4, 17, 1, 'test description');

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
  `user_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '1 - Admin, 2 - User, 3- Merchant',
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
  `address` text NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `merchant_name`, `email`, `username`, `password`, `txt_pwd`, `registration_date`, `is_active`, `user_type_id`, `is_logged_in`, `last_login`, `unique_code`, `is_social_login`, `fb_id`, `image`, `phone`, `about_me`, `media_notification`, `expire_date_notification`, `promo_notification`, `news_letter_notification`, `address`, `dob`, `gender`, `occupation`) VALUES
(1, 'admin', 'admin', 'abc', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-12 09:02:28', 1, 1, 0, '2016-04-20 11:04:29', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(2, 'Abhishek', 'Kundu', NULL, 'nits.abhishek85@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '12345', '2016-02-15 10:02:57', 1, 2, 0, '2016-04-20 07:04:35', '123', 0, NULL, '1458903352153779_231_RL_product.jpg', NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(3, 'Evie', 'Sandra', 'Mas Mellennium', 'picTR@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-15 11:02:06', 1, 3, 0, '2016-04-20 11:04:01', NULL, 0, NULL, 'tony romas.png', '3698745221', 'test', 0, 0, 0, 0, 'kolkata', NULL, NULL, NULL),
(4, 'Anup Up', 'Chakraborty', NULL, 'nits.anup@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-16 12:02:27', 1, 2, 0, '2016-04-20 12:04:07', '1455626727299005', 0, NULL, '1460985933645656_1442516280558.jpg', '968745', 'Man from mars 2', 0, 0, 0, 0, '', '1995-01-18', 'M', 'abc'),
(6, 'Rahul', 'Roy', NULL, 'nits.santanu@gmail.com', NULL, NULL, NULL, '2016-02-22 03:02:46', 1, 2, 0, '2016-02-29 12:02:54', '1456156186779391', 0, '1670701249873793', '1456745423267591_134_man1.jpg', NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(9, 'Arup', 'Chakraborty', 'a', 'nits.sarojkumar@gmail.com', 'saroj', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-02-25 08:02:26', 0, 2, 0, NULL, '1456387586434984', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(17, 'Deddy', 'Oktomeo', NULL, 'deddyokt@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-03-25 04:03:03', 1, 2, 0, '2016-04-20 05:04:49', '1458924543454365', 0, NULL, NULL, '0811858585', 'I am living at Jakarta', 0, 0, 0, 0, '', '1971-04-03', 'M', 'Employee'),
(18, 'Susan', 'Kho', 'Duck King Group', 'pic.duckking@gmail.com', 'bikash', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2016-04-04 00:00:00', 1, 3, 0, '2016-04-13 08:04:57', NULL, 0, NULL, 'duckking_logo.png', NULL, 'Lorem Ipsum Doller Sit Amet', 0, 0, 0, 0, '', NULL, NULL, NULL),
(21, NULL, NULL, NULL, 'hartachan@gmail.com', NULL, '25d55ad283aa400af464c76d713c07ad', '12345678', '2016-04-13 08:04:27', 0, 2, 0, NULL, '1460536827992721', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(22, 'Edward', 'Susanto', 'Marche', 'pic.eatneat@gmail.com', NULL, '16f11c7f52b8e6998333ece6c81a1d2c', '602906', '2016-04-13 09:04:37', 1, 3, 0, NULL, '1460540857420879', 0, NULL, 'eatneat.jpg', NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(23, 'Saroj', 'Kumar', 'Saroj', 'nits.sarojkumar12@gmail.com', NULL, '038080a3cdc737e1c940939a3d82c68d', '147218', '2016-04-13 09:04:32', 1, 2, 0, NULL, '1460540972834921', 0, NULL, '17.jpg', NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL),
(25, 'Joe', 'Lim', 'Maystar Group', 'maystar@gmail.com', NULL, '992f0c95d7d4f31cda1a3d11c3cbd726', '701576', '2016-04-16 01:04:20', 1, 3, 0, NULL, '1460770160995583', 0, NULL, 'maystar logo.png', NULL, NULL, 0, 0, 0, 0, '', NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `offer_id`, `created_on`, `view_id`, `price`, `offer_price`, `offer_percent`, `from_date`, `to_date`, `is_used`, `is_active`) VALUES
(1, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(2, 3, '2016-02-25 00:00:00', '', 50.00, 45.00, 10, '2016-02-26 00:00:00', '2016-03-31 00:00:00', 0, 1),
(3, 2, '2016-02-25 00:00:00', '', 50.00, 45.00, 10, '2016-02-26 00:00:00', '2016-04-06 00:00:00', 0, 1),
(4, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(5, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(6, 9, '2016-02-25 00:00:00', '', 100.00, 90.00, 10, '2016-02-26 00:00:00', '2016-04-28 00:00:00', 0, 1),
(7, 1, '2016-03-17 00:00:00', '', 23.00, 20.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(8, 9, '2016-02-25 00:00:00', '', 100.00, 90.00, 10, '2016-02-26 00:00:00', '2016-03-28 00:00:00', 0, 1),
(9, 9, '2016-02-25 00:00:00', '', 100.00, 90.00, 10, '2016-02-26 00:00:00', '2016-04-28 00:00:00', 0, 1),
(10, 9, '2016-02-25 00:00:00', '', 100.00, 90.00, 10, '2016-02-26 00:00:00', '2016-04-28 00:00:00', 0, 1),
(11, 11, '2016-02-25 00:00:00', '', 40000.00, 36000.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(12, 17, '2016-04-12 10:16:16', '', 60000.00, 48000.00, 20, '2016-04-01 00:00:00', '2016-04-30 00:00:00', 0, 1),
(13, 1, '2016-03-17 00:00:00', '', 25000.00, 20000.00, 20, '2016-04-01 00:00:00', '2016-04-25 00:00:00', 0, 1),
(14, 17, '2016-04-12 10:16:16', '', 60000.00, 48000.00, 20, '2016-04-01 00:00:00', '2016-04-30 00:00:00', 0, 1),
(15, 17, '2016-04-12 10:16:16', '', 60000.00, 48000.00, 20, '2016-04-01 00:00:00', '2016-04-30 00:00:00', 0, 1),
(16, 17, '2016-04-12 10:16:16', '', 60000.00, 48000.00, 20, '2016-04-01 00:00:00', '2016-04-30 00:00:00', 0, 1),
(17, 11, '2016-02-25 00:00:00', '', 40000.00, 36000.00, 10, '2016-02-26 00:00:00', '2016-04-20 00:00:00', 0, 1),
(18, 13, '2016-03-31 00:00:00', '', 25000.00, 20000.00, 20, '2016-03-31 00:00:00', '2016-04-21 00:00:00', 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_bids`
--

INSERT INTO `voucher_bids` (`id`, `voucher_id`, `user_id`, `bid_price`, `voucher_resale_id`, `is_accepted`, `m_points`, `is_active`) VALUES
(1, 1, 2, 300, 1, 0, NULL, 1),
(2, 4, 4, 151, 2, 0, '20', 1),
(3, 1, 1, 251, 1, 0, NULL, 1),
(4, 12, 17, 40000, 5, 1, NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_owner`
--

INSERT INTO `voucher_owner` (`id`, `offer_id`, `voucher_id`, `voucher_view_id`, `from_user_id`, `to_user_id`, `purchased_date`, `sold_date`, `is_active`, `price`, `offer_price`, `offer_percent`, `buy_price`, `transfer_type`) VALUES
(1, 1, 1, '', 0, 4, '2016-03-25 12:28:34', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(2, 3, 2, '', 0, 4, '2016-03-25 01:21:07', '0000-00-00 00:00:00', 1, 50.00, 45.00, 10.00, 45.00, ''),
(3, 2, 3, '', 0, 2, '2016-03-25 01:24:35', '0000-00-00 00:00:00', 1, 50.00, 45.00, 10.00, 45.00, ''),
(4, 1, 4, '', 0, 2, '2016-03-25 01:25:58', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(5, 1, 5, '', 0, 2, '2016-03-25 01:27:53', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(6, 9, 6, '', 0, 4, '2016-03-25 02:16:56', '0000-00-00 00:00:00', 1, 100.00, 90.00, 10.00, 90.00, ''),
(7, 1, 7, '', 0, 17, '2016-03-28 04:08:15', '0000-00-00 00:00:00', 1, 23.00, 20.00, 10.00, 20.00, ''),
(8, 9, 8, '', 0, 4, '2016-04-01 11:04:00', '0000-00-00 00:00:00', 1, 100.00, 90.00, 10.00, 90.00, ''),
(9, 9, 9, '', 0, 4, '2016-04-01 11:07:46', '0000-00-00 00:00:00', 1, 100.00, 90.00, 10.00, 90.00, ''),
(10, 9, 10, '', 0, 18, '2016-04-01 11:16:48', '0000-00-00 00:00:00', 1, 100.00, 90.00, 10.00, 90.00, ''),
(11, 11, 11, '', 0, 4, '2016-04-19 06:28:03', '0000-00-00 00:00:00', 1, 40000.00, 36000.00, 10.00, 36000.00, ''),
(12, 17, 12, '', 0, 4, '2016-04-19 06:34:56', '2016-04-19 02:22:55', 0, 60000.00, 48000.00, 20.00, 48000.00, ''),
(13, 1, 13, '', 0, 4, '2016-04-19 06:34:56', '0000-00-00 00:00:00', 1, 25000.00, 20000.00, 20.00, 20000.00, ''),
(14, 17, 14, '', 0, 2, '2016-04-19 12:15:20', '0000-00-00 00:00:00', 1, 60000.00, 48000.00, 20.00, 48000.00, ''),
(15, 17, 15, '', 0, 2, '2016-04-19 12:16:11', '0000-00-00 00:00:00', 1, 60000.00, 48000.00, 20.00, 48000.00, ''),
(16, 11, 17, '', 0, 2, '2016-04-19 12:26:55', '0000-00-00 00:00:00', 1, 40000.00, 36000.00, 10.00, 36000.00, ''),
(17, 13, 18, '', 0, 2, '2016-04-19 12:26:55', '0000-00-00 00:00:00', 1, 25000.00, 20000.00, 20.00, 20000.00, ''),
(18, 17, 12, '', 4, 17, '2016-04-19 02:22:55', '0000-00-00 00:00:00', 1, 60000.00, 48000.00, 20.00, 40000.00, '');

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
  `voucher_bid_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_resales`
--

INSERT INTO `voucher_resales` (`id`, `voucher_id`, `price`, `points`, `user_id`, `is_sold`, `created_on`, `sold_on`, `is_active`, `voucher_bid_id`, `status`) VALUES
(1, 1, 200.00, 0, 4, 0, '2016-03-25 12:03:42', '0000-00-00 00:00:00', 1, 0, ''),
(2, 4, 100.00, 0, 2, 0, '2016-03-25 01:03:36', '0000-00-00 00:00:00', 1, 0, ''),
(3, 3, 500.00, 0, 2, 0, '2016-03-25 01:03:29', '0000-00-00 00:00:00', 1, 0, ''),
(4, 11, 21000.00, 200, 4, 0, '2016-04-19 07:04:49', '0000-00-00 00:00:00', 0, 0, ''),
(5, 12, 45000.00, 0, 4, 1, '2016-04-19 02:04:56', '2016-04-19 02:22:55', 1, 4, '');

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
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_bids`
--
ALTER TABLE `event_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_category_map`
--
ALTER TABLE `event_category_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_images`
--
ALTER TABLE `event_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_location_map`
--
ALTER TABLE `event_location_map`
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
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_map`
--
ALTER TABLE `membership_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_category_map`
--
ALTER TABLE `merchant_category_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_location_map`
--
ALTER TABLE `merchant_location_map`
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
-- Indexes for table `offer_category_map`
--
ALTER TABLE `offer_category_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_images`
--
ALTER TABLE `offer_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_outlet_map`
--
ALTER TABLE `offer_outlet_map`
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
-- Indexes for table `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outlet_category_map`
--
ALTER TABLE `outlet_category_map`
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
-- Indexes for table `resturant_category_map`
--
ALTER TABLE `resturant_category_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resturant_images`
--
ALTER TABLE `resturant_images`
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
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `event_bids`
--
ALTER TABLE `event_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `event_category_map`
--
ALTER TABLE `event_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `event_images`
--
ALTER TABLE `event_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `event_location_map`
--
ALTER TABLE `event_location_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `interested_swap`
--
ALTER TABLE `interested_swap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `location_category_map`
--
ALTER TABLE `location_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `membership_map`
--
ALTER TABLE `membership_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `merchant_category_map`
--
ALTER TABLE `merchant_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=298;
--
-- AUTO_INCREMENT for table `merchant_location_map`
--
ALTER TABLE `merchant_location_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `offer_category_map`
--
ALTER TABLE `offer_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `offer_images`
--
ALTER TABLE `offer_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `offer_outlet_map`
--
ALTER TABLE `offer_outlet_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `offer_types`
--
ALTER TABLE `offer_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `outlet_category_map`
--
ALTER TABLE `outlet_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `resturant_category_map`
--
ALTER TABLE `resturant_category_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `resturant_images`
--
ALTER TABLE `resturant_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `swap`
--
ALTER TABLE `swap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `voucher_bids`
--
ALTER TABLE `voucher_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `voucher_owner`
--
ALTER TABLE `voucher_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `voucher_resales`
--
ALTER TABLE `voucher_resales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wine`
--
ALTER TABLE `wine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
