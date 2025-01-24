-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 12:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'Stayzone', 'sz1111');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phonenum`, `address`) VALUES
(26, 27, 'Deluxe Room', 500, 500, NULL, 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(27, 28, 'Luxury Room', 800, 1600, NULL, 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(28, 29, 'Luxury Room', 800, 1600, 'a5', 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(29, 30, 'Deluxe Room', 500, 6500, '211', 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(30, 31, 'Simple room', 300, 300, '20', 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(31, 32, 'Simple room', 300, 600, NULL, 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(32, 33, 'Simple room', 300, 300, NULL, 'RAVIRAJ RATHOD', '07878008575', 'Svashray Shosayti'),
(33, 34, 'Luxury Room', 800, 1600, '05', 'sanni', '9405241900', 'ankur'),
(34, 35, 'Luxury Room', 800, 800, '1', 'sanni', '9405241900', 'ankur'),
(35, 36, 'Luxury Room', 800, 2400, '1', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(36, 37, 'Luxury Room', 800, 6400, 's1', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(37, 38, 'Deluxe Room', 500, 4500, 'dr56', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(38, 39, 'Deluxe Room', 500, 4000, '32', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(39, 40, 'Simple room', 300, 13500, NULL, 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(40, 41, 'Luxury Room', 800, 4000, NULL, 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(41, 42, 'Supreme Deluxe Room', 900, 1800, 'sd222', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti'),
(42, 43, 'Supreme Deluxe Room', 900, 8100, 'sd22222', 'RAVIRAJ Rathod', '07878008575', 'Svashray Shosayti');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'panding',
  `order_id` varchar(150) NOT NULL,
  `trans_amt` int(11) NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'panding',
  `rate_review` int(11) DEFAULT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_amt`, `trans_status`, `rate_review`, `datentime`) VALUES
