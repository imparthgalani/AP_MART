-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 05:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ap_mart`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR` (`x` VARCHAR(255), `delim` VARCHAR(12), `pos` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN 
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cancel_order`
--

CREATE TABLE `cancel_order` (
  `order_list_id` int(11) NOT NULL,
  `shop_product_id` int(11) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel_order`
--

INSERT INTO `cancel_order` (`order_list_id`, `shop_product_id`, `reason`, `comment`) VALUES
(115, 0, 'I want to convert my order to Prepaid', '1233'),
(211, 0, 'I want to convert my order to Prepaid', 'asdadas'),
(212, 0, 'Expected delivery time is very long', ''),
(214, 0, 'Expected delivery time is very long', ''),
(411, 83, 'I want to convert my order to Prepaid', 'dasasdasd'),
(411, 0, 'I want to change my phone number', 'edasdas'),
(619, 0, 'I have changed my mind', ''),
(611, 0, 'I have changed my mind', ''),
(811, 0, '', ''),
(1111, 0, 'Expected delivery time is very long', ''),
(911, 0, 'I want to change address for the order ', ''),
(1011, 0, 'I have purchased the product elsewhere', ''),
(1012, 0, 'I want to convert my order to Prepaid', ''),
(814, 0, 'I want to cancel due to product quality issues', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `shop_product_id`, `quantity`) VALUES
(1166, 22, 48, 0),
(1216, 22, 67, 0),
(1220, 22, 14, 0),
(1247, 22, 50, 0),
(1258, 22, 46, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `name`, `image`) VALUES
(14, 'Vegetables & Fruits', 'Vegetables & Fruits.svg'),
(15, 'Grocery & Staples', 'Grocery & Staples.svg'),
(16, 'Dairy & Eggs', 'Dairy & Eggs.svg'),
(19, 'Beverages', 'Beverages.svg'),
(20, 'Snacks ', 'Snacks .svg'),
(21, 'Home Care', 'Home Care.svg'),
(22, 'Noodles & Sauces', 'Noodles & Sauces.svg'),
(23, 'Personal Care', 'Personal Care.svg'),
(24, 'Pet Care', 'Pet Care.svg'),
(25, 'Meat & Seafood', 'Meat & Seafood.svg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_us_id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_us_id`, `full_name`, `email`, `subject`, `message`) VALUES
(1, 'Ankit Chauhan', 'achauhan645@rku.ac.in', 'Hiiii', 'Good Morning'),
(3, 'Dasharath Makawana', 'dmakawana234@rku.ac.in', 'Hello', 'Good noon'),
(4, 'Khalid Ansari', 'kansari456@gmail.com', 'Heyy', 'asdaf'),
(5, 'Parth Galani', 'pgalani193@rku.ac.in', 'Add Shop...', 'I Have Add Shop On the WebSite.');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_address`
--

CREATE TABLE `delivery_address` (
  `delivery_address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `flat` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `locality` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_address`
--

INSERT INTO `delivery_address` (`delivery_address_id`, `user_id`, `title`, `flat`, `street`, `pincode`, `locality`) VALUES
(1, 22, 'Home', 24, 'Street no-7, Patel Socity, Hifali', 364710, 'Botad'),
(37, 22, 'Office', 347, 'Street no-5, Patel Socity, Hifali', 364710, 'sfas'),
(46, 22, 'Other', 25, 'Street no-11, Patel Socity, Hifali', 364710, 'Botad'),
(50, 50, 'Office', 152, 'Mahavir Society', 360020, 'Rajkot'),
(51, 108, 'Other', 152, 'Mahavir Society', 360020, 'Amreli');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_detail`
--

CREATE TABLE `delivery_detail` (
  `delivery_detail_id` int(11) NOT NULL,
  `custmore_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `alt_phone` varchar(30) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `paymentmethod` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_detail`
--

INSERT INTO `delivery_detail` (`delivery_detail_id`, `custmore_name`, `email`, `phone`, `alt_phone`, `delivery_address_id`, `delivery_time`, `paymentmethod`) VALUES
(1, 'Ankit Chauhan', 'kansari456@gmail.com', '8596968574', '6352415986', 1, 2, 'Cash on Delivery'),
(2, 'Ankit Chauhan', 'kansari456@gmail.com', '8596857496', '8596968574', 1, 2, 'Cash on Delivery'),
(3, 'Khalid Ansari', 'kansari456@gmail.com', '9067117191', '8596859685', 1, 5, 'Cash on Delivery'),
(4, 'aadad', 'kansari45asd6@gmail.com', '9685968596', '9685968596', 1, 5, 'Cash on Delivery'),
(5, 'aadad', 'kansari45asd6@gmail.com', '9685968596', '9685968596', 1, 2, 'Cash on Delivery'),
(6, 'Ayush', 'ayush123@gmail.com', '9067117191', '9067117191', 50, 5, 'Cash on Delivery'),
(7, 'Ayush', 'ayush123@gmail.com', '9067117191', '9067117191', 50, 2, 'Cash on Delivery'),
(8, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 2, 'Cash on Delivery'),
(9, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 2, 'Cash on Delivery'),
(10, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 5, 'Cash on Delivery'),
(11, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 5, 'Cash on Delivery'),
(12, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 1, 'Cash on Delivery'),
(13, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '8200084848', 51, 1, 'Cash on Delivery'),
(14, 'Ayush', 'ayush123@gmail.com', '9067117191', '9067117191', 50, 2, 'Cash on Delivery'),
(15, 'Ayush', 'ayush123@gmail.com', '9067117191', '9067117191', 50, 5, 'Cash on Delivery'),
(16, 'Ayush', 'ayush123@gmail.com', '9067117191', '9067117191', 50, 2, 'Cash on Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `shop_id`, `user_id`, `shop_product_id`, `quantity`) VALUES
(303, 1, 15, 22, 69, 1),
(304, 1, 11, 22, 8, 1),
(305, 1, 11, 22, 11, 2),
(306, 1, 11, 22, 57, 3),
(307, 1, 11, 22, 12, 1),
(308, 1, 11, 22, 83, 2),
(309, 1, 13, 22, 65, 2),
(310, 1, 13, 22, 64, 3),
(311, 1, 13, 22, 63, 4),
(312, 1, 15, 22, 70, 1),
(313, 1, 16, 22, 36, 1),
(314, 1, 16, 22, 33, 1),
(315, 1, 16, 22, 74, 1),
(316, 2, 12, 22, 14, 1),
(317, 2, 14, 22, 67, 1),
(318, 2, 11, 22, 8, 1),
(319, 2, 11, 22, 9, 1),
(320, 2, 11, 22, 83, 1),
(321, 2, 19, 22, 55, 1),
(322, 2, 19, 22, 53, 1),
(323, 2, 19, 22, 56, 1),
(324, 2, 12, 22, 15, 1),
(325, 2, 12, 22, 62, 1),
(452, 3, 19, 22, 55, 1),
(453, 3, 19, 22, 51, 1),
(454, 3, 11, 22, 12, 1),
(455, 3, 12, 22, 61, 1),
(456, 3, 11, 22, 8, 1),
(457, 3, 11, 22, 83, 1),
(458, 4, 18, 22, 46, 3),
(459, 4, 11, 22, 8, 7),
(460, 4, 11, 22, 83, 5),
(461, 4, 18, 22, 80, 3),
(465, 5, 11, 22, 83, 1),
(466, 5, 11, 22, 11, 1),
(467, 6, 11, 50, 59, 1),
(468, 6, 11, 50, 57, 1),
(469, 6, 19, 50, 55, 1),
(470, 7, 11, 50, 83, 1),
(471, 7, 11, 50, 86, 1),
(473, 8, 14, 108, 82, 1),
(474, 8, 11, 108, 83, 1),
(476, 9, 11, 108, 8, 1),
(477, 9, 11, 108, 86, 1),
(479, 10, 11, 108, 11, 1),
(480, 10, 11, 108, 9, 1),
(481, 10, 12, 108, 15, 1),
(482, 10, 12, 108, 60, 1),
(486, 11, 11, 108, 86, 1),
(487, 12, 14, 108, 82, 1),
(488, 13, 14, 108, 23, 1),
(489, 13, 14, 108, 25, 1),
(490, 14, 18, 50, 81, 1),
(491, 15, 15, 50, 29, 1),
(492, 16, 14, 50, 82, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `order_list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `delivery_detail_id` int(11) NOT NULL,
  `servicer_id` int(11) DEFAULT 105,
  `status` varchar(30) DEFAULT '1',
  `current_time` varchar(30) NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`order_list_id`, `user_id`, `order_id`, `shop_id`, `delivery_detail_id`, `servicer_id`, `status`, `current_time`, `update_time`) VALUES
(111, 22, 1, 11, 1, 51, '5', '2021-03-24 00:55:46', '2021-03-26 12:35:12'),
(113, 22, 1, 13, 1, 51, '5', '2021-03-24 00:55:46', '2021-03-26 12:35:12'),
(115, 22, 1, 15, 1, 105, '6', '2021-03-24 00:55:46', '2021-04-04 17:21:03'),
(116, 22, 1, 16, 1, 105, '5', '2021-03-24 00:55:46', '2021-04-04 17:21:03'),
(211, 22, 2, 11, 2, 51, '6', '2021-03-26 12:53:33', '2021-03-26 11:15:11'),
(212, 22, 2, 12, 2, 105, '6', '2021-03-26 12:53:33', '2021-04-04 17:21:03'),
(214, 22, 2, 14, 2, 105, '6', '2021-03-26 12:53:33', '2021-04-04 17:21:03'),
(311, 22, 3, 11, 3, 105, '4', '2021-04-04 20:09:39', '2021-04-15 16:05:44'),
(312, 22, 3, 12, 3, 51, '4', '2021-04-04 20:09:39', '2021-04-05 04:08:03'),
(319, 22, 3, 19, 3, 105, '4', '2021-04-04 20:09:39', '2021-04-05 04:01:11'),
(411, 22, 4, 11, 4, 105, '6', '2021-04-05 09:27:23', '2021-04-05 03:59:39'),
(418, 22, 4, 18, 4, 105, '4', '2021-04-05 09:27:23', '2021-04-15 16:05:40'),
(511, 22, 5, 11, 5, 51, '4', '2021-04-05 09:41:26', '2021-04-17 03:29:02'),
(611, 50, 6, 11, 6, 105, '6', '2021-04-15 21:08:54', '2021-04-15 15:43:00'),
(619, 50, 6, 19, 6, 105, '6', '2021-04-15 21:08:55', '2021-04-15 15:42:54'),
(711, 50, 7, 11, 7, 105, '2', '2021-04-15 21:19:46', '2021-04-17 03:30:06'),
(811, 108, 8, 11, 8, 105, '6', '2021-04-15 21:22:55', '2021-04-15 15:54:21'),
(814, 108, 8, 14, 8, 105, '6', '2021-04-15 21:22:55', '2021-04-15 16:00:36'),
(911, 108, 9, 11, 9, 105, '6', '2021-04-15 21:24:41', '2021-04-15 16:00:19'),
(1011, 108, 10, 11, 10, 105, '6', '2021-04-15 21:26:31', '2021-04-15 16:00:24'),
(1012, 108, 10, 12, 10, 105, '6', '2021-04-15 21:26:31', '2021-04-15 16:00:31'),
(1111, 108, 11, 11, 11, 105, '6', '2021-04-15 21:28:40', '2021-04-15 16:00:11'),
(1214, 108, 12, 14, 12, 105, '4', '2021-04-15 21:31:44', '2021-04-15 16:06:34'),
(1314, 108, 13, 14, 13, 105, '3', '2021-04-15 21:34:12', '2021-04-15 16:06:41'),
(1418, 50, 14, 18, 14, 105, '1', '2021-04-17 08:44:09', '2021-04-17 03:14:09'),
(1515, 50, 15, 15, 15, 105, '1', '2021-04-17 08:48:49', '2021-04-17 03:18:49'),
(1614, 50, 16, 14, 16, 105, '1', '2021-04-17 08:49:52', '2021-04-17 03:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `name`, `description`, `image`) VALUES
(6, 14, 'Banana', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Banana.jpeg'),
(7, 14, 'Cabbage', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Cabbage.jpeg'),
(8, 16, 'Cheese', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Cheese.jpeg'),
(9, 16, 'Eags', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Eags.jpeg'),
(10, 15, 'Almond', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Almond.jpeg'),
(11, 14, 'Strawberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Strawberry.jpeg'),
(12, 14, 'Carrots', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Carrots.jpeg'),
(13, 14, 'Kiwi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Kiwi.jpeg'),
(14, 14, 'Brinjal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Brinjal.jpeg'),
(15, 25, 'Meat', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Meat.jpeg'),
(16, 14, 'Orange', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Orange.jpeg'),
(17, 14, 'Onion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Onion.jpeg'),
(18, 14, 'Bell Pepper', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Bell Pepper.jpeg'),
(19, 15, 'Split Green Gram', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Split Green Gram.jpeg'),
(20, 15, 'Green Gram', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Green Gram.jpeg'),
(21, 15, 'Yellow Pigeon Peas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Yellow Pigeon Peas.jpeg'),
(22, 15, 'Split Bengal Gram', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Split Bengal Gram.jpeg'),
(23, 15, 'Bengal Gram', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Bengal Gram.jpeg'),
(24, 15, 'Rice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Rice.jpeg'),
(25, 15, 'Cashew', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Cashew.jpeg'),
(26, 15, 'Pistachio', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Pistachio.jpeg'),
(27, 16, 'Milk', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Milk.jpeg'),
(28, 16, ' Butter Milk', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n\r\n', ' Butter Milk.jpeg'),
(29, 16, 'Panner', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Panner.jpeg'),
(30, 19, 'Coca Cola', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Coca Cola.jpeg'),
(31, 19, 'Red Bull', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Red Bull.jpeg'),
(32, 19, 'Frooti', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n', 'Frooti.jpeg'),
(33, 19, 'Thums Up', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Thums Up.webp'),
(34, 20, 'Char Chare', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n', 'Char Chare.jpeg'),
(35, 20, 'Frenky', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Frenky.jpeg'),
(36, 20, 'Patato Crisps', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n\r\n\r\n', 'Patato Crisps.jpeg'),
(37, 22, 'Meggi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Meggi.jpeg'),
(38, 22, 'Pasta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Pasta.jpeg'),
(39, 22, 'Pizza and Pasta Sauces', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Pizza and Pasta Sauces.jpeg'),
(40, 22, 'Kissan Sauces', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Kissan Sauces.jpeg'),
(41, 24, 'Himalaya Healthy Pet food', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Himalaya Healthy Pet food.png'),
(42, 24, 'Pedigree', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Pedigree.jpeg'),
(43, 24, 'Cat Pride', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n', 'Cat Pride.jpeg'),
(44, 24, 'Arden Grange', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Arden Grange.jpeg'),
(45, 23, 'Himalaya Neem Face Wash', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Himalaya Neem Face Wash.jpeg'),
(46, 23, 'Nivea Body Lotion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Nivea Body Lotion.jpeg'),
(47, 23, 'Bajaj Almond Heir Oil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Bajaj Almond Heir Oil.jpeg'),
(48, 21, 'Harpic', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Harpic.jpeg'),
(49, 21, 'Dustbin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Dustbin.jpeg'),
(50, 21, 'Broom Stick', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Broom Stick.jpeg'),
(51, 21, 'Cleaning Broom', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Cleaning Broom.jpeg'),
(52, 21, 'Colin Spray', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Colin Spray.jpeg'),
(53, 25, 'Cock Soup Mix', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n', 'Cock Soup Mix.webp'),
(54, 25, 'Craw Fish', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Craw Fish.png'),
(55, 25, 'Crab Boil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Crab Boil.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `user_id` int(11) NOT NULL,
  `order_list_id` int(11) NOT NULL,
  `shop_product_id` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `custmore_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` varchar(300) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`user_id`, `order_list_id`, `shop_product_id`, `star`, `custmore_name`, `email`, `message`, `time`) VALUES
(22, 111, 8, 3, 'Khalid Ansari', 'kansari456@gmail.com', 'Very amazing product', '2021-03-27 17:02:50'),
(22, 116, 74, 5, 'Khalid Ansari', 'kansari456@gmail.com', 'asdfdsfsdf', '2021-04-05 04:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL,
  `shop_owner_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `opening_time` varchar(30) NOT NULL,
  `closing_time` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `image` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_owner_id`, `name`, `email`, `phone`, `location`, `opening_time`, `closing_time`, `status`, `address`, `image`) VALUES
(11, 89, 'Mehata Super-mart', 'mehata121@gmail.com', '9512426198', 'Managal Para, Botad', '06:00', '22:00', 'Open', 'vishvmitra street, Botad', 'Mehata Super-mart.jpeg'),
(12, 90, 'Mahadev Store', 'mahadev121@gmail.com', '9845123515', 'Bhagavan Para, Botad', '08:00', '22:00', 'Open', 'ajinka road, Botad', 'Mahadev Store.jpeg'),
(13, 91, 'Patel-Mart', 'patel125@gmail.com', '9945857612', 'Mali Ni Vadi, Botad', '00:19', '18:00', 'Open', 'divanpara road, Botad', 'Patel-Mart.jpeg'),
(14, 92, 'The Body Shop', 'shivnarine456@gmail.com', '9845123256', 'Hifali, Botad', '06:00', '22:00', 'Open', 'Hifli street no.05, Botad', 'The Body Shop.jpeg'),
(15, 93, 'Sonu General Store', 'sonu1215@gmail.com', '7498562385', 'Panjavani Kato, Botad', '06:00', '10:30', 'Open', 'Shishuvihar,Rajkot', 'Sonu General Store.svg'),
(16, 94, 'Garden Store', 'garden1354@gmail.com', '9856237885', 'Haweli Chowk, Botad', '00:02', '19:30', 'Closed', 'hifali, Botad', 'Garden Store.jpeg'),
(17, 95, 'Quality Store', 'quality539@gmail.com', '9898412535', 'Presh, Botad', '06:30', '23:30', 'Open', 'Haweli chowk, Botad', 'Quality Store.jpeg'),
(18, 96, 'Fresh General Store', 'fresh1238@gmail.com', '9898412356', 'Depo, Botad', '08:30', '23:00', 'Open', 'Panjavani kato, Street no.06,Rajkot', 'Fresh General Store.jpeg'),
(19, 97, 'Sadar Store', 'sadar423@gmail.com', '9898410234', 'Presh, Botad', '10:00', '23:00', 'Open', 'Panjawani circle, Botad', 'Sadar Store.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `shop_product_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `mrp` int(11) NOT NULL,
  `discount_mrp` int(11) NOT NULL,
  `net_weigth` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`shop_product_id`, `shop_id`, `product_id`, `mrp`, `discount_mrp`, `net_weigth`, `unit`, `quantity`) VALUES
(8, 11, 32, 12, 10, 300, 'ml', 7),
(9, 11, 27, 28, 25, 400, 'ml', 48),
(10, 11, 48, 90, 80, 750, 'ml', 15),
(11, 11, 55, 200, 180, 750, 'gm', 20),
(12, 11, 38, 28, 25, 80, 'gm', 34),
(13, 12, 31, 110, 100, 450, 'ml', 28),
(14, 12, 9, 8, 6, 15, 'gm', 0),
(15, 12, 10, 900, 850, 1, 'kg', 39),
(16, 12, 24, 150, 145, 1, 'kg', 10),
(17, 12, 37, 20, 18, 80, 'gm', 147),
(18, 13, 33, 45, 43, 450, 'ml', 75),
(19, 13, 8, 15, 12, 10, 'gm', 29),
(20, 13, 15, 180, 175, 1, 'kg', 22),
(21, 13, 11, 80, 75, 1, 'kg', 46),
(22, 13, 17, 30, 28, 1, 'kg', 80),
(23, 14, 30, 48, 45, 450, 'ml', 18),
(24, 14, 29, 100, 95, 280, 'gm', 12),
(25, 14, 19, 90, 88, 1, 'kg', 20),
(26, 14, 26, 400, 380, 750, 'gm', 23),
(27, 14, 52, 90, 89, 70, 'ml', 9),
(28, 15, 33, 50, 45, 450, 'ml', 80),
(29, 15, 28, 15, 12, 600, 'ml', 39),
(30, 15, 21, 80, 78, 1, 'kg', 15),
(32, 15, 53, 100, 98, 250, 'ml', 25),
(33, 16, 42, 500, 495, 850, 'gm', 17),
(34, 16, 39, 150, 145, 750, 'gm', 44),
(35, 16, 50, 300, 299, 1, 'pieces', 39),
(36, 16, 55, 500, 495, 500, 'gm', 25),
(37, 16, 46, 80, 75, 75, 'ml', 14),
(38, 15, 49, 400, 398, 1, 'pieces', 17),
(39, 17, 40, 100, 94, 780, 'ml', 20),
(40, 17, 45, 120, 110, 78, 'ml', 32),
(41, 17, 43, 400, 398, 800, 'gm', 25),
(42, 17, 16, 200, 185, 1, 'kg', 41),
(43, 17, 35, 120, 115, 1, 'pieces', 19),
(44, 18, 25, 1110, 1000, 1, 'kg', 45),
(45, 18, 41, 450, 420, 800, 'gm', 6),
(46, 18, 44, 1625, 1500, 2, 'kg', 0),
(47, 18, 20, 70, 69, 1, 'kg', 15),
(48, 18, 18, 250, 220, 1, 'kg', 0),
(49, 19, 30, 450, 100, 40, 'ml', 0),
(50, 19, 20, 100, 80, 1, 'kg', 0),
(51, 19, 10, 800, 750, 1, 'kg', 11),
(52, 19, 41, 800, 750, 800, 'gm', 5),
(53, 19, 36, 80, 75, 100, 'gm', 45),
(55, 19, 48, 140, 135, 750, 'ml', 12),
(56, 19, 24, 80, 75, 1, 'kg', 29),
(57, 11, 14, 35, 30, 1, 'kg', 12),
(59, 11, 37, 18, 15, 250, 'gm', 29),
(60, 12, 33, 45, 40, 450, 'ml', 38),
(61, 12, 20, 75, 70, 1, 'kg', 76),
(62, 12, 42, 1500, 1200, 2, 'kg', 38),
(63, 13, 27, 28, 25, 450, 'ml', 40),
(64, 13, 38, 28, 25, 80, 'gm', 45),
(65, 13, 6, 35, 29, 1, 'dazon', 80),
(67, 14, 9, 8, 6, 1, 'pieces', 0),
(68, 14, 49, 500, 485, 1, 'pieces', 20),
(69, 15, 32, 12, 10, 100, 'ml', 25),
(70, 15, 24, 150, 140, 1, 'kg', 40),
(71, 15, 54, 450, 390, 500, 'gm', 45),
(72, 16, 37, 18, 15, 80, 'gm', 78),
(73, 16, 25, 1200, 1000, 1, 'kg', 10),
(74, 16, 13, 28, 24, 1, 'pieces', 40),
(75, 17, 21, 75, 70, 1, 'kg', 50),
(76, 17, 48, 150, 120, 750, 'ml', 0),
(77, 17, 14, 30, 25, 1, 'kg', 70),
(78, 18, 27, 50, 45, 800, 'ml', 39),
(79, 18, 31, 110, 100, 750, 'ml', 41),
(80, 18, 37, 18, 15, 80, 'gm', 9),
(81, 18, 17, 30, 25, 1, 'kg', 76),
(82, 14, 6, 30, 25, 1, 'dazon', 37),
(83, 11, 35, 20, 18, 100, 'gm', 37),
(84, 19, 50, 53, 50, 1, 'pieces', 0),
(86, 11, 29, 25, 20, 50, 'gm', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `email`, `phone`, `password`, `image`, `address`, `type`) VALUES
(1, 'Ankit Chauhan', 'achauhan645@rku.ac.in', '9067117191', 'abc@123', 'achauhan645.jpeg', 'Street no -5, Patel Socity, Hifali, Botad, Gujarat', 'admin'),
(2, 'Parth Galani', 'pgalani193@rku.ac.in', '8185809569', '123123', 'pgalani193.jpeg', 'Sanjantimba - 365535, Amreli, Gujarat', 'admin'),
(3, 'Khalid Ansari', 'kansari456@gmail.com', '9685968596', '123123', 'kansari456.png', 'Shishuvihar- 364001,Bhavnagar, Gujarat', 'admin'),
(22, 'Khalid Maheta', 'khalid456@gmail.com', '9067117191', '123123', 'kansari456.jpeg', 'null', 'Customer'),
(31, 'Om Dave', 'odave121@gmail.com', '9067117191', '123123', NULL, NULL, 'Customer'),
(50, 'Ayush', 'ayush123@gmail.com', '9067117191', '123123', 'ayush12234.jpeg', '1313asd\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'Customer'),
(51, 'Shailesh Lakhani ', 'slakhani129@rku.ac.in', '9067117191', '123123', 'slakhani129.jpeg', '1231sadsa', 'Servicer'),
(89, 'Vijay Mehata', 'vijay733@gmail.com', '9595251213', '123123', 'vijay733.jpeg', 'vishvamitra street, Botad\r\n', 'shop_owner'),
(90, 'Amit Patel', 'amit351@gmail.com', '8754263519', 'amit@351', 'amit351.jpeg', 'vikas mehata, Botad\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'shop_owner'),
(91, 'Dinesh Patel', 'dinesh123@gmail.com', '9512523215', 'dinesh@123', 'dinesh123.jpeg', 'Ambavadi circle, Botad\r\n', 'shop_owner'),
(92, 'Shivnarine Galani', 'shivnarine.galani@gmail.com', '9895653214', 'shivnarine@123', 'shivnarine.galani.jpeg', 'hifli street,Botad\r\n', 'shop_owner'),
(93, 'Sonu Tivari', 'sonu735@gmail.com', '9865124258', 'sonu@735', 'sonu735.jpeg', 'Sanskar mandal ciecle, Rajkot\r\n', 'shop_owner'),
(94, 'Mitali Chauhan', 'mitali.chauhan@gmail.com', '9812456285', 'mitul@123', 'mitali.chauhan.jpeg', 'gogha circle, Botad\r\n', 'shop_owner'),
(95, 'Akshay Lakhani', 'aksha.lakhani@gmail.com', '9898410874', 'aksha@123', 'aksha.lakhani.jpeg', 'Shishuvihar,Botad\r\n', 'shop_owner'),
(96, 'Nihal Trivedi', 'nihal.trivedi@gmail.com', '9999453585', 'nihal@123', 'nihal.trivedi.jpeg', 'Batan library, Ramantra circle, Rajkot\r\n', 'shop_owner'),
(97, 'Rajera Monika', 'rajere.monika@gmail.com', '9512423678', 'rajere@123', 'rajere.monika.jpeg', 'Kalanala, Botad\r\n', 'shop_owner'),
(99, 'Smit Bhikadiya12', 'smit456@gmail.com', '9067117191', 'smit@456', 'smit456.jpeg', 'sdxfdsfsd', 'shop_owner'),
(105, 'Not Servicer Found', 'notservicerfound@gmail.com', '1231231231', NULL, NULL, NULL, 'Servicer'),
(108, 'Dhruvil Patel', 'dhruvil123@gmail.com', '8200084848', '123123', NULL, NULL, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `shop_product_id`) VALUES
(672, 22, 11),
(669, 22, 13),
(674, 22, 17),
(671, 22, 38),
(675, 22, 46),
(667, 22, 62),
(677, 22, 76),
(663, 22, 83);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancel_order`
--
ALTER TABLE `cancel_order`
  ADD UNIQUE KEY `order_list_id` (`order_list_id`,`shop_product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`shop_product_id`),
  ADD KEY `shop_product_id` (`shop_product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`),
  ADD UNIQUE KEY `unique` (`name`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_us_id`);

--
-- Indexes for table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`delivery_address_id`);

--
-- Indexes for table `delivery_detail`
--
ALTER TABLE `delivery_detail`
  ADD PRIMARY KEY (`delivery_detail_id`),
  ADD KEY `delivery_address_id` (`delivery_address_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD UNIQUE KEY `order_id` (`order_id`,`shop_product_id`),
  ADD KEY `shop_product_id` (`shop_product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`order_list_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `unique` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD UNIQUE KEY `order_list_id` (`order_list_id`,`shop_product_id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_id`),
  ADD UNIQUE KEY `unique` (`name`),
  ADD KEY `shop_owner_id` (`shop_owner_id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`shop_product_id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`shop_product_id`),
  ADD KEY `shop_product_id` (`shop_product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1286;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `delivery_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `shop_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=678;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_product` (`shop_product_id`);

--
-- Constraints for table `delivery_detail`
--
ALTER TABLE `delivery_detail`
  ADD CONSTRAINT `delivery_detail_ibfk_1` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_address` (`delivery_address_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_product` (`shop_product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`categories_id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`shop_owner_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD CONSTRAINT `shop_product_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`),
  ADD CONSTRAINT `shop_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_product` (`shop_product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
