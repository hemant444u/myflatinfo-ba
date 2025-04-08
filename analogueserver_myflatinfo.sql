-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2025 at 01:54 AM
-- Server version: 10.11.11-MariaDB-cll-lve
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `analogueserver_myflatinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `building_id`, `name`, `image`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 'Real estate banners', 'iSsnAioLcbK0.jpg', 'https://www.google.com/search?q=real+estate+banners&sourceid=chrome&ie=UTF-8#vhid=qs58EeYXoqyTZM&vssid=_ko_jZ92JHeSMseMPtInyyQs_74', 'Active', '2025-03-19 12:11:47', '2025-03-26 05:25:37'),
(2, 59, 2, 'Testing 2', 'nYcU1pkUoUDG.jpeg', 'https://youtube.com', 'Active', '2025-03-19 12:21:16', '2025-03-19 12:21:16'),
(3, 59, 1, 'Test', 'bCcH3VBCp40a.png', 'https://youtube.com', 'Active', '2025-03-19 12:27:10', '2025-03-19 12:27:10'),
(4, 78, 6, 'New Offer', 'LkxeQRb4dvaj.jpg', 'https://www.google.com/search?q=ugadi&oq=Ugad&sourceid=chrome&ie=UTF-8', 'Active', '2025-03-19 13:03:39', '2025-03-19 13:03:39'),
(5, 78, 6, 'Ugadi', 'uBoP68UTcix6.png', 'https://www.google.com/search?q=ugadi&oq=Ugad&sourceid=chrome&ie=UTF-8', 'Active', '2025-03-19 13:10:55', '2025-03-19 13:10:55'),
(6, 91, 8, 'Ugadi', '3nqvkwjG7GNl.png', 'https://www.google.com/search?q=ugadi&oq=Ugad&sourceid=chrome&ie=UTF-8', 'Active', '2025-03-21 09:27:12', '2025-03-21 09:27:12'),
(7, 91, 8, 'Warangal', 'GTG7Md1KpKQI.jpg', 'https://www.google.com/search?q=ugadi&oq=Ugad&sourceid=chrome&ie=UTF-8', 'Active', '2025-03-21 10:11:25', '2025-03-21 10:11:25'),
(8, 11, 4, 'Experienced Pre School', 'ESCheIRV9fja.jpg', 'www.preschoolteacher.in', 'Active', '2025-03-31 07:07:25', '2025-04-03 12:15:23'),
(9, 11, 4, 'Join Our Dance Classes', 'dgr0e1wZ4dqB.jpeg', 'www.asthadanceclass.in', 'Active', '2025-03-31 07:07:55', '2025-04-03 11:46:31'),
(10, 11, 4, 'Play school', 'PXmhpYQjiqiH.jpg', 'www.playschool.in', 'Active', '2025-04-03 11:47:55', '2025-04-03 11:47:55'),
(11, 11, 4, 'Homemade food available', 'AwdIW6Z24VSq.jpg', 'www.ajikirasoi.in', 'Active', '2025-04-03 12:27:31', '2025-04-03 12:27:31'),
(12, 11, 4, 'Kids Dance Class', 'yhCOzy3isgxo.jpg', 'www.kidsdanceclass.in', 'Active', '2025-04-03 12:35:25', '2025-04-03 12:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `building_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Block A', 'Active', '2025-03-25 06:09:49', '2025-03-25 06:11:16', NULL),
(2, 4, 'A Block', 'Active', '2025-03-31 07:02:00', '2025-03-31 07:02:00', NULL),
(3, 4, 'B Block', 'Active', '2025-03-31 07:02:10', '2025-03-31 07:02:10', NULL),
(4, 4, 'C Block', 'Active', '2025-03-31 07:02:19', '2025-03-31 07:02:19', NULL),
(5, 2, 'Block SRH', 'Active', '2025-04-01 09:51:49', '2025-04-01 09:51:49', NULL),
(6, 4, 'D Block', 'Active', '2025-04-03 06:32:09', '2025-04-03 06:32:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `timing_id` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `members` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `facility_id`, `user_id`, `building_id`, `date`, `timing_id`, `status`, `members`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10, 2, '2025-03-31', 1, 'Success', 10, '2025-03-31 11:11:22', '2025-03-31 11:11:22', NULL),
(2, 1, 10, 2, '2025-03-31', 2, 'Success', 10, '2025-03-31 11:11:22', '2025-03-31 11:11:22', NULL),
(3, 1, 10, 2, '2025-04-30', 1, 'Success', 1, '2025-03-31 11:56:15', '2025-03-31 11:56:15', NULL),
(4, 1, 10, 2, '2025-04-30', 1, 'Success', 1, '2025-03-31 11:57:11', '2025-03-31 11:57:11', NULL),
(5, 1, 10, 2, '2025-04-30', 1, 'Success', 1, '2025-03-31 12:18:56', '2025-03-31 12:18:56', NULL),
(6, 1, 10, 2, '2025-04-30', 2, 'Success', 1, '2025-03-31 12:18:56', '2025-03-31 12:18:56', NULL),
(7, 1, 10, 2, '2025-04-30', 2, 'Success', 2, '2025-03-31 12:30:27', '2025-03-31 12:30:27', NULL),
(8, 1, 10, 2, '2025-04-30', 1, 'Success', 2, '2025-03-31 12:30:27', '2025-03-31 12:30:27', NULL),
(9, 1, 10, 2, '2025-04-30', 2, 'Success', 2, '2025-03-31 12:31:52', '2025-03-31 12:31:52', NULL),
(10, 1, 10, 2, '2025-04-30', 2, 'Success', 2, '2025-03-31 12:32:25', '2025-03-31 12:32:25', NULL),
(11, 1, 10, 2, '2025-04-30', 1, 'Success', 2, '2025-03-31 12:32:25', '2025-03-31 12:32:25', NULL),
(12, 1, 10, 2, '2025-04-30', 2, 'Success', 2, '2025-03-31 12:33:43', '2025-03-31 12:33:43', NULL),
(13, 1, 10, 2, '2025-04-30', 2, 'Success', 2, '2025-03-31 12:34:15', '2025-03-31 12:34:15', NULL),
(14, 1, 10, 2, '2025-04-01', 1, 'Success', 1, '2025-04-01 04:22:31', '2025-04-01 04:22:31', NULL),
(15, 1, 10, 2, '2025-04-01', 2, 'Success', 1, '2025-04-01 04:22:31', '2025-04-01 04:22:31', NULL),
(16, 1, 10, 2, '2025-04-02', 1, 'Success', 1, '2025-04-02 04:18:31', '2025-04-02 04:18:31', NULL),
(17, 1, 10, 2, '2025-04-02', 2, 'Success', 1, '2025-04-02 04:18:31', '2025-04-02 04:18:31', NULL),
(18, 1, 10, 2, '2025-04-02', 1, 'Success', 1, '2025-04-02 04:18:46', '2025-04-02 04:18:46', NULL),
(19, 1, 10, 2, '2025-04-02', 2, 'Success', 2, '2025-04-02 04:26:12', '2025-04-02 04:26:12', NULL),
(20, 1, 10, 2, '2025-04-02', 2, 'Success', 2, '2025-04-02 04:27:40', '2025-04-02 04:27:40', NULL),
(21, 1, 10, 2, '2025-04-02', 2, 'Success', 2, '2025-04-02 04:29:10', '2025-04-02 04:29:10', NULL),
(22, 1, 10, 2, '2025-04-02', 1, 'Success', 5, '2025-04-02 04:31:54', '2025-04-02 04:31:54', NULL),
(23, 1, 10, 2, '2025-04-02', 1, 'Success', 2, '2025-04-02 06:04:06', '2025-04-02 06:04:06', NULL),
(24, 1, 10, 2, '2025-04-02', 1, 'Success', 2, '2025-04-02 06:19:47', '2025-04-02 06:19:47', NULL),
(25, 1, 10, 2, '2025-04-02', 2, 'Success', 2, '2025-04-02 06:19:47', '2025-04-02 06:19:47', NULL),
(26, 5, 10, 2, '2025-04-02', 3, 'Success', 1, '2025-04-02 06:25:25', '2025-04-02 06:25:25', NULL),
(27, 5, 10, 2, '2025-04-02', 4, 'Success', 1, '2025-04-02 06:25:25', '2025-04-02 06:25:25', NULL),
(28, 5, 10, 2, '2025-04-02', 3, 'Success', 1, '2025-04-02 06:27:17', '2025-04-02 06:27:17', NULL),
(29, 5, 10, 2, '2025-04-02', 4, 'Success', 1, '2025-04-02 06:27:17', '2025-04-02 06:27:17', NULL),
(30, 1, 10, 2, '2025-04-02', 1, 'Success', 2, '2025-04-02 06:28:59', '2025-04-02 06:28:59', NULL),
(31, 5, 10, 2, '2025-04-02', 3, 'Success', 2, '2025-04-02 06:30:43', '2025-04-02 06:30:43', NULL),
(32, 5, 10, 2, '2025-04-02', 4, 'Success', 2, '2025-04-02 06:30:43', '2025-04-02 06:30:43', NULL),
(33, 5, 10, 2, '2025-04-02', 4, 'Success', 2, '2025-04-02 06:31:48', '2025-04-02 06:31:48', NULL),
(34, 5, 10, 2, '2025-05-02', 3, 'Success', 2, '2025-04-02 06:32:34', '2025-04-02 06:32:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `owner_name` varchar(191) NOT NULL,
  `owner_contact_no` varchar(191) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `zip_code` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `user_id`, `name`, `owner_name`, `owner_contact_no`, `city_id`, `address`, `zip_code`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Test Building', 'Hemant Kumar', '9162035975', 2, 'Chokad', 829110, 'Active', 'jeCtCaFgPjvE.jpeg', '2025-03-24 11:31:06', '2025-03-24 11:31:06', NULL),
(2, 4, 'Blue Horizon Towers', 'Blue Horizon', '9966776697', 1, 'Road No 01, Blue Horizon Circle', 500081, 'Active', 'pCkjWe2ARuUP.png', '2025-03-24 12:06:20', '2025-03-24 12:06:20', NULL),
(3, 4, 'Ocean Breeze Towers', 'Ocean Breeze', '9595666777', 1, 'Road No 05, Ocean Breeze Circle', 500081, 'Active', 'NVw6tkmBXKyL.jpg', '2025-03-24 12:13:01', '2025-03-24 12:13:01', NULL),
(4, 11, 'Astha Gardenia', 'Jack', '9876543267', 1, 'Kollur, Hyderabad', 502300, 'Active', 'tGNf3fLUQywn.jpg', '2025-03-31 06:52:20', '2025-03-31 06:52:20', NULL),
(5, 11, 'Luxury Flats-Sarovar', 'Vani', '6789878789', 1, 'Tellapur,Hyderabad', 502032, 'Active', 'HvMB6cR2vvMO.jpg', '2025-03-31 06:54:25', '2025-03-31 06:54:25', NULL),
(6, 11, 'Lake View - SK', 'Kartik', '8765678789', 1, 'Mayuri Nagar, Bachupally', 502031, 'Pending', 'Dn8L2Xqat6aZ.jpg', '2025-03-31 06:56:12', '2025-03-31 06:56:12', NULL),
(7, 23, 'Meghastara', 'Megha', '7890123456', 1, 'Kondapur', 500049, 'Active', 'cfyjhZVjzoaN.jpg', '2025-04-03 09:53:41', '2025-04-03 09:58:07', NULL),
(8, 23, 'Megapolish', 'Megha', '7890123456', 1, 'Hitech City', 500089, 'Active', 'WYVn1LgVyBGu.jpg', '2025-04-03 09:55:49', '2025-04-03 09:56:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `building_users`
--

CREATE TABLE `building_users` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `building_users`
--

INSERT INTO `building_users` (`id`, `building_id`, `user_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 7, 2, '2025-04-02 05:42:33', '2025-04-02 05:42:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hyderabad', '2025-02-05 17:53:40', '2025-02-18 21:44:36', NULL),
(2, 'Ranchi', '2025-02-05 17:56:22', '2025-02-05 17:56:22', NULL),
(3, 'Bhubaneswar', '2025-03-01 20:15:35', '2025-03-01 20:15:35', NULL),
(4, 'Warangal', '2025-03-10 08:24:28', '2025-03-10 08:24:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classifieds`
--

CREATE TABLE `classifieds` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `classifieds`
--

INSERT INTO `classifieds` (`id`, `building_id`, `block_id`, `flat_id`, `category`, `user_id`, `title`, `desc`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 3, 'All Buildings', 10, 'RCB tv', 'TV un', 'Pending', '2025-03-27 07:21:36', '2025-03-27 08:15:21', '2025-03-27 08:15:21'),
(2, 2, 1, 3, 'All Buildings', 10, 'Hello', 'Yesssss', 'Pending', '2025-03-27 08:17:44', '2025-03-27 08:19:07', '2025-03-27 08:19:07'),
(3, 2, 1, 3, 'All Buildings', 10, 'Gym fitness', 'Come and enjoy for your fitness', 'Approved', '2025-03-27 08:21:42', '2025-03-27 09:06:16', '2025-03-27 09:06:16'),
(4, 2, 1, 3, 'Within Building', 10, 'Dbdbbd', 'Hdhdh', 'Pending', '2025-03-27 09:07:41', '2025-03-27 09:08:53', '2025-03-27 09:08:53'),
(5, 2, 1, 3, 'Within Building', 10, 'My frd living league', 'Dgdhdb', 'Approved', '2025-03-27 09:09:30', '2025-03-27 09:49:30', '2025-03-27 09:49:30'),
(6, 2, 1, 3, 'Within Building', 10, 'Dbhdjdbd jd is djd djd jx xis zhe gb sb d d x x x fc dnd djd ks sks skd zno', 'Dbdo eks sod is djd s e gm Hnn Hnn Hnn Hnn cc Hnn Hnn Hnn Hnn Hnn Hnn yha y y c uu uu Hnn Hnn cc Hnn Hnn Hnn Hnn Hnn cc Hnn Hnn Hnn Hnn yha xbrb xx raa DD DD gg tb yy gtb gb tv FF sc tv hh FC ss bh Hnn gg I UCC DC DC hh tv ss SBB FC gn I\'m in in km km km okk in GB TV DC SS ex ex tv tv un in in in fc RC es es aa\" un in in in fc dx dc GB in', 'Send For Editing', '2025-03-27 09:42:45', '2025-03-27 09:44:51', NULL),
(7, 2, 1, 3, 'Within Building', 10, 'Bddb', 'Xbxjb', 'Approved', '2025-03-27 09:44:02', '2025-03-27 09:44:28', NULL),
(8, 2, 1, 3, 'All Buildings', 10, 'Dbhdjdbd jd is djd djd jx xis zhe gb sb d d x x x fc dnd djd ks sks skd zno', 'Dbdo vvvvbhhvbbbv', 'Pending', '2025-03-27 09:49:06', '2025-03-27 09:49:06', NULL),
(9, 2, 1, 3, 'All Buildings', 10, 'Hero is always a hero', 'Dbdo eks sod is djd s e gm Hnn Hnn Hnn Hnn cc Hnn Hnn Hnn Hnn Hnn Hnn yha y y c uu uu Hnn Hnn cc Hnn Hnn Hnn Hnn Hnn cc Hnn Hnn Hnn Hnn yha xbrb xx raa DD DD gg tb yy gtb gb tv FF sc tv hh FC ss bh Hnn gg I UCC DC DC hh tv ss SBB FC gn I\'m in in km km km okk in GB TV DC SS ex ex tv tv un in in in fc RC es es aa\" un in in in fc dx dc GB in', 'Approved', '2025-03-27 09:49:56', '2025-03-27 09:50:48', NULL),
(10, 4, 3, 5, 'Within Building', 17, 'Yoga Classes in Society – Join Now!', 'Yoga Classes for All Age Groups\nStay fit and stress-free with our daily yoga sessions!\n\nMorning & Evening Batches Available\nCertified Instructor\nVenue: Society Clubhouse/Lawn\nContact: Nikki, 6345670987', 'Send For Editing', '2025-03-31 10:03:55', '2025-03-31 12:06:23', '2025-03-31 12:06:23'),
(11, 4, 3, 5, 'Within Building', 17, 'Weekend Kids\' Activity Club – Enroll Your Child!', 'Fun-Filled Weekend Activities for Kids\n\nGive your child a chance to learn & grow with engaging activities:\n\nArt & Craft\nStorytelling & Reading Club\nDance & Music Sessions\nLocation: Society Garden \nContact: Nikki, 6345678909', 'Pending', '2025-03-31 10:38:23', '2025-03-31 12:09:16', '2025-03-31 12:09:16'),
(12, 4, 3, 5, 'Within Building', 17, 'Looking for Enthusiastic Kids to Join Fun Activities!', 'Dear Parents,\n\nWe are organizing exciting activities for kids in our society to encourage learning, creativity, and fun! Activities include:\n\nArt & Craft\nOutdoor Games\nStorytelling\nDance & Music\nPuzzle & Brain Games\n\nLocation: Club House\n\nAge Group: 5-10', 'Pending', '2025-03-31 12:43:49', '2025-03-31 12:55:02', '2025-03-31 12:55:02'),
(13, 4, 3, 5, 'Within Building', 17, 'Didi', 'Hell happ kesi kar all  ep ka jaap kaisi koko kar busy bulao moti b hogi help keep', 'Pending', '2025-03-31 13:23:27', '2025-03-31 13:23:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classified_photos`
--

CREATE TABLE `classified_photos` (
  `id` int(11) NOT NULL,
  `classified_id` int(11) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `classified_photos`
--

INSERT INTO `classified_photos` (`id`, `classified_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 3, '67e50a966a04f.jpg', '2025-03-27 08:21:42', '2025-03-27 08:21:42'),
(2, 7, '67e51de2b88dc.jpg', '2025-03-27 09:44:02', '2025-03-27 09:44:02'),
(3, 7, '67e51de2b97b0.jpg', '2025-03-27 09:44:02', '2025-03-27 09:44:02'),
(4, 7, '67e51de2b9fa6.jpg', '2025-03-27 09:44:02', '2025-03-27 09:44:02'),
(5, 7, '67e51de2baae1.jpg', '2025-03-27 09:44:02', '2025-03-27 09:44:02'),
(6, 10, '67ea688b0114e.jpg', '2025-03-31 10:03:55', '2025-03-31 10:03:55'),
(7, 11, '67ea709fc64fe.jpg', '2025-03-31 10:38:23', '2025-03-31 10:38:23'),
(8, 12, '67ea8e05c8369.jpg', '2025-03-31 12:43:49', '2025-03-31 12:43:49'),
(9, 12, '67ea8e05c8bbb.jpg', '2025-03-31 12:43:49', '2025-03-31 12:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials`
--

CREATE TABLE `essentials` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `essentials`
--

INSERT INTO `essentials` (`id`, `user_id`, `building_id`, `reason`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 4, 'Exterior Walls: Soft Neutral Tones', 7500, 'Active', '2025-03-31 08:16:51', '2025-03-31 08:16:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `essential_payments`
--

CREATE TABLE `essential_payments` (
  `id` int(11) NOT NULL,
  `essential_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `dues_amount` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `essential_payments`
--

INSERT INTO `essential_payments` (`id`, `essential_id`, `user_id`, `building_id`, `flat_id`, `paid_amount`, `type`, `dues_amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 16, 4, 4, 0, 'Created', 7500, 'Unpaid', '2025-03-31 08:16:51', '2025-03-31 08:16:51', NULL),
(2, 1, 18, 4, 5, 0, 'Created', 7500, 'Unpaid', '2025-03-31 08:16:51', '2025-03-31 08:16:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) NOT NULL,
  `from_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `to_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `building_id`, `name`, `desc`, `image`, `from_time`, `to_time`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Ugadi', 'Ugadi or Yugadi, also known as Samvatsarādi, is New Year\'s Day according to the Hindu calendar and is celebrated in the Indian states of Andhra Pradesh, Telangana and Karnataka. The cycle actually consists of 60 years, each year individually named.', 'pAzuK9a2JjEp.png', '2025-03-26 06:01:00', '2025-03-31 06:01:00', 'Active', '2025-03-26 06:01:53', '2025-03-26 06:04:59', NULL),
(2, 4, 'Spring event', 'spring event test', '0ZOos7INUwyc.jpg', '2025-03-31 08:13:00', '2025-04-30 07:26:00', 'Active', '2025-03-31 07:26:18', '2025-03-31 07:26:18', NULL),
(3, 1, 'Test', 'Test Desc', 'GTv5bTgPIlL4.jpeg', '2025-03-31 04:30:00', '2025-04-03 04:30:00', 'Active', '2025-03-31 08:56:04', '2025-03-31 08:56:04', NULL),
(4, 2, 'Hello There', '🎉 Event Name: \"Unity in Diversity: Cultural Celebration\" 🌍\r\n\r\nEvent Description:\r\nCome together for an unforgettable experience at the Unity in Diversity: Cultural Celebration! This event is all about celebrating the rich cultures, traditions, and flavors that make our community so unique. Let’s embrace our diversity and enjoy a day of learning, music, dance, and delicious food.\r\n\r\nEvent Highlights:\r\n\r\nCultural Performances: Dance and music performances representing different cultures.\r\n\r\nInternational Food Festival: Taste authentic dishes from around the world, prepared by local chefs.\r\n\r\nArt & Craft Stalls: Explore unique crafts, artwork, and handmade goods from local artisans.\r\n\r\nWorkshops & Activities: Interactive sessions to learn new skills, including traditional crafts and cooking.', 'vCjnCBPv4gml.jpeg', '2025-03-31 04:30:00', '2025-04-01 04:30:00', 'Active', '2025-03-31 10:03:13', '2025-03-31 10:10:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `building_id`, `reason`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 'gghj', 10, '2025-04-01', '2025-04-01 13:28:19', '2025-04-01 13:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `max_booking` int(11) NOT NULL,
  `per_user_max_booking` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `cancellation_type` varchar(191) NOT NULL,
  `cancellation_value` int(11) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `building_id`, `name`, `max_booking`, `per_user_max_booking`, `price`, `cancellation_type`, `cancellation_value`, `icon`, `color`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Guest Room', 22, 20, 23, 'Percentage', 1, '6XNgDbOBbYKb.png', '#ffbc99', 'Active', '2025-03-27 09:53:10', '2025-04-02 06:06:46', NULL),
(2, 4, 'Swimming Pool', 10, 0, 10, 'Percentage', 5, NULL, NULL, 'Active', '2025-03-31 07:29:11', '2025-03-31 07:29:11', NULL),
(3, 4, 'Club House', 100, 0, 100, 'Other', 50, NULL, NULL, 'Active', '2025-03-31 07:30:00', '2025-03-31 07:30:00', NULL),
(4, 4, 'Guest Room', 8, 0, 100, 'Fixed', 100, NULL, NULL, 'Active', '2025-03-31 07:30:25', '2025-03-31 07:30:25', NULL),
(5, 2, 'Gym', 30, 30, 100, 'Fixed', 10, '9Zg4zl8ShcZj.png', '#FB9B9B', 'Active', '2025-03-31 13:05:01', '2025-03-31 13:05:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `family_members`
--

CREATE TABLE `family_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `relationship` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `family_members`
--

INSERT INTO `family_members` (`id`, `user_id`, `building_id`, `flat_id`, `name`, `relationship`, `phone`, `photo`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 1, 'Vishwa', 'Bother', '997537456', 'N0Ms6FQYfBA2.jpeg', '2025-03-26 05:26:39', '2025-03-26 05:28:05'),
(2, 10, 2, 3, 'Preetham', 'Brother', '9515734313', 'Y3vpayDpnki8.jpeg', '2025-03-26 05:37:52', '2025-03-26 05:37:52'),
(3, 17, 4, 5, 'Keep', 'Mississippi', 'Delhi nation', '39U44DLeWJeQ.jpeg', '2025-04-01 07:04:57', '2025-04-01 07:04:57'),
(4, 17, 4, 5, 'Humdum', 'Model', 'Jennifer&', '3FZxWI625iTv.jpeg', '2025-04-01 07:06:44', '2025-04-01 07:08:31'),
(9, 17, 4, 5, 'Misthi', 'Arnav', '@-&£&(97aaY', '5vCiCsReNi32.jpeg', '2025-04-01 07:09:07', '2025-04-01 07:09:07'),
(10, 17, 4, 5, 'Kyun', 'Kriti', '99510720056900000', 'SHNgAJb6Fqyi.jpeg', '2025-04-01 07:19:43', '2025-04-01 07:19:43'),
(11, 17, 4, 5, 'Judith', 'Medium', '99510', '92leqflty01O.jpeg', '2025-04-01 07:20:11', '2025-04-01 07:20:11'),
(12, 12, 4, 7, 'Function', 'Kuwait', 'Glkeep&', 'IOK8SdCTX2Ic.jpeg', '2025-04-02 12:37:30', '2025-04-02 12:37:30'),
(13, 12, 4, 7, 'Rohith', 'Son', '995107200580000', 'OH1RvLnzXcIn.jpeg', '2025-04-02 12:44:52', '2025-04-02 13:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `flats`
--

CREATE TABLE `flats` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `tanent_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `area` varchar(191) NOT NULL,
  `max_members` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flats`
--

INSERT INTO `flats` (`id`, `building_id`, `block_id`, `owner_id`, `tanent_id`, `name`, `area`, `max_members`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 7, 7, 'A101', '3 BHK', 5, 'Active', '2025-03-25 06:13:19', '2025-03-25 06:13:19', NULL),
(2, 2, 1, 9, 9, 'A102', '2 BHK', 1, 'Active', '2025-03-25 06:17:57', '2025-03-25 06:17:57', NULL),
(3, 2, 1, 10, 10, 'A143', '1029', 3, 'Active', '2025-03-26 05:36:37', '2025-03-26 05:36:53', NULL),
(4, 4, 3, 15, 16, '908', '1400 Sq Ft', 4, 'Active', '2025-03-31 07:12:19', '2025-03-31 11:32:36', NULL),
(5, 4, 3, 17, 18, '1300', '1250 Sq Ft', 4, 'Active', '2025-03-31 07:15:59', '2025-03-31 11:32:46', NULL),
(6, 4, 2, 19, 19, '913', '1700 Sq Ft', 6, 'Active', '2025-03-31 09:14:42', '2025-03-31 09:14:42', NULL),
(7, 4, 2, 12, 12, '1311', '2300 Sq Ft', 8, 'Active', '2025-03-31 09:15:50', '2025-03-31 09:15:50', NULL),
(8, 2, 5, 20, 20, 'SRH001', '3 BHK', 2, 'Active', '2025-04-01 09:52:47', '2025-04-01 09:52:47', NULL),
(9, 2, 5, 21, 21, 'SRH002', '4 BHK', 2, 'Active', '2025-04-01 09:52:48', '2025-04-01 09:53:28', NULL),
(10, 2, 5, 22, 22, 'SRH003', '1BHK', 2, 'Active', '2025-04-01 09:55:59', '2025-04-01 09:55:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`id`, `building_id`, `block_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Gate 1', 'Active', '2025-03-25 06:11:01', '2025-03-25 06:11:01', NULL),
(2, 4, 2, 'Entrance Gate', 'Active', '2025-03-31 07:03:12', '2025-03-31 07:03:48', NULL),
(3, 4, 2, 'Exit Gate', 'Active', '2025-03-31 07:03:25', '2025-03-31 07:03:25', NULL),
(4, 4, 3, 'Entrance  Gate', 'Active', '2025-03-31 07:03:39', '2025-03-31 07:04:01', NULL),
(5, 4, 3, 'Exit Gate', 'Active', '2025-03-31 07:04:13', '2025-03-31 07:04:13', NULL),
(6, 4, 4, 'Entrance  Gate', 'Active', '2025-03-31 07:04:27', '2025-03-31 07:04:27', NULL),
(7, 4, 4, 'Exit Gate', 'Active', '2025-03-31 07:04:43', '2025-03-31 07:04:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gate_passes`
--

CREATE TABLE `gate_passes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `desc` text NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guards`
--

CREATE TABLE `guards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `gate_id` int(11) NOT NULL,
  `shift` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guards`
--

INSERT INTO `guards` (`id`, `user_id`, `building_id`, `block_id`, `gate_id`, `shift`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 2, 1, 1, 'Night', 'Active', '2025-03-25 06:11:37', '2025-03-25 06:11:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  `periority` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `building_id`, `block_id`, `flat_id`, `role_id`, `desc`, `periority`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 3, 3, 'Fb n', 'Medium', 'Pending', '2025-03-26 11:22:44', '2025-03-26 11:22:44', NULL),
(2, 2, 1, 3, 3, 'Fb n', 'Medium', 'Pending', '2025-03-26 11:22:47', '2025-03-26 11:22:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue_photos`
--

CREATE TABLE `issue_photos` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `issue_photos`
--

INSERT INTO `issue_photos` (`id`, `issue_id`, `photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'trip_67e3e384e966e3.75940608.PNG', '2025-03-26 11:22:44', '2025-03-26 11:22:44', NULL),
(2, 2, 'trip_67e3e387e92df1.14862079.PNG', '2025-03-26 11:22:47', '2025-03-26 11:22:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenances`
--

CREATE TABLE `maintenances` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `late_fine_type` varchar(191) NOT NULL,
  `late_fine_value` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maintenances`
--

INSERT INTO `maintenances` (`id`, `user_id`, `building_id`, `from_date`, `to_date`, `amount`, `due_date`, `late_fine_type`, `late_fine_value`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 4, '2025-03-31', '2025-04-12', 1000, '2025-04-15', 'Fixed', 90, 'Active', '2025-03-31 07:32:53', '2025-03-31 07:32:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_payments`
--

CREATE TABLE `maintenance_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `dues_amount` int(11) NOT NULL,
  `late_fine` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maintenance_payments`
--

INSERT INTO `maintenance_payments` (`id`, `user_id`, `building_id`, `flat_id`, `maintenance_id`, `paid_amount`, `type`, `dues_amount`, `late_fine`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 16, 4, 4, 1, 0, 'Created', 1000, 0, 'Unpaid', '2025-03-31 07:32:53', '2025-03-31 07:32:53', NULL),
(2, 18, 4, 5, 1, 0, 'Created', 1000, 0, 'Unpaid', '2025-03-31 07:32:53', '2025-03-31 07:32:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `noticeboards`
--

CREATE TABLE `noticeboards` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `to_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `noticeboards`
--

INSERT INTO `noticeboards` (`id`, `building_id`, `title`, `desc`, `from_time`, `to_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Hyderabad is facing a severe water crisis', 'Hyderabad is facing a severe water crisis with depleting groundwater levels and reliance on expensive private tankers, \r\n\r\n\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\nparticularly in the western corridor, due to rapid urban growth and inadequate water management.\r\n\r\n\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2025-03-26 05:59:00', '2025-04-30 05:59:00', '2025-03-26 05:59:57', '2025-04-03 10:00:57', NULL),
(2, 4, 'Keep Our Society Clean & Well-Maintained', 'Awareness to clean our society', '2025-03-31 07:28:00', '2025-04-30 07:29:00', '2025-03-31 07:28:00', '2025-03-31 07:28:00', NULL),
(3, 4, 'Event Name: \"Unity in Diversity: Cultural Celebration\"', 'Event Description:\r\nCome together for an unforgettable experience at the Unity in Diversity: Cultural Celebration! This event is all about celebrating the rich cultures, traditions, and flavors that make our community so unique. Let’s embrace our diversity and enjoy a day of learning, music, dance, and delicious food.\r\n\r\nEvent Highlights:\r\n\r\nCultural Performances: Dance and music performances representing different cultures.\r\n\r\nInternational Food Festival: Taste authentic dishes from around the world, prepared by local chefs.\r\n\r\nArt & Craft Stalls: Explore unique crafts, artwork, and handmade goods from local artisans.\r\n\r\nWorkshops & Activities: Interactive sessions to learn new skills, including traditional crafts and cooking.', '2025-03-31 10:21:00', '2025-04-30 14:06:00', '2025-03-31 10:02:11', '2025-03-31 10:02:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL DEFAULT 1,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `admin_read` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00b8c00a386911958490bdae938fc26f489a72e28de35879cc26458b5aa8f55c35bd62328684d60c', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:26:40', '2025-03-26 11:26:40', '2026-03-26 16:56:40'),
('013fb23a4d413ab2baaf3ec0928bc11406fc0bb8de0a5adeb66a297df10f46518b23b22e242f0116', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:43:56', '2025-03-26 11:43:56', '2026-03-26 17:13:56'),
('0284b730fcce86791b8f6ebeb26ca095cce24ccfc4dd230a603e8a1159aa944dbb31c54f5c53340d', 10, 5, 'MyApp', '[]', 0, '2025-03-31 09:37:13', '2025-03-31 09:37:13', '2026-03-31 15:07:13'),
('03a74b210c6e0f5a0f92390f1cf36f0f3ae5c05eb94f8db442ca70ed454f2e80df6f16950f38f7a5', 8, 5, 'MyApp', '[]', 0, '2025-03-25 06:11:53', '2025-03-25 06:11:53', '2026-03-25 11:41:53'),
('03a7a9b0652013fe4f0c4011f6037fb95bb4fdb33f7b6b54950c666257a79c98efcb68986fc42e6f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:27:06', '2025-03-26 12:27:06', '2026-03-26 17:57:06'),
('05b3d52175f3b43e1315cc0065b76b9eb4fe31bf188b96631414290abf499fd77a570ce0b099ffda', 8, 5, 'MyApp', '[]', 0, '2025-03-26 07:11:19', '2025-03-26 07:11:19', '2026-03-26 12:41:19'),
('061d45edc9d3e338c5a20547b37644aeeb5522d4a0b2b6a69e0d6f684285e0e8768b196847e991a5', 8, 5, 'MyApp', '[]', 0, '2025-04-03 06:00:00', '2025-04-03 06:00:00', '2026-04-03 11:30:00'),
('0d19aca1b88c9f46da2850523393d31fbf2b3b0585ae42743e068d83d478a56fdbc0707ba4b3f2b4', 8, 5, 'MyApp', '[]', 0, '2025-03-25 06:25:25', '2025-03-25 06:25:25', '2026-03-25 11:55:25'),
('0d42c9b34d8d6f8b68b2f62e7141859e3dd0348e344aa147e218a0ea582c02017fd9c2321e9e77fb', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:13:13', '2025-03-26 10:13:13', '2026-03-26 15:43:13'),
('0d6754e08110308848bbf08a49b6fc03f71fa3c3c96c867dc87e6e60bd7ccf5a2bd500dc9de99120', 8, 5, 'MyApp', '[]', 0, '2025-03-26 07:05:13', '2025-03-26 07:05:13', '2026-03-26 12:35:13'),
('0e493b1054d37ca0e0d51bd2ffae1299265966224a82a61b7e689cfc3c2f954e21ebf7c70215d3ba', 8, 5, 'MyApp', '[]', 0, '2025-04-02 06:34:02', '2025-04-02 06:34:02', '2026-04-02 12:04:02'),
('10e372c6f46794cbafaeda8dbca45524a39c621257ec8809101900a6ced3fc02389745218ffb701e', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:41:41', '2025-03-26 11:41:41', '2026-03-26 17:11:41'),
('11bd43f16c38b197bb0e8627887523d5de46533714bc73ad9515ee25779040670fef9f8fa1d0a8da', 12, 5, 'MyApp', '[]', 0, '2025-03-31 09:09:50', '2025-03-31 09:09:50', '2026-03-31 14:39:50'),
('11e12b0edd8fcf337674560a47009b79bb2be4ae894aca23b67f87599eb10866d8c7d60b6847802f', 17, 5, 'MyApp', '[]', 0, '2025-03-31 09:34:41', '2025-03-31 09:34:41', '2026-03-31 15:04:41'),
('1216b712cdcba0e5eac438b42a3864566bda83409647a124d1e6a726dcf03a1b4ee45726872fcfd3', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:18:29', '2025-03-27 09:18:29', '2026-03-27 14:48:29'),
('133048faf80ffc1313b5f6777e55c40b2c61205c7d5881a7bbe2c74b0ea572c372483eca72bf161e', 17, 5, 'MyApp', '[]', 0, '2025-03-31 12:11:27', '2025-03-31 12:11:27', '2026-03-31 17:41:27'),
('14459190125f9a79b23b9f768a5fdf9806f03f29ce6fea778bc1e2d4ff0bba17c4042f44e4e72e0b', 10, 5, 'MyApp', '[]', 0, '2025-04-01 04:16:17', '2025-04-01 04:16:17', '2026-04-01 09:46:17'),
('14e881879c6ed67e3d75c208430845ebdf2ab7939ae27fb3e1dcb7dc1cb7d805ac5f93c1cce61663', 8, 5, 'MyApp', '[]', 0, '2025-04-03 04:37:52', '2025-04-03 04:37:52', '2026-04-03 10:07:52'),
('14f4bf9f11cbc9c52413792e919551a4d233394ec50376dca4f97c5388dbe43c64398548f0aac00e', 8, 5, 'MyApp', '[]', 0, '2025-04-01 09:54:38', '2025-04-01 09:54:38', '2026-04-01 15:24:38'),
('14f527a4d23a231f7c908220fa616970baa501d185d2b7af8be15f7853ab368a78f9cd95a6564502', 8, 5, 'MyApp', '[]', 0, '2025-03-26 13:06:14', '2025-03-26 13:06:14', '2026-03-26 18:36:14'),
('153eec270b4fd89396616437b2af94c6a6ca1369039f25c2af6a03453be1d959f3c1ebc5bda354f6', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:24:10', '2025-03-26 10:24:10', '2026-03-26 15:54:10'),
('15517b00aaad921c9ffe48ce0ddf46e71d7acc6ce2810c7a675126bb9d407268058bd62889f761a2', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:31:05', '2025-03-26 10:31:05', '2026-03-26 16:01:05'),
('162b6c62a04227653715012fbb2a8d9fdb61c8f31fc6b97d5416fa25a162f3da9227a0af522a3635', 8, 5, 'MyApp', '[]', 0, '2025-04-01 09:30:12', '2025-04-01 09:30:12', '2026-04-01 15:00:12'),
('17a71a3fa6166415b5c9131b35f22977a100d3bc576ea01eb13c2fdd61a5e8957b3093879cdea732', 12, 5, 'MyApp', '[]', 0, '2025-04-02 07:10:51', '2025-04-02 07:10:51', '2026-04-02 12:40:51'),
('1972e663611956d9aec01045feb61a8aa0a36190d4f7572d3fbc04e84e928f67c0a5a69b02c60002', 10, 5, 'MyApp', '[]', 0, '2025-04-02 05:31:35', '2025-04-02 05:31:35', '2026-04-02 11:01:35'),
('1a9582699c91cfea28ceaa1ca2e08d1b7c09ab12de56632d6040e31ad0a719a006fb6cb232c0978d', 8, 5, 'MyApp', '[]', 0, '2025-03-25 09:04:24', '2025-03-25 09:04:24', '2026-03-25 14:34:24'),
('1d1c343e133379054da35074bb7249235ed9527d5cd041b91c3db9731e2afc5d8bfb71a5b9e11a67', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:35:16', '2025-03-26 11:35:16', '2026-03-26 17:05:16'),
('1ea4118b7679f52c81eb5d1fd30363a133aa698a994d429cbf290d73e53e8f074af31ec7ca92f6c8', 8, 5, 'MyApp', '[]', 0, '2025-03-25 09:52:11', '2025-03-25 09:52:11', '2026-03-25 15:22:11'),
('1ece2109e49d08ec1c9db127598c6f00986811a29d00c7309a70a802d2ce4df4a7927f5cf9259b50', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:49:50', '2025-03-26 10:49:50', '2026-03-26 16:19:50'),
('1f07e027e50c6da357201b28c8112bcbd92bebe574b4938ae9ebdf408eee2b620aba9251b46f5206', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:15:33', '2025-03-27 04:15:33', '2026-03-27 09:45:33'),
('1f5dd1b79f37d4b69ab2f3d52713c933bd45f0f5535a065ce0e0bc1e3ce6c3c9eb78d831c437dce4', 2, 5, 'MyApp', '[]', 0, '2025-03-24 11:42:16', '2025-03-24 11:42:16', '2026-03-24 17:12:16'),
('1f8c7f1609cdc733d41c3f47ef600767d77ef74134abe489eeffc8eeb98ac71ecf19914dd0a72808', 10, 5, 'MyApp', '[]', 0, '2025-03-26 05:36:41', '2025-03-26 05:36:41', '2026-03-26 11:06:41'),
('1ff19a1b3de478365f283aeb14b73164902c1690afdcf3985ba188aa167418e5bbd16ced6ff82b4d', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:32:29', '2025-03-27 09:32:29', '2026-03-27 15:02:29'),
('2212e5abb129aad641bf67495eba9bd1ecb820bf2bd71a3b6bfb4c0b773b6c8676ffb87a5b64b696', 10, 5, 'MyApp', '[]', 0, '2025-04-03 13:19:29', '2025-04-03 13:19:29', '2026-04-03 18:49:29'),
('23503d7acd7402401e11c00a0d520b385e36d5b9fc0be128cbde9581cdabec39180ddf382f0164b3', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:19:43', '2025-03-26 12:19:43', '2026-03-26 17:49:43'),
('2472f908932c8fa6fe910f04b721a5269cf1272168f452599e4b8a5fbbfb60edc4a17a0297263a3d', 10, 5, 'MyApp', '[]', 0, '2025-04-03 13:06:57', '2025-04-03 13:06:57', '2026-04-03 18:36:57'),
('24b1efb57e082f7a2fb39b0da92f7559583051ab6bc9329d2d3688b45b05bf001284e70fa75803f0', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:47:49', '2025-03-27 06:47:49', '2026-03-27 12:17:49'),
('24e95dc3cc51c419a9e3570177e811199c3367f39a349908d96738b9b4e5a75897f77ec04d0ca3a7', 12, 5, 'MyApp', '[]', 0, '2025-04-02 07:25:44', '2025-04-02 07:25:44', '2026-04-02 12:55:44'),
('2637832115a16d8449eeaae395dbcf704a35ae64e30c157e49796a6dc627c7a1a958d3de19b4f6f4', 8, 5, 'MyApp', '[]', 0, '2025-03-27 07:04:52', '2025-03-27 07:04:52', '2026-03-27 12:34:52'),
('276b8ccd67cf721ceb37bab8ae2627b83ca22bf1e45afc33b7dc28f897b2e4af9a709eb0fd947d5b', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:46:37', '2025-03-27 06:46:37', '2026-03-27 12:16:37'),
('284be51ae1a70e6efc5f4a4392ec3389502fd9b368c33c12812c566f79b4e594b14b58f0dae0f05c', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:05:30', '2025-03-26 12:05:30', '2026-03-26 17:35:30'),
('2a0598aad703f6e09d370c71b4362c3794aa6ba80500d448ab8574f45a6ef0fe67223be9b5c2099b', 8, 5, 'MyApp', '[]', 0, '2025-03-27 05:18:00', '2025-03-27 05:18:00', '2026-03-27 10:48:00'),
('2a296cc96e0d3702bda0b56aff4924d62c7ee4ceddacf9f2f50131ed5fee3088b30a548d9465f5c0', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:58:56', '2025-03-26 12:58:56', '2026-03-26 18:28:56'),
('2bd678e252dc2494625af97c858a3165878e737269b1c90d1cf290e712f21dedd7612c43e1f8620a', 8, 5, 'MyApp', '[]', 0, '2025-03-26 06:12:17', '2025-03-26 06:12:17', '2026-03-26 11:42:17'),
('2bdaddd0966cf4513fddcff28b570dc45deac13f76fade662134a22392f1f6ad7a7e83a6cfae5ead', 8, 5, 'MyApp', '[]', 0, '2025-04-02 06:47:03', '2025-04-02 06:47:03', '2026-04-02 12:17:03'),
('2c74ff977b10b3e22591333e9a653cdf8e1e6fe15a93bb835ec82a990ab7385b2829c8f5176039c2', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:57:33', '2025-03-26 11:57:33', '2026-03-26 17:27:33'),
('2c8ea7cd105368718c700a6e655afa1fc124ccc864a3d0e94dd2186dc0a010dae888b5dce071bbfb', 17, 5, 'MyApp', '[]', 0, '2025-03-31 12:08:57', '2025-03-31 12:08:57', '2026-03-31 17:38:57'),
('2ca29e07e3709fe11885b9f72410d89f9ac644d308a39016315f6d40d92989e2980c214e19671bdc', 8, 5, 'MyApp', '[]', 0, '2025-04-03 05:01:50', '2025-04-03 05:01:50', '2026-04-03 10:31:50'),
('2cc8cec01a27dad10231a6bec69777cb7b1c8ea20de1a0ad6e72d92c829a168700ade28b7a49333a', 10, 5, 'MyApp', '[]', 0, '2025-04-03 05:56:57', '2025-04-03 05:56:57', '2026-04-03 11:26:57'),
('2d4530900ddd0a26f0c3ebb68272009b7262041cec2798e770366fe213047f08ba712afd6c8eed8d', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:25:17', '2025-03-26 10:25:17', '2026-03-26 15:55:17'),
('3455aaaff9212115b7469899062ac6c9f007eae7bb66ff51821f13671691af9520b57d135017bc9a', 10, 5, 'MyApp', '[]', 0, '2025-03-31 06:23:16', '2025-03-31 06:23:16', '2026-03-31 11:53:16'),
('34e4abea8dd7b9fdc53206b73d4c290d90a922123730c4768168441416714688c18e6ccc445c3825', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:14:10', '2025-03-26 12:14:10', '2026-03-26 17:44:10'),
('35cd2f9db14a4312d0c44f52f63c435dab1ae45d6b2bf1693a418350e6142ecb3dd52d39b7a6afe5', 8, 5, 'MyApp', '[]', 0, '2025-03-25 07:06:05', '2025-03-25 07:06:05', '2026-03-25 12:36:05'),
('388b40233e1fb0f7a0c86fb361975fe57645bade4cf0c8d91a843871eec4cca847c2311ef9294eb4', 8, 5, 'MyApp', '[]', 0, '2025-03-28 11:26:14', '2025-03-28 11:26:14', '2026-03-28 16:56:14'),
('3c4d54322c423dc3d6720a9da88b66cdb2b484f4f08d4886bbdf1ddf6666a615cd8587b0afab137e', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:16:31', '2025-03-27 09:16:31', '2026-03-27 14:46:31'),
('3eb5b168b17fd54abb41c9b3b1dddfa4270f1ecda5ad739dfb7cf6f1a641e1378f61bc039a9e01de', 8, 5, 'MyApp', '[]', 0, '2025-03-27 08:27:39', '2025-03-27 08:27:39', '2026-03-27 13:57:39'),
('40edbfa68d32a9b5f55c89bb8679ee5aee9c7f785fd708928f424bf8ed9e8af17817d23122360f35', 8, 5, 'MyApp', '[]', 0, '2025-03-26 09:35:26', '2025-03-26 09:35:26', '2026-03-26 15:05:26'),
('41fe9c5c6d50985f903f5d5d304557ce3bbeb73c4a259580ea7374e2bbf9e6c4088e10bd58aaf0ce', 10, 5, 'MyApp', '[]', 0, '2025-04-03 09:49:51', '2025-04-03 09:49:51', '2026-04-03 15:19:51'),
('420511d786c9655f882c1caae23c1d637f5858af507e07cff9ab6e98a1a1b0304934c1d214041ce4', 10, 5, 'MyApp', '[]', 0, '2025-03-26 05:34:47', '2025-03-26 05:34:47', '2026-03-26 11:04:47'),
('42be0dc52640e6f568716ad7b0c27ed5b6b29e4aa47aebe2b97070e4b150fdc54e56abb2245b75dd', 8, 5, 'MyApp', '[]', 0, '2025-03-26 13:25:51', '2025-03-26 13:25:51', '2026-03-26 18:55:51'),
('43fb1eed0f69000cb217179b146783b25cd57978430ea03bc4e74eb3c87b520353ce27f6169205a9', 8, 5, 'MyApp', '[]', 0, '2025-04-03 04:49:25', '2025-04-03 04:49:25', '2026-04-03 10:19:25'),
('443b19c88150a5dfb14935207f183f35342057631081311a8dddadf16c288a58b05977049f786f5b', 8, 5, 'MyApp', '[]', 0, '2025-03-26 07:09:33', '2025-03-26 07:09:33', '2026-03-26 12:39:33'),
('476360eff4025c00c518231a824a55519ed5c837b6f03cba6d0e58d9c00da88ed000e9ec895ece7a', 8, 5, 'MyApp', '[]', 0, '2025-04-02 04:37:17', '2025-04-02 04:37:17', '2026-04-02 10:07:17'),
('481a69b0ceeb5c062147ba0a1758ec4458f778ab7da399e4a77e4ba9549e4a5680011b8bdbc572b0', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:11:41', '2025-03-26 10:11:41', '2026-03-26 15:41:41'),
('49338d7eecdd17b22b7a90adcce076fbdfe4ea5a61d4bb07ba1b9d31210f80d1351ac1bedbedc0f0', 8, 5, 'MyApp', '[]', 0, '2025-04-03 12:10:43', '2025-04-03 12:10:43', '2026-04-03 17:40:43'),
('498f977818e256290d8018b5df0f47cf7a377797172700afb707d0d9ffe19fad4a29bc0340873ff7', 19, 5, 'MyApp', '[]', 0, '2025-03-31 09:28:01', '2025-03-31 09:28:01', '2026-03-31 14:58:01'),
('4d0fdbd9b02ac4fe70ee9cf87288bde828929fe8efcc7c569742ae3faa54877aa28f01d68182248a', 10, 5, 'MyApp', '[]', 0, '2025-04-03 05:48:53', '2025-04-03 05:48:53', '2026-04-03 11:18:53'),
('4d3f1ca776ed1456a0cf706db40bb138b90ed9e6f3c5e147bb0b215da80cfef1e3766c10e90f7d20', 12, 5, 'MyApp', '[]', 0, '2025-03-31 09:09:58', '2025-03-31 09:09:58', '2026-03-31 14:39:58'),
('4dcfbdf101739bf811fdcb3caafb8965b3ec61d99896bd94f2f09897fafdbc17b33ec84b720ab042', 8, 5, 'MyApp', '[]', 0, '2025-03-27 08:30:05', '2025-03-27 08:30:05', '2026-03-27 14:00:05'),
('4ed53de074f5fc0da9aaa9291f811ab61c2e0172ac5c814573ef6a9b7a987eb9dc1d53ad95dfd563', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:56:12', '2025-03-26 10:56:12', '2026-03-26 16:26:12'),
('4f6077126487ef25c359c3af0fafc080beff429293d7f050e4496f792a0dfe558ec38135e3a21f37', 8, 5, 'MyApp', '[]', 0, '2025-03-26 06:11:24', '2025-03-26 06:11:24', '2026-03-26 11:41:24'),
('53bf00376f2ad913a4bd11f8f4706e92a319b9af4214bdb5bc4991a6b30c82041479a946dde7b1bc', 10, 5, 'MyApp', '[]', 0, '2025-03-27 07:23:53', '2025-03-27 07:23:53', '2026-03-27 12:53:53'),
('53f2c0608d0d3e912a59ad6995035105f04f0b915b43132fa0a9e73aa482605d813610d7ddb230f7', 8, 5, 'MyApp', '[]', 0, '2025-03-27 05:33:13', '2025-03-27 05:33:13', '2026-03-27 11:03:13'),
('552ad3464aec7c894841aae6dea32d7e8c039568412eb1bbbd6d61591c6265b0ebf03b7a906573dd', 8, 5, 'MyApp', '[]', 0, '2025-04-03 04:36:11', '2025-04-03 04:36:11', '2026-04-03 10:06:11'),
('55de6d5b4fa01e48b55453bb9ce7f6bc1ac0978db03955d656ecd5bad556238af74318bfb1c88f6e', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:20:03', '2025-03-27 04:20:03', '2026-03-27 09:50:03'),
('56a994669241f795484dd9667b5ea738ad941f25d322476890b53ca90cc6b5922b5313b80f778913', 8, 5, 'MyApp', '[]', 0, '2025-04-02 06:48:29', '2025-04-02 06:48:29', '2026-04-02 12:18:29'),
('57265cf4147b556947f2915a6c2936415d1c4b3a631278c43c1fec868844466fd9d348b7b24dc5d6', 8, 5, 'MyApp', '[]', 0, '2025-04-03 10:30:18', '2025-04-03 10:30:18', '2026-04-03 16:00:18'),
('59537818948f32136ee6d8822488c01d0551cc6e03a17021e867c732674929d6156e94519d56df0f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:25:02', '2025-03-26 12:25:02', '2026-03-26 17:55:02'),
('5acb410ea178f9293b88c0bdc95f8a25c29e7a3f4d77676c9041e4e1b606fafffccc1c83d0efc51b', 8, 5, 'MyApp', '[]', 0, '2025-04-02 08:39:06', '2025-04-02 08:39:06', '2026-04-02 14:09:06'),
('602e58eda05382928d668285ee88de0dbd968607444532f24ca104ead73efb694884f0f755e2fe1e', 10, 5, 'MyApp', '[]', 0, '2025-03-26 11:20:18', '2025-03-26 11:20:18', '2026-03-26 16:50:18'),
('62605393a0a36e2c0392afe7452deecc081259183e86fd1a54298134806d9a7c3b12b930a45518f4', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:07:51', '2025-03-26 10:07:51', '2026-03-26 15:37:51'),
('64488062a7827f9d6cc6baa7d7e1b5e183e201cce9bd4786148d276a6334eda607fdd2e62cf2c7e4', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:54:30', '2025-03-27 09:54:30', '2026-03-27 15:24:30'),
('65f8e030401c6ef49d253b3a8ca7bf902b78af590eff2bebd67a4ada0f693948701e43847e4e5c19', 8, 5, 'MyApp', '[]', 0, '2025-04-02 04:12:11', '2025-04-02 04:12:11', '2026-04-02 09:42:11'),
('6780f6e02ef68cbb829af0285c979889cd1e1582065292a4def2b8f28dc6e5e04332ae38b5a6d7e8', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:47:59', '2025-03-26 10:47:59', '2026-03-26 16:17:59'),
('68ff61aac41c586dd31c425819a73b6482f4390c23fa060bc5c5b08e1e7da051ed5e5f7d1574be6f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:44:24', '2025-03-26 12:44:24', '2026-03-26 18:14:24'),
('6b41780b04abfe94a51a4cf6207ac7bd4f83de637c1b96df78f704ce980bddafd9e8fb8b3a1bf044', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:09:45', '2025-03-26 12:09:45', '2026-03-26 17:39:45'),
('6b5adb51fa0b95826e2ea25da73ec61ad6aa304f3552b1e76f79568fc253115f40e97abff9880f18', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:39:59', '2025-03-26 12:39:59', '2026-03-26 18:09:59'),
('6d6bd0e7c3152682e2753a650735a0d5af0ec0ef505411752ea9c3bccad1063097ac015fbca1f758', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:24:07', '2025-03-26 11:24:07', '2026-03-26 16:54:07'),
('6e82009b19fd4866ab13d40c3c69278602a14444365ab3ebf793aa01ec9f7fd8205c6a9942c15b69', 8, 5, 'MyApp', '[]', 0, '2025-03-26 08:40:05', '2025-03-26 08:40:05', '2026-03-26 14:10:05'),
('6ebf50bb899ea6b750219ca3db5efb619f78f9ef6acba05c936b95c1d1c623a6edb515928f0da6e9', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:16:59', '2025-03-27 04:16:59', '2026-03-27 09:46:59'),
('716f2e0819347d437d8bbd37dd7dcf645483d7608bdde47115a4235d9de7361eccac51e63f0a2a66', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:40:05', '2025-03-26 11:40:05', '2026-03-26 17:10:05'),
('74c37ba7d27932fc346744f3329e5f1c62428650c9d90dffd301dbcb6dd9fa58584f6c26473aafe4', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:28:09', '2025-03-26 11:28:09', '2026-03-26 16:58:09'),
('765d91315b96b390c03b5b473da1a031b731f0ad1e2e4543dbedbe6edb2df4bd7c30712ffd355168', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:50:09', '2025-03-26 12:50:09', '2026-03-26 18:20:09'),
('76c0421df022d9a4031a9bf24f48056e73ab05e82d919e55a771c0e43c4c780016f18dd77e60ed54', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:01:22', '2025-03-26 12:01:22', '2026-03-26 17:31:22'),
('7900519603aaaaf87c061fb038784b8ad20017b0719b3398a7e7eecb69396dbd79f4318c4d752de5', 19, 5, 'MyApp', '[]', 0, '2025-03-31 09:08:54', '2025-03-31 09:08:54', '2026-03-31 14:38:54'),
('7d1613648fa2cc2f8e0756a8d8f7c7af7a21310dd08a52c96f5276593f3bc9c758f07f8be3d3c1a3', 8, 5, 'MyApp', '[]', 0, '2025-04-03 04:35:04', '2025-04-03 04:35:04', '2026-04-03 10:05:04'),
('7ee71f0bd870a12c58063fcc500725f5086cff62a89579f7727c3f20a060e8ff2908f125708da078', 12, 5, 'MyApp', '[]', 0, '2025-04-02 11:35:10', '2025-04-02 11:35:10', '2026-04-02 17:05:10'),
('82429b4e6370d79a7bd527d448321ff05098d288539b54b50be7715747b47f1e83012b5be6f51e06', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:30:34', '2025-03-27 06:30:34', '2026-03-27 12:00:34'),
('84297f0fe9c0127eb84297272ffde6e4de92ae3d26af79709764fb82db266f01f0a82e8fdcef3184', 8, 5, 'MyApp', '[]', 0, '2025-03-25 07:01:45', '2025-03-25 07:01:45', '2026-03-25 12:31:45'),
('846e9621c01bbbf8d7b67a7d0437d9dd8faffdb2ebe9b525093c71b3957753008a6f0e76f0ee2ee5', 8, 5, 'MyApp', '[]', 0, '2025-03-26 06:58:57', '2025-03-26 06:58:57', '2026-03-26 12:28:57'),
('86e7e89269aedd9df5f76a0e78a0609754d664100ef68e57aae02c4f9b288ce2a3540dc3fd8a7825', 10, 5, 'MyApp', '[]', 0, '2025-04-01 04:45:10', '2025-04-01 04:45:10', '2026-04-01 10:15:10'),
('8c5adda645a095c73baea320da521ade70cac6c1195a858734ca2e820db632bbeb9033a1a960b122', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:30:33', '2025-03-27 09:30:33', '2026-03-27 15:00:33'),
('9025945d679cf6b8cfc59cc95528ebc8914fec51dff51d9b62bcd670fd8b446e52176d80ed0824d1', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:34:52', '2025-03-26 10:34:52', '2026-03-26 16:04:52'),
('90574cbbbdc25c68c0d412333959cae28719963904e9fd9ca3bea0d6b54adb92fb1db87af91765a8', 10, 5, 'MyApp', '[]', 0, '2025-04-02 05:48:39', '2025-04-02 05:48:39', '2026-04-02 11:18:39'),
('916223c75c4141a49240062ee7665058633c760cb354fc8762d0dc35da629a17f6a98a260111fee3', 10, 5, 'MyApp', '[]', 0, '2025-04-03 09:19:39', '2025-04-03 09:19:39', '2026-04-03 14:49:39'),
('9234b997090e4b5541a9fedf8535f9b2050d3eb01bea7f0cc94278de10f433129c19e325db81093f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:51:13', '2025-03-26 12:51:13', '2026-03-26 18:21:13'),
('92f86eba103831a345bb3527095d650c50ce3d9a4d5ae8e83b256286b7256e86e3ed2dcb0801edf3', 8, 5, 'MyApp', '[]', 0, '2025-04-03 10:26:31', '2025-04-03 10:26:31', '2026-04-03 15:56:31'),
('9408142e2eacfe557fc8517b1d0970c643f2233bcb21ba7611fd2d288e207afc1d9643f18b4594f1', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:56:27', '2025-03-26 12:56:27', '2026-03-26 18:26:27'),
('9592576d812782b0f147a0421ba97956279d0b02c65f355970206165c9ad26ace46d0e52750daa2c', 8, 5, 'MyApp', '[]', 0, '2025-04-02 04:35:20', '2025-04-02 04:35:20', '2026-04-02 10:05:20'),
('95c76bd6867de320341f507aba4f38e7b2fa8b4ecbcc84cdc878e9c7a4e7f490880440c49e01f5c5', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:40:00', '2025-03-27 06:40:00', '2026-03-27 12:10:00'),
('9790d143700951169ad61a78db411799120fe08ce1b759f241f530c7ed4f8f6352b161a933dfc80c', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:52:07', '2025-03-26 12:52:07', '2026-03-26 18:22:07'),
('9800563d570ee43055716a968f01fa747f2351745a3c37c6236d367833949d9a82676216e6c00d81', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:12:17', '2025-03-26 12:12:17', '2026-03-26 17:42:17'),
('98c7db8f1292ae2db12fe7b06734b656ad834dc2906b50aa8f5b0e7cf5aad845ddde4cd914267d2f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 06:47:44', '2025-03-26 06:47:44', '2026-03-26 12:17:44'),
('992df397da6c6644c76e8e8c4ecc7cb82defb0d8cb5fef6866aea9765e4b838b837d4e70ea340299', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:30:19', '2025-03-26 11:30:19', '2026-03-26 17:00:19'),
('9a5764596909c9867fff35b57ec548d0a3cabe67a911f117e130c67b23f8b2fdbea0a9b002eaea80', 8, 5, 'MyApp', '[]', 0, '2025-03-28 10:37:59', '2025-03-28 10:37:59', '2026-03-28 16:07:59'),
('9bf59beede1483c4d9e264721385c453a685d2c50f57816dfb3a46ae344db37cd6e3be177b00cbb7', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:16:16', '2025-03-26 12:16:16', '2026-03-26 17:46:16'),
('9da73a3edbc225ff2d122519eac0317adf925912f5c01502ecd8e11bfb78d00cad92fa814fda2c5a', 10, 5, 'MyApp', '[]', 0, '2025-03-26 06:52:55', '2025-03-26 06:52:55', '2026-03-26 12:22:55'),
('9da8f7641cd74f33f84e7310841cfcde1a53cea0b92438ccf9e6a2f1b52d11d818931b1128b7ceaf', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:28:56', '2025-03-26 11:28:56', '2026-03-26 16:58:56'),
('a0570f08e857c08d0e0ee3b01107284612b12b5a73a715dd938f510d65f83f67795b0a613cc4cf88', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:37:17', '2025-03-26 10:37:17', '2026-03-26 16:07:17'),
('a1ba474d8a16e8b50d5fc5d48dcf62b99e0175d748238c3f1dbd3c47c87c266170a9833d0fdc3b15', 8, 5, 'MyApp', '[]', 0, '2025-03-26 09:09:38', '2025-03-26 09:09:38', '2026-03-26 14:39:38'),
('a22cb448bae576f213cb283959d4e594a6cf0281f1b0ad6c2dcdf8a0953cbf00e1c441003c39fda7', 8, 5, 'MyApp', '[]', 0, '2025-04-02 04:25:36', '2025-04-02 04:25:36', '2026-04-02 09:55:36'),
('a32a1f02573a500680c051897f31fd581e1768db76c0c3732926cbfa0a89b74b86b9bd81243f2b04', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:59:47', '2025-03-26 10:59:47', '2026-03-26 16:29:47'),
('a3f2b7bca3e3d47d620ce472219fb817e16d795ebac0a48b0d76626337cdab7b594fb15cbbe937b1', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:28:05', '2025-03-26 12:28:05', '2026-03-26 17:58:05'),
('a88dae3ac3abbf74394ecc0bfa219263130445cf06816392dc16937b4f02de49e21bb799fef4ca42', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:38:27', '2025-03-26 10:38:27', '2026-03-26 16:08:27'),
('aaa0337822fab10820ee9ccb6069f90aa76817661d1183eb4346c8d994fbb8ea6a92adfb025559d2', 8, 5, 'MyApp', '[]', 0, '2025-03-26 08:26:34', '2025-03-26 08:26:34', '2026-03-26 13:56:34'),
('ac86cae078c0784e22d55d10e17489678d0a8c3b714e805958bf3347e27fdaa47dccc110525df693', 8, 5, 'MyApp', '[]', 0, '2025-03-25 13:32:26', '2025-03-25 13:32:26', '2026-03-25 19:02:26'),
('adaa72bda49d4a525a268663d9f2c0329999efcbe15429136a4d9303e7df483a6e19e57841ff967c', 8, 5, 'MyApp', '[]', 0, '2025-03-27 05:44:28', '2025-03-27 05:44:28', '2026-03-27 11:14:28'),
('add27eca439502649249cb20b80a63f0a15510c5afcb64c6c5be8dad5e96f2c0b4e46b00ca3f254f', 10, 5, 'MyApp', '[]', 0, '2025-03-26 05:36:56', '2025-03-26 05:36:56', '2026-03-26 11:06:56'),
('b851dcb33dfb00baffe45993009848a4e717c2448c377d9989bc7d2c58055b9e6cbdc480b3089cca', 12, 5, 'MyApp', '[]', 0, '2025-04-01 10:15:39', '2025-04-01 10:15:39', '2026-04-01 15:45:39'),
('b97463faffc54c63d0a0f5f207971a3c80998fb0c4f9137625a248bd604ed2807859ff164fa791bb', 10, 5, 'MyApp', '[]', 0, '2025-04-02 05:07:59', '2025-04-02 05:07:59', '2026-04-02 10:37:59'),
('bda21e0200f2a148b509696652e9b31f9023633b27550d3ae4bc6c903bf6b1eee8de3b1a30569180', 8, 5, 'MyApp', '[]', 0, '2025-03-25 08:33:27', '2025-03-25 08:33:27', '2026-03-25 14:03:27'),
('be0f326536c5113bf61509676579a04e53c3a88bf7966995e7f6205c03199a663c79a2f1e8fe8bad', 8, 5, 'MyApp', '[]', 0, '2025-03-27 09:47:49', '2025-03-27 09:47:49', '2026-03-27 15:17:49'),
('c12ec4346237c8b3cd48b7fe152fb8a4ac8a0aad1a5332208b629bc96ac41b0ae50537e2ac63da5d', 10, 5, 'MyApp', '[]', 0, '2025-03-31 06:26:53', '2025-03-31 06:26:53', '2026-03-31 11:56:53'),
('c256b162967dd76e4740e33f2b9fcf5de1df7a05c8fd86f96081869abbecde2aec605df48dd39d49', 8, 5, 'MyApp', '[]', 0, '2025-04-03 04:22:11', '2025-04-03 04:22:11', '2026-04-03 09:52:11'),
('c5ad68fb8255fcce8d145346bcf8954015bde610d07087847f20a483cad21a8e96efb536ba2f4ff4', 8, 5, 'MyApp', '[]', 0, '2025-04-02 06:49:08', '2025-04-02 06:49:08', '2026-04-02 12:19:08'),
('c5cfe01c83a76b8ea6f8cdee5949a4f72123eafa0e597d24b8205d6c345a8219bfac6d02d676d41b', 8, 5, 'MyApp', '[]', 0, '2025-03-25 06:42:28', '2025-03-25 06:42:28', '2026-03-25 12:12:28'),
('c60d5690869216792795bd3eceb52280feb112390c5398f67ee3662711eca4c8d5f4587ea41c18d4', 10, 5, 'MyApp', '[]', 0, '2025-03-28 06:14:49', '2025-03-28 06:14:49', '2026-03-28 11:44:49'),
('c7206111fcd88399e9be9c88fc64d347e2ba3b85d46b257a89daafdb5e1979287d830250a7a6f61a', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:47:56', '2025-03-27 04:47:56', '2026-03-27 10:17:56'),
('c89a222edfdd0c8a30ac8fca93f00d9e40bb1d3eae10168aff7cc1260e581452dd52700b6a68dfc3', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:08:38', '2025-03-27 04:08:38', '2026-03-27 09:38:38'),
('ca319f1399a284448c38d2ece813867d3b00639fa7eec494824160de7e183e93e6def55904a4cb11', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:54:31', '2025-03-27 06:54:31', '2026-03-27 12:24:31'),
('cc827882ada1d02554220ff1ddba306a7a556918c068686ef7773f01729bd85800a804d22b0d2ce3', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:08:41', '2025-03-26 12:08:41', '2026-03-26 17:38:41'),
('cea4e45cd881f72eae4c8e1623c3606f13e0c23278921b72d5d30855dcd5e65d3fe28d21627b3baa', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:27:34', '2025-03-26 10:27:34', '2026-03-26 15:57:34'),
('d0fc04d8c0d1704a11673d4f8b41f4c4704bf73b056acef83289be0e2e3cdebc0a4853744bfbee3e', 8, 5, 'MyApp', '[]', 0, '2025-03-29 05:23:01', '2025-03-29 05:23:01', '2026-03-29 10:53:01'),
('d3e945cf4dbf2062436d50cb680228772af5aa7b417a1dc26edaa8cae5a274ec57e04c2b8b0c6909', 8, 5, 'MyApp', '[]', 0, '2025-03-27 05:57:17', '2025-03-27 05:57:17', '2026-03-27 11:27:17'),
('d47108910d3cd7e2b277d1763e55889ea22dcfc533e5f4028637dd4bee2dec045962f73ccf7a7d19', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:13:16', '2025-03-26 11:13:16', '2026-03-26 16:43:16'),
('d5215e3c5cb66d13042179b2b01a03c03dec0ce2ef32adb5b08d5cadea5d20bf930fa982fad93e67', 8, 5, 'MyApp', '[]', 0, '2025-03-25 07:18:21', '2025-03-25 07:18:21', '2026-03-25 12:48:21'),
('d641e9fa199ed979c080ea34c9d8560de28980a2a2e77a569ee2042f46eedeef99ed4573c22e3a02', 7, 5, 'MyApp', '[]', 0, '2025-03-26 05:22:29', '2025-03-26 05:22:29', '2026-03-26 10:52:29'),
('d7b923d07ef8134d1b8067bf9915eb80258b2038a8d739c5bb4a3530d5920e8ed709ebdbefd694d5', 12, 5, 'MyApp', '[]', 0, '2025-03-31 09:16:03', '2025-03-31 09:16:03', '2026-03-31 14:46:03'),
('d8693e42c1e92f7b639c2b7632a893497398e1458523889d18b1841bc6cea59c8bb3b49793c9be6a', 10, 5, 'MyApp', '[]', 0, '2025-04-03 05:08:57', '2025-04-03 05:08:57', '2026-04-03 10:38:57'),
('da7b5152629e4b76ca38ed73b5d4d6338c1df602b7dadf22924a2a74378a736aaf60cf62ac3a85ea', 8, 5, 'MyApp', '[]', 0, '2025-03-25 07:15:49', '2025-03-25 07:15:49', '2026-03-25 12:45:49'),
('da80171994716de7b8e69eec7b66a6451dce84b3735111062b5616c0de057231e55e1e98ec727dda', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:05:23', '2025-03-26 11:05:23', '2026-03-26 16:35:23'),
('dabfcdee19e227a3a87edb1b83e3b035ecc596aa652898939846cb14f968ef1862cddfbeb5012e81', 7, 5, 'MyApp', '[]', 0, '2025-03-25 08:17:51', '2025-03-25 08:17:51', '2026-03-25 13:47:51'),
('df022a02e518ab52eacee1c85914f1288b1aaa8e14240bec72ca26466a32f180ce4c259ce15f905f', 8, 5, 'MyApp', '[]', 0, '2025-04-03 10:01:32', '2025-04-03 10:01:32', '2026-04-03 15:31:32'),
('e1809319c786d42472481591823cbaabb8f8db2eff8c973512a1326c8b27763aa56fdfe63e9780f1', 8, 5, 'MyApp', '[]', 0, '2025-03-27 06:02:37', '2025-03-27 06:02:37', '2026-03-27 11:32:37'),
('e6ef0c235df59d0bffa87d8c22b0b455aed481e639281587ad43831e11f7b50afc9bcc0afc5a479d', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:03:23', '2025-03-26 12:03:23', '2026-03-26 17:33:23'),
('e7a3aa41a461de373f96ac5362b5b1fedde6483869af94f8b84aad90d11d3a78c0890472214c08e4', 8, 5, 'MyApp', '[]', 0, '2025-04-02 09:20:05', '2025-04-02 09:20:05', '2026-04-02 14:50:05'),
('e9d7877f540fe185bf5fbd1e4bc1d7998e89f20cbc51290db62f0b3166c0ca3be897b47aa358ad0b', 8, 5, 'MyApp', '[]', 0, '2025-04-02 08:49:28', '2025-04-02 08:49:28', '2026-04-02 14:19:28'),
('ea2482b6ae93ef04ad2c930f76a4a69416140c3cee61533bba08c42b4e48fb00b17fb9daca9cd599', 8, 5, 'MyApp', '[]', 0, '2025-03-26 11:05:49', '2025-03-26 11:05:49', '2026-03-26 16:35:49'),
('ecd9384045d7189807cccd7242e4fe57be7fb6fad4d1c7ed7d7697dcbb6c540a5cf97a397f95011f', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:33:37', '2025-03-26 12:33:37', '2026-03-26 18:03:37'),
('ee588b9e64ca946845797abcfa0cb184ba2ad2f2b91be3eb99dd0540186a5005bb28db70a4bd71f5', 8, 5, 'MyApp', '[]', 0, '2025-03-25 07:13:45', '2025-03-25 07:13:45', '2026-03-25 12:43:45'),
('f08216b768ce1b48993de74a5893c7c05e6a81e78a4889c6df910a54bf106f9a5a3fb8379901bb18', 17, 5, 'MyApp', '[]', 0, '2025-03-31 12:12:10', '2025-03-31 12:12:10', '2026-03-31 17:42:10'),
('f0b6bb189a2cf419e66f9303cd49668f97dbf7d3299b06fe4883b69842250a16a4422b1e2e18fa96', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:32:35', '2025-03-26 10:32:35', '2026-03-26 16:02:35'),
('f1052b5e6640b103c09a32cc7a0447670f5b9cf4095c7377b52797563d5f7ba1a2d93db85984d878', 8, 5, 'MyApp', '[]', 0, '2025-03-27 04:22:13', '2025-03-27 04:22:13', '2026-03-27 09:52:13'),
('f17983d37880beb6f3811640fe829e77c07bbec005ecef2392c9115e41fa1b0ddfa94b95261ddf88', 17, 5, 'MyApp', '[]', 0, '2025-03-31 09:33:46', '2025-03-31 09:33:46', '2026-03-31 15:03:46'),
('f2c9960ef77bd91305c8756a94101e34d5d7b945c6a37f32b2efcddf6a71aec7a2c60e21b9eb06c1', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:18:13', '2025-03-26 12:18:13', '2026-03-26 17:48:13'),
('f319cd099899adac6dd81bd1191837119fd0857febc7ebf9bb59cefe2d8f8d8adaf542465bf5cdd7', 8, 5, 'MyApp', '[]', 0, '2025-03-26 10:53:06', '2025-03-26 10:53:06', '2026-03-26 16:23:06'),
('f5fbbc1d11a037ed1ecd99a5df6dba0f0ab5c8bd65cc64c310b373ff955e22f7f30d2af02bcfab65', 8, 5, 'MyApp', '[]', 0, '2025-03-26 12:57:50', '2025-03-26 12:57:50', '2026-03-26 18:27:50'),
('f6a2f2d6a29a4912da22fa11d121a8ea9f9525c100918d47e1bbc4cbcd5823ebf24519d4a72a03ff', 12, 5, 'MyApp', '[]', 0, '2025-03-31 09:16:12', '2025-03-31 09:16:12', '2026-03-31 14:46:12'),
('fbd64a5c0eac6f890a648c63a98ece0a93bbe41d7223ef182eec206e809a0d7b9d995889f3c6b7a8', 10, 5, 'MyApp', '[]', 0, '2025-04-03 10:16:57', '2025-04-03 10:16:57', '2026-04-03 15:46:57'),
('fbe3df8018dad754a5a2ca47bb4a2b75753298f9f256b5f07ef6b5a94613e7466e374aff220595cb', 8, 5, 'MyApp', '[]', 0, '2025-03-27 08:29:25', '2025-03-27 08:29:25', '2026-03-27 13:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '5ZPEzEbuB80yWbLBKjbskDrLdeIEqwlZqaFgSa7z', NULL, 'http://localhost', 1, 0, 0, '2022-08-17 00:04:36', '2022-08-17 00:04:36'),
(2, NULL, 'Laravel Password Grant Client', 'bVwueNaWrWbkDOE1GJ9Z9hyWopGPpggBpuiMPOpe', 'users', 'http://localhost', 0, 1, 0, '2022-08-17 00:04:36', '2022-08-17 00:04:36'),
(3, NULL, 'Laravel Personal Access Client', 'w9vwtndwOcg3JfjbGG1WQJgClC270kouUrBFeklF', NULL, 'http://localhost', 1, 0, 0, '2022-08-17 00:04:57', '2022-08-17 00:04:57'),
(4, NULL, 'Laravel Password Grant Client', '4CBc7ZAV71PgpC6E0gD9DYalb5UIK3xYzgB99PyV', 'users', 'http://localhost', 0, 1, 0, '2022-08-17 00:04:58', '2022-08-17 00:04:58'),
(5, NULL, 'Laravel Personal Access Client', 'kvks26K3xl51f2PDnOiYEN6u2A5p9MQG5Qnmd0dW', NULL, 'http://localhost', 1, 0, 0, '2022-09-19 14:40:29', '2022-09-19 14:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-08-17 00:04:36', '2022-08-17 00:04:36'),
(2, 3, '2022-08-17 00:04:57', '2022-08-17 00:04:57'),
(3, 5, '2022-09-19 14:40:29', '2022-09-19 14:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `guard_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `delivery_guy_name` varchar(191) NOT NULL,
  `delivery_guy_phone` varchar(191) NOT NULL,
  `purpose_of_visit` varchar(191) NOT NULL,
  `stay_time` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `user_id`, `guard_id`, `building_id`, `flat_id`, `name`, `photo`, `delivery_guy_name`, `delivery_guy_phone`, `purpose_of_visit`, `stay_time`, `code`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 1, 2, 3, 'rheheh', 'Pcx84IUtycRN.jpeg', 'rirhdidh', '9951072005', 'hdhdgd', '25', 'PkwAmQ1mIr', 'LeaveInGate', '2025-03-27 05:48:52', '2025-04-03 05:04:28', NULL),
(2, 8, 1, 4, 5, 'Biryani', NULL, 'Hemant Kumar', '9162035975', 'anything', '10', '7QzMqJcATk', 'OnGoing', '2025-04-02 08:43:52', '2025-04-02 08:43:52', NULL),
(3, 8, 1, 2, 8, 'cricket ki', '8CUaewqVubZX.jpeg', 'MSD company partners', '8978818121', 'delivery', '10', '2dhyUeN69C', 'OnGoing', '2025-04-02 09:04:28', '2025-04-02 09:04:28', NULL),
(4, 8, 1, 2, 10, 'delivery item', 'vHXkPXcsPtiW.jpeg', 'delivery guy name', '9876543215', 'delivery', '10', 'fkibUsVr2B', 'OnGoing', '2025-04-03 04:25:16', '2025-04-03 04:25:16', NULL),
(5, 8, 1, 2, 10, 'delivery partner', '0TI33xoEVrnL.jpeg', 'delivery partner', '9638527418', 'meetings', '10', '4AzYBBUJAU', 'OnGoing', '2025-04-03 04:31:19', '2025-04-03 04:31:19', NULL),
(6, 8, 1, 2, 3, 'delivery p', 'uJh0uaELj0DB.jpeg', 'delivery partner', '8527419635', 'delivery', '10', 'GpVKW0LM83', 'OnGoing', '2025-04-03 05:29:43', '2025-04-03 05:29:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jack@myflatba.com', '1TvNCMplQ3IsTGPjZte2fgjB5zHQFSpK7rZkX17faJWcAZSBPDI9yW77Dn59WDPq', '2025-04-03 05:13:12'),
('gtankar@gmail.com', 'NLaqpXJoEUfC8HxnCGJlhmR6cDbpaHOJrmcbZdbw3xMdkgJK79HPQNONPatWN9t7', '2025-04-03 05:13:23'),
('gtankar@gmail.com', 'bRYzLLRcZ85bAjGFNiznLDxdxg9q2KaxYo0Fb1hv3MCy6sKJJZtqBZZwVvdPs7Uc', '2025-04-03 05:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `building_id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Plumber', 'Home Water Supply Installation', '2025-04-01 07:28:33', '2025-04-03 10:24:49', NULL),
(2, 2, 'Washing Machine Clear', 'Test', '2025-04-02 05:41:52', '2025-04-02 05:41:52', NULL),
(3, 4, 'Electrician', 'Home Wiring & Rewiring', '2025-04-03 10:21:56', '2025-04-03 10:24:27', NULL),
(4, 4, 'Carpainter', 'Metalworking', '2025-04-03 10:22:19', '2025-04-03 10:23:04', NULL),
(5, 4, 'Plumber', 'Bathroom & Kitchen Plumbing', '2025-04-03 10:25:09', '2025-04-03 10:25:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `bussiness_name` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `razorpay_key` varchar(191) DEFAULT NULL,
  `razorpay_secret` varchar(191) DEFAULT NULL,
  `fcm_key` varchar(191) DEFAULT NULL,
  `msg91_key` varchar(191) DEFAULT NULL,
  `msg91_flow_id` varchar(191) DEFAULT NULL,
  `msg91_sender` varchar(191) DEFAULT NULL,
  `google_map_api_key` varchar(191) DEFAULT NULL,
  `privacy_policy` longtext DEFAULT NULL,
  `terms_conditions` longtext DEFAULT NULL,
  `about_us` longtext DEFAULT NULL,
  `how_it_works` longtext DEFAULT NULL,
  `return_and_refund_policy` longtext DEFAULT NULL,
  `faqs` longtext DEFAULT NULL,
  `call_support_number` varchar(191) DEFAULT NULL,
  `whatsapp_support_number` varchar(191) DEFAULT NULL,
  `cancellation_policy` text NOT NULL,
  `delete_account_policy` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pagination` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `bussiness_name`, `logo`, `favicon`, `razorpay_key`, `razorpay_secret`, `fcm_key`, `msg91_key`, `msg91_flow_id`, `msg91_sender`, `google_map_api_key`, `privacy_policy`, `terms_conditions`, `about_us`, `how_it_works`, `return_and_refund_policy`, `faqs`, `call_support_number`, `whatsapp_support_number`, `cancellation_policy`, `delete_account_policy`, `pagination`, `created_at`, `updated_at`) VALUES
(1, 'Allons-Z', '8k2BFRL53dft.png', 'favicon.png', 'rzp_test_AlselIM2RyZVqK', 'MtMXJZx0ByUIzPUtcWy0PbET', 'AAAAR9ws92E:APA91bHhwea9pl70IQ88HNLf_n8tqs6jsiD1EGq11TKAn2eYkSFH1cIWUa7c1-snurmhP2DbeWtwz8fz36pOnpwrcMpSCnt5X0XtuuqYmVfTMKKjsEUCdHLjVAu3znfbI6WBYP1XYcWf', '386639ArrspY7ZlKqU63982077P1', '60d31aa780770a194e244e18', 'CEIOTP', 'AIzaSyDkn-8937gCWGdnSbkmRzfzC7DLbyfvoTM', '<p data-pm-slice=\"1 1 []\" style=\"text-align: center; \"><strong>Privacy Policy</strong></p><p><strong>1. Data Collection</strong>\r\nWe collect the following data:</p><ul data-spread=\"false\"><li><p>User-provided details (name, contact, flat number, etc.).</p></li><li><p>Check-in and check-out logs.</p></li><li><p>Issue reports and communications.</p></li></ul><p><strong>2. Data Usage</strong></p><ul data-spread=\"false\"><li><p>Personal data is used to facilitate check-ins, check-outs, and issue management.</p></li><li><p>Data may be shared with security personnel, flat management, or law enforcement if required.</p></li></ul><p><strong>3. Data Security</strong></p><ul data-spread=\"false\"><li><p>We implement security measures to protect user data.</p></li><li><p>However, we cannot guarantee complete security against unauthorized access.</p></li></ul><p><strong>4. Third-Party Services</strong></p><ul data-spread=\"false\"><li><p>We may integrate third-party services (e.g., payment, messaging) that have their own privacy policies.</p></li></ul><p><strong>5. Data Retention</strong></p><ul data-spread=\"false\"><li><p>We retain data as long as the account is active.</p></li><li><p>Data may be deleted upon account deletion as per our \"Delete Account Policy.\"</p></li></ul><p><strong>6. Changes to Privacy Policy</strong>\r\nWe may update this policy periodically. Users will be notified of significant changes.</p>', '<p data-pm-slice=\"1 1 []\" style=\"text-align: center; \"><strong>Terms and Conditions</strong></p><p><strong>1. Introduction</strong>\r\nWelcome to MyFlatInfo, an application designed to manage flat-related issues, gate check-ins, and checkouts. By using our services, you agree to abide by these terms.</p><p><strong>2. User Responsibilities</strong></p><ul data-spread=\"false\"><li><p>Users must provide accurate information during registration.</p></li><li><p>Any misuse of the app, including fraudulent reports, may lead to account suspension.</p></li><li><p>Users should respect community guidelines and local regulations.</p></li></ul><p><strong>3. Check-in &amp; Check-out</strong></p><ul data-spread=\"false\"><li><p>Residents and visitors must check in and check out as per society rules.</p></li><li><p>Security personnel or admin have the right to verify user details.</p></li></ul><p><strong>4. Issue Reporting</strong></p><ul data-spread=\"false\"><li><p>All flat-related issues should be reported with valid details.</p></li><li><p>The app does not guarantee resolution but facilitates communication between residents and management.</p></li></ul><p><strong>5. Account Suspension and Termination</strong></p><ul data-spread=\"false\"><li><p>Violation of terms may result in temporary or permanent suspension.</p></li><li><p>Users can request account deletion as per the \"Delete Account Policy.\"</p></li></ul><p><strong>6. Limitation of Liability</strong></p><ul data-spread=\"false\"><li><p>The app is a facilitator and does not take responsibility for third-party actions.</p></li><li><p>We are not liable for any loss arising from the use of our services.</p></li></ul><p><strong>7. Changes to Terms</strong>\r\nWe may update these terms from time to time. Continued use of the app implies acceptance of updated terms.</p><p></p>', '<!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:RelyOnVML/>\n  <o:AllowPNG/>\n </o:OfficeDocumentSettings>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves/>\n  <w:TrackFormatting/>\n  <w:PunctuationKerning/>\n  <w:ValidateAgainstSchemas/>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF/>\n  <w:LidThemeOther>EN-IN</w:LidThemeOther>\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:BreakWrappedTables/>\n   <w:SnapToGridInCell/>\n   <w:WrapTextWithPunct/>\n   <w:UseAsianBreakRules/>\n   <w:DontGrowAutofit/>\n   <w:SplitPgBreakAndParaMark/>\n   <w:EnableOpenTypeKerning/>\n   <w:DontFlipMirrorIndents/>\n   <w:OverrideTableStyleHps/>\n  </w:Compatibility>\n  <w:DoNotOptimizeForBrowser/>\n  <m:mathPr>\n   <m:mathFont m:val=\"Cambria Math\"/>\n   <m:brkBin m:val=\"before\"/>\n   <m:brkBinSub m:val=\"--\"/>\n   <m:smallFrac m:val=\"off\"/>\n   <m:dispDef/>\n   <m:lMargin m:val=\"0\"/>\n   <m:rMargin m:val=\"0\"/>\n   <m:defJc m:val=\"centerGroup\"/>\n   <m:wrapIndent m:val=\"1440\"/>\n   <m:intLim m:val=\"subSup\"/>\n   <m:naryLim m:val=\"undOvr\"/>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\n  LatentStyleCount=\"376\">\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 6\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 7\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 8\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Normal Indent\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"footnote text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"annotation text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"header\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"footer\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"index heading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"table of figures\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"envelope address\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"envelope return\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"footnote reference\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"annotation reference\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"line number\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"page number\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"endnote reference\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"endnote text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"table of authorities\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"macro\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"toa heading\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Bullet\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Number\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Bullet 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Bullet 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Bullet 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Bullet 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Number 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Number 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Number 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Number 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Closing\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Signature\"/>\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text Indent\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Continue\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Continue 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Continue 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Continue 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"List Continue 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Message Header\"/>\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Salutation\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Date\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text First Indent\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text First Indent 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Note Heading\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text Indent 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Body Text Indent 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Block Text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Hyperlink\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"FollowedHyperlink\"/>\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Document Map\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Plain Text\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"E-mail Signature\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Top of Form\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Bottom of Form\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Normal (Web)\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Acronym\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Address\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Cite\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Code\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Definition\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Keyboard\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Preformatted\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Sample\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Typewriter\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"HTML Variable\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Normal Table\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"annotation subject\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"No List\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Outline List 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Outline List 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Outline List 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Simple 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Simple 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Simple 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Classic 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Classic 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Classic 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Classic 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Colorful 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Colorful 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Colorful 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Columns 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Columns 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Columns 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Columns 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Columns 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 6\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 7\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Grid 8\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 4\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 5\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 6\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 7\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table List 8\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table 3D effects 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table 3D effects 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table 3D effects 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Contemporary\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Elegant\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Professional\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Subtle 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Subtle 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Web 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Web 2\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Web 3\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Balloon Text\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Table Theme\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\n   Name=\"List Paragraph\"/>\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\n   Name=\"Intense Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\n   Name=\"Subtle Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\n   Name=\"Intense Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\n   Name=\"Subtle Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\n   Name=\"Intense Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"Grid Table 1 Light Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"46\"\n   Name=\"List Table 1 Light Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"51\"\n   Name=\"List Table 6 Colorful Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"52\"\n   Name=\"List Table 7 Colorful Accent 6\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Mention\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Smart Hyperlink\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Hashtag\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Unresolved Mention\"/>\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n   Name=\"Smart Link\"/>\n </w:LatentStyles>\n</xml><![endif]--><!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:\"Table Normal\";\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:\"\";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin:0cm;\n	line-height:115%;\n	mso-pagination:widow-orphan;\n	font-size:11.0pt;\n	font-family:\"Arial\",sans-serif;\n	mso-ansi-language:EN;}\n</style>\n<![endif]-->\n\n<p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">The attraction of youth to early sexual experiences is a multifaceted issue influenced by a range of factors, including curiosity, peer pressure, and societal influences. In this essay, we will explore some of the key drivers behind this phenomenon, its potential consequences, and the significance of comprehensive sex education and open communication in addressing these concerns.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Factors Contributing to Youth Attraction to Early Sexual Experiences:</span></p><ol style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 1.25em 0px; padding: 0px; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Curiosity and Exploration:</span> Adolescence is a period of discovery, including exploring one\'s own sexuality. Young people may be drawn to early sexual experiences out of curiosity, wanting to better understand their own desires and identities.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Peer Pressure:</span> Adolescents often face peer pressure, where friends or acquaintances may encourage early sexual encounters. The desire to fit in or conform to perceived social norms can lead youth to explore sex at a younger age.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Media and Internet Exposure:</span> Easy access to explicit content on the internet and in media can create a skewed perspective of sexuality, making early sexual experiences seem more appealing or \"normal.\"</p></li></ol><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Implications:</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">The attraction of youth to early sexual experiences can lead to several potential consequences:</p><ol style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 1.25em 0px; padding: 0px; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Health Risks:</span> Early sexual encounters without proper knowledge and protection may increase the risk of sexually transmitted infections (STIs), unintended pregnancies, and emotional distress.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Psychological Impact:</span> Young people may not be emotionally prepared to handle the complexities of sexual relationships, potentially leading to confusion, guilt, or anxiety.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Legal Issues:</span> Depending on age of consent laws, early sexual experiences may have legal consequences for the involved parties.</p></li></ol><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Addressing the Issue:</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">To address youth attraction to early sexual experiences, a comprehensive approach is essential:</p><ol style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 1.25em 0px; padding: 0px; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Comprehensive Sex Education:</span> Schools must offer comprehensive sex education that goes beyond basic biology to include discussions on healthy relationships, consent, emotional well-being, and the potential risks and responsibilities associated with early sexual activity.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Open and Non-Judgmental Communication:</span> Parents, guardians, and educators should establish open lines of communication with young people, creating a safe and non-judgmental environment for discussing questions and concerns about sexuality and relationships.</p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Access to Support Services:</span> Youth attracted to early sexual experiences may benefit from access to support services, including counseling and guidance, to help them make informed choices, navigate their feelings, and address potential emotional consequences.</p></li></ol><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">In conclusion, youth attraction to early sexual experiences is a natural part of adolescence. However, it is crucial to address this attraction through comprehensive sex education, open and supportive communication, and access to guidance and support services. By doing so, we can better equip young people to make informed and responsible choices regarding their sexuality and relationships, ultimately promoting their well-being and safety.</p>', '<h1 class=\"\" align=\"center\"><font color=\"#FF0000\"><span style=\"font-family: \">How it works ?<br></span></font></h1><p class=\"f4 cl-white mt0 mb16\"><i><b>&nbsp;STEPS TO BOOK A VEHICLE:</b></i></p><p class=\"f4 cl-white mt0 mb16\"><i>1. Download Selfsteerings app from Playstore or App store / Open </i><a href=\"http://www.selfsteerings.com\" target=\"_blank\">www.selfsteerings.com</a></p><p class=\"f4 cl-white mt0 mb16\"><i>2. Sign Up/In with Mobile number and OTP.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>3. After login&nbsp; You\'ll be automatically redirected to home page.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>4. Now you can select location or auto detect location from your input box.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>5. Select Category like car or bike, Select Type of Vehicle.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>6. Start Date, End Date, Start Time, End Time.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>7. Now click on search.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>8. If the customer is available&nbsp;inside selfsteerings radius, We\'ll show Cars list, prices and variants.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>9.&nbsp; Customer can book any available car from the shown list.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>10. You can also add addons as extra\'s.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>11.&nbsp; Apply Coupon\'s if available, Then make payment.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>12. After completing payment, You\'ll get access to navigate to car location and call vendor.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>13. Once you reach car location, You need to click on \"PICK VEHICLE\".</i></p><p class=\"f4 cl-white mt0 mb16\"><i>14. Now enter meter reading, Click meter reading picture and Car four sides pictures.(front,rear,left,right)</i></p><p class=\"f4 cl-white mt0 mb16\"><i>15. Share start otp and keep moving.</i></p><p class=\"f4 cl-white mt0 mb16\"><i>16. Return the car once the trip is done and&nbsp;</i><i style=\"font-size: 1rem;\">enter meter reading, Click meter reading picture and Car four sides pictures.(front,rear,left,right)</i></p><p class=\"f4 cl-white mt0 mb16\"><i style=\"font-size: 1rem;\">17. Share end trip otp, Your booking is succesfully completed.</i></p><p></p>', '<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-IN</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <w:DoNotOptimizeForBrowser/>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Arial\",sans-serif;\r\n	mso-ansi-language:EN;}\r\n</style>\r\n<![endif]-->\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:center;line-height:150%\" align=\"center\"><b style=\"mso-bidi-font-weight:normal\"><span style=\"font-size:12.0pt;\r\nline-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:=\"\" \"times=\"\" roman\"\"=\"\" lang=\"EN\">RETURN &amp; REFUND&nbsp; POLICY</span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\"><span style=\"mso-spacerun:yes\">&nbsp;</span></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">We thank you and appreciate your\r\npurchase with us. Please read the policy, conditions and process carefully as\r\nthey will give you important information and guidelines about your rights and\r\nobligations as our User, concerning any purchase you make through us. The\r\npolicy concerning the returns and refund requests, shall be following the\r\nclauses as set forth:</span></p>\r\n\r\n<ol style=\"margin-top:0cm\" type=\"1\" start=\"1\"><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l0 level1 lfo1\"><b style=\"mso-bidi-font-weight:normal\"><span style=\"font-size: 12pt; line-height: 150%; background-color: rgb(255, 255, 0);\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:=\"\" \"times=\"\" roman\"\"=\"\" lang=\"EN\"><font color=\"#b5a5d6\">REFUND REQUESTS</font></span></b><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\"> <b style=\"mso-bidi-font-weight:\r\n     normal\"></b></span></li></ol>\r\n\r\n<ol style=\"margin-top:0cm\" type=\"a\" start=\"1\"><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l2 level1 lfo2\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">If the company fails to process\r\n     the Services or is unable to provide the Service requested by the customer,\r\n     a 100% refund shall be provided to the Users. Under no other circumstances\r\n     shall a refund be provided to the Users. </span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l2 level1 lfo2\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">If there are any delays caused\r\n     due to the User or any governmental organisation, the Company will not\r\n     refund the payment made by the User.</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l2 level1 lfo2\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">Refunds are done within 6 (Six)\r\n     working days and the amount shall be credited by the same mode of payment\r\n     as it was received or Amount will be credited to in app closed wallet,\r\n     Customer can utilize the amount in next service.</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l2 level1 lfo2\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">The Services as collected by\r\n     the User and shall be returned to the Vendor to their residential address\r\n     as provided by them. </span></li></ol>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">&nbsp;</span><span style=\"font-size: 12pt;\">You shall make all Refund requests\r\nby contacting the technical team support available on the Platform, which will\r\nbe the official mode of communication with our Platform and the Company. The\r\nCompany shall waive all other means of communication made.</span></p>\r\n\r\n<ol style=\"margin-top:0cm\" type=\"1\" start=\"2\"><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l0 level1 lfo1\"><b style=\"mso-bidi-font-weight:normal\"><span style=\"font-size:12.0pt;\r\n     line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:=\"\" \"times=\"\" roman\"\"=\"\" lang=\"EN\">EXCHANGE REQUESTS</span></b></li></ol>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">Under no circumstances, shall an\r\nexchange request be provided by the Company to the User.</span></p>\r\n\r\n<ol style=\"margin-top:0cm\" type=\"1\" start=\"3\"><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l0 level1 lfo1\"><b style=\"mso-bidi-font-weight:normal\"><span style=\"font-size:12.0pt;\r\n     line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:=\"\" \"times=\"\" roman\"\"=\"\" lang=\"EN\">CANCELLATION REQUEST</span></b></li></ol>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">The Company at its sole discretion\r\nmay cancel any Service(s):</span></p>\r\n\r\n<ol style=\"margin-top:0cm\" type=\"a\" start=\"1\"><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l1 level1 lfo3\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">If it suspects a User has\r\n     undertaken a fraudulent transaction, or</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l1 level1 lfo3\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">If it suspects a User has\r\n     undertaken a transaction which is not following the Terms of Use, or</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l1 level1 lfo3\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">In case of unavailability of a\r\n     service, or</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l1 level1 lfo3\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">For any reason outside the\r\n     control of the Company including causes for delivery related logistical\r\n     difficulties.</span></li><li class=\"MsoNormal\" style=\"text-align:justify;line-height:150%;mso-list:l1 level1 lfo3\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">If the Company does not want to\r\n     do business with the User</span></li></ol>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">Further, while all measures are\r\ntaken to ensure accuracy of service specifications and pricing, the details of\r\nthe product as reflected on the platform may be inaccurate due to technical\r\nissues, typographical errors or incorrect service information provided to the\r\nCompany and in such an event you shall be notified as soon as such error comes\r\nto the notice of the Company.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">The Company maintains a negative\r\nlist of all fraudulent transactions and non-complying Users and reserves the\r\nright to deny access to such Users at any time or cancel any orders placed by\r\nthem in future.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\"><span style=\"mso-spacerun:yes\">&nbsp;</span></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\">&nbsp;</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" lang=\"EN\"><br></span></p><p></p>', '<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-ansi-language:en-us\"=\"\" lang=\"EN-US\">What is Eligibility?</span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-ansi-language:en-us\"=\"\" lang=\"EN-US\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; Legal Age to book a vehicle is 18 to 80, with License for 2 &amp; 4 Wheeler.</span></span><span style=\"font-size:\r\n14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp; &nbsp; &nbsp; 2.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Need\r\nfew documents for Booking? </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp; Need Driving License &amp; Aadhar card to book vehicle.</span></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Is\r\nthere any security deposit for the customer?&nbsp; </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp;Need to provide 3500 Rupees as security deposit for Car &amp; Bike.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">How\r\nshould I make payment?</span><span style=\"line-height: 115%;\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px;\"><span style=\"font-weight: normal;\">&nbsp;&nbsp; </span></span></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"line-height: 115%;\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px;\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp;Payment need to be paid in advance, If your booking is extended then need to pay before hand-overring&nbsp;vehicle</span>.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Can\r\nI book service for for my family/friend? </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp;&nbsp; Yes, Anyone can book a vehicle for their friends or family but need to upload their ID proofs.</span></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">How\r\ncan I cancel after the payment is done?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp; You need to contact 24/7 customer support.</span></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp; &nbsp; &nbsp; 7.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">How\r\nshould I collect car? </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp;Need to Book a car, Complete payment, Navigate to car location/call vendor then share start otp. If not contact support for help.</span></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Do\r\nWe have insurance? </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp; We provide insurance for all the vehicles, which is added in your billing as default.</span></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp; &nbsp; &nbsp; 9</span></span><span times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\" style=\"text-indent: -18pt; font-size: 14pt; line-height: 115%;\">.<span times=\"\" new=\"\" roman\"\"=\"\">&nbsp;&nbsp; </span></span><span times=\"\" new=\"\" roman\",serif\"=\"\" style=\"text-indent: -18pt; font-size: 14pt; line-height: 115%;\">Top\r\nspeed of the car?</span><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp; </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A.&nbsp; &nbsp; 100km will the top speed of the car.</span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 10.&nbsp;<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\"> </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Maximum\r\nbooking tenure? </span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A .&nbsp; Minimum will be 4hrs and the Maximum will 30 days.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 11.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Bulk\r\nbooking?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp; &nbsp; &nbsp; A.&nbsp; &nbsp; We provide bulk bookings for pricing contact 24/7 support.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 12.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Do\r\nyou provide gps tracker?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp; </span><span style=\"font-size: 18.6667px; font-weight: normal;\">&nbsp;A.&nbsp; &nbsp; Yes, Vehicle will be tracking 24/7.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 13.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Tax\r\non booking?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"line-height: 115%;\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px;\">&nbsp; &nbsp; <span style=\"font-weight: normal;\">&nbsp; A.&nbsp; &nbsp; We collect tax as per government&nbsp;norms.</span></span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 14.&nbsp;<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\"> </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">What\r\nis excluded in the booking fee?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-size: 18.6667px; font-weight: normal;\"> A.&nbsp; &nbsp; Addons are excluded in booking fee.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 15.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Breakdown\r\nissue?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp; </span><span style=\"font-size: 18.6667px; font-weight: normal;\">A.&nbsp; &nbsp; Contact 24/7 customer support to arrange a alternate vehicle or refund.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 16.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">What\r\nare your support timings?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp; </span><span style=\"font-size: 18.6667px; font-weight: normal;\">A.&nbsp; &nbsp; We provide 24/7 customer support.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 17.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">What\r\nshould I do when I met with an accident/damaging the car?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-size: 18.6667px; font-weight: normal;\"> A.&nbsp; &nbsp; Need to contact customer support, If that is claimable insurance company will get it done*.</span><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp;&nbsp;&nbsp;&nbsp; 18.<span style=\"font:7.0pt \" times=\"\" new=\"\" roman\"\"=\"\">&nbsp; </span></span></span><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">What\r\nif the car gets Theft?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><span style=\"font-size: 18.6667px; font-weight: 700;\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-size: 18.6667px; font-weight: normal;\"> A.&nbsp; &nbsp; It will be under gps tracking and we have insurance to claim it.</span></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -18pt;\"><span times=\"\" new=\"\" roman\",serif\"=\"\" style=\"font-size: 14pt; line-height: 21.4667px;\">&nbsp; &nbsp; &nbsp; 19. What if the car gets Theft?</span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -18pt;\"><span times=\"\" new=\"\" roman\",serif\"=\"\" style=\"font-size: 14pt; line-height: 21.4667px;\"><span style=\"font-weight: 700; font-size: 18.6667px;\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-weight: normal; font-size: 18.6667px;\">&nbsp;A.&nbsp; &nbsp; It will be under gps tracking and we have insurance to claim it.</span></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -18pt;\"><span times=\"\" new=\"\" roman\",serif\"=\"\" style=\"font-size: 14pt; line-height: 21.4667px;\"><span style=\"font-weight: normal; font-size: 18.6667px;\"><br></span></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -18pt;\"><span times=\"\" new=\"\" roman\",serif\"=\"\" style=\"font-size: 14pt; line-height: 21.4667px;\"><span style=\"font-weight: normal; font-size: 18.6667px;\">k</span></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><br></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif;=\"\" mso-fareast-font-family:\"times=\"\" roman\"\"=\"\"><span style=\"mso-list:Ignore\">&nbsp; &nbsp; &nbsp;</span></span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-IN</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:10.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;\r\n	mso-fareast-language:EN-US;}\r\n</style>\r\n<![endif]-->', '7436974369', '7436974369', '', '<p data-pm-slice=\"1 1 []\" style=\"text-align: center; \"><strong>Delete Account Policy</strong></p><p><strong>1. Requesting Account Deletion</strong>\r\nUsers can request account deletion through:</p><ul data-spread=\"false\"><li><p>The app’s \"Delete Account\" option.</p></li><li><p>Contacting support at [Support Email].</p></li></ul><p><strong>2. Data Removal</strong></p><ul data-spread=\"false\"><li><p>Personal data will be deleted from our system within [X] days of request.</p></li><li><p>Some data may be retained for legal or security purposes.</p></li></ul><p><strong>3. Effects of Deletion</strong></p><ul data-spread=\"false\"><li><p>Users will lose access to all services.</p></li><li><p>Check-in records and issue reports may no longer be accessible.</p></li></ul><p><strong>4. Revoking Deletion Request</strong></p><ul data-spread=\"false\"><li><p>If the request is made in error, users can cancel within [X] hours.</p></li></ul><p>For any queries, contact us at [Support Email].</p>', 50, '2022-08-23 17:28:16', '2025-04-02 06:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `timings`
--

CREATE TABLE `timings` (
  `id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `timings`
--

INSERT INTO `timings` (`id`, `facility_id`, `from`, `to`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '15:50:00', '17:50:00', 'Active', '2025-03-31 09:19:10', '2025-03-31 09:19:10', NULL),
(2, 1, '18:00:00', '20:00:00', 'Active', '2025-03-31 09:23:35', '2025-03-31 09:23:35', NULL),
(3, 5, '05:30:00', '08:00:00', 'Active', '2025-04-02 06:23:07', '2025-04-02 06:23:07', NULL),
(4, 5, '20:00:00', '09:00:00', 'Active', '2025-04-02 06:24:12', '2025-04-02 06:24:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(191) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `otp` varchar(191) DEFAULT NULL,
  `otp_status` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` text DEFAULT NULL,
  `device_token` text DEFAULT NULL,
  `remember_token` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `profile_status` varchar(191) NOT NULL DEFAULT 'Pending',
  `wallet` int(11) NOT NULL DEFAULT 0,
  `building_id` int(11) DEFAULT NULL,
  `flat_id` int(11) DEFAULT NULL,
  `gate_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `created_by`, `first_name`, `last_name`, `phone`, `email`, `gender`, `city_id`, `address`, `pincode`, `photo`, `otp`, `otp_status`, `password`, `api_token`, `device_token`, `remember_token`, `status`, `profile_status`, `wallet`, `building_id`, `flat_id`, `gate_id`, `department_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 1, 'Super', 'Admin', '9162035975', 'admin@admin.com', 'Male', 1, 'Chokad', 829110, NULL, NULL, 'Verified', '$2y$10$3dx67NTO46hZva/mYsfK8uncJMXVWhWECVvhxZGrb6QXQExcQn2qS', NULL, NULL, 'rviOAE9Difan20Ta6q4oUeZ7M1SionBd3s1bqfizvKp7Kco7Bb2dufyZkiGL', 'Active', 'Active', 0, NULL, NULL, NULL, NULL, '2025-03-24 11:02:11', '2025-04-03 10:18:02', NULL),
(2, 'BA', NULL, 'Hemant', 'Kumar', '6207198392', 'krguptahemant@gmail.com', 'Male', 2, 'Chokad', NULL, 'YooQqYLXFMe5.png', '$2y$10$Wq/.lIsidzbkTgtHesrI6eU8mipIuZXMsX7rfLt9vvEskLYjcBUBC', 'Verified', '$2y$10$NIZvn3Xvnus9tJgR/rugGeJJItZ757xFj.whmCwrDzRdEOf8DdTdW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMWY1ZGQxYjc5ZjM3ZDRiNjlhYjJmM2Q1MjcxM2M5MzNiZDQ1ZjBmNTUzNWEwNjVjZTBlMGJjMWUzY2U2YzNjOWViNzhkODMxYzQzN2RjZTQiLCJpYXQiOjE3NDI4MTY1MzYuOTY1NTU3MDk4Mzg4NjcxODc1LCJuYmYiOjE3NDI4MTY1MzYuOTY1NTY0MDEyNTI3NDY1ODIwMzEyNSwiZXhwIjoxNzc0MzUyNTM2Ljk2MDU0Njk3MDM2NzQzMTY0MDYyNSwic3ViIjoiMiIsInNjb3BlcyI6W119.v0Zcj4XZLhnRyqnZFTvgNWPuc53T79tlf7s5Pua9FutisJUnbuKe35xH-umQVttFxenSSL3XYe_p-ut3-lrDySTzMzxUTvCiBUZ38mbmyiz28unMnxJ3C-NZKUWCuQeffcU6S1RkD47fKitS9rnhSPcnpexUbxBgS8FVDZwNW-r50rcQ4n3tLbUR3skVD_yhsIbJ8p1l1TCMe-o2kb8KDcVX1_slngJ0ev_MonkdAJ3gyL8GpTN3ys1O0qN5bG-oxcAUhboZAdyRqph2ncE0qljbkHFBLZFJwPK0rZyfte-D0mD3iyVB-EhlBw02raJPVdCYXglYKMMrbYnMd8ZN0l3tlj4mdJcLnP-CEnNO6fAuEI6clcVeElqmaF800IWDFEjdMDDVYFy2NJysM-ZeQBIlyLOS000zgH6KHbYGmqc8wpMp2BIO-TrTbNoc1xNQ2MFH64ASZuJCUozwcU6m5Jy6tv5GAG9DcL7quovxJgW7aKgeyYmrmREIJJSHrJCTKAFlGKPMLsb2dJeM5d_MXp13L0a7jQhRYJR_vsA4wqAKjft44-Q-2FJjqLbFyeY0gsjC4K620UpzL9T31IZpx-xGGiKgBOCGDF6HGHhI6zvPtbZIxTivSv56ub9e4RJPyA2ykU6KM-3IhqGHIjSz5TfQRnqkAPzjQ_3Pq025V2s', NULL, 'iB0sANerBTF1h636g9ecjxY3GS5alQzYs0eanLKLVA4rU8LkffFhwFG496ji', 'Active', 'Pending', 0, 1, NULL, NULL, NULL, '2025-03-24 11:30:29', '2025-04-02 06:22:25', NULL),
(3, 'admin', NULL, 'Vishwesh', 'Kusuma', '8978182191', 'vishwesh@gmail.com', 'Male', 1, 'Own Address', NULL, NULL, NULL, NULL, '$2y$10$mYspSx67a67EBPTBI1doRODrhabsaguBdDJDUq1jsVjmOA73YLvTu', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-24 11:52:54', '2025-03-24 11:55:30', NULL),
(4, 'BA', NULL, 'Srikanth', 'BA Test', '9951072123', 'SrikanthBA@gmail.com', 'Male', 1, 'analogue it solutions', NULL, 'XCbCHK0D2PXU.jpg', NULL, NULL, '$2y$10$T8YHtL/StMwRx5NAP1nHmej7GSqfsb1AqGl9Gkt1gIzgiDLlcaKeK', NULL, NULL, 'QVYPiU3Hy96Wp1Yhcr6TmEmuBrvI5dvJfWpRsE2YJMIbIa9X7gZg7JQeXnK4', 'Active', 'Pending', 0, 2, NULL, NULL, NULL, '2025-03-24 11:58:46', '2025-04-02 05:19:27', NULL),
(5, 'user', 2, 'first user', 'ones', '9876547895', 'first@gmail.com', 'Male', 1, 'First Address one data', NULL, NULL, NULL, NULL, '$2y$10$OqFpht7j2y5645TAMa/jpeAXICw5BjnSWjLfWjmtq0baDCNCbrjQ6', NULL, NULL, NULL, 'Pending', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-25 05:54:42', '2025-03-25 05:54:42', NULL),
(6, 'user', 2, 'Second user', 'second', '9632587415', 'second@gmail.com', 'Female', 1, 'Second 2nd User Details', NULL, NULL, NULL, NULL, '$2y$10$M3b2Cxy9z49c8c4ARETblugpqJcoG..7F4rsrSzAqeQkgiDOJvrhO', NULL, NULL, NULL, 'Pending', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-25 05:55:46', '2025-03-25 05:55:46', NULL),
(7, 'user', 4, 'first', 'last', '8978182194', 'firstuser@gmail.com', 'Male', 2, 'First Entry flat', NULL, NULL, NULL, NULL, '$2y$10$3zOJKONXMrgH7fIYAhhXeOgIy6NSQ4bUxxYxMEgOGdXbqe9Muhrr.', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZDY0MWU5ZmExOTllZDk3OWMwODBlYTM0YzlkODU2MGRlMjg5ODBhMmEyZTc3YTU2OWVlMjA0MmY0NmVlZGVlZjk5ZWQ0NTczYzIyZTNhMDIiLCJpYXQiOjE3NDI5NjY1NDkuODQ5NDA1MDUwMjc3NzA5OTYwOTM3NSwibmJmIjoxNzQyOTY2NTQ5Ljg0OTQwNjAwMzk1MjAyNjM2NzE4NzUsImV4cCI6MTc3NDUwMjU0OS44NDU1NTQxMTMzODgwNjE1MjM0Mzc1LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.WCrUscBXrwWUG-nBNZM6Mpyl6KtjJAAqcgNoCjb8wK2TxfbBi_ub6nPWuKsOAdziv5MENMe7LgvF8NM5SDcno5ue5JmlUQgy_Vh9S5FHXv9KliBdZfwSZ3H0WIZen9lvMZVIpfog164PegxFyZ3GQf1SgF3xpQrAyXdg7B6Ika0pYg_SQa5kvnlBWl38y4V1ANOBcwzwfXhccO72qZ4oY_CfSp_2DNIcBpVdDGfh_U558pEgPndaLGLjtEO2twdZpwoNmAVW_kKliHUU9LC5SQwVCUPbRnf04Me4WxRvBHom-vY8z7EH6KbVA0lv6GycPDF3-ascRGYBiiuvu9n-6h0RZr4_QklX6_Hob9N_HV9qiT9pAZsreY3FT3nVz1eQ833PtEy0gipOcLnC9EY3iqcazuQX9PoyDOcq_wTthIeN2v9OslgU4WyNqr4mA-xe0zOACg8SxQbsAD2IP58xN14MuaHsq1y3-OopMMzIH7NjGv_YgCpRYsy4OwzmO17_5uupioRhxKLsGsWOK04_LsTxiU9zx-AUxbRSlpxQNwFySb9A09_UlkbfkMrnUPiWKRLDHlwFWJb_710w_EAcsf4pXjdmeOT8RgikYdQZQiT2icZriX1DlYLM_HUVpMLwkmvcerKuz2KnKEGX0cxI7QaosJhpO3Ef-9uuax_N4MY', NULL, 'Q1QEGGP8ES6ltPTqGFJsVERgcp0WGU1BXwAhNBb6LodJO8kKYBRKoKBBibtj', 'Active', 'Pending', 0, NULL, 1, NULL, NULL, '2025-03-25 06:04:27', '2025-03-26 05:22:29', NULL),
(8, 'user', 4, 'Security Guards', 'Guard one', '8527419635', 'securityguards@gmail.com', 'Male', 2, 'First Security Guard', NULL, NULL, NULL, NULL, '$2y$10$NnVPTwJmJJP9A6tfYYwRpuewmUOew0xk81oZW07S/rJoD7jOBqSEC', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDkzMzhkN2VlY2RkMTdiMjJiN2E5MGFkY2NlMDc2ZmJkZmU0ZWE1YTYxZDRiYjA3YmExYjlkMzEyMTBmODBkMTM1MWFjMWJlZGJlZGMwZjAiLCJpYXQiOjE3NDM2ODIyNDMuOTY0Nzg2MDUyNzAzODU3NDIxODc1LCJuYmYiOjE3NDM2ODIyNDMuOTY0Nzg3MDA2Mzc4MTczODI4MTI1LCJleHAiOjE3NzUyMTgyNDMuOTYwNjAzOTUyNDA3ODM2OTE0MDYyNSwic3ViIjoiOCIsInNjb3BlcyI6W119.OZLjaLdX4CVuU5fzV3lmLEWxMjoKReLE0Fa3kGfUrFwVplSomcg67OlfpsFgdSjqRZigmrfjwdOyzPeFdYGG4-ga5G_iiTzUmZu0yQURV9bNFsFZ9X6KJLw_4vdUw3miI48qML5Zy00HD65_APhjrFOnLryXNHBmbIK0r5mAzXULjb2C6czyxtB-Oz9Z6cTJ09TkLkost-jOh71t2hMuFL3qjHyNei2fp0s1MFcHn8ERvHWYL5iHUahLdm_Y4i7ZONa2KWO3mkX-0pezWedI-yxoejJvbEEKEM6YhVqrM5_QzBe7fGdsXQ1xN8F_YR2Y6JyRRsaXGYdXdD90woA4u5z6LbhhvRIToapZkIPO5iOoiMuj5Ge9qDm7_Vo72uGhEr7CI4Ekdr-XI-urQ-XHVxEPq5sZel0pnqQH1tsIUt7aV62PTfaxQRft6WPog2BKn9Ju5lM13qEezT2i-irLKGyf8dBcANuc1_q_g2QSK8wV4tFjvQYQL7z9Tba6pYbyf-k2v9gwY1HoKEf8kv1-oMQwwQaIGtMK8vgXgg8jkfwD9dhL8IcEp84YpdqytlF2xNx-182nJkLeeKAqwaN56_HgfO90ga8ZbsneEg0RFTnnxwPJAAHp0qfNMlhItTw-AszIrisOXpHvth9SOejO9BP1_Sy15nsIQXFx5KbVuck', NULL, 'N2htrEYVM4RZwBJomDhL9fotEr98hzgdRGsEqNNfrD7ZugF4GYGIeMq9MVQZ', 'Active', 'Pending', 0, NULL, NULL, 1, NULL, '2025-03-25 06:09:06', '2025-04-03 12:10:43', NULL),
(9, 'user', 4, 'second User', 'second', '9654785478', 'seconduser@gmail.com', 'Male', 1, 'Second Area and Second Address', NULL, NULL, NULL, NULL, '$2y$10$e9wNmGdt20.Y7ZCAo1m4juHn.whHfnpd85ikTeHCPNBhNuDrdpEj6', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-25 06:15:14', '2025-03-25 06:16:49', NULL),
(10, 'user', 4, 'Rohith', 'Madipelly', '9948245411', 'madipellyrohith@gmail.com', 'Male', 1, '11-24-140, 2nd Bank Colony', 506002, NULL, NULL, NULL, '$2y$10$tD6TTx/UDAG8dRpJ.Erha.TVImIaw8H9eYDbXBqHh5Q/r9Rz1Od7e', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMjIxMmU1YWJiMTI5YWFkNjQxYmY2NzQ5NWViYTliZDFlY2I4MjBiZjJiZDcxYTNiNmJmYjRjMGI3NzNiNmM4Njc2ZmZiODdhNWI2NGI2OTYiLCJpYXQiOjE3NDM2ODYzNjkuNjY2MDg0MDUxMTMyMjAyMTQ4NDM3NSwibmJmIjoxNzQzNjg2MzY5LjY2NjA4NTAwNDgwNjUxODU1NDY4NzUsImV4cCI6MTc3NTIyMjM2OS42NjMyMzcwOTQ4NzkxNTAzOTA2MjUsInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.sZSIFacCO-XHlsZvGH5oXk77GJBbwMFH359PMJhZ4GsT2qM1tscq1Cogmnw8gCSGZoHTXjuGceKIa_Im8JSGhkWXiVOqKgTXhJIJzErvJrK3fmSqguTZCy8ZaxToCK8wp_BfOyLRM_AljmzF-j9TzLB8LSQoW1f-wo3YfMrA9YjgBg7iVSfyUfo4WEvaFw3tRqU4ylBXj_bJlchNQVon-XDND-SVRTeYAM2o9IiWcyKCRp4cIuuqv6jpYSXf12jDIlS2CJOdThg30dbdVjg0-Tu9pwLzd4GSVhvUEA3Y_AG_pJobR7ZdILqPpzPgYFwo8IzKuW1MXmRGxCiH3v7TBl7B4hfAUrI13kt6RvK0BUDpEiF4hX64OqIBc5B0z06u-i5JRGsccVUoqo7_92tfiVByMYEUB_QQrV4JUXa_iu7proddmC053QVPUGwvoLLL3zRbc6bC1P3Y4b12FYVWQEdOYgQurGIquhlRBMan_3qDIh8hjOBP8QB0YYyYFQF19vcY2IhYgCZep7DBwNDTbFS-GoHnvw3YtPGb5jKzZ_2Bz_Jw99TtwuPGNBvGsPOwK2S-Im3nzpNErKbbam530lWHvRb5x9CJd9GedoQHGV76bfY_CS9WIlOJtZqPLPSzOrmIgcr1esP-PFWl6CIepDe-wHmm0v05D8AiyBP2Z1E', NULL, 'cosXGT1WzhgCKiJrfRr7FBrOckLXHRE8ICrdGNEI7zEMUN5qaHCuNoKGWiBu', 'Active', 'Pending', 0, NULL, 3, NULL, NULL, '2025-03-26 05:34:05', '2025-04-03 13:19:29', NULL),
(11, 'BA', NULL, 'Jack', 'Reacher', '9876543211', 'jackreacher@myflatba.com', 'Male', 1, 'Mindspace, Hyderabad', NULL, 'UXtC1sKTKZ79.jpg', NULL, NULL, '$2y$10$CcrF2C58nLelhgyT7PQU9e/kpgzm.N/n8rahi9pKyamTeGO257qXu', NULL, NULL, 'JZ3zgDOJRcyqzxCUKrJ9RI1L8KuZBci3CmXkjlLGpuWwOzwo1jbhqlCVYtHl', 'Active', 'Pending', 0, 4, NULL, NULL, NULL, '2025-03-31 06:48:21', '2025-04-03 09:48:22', NULL),
(12, 'user', 11, 'Gayatrigayatrig', 'Todoyffuugiggiiggohohohohoh', '8500777507', 'gtankar@gmail.com', 'Female', 1, 'Manikonda, Hyderabad', 968699, 'evfEu2IMDaKr.jpeg', '$2y$10$W15jUN7izrvjDyHnPHTt8.parXhLTvzbNaOi9tKsmDYAod/kmPctC', 'Verified', '$2y$10$uJR2ybsZnRloqxGK2LMnP.JwrHbXIJZxTV4WaYkvkr1ZYtjiaTNn.', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiN2VlNzFmMGJkODcwYTEyYzU4MDYzZmNjNTAwNzI1ZjUwODZjZmY2MmE4OTU3OWY3NzI3YzNmMjBhMDYwZThmZjI5MDhmMTI1NzA4ZGEwNzgiLCJpYXQiOjE3NDM1OTM3MTAuOTQwNjUxODkzNjE1NzIyNjU2MjUsIm5iZiI6MTc0MzU5MzcxMC45NDA2NTQwMzkzODI5MzQ1NzAzMTI1LCJleHAiOjE3NzUxMjk3MTAuOTM3NjIxMTE2NjM4MTgzNTkzNzUsInN1YiI6IjEyIiwic2NvcGVzIjpbXX0.GW6lmeKZiB9JpvjpoymdvDlMtqghgipB_ZgKc1AmWmPxSIvfM0nbc090bRbAGjZedG9ThWUmjwDr1T1ul9oQ4jjgRPOQDPONmEA934lVhrY2aLL7zIe-xbZs3lAfSIYFeLTGQiiKmHWFYmXZVMVngtqbhzCottunSC7kgxzjAZ_6l3z4pn70qe93KQ1qflc767JVdrTB1rWivlJJi9deNgkkYych62cl2xcgrJQCA0Hc9SGI8OXu6d6SD_42y9Q2teD0UjiM9xfiXdJ3Hn_l64mPP7lo7ALPLDLdSFFaoRv0Y5Qt0kg2sH30kDU3Wyt3tPGwFtB3EE_KfrUIMz9Zblxq2MCzjz5FfNP9zCA1E-ZHy6J6BpeTe6LWAV8bCBlZgLf_4WIsZuXYw1wZrKz7d5hMO_lQRe-LfGqcpQkXTF1sdp93l8eCGThWF3bptTKBytjnq7HJYBOBIQUooJ9f6DMy6FCvKHsEyBMyJ8W9CeBDqkUsbMvqmWWFYAPsn3KoJb5D-5RPI0NxCpuYIwaULcPCmdqQMMxtmcBR4NdsAhOFnqllPPyN5tIu8OnWeCnj0OwQDEnaRzm_eenJSgyJXoxO-UaXwKm72jrCkNeE1iKhgOr8GuwxH_dH1ubAVQUQGhkImD4JDzqlRO3mbdX_HwgEia76Qan8ObeW3TSw09E', NULL, 'gZ975fyWopT373Kv7N528rq7poDYTh06pWPRndfWEKjCbK0KxyFDbt0IsKka', 'Active', 'Pending', 0, NULL, 7, NULL, NULL, '2025-03-31 06:57:40', '2025-04-02 11:35:10', NULL),
(13, 'user', 11, 'Ranjan', 'Shah', '6734567898', 'ranjan23@gmail.com', 'Male', 1, 'Tellapur, Hyderabad', NULL, NULL, NULL, NULL, '$2y$10$she1x4m7UXvsDmKrNuAr7OvTVTI6BCZtVi1wJFsst7rLgOZnv2PFi', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-31 06:58:33', '2025-03-31 07:14:00', NULL),
(14, 'user', 11, 'Srinivash', 'Kaushik', '7645678987', 'srinivash@gmail.com', 'Male', 1, 'Kollur, Hyderabad', NULL, NULL, NULL, NULL, '$2y$10$Zf3/jbk/vl4aK4EWxx2sgueZfq/BhlAg7iAofnSan71AXIbBXQpse', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-31 07:01:12', '2025-03-31 07:13:55', NULL),
(15, 'user', 11, 'Karan', 'Verma', '6574789890', 'karan@gmail.com', 'Male', 1, 'Kondapur, Hyderabad', NULL, NULL, NULL, NULL, '$2y$10$E.oAhHkya1kxgMuOQ679jOBE/yVdyfZWTfIFWogsrqiikIQano6Ai', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-31 07:08:58', '2025-03-31 07:13:49', NULL),
(16, 'user', 11, 'Subh', 'Ashish', '8123654567', 'subh@gmail.com', 'Male', 1, 'Kollur', NULL, NULL, NULL, NULL, '$2y$10$Xqz5qNgULl12i.LTxfO2.eaZppf5ypi/visrcr0JZiZGpOoQSqUBC', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-31 07:11:27', '2025-03-31 07:13:36', NULL),
(17, 'user', 11, 'Nikki', 'Sharma', '6345098345', 'nikki@gmail.com', 'Female', 1, 'Kollu', NULL, NULL, NULL, NULL, '$2y$10$i6VVOfTLHNgi21oHgLeCT.GqRcloW6XaytMFseIEQjZLLYqY5p8rm', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZjA4MjE2Yjc2OGNlMWI0ODk5M2RlNzRhNTg5M2M3YzA1ZTZhODFlNzhhNDg4OWM2ZGY5MTBhNTRiZjEwNmY5YTVhM2ZiODM3OTkwMWJiMTgiLCJpYXQiOjE3NDM0MjMxMzAuMTA0ODMwOTgwMzAwOTAzMzIwMzEyNSwibmJmIjoxNzQzNDIzMTMwLjEwNDgzMTkzMzk3NTIxOTcyNjU2MjUsImV4cCI6MTc3NDk1OTEzMC4xMDIzNzA5Nzc0MDE3MzMzOTg0Mzc1LCJzdWIiOiIxNyIsInNjb3BlcyI6W119.WCDv6lmqyzQ91Si77zO3lHyfWueu0Cpleksj0IMYKoh_YJmtvWYRjkr_7EBWnlPqOvRvqyn66Y85cDAu-vmQuVCOZ_-9CdGa8y8_igqEdBHOLNLnQIa8XPgA8Z_qNQb9fG5fYokRlgZgyqzto1j3XLgO8s7CjSh3zUrUADYBw3Yysx_9Woc76NWUs4lsg9v-qPiZ9xjXjSUKu_C4DlFA4kqn-EAY8CaVSEWXhJU7FWeelWxx2KbPeKxSYmkMH9S5amF6w7fkg17URggCNLRFS2tXRULDxezjpYcc9CXOYfr9rR6ypC_ITRNT9YDMzeuyoswC9RZhDWIXxU8wgAUeQ6hukUNhgUtIita9l1WVnlXUQe7wZJwV8_ti7-X1eDeDQYgL-rH6T52RdQCoyjHUV2atlZkX-rM9UXxD5zeGCOc6C-bJA2e5dYNAysmWiyH7ozAwdEr2KvyDMUWs6bWXZ2Mkc-B3AqSj7tdbwUSu1tkiXBzrQtsW4ft_MpKxHFhM3jBUdzijQgaSmtTTQQuNFBxYsoBeWFNrjYydeYGD2SiThK6b9qNOmDGspK91CBMNhx9o9EBWx8SE7DyPfLwkm_13aDBWix4I2MeRh4GjBSIXHD8cgTiShkDL2oL8E2AIcvOIm_2SKUUJJVPOGqP2ZbmCVD2K3qV_fz8BwX7qbG8', NULL, 'DTlB9KLVU22pEA0z4FXJofEcudC5rGOGTdRu3vxLzFxneErfdj7iXLzkFt6y', 'Inactive', 'Pending', 0, NULL, 5, NULL, NULL, '2025-03-31 07:13:25', '2025-03-31 12:12:10', NULL),
(18, 'user', 11, 'Megha', 'Sherin', '7234098709', 'megha@gmail.com', 'Female', 1, 'Manikonda', NULL, NULL, NULL, NULL, '$2y$10$kXQDGrv3AuWyGq2MggoLLevaj5O8Heu7bQiiQyE68YeTivWLxK8FW', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-03-31 07:14:59', '2025-03-31 07:15:02', NULL),
(19, 'user', 11, 'Nitish', 'Sareen', '6720986567', 'nitish@myflatowner.com', 'Male', 1, 'Ameerpet', NULL, NULL, NULL, NULL, '$2y$10$ElIoQWSJaL2OTqt.Wwm/7uOWLl4bndClDX8Rv368y0/PrmoCaGNKq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDk4Zjk3NzgxOGUyNTYyOTBkODAxOGI1ZGYwZjQ3Y2Y3YTM3Nzc5NzE3MjcwMGFmYjcwN2QwZDlmZmUxOWZhZDRhMjliYzAzNDA4NzNmZjciLCJpYXQiOjE3NDM0MTMyODEuNzMwOTk5OTQ2NTk0MjM4MjgxMjUsIm5iZiI6MTc0MzQxMzI4MS43MzEwMDMwNDYwMzU3NjY2MDE1NjI1LCJleHAiOjE3NzQ5NDkyODEuNzI4MTA3OTI5MjI5NzM2MzI4MTI1LCJzdWIiOiIxOSIsInNjb3BlcyI6W119.j5jfQ27pDzEjWKQYfnUJYjh8CShpHMzDSXqmo1xx0LqWoSTuAWihFFSTbsMnnADBQRdOvEfnd_Pa-NNO539UpxV4K1ah_AY7TeZw_A1rso_Bs3pY4Chck5uWkvfVocrKr3OVnz0DoYDwkfoy4misKTSpd_jma_cg-7RKHwggT64tE3P03tYVn9DwSALmuKkB0O8C1FKUAWq-a6UVy17FKOGK6wWPZeCwIMzD-o4Hu4X2M6YuAlDXoPzJpcXEtrU_gMGhuKjAmCgMKV6UfPAMCNS-yVldY10mKeGtjSB8s_ef3tiY-y1VZSuhGsiUTsNZlbN4mj6UlFZLPIydmFH4I6u9dor-XgJHEzya5_D9uPccY9e8INd_Q3oGjDKQwNMTbi8vyOfEAbZ5UmwAGNGMq3dp2dV6lLK3cJIR8k-SSQlrta5AhbJ57gR94MJqGXxjDTSoqxAei8hqO4fvMQwb5AWEEpfL1Pjt3hLZvPjE73Q6yJb-XGRZdKGgTyZpB-rrERzmyyqTw6CLUMSZ8nJ6NvWZahQm-v9G5M9hqXmBJgVkJyP8VvQHt626y3-JqgchsGUWYRkFq2d67FmIPigSG0y5qQKXSQNmQNOm1ROGChWj_V42exEMooURuKTPRdxm78vqzIVz0N50RNXv6G9LyPhwyn0P7UADWqRXXAT2tD4', NULL, 'tqv872xA5YfWEvhvRivDcwoq7Dl53matSa7F6n39H27RPnoib1dRatGEw4r6', 'Active', 'Pending', 0, NULL, 6, NULL, NULL, '2025-03-31 08:50:03', '2025-03-31 09:29:23', NULL),
(20, 'user', 4, 'Pat Cummins', 'Captain', '9632587458', 'cummins@gmail.com', 'Male', 1, 'SRH Team Captain', NULL, NULL, NULL, NULL, '$2y$10$J8GDnAk5sHwgeLe.E7BCZ.Wchg46uoOODFDsb75ceaMlTCjEZ.4Me', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-01 09:47:37', '2025-04-01 09:50:42', NULL),
(21, 'user', 4, 'Batter', 'Travis Head', '8547519563', 'Head@gmail.com', 'Male', 1, 'Left handed Batter', NULL, NULL, NULL, NULL, '$2y$10$4We6yCF1mF5B91lysqKWIuK93P6GvI.8qiP24.XB8vqgqkOhRZ382', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-01 09:48:55', '2025-04-01 09:50:16', NULL),
(22, 'user', 4, 'All Rounded', 'Abhishek Sharma', '8541237549', 'abhishek@gmail.com', 'Male', 1, 'SRH All Rounded', NULL, NULL, NULL, NULL, '$2y$10$TXAAXOC7WcC.VNypGQyj3e5M35ykyb/s.Eih7H4MKa5sYAvY9flye', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-01 09:50:09', '2025-04-01 09:50:23', NULL),
(23, 'BA', NULL, 'Megha', 'Saini', '7890123456', 'gtankar806@gmail.com', 'Female', 1, 'Kondapur, Hyderabad\r\nPincode: 500049', NULL, '91pxUE34yNtd.jpg', NULL, NULL, '$2y$10$yjCNWGkkC6SbNpHNA8nT7.G5sxqYIK47YFX1lGfpVsY37ZnFfK.CO', NULL, NULL, 'T2g3oihR4q92DaSfesx05qNSUVKl6fIV0BX9fOnjlMYUOvSDKbkoGQGz3WlU', 'Active', 'Pending', 0, 7, NULL, NULL, NULL, '2025-04-03 09:51:13', '2025-04-03 10:18:32', NULL),
(24, 'user', 11, 'Roshan', 'Sahu', '6789098909', 'roshan@gmail.com', 'Male', 1, 'Kondapur', NULL, NULL, NULL, NULL, '$2y$10$2gtN3eO9LzsutYcFO9KfxuKaEH/PamM9FyWo5w0vM39l4PCdSnTGu', NULL, NULL, NULL, 'Pending', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-03 10:28:15', '2025-04-03 10:28:15', NULL),
(25, 'user', 11, 'test', 'tester', '6745678909', 'tester@gmail.com', 'Male', 1, 'Testing', NULL, NULL, NULL, NULL, '$2y$10$OMt.uqSxDKvBgiuX9tMh6.FDr8mWlNQLm61OXyh0I2YnVSJJAeCp2', NULL, NULL, NULL, 'Pending', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-03 10:55:27', '2025-04-03 10:55:27', NULL),
(26, 'user', 11, 'dfghjkl', 'fdghjkl', '6576890768', 'fghjk@gmail.com', 'Female', 1, 'rdfgyhujiko trdfyuio', NULL, NULL, NULL, NULL, '$2y$10$b5rDQLZnU3/fFpW66gItdOL3.oGnHMA3xj.Y7kqmd0/GoXsMVEX3C', NULL, NULL, NULL, 'Active', 'Pending', 0, NULL, NULL, NULL, NULL, '2025-04-03 11:05:09', '2025-04-03 11:07:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  `vehicle_type` varchar(191) NOT NULL,
  `vehicle_no` varchar(191) NOT NULL,
  `ownership` varchar(191) NOT NULL DEFAULT 'own',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `user_id`, `flat_id`, `building_id`, `visitor_id`, `vehicle_type`, `vehicle_no`, `ownership`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, 2, NULL, 'four-wheeler', 'TS12A0987', 'Guest', '2025-03-25 07:22:43', '2025-03-25 07:22:43', NULL),
(2, 7, 1, 2, 3, 'two-wheeler', 'TS21X4321', 'Guest', '2025-03-25 08:44:18', '2025-03-25 08:44:18', NULL),
(3, 7, 1, 2, 3, 'four-wheeler', 'TS07F1110', 'Guest', '2025-03-25 08:44:44', '2025-03-25 08:44:44', NULL),
(4, 9, 2, 2, 4, 'four-wheeler', 'TS45F1234', 'Guest', '2025-03-25 09:10:23', '2025-03-25 09:10:23', NULL),
(5, 9, 2, 2, 4, 'four-wheeler', 'TS23G4321', 'Guest', '2025-03-25 09:10:42', '2025-03-25 09:10:42', NULL),
(6, 10, 3, 2, NULL, 'two-wheeler', 'TS03FB3725', 'Own', '2025-03-26 05:38:29', '2025-03-26 05:38:29', NULL),
(7, 9, 2, 2, 8, 'two-wheeler', 'TS19CF6662', 'Guest', '2025-03-27 04:53:49', '2025-03-27 04:53:49', NULL),
(8, 7, 1, 2, 9, 'two-wheeler', 'TS15F1432', 'Guest', '2025-03-27 05:21:21', '2025-03-27 05:21:21', NULL),
(9, 7, 1, 2, 9, 'four-wheeler', 'TS45F1112', 'Guest', '2025-03-27 05:21:35', '2025-03-27 05:21:35', NULL),
(10, 10, 3, 2, 14, 'two-wheeler', 'AP18G4321', 'Guest', '2025-03-27 06:28:42', '2025-03-27 06:28:42', NULL),
(11, 10, 3, 2, 14, 'four-wheeler', 'TS15G1234', 'Guest', '2025-03-27 06:28:54', '2025-03-27 06:28:54', NULL),
(12, 10, 3, 2, NULL, 'auto', 'TS03FB3446', 'Own', '2025-03-27 09:21:25', '2025-04-01 04:17:23', '2025-04-01 04:17:23'),
(13, 18, 5, 4, NULL, 'four-wheeler', 'TS03 FB3725', 'Own', '2025-04-01 07:21:47', '2025-04-01 07:21:47', NULL),
(14, 22, 10, 2, 16, 'four-wheeler', 'TG18V1818', 'Guest', '2025-04-01 10:01:29', '2025-04-01 10:01:29', NULL),
(15, 22, 10, 2, 23, 'four-wheeler', 'TS19C6662', 'Guest', '2025-04-02 09:29:03', '2025-04-02 09:29:03', NULL),
(16, 12, 7, 4, NULL, 'four-wheeler', 'TS06GH6756', 'Own', '2025-04-02 09:46:31', '2025-04-02 09:46:52', '2025-04-02 09:46:52'),
(17, 12, 7, 4, NULL, 'two-wheeler', 'TG76GH6780', 'Own', '2025-04-02 10:38:52', '2025-04-02 10:43:38', NULL),
(18, 12, 7, 4, NULL, 'four-wheeler', 'TG07SX6543', 'Own', '2025-04-02 10:39:15', '2025-04-02 10:39:15', NULL),
(19, 12, 7, 4, NULL, 'two-wheeler', 'DL76GY6789', 'Guest', '2025-04-02 10:44:31', '2025-04-02 10:44:31', NULL),
(20, 12, 7, 4, NULL, 'four-wheeler', 'DL76GY6786', 'Guest', '2025-04-02 10:52:55', '2025-04-02 10:52:55', NULL),
(21, 12, 7, 4, NULL, 'four-wheeler', 'DL76GY6788', 'Guest', '2025-04-02 10:53:04', '2025-04-02 10:53:04', NULL),
(22, 12, 7, 4, NULL, 'four-wheeler', 'DL76GY6788', 'Guest', '2025-04-02 10:53:19', '2025-04-02 10:53:19', NULL),
(23, 12, 7, 4, NULL, 'two-wheeler', 'DL76GY6788', 'Guest', '2025-04-02 10:53:26', '2025-04-02 10:53:26', NULL),
(24, 12, 7, 4, NULL, 'two-wheeler', 'DL76GY6788', 'Guest', '2025-04-02 10:53:30', '2025-04-02 10:53:30', NULL),
(25, 10, 3, 2, 25, 'four-wheeler', 'TS19F6662', 'Guest', '2025-04-03 05:09:55', '2025-04-03 05:09:55', NULL),
(26, 10, 3, 2, 27, 'four-wheeler', 'TS16F1234', 'Guest', '2025-04-03 05:45:01', '2025-04-03 05:45:01', NULL),
(27, 10, 3, 2, 29, 'four-wheeler', 'TS19C1234', 'Guest', '2025-04-03 10:39:01', '2025-04-03 10:39:01', NULL),
(28, 10, 3, 2, 30, 'four-wheeler', 'TS12G4567', 'Guest', '2025-04-03 13:00:30', '2025-04-03 13:00:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_inouts`
--

CREATE TABLE `vehicle_inouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `driver_name` varchar(191) NOT NULL,
  `driver_phone` varchar(191) NOT NULL,
  `photo_with_driver` varchar(191) NOT NULL,
  `purpose` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL DEFAULT 2,
  `building_id` int(11) NOT NULL,
  `total_members` int(11) NOT NULL,
  `head_name` varchar(191) NOT NULL,
  `head_photo` varchar(191) NOT NULL,
  `head_phone` varchar(191) NOT NULL,
  `stay_from` datetime NOT NULL,
  `stay_to` datetime NOT NULL,
  `visiting_purpose` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `user_id`, `flat_id`, `block_id`, `building_id`, `total_members`, `head_name`, `head_photo`, `head_phone`, `stay_from`, `stay_to`, `visiting_purpose`, `type`, `code`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, 1, 2, 6, 'Hemant Kumar', 'tnxw4dJEWwfQ.png', '9162035975', '2025-02-21 01:00:00', '2025-02-21 02:00:00', 'Test', 'Planned', '19gKh7Wr4d', 'Completed', '2025-03-25 07:22:55', '2025-04-02 04:50:15', NULL),
(2, 8, 1, 1, 2, 5, 'vishwesh', 'dZhqdB8b1YvN.jpeg', '8978182191', '2025-03-25 07:32:52', '2025-03-27 00:00:00', 'lunch', 'Unplanned', 'eQf6RTJIlk', 'Completed', '2025-03-25 07:32:53', '2025-03-25 09:23:42', NULL),
(3, 8, 1, 1, 2, 5, 'trail', 'gCCc7UFQaGq7.jpeg', '9874563215', '2025-03-25 08:42:52', '2025-03-28 00:00:00', 'party\'', 'Unplanned', 'QqwvmL4Y0T', 'Inactive', '2025-03-25 08:42:53', '2025-03-25 08:42:53', NULL),
(4, 8, 2, 1, 2, 6, 'guestnew', 'gGQJbcpZhaIj.jpeg', '8978182191', '2025-03-25 09:10:11', '2025-03-29 00:00:00', 'party', 'Unplanned', 'vdeFHdaJRm', 'Completed', '2025-03-25 09:10:12', '2025-03-27 05:57:36', NULL),
(5, 10, 3, 1, 2, 2, 'Preetham', 'wb4xHY9tRrxz.jpeg', '9515734313', '2025-03-26 00:00:00', '2025-03-28 00:00:00', 'Stay blessed', 'Planned', 'j71oQUo6Np', 'Completed', '2025-03-26 06:17:33', '2025-03-26 08:30:52', NULL),
(6, 10, 3, 1, 2, 5, 'Prashanth', 'Z7G0kYyyfYQ7.jpeg', '9951045544', '2025-03-26 12:06:00', '2025-03-26 18:30:00', 'Time pass', 'Planned', 'mBao7T1yjG', 'Inactive', '2025-03-26 06:39:56', '2025-03-26 06:39:56', NULL),
(7, 8, 3, 1, 2, 5, 'GuestPostman', 'gJImASJ4XJq7.jpg', '9162035984', '2025-03-26 12:46:27', '2025-02-26 20:00:00', 'Test', 'Unplanned', 'JgCMsuqYGd', 'Completed', '2025-03-26 06:51:19', '2025-03-28 11:35:15', NULL),
(8, 8, 2, 1, 2, 5, 'Viswanathan', 'X0Oz63I2ADqr.jpeg', '8978182191', '2025-03-27 04:53:31', '2025-03-29 06:30:00', 'datetesting', 'Unplanned', 'P3xJQXXcyG', 'Completed', '2025-03-27 04:53:32', '2025-03-27 05:57:16', NULL),
(9, 8, 1, 1, 2, 4, 'jabilli', 'lj2KZavxPNDn.jpeg', '1432143213', '2025-03-27 05:21:00', '2025-03-29 18:30:00', 'lovecourt', 'Unplanned', 'TciNs41L5H', 'Completed', '2025-03-27 05:21:01', '2025-03-27 05:40:30', NULL),
(10, 8, 3, 1, 2, 5, 'Preetham', '1ykw9btkRcIF.jpg', '9162035984', '2025-03-25 06:46:27', '2025-02-23 02:00:00', 'biriyani ha...', 'Unplanned', 'QOjm2drrI3', 'Completed', '2025-03-27 05:57:44', '2025-03-27 06:40:15', NULL),
(11, 8, 3, 1, 2, 5, 'Preetham', 'hKFsSn64Ydb8.jpg', '9162035984', '2025-03-25 06:46:27', '2025-02-23 02:00:00', 'biriyani ha...', 'Unplanned', '0hwrAH0Maq', 'Deny', '2025-03-27 05:58:32', '2025-03-27 06:13:45', NULL),
(12, 8, 3, 1, 2, 5, 'Preetham 2', '9tFYgEHsFZTa.jpg', '9162035984', '2025-03-25 06:46:27', '2025-02-23 02:00:00', 'biriyani ha...', 'Unplanned', 'bn99QMSzmc', 'LeaveInGate', '2025-03-27 05:58:48', '2025-03-27 06:15:27', NULL),
(13, 8, 3, 1, 2, 5, 'Preetham 3', 'ki6smwVeR47u.jpg', '9162035984', '2025-03-25 06:46:27', '2025-02-23 02:00:00', 'biriyani ha...', 'Unplanned', '7auqHf3sab', 'Completed', '2025-03-27 05:58:54', '2025-03-27 06:35:19', NULL),
(14, 8, 3, 1, 2, 2, 'surya', 'XmqQxHLpfRYb.jpeg', '9542367548', '2025-03-27 06:28:19', '2025-03-29 18:30:00', 'drinking', 'Unplanned', 'wHCDFQaVnM', 'Completed', '2025-03-27 06:28:20', '2025-03-27 06:30:54', NULL),
(15, 10, 3, 1, 2, 2, 'Shiva', 'v9ESnh5KU1oL.jpeg', '9951072012', '2025-04-07 10:00:00', '2025-04-07 12:00:00', 'Drink', 'Planned', 'KZzM0Wx9lG', 'Inactive', '2025-04-01 04:20:57', '2025-04-01 04:20:57', NULL),
(16, 8, 10, 5, 2, 4, 'ViratKohli', 'ApSzrzmeCY7X.jpeg', '8181818181', '2025-04-01 10:01:06', '2025-04-24 06:35:00', 'meetings', 'Unplanned', '5i32PK7xY3', 'Inactive', '2025-04-01 10:01:06', '2025-04-01 10:01:06', NULL),
(17, 10, 3, 1, 2, 2, 'Vishwesh', 'f8EDnqYchcUg.jpeg', '9951072005', '2025-04-02 00:00:00', '2025-04-03 00:00:00', 'FB gh', 'Planned', 'eODVp6vUzJ', 'Completed', '2025-04-02 04:37:53', '2025-04-02 04:41:07', NULL),
(18, 10, 3, 1, 2, 2, 'FB tb', 'dt9xQS7ConOC.jpeg', '9951072005', '2025-04-02 11:15:00', '2025-04-02 14:30:00', 'FB gn', 'Planned', 'KgLXPH0dtV', 'Completed', '2025-04-02 04:45:16', '2025-04-02 04:46:53', NULL),
(19, 10, 3, 1, 2, 2, 'FB tb', 'b4nvHxjY7bcu.jpeg', '9951072005', '2025-04-02 00:00:00', '2025-04-03 00:00:00', 'FB gn', 'Planned', 'dzEMjUDfmI', 'Completed', '2025-04-02 04:48:14', '2025-04-02 04:49:26', NULL),
(20, 8, 9, 5, 2, 2, 'Rajat', 'uJPyZm33htO8.jpeg', '9849658465', '2025-04-02 04:58:12', '2025-04-24 06:30:00', 'meetings', 'Unplanned', '2VX1IU27q6', 'Inactive', '2025-04-02 04:58:13', '2025-04-02 04:58:13', NULL),
(21, 8, 3, 1, 2, 5, 'five', 'fcxmUlEtmuZf.jpeg', '9878945235', '2025-04-02 05:08:16', '2025-04-23 05:30:00', 'visitor', 'Unplanned', 'I74ajAVqV7', 'AllowIn', '2025-04-02 05:08:20', '2025-04-02 05:50:31', NULL),
(22, 10, 3, 1, 2, 3, 'BA shiva', 'Dz0xtTJ6yLj4.jpeg', '9871234567', '2025-04-02 10:15:00', '2025-04-02 18:20:00', 'Rohit marriage', 'Planned', 'kXMbZXl9hx', 'Inactive', '2025-04-02 06:37:26', '2025-04-02 06:37:26', NULL),
(23, 8, 10, 5, 2, 5, 'Kohli', 'wCBQu5TcSWXG.jpeg', '9881182515', '2025-04-02 09:28:40', '2025-04-09 18:00:00', 'rohithsettlement', 'Unplanned', 't2Xsp9zZyk', 'Inactive', '2025-04-02 09:28:41', '2025-04-02 09:28:41', NULL),
(24, 8, 10, 5, 2, 5, 'ViratKohli', 'vnQWTIwtOyjV.jpeg', '9638527411', '2025-04-03 05:08:15', '2025-04-04 18:30:00', 'rohith', 'Unplanned', '2Lz9LOFWow', 'Inactive', '2025-04-03 05:08:16', '2025-04-03 05:08:16', NULL),
(25, 8, 3, 1, 2, 5, 'GuestVishwa', 'GCWOkXVpagJI.jpeg', '8978182191', '2025-04-03 05:09:28', '2025-04-04 06:00:00', 'rohith', 'Unplanned', 'sziXCqNlAl', 'LeaveInGate', '2025-04-03 05:09:30', '2025-04-03 05:10:14', NULL),
(26, 8, 3, 1, 2, 5, 'guestRohith', 'TGdDP0jMSGER.jpeg', '9638527415', '2025-04-03 05:12:06', '2025-04-04 18:00:00', 'testing', 'Unplanned', 'TrEmhP6yvT', 'Completed', '2025-04-03 05:12:09', '2025-04-03 05:13:10', NULL),
(27, 8, 3, 1, 2, 1, 'kusumavishwesh', 'Wz3ISdTpw8Gy.jpeg', '8978182191', '2025-04-03 05:44:48', '2025-04-03 18:30:00', 'general', 'Unplanned', 'IJNjjwgsTl', 'Deny', '2025-04-03 05:44:49', '2025-04-03 05:58:28', NULL),
(28, 10, 3, 1, 2, 2, 'Rohith', 'lYTG8fw7c2jp.jpeg', '9951072005', '2025-04-04 05:30:00', '2025-04-04 07:20:00', 'Dhdbdb', 'Planned', 'bDGdWxhBCS', 'Inactive', '2025-04-03 05:50:25', '2025-04-03 05:50:25', NULL),
(29, 8, 3, 1, 2, 9, 'guestTesting', 'cBlmNLkDKw7s.jpeg', '8975642312', '2025-04-03 10:38:49', '2025-04-03 06:30:00', 'meetings', 'Unplanned', 'oqK6PaPu8D', 'Inactive', '2025-04-03 10:38:50', '2025-04-03 10:38:50', NULL),
(30, 8, 3, 1, 2, 5, 'guesthemanth', 'bvC06IFqhQEV.jpeg', '8978451262', '2025-04-03 18:30:19', '2025-04-23 06:00:00', 'meetings', 'Unplanned', 'TByP3rFrTB', 'AllowIn', '2025-04-03 13:00:20', '2025-04-03 13:00:20', NULL),
(31, 8, 3, 1, 2, 5, 'ganesh', 'loXuB6GLlFHx.jpeg', '9658512542', '2025-04-03 18:35:44', '2025-04-10 06:00:00', 'metting', 'Unplanned', '9OpRihMmvy', 'Completed', '2025-04-03 13:05:45', '2025-04-03 13:08:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_inouts`
--

CREATE TABLE `visitor_inouts` (
  `id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `purpose` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `visitor_inouts`
--

INSERT INTO `visitor_inouts` (`id`, `visitor_id`, `building_id`, `flat_id`, `user_id`, `type`, `purpose`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 1, 8, 'In', 'Testing', '1234', '2025-03-25 09:23:42', '2025-03-25 09:23:42', NULL),
(2, 2, 2, 1, 8, 'Out', 'Testing', '1234', '2025-03-25 09:24:04', '2025-03-25 09:24:04', NULL),
(3, 2, 2, 1, 8, 'Out', 'Testing', '1234', '2025-03-25 09:26:00', '2025-03-25 09:26:00', NULL),
(4, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 08:30:52', '2025-03-26 08:30:52', NULL),
(5, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 08:31:22', '2025-03-26 08:31:22', NULL),
(6, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 08:31:48', '2025-03-26 08:31:48', NULL),
(7, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 08:32:21', '2025-03-26 08:32:21', NULL),
(8, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 08:32:56', '2025-03-26 08:32:56', NULL),
(9, 5, 2, 3, 10, 'In', 'Stay blessed', 'GGVVVGGGDH', '2025-03-26 08:40:19', '2025-03-26 08:40:19', NULL),
(10, 5, 2, 3, 10, 'In', 'Stay blessed', 'HHHHHHHCHD', '2025-03-26 08:47:09', '2025-03-26 08:47:09', NULL),
(11, 5, 2, 3, 10, 'In', 'Stay blessed', 'j71oQUo6Np', '2025-03-26 09:24:03', '2025-03-26 09:24:03', NULL),
(12, 2, 2, 1, 8, 'In', 'Testing', '1234', '2025-03-26 09:34:23', '2025-03-26 09:34:23', NULL),
(13, 9, 2, 1, 8, 'In', 'lovecourt', 'TciNs41L5H', '2025-03-27 05:40:30', '2025-03-27 05:40:30', NULL),
(14, 8, 2, 2, 8, 'In', 'datetesting', 'P3xJQXXcyG', '2025-03-27 05:57:16', '2025-03-27 05:57:16', NULL),
(15, 4, 2, 2, 8, 'In', 'party', 'vdeFHdaJRm', '2025-03-27 05:57:36', '2025-03-27 05:57:36', NULL),
(16, 14, 2, 3, 8, 'In', 'drinking', 'wHCDFQaVnM', '2025-03-27 06:30:54', '2025-03-27 06:30:54', NULL),
(17, 13, 2, 3, 8, 'In', 'biriyani ha...', '7auqHf3sab', '2025-03-27 06:35:19', '2025-03-27 06:35:19', NULL),
(18, 10, 2, 3, 8, 'In', 'biriyani ha...', 'QOjm2drrI3', '2025-03-27 06:40:15', '2025-03-27 06:40:15', NULL),
(19, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-27 07:05:07', '2025-03-27 07:05:07', NULL),
(20, 14, 2, 3, 8, 'Out', 'drinking', 'wHCDFQaVnM', '2025-03-27 07:05:13', '2025-03-27 07:05:13', NULL),
(21, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-27 08:37:54', '2025-03-27 08:37:54', NULL),
(22, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-27 08:38:03', '2025-03-27 08:38:03', NULL),
(23, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-27 08:46:54', '2025-03-27 08:46:54', NULL),
(24, 7, 2, 3, 8, 'In', 'Test', 'JgCMsuqYGd', '2025-03-28 11:35:15', '2025-03-28 11:35:15', NULL),
(25, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-28 11:35:29', '2025-03-28 11:35:29', NULL),
(26, 13, 2, 3, 8, 'Out', 'biriyani ha...', '7auqHf3sab', '2025-03-28 11:35:40', '2025-03-28 11:35:40', NULL),
(27, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-03-28 11:35:54', '2025-03-28 11:35:54', NULL),
(28, 1, 2, 1, 8, 'In', 'visiting', '19gKh7Wr4d', '2025-04-01 10:05:12', '2025-04-01 10:05:12', NULL),
(29, 17, 2, 3, 10, 'In', 'FB gh', 'KZzM0Wx9LG', '2025-04-02 04:41:07', '2025-04-02 04:41:07', NULL),
(30, 2, 2, 1, 8, 'Out', 'lunch', 'eQf6RTJIlk', '2025-04-02 04:43:00', '2025-04-02 04:43:00', NULL),
(31, 18, 2, 3, 10, 'In', 'FB gn', 'KgLXPH0dtV', '2025-04-02 04:46:53', '2025-04-02 04:46:53', NULL),
(32, 18, 2, 3, 10, 'Out', 'FB gn', 'KgLXPH0dtV', '2025-04-02 04:47:41', '2025-04-02 04:47:41', NULL),
(33, 19, 2, 3, 10, 'In', 'FB gn', 'dzEMjUDfml', '2025-04-02 04:49:26', '2025-04-02 04:49:26', NULL),
(34, 26, 2, 3, 8, 'In', 'testing', 'TrEmhP6yvT', '2025-04-03 05:13:10', '2025-04-03 05:13:10', NULL),
(35, 31, 2, 3, 8, 'In', 'metting', '9OpRihMmvy', '2025-04-03 13:08:51', '2025-04-03 13:08:51', NULL),
(36, 1, 2, 1, 7, 'Out', 'Test', '19gKh7Wr4d', '2025-04-03 13:11:19', '2025-04-03 13:11:19', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building_users`
--
ALTER TABLE `building_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classifieds`
--
ALTER TABLE `classifieds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classified_photos`
--
ALTER TABLE `classified_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials`
--
ALTER TABLE `essentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essential_payments`
--
ALTER TABLE `essential_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_members`
--
ALTER TABLE `family_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flats`
--
ALTER TABLE `flats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gate_passes`
--
ALTER TABLE `gate_passes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guards`
--
ALTER TABLE `guards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_photos`
--
ALTER TABLE `issue_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_payments`
--
ALTER TABLE `maintenance_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timings`
--
ALTER TABLE `timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_inouts`
--
ALTER TABLE `vehicle_inouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_inouts`
--
ALTER TABLE `visitor_inouts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `building_users`
--
ALTER TABLE `building_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classifieds`
--
ALTER TABLE `classifieds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `classified_photos`
--
ALTER TABLE `classified_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials`
--
ALTER TABLE `essentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essential_payments`
--
ALTER TABLE `essential_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `family_members`
--
ALTER TABLE `family_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `flats`
--
ALTER TABLE `flats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gate_passes`
--
ALTER TABLE `gate_passes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guards`
--
ALTER TABLE `guards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `issue_photos`
--
ALTER TABLE `issue_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_payments`
--
ALTER TABLE `maintenance_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `noticeboards`
--
ALTER TABLE `noticeboards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timings`
--
ALTER TABLE `timings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vehicle_inouts`
--
ALTER TABLE `vehicle_inouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `visitor_inouts`
--
ALTER TABLE `visitor_inouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
