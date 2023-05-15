-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2021 at 03:23 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kenbankly`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', 'admin', NULL, '610f07de2e50e1628375006.png', '$2y$10$By2PixBvqD/qAjPMaXmfqOTfK26VqmWwGjo6vhMmVpPCQGMk30406', NULL, '2021-08-08 02:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(34, 10, 'New member registered', 0, '/admin/user/detail/10', '2021-10-20 19:25:06', '2021-10-20 19:25:06'),
(35, 11, 'New member registered', 0, '/admin/user/detail/11', '2021-10-23 19:23:39', '2021-10-23 19:23:39'),
(36, 12, 'New member registered', 0, '/admin/user/detail/12', '2021-10-23 19:29:10', '2021-10-23 19:29:10'),
(37, 13, 'New member registered', 0, '/admin/user/detail/13', '2021-10-23 19:30:20', '2021-10-23 19:30:20'),
(38, 14, 'New member registered', 0, '/admin/user/detail/14', '2021-10-23 19:38:25', '2021-10-23 19:38:25'),
(39, 15, 'New member registered', 0, '/admin/user/detail/15', '2021-10-23 19:56:33', '2021-10-23 19:56:33'),
(40, 16, 'New member registered', 0, '/admin/user/detail/16', '2021-11-01 09:31:08', '2021-11-01 09:31:08'),
(41, 17, 'New member registered', 0, '/admin/user/detail/17', '2021-11-17 06:35:34', '2021-11-17 06:35:34'),
(42, 15, 'New Investment In Bronxe from test1234', 0, '/admin/users/investment/15', '2021-11-17 13:19:31', '2021-11-17 13:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '210530', 0, '2021-08-06 10:48:10', NULL),
(2, 'admin@admin.com', '913955', 0, '2021-08-06 10:49:24', NULL),
(3, 'admin@admin.com', '715139', 0, '2021-08-06 10:50:16', NULL),
(4, 'admin@admin.com', '251582', 0, '2021-08-07 11:01:10', NULL),
(5, 'admin@admin.com', '182114', 0, '2021-08-10 01:49:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+',
  `network` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountnumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` int(22) DEFAULT NULL,
  `newbalance` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `user_id`, `amount`, `type`, `network`, `phone`, `plan`, `trx`, `status`, `charge`, `accountname`, `accountnumber`, `gateway`, `newbalance`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '100', '1', 'airtel', '08011111111', NULL, '9U5XD1', '1', NULL, NULL, NULL, NULL, '20376', NULL, '2021-10-19 15:05:32', '2021-10-19 15:05:32'),
