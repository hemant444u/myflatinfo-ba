-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 19, 2025 at 03:54 PM
-- Server version: 10.11.11-MariaDB-cll-lve
-- PHP Version: 8.3.20

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `model` varchar(191) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `flat_id` int(11) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `signature` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `model`, `model_id`, `user_id`, `flat_id`, `desc`, `amount`, `status`, `payment_id`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'order_QJchiQnd2UQten', 'Payment', 1, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 258, 'Created', NULL, NULL, '2025-04-16 06:03:36', '2025-04-16 06:03:36'),
(2, 'order_QJcigNq7uLXctU', 'Payment', 1, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 258, 'Verified', 'pay_QJcinZ9pyxECdG', '77e9c878ba1907eda017a290d5af8ca7356b880b86540aea7d367f19860efe2a', '2025-04-16 06:04:31', '2025-04-16 06:04:44'),
(3, 'order_QJck0BzNnMgv8A', 'Payment', 1, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 143, 'Verified', 'pay_QJckA5c4VEsUeR', 'c0c1a5e9ca803b9dd0b74296dad7360791fba49356bc1ff2833f26849e983646', '2025-04-16 06:05:46', '2025-04-16 06:37:52'),
(4, 'order_QJd688IDZzv67W', 'MaintenancePayment', 2, 48, 1, 'Creating order for maintenance payment from  to ', 3000, 'Created', NULL, NULL, '2025-04-16 06:26:43', '2025-04-16 06:26:43'),
(5, 'order_QJd7KQlffpMP5H', 'MaintenancePayment', 1, 48, 1, 'Creating order for maintenance payment from  to ', 2000, 'Verified', 'pay_QJd7ULa8obfmDV', '984e3fa3236b5a046301757623fdf96e4c5b1903f4bb7011615e620227abbe7f', '2025-04-16 06:27:51', '2025-04-16 06:28:06'),
(6, 'order_QJdERRlD8EphxC', 'Payment', 1, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 1000, 'Created', NULL, NULL, '2025-04-16 06:34:35', '2025-04-16 06:34:35'),
(7, 'order_QJe1J14SfzYjmZ', 'MaintenancePayment', 2, 48, 1, 'Creating order for maintenance payment from  to ', 3400, 'Created', NULL, NULL, '2025-04-16 07:20:51', '2025-04-16 07:20:51'),
(8, 'order_QJe6dpXwl9OMnh', 'MaintenancePayment', 2, 48, 1, 'Creating order for maintenance payment from  to ', 3400, 'Verified', 'pay_QJe6pCZizOorct', 'a2aa27c61ca4a29100f170ad89f2e257530c857b44cb85c7c784b47c9fe32e72', '2025-04-16 07:25:54', '2025-04-16 07:26:13'),
(9, 'order_QJfDWgxPHYdPBA', 'MaintenancePayment', 3, 48, 1, 'Creating order for maintenance payment from  to ', 1200, 'Created', NULL, NULL, '2025-04-16 08:31:06', '2025-04-16 08:31:06'),
(10, 'order_QJfIOpDgKrwiw5', 'Payment', 2, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 25, 'Verified', 'pay_QJfIXPDBvBULB5', '6286a9b69aa35bf3c4fbbc51afa466797c9669dff55ed0f8f86824647c87471e', '2025-04-16 08:35:43', '2025-04-16 08:35:56'),
(11, 'order_QJiBvUP8WmJI4p', 'MaintenancePayment', 4, 48, 1, 'Creating order for maintenance payment from  to ', 7300, 'Verified', 'pay_QJiC4f9OXbqmws', '0984760603dc9e54c68ae9120b70f130eb21d8c55447569f4efc1c3142529bd1', '2025-04-16 11:25:40', '2025-04-16 11:25:54'),
(12, 'order_QJiFUmaZplkREu', 'Payment', 3, 48, 1, 'Creating order for event My Home Bhooja Build\'s Expo', 2500, 'Verified', 'pay_QJiFdM9MbLMM1I', 'c0104d0c63629dd1a6e2863c85724b6a920d8b60caba9745e17044e4aa74bd45', '2025-04-16 11:29:03', '2025-04-16 11:29:16'),
(13, 'order_QJj499MZuu7aLL', 'Payment', 4, 48, 2, 'Creating order for event Hoil', 1000, 'Verified', 'pay_QJj4Gz19Egne6b', 'ef6f4e217b3fc5595e5fd1a281a013eae33633257197f7369b8568478539ed58', '2025-04-16 12:17:00', '2025-04-16 12:17:12'),
(14, 'order_QM0gK1Fdl72I7A', 'Payment', 5, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 1, 'Created', NULL, NULL, '2025-04-22 06:48:56', '2025-04-22 06:48:56'),
(15, 'order_QM0gK22qmRl8fQ', 'Payment', 6, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 1, 'Created', NULL, NULL, '2025-04-22 06:48:56', '2025-04-22 06:48:56'),
(16, 'order_QM0gLKscnfeRct', 'Payment', 7, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 1, 'Created', NULL, NULL, '2025-04-22 06:48:57', '2025-04-22 06:48:57'),
(17, 'order_QM0gM9VH1PfAVr', 'Payment', 8, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 1, 'Created', NULL, NULL, '2025-04-22 06:48:58', '2025-04-22 06:48:58'),
(18, 'order_QM0h4hxC3BJbyi', 'Payment', 9, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 123, 'Created', NULL, NULL, '2025-04-22 06:49:39', '2025-04-22 06:49:39'),
(19, 'order_QM0h7EcjOXgw1t', 'Payment', 10, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 123, 'Created', NULL, NULL, '2025-04-22 06:49:41', '2025-04-22 06:49:41'),
(20, 'order_QM2UQ5ERHXAHam', 'Payment', 11, 48, 2, 'Creating order for event Hoil', 20, 'Created', NULL, NULL, '2025-04-22 08:35:03', '2025-04-22 08:35:03'),
(21, 'order_QM2gjXfKEk4A4L', 'Payment', 12, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 12, 'Created', NULL, NULL, '2025-04-22 08:46:43', '2025-04-22 08:46:43'),
(22, 'order_QM2gm38Wn0yP02', 'Payment', 13, 54, 4, 'Creating order for event Test length Test le Test length ngth Test length Test length Test length', 12, 'Created', NULL, NULL, '2025-04-22 08:46:45', '2025-04-22 08:46:45'),
(23, 'order_QM2iGxpjrym2tB', 'Payment', 14, 54, 3, 'Creating order for event Summer Fiesta 2025', 10000, 'Verified', 'pay_QM2iXFTKzqTbrB', 'dd0481838f434a9b899181fc8b0e4aa3f0c412a3e98385bb3af36dc8a0163558', '2025-04-22 08:48:10', '2025-04-22 08:48:32'),
(24, 'order_QM2zPa0R1vZj5y', 'Payment', 15, 54, 3, 'Creating order for event Summer Fiesta 2025', 1100, 'Verified', 'pay_QM2zamEtRFje0I', '2421371afe77869ec3121b07a49e767ff789d52832a46f9d8bb2794b4b4638ae', '2025-04-22 09:04:24', '2025-04-22 09:04:40'),
(25, 'order_QM2zRanH46cjvd', 'Payment', 16, 54, 3, 'Creating order for event Summer Fiesta 2025', 1100, 'Created', NULL, NULL, '2025-04-22 09:04:25', '2025-04-22 09:04:25'),
(26, 'order_QM30KvuOwOesdi', 'Payment', 17, 54, 3, 'Creating order for event Summer Fiesta 2025', 111, 'Verified', 'pay_QM30YLDOwn66jt', '58ce1105f98d113fbaec01d17707739d29a6a1b9af2cebf8c3c3fa477251fac2', '2025-04-22 09:05:16', '2025-04-22 09:05:34'),
(27, 'order_QM30tiR19OI7HL', 'Payment', 18, 54, 3, 'Creating order for event Summer Fiesta 2025', 201, 'Verified', 'pay_QM314eT3WejnhV', 'd9ef3259171cb8dcbd6021e08458df0c10f6d1350873509ee32bb84a67df9f76', '2025-04-22 09:05:48', '2025-04-22 09:06:04'),
(28, 'order_QM3ZmfIDk4OjF1', 'Payment', 19, 54, 5, 'Creating order for event imfghjkl', 123, 'Verified', 'pay_QM3ZxyxLTZWMCO', '0f08c81cfcb397ad125318813ad1344d8562697ec4e69835f84680a2d2e9c921', '2025-04-22 09:38:49', '2025-04-22 09:39:05'),
(29, 'order_QM3ZnYDVkSogei', 'Payment', 20, 54, 5, 'Creating order for event imfghjkl', 123, 'Created', NULL, NULL, '2025-04-22 09:38:50', '2025-04-22 09:38:50'),
(30, 'order_QM3aZh2jPQc9UX', 'Payment', 21, 54, 5, 'Creating order for event imfghjkl', 5663, 'Verified', 'pay_QM3ajve2pwXpqA', '42f4207133da37e4d9cdc67743036f91b5c6f3c96a64202efaa2abd329d2bb0c', '2025-04-22 09:39:34', '2025-04-22 09:39:50'),
(31, 'order_QM3aa0TIksXO3U', 'Payment', 22, 54, 5, 'Creating order for event imfghjkl', 5663, 'Created', NULL, NULL, '2025-04-22 09:39:35', '2025-04-22 09:39:35'),
(32, 'order_QM5gRF16cUoZSV', 'Payment', 23, 74, 2, 'Creating order for event Hoil', 9, 'Created', NULL, NULL, '2025-04-22 11:42:31', '2025-04-22 11:42:31'),
(33, 'order_QM5gUNG2LY1kkB', 'Payment', 24, 74, 2, 'Creating order for event Hoil', 9, 'Created', NULL, NULL, '2025-04-22 11:42:34', '2025-04-22 11:42:34'),
(34, 'order_QM5ofPzbMG7WUu', 'Payment', 25, 74, 2, 'Creating order for event Hoil', 126, 'Created', NULL, NULL, '2025-04-22 11:50:18', '2025-04-22 11:50:18'),
(35, 'order_QM6tTuuEsGKKxj', 'Payment', 26, 48, 2, 'Creating order for event Hoil', 25, 'Verified', 'pay_QM6thRA9oO5BtM', '9cb9ddc61dd15e9501b00ea9d67407fbe1e8b90b9d8afef2e654756ef93cd43b', '2025-04-22 12:53:33', '2025-04-22 12:54:03'),
(36, 'order_QM6uVjm0FW0iVy', 'Payment', 27, 48, 2, 'Creating order for event Hoil', 25, 'Verified', 'pay_QM6uuyp0gVKBod', '6b84484b7e3ac96ffc836de5a2a95173cea00b5fed641c26ae746904c42f0f22', '2025-04-22 12:54:32', '2025-04-22 12:55:02'),
(37, 'order_QM6xHwhAsPrchd', 'Payment', 28, 48, 2, 'Creating order for event Hoil', 26, 'Created', NULL, NULL, '2025-04-22 12:57:09', '2025-04-22 12:57:09'),
(38, 'order_QM6xaqKDyUgS9g', 'Payment', 29, 48, 2, 'Creating order for event Hoil', 26, 'Created', NULL, NULL, '2025-04-22 12:57:27', '2025-04-22 12:57:27'),
(39, 'order_QM6xuxIXvqxoFW', 'Payment', 30, 48, 2, 'Creating order for event Hoil', 26, 'Verified', 'pay_QM6y2mxjzAahmn', '56c0f8cce939dbb1285e436ab06f4449ac8a5ea0665ec91ffd1036ee8ff30165', '2025-04-22 12:57:45', '2025-04-22 12:58:01'),
(40, 'order_QM7QHogQeZxvIK', 'Payment', 31, 48, 2, 'Creating order for event Hoil', 258, 'Verified', 'pay_QM7QSN9m6Rg1GJ', '219e10873429b482423c9fd997b0fa2eb514feed091738a5dc5678a47651e25f', '2025-04-22 13:24:37', '2025-04-22 13:24:52'),
(41, 'order_QM7RC9Ca0kWra7', 'Payment', 32, 48, 2, 'Creating order for event Hoil', 258, 'Created', NULL, NULL, '2025-04-22 13:25:28', '2025-04-22 13:25:28'),
(42, 'order_QM7SO2wySLofEW', 'Payment', 33, 48, 2, 'Creating order for event Hoil', 259, 'Created', NULL, NULL, '2025-04-22 13:26:36', '2025-04-22 13:26:36'),
(43, 'order_QM7T189d1hpfAt', 'Payment', 34, 48, 2, 'Creating order for event Hoil', 358, 'Created', NULL, NULL, '2025-04-22 13:27:12', '2025-04-22 13:27:12'),
(44, 'order_QM7TGdxCkOqegP', 'Payment', 35, 48, 2, 'Creating order for event Hoil', 69, 'Created', NULL, NULL, '2025-04-22 13:27:26', '2025-04-22 13:27:26'),
(45, 'order_QM7TVTo1vYuJsp', 'Payment', 36, 48, 2, 'Creating order for event Hoil', 69, 'Verified', 'pay_QM7Tj5Mw0EAGsG', '53b68dcff998d7ebcd14d62b2d71556dc8099fef08d5ac69ce4dc9342ebca4dc', '2025-04-22 13:27:39', '2025-04-22 13:27:57'),
(46, 'order_QM7Tvv1P1ZcHsg', 'Payment', 37, 48, 2, 'Creating order for event Hoil', 5, 'Verified', 'pay_QM7U2Ff9duMCYs', '94df7817e40bd4f7ad89b1c3309e4888e6927f258c6f54097dafdb593af1912b', '2025-04-22 13:28:04', '2025-04-22 13:28:15'),
(47, 'order_QMNrCztCIPfeDm', 'Payment', 38, 48, 2, 'Creating order for event Hoil', 250, 'Verified', 'pay_QMNrRgTn38E0bj', 'a0fb5180a80271b72105896dc1bc460fcdb918dd3d807e6d946a794ffb7146a5', '2025-04-23 05:29:12', '2025-04-23 05:29:31'),
(48, 'order_QN9hpuK9bZcpNn', 'Payment', 39, 48, 2, 'Creating order for event Hoil', 25, 'Verified', 'pay_QN9hznm4cvgSkC', '451862450ca6debe204464b2bcc6b536119a54a1cf56425ab61a87dd3e58a49d', '2025-04-25 04:17:37', '2025-04-25 04:17:53'),
(49, 'order_QPEzEnfS9pKjmg', 'Payment', 40, 77, 3, 'Creating order for event Summer Fiesta 2025', 1, 'Created', NULL, NULL, '2025-04-30 10:45:33', '2025-04-30 10:45:33'),
(50, 'order_QPEzIDhv0MeQQK', 'Payment', 41, 77, 3, 'Creating order for event Summer Fiesta 2025', 1, 'Created', NULL, NULL, '2025-04-30 10:45:36', '2025-04-30 10:45:36'),
(51, 'order_QPEzKFoyX31r3U', 'Payment', 42, 77, 3, 'Creating order for event Summer Fiesta 2025', 1, 'Created', NULL, NULL, '2025-04-30 10:45:38', '2025-04-30 10:45:38'),
(52, 'order_QPEzSJ1mFNiA2Q', 'Payment', 43, 77, 3, 'Creating order for event Summer Fiesta 2025', 1, 'Created', NULL, NULL, '2025-04-30 10:45:46', '2025-04-30 10:45:46'),
(53, 'order_QPEzTivCORu8Oc', 'Payment', 44, 77, 3, 'Creating order for event Summer Fiesta 2025', 1, 'Created', NULL, NULL, '2025-04-30 10:45:47', '2025-04-30 10:45:47'),
(54, 'order_QSQc9nv9X0Sc4o', 'EssentialPayment', 1, 48, 1, 'Creating order for essential payment from  to ', 2000, 'Created', NULL, NULL, '2025-05-08 12:05:02', '2025-05-08 12:05:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