(27, 1, 6, '2024-10-08', '2024-10-09', 0, 1, 'cancelled', 'ORD_15527568', 500, 'done', NULL, '2024-10-07 16:48:52'),
(28, 1, 7, '2024-10-16', '2024-10-18', 0, 1, 'cancelled', 'ORD_19726809', 1600, 'done', NULL, '2024-10-07 19:21:37'),
(29, 1, 7, '2024-10-16', '2024-10-18', 1, NULL, 'booked', 'ORD_1669864', 1600, 'done', 1, '2024-10-07 19:27:41'),
(30, 1, 6, '2024-10-16', '2024-10-29', 1, NULL, 'booked', 'ORD_13982630', 6500, 'done', 1, '2024-10-07 19:27:54'),
(31, 1, 4, '2024-10-09', '2024-10-10', 1, NULL, 'booked', 'ORD_19064017', 300, 'done', 1, '2024-10-08 15:41:08'),
(32, 1, 4, '2024-10-08', '2024-10-10', 0, 1, 'cancelled', 'ORD_19123505', 600, 'done', NULL, '2024-10-08 15:48:17'),
(33, 1, 4, '2024-10-09', '2024-10-10', 0, 0, 'cancelled', 'ORD_18847392', 300, 'done', NULL, '2024-10-09 16:20:23'),
(34, 4, 7, '2024-10-10', '2024-10-12', 1, NULL, 'booked', 'ORD_45444357', 1600, 'done', 0, '2024-10-10 16:03:53'),
(35, 4, 7, '2024-10-11', '2024-10-12', 1, NULL, 'booked', 'ORD_49278889', 800, 'done', 0, '2024-10-10 16:04:57'),
(36, 1, 7, '2024-10-16', '2024-10-19', 1, NULL, 'booked', 'ORD_17460914', 2400, 'done', 1, '2024-10-11 11:51:12'),
(37, 1, 7, '2024-10-16', '2024-10-19', 1, NULL, 'booked', 'ORD_13014103', 6400, 'done', 1, '2024-10-11 11:51:47'),
(38, 1, 6, '2024-10-30', '2024-11-08', 1, NULL, 'booked', 'ORD_14006397', 4500, 'done', 1, '2024-10-11 12:58:20'),
(39, 1, 6, '2024-10-30', '2024-11-07', 1, NULL, 'booked', 'ORD_19513214', 4000, 'done', 1, '2024-10-11 13:38:43'),
(40, 1, 4, '2024-10-28', '2024-12-12', 0, NULL, 'booked', 'ORD_15327116', 13500, 'done', NULL, '2024-10-11 13:39:01'),
(41, 1, 7, '2024-10-27', '2024-11-01', 0, NULL, 'booked', 'ORD_1243946', 4000, 'done', NULL, '2024-10-11 13:39:22'),
(42, 1, 8, '2024-10-14', '2024-10-16', 1, NULL, 'booked', 'ORD_11334812', 1800, 'done', 1, '2024-10-11 13:39:39'),
(43, 1, 8, '2024-10-21', '2024-10-30', 1, NULL, 'booked', 'ORD_14367715', 8100, 'done', 1, '2024-04-11 14:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `sr_no` int(11) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`sr_no`, `image`) VALUES
(4, 'IMG_98247.png'),
(5, 'IMG_70893.png'),
(7, 'IMG_17971.png'),
(8, 'IMG_71639.png'),
(9, 'IMG_23868.png'),
(10, 'IMG_78469.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gmap` varchar(100) NOT NULL,
  `pn1` varchar(30) NOT NULL,
  `pn2` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `tw` varchar(100) NOT NULL,
  `iframe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `fb`, `insta`, `tw`, `iframe`) VALUES
(1, 'Yagnik Road , Rajkot ,Gujarat', 'https://maps.app.goo.gl/xuRLzmomB3FUzkb56', '919409241900', '919173750737', 'ask.StayzoneHotel@gmail.com', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://x.com/', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d118147.80351149273!2d70.82129635!3d22.27348695!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959c98ac71cdf0f:0x76dd15cfbe93ad3b!2sRajkot, Gujarat!5e0!3m2!1sen!2sin!4v1723863421925!5m2!1sen!2sin');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `icon`, `name`, `description`) VALUES
(2, 'IMG_47298.svg', 'Wifi', 'free wifi available'),
(3, 'IMG_31558.svg', 'Television', 'provide television in room'),
(4, 'IMG_65610.svg', 'Air Conditioner', 'provide air conditioner in room'),
(5, 'IMG_72188.svg', 'Spa', 'provide spa facilities'),
(7, 'IMG_53008.svg', 'Geyser', 'provide a geyser in bathroom'),
(8, 'IMG_19803.svg', 'Room Heater', 'provide a heater in room');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(4, 'Balcony'),
(6, 'Bedroom'),
(8, 'Bathroom'),
(9, 'Sofa');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`sr_no`, `booking_id`, `room_id`, `user_id`, `rating`, `review`, `seen`, `datentime`) VALUES
(3, 39, 6, 1, 3, 'hotel the best', 1, '2024-10-11 13:42:30'),
(4, 38, 6, 1, 4, 'teh best hoteled for', 1, '2024-10-11 13:42:56'),
(5, 37, 7, 1, 5, 'the bedstdeeddvesh', 1, '2024-10-11 13:43:39'),
(6, 43, 8, 1, 5, 'the best service of the room and very rich', 1, '2024-10-11 14:29:26'),
(7, 42, 8, 1, 4, 'the service are good the', 0, '2024-10-11 14:30:02'),
(8, 36, 7, 1, 4, 'good', 0, '2024-10-24 21:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `num_room` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `num_room`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(4, 'Simple room', 250, 300, 5, 2, 2, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Error ipsa amet sequi doloremque odio veritatis! Necessitatibus laborum ab culpa quam!', 1, 0),
(6, 'Deluxe Room', 300, 500, 14, 3, 2, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Error ipsa amet sequi doloremque odio veritatis! Necessitatibus laborum ab culpa quam!', 1, 0),
(7, 'Luxury Room', 500, 800, 2, 5, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Error ipsa amet sequi doloremque odio veritatis! Necessitatibus laborum ab culpa quam!', 1, 0),
(8, 'Supreme Deluxe Room', 650, 900, 5, 6, 4, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Error ipsa amet sequi doloremque odio veritatis! Necessitatibus laborum ab culpa quam!', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_facilities`
--

CREATE TABLE `room_facilities` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_facilities`
--

INSERT INTO `room_facilities` (`sr_no`, `room_id`, `facilities_id`) VALUES
(39, 4, 3),
(40, 4, 7),
(54, 8, 2),
(55, 8, 3),
(56, 8, 4),
(57, 8, 7),
(58, 8, 8),
(59, 6, 3),
(60, 6, 4),
(61, 6, 7),
(62, 7, 2),
(63, 7, 3),
(64, 7, 4),
(65, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `room_features`
--

CREATE TABLE `room_features` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_features`
--

INSERT INTO `room_features` (`sr_no`, `room_id`, `features_id`) VALUES
(34, 4, 6),
(35, 4, 8),
(48, 8, 4),
(49, 8, 6),
(50, 8, 8),
(51, 8, 9),
(52, 6, 4),
(53, 6, 6),
(54, 6, 8),
(55, 6, 9),
(56, 7, 4),
(57, 7, 6),
(58, 7, 8),
(59, 7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(8, 4, 'IMG_54715.png', 1),
(9, 4, 'IMG_64912.png', 0),
(10, 6, 'IMG_38115.png', 1),
(11, 7, 'IMG_22848.png', 1),
(12, 8, 'IMG_21341.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'StayZone', 'At StayZone Hotel, we are committed to providing an exceptional array of facilities to enhance your experience.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_details`
--

INSERT INTO `team_details` (`sr_no`, `name`, `picture`) VALUES
(13, 'Person-1', 'IMG_82402.jpg'),
(14, 'Person-2', 'IMG_94449.jpg'),
(15, 'Person-3', 'IMG_49066.jpg'),
(16, 'Person-4', 'IMG_12596.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(120) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `dob` date NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `email`, `address`, `phonenum`, `pincode`, `dob`, `profile`, `password`, `status`, `datentime`) VALUES
(1, 'RAVIRAJ Rathod', 'ravi@gmail.com', 'Svashray Shosayti', '07878008575', 360004, '2004-11-11', 'IMG_70597.jpeg', '$2y$10$zUrPMvM5URyJah1aiuFazuzYOM3gnBkBO2kh2gPSOJyYnzVVfu5uC', 1, '2024-10-01 15:39:46'),
(4, 'sanni', 'sanni@gmail.com', 'ankur', '9405241900', 360004, '2005-02-08', 'IMG_73119.jpeg', '$2y$10$rA6P5hUCYBUmJkJfjmg7AO2076XPmbQglcF7/H.EzUy/jbRvrCXoO', 1, '2024-10-06 16:48:59'),
(6, 'sanni', 'sa@gmail.com', 'ksjd', '9898706942', 360004, '2024-10-24', 'IMG_30783.jpeg', '$2y$10$88Dffat/3qxzXhWdokFDG.j6VWj7WBua9Y8dHZawmWjU./VXA.Vwq', 0, '2024-10-09 23:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`sr_no`, `name`, `email`, `subject`, `message`, `datentime`, `seen`) VALUES
(8, 'raviraj', 'r@yahoo.com', 'aaa', 'asgvdbfnrd', '2024-09-13 00:00:00', 1),
(9, 'sanni', 's@yahoo.com', 'ssss', 'sdgdfhdf', '2024-09-13 00:00:00', 1),
(10, 'deep', 'd@yahoo.com', 'sgs', 'agdsbfdhfg', '2024-09-13 00:00:00', 1),
(11, 'deep', 'deep@gmail.com', 'service', 'good services', '2024-10-13 18:18:42', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `room id` (`room_id`);

--
-- Indexes for table `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `rm id` (`room_id`),
  ADD KEY `features id` (`features_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `room_features`
--
ALTER TABLE `room_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Constraints for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `facilities id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `room id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_features`
--
ALTER TABLE `room_features`
  ADD CONSTRAINT `features id` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