(2, 1, '100', '1', 'airtel', '08011111111', NULL, 'X9CM6J', '1', NULL, NULL, NULL, NULL, '20276', NULL, '2021-10-19 15:06:11', '2021-10-19 15:06:11'),
(3, 1, '100', '1', 'mtn', '08011111111', NULL, 'RTSRRH', '1', NULL, NULL, NULL, NULL, '20176', NULL, '2021-10-19 15:08:19', '2021-10-19 15:08:19'),
(4, 1, '1000', '1', 'etisalat', '08011111111', NULL, 'DJFQ44', '1', NULL, NULL, NULL, NULL, '19176', NULL, '2021-10-19 15:13:43', '2021-10-19 15:13:43'),
(5, 1, '500.00', '2', 'etisalat', '08011111111', NULL, '6YBGAG', '1', NULL, '9mobile Data - 500 Naira - 500MB - 30 Days', NULL, NULL, '18176', NULL, '2021-10-19 15:49:36', '2021-10-19 15:49:36'),
(6, 1, '4000.00', '2', 'glo', '08011111111', NULL, '1TVH8O', '1', NULL, 'Glo Data N4000 -  13.25GB - 30 days', NULL, NULL, '14176', NULL, '2021-10-19 15:51:31', '2021-10-19 15:51:31'),
(7, 1, '1640.00', '3', 'GOTV', '1212121212', 'GOtv Jinja N1,640', 'HYHZBW', '1', NULL, 'Mr  DsTEST', NULL, NULL, '12436', NULL, '2021-10-19 16:36:28', '2021-10-19 16:36:28'),
(8, 1, '500', '4', 'Ikeja Electric ', '1111111111111', NULL, 'USBST1', '1', NULL, 'Customer Name: TESTMETER1<br> Address: ABULE - EGBA BU ABULE<br>Meter Number: 1111111111111', 'Token: Token : 26362054405982757802<br> Units: 79.9 kWh', NULL, '11236', NULL, '2021-10-19 17:14:38', '2021-10-19 17:14:38'),
(9, 1, '500', '4', 'Ikeja Electric ', '1111111111111', NULL, 'OPN1ND', '1', NULL, 'Customer Name: TESTMETER1<br> Address: ABULE - EGBA BU ABULE<br>Meter Number: 1111111111111', 'Token: Token : 26362054405982757802<br> Units: 79.9 kWh', NULL, '10636', NULL, '2021-10-19 17:15:06', '2021-10-19 17:15:06'),
(10, 1, '5000', '4', 'Ikeja Electric ', '1111111111111', NULL, 'G17JVX', '1', NULL, 'Customer Name: TESTMETER1<br> Address: ABULE - EGBA BU ABULE<br>Meter Number: 1111111111111', 'Token: Token : 26362054405982757802<br> Units: 79.9 kWh', NULL, '5536', NULL, '2021-10-19 17:17:09', '2021-10-19 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `cabletvbundles`
--

CREATE TABLE `cabletvbundles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(44) DEFAULT NULL,
  `network` varchar(77) DEFAULT NULL,
  `networkcode` varchar(77) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `plan` varchar(22) DEFAULT NULL,
  `cost` varchar(22) DEFAULT NULL,
  `status` varchar(22) DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  `updated_at` varchar(33) DEFAULT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabletvbundles`
--

INSERT INTO `cabletvbundles` (`id`, `name`, `network`, `networkcode`, `code`, `plan`, `cost`, `status`, `deleted_at`, `created_at`, `updated_at`, `image`) VALUES
(1, 'DStv Padi N1,850', 'DSTV', 'dstv', 'dstv', 'dstv-padi', '1850.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(2, 'DStv Yanga N2,565', 'DSTV', 'dstv', 'dstv', 'dstv-yanga', '2565.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(3, 'Dstv Confam N4,615', 'DSTV', 'dstv', 'dstv', 'dstv-confam', '4615.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(4, 'DStv  Compact N7900', 'DSTV', 'dstv', 'dstv', 'dstv79', '7900.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(5, 'DStv Premium N18,400', 'DSTV', 'dstv', 'dstv', 'dstv3', '18400.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(6, 'DStv Asia N6,200', 'DSTV', 'dstv', 'dstv', 'dstv6', '6200.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(7, 'DStv Compact Plus N12,400', 'DSTV', 'dstv', 'dstv', 'dstv7', '12400.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(8, 'DStv Premium-French N25,550', 'DSTV', 'dstv', 'dstv', 'dstv9', '25550.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(9, 'DStv Premium-Asia N20,500', 'DSTV', 'dstv', 'dstv', 'dstv10', '20500.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(10, 'DStv Confam + ExtraView N7,115', 'DSTV', 'dstv', 'dstv', 'confam-extra', '7115.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(11, 'DStv Yanga + ExtraView N5,065', 'DSTV', 'dstv', 'dstv', 'yanga-extra', '5065.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(12, 'DStv Padi + ExtraView N4,350', 'DSTV', 'dstv', 'dstv', 'padi-extra', '4350.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(13, 'DStv Compact + Asia N14,100', 'DSTV', 'dstv', 'dstv', 'com-asia', '14100.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(14, 'DStv Compact + Extra View N10,400', 'DSTV', 'dstv', 'dstv', 'dstv30', '10400.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(15, 'DStv Compact + French Touch N10,200', 'DSTV', 'dstv', 'dstv', 'com-frenchtouch', '10200.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(16, 'DStv Premium - Extra View N20,900', 'DSTV', 'dstv', 'dstv', 'dstv33', '20900.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(17, 'DStv Compact Plus - Asia N18,600', 'DSTV', 'dstv', 'dstv', 'dstv40', '18600.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(18, 'DStv Compact + French Touch + ExtraView N12,', 'DSTV', 'dstv', 'dstv', 'com-frenchtouch-extra', '12700.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(19, 'DStv Compact + Asia + ExtraView N16,600', 'DSTV', 'dstv', 'dstv', 'com-asia-extra', '16600.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(20, 'DStv Compact Plus + French Plus N20,500', 'DSTV', 'dstv', 'dstv', 'dstv43', '20500.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(21, 'DStv Compact Plus + French Touch N14,700', 'DSTV', 'dstv', 'dstv', 'complus-frenchtouch', '14700.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(22, 'DStv Compact Plus - Extra View N14,900', 'DSTV', 'dstv', 'dstv', 'dstv45', '14900.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(23, 'DStv Compact Plus + FrenchPlus + Extra View ', 'DSTV', 'dstv', 'dstv', 'complus-french-extravi', '23000.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(24, 'DStv Compact + French Plus N16,000', 'DSTV', 'dstv', 'dstv', 'dstv47', '16000.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(25, 'DStv Compact Plus + Asia + ExtraView N21,100', 'DSTV', 'dstv', 'dstv', 'dstv48', '21100.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(26, 'DStv Premium + Asia + Extra View N23,000', 'DSTV', 'dstv', 'dstv', 'dstv61', '23000.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(27, 'DStv Premium + French + Extra View N28,000', 'DSTV', 'dstv', 'dstv', 'dstv62', '28050.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(28, 'DStv HDPVR Access Service N2,500', 'DSTV', 'dstv', 'dstv', 'hdpvr-access-service', '2500.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(29, 'DStv French Plus Add-on N8,100', 'DSTV', 'dstv', 'dstv', 'frenchplus-addon', '8100.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(30, 'DStv Asian Add-on N6,200', 'DSTV', 'dstv', 'dstv', 'asia-addon', '6200.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(31, 'DStv French Touch Add-on N2,300', 'DSTV', 'dstv', 'dstv', 'frenchtouch-addon', '2300.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(32, 'ExtraView Access N2,500', 'DSTV', 'dstv', 'dstv', 'extraview-access', '2500.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(33, 'DStv French 11 N3,260', 'DSTV', 'dstv', 'dstv', 'french11', '3260.00', '1', NULL, '2021-04-11 04:49:53', '2021-04-11 04:49:53', NULL),
(34, 'DStv Compact Plus + FrenchPlus + Extra View ', 'DSTV', 'dstv', 'dstv', 'complus-french-extravi', '23000.00', '1', NULL, '2021-04-11 04:52:54', '2021-04-11 04:52:54', NULL),
(35, 'GOtv Lite N410', 'GOTV', 'gotv', 'gotv', 'gotv-lite', '410.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(36, 'GOtv Max N3,600', 'GOTV', 'gotv', 'gotv', 'gotv-max', '3600.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(37, 'GOtv Jolli N2,460', 'GOTV', 'gotv', 'gotv', 'gotv-jolli', '2460.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(38, 'GOtv Jinja N1,640', 'GOTV', 'gotv', 'gotv', 'gotv-jinja', '1640.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(39, 'GOtv Lite (3 Months) N1,080', 'GOTV', 'gotv', 'gotv', 'gotv-lite-3months', '1080.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(40, 'GOtv Lite (1 Year) N3,180', 'GOTV', 'gotv', 'gotv', 'gotv-lite-1year', '3180.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(41, 'Nova - 900 Naira - 1 Month', 'Startimes', 'startimes', 'startimes', 'nova', '900.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(42, 'Basic - 1,700 Naira - 1 Month', 'Startimes', 'startimes', 'startimes', 'basic', '1700.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(43, 'Smart - 2,200 Naira - 1 Month', 'Startimes', 'startimes', 'startimes', 'smart', '2200.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(44, 'Classic - 2,500 Naira - 1 Month', 'Startimes', 'startimes', 'startimes', 'classic', '2500.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(45, 'Super - 4,200 Naira - 1 Month', 'Startimes', 'startimes', 'startimes', 'super', '4200.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(46, 'Nova - 300 Naira - 1 Week', 'Startimes', 'startimes', 'startimes', 'nova-weekly', '300.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(47, 'Basic - 600 Naira - 1 Week', 'Startimes', 'startimes', 'startimes', 'basic-weekly', '600.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(48, 'Smart - 700 Naira - 1 Week', 'Startimes', 'startimes', 'startimes', 'smart-weekly', '700.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(49, 'Classic - 1200 Naira - 1 Week ', 'Startimes', 'startimes', 'startimes', 'classic-weekly', '1200.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(50, 'Super - 1,500 Naira - 1 Week', 'Startimes', 'startimes', 'startimes', 'super-weekly', '1500.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(51, 'Nova - 90 Naira - 1 Day', 'Startimes', 'startimes', 'startimes', 'nova-daily', '90.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(52, 'Basic - 160 Naira - 1 Day', 'Startimes', 'startimes', 'startimes', 'basic-daily', '160.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(53, 'Smart - 200 Naira - 1 Day', 'Startimes', 'startimes', 'startimes', 'smart-daily', '200.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(54, 'Classic - 320 Naira - 1 Day ', 'Startimes', 'startimes', 'startimes', 'classic-daily', '320.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(55, 'Super - 400 Naira - 1 Day', 'Startimes', 'startimes', 'startimes', 'super-daily', '400.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL),
(56, 'ewallet Amount', 'Startimes', 'startimes', 'startimes', 'ewallet', '0.00', '1', NULL, '2021-04-11 04:52:55', '2021-04-11 04:52:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_topics`
--

CREATE TABLE `contact_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_topics`
--

INSERT INTO `contact_topics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Support', '2021-02-03 13:51:57', '2021-02-03 13:51:57'),
(2, 'Complaints', '2021-02-03 13:52:08', '2021-02-03 13:52:08'),
(3, 'Request', '2021-03-16 19:28:30', '2021-03-16 19:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `cryptotrxes`
--

CREATE TABLE `cryptotrxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trxid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` varchar(17) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explorer_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(55) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cryptotrxes`
--

INSERT INTO `cryptotrxes` (`id`, `coin_id`, `hash`, `trxid`, `address`, `to_address`, `type`, `user_id`, `amount`, `usd`, `explorer_url`, `wallet_id`, `status`, `created_at`, `updated_at`) VALUES
(5, 6, '10', 'F8AJXZ', 'RLqVTNiUxJomP6P2uFu6B4gC4X4cAtxufm', '34HPqRkPWw6t2Wbn9Q62myb7zhfiM1tGxS', 'swap', 1, '1.8', '2', 'Test Coin', 'Bitcoin', 1, '2021-08-08 03:27:46', '2021-08-08 03:27:46'),
(6, 6, '10', 'HOE7DJ', 'RLqVTNiUxJomP6P2uFu6B4gC4X4cAtxufm', '34HPqRkPWw6t2Wbn9Q62myb7zhfiM1tGxS', 'swap', 1, '0.9', '1', 'Test Coin', 'Bitcoin', 1, '2021-08-08 03:32:34', '2021-08-08 03:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `cryptowallets`
--

CREATE TABLE `cryptowallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coin_id` int(11) NOT NULL,
  `label` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `balance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` int(55) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cryptowallets`
--

INSERT INTO `cryptowallets` (`id`, `coin_id`, `label`, `address`, `qrcode`, `user_id`, `balance`, `usd`, `status`, `created_at`, `updated_at`) VALUES
(30, 6, 'Test', 'RLqVTNiUxJomP6P2uFu6B4gC4X4cAtxufm', 'https://coinremitterlive.s3.ap-southeast-1.amazonaws.com/qr/tcn/RLqVTNiUxJomP6P2uFu6B4gC', 1, '90', '90', 1, '2021-07-29 02:06:48', '2021-08-09 15:59:22'),
(31, 2, 'Test', '34HPqRkPWw6t2Wbn9Q62myb7zhfiM1tGxS', 'https://coinremitterlive.s3.ap-southeast-1.amazonaws.com/qr/btc/34HPqRkPWw6t2Wbn9Q62myb7', 1, '2.84E-5', '1.2977948', 1, '2021-08-08 03:25:04', '2021-08-09 16:07:23'),
(32, 6, 'west', 'RBYFP23CWJTVZ6wnggUSH92CMJaw8UPtnK', 'https://coinremitterlive.s3.ap-southeast-1.amazonaws.com/qr/tcn/RBYFP23CWJTVZ6wnggUSH92C', 3, '0', '0', 1, '2021-08-09 16:20:45', '2021-08-09 16:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apipass` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apikey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `sell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `buy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `swap` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_coin` tinyint(4) NOT NULL DEFAULT 0,
  `canbuy` int(1) NOT NULL DEFAULT 1,
  `cansell` int(1) NOT NULL DEFAULT 1,
  `canswap` int(2) NOT NULL DEFAULT 1,
  `canoffer` int(1) NOT NULL DEFAULT 1,
  `canwallet` int(1) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `icon`, `apipass`, `apikey`, `price`, `fee`, `sell`, `buy`, `swap`, `min`, `max`, `image`, `is_coin`, `canbuy`, `cansell`, `canswap`, `canoffer`, `canwallet`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ethereum', 'ETH', 'sign-eth-alt', NULL, NULL, '1888.77', '1', '400', '435', '10', 1, 1000000000, 'eth.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:14:00', '2018-02-15 05:36:57', '2021-08-09 14:45:03'),
(2, 'Bitcoin', 'BTC', 'sign-eth-alt', 'kay22687', '$2y$10$I97uqr.aDdMZCCP2BVZGduC6m7ED4nqXnX5nbV7OiEgIauzBctYy6', '31689', '1', '400', '435', '8', 10, 2147483647, 'btc.svg', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:14:00', '2018-02-15 05:36:57', '2021-08-11 19:37:20'),
(3, 'Bitcoin Cash', 'BCH', 'sign-bch-alt', NULL, NULL, '436.22', '1', '390', '400', '7', 100, 1000, 'bch.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:13:29', '2018-02-15 05:36:57', '2021-07-19 07:11:20'),
(4, 'Litecoin', 'LTC', 'sign-ltc-alt', NULL, NULL, '118.15', '1', '370', '400', '8', 100000, 100000, 'ltc.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:13:25', '2018-02-15 05:36:57', '2021-07-19 07:11:20'),
(5, 'Dashcoin', 'DASH', NULL, NULL, NULL, '114.24', '1', '350', '350', '5', 100000, 100000, 'dash.png', 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-22 02:39:38', '2021-07-19 07:11:20'),
(6, 'Test Coin', 'TCN', 'sign-php-alt', 'kay22687', '$2y$10$Zth1BhELUq89vHHl7686fOj2IbwQH3zHtxRoaztqsFUY2W3rwNx82', '1', '1', '1', '1', '10', 1, 10, 'busd.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:13:17', '2018-10-22 11:49:14', '2021-03-30 22:44:31'),
(7, 'Binance Coin', 'BNB', 'sign-php-alt', '', '', '1', '1', '1', '1', '10', 1, 10, 'bnb.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:13:17', '2018-10-22 11:49:14', '2021-03-30 22:44:31'),
(11, 'USD Teter', 'USDTERC20', 'sign-php-alt', NULL, NULL, '1', '1', '465', '465', '8', 100, 1000, 'usdt.png', 1, 1, 1, 1, 1, 1, 1, '2021-01-15 05:13:17', '2018-10-22 11:49:14', '2021-07-19 05:39:08'),
(118, 'Dogecoin', 'DOGE', NULL, NULL, NULL, '0.181255', '1', '350', '350', NULL, 100, 1000, 'doge.svg', 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-22 02:39:38', '2021-07-19 07:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 107, '2000.00000000', 'NGN', '0.00000000', '450.00000000', '900000.00000000', NULL, '0', '', 'QCPWYKM7TRP1', 0, 0, 0, NULL, '2021-07-24 22:14:48', '2021-07-24 22:14:48'),
(2, 1, 111, '100.00000000', 'USD', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'V7BPYZVWRGZV', 0, 1, 0, NULL, '2021-07-24 22:41:27', '2021-07-24 22:43:56'),
(3, 1, 114, '100.00000000', 'USD', '0.00000000', '1.00000000', '100.00000000', NULL, '0', 'cs_test_a1YR9R1Mzb5sU0XF7ipJ1vGKudruHFx6m1vERh2bH2nVkannUzdXt4CK9a', '9UYP41DCZ1WQ', 0, 0, 0, NULL, '2021-07-24 22:44:43', '2021-07-24 22:44:48'),
(4, 1, 103, '1001.00000000', 'USD', '0.00000000', '1.00000000', '1001.00000000', NULL, '0', '', 'E6PENAFHQVSF', 0, 0, 0, NULL, '2021-07-24 22:45:50', '2021-07-24 22:45:50'),
(5, 1, 103, '1002.00000000', 'USD', '0.00000000', '1.00000000', '1002.00000000', NULL, '0', '', '7DTTYJRX17TJ', 0, 1, 0, NULL, '2021-07-24 22:47:12', '2021-07-24 22:52:13'),
(6, 1, 1000, '1000.00000000', 'USD', '11.00000000', '1.00000000', '1011.00000000', '{\"account_name\":{\"field_name\":\"Adekunle Gold\",\"type\":\"text\"}}', '0', '', 'RPDF7G', 0, 1, 0, NULL, '2021-08-07 03:00:02', '2021-08-07 03:07:21'),
(7, 1, 107, '2000.00000000', 'NGN', '0.00000000', '450.00000000', '900000.00000000', NULL, '0', '', '36CQE1', 0, 0, 0, NULL, '2021-09-10 14:31:30', '2021-09-10 14:31:30'),
(8, 1, 107, '10.00000000', 'NGN', '0.00000000', '450.00000000', '4500.00000000', '{\"id\":1316807799,\"domain\":\"test\",\"status\":\"success\",\"reference\":\"QBJAR2\",\"amount\":450000,\"message\":null,\"gateway_response\":\"Successful\",\"paid_at\":\"2021-09-10T12:33:05.000Z\",\"created_at\":\"2021-09-10T12:33:00.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"197.210.29.167\",\"metadata\":{\"referrer\":\"https:\\/\\/localhost\\/litebank\\/user\\/deposit\\/confirm\"},\"log\":{\"start_time\":1631277181,\"time_spent\":5,\"attempts\":1,\"errors\":0,\"success\":true,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":3},{\"type\":\"success\",\"message\":\"Successfully paid with card\",\"time\":5}]},\"fees\":16750,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_75qrz1vnmx\",\"bin\":\"408408\",\"last4\":\"4081\",\"exp_month\":\"12\",\"exp_year\":\"2030\",\"channel\":\"card\",\"card_type\":\"visa \",\"bank\":\"TEST BANK\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_EzYyAIKbnpicuEYcMyEg\",\"account_name\":null,\"receiver_bank_account_number\":null,\"receiver_bank\":null},\"customer\":{\"id\":50578606,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"test@test.com\",\"customer_code\":\"CUS_lzf6i6jvl3ty520\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\",\"international_format_phone\":null},\"plan\":null,\"split\":[],\"order_id\":null,\"paidAt\":\"2021-09-10T12:33:05.000Z\",\"createdAt\":\"2021-09-10T12:33:00.000Z\",\"requested_amount\":450000,\"pos_transaction_data\":null,\"source\":null,\"transaction_date\":\"2021-09-10T12:33:00.000Z\",\"plan_object\":[],\"subaccount\":[]}', '0', '', 'QBJAR2', 0, 1, 0, NULL, '2021-09-10 14:32:44', '2021-09-10 14:33:07'),
(9, 1, 1001, '100.00000000', 'USD', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'PPJNQH', 0, 0, 0, NULL, '2021-09-16 16:35:58', '2021-09-16 16:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(207, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(208, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(209, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(210, 'WITHDRAW_REQUEST', 'Withdraw  - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been submitted Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"4\" color=\"#FF0000\"><b><br></b></font></div><div><font size=\"4\" color=\"#FF0000\"><b>This may take {{delay}} to process the payment.</b></font><br></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', '{{amount}} {{currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} in {{delay}}. Trx: {{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"delay\":\"Delay time for processing\"}', 1, 1, '2020-06-07 18:00:00', '2021-05-08 06:49:06'),
(211, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You should get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', 'Admin Rejected Your {{amount}} {{currency}} withdraw request. Your Main Balance {{main_balance}}  {{method}} , Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(212, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', 'Admin Approve Your {{amount}} {{currency}} withdraw request by {{method}}. Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-10 18:00:00', '2020-06-06 18:00:00'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12'),
(217, 'INVESTMENT', 'User Investment', 'User Investment Successfully Done', 'User Investment Successfully Done<div><div>Amount: {{amount}}</div></div><div>Trx: {{trx}}</div>', 'User Investment Successfully Done\r\nAmount: {{amount}}\r\nTrx: {{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By User\",\"currency\":\"Site Currency\",\"post_balance\":\"Users Balance After this operation\",\"plan\":\"Plan Name\",\"details\":\"Transaction Details\",\"interest\":\"Amount of Per Interest\",\"total_return\":\"How Many Return\"}', 1, 1, '2019-09-14 19:14:22', '2021-06-21 14:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------------------\"}}', 'twak.png', 2, NULL, '2019-10-18 23:16:05', '2021-06-23 10:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"admin\",\"blog\",\"aaaa\",\"ddd\",\"aaa\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"ASAP Codes\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"6113bf323d1171628684082.png\"}', '2020-07-04 23:42:52', '2021-08-11 16:44:42'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Us\",\"sub_heading\":\"To give everyone the power to better manage &amp; grow their finances.\",\"image\":\"616fd0ac998851634717868.png\"}', '2020-10-28 00:51:20', '2021-10-20 08:17:49'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Hic tenetur nihil ex. Doloremque ipsa velit, ea molestias expedita sed voluptatem ex voluptatibus temporibus sequi. sddd\"}', '2020-10-28 00:51:34', '2020-10-28 00:52:52'),
(26, 'blog.element', '{\"has_image\":[\"1\",\"1\"],\"title\":\"this is a test blog 2\",\"description\":\"aewf asdf\",\"description_nic\":\"asdf asdf\",\"blog_icon\":\"<i class=\\\"lab la-hornbill\\\"><\\/i>\",\"blog_image_1\":\"5f99164f1baec1603868239.jpg\",\"blog_image_2\":\"5ff2e146346d21609752902.jpg\"}', '2020-10-28 00:57:19', '2021-01-04 03:35:02'),
(27, 'contact_us.content', '{\"heading\":\"Get in Touch\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt voluptates rerum corporis molestias dolores.\"}', '2020-10-28 00:59:19', '2021-06-22 05:03:53'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(30, 'blog.element', '{\"has_image\":[\"1\",\"1\"],\"title\":\"This is test blog 1\",\"description\":\"asdfasdf ffffffffff\",\"description_nic\":\"asdfasdf asdd vvvvvvvvvvvvvvvvvv\",\"blog_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"blog_image_1\":\"5f9d0689e022d1604126345.jpg\",\"blog_image_2\":\"5f9d068a341211604126346.jpg\"}', '2020-10-31 00:39:05', '2020-11-12 04:36:39'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"las la-expand\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', '2020-11-12 04:07:30', '2021-05-12 05:56:59'),
(33, 'feature.content', '{\"heading\":\"Why You Trust Our Service\"}', '2021-01-03 23:40:54', '2021-06-20 11:58:56'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"withdraw\",\"heading\":\"asdf fffff\",\"sub_heading\":\"asdf asdfasdf\"}', '2021-03-06 01:27:34', '2021-03-06 02:19:39'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Invest for Future in Stable Platform and Make Fast Money\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias quibusdam eveniet similique magni accusantium soluta totam incidunt quam quis architecto amet.\",\"image\":\"6113bee8e7de11628684008.png\"}', '2021-05-02 06:09:30', '2021-08-11 16:43:30'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font color=\\\"#ffffff\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":1}', '2020-07-04 23:42:52', '2021-06-06 09:43:37'),
(44, 'overView.element', '{\"title\":\"Total Users\",\"text\":\"68,00,000\",\"icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\"}', '2021-06-20 11:16:20', '2021-06-20 11:18:22'),
(45, 'overView.element', '{\"title\":\"Winners\",\"text\":\"98,00,000\",\"icon\":\"<i class=\\\"fas fa-trophy\\\"><\\/i>\"}', '2021-06-20 11:17:27', '2021-06-20 11:18:27'),
(46, 'overView.element', '{\"title\":\"Total Visitors\",\"text\":\"88,00,000\",\"icon\":\"<i class=\\\"far fa-eye\\\"><\\/i>\"}', '2021-06-20 11:18:06', '2021-06-20 11:18:06'),
(47, 'about.element', '{\"title\":\"Secure Investments\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"fa fa-shield\\\"><\\/i>\"}', '2021-06-20 11:29:38', '2021-07-30 17:07:51'),
(48, 'about.element', '{\"title\":\"Fast Online Transfer\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"fa fa-user\\\"><\\/i>\"}', '2021-06-20 11:31:23', '2021-07-30 17:08:10'),
(49, 'about.element', '{\"title\":\"Profit Guaranteed\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"fa fa-lock\\\"><\\/i>\"}', '2021-06-20 11:31:48', '2021-07-30 17:09:05'),
(50, 'package.content', '{\"heading\":\"Latest Investment Packages\"}', '2021-06-20 11:35:19', '2021-06-20 11:35:19'),
(51, 'howToWork.content', '{\"heading\":\"It\'s Easy to Join and Make Money\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam consequatur ipsam ab aperiam facilis ad deserunt debitis ullam. Labore dolore odio magnam corporis in iure.\"}', '2021-06-20 11:38:40', '2021-06-20 11:38:40'),
(52, 'howToWork.element', '{\"title\":\"Create an Account\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, modi omnis.\"}', '2021-06-20 11:40:25', '2021-06-20 11:40:25'),
(53, 'howToWork.element', '{\"title\":\"Choose Lottery\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, modi omnis.\"}', '2021-06-20 11:40:37', '2021-06-20 11:40:37'),
(54, 'howToWork.element', '{\"title\":\"Pick Lottery\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\"}', '2021-06-20 11:40:50', '2021-06-20 11:40:50'),
(55, 'howToWork.element', '{\"title\":\"Win Lottery\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\"}', '2021-06-20 11:40:59', '2021-06-20 11:40:59'),
(56, 'latestTrx.content', '{\"heading\":\"Recent Deposit And Withdraw\"}', '2021-06-20 11:56:04', '2021-06-21 10:59:56'),
(59, 'feature.element', '{\"title\":\"Best Lottery Platform\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"flaticon-law\\\"><\\/i>\"}', '2021-06-20 12:10:15', '2021-07-30 16:08:59'),
(60, 'feature.element', '{\"title\":\"Quick Deposit\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"flaticon-wallet\\\"><\\/i>\"}', '2021-06-20 12:10:29', '2021-07-30 16:10:30'),
(61, 'feature.element', '{\"title\":\"Quick Withdraw\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\",\"icon\":\"<i class=\\\"flaticon-coins\\\"><\\/i>\"}', '2021-06-20 12:10:39', '2021-07-30 16:11:02'),
(62, 'faq.content', '{\"heading\":\"Frequently Asked Questions\"}', '2021-06-20 12:13:37', '2021-06-20 12:13:37'),
(63, 'faq.element', '{\"question\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit.\",\"answer\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta.\"}', '2021-06-20 12:14:00', '2021-06-20 12:14:00'),
(64, 'faq.element', '{\"question\":\"Doloremque perspiciatis harum voluptatibus natus.\",\"answer\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta.\"}', '2021-06-20 12:14:21', '2021-06-20 12:14:21'),
(65, 'faq.element', '{\"question\":\"Nesciunt eius similique tenetur corporis fuga.\",\"answer\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta.\"}', '2021-06-20 12:14:39', '2021-06-20 12:14:39'),
(66, 'faq.element', '{\"question\":\"Eligendi in enim quisquam dolor voluptates nihil.\",\"answer\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta.\"}', '2021-06-20 12:14:54', '2021-06-20 12:14:54'),
(67, 'topInvestor.content', '{\"heading\":\"Top Investors\"}', '2021-06-20 12:39:13', '2021-06-20 12:39:13'),
(68, 'topInvestor.element', '{\"has_image\":\"1\",\"name\":\"Rahim\",\"country\":\"Bangladesh\",\"date\":\"27 Feb, 2020\",\"image\":\"60cf40a9a6aff1624195241.jpg\"}', '2021-06-20 12:50:41', '2021-06-20 12:50:41'),
(69, 'topInvestor.element', '{\"has_image\":\"1\",\"name\":\"Karim\",\"country\":\"American Samoa\",\"date\":\"17 Feb, 2020\",\"image\":\"60cf40cc362851624195276.jpg\"}', '2021-06-20 12:51:16', '2021-06-20 12:51:16'),
(70, 'topInvestor.element', '{\"has_image\":\"1\",\"name\":\"Rasel\",\"country\":\"England\",\"date\":\"17 Feb, 2021\",\"image\":\"60cf40ed21f901624195309.jpg\"}', '2021-06-20 12:51:49', '2021-06-20 12:51:49'),
(71, 'testimonial.content', '{\"heading\":\"What User Say About Us\",\"sub_heading\":\"Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nisi suscipit, sunt obcaecati porro consequuntur quo deleniti voluptatum at qui eum quibusdam sapiente laborum\"}', '2021-06-20 12:55:37', '2021-06-20 12:55:37'),
(73, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Morjina\",\"number_of_star\":\"4\",\"say\":\"Lorem ipsum dolor sit amet, consectetur adicing elit. Eius aut odit non. Sunt, laborum Nemo erunt sit libero eius corporis voluptates sapie smoss.\",\"designation\":\"Software Develeper\",\"image\":\"6113d4508a33f1628689488.png\"}', '2021-06-20 13:45:27', '2021-08-11 18:14:48'),
(74, 'payment.content', '{\"heading\":\"Payment We Accept\",\"sub_heading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse voluptatum eaque earum quos quia? Id aspernatur ratione, voluptas nulla rerum laudantium neque ipsam eaque\",\"btn_text\":\"Create An Account\",\"btn_link\":\"register\"}', '2021-06-20 13:56:36', '2021-06-20 14:08:49'),
(75, 'payment.element', '{\"title\":\"Investors\",\"text\":\"24k\"}', '2021-06-20 14:01:15', '2021-06-20 14:01:15'),
(76, 'payment.element', '{\"title\":\"Investors\",\"text\":\"56K\"}', '2021-06-20 14:01:30', '2021-06-20 14:01:30'),
(77, 'payment.element', '{\"title\":\"Investors\",\"text\":\"22K\"}', '2021-06-20 14:01:40', '2021-06-20 14:01:40'),
(78, 'payment.element', '{\"title\":\"Investors\",\"text\":\"24k\"}', '2021-06-20 14:01:52', '2021-06-20 14:01:52'),
(79, 'footer.content', '{\"text\":\"Copyright \\u00a9 2021 All Right Reserved\"}', '2021-06-20 14:30:47', '2021-06-20 14:30:47'),
(80, 'footer.element', '{\"soial_media_link\":\"https:\\/\\/www.facebook.com\",\"icon\":\"<i class=\\\"fa fa-facebook\\\"><\\/i>\"}', '2021-06-20 14:31:28', '2021-07-30 17:04:04'),
(81, 'footer.element', '{\"soial_media_link\":\"https:\\/\\/www.youtube.com\",\"icon\":\"<i class=\\\"fa fa-youtube\\\"><\\/i>\"}', '2021-06-20 14:31:46', '2021-07-30 17:04:19'),
(83, 'breadcumb.content', '{\"has_image\":\"1\",\"image\":\"611d2555981e41629300053.png\"}', '2021-06-21 04:41:58', '2021-08-18 17:20:54'),
(84, 'contact_us.element', '{\"address_type\":\"Office Address\",\"address\":\"Plot 15 Shomolu Bariga, Houston Texas\",\"icon\":\"<i class=\\\"fas fa-map-marker-alt\\\"><\\/i>\"}', '2021-06-22 05:04:09', '2021-08-11 18:42:27'),
(85, 'contact_us.element', '{\"address_type\":\"Phone\",\"address\":\"+123456789541\",\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\"}', '2021-06-22 05:04:49', '2021-06-22 05:04:49'),
(86, 'contact_us.element', '{\"address_type\":\"Email\",\"address\":\"demo@gmail.com\",\"icon\":\"<i class=\\\"fas fa-envelope-open\\\"><\\/i>\"}', '2021-06-22 05:05:16', '2021-06-22 05:05:16'),
(87, 'footer.element', '{\"soial_media_link\":\"https:\\/\\/www.instagram.com\",\"icon\":\"<i class=\\\"fa fa-instagram\\\"><\\/i>\"}', '2021-06-23 10:31:30', '2021-07-30 17:04:31'),
(88, 'footer.element', '{\"soial_media_link\":\"https:\\/\\/www.twitter.com\",\"icon\":\"<i class=\\\"fa fa-twitter\\\"><\\/i>\"}', '2021-06-23 10:31:50', '2021-07-30 17:04:42'),
(89, 'footer.element', '{\"soial_media_link\":\"https:\\/\\/www.linkedin.com\",\"icon\":\"<i class=\\\"fa fa-linkedin\\\"><\\/i>\"}', '2021-06-23 10:32:06', '2021-07-30 17:04:53'),
(91, 'policy_pages.element', '{\"title\":\"Policy\",\"details\":\"<div><font>loremLorem, ipsum dolor sit amet consectetur adipisicing elit. Aut commodi cupiditate neque doloribus? Assumenda natus officiis eius quaerat laboriosam harum temporibus delectus ab eaque quas nulla dolore reiciendis voluptate magni minima laborum ipsum, nemo unde. Ut similique, quod itaque reprehenderit illum inventore dolore sint cupiditate cum eaque earum asperiores ducimus vero ipsum in aspernatur officiis natus possimus nam praesentium obcaecati! Ducimus, voluptatum corrupti! Quia et maxime perferendis architecto. Sed facilis aliquam eveniet. Quaerat cumque aspernatur perferendis fuga labore eius saepe voluptatibus sit ipsum qui, culpa eligendi unde porro voluptatem atque consectetur ipsam tempore doloribus esse iure sint eum rerum! Enim ab, harum neque molestiae maiores architecto tempore omnis voluptatum. Iure vitae eligendi recusandae distinctio, earum culpa iste tenetur atque accusantium vel exercitationem ab, nemo ut magnam, tempora natus dolor aspernatur debitis voluptatem vero quidem et at omnis? Laboriosam fugiat explicabo quasi iusto, similique saepe non quod. Praesentium quia minus quasi.<br \\/><\\/font><div><font color=\\\"#ff00cc\\\">exercitationem ab, nemo ut magnam, tempora natus dolor aspernatur debitis voluptatem vero quidem et at omnis? Laboriosam fugiat explicabo quasi iusto, similique saepe non quod. Praesentium quia minus quasi.<\\/font><\\/div><\\/div>\"}', '2021-06-23 10:36:26', '2021-10-20 08:41:43'),
(92, 'faq.element', '{\"question\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit.\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as thei\"}', '2021-06-23 10:47:17', '2021-06-23 10:47:17'),
(93, 'faq.element', '{\"question\":\"Eligendi in enim quisquam dolor voluptates nihil.\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as thei\"}', '2021-06-23 10:47:26', '2021-06-23 10:47:26'),
(94, 'faq.element', '{\"question\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit.\",\"answer\":\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\"}', '2021-06-23 10:47:43', '2021-06-23 10:47:43'),
(95, 'faq.element', '{\"question\":\"Nesciunt eius similique tenetur corporis fuga.\",\"answer\":\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\"}', '2021-06-23 10:47:56', '2021-06-23 10:47:56'),
(96, 'topInvestor.element', '{\"has_image\":\"1\",\"name\":\"Zahidul\",\"country\":\"\\u00c5land Islands\",\"date\":\"11 Feb, 2021\",\"image\":\"60d318a8b590e1624447144.jpg\"}', '2021-06-23 10:49:04', '2021-06-23 10:49:05'),
(97, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Roksana\",\"number_of_star\":\"5\",\"say\":\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,\",\"designation\":\"Android Developer\",\"image\":\"6113d45e26f6f1628689502.png\"}', '2021-06-23 10:50:02', '2021-08-11 18:15:02'),
(98, 'about.element', '{\"title\":\"Secure Platform\",\"text\":\"This platform is a secure platform\",\"icon\":\"<i class=\\\"fa fa-lock\\\"><\\/i>\"}', '2021-08-11 18:38:11', '2021-08-11 18:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'Paypal', 'Paypal', '5f6f1bd8678601601117144.jpg', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 102, 'Perfect Money', 'PerfectMoney', '5f6f1d2a742211601117482.jpg', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 103, 'Stripe Hosted', 'Stripe', '5f6f1d4bc69e71601117515.jpg', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:41:48'),
(4, 104, 'Skrill', 'Skrill', '5f6f1d41257181601117505.jpg', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 105, 'PayTM', 'Paytm', '5f6f1d1d3ec731601117469.jpg', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 106, 'Payeer', 'Payeer', '5f6f1bc61518b1601117126.jpg', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 107, 'PayStack', 'Paystack', '5f7096563dfb71601214038.jpg', 0, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:41:39'),
(8, 108, 'VoguePay', 'Voguepay', '5f6f1d5951a111601117529.jpg', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 109, 'Flutterwave', 'Flutterwave', '5f6f1b9e4bb961601117086.jpg', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"FLWSECK_TEST-SANDBOXDEMOKEY-X\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:51'),
(10, 110, 'RazorPay', 'Razorpay', '5f6f1d3672dd61601117494.jpg', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 111, 'Stripe Storefront', 'StripeJs', '5f7096a31ed9a1601214115.jpg', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:41:53'),
(12, 112, 'Instamojo', 'Instamojo', '5f6f1babbdbb31601117099.jpg', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 501, 'Blockchain', 'Blockchain', '5f6f1b2b20c6f1601116971.jpg', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:15'),
(14, 502, 'Block.io', 'Blockio', '5f6f19432bedf1601116483.jpg', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"75757575\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.Blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-08-07 02:01:04'),
(15, 503, 'CoinPayments', 'Coinpayments', '5f6f1b6c02ecd1601117036.jpg', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:36'),
(16, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '5f6f1b94e9b2b1601117076.jpg', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:44'),
(17, 505, 'Coingate', 'Coingate', '5f6f1b5fe18ee1601117023.jpg', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:31'),
(18, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '5f6f1b4c774af1601117004.jpg', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:40:26'),
(24, 113, 'Paypal Express', 'PaypalSdk', '5f6f1bec255c61601117164.jpg', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 114, 'Stripe Checkout', 'StripeV3', '5f709684736321601214084.jpg', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-09-16 10:42:08'),
(27, 115, 'Mollie', 'Mollie', '5f6f1bb765ab11601117111.jpg', 0, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-08-07 01:58:41'),
(30, 116, 'Cashmaal', 'Cashmaal', '5f9a8b62bb4dd1603963746.png', 0, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, NULL, '2021-09-16 10:40:22'),
(34, 1000, 'Bank Transfer', 'bank_transfer', '610db364040911628287844.png', 0, '[]', '[]', 0, NULL, 'NO scam zone', '{\"account_name\":{\"field_name\":\"account_name\",\"field_level\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"}}', '2021-08-07 02:40:44', '2021-09-16 10:40:06'),
(35, 1001, 'Bitcoin', 'bitcoin', '614301bae621b1631781306.png', 1, '[]', '[]', 1, NULL, 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"bitcoin_wallet_address\":{\"field_name\":\"bitcoin_wallet_address\",\"field_level\":\"Bitcoin Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', '2021-09-16 10:35:07', '2021-09-16 17:04:24'),
(36, 1002, 'Ethereum', 'ethereum', '61430224a75411631781412.png', 1, '[]', '[]', 1, NULL, 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', '2021-09-16 10:36:53', '2021-09-16 17:04:50'),
(37, 1003, 'Litecoin', 'litecoin', '6143027729e0b1631781495.png', 1, '[]', '[]', 1, NULL, 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', '2021-09-16 10:38:16', '2021-09-16 17:05:17'),
(38, 1004, 'USD Tether', 'usd_tether', '614302aaba68e1631781546.png', 1, '[]', '[]', 1, NULL, 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', '2021-09-16 10:39:07', '2021-09-16 17:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `crypto`, `created_at`, `updated_at`) VALUES
(1, 'Paystack', 'NGN', '₦', 107, 'Paystack', '10.00000000', '1000000.00000000', '0.00', '0.00000000', '450.00000000', NULL, '{\"public_key\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\",\"secret_key\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}', NULL, '2021-07-24 14:30:00', '2021-07-24 14:30:00'),
(2, 'Stripe Hosted', 'USD', '$', 103, 'Stripe', '1001.00000000', '10000.00000000', '0.00', '0.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}', NULL, '2021-07-24 22:39:11', '2021-07-24 22:39:11'),
(3, 'Stripe Storefront', 'USD', '$', 111, 'StripeJs', '100.00000000', '100000.00000000', '0.00', '0.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}', NULL, '2021-07-24 22:39:58', '2021-07-24 22:39:58'),
(4, 'Stripe Checkout', 'USD', '$', 114, 'StripeV3', '100.00000000', '10000.00000000', '0.00', '0.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\",\"end_point\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}', NULL, '2021-07-24 22:40:41', '2021-07-24 22:40:41'),
(5, 'NGN', 'NGN', '₦', 109, 'Flutterwave', '100.00000000', '100000.00000000', '0.00', '0.00000000', '490.00000000', NULL, '{\"public_key\":\"----------------\",\"secret_key\":\"FLWSECK_TEST-SANDBOXDEMOKEY-X\",\"encryption_key\":\"------------------\"}', NULL, '2021-07-28 04:24:50', '2021-07-28 04:24:50'),
(6, 'Bank Transfer', 'USD', '', 1000, 'bank_transfer', '100.00000000', '1000.00000000', '1.00', '1.00000000', '1.00000000', '610db364040911628287844.png', '{\"account_name\":{\"field_name\":\"account_name\",\"field_level\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, '2021-08-07 02:40:44', '2021-08-07 02:57:33'),
(7, 'Bitcoin', 'USD', '', 1001, 'bitcoin', '1.00000000', '100000.00000000', '0.00', '0.00000000', '1.00000000', '614301bae621b1631781306.png', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"bitcoin_wallet_address\":{\"field_name\":\"bitcoin_wallet_address\",\"field_level\":\"Bitcoin Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2021-09-16 10:35:07', '2021-09-16 17:04:24'),
(8, 'Ethereum', 'USD', '', 1002, 'ethereum', '1.00000000', '10000000.00000000', '0.00', '0.00000000', '1.00000000', '61430224a75411631781412.png', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2021-09-16 10:36:53', '2021-09-16 17:04:50'),
(9, 'Litecoin', 'USD', '', 1003, 'litecoin', '1.00000000', '100000000.00000000', '0.00', '0.00000000', '1.00000000', '6143027729e0b1631781495.png', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2021-09-16 10:38:16', '2021-09-16 17:05:17'),
(10, 'USD Tether', 'USD', '', 1004, 'usd_tether', '11.00000000', '10000000.00000000', '0.00', '0.00000000', '1.00000000', '614302aaba68e1631781546.png', '{\"transaction_hash\":{\"field_name\":\"transaction_hash\",\"field_level\":\"Transaction Hash\",\"type\":\"text\",\"validation\":\"required\"},\"wallet_address\":{\"field_name\":\"wallet_address\",\"field_level\":\"Wallet Address\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2021-09-16 10:39:07', '2021-09-16 17:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `min_compound` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_commission` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_commission` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_return_commission` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swap` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardfee` int(100) DEFAULT NULL,
  `transferfee` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `min_compound`, `deposit_commission`, `invest_commission`, `invest_return_commission`, `agree`, `registration`, `active_template`, `sys_version`, `swap`, `cardfee`, `transferfee`, `created_at`, `updated_at`) VALUES
(1, 'Gainz', 'NGN', '₦', 'do-not-reply@asapcodes.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', '2f8852', '2f8852', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"account_sid\":\"AC67afdacf2dacff5f163134883db92c24\",\"auth_token\":\"77726b242830fb28f52fb08c648dd7a6\",\"from\":\"+17739011523\",\"apiv2_key\":\"dfsfgdfgh\",\"name\":\"clickatell\"}', 0, 0, 0, 0, 0, '30', '1', '1', '1', 0, 1, 'basic', NULL, 'dsdsgsd', 5, 1, NULL, '2021-10-20 08:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `internetbundles`
--

CREATE TABLE `internetbundles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(44) DEFAULT NULL,
  `network` varchar(77) DEFAULT NULL,
  `networkcode` varchar(77) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `plan` varchar(22) DEFAULT NULL,
  `cost` varchar(22) DEFAULT NULL,
  `status` varchar(22) DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  `created_at` varchar(29) DEFAULT NULL,
  `updated_at` varchar(33) DEFAULT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internetbundles`
--

INSERT INTO `internetbundles` (`id`, `name`, `network`, `networkcode`, `code`, `plan`, `cost`, `status`, `deleted_at`, `created_at`, `updated_at`, `image`) VALUES
(278, 'N100 100MB - 24 hrs', 'MTN', 'mtn', 'mtn-data', 'mtn-10mb-100', '100.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(279, 'N200 200MB - 2 days', 'MTN', 'mtn', 'mtn-data', 'mtn-50mb-200', '200.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(280, 'N1000 1.5GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-100mb-1000', '1000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(281, 'N2000 4.5GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-500mb-2000', '2000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(282, 'N1500 6GB - 7 days', 'MTN', 'mtn', 'mtn-data', 'mtn-20hrs-1500', '1500.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(283, 'N2500 6GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-3gb-2500', '2500.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(284, 'N3000 8GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-data-3000', '3000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(285, 'N3500 10GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-1gb-3500', '3500.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(286, 'N5000 15GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-100hr-5000', '5000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(287, 'N6000 20GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-3gb-6000', '6000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(288, 'N10000 40GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-40gb-10000', '10000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(289, 'N15000 75GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-75gb-15000', '15000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(290, 'N20000 110GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-110gb-20000', '20000.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(291, 'N1500 3GB - 30 days', 'MTN', 'mtn', 'mtn-data', 'mtn-3gb-1500', '1500.00', '1', NULL, '2021-04-11 04:39:43', '2021-04-11 04:39:43', NULL),
(292, 'Glo Data N100 -  105MB - 2 day', 'Globacom', 'glo', 'glo-data', 'glo100', '100.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(293, 'Glo Data N200 -  350MB - 4 days', 'Globacom', 'glo', 'glo-data', 'glo200', '200.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(294, 'Glo Data N500 -  1.05GB - 14 days', 'Globacom', 'glo', 'glo-data', 'glo500', '500.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(295, 'Glo Data N1000 -  2.5GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo1000', '1000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(296, 'Glo Data N2000 -  5.8GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo2000', '2000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(297, 'Glo Data N2500 -  7.7GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo2500', '2500.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(298, 'Glo Data N3000 -  10GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo3000', '3000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(299, 'Glo Data N4000 -  13.25GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo4000', '4000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(300, 'Glo Data N5000 -  18.25GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo5000', '5000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(301, 'Glo Data N8000 -  29.5GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo8000', '8000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(302, 'Glo Data N10000 -  50GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo10000', '10000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(303, 'Glo Data N15000 -  93GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo15000', '15000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(304, 'Glo Data N18000 -  119GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo18000', '18000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(305, 'Glo Data N1500 -  4.1GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo1500', '1500.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(306, 'Glo Data N20000 -  138GB - 30 days', 'Globacom', 'glo', 'glo-data', 'glo20000', '20000.00', '1', NULL, '2021-04-11 04:39:44', '2021-04-11 04:39:44', NULL),
(307, '9mobile Data - 100 Naira - 100MB - 1 day', '9mobile', '9mobile', 'etisalat-data', 'eti-100', '100.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(308, '9mobile Data - 200 Naira - 650MB - 1 day', '9mobile', '9mobile', 'etisalat-data', 'eti-200', '200.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(309, '9mobile Data - 500 Naira - 500MB - 30 Days', '9mobile', '9mobile', 'etisalat-data', 'eti-500', '500.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(310, '9mobile Data - 1000 Naira - 1.5GB - 30 days', '9mobile', '9mobile', 'etisalat-data', 'eti-1000', '1000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(311, '9mobile Data - 2000 Naira - 4.5GB Data - 30 ', '9mobile', '9mobile', 'etisalat-data', 'eti-2000', '2000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(312, '9mobile Data - 5000 Naira - 15GB Data - 30 D', '9mobile', '9mobile', 'etisalat-data', 'eti-5000', '5000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(313, '9mobile Data - 10000 Naira - 40GB - 30 days', '9mobile', '9mobile', 'etisalat-data', 'eti-10000', '10000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(314, '9mobile Data - 15000 Naira - 75GB - 30 Days', '9mobile', '9mobile', 'etisalat-data', 'eti-15000', '15000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(315, '9mobile Data - 27,500 Naira - 30GB - 90 days', '9mobile', '9mobile', 'etisalat-data', 'eti-27500', '27500.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(316, '9mobile Data - 55,000 Naira - 60GB - 180 day', '9mobile', '9mobile', 'etisalat-data', 'eti-55000', '55000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(317, '9mobile Data - 110,000 Naira - 120GB - 365 d', '9mobile', '9mobile', 'etisalat-data', 'eti-110000', '110000.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(318, 'Airtel Data Bundle - 50 Naira - 25MB  - 1Day', 'Airtel', 'airtel', 'airtel-data', 'airt-50', '49.99', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(319, 'Airtel Data Bundle - 100 Naira - 75MB - 1Day', 'Airtel', 'airtel', 'airtel-data', 'airt-100', '99.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(320, 'Airtel Data Bundle - 200 Naira - 200MB - 3Da', 'Airtel', 'airtel', 'airtel-data', 'airt-200', '199.03', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(321, 'Airtel Data Bundle - 300 Naira - 350MB - 7 D', 'Airtel', 'airtel', 'airtel-data', 'airt-300', '299.02', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(322, 'Airtel Data Bundle - 500 Naira - 750MB - 14 ', 'Airtel', 'airtel', 'airtel-data', 'airt-500', '499.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(323, 'Airtel Data Bundle - 1,000 Naira - 1.5GB - 3', 'Airtel', 'airtel', 'airtel-data', 'airt-1000', '999.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(324, 'Airtel Data Bundle - 1,500 Naira - 3GB - 30 ', 'Airtel', 'airtel', 'airtel-data', 'airt-1500', '1499.01', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(325, 'Airtel Data Bundle - 2,000 Naira - 4.5GB - 3', 'Airtel', 'airtel', 'airtel-data', 'airt-2000', '1999.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(326, 'Airtel Data Bundle - 3,000 Naira - 8GB - 30 ', 'Airtel', 'airtel', 'airtel-data', 'airt-3000', '2999.02', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(327, 'Airtel Data Bundle - 4,000 Naira - 11GB - 30', 'Airtel', 'airtel', 'airtel-data', 'airt-4000', '3999.01', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(328, 'Airtel Data Bundle - 5,000 Naira - 15GB - 30', 'Airtel', 'airtel', 'airtel-data', 'airt-5000', '4999.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(329, 'Airtel Binge Data - 1,500 Naira (7 Days) - 6', 'Airtel', 'airtel', 'airtel-data', 'airt-1500-2', '1499.03', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(330, 'Airtel Data Bundle - 10,000 Naira - 40GB - 3', 'Airtel', 'airtel', 'airtel-data', 'airt-10000', '9999.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(331, 'Airtel Data Bundle - 15,000 Naira - 75GB - 3', 'Airtel', 'airtel', 'airtel-data', 'airt-15000', '14999.00', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(332, 'Airtel Data Bundle - 20,000 Naira - 110GB - ', 'Airtel', 'airtel', 'airtel-data', 'airt-20000', '19999.02', '1', NULL, '2021-04-11 04:39:45', '2021-04-11 04:39:45', NULL),
(333, 'SmileVoice ONLY 65 for 30days - 510 Naira', 'Smile', 'smile', 'smile-direct', '516', '510.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(334, '2GB MidNite for 7days - 1,020 Naira', 'Smile', 'smile', 'smile-direct', '413', '1020.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(335, 'SmileVoice ONLY 135 for 30days - 1,020 Naira', 'Smile', 'smile', 'smile-direct', '517', '1020.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(336, '3GB MidNite for 7days - 1,530 Naira', 'Smile', 'smile', 'smile-direct', '414', '1530.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(337, '3GB Weekend ONLY for 3days - 1,530 Naira', 'Smile', 'smile', 'smile-direct', '415', '1530.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(338, 'SmileVoice ONLY 430 for 30days - 3,070 Naira', 'Smile', 'smile', 'smile-direct', '518', '3070.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(339, 'Buy Airtime', 'Smile', 'smile', 'smile-direct', 'airtime', '0.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(340, 'UnlimitedPlatinum for 30days - 24,000 Naira', 'Smile', 'smile', 'smile-direct', '583', '24000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(341, ' 1GB Flexi for 1days - 300 Naira', 'Smile', 'smile', 'smile-direct', '624', '300.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(342, ' 2.5GB Flexi for 2days - 500 Naira', 'Smile', 'smile', 'smile-direct', '625', '500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(343, '1GB Flexi-Weekly for 7days - 500 Naira', 'Smile', 'smile', 'smile-direct', '626', '500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(344, '1.5GB Bigga for 30days - 1,000 Naira', 'Smile', 'smile', 'smile-direct', '606', '1000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(345, ' 2GB Flexi-Weekly  for 7days - 1,000 Naira', 'Smile', 'smile', 'smile-direct', '627', '1000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(346, '2GB Bigga for 30days - 1,200 Naira', 'Smile', 'smile', 'smile-direct', '607', '1200.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(347, '3GB Bigga for 30days - 1,500 Naira', 'Smile', 'smile', 'smile-direct', '608', '1500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(348, ' 6GB Flexi-Weekly  for 7days - 1,500 Naira', 'Smile', 'smile', 'smile-direct', '628', '1500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(349, '5GB Bigga for 30days - 2,000 Naira', 'Smile', 'smile', 'smile-direct', '620', '2000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(350, '6.5GB Bigga for 30days - 2,500 Naira', 'Smile', 'smile', 'smile-direct', '609', '2500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(351, '8GB Bigga for 30days - 3,000 Naira', 'Smile', 'smile', 'smile-direct', '610', '3000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(352, '10GB Bigga for 30days - 3,500 Naira', 'Smile', 'smile', 'smile-direct', '611', '3500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(353, '12GB Bigga for 30days - 4,000 Naira', 'Smile', 'smile', 'smile-direct', '612', '4000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(354, '15GB Bigga for 30days - 5,000 Naira', 'Smile', 'smile', 'smile-direct', '613', '5000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(355, '20GB Bigga for 30days - 6,000 Naira', 'Smile', 'smile', 'smile-direct', '614', '6000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(356, '15GB-Anytime for 365days - 8,000 Naira', 'Smile', 'smile', 'smile-direct', '601', '8000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(357, '30GB Bigga for 30days - 8,000 Naira', 'Smile', 'smile', 'smile-direct', '615', '8000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(358, '40GB Bigga for 30days - 10,000 Naira', 'Smile', 'smile', 'smile-direct', '616', '10000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(359, 'Unlimited-Lite for 30days - 10,000 Naira', 'Smile', 'smile', 'smile-direct', '629', '10000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(360, '60GB Bigga for 30days - 13,500 Naira', 'Smile', 'smile', 'smile-direct', '617', '13500.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(361, '75GB Bigga for 30days - 15,000 Naira', 'Smile', 'smile', 'smile-direct', '618', '15000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(362, ' 50GB Bumpa-Value  for 60days - 15,000 Naira', 'Smile', 'smile', 'smile-direct', '621', '15000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(363, 'Unlimited-Essential for 30days - 15,000 Nair', 'Smile', 'smile', 'smile-direct', '630', '15000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(364, ' 35GB-Anytime  for 365days - 16,000 Naira', 'Smile', 'smile', 'smile-direct', '602', '16000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(365, '100GB Bigga for 30days - 18,000 Naira', 'Smile', 'smile', 'smile-direct', '619', '18000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(366, 'UnlimitedPremium for 30days - 20,000 Naira', 'Smile', 'smile', 'smile-direct', '655', '20000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(367, ' 80GB Bumpa-Value  for 90days - 30,000 Naira', 'Smile', 'smile', 'smile-direct', '622', '30000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(368, ' 90GB-Anytime   for 365days - 36,000 Naira', 'Smile', 'smile', 'smile-direct', '603', '36000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(369, ' 100GB Bumpa-Value  for 120days - 40,000 Nai', 'Smile', 'smile', 'smile-direct', '623', '40000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(370, ' 200GB-Anytime   for 365days - 70,000 Naira', 'Smile', 'smile', 'smile-direct', '604', '70000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL),
(371, ' 400GB-Anytime  for 365days - 120,000 Naira', 'Smile', 'smile', 'smile-direct', '605', '120000.00', '1', NULL, '2021-04-11 04:39:46', '2021-04-11 04:39:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `usd` int(1) NOT NULL DEFAULT 0,
  `interest_type` tinyint(1) NOT NULL COMMENT '0=>Fixed, 1=>Percent',
  `interest_amount` decimal(28,8) NOT NULL,
  `total_return` int(11) NOT NULL,
  `total_paid` int(11) NOT NULL,
  `next_return_date` datetime NOT NULL,
  `compound` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0=>Running, 1=>Completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `trx`, `plan_id`, `user_id`, `amount`, `usd`, `interest_type`, `interest_amount`, `total_return`, `total_paid`, `next_return_date`, `compound`, `status`, `created_at`, `updated_at`) VALUES
(1, 'UM84XBVAY299', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 2, '2021-07-28 03:17:09', 'Weekly Compounding', 0, '2021-07-25 02:17:09', '2021-11-17 13:35:18'),
(2, 'KG1TPJ', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 11:42:39', '12 Months Compounding', 0, '2021-09-16 10:42:39', '2021-09-16 10:42:39'),
(3, '4OC2JZ', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 11:43:39', '12 Months Compounding', 0, '2021-09-16 10:43:39', '2021-09-16 10:43:39'),
(4, '1WXOSS', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 11:45:09', 'Weekly Compounding', 0, '2021-09-16 10:45:09', '2021-09-16 10:45:09'),
(5, 'RKU7UY', 2, 1, '100.00000000', 0, 0, '6.50000000', 10, 0, '2021-09-17 11:57:52', '12 Months Compounding', 0, '2021-09-16 10:57:52', '2021-09-16 10:57:52'),
(6, 'BKM77E', 2, 1, '100.00000000', 0, 0, '6.50000000', 10, 0, '2021-09-17 11:58:21', '12 Months Compounding', 0, '2021-09-16 10:58:21', '2021-09-16 10:58:21'),
(7, '7AA8HU', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 16:37:15', 'Weekly Compounding', 0, '2021-09-16 15:37:15', '2021-09-16 15:37:15'),
(8, 'N6C9KN', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 16:37:49', 'Weekly Compounding', 0, '2021-09-16 15:37:49', '2021-09-16 15:37:49'),
(9, '9WEF1X', 1, 1, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-09-17 20:44:47', 'Weekly Compounding', 0, '2021-09-16 19:44:47', '2021-09-16 19:44:47'),
(10, '91S5OS', 1, 15, '100.00000000', 0, 1, '10.00000000', 2, 0, '2021-11-18 14:19:31', NULL, 0, '2021-11-17 13:19:31', '2021-11-17 13:35:18'),
(11, 'KMGDBC', 2, 18, '200.00000000', 0, 0, '6.50000000', 10, 0, '2021-11-18 16:18:51', NULL, 2, '2021-11-17 15:18:51', '2021-11-17 15:18:51'),
(12, 'UC9ABM', 2, 18, '200.00000000', 0, 0, '6.50000000', 10, 0, '2021-11-18 16:19:20', NULL, 2, '2021-11-17 15:19:20', '2021-11-17 15:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `front` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `back` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(55) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `user_id`, `type`, `number`, `expiry`, `front`, `back`, `address`, `city`, `state`, `country`, `zip`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Company ID Card', 'N/A', '2021-07-22', '6101da4091ebf1627511360.png', '', 'RLqVTNiUxJomP6P2uFu6B4gC4X4cAtxufm', 'Not Set', 'Not Set', 'Not Set', 'Not Set', NULL, 1, '2021-07-29 02:59:22', '2021-08-10 15:45:12');

-- --------------------------------------------------------

--
-- Table structure for table `kycsettings`
--

CREATE TABLE `kycsettings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(55) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycsettings`
--

INSERT INTO `kycsettings` (`id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Voters Card', 1, '2021-08-11 11:48:24', '2021-11-17 13:44:21'),
(2, 'International Passport', 1, '2021-08-11 11:48:39', '2021-08-11 11:48:39'),
(3, 'NIN', 1, '2021-11-17 13:44:45', '2021-11-17 13:44:45'),
(4, 'Drivers\' Licence', 1, '2021-11-17 13:44:57', '2021-11-17 13:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 0, '2020-07-06 03:47:55', '2021-05-18 05:37:23'),
(5, 'Hindi', 'hn', NULL, 0, 0, '2020-12-29 02:20:07', '2020-12-29 02:20:16'),
(9, 'Bangla', 'bn', NULL, 0, 0, '2021-03-14 04:37:41', '2021-05-12 05:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(32) NOT NULL,
  `plan_id` int(10) DEFAULT NULL,
  `user_id` int(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `interest` varchar(44) DEFAULT NULL,
  `total` varchar(44) DEFAULT NULL,
  `penalty` varchar(10) DEFAULT NULL,
  `next_penalty` datetime DEFAULT NULL,
  `paid` varchar(100) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` varchar(77) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `duration` varchar(77) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `plan_id`, `user_id`, `amount`, `interest`, `total`, `penalty`, `next_penalty`, `paid`, `status`, `reference`, `created_at`, `updated_at`, `expire`, `duration`) VALUES
(10, 1, 1, '70000', '1500', '71500', '3', NULL, '4', 2, '1616488744', '2021-08-18 10:44:51', '2021-03-23 09:39:11', '2021-10-27 21:48:55', '2'),
(11, 2, 1, '100000', '1000', '101000', '0', NULL, '9', 2, '1617279880', '2021-08-18 10:45:32', '2021-04-01 12:37:08', '2021-10-27 21:48:55', '3'),
(12, 1, 1, '50000', '650', '50650', '4', NULL, '200', 2, 'Z6ONOA7SP387', '2021-08-18 10:44:53', '2021-08-07 22:15:32', '2021-10-27 21:48:55', '3'),
(13, 2, 1, '60000', '780', '60780', '4', NULL, '163', 2, 'PTQJKWVASS92', '2021-08-18 10:44:59', '2021-07-27 23:01:49', '2021-10-27 21:48:55', '3'),
(14, 2, 1, '52000', '676', '52676', '5', NULL, '9', 2, 'DT1BMY', '2021-08-18 10:45:01', '2021-08-10 16:52:37', '2021-09-30 12:17:41', '2'),
(15, 2, 1, '55000', '715', '138215', '55000', '2021-09-18 15:31:19', '5421', 1, 'RPF51R', '2021-08-18 12:31:19', '2021-08-18 15:31:19', '2021-06-01 21:01:28', '4');

-- --------------------------------------------------------

--
-- Table structure for table `loan_pays`
--

CREATE TABLE `loan_pays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `loan_id` varchar(60) DEFAULT NULL,
  `plan_id` varchar(88) DEFAULT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(30) DEFAULT NULL,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_pays`
--

INSERT INTO `loan_pays` (`id`, `user_id`, `loan_id`, `plan_id`, `amount`, `balance`, `trx`, `status`, `created_at`, `updated_at`) VALUES
(255, '61', '1613678623', '1', '16666.666666666668', NULL, '78IZNM', 0, '2021-02-18 19:04:11', '2021-02-18 19:04:11'),
(256, '61', '1613678623', '1', '16666.666666666668', NULL, '9C8S64', 0, '2021-02-18 19:04:11', '2021-02-18 19:04:11'),
(257, '61', '1613678623', '1', '16666.666666666668', NULL, 'CU0RQH', 0, '2021-02-18 19:04:11', '2021-02-18 19:04:11'),
(258, '61', '1616488744', '2', '35000', NULL, 'P0NY64', 0, '2021-03-23 07:41:02', '2021-03-23 07:41:02'),
(259, '61', '1616488744', '2', '35000', NULL, 'HDVG0N', 0, '2021-03-23 07:41:02', '2021-03-23 07:41:02'),
(260, '1', 'PTQJKWVASS92', '2', '300', NULL, 'PSFHQ9WK1EOZ', 1, '2021-07-27 21:38:50', '2021-07-27 21:38:50'),
(261, '1', 'PTQJKWVASS92', '2', '13', NULL, 'O2JFF1UOKCKU', 1, '2021-07-27 21:44:35', '2021-07-27 21:44:35'),
(262, '1', 'PTQJKWVASS92', '2', '50', '60617', 'F8EPMB7DD1FW', 1, '2021-07-27 22:01:50', '2021-07-27 22:01:50'),
(263, '1', 'Z6ONOA7SP387', '1', '100', '50450', 'XJQWFF', 1, '2021-08-07 21:14:34', '2021-08-07 21:14:34'),
(264, '1', 'RPF51R', '2', '55714', '0', 'ZUUYNZ', 1, '2021-08-18 12:39:13', '2021-08-18 12:39:13'),
(265, '1', 'RPF51R', '2', '77714', '0', '1BW63E', 1, '2021-08-18 13:19:17', '2021-08-18 13:19:17'),
(266, '1', 'RPF51R', '2', '-5300', '10800', 'M7D8XR', 1, '2021-08-18 14:03:01', '2021-08-18 14:03:01'),
(267, '1', 'RPF51R', '2', '-16300', '38100', 'WRSNKZ', 1, '2021-08-18 14:16:52', '2021-08-18 14:16:52'),
(268, '1', 'RPF51R', '2', '-27300', '76400', 'VVQKMD', 1, '2021-08-18 14:18:40', '2021-08-18 14:18:40'),
(269, '1', 'RPF51R', '2', '49100.00000000', '38300', 'GEMA45', 1, '2021-08-18 14:24:05', '2021-08-18 14:24:05'),
(270, '1', 'RPF51R', '2', '43800', '0', '58CCS3', 1, '2021-08-18 14:27:10', '2021-08-18 14:27:10'),
(271, '1', 'RPF51R', '2', '5300.00000000', '116294', 'OUVF4P', 1, '2021-08-18 14:27:54', '2021-08-18 14:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plans`
--

CREATE TABLE `loan_plans` (
  `id` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `fee` varchar(32) NOT NULL DEFAULT '0',
  `penalty` varchar(2) NOT NULL DEFAULT '0',
  `min` int(32) NOT NULL,
  `max` int(32) NOT NULL,
  `duration` varchar(22) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_plans`
--

INSERT INTO `loan_plans` (`id`, `name`, `fee`, `penalty`, `min`, `max`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bronze', '1.3', '2', 50000, 50000, '3', 1, '2021-08-07 10:07:02', '0000-00-00 00:00:00'),
(2, 'Silver', '1.3', '10', 50001, 99000, '5', 1, '2021-08-18 10:45:41', '0000-00-00 00:00:00'),
(3, 'Gold', '1.3', '0', 100000, 299999, '3', 0, '2021-08-07 10:23:08', '0000-00-00 00:00:00'),
(4, 'Diamond', '1.3', '0', 300000, 999999, '1', 1, '2021-07-25 07:21:17', '0000-00-00 00:00:00'),
(5, 'Platinum', '1.3', '0', 1000000, 2999999, '4', 1, '2021-07-25 07:21:21', '0000-00-00 00:00:00'),
(6, 'Business', '1.3', '0', 3000000, 5000000, '5', 1, '2021-07-25 07:21:24', '0000-00-00 00:00:00'),
(15, 'Daily', '1', '1', 112, 1234, '2', 0, '2021-08-07 10:18:05', '2021-08-07 14:48:05'),
(16, 'Ratu Loan1', '1', '1', 1000, 10000, '2', 1, '2021-09-16 11:29:33', '2021-09-16 11:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13),
(25, '2021_06_21_161109_create_plans_table', 14),
(26, '2021_06_21_175829_create_investments_table', 15),
(27, '2021_06_22_173346_create_invest_histories_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

CREATE TABLE `networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `max` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `airtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tv` int(1) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `networks`
--

INSERT INTO `networks` (`id`, `name`, `type`, `code`, `symbol`, `image`, `min`, `max`, `airtime`, `internet`, `tv`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Airtel', NULL, 'AIRTEL', 'airtel', 'airtel.png', '100', '435', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(2, 'Smile', NULL, 'Smile', 'smile', 'airtel.png', '100', '435', '0', '0', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(3, 'Globacom', NULL, 'GLO', 'glo', 'glo.png', '390', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:29'),
(4, 'MTN', NULL, 'MTN', 'mtn', 'mtn.png', '370', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(5, '9mobile', NULL, '9MOBILE', 'etisalat', '9mob.png', '450', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(6, 'DSTV', 'multichoice', 'dstv', 'Feel the difference', 'dstv.png', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(7, 'GOTV', 'multichoice', 'gotv', 'Live It Love It', 'gotv.jpg', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(8, 'STARTIMES', 'startimes', 'startimes', 'Emjoy Digital Live', 'startimes.jpg', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"overView\",\"about\",\"howToWork\",\"feature\",\"faq\",\"testimonial\",\"payment\"]', 1, '2020-07-11 06:23:58', '2021-06-20 13:52:00'),
(13, 'HOME', 'home', 'user.', '[\"overView\",\"about\",\"howToWork\",\"feature\",\"faq\",\"testimonial\",\"payment\"]', 0, '2021-07-30 11:02:26', '2021-07-30 11:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('test@test.com', '340443', '2021-08-10 13:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(28,8) NOT NULL,
  `max_amount` decimal(28,8) NOT NULL,
  `total_return` int(11) NOT NULL,
  `timer` int(11) DEFAULT NULL,
  `usd` int(1) NOT NULL DEFAULT 0,
  `interest_type` tinyint(1) NOT NULL COMMENT '1=>Percent, 0=>Fixed',
  `interest_amount` decimal(28,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `start_at` varchar(33) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `min_amount`, `max_amount`, `total_return`, `timer`, `usd`, `interest_type`, `interest_amount`, `status`, `start_at`, `created_at`, `updated_at`) VALUES
(1, 'Bronxe', '100.00000000', '1000.00000000', 2, 1, 0, 1, '10.00000000', 0, '2021-11-24', '2021-07-24 18:40:53', '2021-11-17 13:36:20'),
(2, 'Reg Saver', '100.00000000', '1000.00000000', 10, 1, 0, 0, '6.50000000', 1, '2021-11-08', '2021-08-07 03:52:50', '2021-11-17 13:16:44'),
(3, 'Razor', '100.00000000', '2000.00000000', 12, 1, 1, 0, '10.00000000', 1, '2021-11-30', '2021-08-18 08:37:41', '2021-11-17 14:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `plan_timer`
--

CREATE TABLE `plan_timer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_timer`
--

INSERT INTO `plan_timer` (`id`, `name`, `time`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Daily', '1', 'Days', '2021-05-08 05:15:04', '2021-08-18 09:38:46'),
(2, 'Weekly', '7', 'Weeks', '2021-05-08 05:15:12', '2021-05-08 05:15:12'),
(3, 'Monthly', '30', 'Months', '2021-05-08 05:15:12', '2021-05-08 05:15:12'),
(4, 'Quaterly', '90', 'Quater', '2021-08-18 09:24:56', '2021-08-18 09:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `powers`
--

CREATE TABLE `powers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billercode` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `powers`
--

INSERT INTO `powers` (`id`, `name`, `symbol`, `image`, `code`, `billercode`, `type`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Eko Electric', 'PHCN', 'ekedc.png', '01', 'eko-electric', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(2, 'Jos Electric', 'JED', 'jed2.png', '06', 'jos-electric', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(3, 'Kano Electric', 'KEDCO', 'kadco.png', '01', 'kano-electric', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(5, 'Port Harcourt Electric', 'PHED', 'phedc.jpg', '05', 'portharcourt-electric', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(6, 'Ibadan Electric', 'IBED', 'ibadan.png', '05', 'ibadan-electric', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(7, 'Kaduna Electric', 'KAD', 'kaduna.jpg', '05', 'kaduna-electric', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(9, 'Abuja Electric', 'ABEL', 'abuja.jpeg', '01', 'abuja-electric', 'Postpaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(11, 'Ikeja Electric ', 'IKEDC', 'ikedc.png', '02', 'ikeja-electric', 'Postpaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `level`, `percent`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 1, '2021-09-16 13:48:10', '2021-09-16 13:48:10'),
(2, 2, '3', 1, '2021-09-16 13:48:10', '2021-09-16 13:48:10'),
(3, 3, '7', 1, '2021-09-16 13:48:10', '2021-09-16 13:48:10'),
(4, 4, '88', 1, '2021-09-16 13:48:10', '2021-09-16 13:48:10'),
(5, 5, '3', 1, '2021-09-16 13:48:10', '2021-09-16 13:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(32) NOT NULL,
  `type` int(10) DEFAULT NULL,
  `user_id` int(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `cycle` varchar(44) DEFAULT NULL,
  `recurrent` int(22) DEFAULT NULL,
  `recurrent_count` int(11) DEFAULT NULL,
  `next_recurrent` datetime DEFAULT NULL,
  `mature` datetime DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` varchar(77) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `type`, `user_id`, `amount`, `cycle`, `recurrent`, `recurrent_count`, `next_recurrent`, `mature`, `balance`, `status`, `reference`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '100', '1', 1, NULL, '2021-08-03 14:19:29', NULL, '0', 0, 'XD46D8UCG5EZ', '2021-08-18 13:49:58', '2021-08-18 16:49:01'),
(2, 2, 1, '10000', NULL, NULL, NULL, NULL, '2021-07-31 00:00:00', '0', 0, '9SHT8F6H3HTZ', '2021-08-18 13:47:17', '2021-08-18 16:47:17'),
(3, 1, 1, '100', '1', 10, NULL, '2021-08-03 14:19:35', NULL, '0', 0, 'AFO12E1BWFTX', '2021-08-18 13:49:53', '2021-08-18 16:49:01'),
(4, 1, 1, '100', '7', 8, 8, '2021-08-25 17:08:26', NULL, '0', 0, '68HC2T', '2021-08-18 14:08:27', '2021-08-18 17:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `saving_pays`
--

CREATE TABLE `saving_pays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `loan_id` varchar(60) DEFAULT NULL,
  `plan_id` varchar(88) DEFAULT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(30) DEFAULT NULL,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saving_pays`
--

INSERT INTO `saving_pays` (`id`, `user_id`, `loan_id`, `plan_id`, `amount`, `balance`, `trx`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'XD46D8UCG5EZ', '1', '12', '12', 'TBJ7E3WYD4HF', 1, '2021-07-28 03:08:17', '2021-07-28 03:08:17'),
(2, '1', '9SHT8F6H3HTZ', '2', '100', '100', '4VGSOGPPG3WN', 1, '2021-07-28 03:14:32', '2021-07-28 03:14:32'),
(3, '1', '68HC2T', '1', '100', '100', 'YSZ3Z6', 1, '2021-08-18 16:03:13', '2021-08-18 16:03:13'),
(4, '1', '68HC2T', '1', '100', '100', 'X93RAG', 1, '2021-08-18 16:04:24', '2021-08-18 16:04:24'),
(5, '1', '68HC2T', '1', '100', '100', 'ENEZKO', 1, '2021-08-18 16:06:26', '2021-08-18 16:06:26'),
(6, '1', '68HC2T', '1', '100', '200', '3AHFT1', 1, '2021-08-18 16:06:44', '2021-08-18 16:06:44'),
(7, '1', '68HC2T', '1', '100', '300', 'YU7SBG', 1, '2021-08-18 16:08:26', '2021-08-18 16:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `support_message_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 15, '13241628677966.png', '2021-08-11 15:02:46', '2021-08-11 15:02:46'),
(4, 15, '12611628677966.png', '2021-08-11 15:02:46', '2021-08-11 15:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `supportticket_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `supportticket_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(13, '5', 1, 'YesYesYesYesYesYesYesYesYes', '2021-08-11 14:00:14', '2021-08-11 14:00:14'),
(14, '6', 1, 'This is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast message', '2021-08-11 15:02:07', '2021-08-11 15:02:07'),
(15, '7', 1, 'This is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast messageThis is a broadcast message', '2021-08-11 15:02:46', '2021-08-11 15:02:46'),
(16, '7', 1, 'dfasgasgas', '2021-08-11 15:44:10', '2021-08-11 15:44:10'),
(17, '7', 1, 'laksfjkalsgas', '2021-08-11 15:44:24', '2021-08-11 15:44:24'),
(18, '7', 1, 'sflasfasg', '2021-08-11 15:44:45', '2021-08-11 15:44:45'),
(19, '6', 2, 'gagasgasg', '2021-08-11 16:32:45', '2021-08-11 16:32:45'),
(20, '5', 2, 'Hello', '2021-08-11 16:34:35', '2021-08-11 16:34:35'),
(21, '5', 2, 'Okay', '2021-08-11 16:39:25', '2021-08-11 16:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `department`, `priority`, `created_at`, `updated_at`) VALUES
(5, 1, 'Andrew Komolafe', 'test@test.com', 'S-611074', 'This is a test mail', 3, '1', 'High', '2021-08-11 14:00:14', '2021-08-11 16:41:09'),
(6, 1, 'Andrew Komolafe', 'test@test.com', 'S-137833', 'This is a broadcast message', 2, '2', 'Low', '2021-08-11 15:02:07', '2021-08-11 16:32:45'),
(7, 1, 'Andrew Komolafe', 'test@test.com', 'S-388813', 'This is a broadcast message', 3, '2', 'Low', '2021-08-11 15:02:46', '2021-08-11 15:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` int(1) NOT NULL DEFAULT 0,
  `bywho` int(9) DEFAULT NULL,
  `level` int(9) DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `ref`, `bywho`, `level`, `trx`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, '100.00000000', '0.00000000', '100.00000000', '+', 0, NULL, NULL, 'V7BPYZVWRGZV', 'Deposit Via Stripe Storefront', '2021-07-24 22:43:57', '2021-07-24 22:43:57'),
(2, 1, '1002.00000000', '0.00000000', '1102.00000000', '+', 0, NULL, NULL, '7DTTYJRX17TJ', 'Deposit Via Stripe Hosted', '2021-07-24 22:52:13', '2021-07-24 22:52:13'),
(3, 1, '100.00000000', '0.00000000', '1002.00000000', '-', 0, NULL, NULL, 'EHBTY553AMZ7', '100.00 USD Withdraw Via Bank Transfer', '2021-07-25 01:28:13', '2021-07-25 01:28:13'),
(4, 1, '100.00000000', '0.00000000', '902.00000000', '-', 0, NULL, NULL, 'UM84XBVAY299', 'Investment in Bronxe', '2021-07-25 02:17:09', '2021-07-25 02:17:09'),
(5, 1, '100.00000000', '0.00000000', '375.00000000', '-', 0, NULL, NULL, 'U9NBWPZC6BQ6', 'Transfer Fund test1234', '2021-07-28 17:45:24', '2021-07-28 17:45:24'),
(6, 1, '100.00000000', '0.00000000', '575.00000000', '+', 0, NULL, NULL, 'U9NBWPZC6BQ6', 'Fund Receieved From test1234', '2021-07-28 17:45:24', '2021-07-28 17:45:24'),
(7, 1, '100.00000000', '0.00000000', '475.00000000', '-', 0, NULL, NULL, 'XAFNMDYV5S7S', 'Transfer Fund test1234', '2021-07-28 17:46:44', '2021-07-28 17:46:44'),
(8, 1, '100.00000000', '0.00000000', '675.00000000', '+', 0, NULL, NULL, 'XAFNMDYV5S7S', 'Fund Receieved From test1234', '2021-07-28 17:46:45', '2021-07-28 17:46:45'),
(9, 1, '100.00000000', '0.00000000', '575.00000000', '-', 0, NULL, NULL, 'V7SQA9RDUPPO', 'Transfer Fund test1234', '2021-07-28 17:47:09', '2021-07-28 17:47:09'),
(10, 1, '100.00000000', '0.00000000', '775.00000000', '+', 0, NULL, NULL, 'V7SQA9RDUPPO', 'Fund Receieved From test1234', '2021-07-28 17:47:09', '2021-07-28 17:47:09'),
(11, 1, '100.00000000', '0.00000000', '675.00000000', '-', 0, NULL, NULL, 'CVHX7DZSS78V', 'Transfer Fund test1234', '2021-07-28 17:47:25', '2021-07-28 17:47:25'),
(12, 1, '100.00000000', '0.00000000', '875.00000000', '+', 0, NULL, NULL, 'CVHX7DZSS78V', 'Fund Receieved From test1234', '2021-07-28 17:47:25', '2021-07-28 17:47:25'),
(13, 1, '100.00000000', '0.00000000', '775.00000000', '-', 0, NULL, NULL, 'MZQSDNM3GUG8', 'Transfer Fund test1234', '2021-07-28 17:47:50', '2021-07-28 17:47:50'),
(14, 1, '100.00000000', '0.00000000', '975.00000000', '+', 0, NULL, NULL, 'MZQSDNM3GUG8', 'Fund Receieved From test1234', '2021-07-28 17:47:50', '2021-07-28 17:47:50'),
(15, 1, '100.00000000', '0.00000000', '875.00000000', '-', 0, NULL, NULL, 'V1Z1YGVH82HZ', 'Transfer Fund test1234', '2021-07-28 18:18:41', '2021-07-28 18:18:41'),
(16, 1, '100.00000000', '0.00000000', '1075.00000000', '+', 0, NULL, NULL, 'V1Z1YGVH82HZ', 'Fund Receieved From test1234', '2021-07-28 18:18:41', '2021-07-28 18:18:41'),
(17, 1, '100.00000000', '1.00000000', '874.00000000', '-', 0, NULL, NULL, '9ETVSPRAENT4', 'Transfer Fund ToACCESS BANK NIGERIA 0690000040', '2021-07-28 21:02:37', '2021-07-28 21:02:37'),
(18, 1, '100.00000000', '1.00000000', '472.00000000', '-', 0, NULL, NULL, 'SE3ER1UVV32R', 'Transfer Fund ToRoku Bank 876545569876674', '2021-07-28 21:27:55', '2021-07-28 21:27:55'),
(19, 1, '1000.00000000', '11.00000000', '1472.00000000', '+', 0, NULL, NULL, 'RPDF7G', 'Deposit Via Bank Transfer', '2021-08-07 03:07:21', '2021-08-07 03:07:21'),
(20, 3, '100.00000000', '0.00000000', '100.00000000', '+', 0, NULL, NULL, '6PCREO', 'Added Balance Via Admin', '2021-08-07 04:20:33', '2021-08-07 04:20:33'),
(21, 1, '6.00000000', '0.00000000', '51466.00000000', '-', 0, NULL, NULL, '3QMCFM', 'Fund Debited From Wallet To Service Virtual Account Creation', '2021-08-08 01:19:28', '2021-08-08 01:19:28'),
(22, 1, '10.00000000', '0.00000000', '51476.00000000', '+', 0, NULL, NULL, 'MPJEQZ', 'Get Interest From Bronxe', '2021-08-16 17:33:39', '2021-08-16 17:33:39'),
(23, 1, '55714.00000000', '0.00000000', '0.00000000', '-', 0, NULL, NULL, 'ZUUYNZ', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 12:39:13', '2021-08-18 12:39:13'),
(24, 1, '77714.00000000', '0.00000000', '0.00000000', '-', 1, 2, 1, '1BW63E', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 13:19:17', '2021-08-18 13:19:17'),
(25, 1, '-5300.00000000', '0.00000000', '5500.00000000', '-', 1, 3, 1, 'M7D8XR', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 14:03:01', '2021-08-18 14:03:01'),
(26, 1, '-16300.00000000', '0.00000000', '21800.00000000', '-', 0, NULL, NULL, 'WRSNKZ', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 14:16:52', '2021-08-18 14:16:52'),
(27, 1, '-27300.00000000', '0.00000000', '49100.00000000', '-', 0, NULL, NULL, 'VVQKMD', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 14:18:40', '2021-08-18 14:18:40'),
(28, 1, '43800.00000000', '0.00000000', '5300.00000000', '-', 0, NULL, NULL, '58CCS3', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 14:27:10', '2021-08-18 14:27:10'),
(29, 1, '5300.00000000', '0.00000000', '0.00000000', '-', 0, NULL, NULL, 'OUVF4P', 'Fund Debited From Wallet To Service Loan Repayment', '2021-08-18 14:27:54', '2021-08-18 14:27:54'),
(30, 1, '100.00000000', '0.00000000', '20100.00000000', '+', 0, NULL, NULL, 'QMGJBZ', 'Savings Credited To Wallet On Due Date', '2021-08-18 15:47:17', '2021-08-18 15:47:17'),
(31, 1, '100.00000000', '0.00000000', '20000.00000000', '-', 0, NULL, NULL, 'YSZ3Z6', 'Fund Debited From Wallet To Service Recurrent Savings', '2021-08-18 16:03:14', '2021-08-18 16:03:14'),
(32, 1, '100.00000000', '0.00000000', '20000.00000000', '-', 0, NULL, NULL, 'X93RAG', 'Fund Debited From Wallet To Service Recurrent Savings', '2021-08-18 16:04:24', '2021-08-18 16:04:24'),
(33, 1, '100.00000000', '0.00000000', '20000.00000000', '-', 0, NULL, NULL, 'ENEZKO', 'Fund Debited From Wallet To Service Recurrent Savings', '2021-08-18 16:06:26', '2021-08-18 16:06:26'),
(34, 1, '100.00000000', '0.00000000', '19900.00000000', '-', 0, NULL, NULL, '3AHFT1', 'Fund Debited From Wallet To Service Recurrent Savings', '2021-08-18 16:06:44', '2021-08-18 16:06:44'),
(35, 1, '100.00000000', '0.00000000', '19800.00000000', '-', 0, NULL, NULL, 'YU7SBG', 'Fund Debited From Wallet To Service Recurrent Savings', '2021-08-18 16:08:26', '2021-08-18 16:08:26'),
(36, 1, '10.00000000', '0.00000000', '20110.00000000', '+', 0, NULL, NULL, 'RPBMA4', 'Get Interest From Bronxe', '2021-08-18 16:11:16', '2021-08-18 16:11:16'),
(37, 1, '100.00000000', '0.00000000', '20010.00000000', '-', 0, NULL, NULL, 'X1UB9D', 'Transfer Fund test1234', '2021-08-18 16:14:53', '2021-08-18 16:14:53'),
(38, 1, '100.00000000', '0.00000000', '20210.00000000', '+', 0, NULL, NULL, 'X1UB9D', 'Fund Receieved From test1234', '2021-08-18 16:14:53', '2021-08-18 16:14:53'),
(39, 1, '100.00000000', '0.00000000', '20110.00000000', '-', 0, NULL, NULL, 'VMECU6', 'Transfer Fund to 1140683120', '2021-08-18 16:50:48', '2021-08-18 16:50:48'),
(40, 1, '100.00000000', '0.00000000', '100.00000000', '+', 0, NULL, NULL, 'VMECU6', 'Fund Receieved From 5656476563', '2021-08-18 16:50:48', '2021-08-18 16:50:48'),
(41, 1, '10.00000000', '0.00000000', '20120.00000000', '+', 0, NULL, NULL, 'QBJAR2', 'Deposit Via Paystack', '2021-09-10 14:33:08', '2021-09-10 14:33:08'),
(42, 1, '100.00000000', '0.00000000', '20020.00000000', '-', 0, NULL, NULL, 'KG1TPJ', 'Investment in Bronxe', '2021-09-16 10:42:39', '2021-09-16 10:42:39'),
(43, 1, '100.00000000', '0.00000000', '19920.00000000', '-', 0, NULL, NULL, '4OC2JZ', 'Investment in Bronxe', '2021-09-16 10:43:39', '2021-09-16 10:43:39'),
(44, 1, '100.00000000', '0.00000000', '19820.00000000', '-', 0, NULL, NULL, '1WXOSS', 'Investment in Bronxe', '2021-09-16 10:45:09', '2021-09-16 10:45:09'),
(45, 1, '100.00000000', '0.00000000', '19620.00000000', '-', 0, NULL, NULL, 'BKM77E', 'Investment in Reg Saver', '2021-09-16 10:58:21', '2021-09-16 10:58:21'),
(46, 1, '100.00000000', '0.00000000', '19620.00000000', '+', 0, NULL, NULL, 'D8AKRT', 'Added Compounding Balance Via Admin', '2021-09-16 11:12:24', '2021-09-16 11:12:24'),
(47, 1, '50.00000000', '0.00000000', '19670.00000000', '-', 0, NULL, NULL, 'U98ZSY', '50.00 USD Withdraw From Compounding Wallet ', '2021-09-16 12:21:15', '2021-09-16 12:21:15'),
(48, 1, '50.00000000', '0.00000000', '19720.00000000', '-', 0, NULL, NULL, '5VCJBK', '50.00 USD Withdraw From Compounding Wallet ', '2021-09-16 12:21:41', '2021-09-16 12:21:41'),
(49, 1, '100.00000000', '0.00000000', '19620.00000000', '-', 0, NULL, NULL, '7AA8HU', 'Investment in Bronxe', '2021-09-16 15:37:15', '2021-09-16 15:37:15'),
(50, 1, '100.00000000', '0.00000000', '19520.00000000', '-', 0, NULL, NULL, 'N6C9KN', 'Investment in Bronxe', '2021-09-16 15:37:49', '2021-09-16 15:37:49'),
(51, 1, '100.00000000', '0.00000000', '19620.00000000', '-', 0, NULL, NULL, 'GDRPFB', '100.00 USD Withdraw From Compounding Wallet ', '2021-09-16 15:47:43', '2021-09-16 15:47:43'),
(52, 1, '100.00000000', '0.00000000', '19720.00000000', '-', 0, NULL, NULL, '9WMUFT', '100.00 USD Withdraw From Compounding Wallet ', '2021-09-16 15:49:37', '2021-09-16 15:49:37'),
(53, 1, '100.00000000', '0.00000000', '19820.00000000', '-', 0, NULL, NULL, 'DM9GK7', '100.00 USD Withdraw From Compounding Wallet ', '2021-09-16 15:53:38', '2021-09-16 15:53:38'),
(54, 1, '100.00000000', '0.00000000', '19920.00000000', '-', 0, NULL, NULL, 'MGZ18T', '100.00 USD Withdraw From Compounding Wallet ', '2021-09-16 15:54:46', '2021-09-16 15:54:46'),
(55, 1, '56.00000000', '0.00000000', '19976.00000000', '-', 0, NULL, NULL, '547T73', '56.00 USD Withdraw From Compounding Wallet ', '2021-09-16 15:55:02', '2021-09-16 15:55:02'),
(56, 1, '100.00000000', '0.00000000', '20176.00000000', '-', 0, NULL, NULL, 'PEJYR6', '100.00 USD Withdraw From Referral Bonus Wallet ', '2021-09-16 16:32:48', '2021-09-16 16:32:48'),
(57, 1, '200.00000000', '0.00000000', '20376.00000000', '-', 0, NULL, NULL, '22W7ZP', '200.00 USD Withdraw From Referral Bonus Wallet ', '2021-09-16 16:33:05', '2021-09-16 16:33:05'),
(58, 1, '100.00000000', '0.00000000', '20476.00000000', '-', 0, NULL, NULL, 'U2V6WF', '100.00 USD Withdraw From Investment rRturn Wallet ', '2021-09-16 16:33:15', '2021-09-16 16:33:15'),
(59, 1, '200.00000000', '0.00000000', '20676.00000000', '-', 0, NULL, NULL, 'M4XHB4', '200.00 USD Withdraw From Compounding Wallet ', '2021-09-16 16:33:26', '2021-09-16 16:33:26'),
(60, 9, '100.00000000', '0.00000000', '0.00000000', '+', 0, NULL, NULL, 'A5B65N', 'Credited Compounding Balance By Admin', '2021-09-16 17:28:55', '2021-09-16 17:28:55'),
(61, 9, '30.00000000', '0.00000000', '0.00000000', '+', 0, NULL, NULL, 'APPVVC', 'Credited Compounding Balance By Admin', '2021-09-16 17:29:17', '2021-09-16 17:29:17'),
(62, 9, '500.00000000', '0.00000000', '0.00000000', '+', 0, NULL, NULL, 'CU7TUB', 'Credited Compounding Balance By Admin', '2021-09-16 17:29:29', '2021-09-16 17:29:29'),
(63, 1, '100.00000000', '0.00000000', '20576.00000000', '-', 0, NULL, NULL, '9WEF1X', 'Investment in Bronxe', '2021-09-16 19:44:47', '2021-09-16 19:44:47'),
(64, 15, '100.00000000', '0.00000000', '9999900.00000000', '-', 0, NULL, NULL, '91S5OS', 'Investment in Bronxe', '2021-11-17 13:19:31', '2021-11-17 13:19:31'),
(65, 18, '200.00000000', '0.00000000', '0.00000000', '-', 0, NULL, NULL, 'UC9ABM', 'Investment in Reg Saver', '2021-11-17 15:19:20', '2021-11-17 15:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `method_id`, `user_id`, `amount`, `charge`, `trx`, `details`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '100', NULL, 'U9NBWPZC6BQ6', 'test1234', NULL, 1, '2021-07-28 17:45:23', '2021-07-28 17:45:23'),
(2, 1, 1, '100', NULL, 'XAFNMDYV5S7S', 'test1234', NULL, 1, '2021-07-28 17:46:44', '2021-07-28 17:46:44'),
(3, 1, 1, '100', NULL, 'V7SQA9RDUPPO', 'test1234', NULL, 1, '2021-07-28 17:47:09', '2021-07-28 17:47:09'),
(4, 1, 1, '100', NULL, 'CVHX7DZSS78V', 'test1234', NULL, 1, '2021-07-28 17:47:25', '2021-07-28 17:47:25'),
(5, 1, 1, '100', NULL, 'MZQSDNM3GUG8', 'test1234', NULL, 1, '2021-07-28 17:47:50', '2021-07-28 17:47:50'),
(6, 1, 1, '100', NULL, 'V1Z1YGVH82HZ', 'test1234', NULL, 1, '2021-07-28 18:18:41', '2021-07-28 18:18:41'),
(7, 2, 1, '100', '1', '9ETVSPRAENT4', 'Bank Name: ACCESS BANK NIGERIA<br>\n        Account Name: Alexis Sanchez<br>\n        Account Number:  0690000040<br>\n        Narration: Fund Transfer', NULL, 1, '2021-07-28 21:02:37', '2021-07-28 21:02:37'),
(8, 2, 1, '100', '1', 'KCJDK2DGBK3V', 'Bank Name: Roku Bank<br>\n        Account Name: Adekunle Gold<br>\n        Account Number:  876545569876674<br>\n        Swift Code:  FANG676<br>\n        Narration: Other Bank Transfer', NULL, 1, '2021-07-28 21:27:04', '2021-07-28 21:27:04'),
(9, 2, 1, '100', '1', 'SE3ER1UVV32R', 'Bank Name: Roku Bank<br>\n        Account Name: Adekunle Gold<br>\n        Account Number:  876545569876674<br>\n        Swift Code:  FANG676<br>\n        Narration: Other Bank Transfer', 'MTN Not Valid', 1, '2021-07-28 21:27:55', '2021-08-08 02:47:14'),
(10, 1, 1, '100', NULL, 'X1UB9D', 'test1234', NULL, 1, '2021-08-18 16:14:53', '2021-08-18 16:14:53'),
(11, 1, 1, '100', NULL, 'VMECU6', '1140683120', NULL, 1, '2021-08-18 16:50:48', '2021-08-18 16:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_beneficiaries`
--

CREATE TABLE `transfer_beneficiaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfer_beneficiaries`
--

INSERT INTO `transfer_beneficiaries` (`id`, `method_id`, `user_id`, `details`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '08098989898 Komolafe (dfsdgsdsgsdgs)', 1, '2021-08-18 16:50:48', '2021-08-18 16:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middlename` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `usdbalance` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `compound` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ref_bonus` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `invest_return` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `invest_returnusd` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc` int(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `account_number`, `email`, `country_code`, `mobile`, `ssn`, `employment`, `income`, `dob`, `ref_by`, `balance`, `usdbalance`, `compound`, `ref_bonus`, `invest_return`, `invest_returnusd`, `password`, `image`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `kyc`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'askjgdjsah', NULL, '235235235', '2134132sad', '9124183343', 'a@f.co', NULL, '234523235', NULL, NULL, NULL, NULL, 0, '10923.00000000', '0.00', '0', '0', '0', NULL, '$2y$10$SUvY0P78v1yT3PL8tMIVr.itmKKlE18y8GJYKlix0ESZ96eHrHGOO', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, 0, NULL, '2021-09-16 13:42:20', '2021-09-16 13:42:20'),
(15, 'Andrew', 'James', 'Komolafe', 'test1234', '9978935800', 'ibrauyyuihim@gmail.com', 'NG', '2340809898989876', '79865432', 'Not Employeds', 'Unemployments', '2021-10-26', 0, '9999900.00000000', '0.00', '0', '0', '0', NULL, '$2y$10$By2PixBvqD/qAjPMaXmfqOTfK26VqmWwGjo6vhMmVpPCQGMk30406', NULL, '{\"address\":\"2, Adekunle Agedegudu\",\"state\":\"Lagos\",\"zip\":\"234\",\"country\":\"Nigeria\",\"city\":\"Ajule\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, 0, NULL, '2021-10-23 19:56:33', '2021-11-17 13:19:31'),
(16, 'Adekhnle', 'qwewqewqqw', 'vasjsaf', 'wqewqewqeqw', '5189825213', 'superadmin@demo.comaas', 'AT', '4303532623623123', NULL, 'Student', 'Bank', '2021-11-24', 0, '0.00000000', '0.00', '0', '0', '0', NULL, '$2y$10$31PyV4c0venHDdwhDj.ZYeq0ug2GLiaJFynRruQlOBV9qkDVlcHxe', NULL, '{\"address\":\"Bankkk\",\"state\":\"2342\",\"zip\":\"2141212\",\"country\":\"Austria\",\"city\":\"wqewqewqeqw\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, 0, NULL, '2021-11-01 09:31:08', '2021-11-01 09:34:38'),
(17, 'Adekunle', NULL, 'Best', 'test1234343', '4644814712', 'test1234@test1234.com', NULL, '928034712', NULL, NULL, NULL, NULL, 0, '0.00000000', '0.00', '0', '0', '0', NULL, '$2y$10$8y7quPOsgjX5lBOOCC0Ay.6f7FRfbDIE5LQ7roeNHnDRDAbBNtAx6', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, 0, NULL, '2021-11-17 06:35:33', '2021-11-17 06:35:33'),
(18, 'asfas', NULL, 'asfs', '221421412', '7732713352', 'a@a.cojsd', NULL, '3214214121', NULL, NULL, NULL, NULL, 0, '0.00000000', '0.00', '0', '0', '0', NULL, '$2y$10$pk/y6cy4I1y52oJCYDlEIOQbHXOgGo1fRgquX022wREVVmlzvb/XW', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, 0, NULL, '2021-11-17 15:07:30', '2021-11-17 15:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 14:27:56', '2021-07-24 14:27:56'),
(2, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 15:00:54', '2021-07-24 15:00:54'),
(3, 2, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 15:46:59', '2021-07-24 15:46:59'),
(4, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 16:30:44', '2021-07-24 16:30:44'),
(5, 3, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 16:59:03', '2021-07-24 16:59:03'),
(6, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 16:59:33', '2021-07-24 16:59:33'),
(7, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-24 17:35:09', '2021-07-24 17:35:09'),
(8, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-25 11:28:07', '2021-07-25 11:28:07'),
(9, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-25 18:06:28', '2021-07-25 18:06:28'),
(10, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-26 11:23:32', '2021-07-26 11:23:32'),
(11, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-27 19:09:49', '2021-07-27 19:09:49'),
(12, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-28 16:16:37', '2021-07-28 16:16:37'),
(13, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-29 01:22:13', '2021-07-29 01:22:13'),
(14, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-29 14:29:53', '2021-07-29 14:29:53'),
(15, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-30 11:03:21', '2021-07-30 11:03:21'),
(16, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-07-30 17:28:11', '2021-07-30 17:28:11'),
(17, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-07 02:58:56', '2021-08-07 02:58:56'),
(18, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-07 13:36:46', '2021-08-07 13:36:46'),
(19, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-07 21:32:31', '2021-08-07 21:32:31'),
(20, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-08 23:08:08', '2021-08-08 23:08:08'),
(21, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-10 14:02:51', '2021-08-10 14:02:51'),
(22, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-11 11:18:51', '2021-08-11 11:18:51'),
(23, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-16 17:12:33', '2021-08-16 17:12:33'),
(24, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-18 12:42:21', '2021-08-18 12:42:21'),
(25, 4, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-18 16:45:35', '2021-08-18 16:45:35'),
(26, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-18 16:48:51', '2021-08-18 16:48:51'),
(27, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-18 21:01:57', '2021-08-18 21:01:57'),
(28, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-08-20 12:10:47', '2021-08-20 12:10:47'),
(29, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-10 14:31:00', '2021-09-10 14:31:00'),
(30, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 10:39:22', '2021-09-16 10:39:22'),
(31, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:37:33', '2021-09-16 13:37:33'),
(32, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:37:33', '2021-09-16 13:37:33'),
(33, 5, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:20:20', '2021-09-16 13:20:20'),
(34, 6, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:36:12', '2021-09-16 13:36:12'),
(35, 7, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:42:20', '2021-09-16 13:42:20'),
(36, 8, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:43:13', '2021-09-16 13:43:13'),
(37, 9, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 13:43:51', '2021-09-16 13:43:51'),
(38, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 15:36:44', '2021-09-16 15:36:44'),
(39, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-16 19:42:38', '2021-09-16 19:42:38'),
(40, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-18 12:19:14', '2021-09-18 12:19:14'),
(41, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-09-18 13:57:18', '2021-09-18 13:57:18'),
(42, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-19 06:31:23', '2021-10-19 06:31:23'),
(43, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-19 06:53:22', '2021-10-19 06:53:22'),
(44, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-19 12:43:31', '2021-10-19 12:43:31'),
(45, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-19 21:45:10', '2021-10-19 21:45:10'),
(46, 10, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-20 19:25:06', '2021-10-20 19:25:06'),
(47, 11, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-23 19:23:39', '2021-10-23 19:23:39'),
(48, 12, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-23 19:29:10', '2021-10-23 19:29:10'),
(49, 13, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-23 19:30:20', '2021-10-23 19:30:20'),
(50, 14, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-23 19:38:25', '2021-10-23 19:38:25'),
(51, 15, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-10-23 19:56:33', '2021-10-23 19:56:33'),
(52, 16, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-11-01 09:31:08', '2021-11-01 09:31:08'),
(53, 17, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-11-17 06:35:34', '2021-11-17 06:35:34'),
(54, 15, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Mac OS X', '2021-11-17 12:34:32', '2021-11-17 12:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_cards`
--

CREATE TABLE `virtual_cards` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `status` int(2) NOT NULL,
  `reference` text DEFAULT NULL,
  `masked_pan` text DEFAULT NULL,
  `card_type` varchar(80) DEFAULT NULL,
  `name_on_card` varchar(90) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` varchar(77) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `virtual_cards`
--

INSERT INTO `virtual_cards` (`id`, `user_id`, `status`, `reference`, `masked_pan`, `card_type`, `name_on_card`, `created_at`, `updated_at`) VALUES
(4, 1, 2, '1684db3e-da3d-48f7-a825-0a56ef115a41', '556338*******8221', 'mastercard', 'Andrew Komolafe', '2021-08-07 20:54:17', '2021-08-08 02:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `amount`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '100.00000000', 'USD', '1.00000000', '0.00000000', 'EHBTY553AMZ7', '100.00000000', '100.00000000', '{\"account_name\":{\"field_name\":\"Adekunle Gold\",\"type\":\"text\"},\"account_number\":{\"field_name\":\"1242512512\",\"type\":\"text\"},\"bank_name\":{\"field_name\":\"FCMB\",\"type\":\"text\"}}', 1, 'asfsagasg', '2021-07-25 00:43:45', '2021-08-07 03:40:09'),
(2, 1, 1, '100.00000000', 'USD', '1.00000000', '0.00000000', 'AQOV6A', '100.00000000', '100.00000000', NULL, 0, NULL, '2021-09-16 15:53:16', '2021-09-16 15:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `delay` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `image`, `min_limit`, `max_limit`, `delay`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `user_data`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bank Transfer', '60fc6da3a5c551627155875.png', '1.00000000', '100000.00000000', '3', '0.00000000', '1.00000000', '0.00', 'USD', '{\"account_name\":{\"field_name\":\"account_name\",\"field_level\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"field_name\":\"account_number\",\"field_level\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"bank_name\":{\"field_name\":\"bank_name\",\"field_level\":\"Bank Name\",\"type\":\"text\",\"validation\":\"required\"}}', '<br>', 1, '2021-07-25 00:14:37', '2021-08-07 03:30:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabletvbundles`
--
ALTER TABLE `cabletvbundles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_topics`
--
ALTER TABLE `contact_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptotrxes`
--
ALTER TABLE `cryptotrxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptowallets`
--
ALTER TABLE `cryptowallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internetbundles`
--
ALTER TABLE `internetbundles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycsettings`
--
ALTER TABLE `kycsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_pays`
--
ALTER TABLE `loan_pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_plans`
--
ALTER TABLE `loan_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `networks`
--
ALTER TABLE `networks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_timer`
--
ALTER TABLE `plan_timer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `powers`
--
ALTER TABLE `powers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saving_pays`
--
ALTER TABLE `saving_pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_beneficiaries`
--
ALTER TABLE `transfer_beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_cards`
--
ALTER TABLE `virtual_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cabletvbundles`
--
ALTER TABLE `cabletvbundles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `contact_topics`
--
ALTER TABLE `contact_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cryptotrxes`
--
ALTER TABLE `cryptotrxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cryptowallets`
--
ALTER TABLE `cryptowallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `internetbundles`
--
ALTER TABLE `internetbundles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kycsettings`
--
ALTER TABLE `kycsettings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loan_pays`
--
ALTER TABLE `loan_pays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `loan_plans`
--
ALTER TABLE `loan_plans`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `networks`
--
ALTER TABLE `networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plan_timer`
--
ALTER TABLE `plan_timer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `powers`
--
ALTER TABLE `powers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saving_pays`
--
ALTER TABLE `saving_pays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transfer_beneficiaries`
--
ALTER TABLE `transfer_beneficiaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `virtual_cards`
--
ALTER TABLE `virtual_cards`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
