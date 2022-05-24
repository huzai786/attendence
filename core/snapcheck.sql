-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2020 at 08:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exacthrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `a_id` int(11) NOT NULL,
  `a_facility_id` int(11) NOT NULL,
  `a_name` varchar(150) NOT NULL COMMENT 'Name',
  `a_description` text NOT NULL COMMENT 'Description',
  `a_added` datetime NOT NULL,
  `a_updated` datetime NOT NULL,
  `a_created_by` int(11) NOT NULL,
  `a_updated_by` int(11) NOT NULL,
  `a_is_deleted` char(1) NOT NULL,
  `a_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `comp_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable',
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `permissions` text NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `activation_key` varchar(255) NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `facility_manager` varchar(120) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `user_name`, `pwd`, `full_name`, `comp_name`, `email`, `phone`, `status`, `date_created`, `last_modified`, `last_login`, `ip`, `user_agent`, `permissions`, `user_role_id`, `activation_key`, `is_deleted`, `facility_manager`, `facility_id`, `salary`) VALUES
(1, 'admin', '4297f44b13955235245b2497399d7a93', 'Talib Allauddin', NULL, 'talib_570@live.com', '', 'Enable', '2015-06-14 23:32:08', '2019-03-20 07:01:06', '2020-11-18 09:27:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '', 1, '', '0', '', 0, 0),
(2, 'shahzaibali', '4297f44b13955235245b2497399d7a93', 'Shahzaib Ali', NULL, 'shahzaib.ali@machotics.com', '03131234567', 'Enable', '2020-11-11 18:20:22', '2020-11-14 12:14:27', '2020-11-16 12:03:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '', 4, '', '0', '', 1, 25000),
(3, 'dileepkumar', '4297f44b13955235245b2497399d7a93', 'Dileep Kumar', NULL, 'dileep@gmail.com', '03131234567', 'Enable', '2020-11-11 18:28:06', NULL, NULL, NULL, NULL, '', 4, '', '0', '', 1, 18000),
(4, 'saeed', '4297f44b13955235245b2497399d7a93', 'Muhammad Saeed', NULL, 'msaeed@gmail.com', '03131234567', 'Enable', '2020-11-13 17:04:43', '2020-11-13 17:15:00', '2020-11-17 09:58:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '', 5, '', '0', '', 1, 0),
(5, 'abrar', '4297f44b13955235245b2497399d7a93', 'Abrar', NULL, 'abrar@gmail.com', '03131234567', 'Enable', '2020-11-14 17:42:55', NULL, '2020-11-17 09:57:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '', 6, '', '0', '', 3, 0),
(6, 'talha', '4297f44b13955235245b2497399d7a93', 'Muhammad Talha', NULL, 'mtalha@gmail.com', '03131234567', 'Enable', '2020-11-13 17:04:43', '2020-11-13 17:15:00', '2020-11-17 15:29:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '', 3, '', '0', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `a_price` varchar(8) NOT NULL,
  `a_deduction_type` varchar(6) NOT NULL,
  `a_deduction_rate` varchar(10) NOT NULL,
  `a_created_on` datetime NOT NULL,
  `a_created_by` int(11) NOT NULL,
  `a_modified_on` datetime NOT NULL,
  `a_modified_by` int(11) NOT NULL,
  `a_status` varchar(15) NOT NULL,
  `a_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`a_id`, `a_name`, `a_price`, `a_deduction_type`, `a_deduction_rate`, `a_created_on`, `a_created_by`, `a_modified_on`, `a_modified_by`, `a_status`, `a_is_deleted`) VALUES
(1, 'Shoes', '3500', '%', '10%', '2020-11-11 17:40:04', 1, '0000-00-00 00:00:00', 0, 'Enable', '0'),
(2, 'Gun', '75000', '%', '25%', '2020-11-11 17:40:27', 1, '0000-00-00 00:00:00', 0, 'Enable', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('08d2f85094da95edfb9929faaf08cf58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 1605683911, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-17 17:10:50\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('0cf8c036d96d59e3cf7dca390c8266bf', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605534658, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-16 16:03:07\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('2cf50d344a12c8e9dd9063df193c7359', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605360295, 'a:14:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-14 15:02:08\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";s:8:\"per_page\";s:2:\"50\";}'),
('2e0a79e5b4a373fd7103ef8c8fb40653', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', 1605101385, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-11 15:30:57\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('52c47feb0100c40fc80879a8239b1791', '192.168.18.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605261815, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-13 10:32:12\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('5569ccaf95b2e10351b256d5768871a1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605189036, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-12 11:44:45\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('6b2e05fd175bd7ea8f62d40bbde868f1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605513609, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"talha\";s:15:\"admin_full_name\";s:14:\"Muhammad Talha\";s:8:\"admin_id\";s:1:\"6\";s:10:\"last_login\";s:19:\"2020-11-16 11:47:27\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"3\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2427:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"rolemanagement\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reports\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"site\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"expenses\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"items\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"issue\":\"false\"},\"stocks\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"accounts\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeepayroll\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"relations\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reminders\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"client\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"title\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"gholidays\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"doctype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"article\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:10:\"Supervisor\";}'),
('8fdb74f2fed6a6e2eca42276e203c0af', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605519435, ''),
('b3930384c780c1957fc8729ee0284228', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605184418, 'a:14:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-12 10:47:26\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";s:8:\"per_page\";s:1:\"0\";}'),
('b5f2556816e67207c3ef26fc4b20d781', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 1605615034, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-17 15:30:24\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('c70b665213d0bee945d0a82a32659dfb', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605269691, 'a:14:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-13 14:54:30\";s:7:\"last_ip\";s:14:\"192.168.18.215\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";s:8:\"per_page\";s:1:\"0\";}'),
('cb915d5102c1dc71c442c88a96a2e6c1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605586955, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-16 18:54:23\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('d4af76d0140cb4c38f439f559f099e2f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 1605614131, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-17 09:59:09\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}'),
('deb08fdb81e1a179e4aad5e53011f956', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 1605260899, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-12 17:34:12\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}');
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('ea1df1c33162025aaf73f1a7bd22dd72', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', 1605102136, 'a:13:{s:9:\"user_data\";s:0:\"\";s:10:\"admin_auth\";s:5:\"allow\";s:10:\"admin_role\";N;s:15:\"admin_user_name\";s:5:\"admin\";s:15:\"admin_full_name\";s:15:\"Talib Allauddin\";s:8:\"admin_id\";s:1:\"1\";s:10:\"last_login\";s:19:\"2020-11-11 17:24:46\";s:7:\"last_ip\";s:3:\"::1\";s:12:\"user_role_id\";s:1:\"1\";s:11:\"facility_id\";s:1:\"0\";s:10:\"permission\";s:2432:\"{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}\";s:14:\"doctor_role_id\";N;s:10:\"role_title\";s:11:\"Super Admin\";}');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(120) NOT NULL,
  `client_logo` text NOT NULL,
  `client_address1` text NOT NULL,
  `client_address2` text NOT NULL,
  `client_city` varchar(60) NOT NULL,
  `client_state` varchar(60) NOT NULL,
  `client_country` varchar(80) NOT NULL,
  `client_zipcode` varchar(9) NOT NULL,
  `client_contract_date` datetime NOT NULL,
  `client_contract_end_date` datetime NOT NULL,
  `client_referred_by` varchar(80) NOT NULL,
  `client_referred_by_cnic` varchar(512) DEFAULT NULL,
  `client_referred_by_phone` varchar(512) DEFAULT NULL,
  `client_referred_by_mobile` varchar(512) DEFAULT NULL,
  `client_referred_by_email` varchar(512) DEFAULT NULL,
  `client_referred_by_home_address` varchar(512) DEFAULT NULL,
  `client_referred_by_office_address` varchar(512) DEFAULT NULL,
  `client_status` varchar(15) NOT NULL,
  `client_added` datetime NOT NULL,
  `client_created_by` int(11) NOT NULL,
  `client_updated` datetime NOT NULL,
  `client_updated_by` int(11) NOT NULL,
  `client_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `client_name`, `client_logo`, `client_address1`, `client_address2`, `client_city`, `client_state`, `client_country`, `client_zipcode`, `client_contract_date`, `client_contract_end_date`, `client_referred_by`, `client_referred_by_cnic`, `client_referred_by_phone`, `client_referred_by_mobile`, `client_referred_by_email`, `client_referred_by_home_address`, `client_referred_by_office_address`, `client_status`, `client_added`, `client_created_by`, `client_updated`, `client_updated_by`, `client_is_deleted`) VALUES
(1, 'Bank Al Habib', 'bankalhabib.jpg', 'Gulshan', 'Gulshan', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01 00:00:00', '2029-12-31 00:00:00', 'Zeeshan', '4210155511777', '03131234568', '03131234567', 'zeeshan@gmail.com', 'Gulshan', 'Gulshan', 'Enabled', '2020-11-11 17:28:27', 1, '0000-00-00 00:00:00', 0, '0'),
(2, 'Faisal Bank', 'faisalbank.png', 'Gulshan', 'Gulshan', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01 00:00:00', '2029-12-31 00:00:00', 'Ali', '4210155511113', '03131234560', '03131234569', 'ali@gmail.com', 'Gulshan', 'Gulshan', 'Enabled', '2020-11-11 17:33:25', 1, '0000-00-00 00:00:00', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(40) NOT NULL,
  `d_created_on` datetime NOT NULL,
  `d_created_by` int(11) NOT NULL,
  `d_modified_on` datetime NOT NULL,
  `d_modified_by` int(11) NOT NULL,
  `d_status` varchar(15) NOT NULL,
  `d_is_deleted` char(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`d_id`, `d_name`, `d_created_on`, `d_created_by`, `d_modified_on`, `d_modified_by`, `d_status`, `d_is_deleted`, `parent_id`) VALUES
(1, 'IT', '2020-11-11 17:26:07', 1, '0000-00-00 00:00:00', 0, 'Enabled', '0', NULL),
(2, 'Networking', '2020-11-11 17:26:13', 1, '0000-00-00 00:00:00', 0, 'Enabled', '0', NULL),
(3, 'Accounts', '2020-11-11 17:26:17', 1, '0000-00-00 00:00:00', 0, 'Enabled', '0', NULL),
(4, 'Cleaning Services', '2020-11-11 17:26:23', 1, '0000-00-00 00:00:00', 0, 'Enabled', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `dt_id` int(11) NOT NULL,
  `dt_name` varchar(30) NOT NULL,
  `dt_created_on` datetime NOT NULL,
  `dt_created_by` int(11) NOT NULL,
  `dt_modified_on` datetime NOT NULL,
  `dt_modified_by` int(11) NOT NULL,
  `dt_status` varchar(15) NOT NULL,
  `dt_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`dt_id`, `dt_name`, `dt_created_on`, `dt_created_by`, `dt_modified_on`, `dt_modified_by`, `dt_status`, `dt_is_deleted`) VALUES
(1, 'CNIC', '2020-11-11 17:25:23', 1, '0000-00-00 00:00:00', 0, 'Enable', '0'),
(2, 'License', '2020-11-11 17:25:36', 1, '2020-11-11 17:25:52', 1, 'Enable', '0');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `emp_first_name` varchar(100) NOT NULL,
  `emp_last_name` varchar(100) DEFAULT NULL,
  `emp_police_verification` varchar(100) NOT NULL,
  `emp_cnic` varchar(15) NOT NULL,
  `emp_passport_no` varchar(11) NOT NULL,
  `emp_religion` varchar(50) NOT NULL,
  `emp_dob` datetime NOT NULL,
  `emp_doj` datetime NOT NULL,
  `emp_dot` datetime DEFAULT NULL,
  `emp_termination_reason` varchar(512) DEFAULT NULL,
  `emp_reffered_by` varchar(50) NOT NULL,
  `emp_reffered_by_cnic` varchar(512) DEFAULT NULL,
  `emp_reffered_by_mobile` varchar(512) DEFAULT NULL,
  `emp_reffered_by_phone` varchar(512) DEFAULT NULL,
  `emp_reffered_by_email` varchar(512) DEFAULT NULL,
  `emp_reffered_by_home_address` varchar(512) DEFAULT NULL,
  `emp_reffered_by_office_address` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2` varchar(50) NOT NULL,
  `emp_reffered_by_2_cnic` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2_mobile` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2_phone` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2_email` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2_home_address` varchar(512) DEFAULT NULL,
  `emp_reffered_by_2_office_address` varchar(512) DEFAULT NULL,
  `emp_eobi_no` int(11) NOT NULL,
  `emp_marital_status` varchar(100) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `emp_gender` varchar(50) NOT NULL,
  `emp_blood_group` varchar(50) NOT NULL,
  `emp_phone` varchar(50) NOT NULL,
  `emp_phone_2` varchar(50) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_email_2` varchar(100) NOT NULL,
  `emp_mobile` varchar(50) NOT NULL,
  `emp_mobile_2` varchar(50) NOT NULL,
  `emp_age` int(11) NOT NULL,
  `emp_status` varchar(50) DEFAULT NULL,
  `emp_department_id` int(11) NOT NULL,
  `emp_designation_id` int(11) NOT NULL,
  `emp_created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `emp_created_by` varchar(50) NOT NULL,
  `emp_modified_on` datetime NOT NULL,
  `emp_modified_by` varchar(50) NOT NULL,
  `emp_is_active` int(11) NOT NULL,
  `emp_is_delete` int(11) NOT NULL,
  `emp_picture` text DEFAULT NULL,
  `emp_id_mark` varchar(15) NOT NULL,
  `emp_gratuity_fun` varchar(15) NOT NULL,
  `emp_provident_fund` varchar(15) NOT NULL,
  `emp_facility_id` int(11) NOT NULL,
  `emp_monthly_article_deduction` int(11) NOT NULL,
  `emp_account_title` varchar(120) NOT NULL,
  `emp_bank_branch_name` varchar(30) DEFAULT NULL,
  `emp_bank_branch_code` varchar(30) DEFAULT NULL,
  `emp_account_number` varchar(30) NOT NULL,
  `emp_user_id` int(11) NOT NULL,
  `emp_encoding` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `title_id`, `emp_first_name`, `emp_last_name`, `emp_police_verification`, `emp_cnic`, `emp_passport_no`, `emp_religion`, `emp_dob`, `emp_doj`, `emp_dot`, `emp_termination_reason`, `emp_reffered_by`, `emp_reffered_by_cnic`, `emp_reffered_by_mobile`, `emp_reffered_by_phone`, `emp_reffered_by_email`, `emp_reffered_by_home_address`, `emp_reffered_by_office_address`, `emp_reffered_by_2`, `emp_reffered_by_2_cnic`, `emp_reffered_by_2_mobile`, `emp_reffered_by_2_phone`, `emp_reffered_by_2_email`, `emp_reffered_by_2_home_address`, `emp_reffered_by_2_office_address`, `emp_eobi_no`, `emp_marital_status`, `emp_no`, `emp_gender`, `emp_blood_group`, `emp_phone`, `emp_phone_2`, `emp_email`, `emp_email_2`, `emp_mobile`, `emp_mobile_2`, `emp_age`, `emp_status`, `emp_department_id`, `emp_designation_id`, `emp_created_on`, `emp_created_by`, `emp_modified_on`, `emp_modified_by`, `emp_is_active`, `emp_is_delete`, `emp_picture`, `emp_id_mark`, `emp_gratuity_fun`, `emp_provident_fund`, `emp_facility_id`, `emp_monthly_article_deduction`, `emp_account_title`, `emp_bank_branch_name`, `emp_bank_branch_code`, `emp_account_number`, `emp_user_id`, `emp_encoding`) VALUES
(1, 0, 'Shahzaib', NULL, 'yes', '4210155511447', 'VS566123', 'Islam', '1997-04-24 00:00:00', '2020-01-01 00:00:00', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 325610, 'Single', 0, 'Male', 'B+', '03131234567', '03131234567', 'shahzaib.ali@machotics.com', 'shahzaib.ali@machotics.com', '03131234567', '03131234567', 23, 'Published', 1, 4, '2020-11-11 18:20:22', '1', '2020-11-14 12:32:25', '1', 1, 0, 'profile-placeholder.png', '351352', '10', '10', 1, 10, 'SHAHZAIB ALI', 'Bank Al Habib Nazimabad', '1104', '11041104555777', 2, NULL),
(2, 0, 'Dileep', NULL, 'no', '4210155599667', 'SD563214', 'Hinduism', '1995-01-01 00:00:00', '2020-01-01 00:00:00', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 6542, 'Single', 0, 'Male', 'B+', '03131234567', '03131234567', 'dileep@gmail.com', 'dileep@gmail.com', '03131234567', '03131234567', 25, 'Published', 1, 4, '2020-11-11 18:28:06', '1', '2020-11-12 11:02:14', '1', 1, 0, 'profile-placeholder1.png', '369852', '10', '10', 1, 10, 'DILEEP KUMAR', 'Faisal Bank Gulshan Branch', '1410', '14101410555777', 3, NULL),
(3, 0, 'Ali', NULL, 'yes', '4210199988777', 'DS632145', 'Islam', '1997-04-01 00:00:00', '2020-11-01 00:00:00', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 235, 'Single', 0, 'Male', 'B+', '03131234567', '03131234567', 'alikhan@gmail.com', 'alikhan@gmail.com', '03131234567', '03131234567', 23, 'Published', 3, 4, '2020-11-14 11:49:47', '1', '2020-11-14 12:32:44', '1', 1, 0, NULL, '325412', '10', '10', 4, 10, 'ALI KHAN', 'Faisal Bank Gulshan', '1140', '11401140321654', 6, NULL),
(5, 0, 'Kashif', 'Ali', '', '4210155511477', 'SD55656', 'Islam', '2000-01-01 00:00:00', '2020-11-17 00:00:00', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'Single', 0, 'Male', 'A+', '03131324687', '', '', '', '', '', 20, 'Published', 2, 4, '2020-11-17 15:28:04', '1', '0000-00-00 00:00:00', '', 1, 0, NULL, '', '', '', 2, 0, '', '', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

CREATE TABLE `employee_address` (
  `ea_id` int(11) NOT NULL,
  `ea_emp_id` int(11) NOT NULL,
  `ea_type` int(10) NOT NULL,
  `ea_city` varchar(40) NOT NULL,
  `ea_state` varchar(10) NOT NULL,
  `ea_zipcode` varchar(15) NOT NULL,
  `ea_address1` text NOT NULL,
  `ea_address2` text NOT NULL,
  `ea_is_deleted` char(1) NOT NULL,
  `ea_modified_on` datetime NOT NULL,
  `ea_modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_address`
--

INSERT INTO `employee_address` (`ea_id`, `ea_emp_id`, `ea_type`, `ea_city`, `ea_state`, `ea_zipcode`, `ea_address1`, `ea_address2`, `ea_is_deleted`, `ea_modified_on`, `ea_modified_by`) VALUES
(1, 1, 0, 'Karachi', 'Sindh', '74600', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(2, 1, 1, 'Karachi', 'Sindh', '74600', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(3, 2, 0, 'Karachi', 'Sindh', '74500', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(4, 2, 1, 'Karachi', 'Sindh', '74500', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(5, 3, 0, 'Karachi', 'Sindh', '74600', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(6, 3, 1, 'Karachi', 'Sindh', '74600', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(7, 4, 0, '0', '', '', '', '', '0', '0000-00-00 00:00:00', 0),
(8, 4, 1, '0', '', '', '', '', '0', '0000-00-00 00:00:00', 0),
(9, 4, 0, '0', '', '', '', '', '0', '0000-00-00 00:00:00', 0),
(10, 4, 1, '0', '', '', '', '', '0', '0000-00-00 00:00:00', 0),
(11, 5, 0, 'Attock', 'Punjab', '47600', 'Gulshan', 'Gulshan', '0', '0000-00-00 00:00:00', 0),
(12, 5, 1, '0', '', '', '', '', '0', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_article`
--

CREATE TABLE `employee_article` (
  `ea_id` int(11) NOT NULL,
  `ea_employee_id` int(11) NOT NULL,
  `ea_return_status` varchar(100) DEFAULT NULL,
  `ea_article_id` int(11) NOT NULL,
  `ea_price` int(11) NOT NULL,
  `ea_deduction_type` varchar(15) NOT NULL,
  `ea_deduction_rate` varchar(9) NOT NULL,
  `ea_created_on` datetime NOT NULL,
  `ea_created_by` int(11) NOT NULL,
  `ea_is_deleted` char(1) NOT NULL,
  `ea_modified_on` datetime NOT NULL,
  `ea_modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_article`
--

INSERT INTO `employee_article` (`ea_id`, `ea_employee_id`, `ea_return_status`, `ea_article_id`, `ea_price`, `ea_deduction_type`, `ea_deduction_rate`, `ea_created_on`, `ea_created_by`, `ea_is_deleted`, `ea_modified_on`, `ea_modified_by`) VALUES
(1, 1, 'used', 2, 75000, '%', '25%', '2020-11-11 18:20:22', 1, '0', '0000-00-00 00:00:00', 0),
(2, 2, 'used', 1, 3500, '%', '10%', '2020-11-11 18:28:06', 1, '0', '0000-00-00 00:00:00', 0),
(3, 2, 'used', 2, 75000, '%', '25%', '2020-11-11 18:28:06', 1, '0', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_article_remaining`
--

CREATE TABLE `employee_article_remaining` (
  `ear_id` int(11) NOT NULL,
  `ear_employee_article_id` int(11) NOT NULL,
  `ear_month` int(15) NOT NULL,
  `ear_deduction_amount` int(11) NOT NULL,
  `ear_created_on` datetime NOT NULL,
  `ear_created_by` int(11) NOT NULL,
  `ear_modified_on` datetime NOT NULL,
  `ear_modified_by` int(11) NOT NULL,
  `ear_status` varchar(15) NOT NULL,
  `ear_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `ea_id` int(11) NOT NULL,
  `ea_facility_id` int(11) NOT NULL,
  `ea_employee_id` int(11) NOT NULL COMMENT 'User',
  `ea_checkin` time NOT NULL COMMENT 'Check In',
  `ea_checkout` time NOT NULL COMMENT 'Check Out',
  `ea_attendance` char(1) NOT NULL COMMENT 'Attendance',
  `ea_is_late` int(11) NOT NULL DEFAULT 0,
  `ea_absent_reason` text NOT NULL COMMENT 'Absent Reason',
  `ea_date` date NOT NULL COMMENT 'Date',
  `ea_added` datetime NOT NULL,
  `ea_updated` datetime NOT NULL,
  `ea_created_by` int(11) NOT NULL,
  `ea_updated_by` int(11) NOT NULL,
  `ea_is_deleted` char(1) NOT NULL DEFAULT '0',
  `ea_status` varchar(15) NOT NULL,
  `ea_marked_type` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_attendance`
--

INSERT INTO `employee_attendance` (`ea_id`, `ea_facility_id`, `ea_employee_id`, `ea_checkin`, `ea_checkout`, `ea_attendance`, `ea_is_late`, `ea_absent_reason`, `ea_date`, `ea_added`, `ea_updated`, `ea_created_by`, `ea_updated_by`, `ea_is_deleted`, `ea_status`, `ea_marked_type`) VALUES
(1, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-01', '2020-11-01 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(2, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-01', '2020-11-01 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(3, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-02', '2020-11-02 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(4, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-02', '2020-11-02 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(5, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-03', '2020-11-03 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(6, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-03', '2020-11-03 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(7, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-04', '2020-11-04 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(8, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-04', '2020-11-04 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(9, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-05', '2020-11-05 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(10, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-05', '2020-11-05 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(11, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-06', '2020-11-06 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(12, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-06', '2020-11-06 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(13, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-07', '2020-11-07 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(14, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-07', '2020-11-07 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(15, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-08', '2020-11-08 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(16, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-08', '2020-11-08 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(17, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-09', '2020-11-09 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(18, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-09', '2020-11-09 11:06:03', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(19, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-10', '2020-11-10 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(20, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-10', '2020-11-10 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(21, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-11', '2020-11-11 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(22, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-11', '2020-11-11 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(23, 1, 2, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-12', '2020-11-12 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(24, 1, 1, '10:00:00', '00:00:00', 'p', 0, '', '2020-11-12', '2020-11-12 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(25, 1, 1, '10:28:00', '00:00:00', 'p', 1, '', '2020-11-13', '2020-11-13 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(26, 1, 2, '10:28:00', '00:00:00', 'p', 1, '', '2020-11-13', '2020-11-13 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(29, 1, 1, '18:52:39', '00:00:00', 'a', 0, 'Mark Automatically!', '2020-11-16', '2020-11-16 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(30, 1, 2, '18:52:39', '00:00:00', 'a', 0, 'Mark Automatically!', '2020-11-16', '2020-11-16 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', ''),
(31, 4, 3, '18:52:39', '00:00:00', 'a', 0, 'Mark Automatically!', '2020-11-16', '2020-11-16 00:00:00', '0000-00-00 00:00:00', 1, 0, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_document`
--

CREATE TABLE `employee_document` (
  `ed_id` int(11) NOT NULL,
  `ed_employee_id` int(11) NOT NULL,
  `ed_name` varchar(40) NOT NULL,
  `ed_url` text NOT NULL,
  `ed_type_id` int(11) NOT NULL,
  `ed_expired_on` date DEFAULT NULL,
  `ed_created_on` datetime NOT NULL,
  `ed_created_by` int(11) NOT NULL,
  `ed_modified_on` datetime NOT NULL,
  `ed_modified_by` int(11) NOT NULL,
  `ed_status` varchar(15) NOT NULL,
  `ed_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_document`
--

INSERT INTO `employee_document` (`ed_id`, `ed_employee_id`, `ed_name`, `ed_url`, `ed_type_id`, `ed_expired_on`, `ed_created_on`, `ed_created_by`, `ed_modified_on`, `ed_modified_by`, `ed_status`, `ed_is_deleted`) VALUES
(1, 1, 'Shahzaib CNIC', 'cnic.jpg', 1, '2027-04-24', '2020-11-11 18:20:22', 1, '0000-00-00 00:00:00', 0, 'Published', '0'),
(2, 2, 'Dileep CNIC', 'cnic1.jpg', 1, '2024-06-11', '2020-11-11 18:28:06', 1, '0000-00-00 00:00:00', 0, 'Published', '0');

-- --------------------------------------------------------

--
-- Table structure for table `employee_emergency_contact`
--

CREATE TABLE `employee_emergency_contact` (
  `eec_id` int(11) NOT NULL,
  `eec_name` varchar(80) NOT NULL,
  `eec_relation_id` int(11) NOT NULL,
  `eec_cnic` varchar(18) NOT NULL,
  `eec_passport_no` varchar(30) NOT NULL,
  `eec_phone1` varchar(20) NOT NULL,
  `eec_phone2` varchar(20) NOT NULL,
  `eec_email1` varchar(120) NOT NULL,
  `eec_email2` varchar(120) NOT NULL,
  `eec_mobile1` varchar(20) NOT NULL,
  `eec_mobile2` varchar(20) NOT NULL,
  `eec_modified_on` datetime NOT NULL,
  `eec_modified_by` int(11) NOT NULL,
  `eec_status` varchar(15) NOT NULL,
  `eec_permanent_address` text NOT NULL,
  `eec_temporary_address` text NOT NULL,
  `eec_permanent_address2` text NOT NULL,
  `eec_temporary_address2` text NOT NULL,
  `eec_city1` varchar(40) NOT NULL,
  `eec_city2` varchar(40) NOT NULL,
  `eec_state1` varchar(10) NOT NULL,
  `eec_state2` varchar(10) NOT NULL,
  `eec_zipcode1` varchar(15) NOT NULL,
  `eec_zipcode2` varchar(15) NOT NULL,
  `eec_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_emergency_contact`
--

INSERT INTO `employee_emergency_contact` (`eec_id`, `eec_name`, `eec_relation_id`, `eec_cnic`, `eec_passport_no`, `eec_phone1`, `eec_phone2`, `eec_email1`, `eec_email2`, `eec_mobile1`, `eec_mobile2`, `eec_modified_on`, `eec_modified_by`, `eec_status`, `eec_permanent_address`, `eec_temporary_address`, `eec_permanent_address2`, `eec_temporary_address2`, `eec_city1`, `eec_city2`, `eec_state1`, `eec_state2`, `eec_zipcode1`, `eec_zipcode2`, `eec_employee_id`) VALUES
(1, 'Fakhruddin', 1, '4210155577779', 'XS352166', '03131234567', '03131234567', 'shahzaib.ali@machotics.com', 'shahzaib.ali@machotics.com', '03131234567', '03131234567', '0000-00-00 00:00:00', 0, 'Published', 'Gulshan', 'Gulshan', 'Gulshan', 'Gulshan', 'Karachi', 'Karachi', 'Sindh', 'Sindh', '74600', '74600', 1),
(2, 'Gunesh', 1, '4210155577799', 'FD265322', '03131234567', '03131234567', 'dileep@gmail.com', 'dileep@gmail.com', '03131234567', '03131234567', '0000-00-00 00:00:00', 0, 'Published', 'Gulshan', 'Gulshan', 'Gulshan', 'Gulshan', 'Karachi', 'Karachi', 'Sindh', 'Sindh', '74500', '74500', 2),
(3, 'Abdullah Khan', 1, '4210155577447', 'SA563214', '03131234567', '03131234567', 'alikhan@gmail.com', 'alikhan@gmail.com', '03131234567', '03131234567', '0000-00-00 00:00:00', 0, 'Published', 'Gulshan', 'Gulshan', 'Gulshan', 'Gulshan', 'Karachi', 'Karachi', 'Sindh', 'Sindh', '74600', '74600', 3),
(4, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', 0, 'Published', '', '', '', '', '0', '0', '', '', '', '', 4),
(5, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', 0, 'Published', '', '', '', '', '0', '0', '', '', '', '', 4),
(6, 'Muhammad Ali', 1, '', '', '03131324657', '', '', '', '', '', '0000-00-00 00:00:00', 0, 'Published', '', 'Gulshan', '', 'Gulshan', 'Bahawalnagar', '0', 'Sindh', '', '454968', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee_facility`
--

CREATE TABLE `employee_facility` (
  `ef_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL,
  `deployment_date` datetime DEFAULT NULL,
  `evacuation_date` datetime DEFAULT NULL,
  `deployed_by` int(11) DEFAULT NULL,
  `evacuated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_facility`
--

INSERT INTO `employee_facility` (`ef_id`, `emp_id`, `facility_id`, `deployment_date`, `evacuation_date`, `deployed_by`, `evacuated_by`, `is_deleted`, `status`) VALUES
(1, 1, 1, '2020-01-01 00:00:00', NULL, 1, NULL, 0, NULL),
(2, 2, 1, '2020-01-01 00:00:00', NULL, 1, NULL, 0, NULL),
(3, 3, 4, '2020-10-25 00:00:00', NULL, 1, NULL, 0, NULL),
(4, 4, 0, '2020-11-17 00:00:00', NULL, 1, NULL, 0, NULL),
(5, 4, 0, '2020-11-17 00:00:00', NULL, 1, NULL, 0, NULL),
(6, 5, 1, '2020-11-16 00:00:00', NULL, 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_payroll`
--

CREATE TABLE `employee_payroll` (
  `ep_id` int(11) NOT NULL,
  `ep_employee_id` int(11) NOT NULL COMMENT 'Employee',
  `ep_total_salary` int(11) NOT NULL COMMENT 'Total Salary',
  `ep_net_salary` int(11) NOT NULL COMMENT 'Net Salary',
  `ep_deduction` int(11) NOT NULL COMMENT 'Deduction',
  `ep_commission` int(11) NOT NULL COMMENT 'Commission',
  `ep_month` date NOT NULL COMMENT 'Month',
  `ep_added` datetime NOT NULL,
  `ep_updated` datetime NOT NULL,
  `ep_created_by` int(11) NOT NULL,
  `ep_updated_by` int(11) NOT NULL,
  `ep_is_deleted` char(1) NOT NULL,
  `ep_status` varchar(15) NOT NULL,
  `ep_year` int(11) NOT NULL,
  `ep_provident_fund` int(11) NOT NULL,
  `ep_gratuity_fund` int(11) NOT NULL,
  `ep_bonus` int(11) NOT NULL,
  `ep_eobi_deduction` int(11) NOT NULL,
  `ep_overtime` int(11) DEFAULT NULL,
  `ep_gross_salary` int(11) NOT NULL,
  `ep_daily_overtime` int(11) NOT NULL,
  `ep_cash_advance` int(11) NOT NULL,
  `ep_medical_insurance` int(11) NOT NULL,
  `ep_life_insurance` int(11) NOT NULL,
  `ep_transit_insurance` int(11) NOT NULL,
  `ep_monthly_uniform_deduction` int(11) NOT NULL,
  `ep_sesi` int(11) NOT NULL,
  `ep_amount_withheld` int(11) NOT NULL,
  `ep_amount_released` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `es_id` int(11) NOT NULL,
  `es_employee_id` int(11) NOT NULL,
  `es_salary` int(11) NOT NULL,
  `es_created_on` datetime NOT NULL,
  `es_created_by` int(11) NOT NULL,
  `es_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_salary`
--

INSERT INTO `employee_salary` (`es_id`, `es_employee_id`, `es_salary`, `es_created_on`, `es_created_by`, `es_is_deleted`) VALUES
(1, 1, 25000, '2020-11-11 18:20:22', 1, '0'),
(2, 2, 18000, '2020-11-11 18:28:06', 1, '0'),
(3, 3, 20000, '2020-11-14 11:49:47', 1, '0'),
(4, 4, 0, '2020-11-17 14:21:55', 1, '0'),
(5, 4, 0, '2020-11-17 14:33:38', 1, '0'),
(6, 5, 35000, '2020-11-17 15:28:04', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `employee_supervisor`
--

CREATE TABLE `employee_supervisor` (
  `es_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_supervisor`
--

INSERT INTO `employee_supervisor` (`es_id`, `employee_id`, `supervisor_id`, `created_on`, `created_by`, `is_deleted`) VALUES
(1, 1, 1, '2020-11-11 18:20:22', 1, 0),
(2, 2, 1, '2020-11-11 18:28:06', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `e_id` int(11) NOT NULL,
  `e_facility_id` int(11) NOT NULL,
  `e_account_id` int(11) NOT NULL COMMENT 'Account,foreign,accounts,a_,a_id',
  `e_description` text NOT NULL COMMENT 'Description',
  `e_amount` double NOT NULL COMMENT 'Amount',
  `e_added` datetime NOT NULL,
  `e_updated` datetime NOT NULL,
  `e_created_by` int(11) NOT NULL,
  `e_updated_by` int(11) NOT NULL,
  `e_is_deleted` char(1) NOT NULL,
  `e_status` varchar(15) NOT NULL,
  `e_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL,
  `facility_client_id` int(11) NOT NULL,
  `facility_zone_id` int(11) DEFAULT NULL,
  `facility_supervisor_id` int(11) DEFAULT NULL,
  `facility_name` varchar(150) NOT NULL,
  `facility_manager` varchar(150) NOT NULL,
  `facility_manager_whatsapp` varchar(20) DEFAULT NULL,
  `facility_manager_email` varchar(500) NOT NULL,
  `facility_bom` varchar(150) NOT NULL,
  `facility_bom_whatsapp` varchar(20) NOT NULL,
  `facility_bom_email` varchar(500) NOT NULL,
  `facility_address` text NOT NULL,
  `facility_address2` text NOT NULL,
  `facility_city` varchar(120) NOT NULL,
  `facility_state` varchar(120) NOT NULL,
  `facility_country` varchar(120) NOT NULL,
  `facility_zipcode` varchar(10) NOT NULL,
  `facility_contract_date` date DEFAULT NULL,
  `facility_contract_ended` date NOT NULL,
  `facility_phone1` varchar(20) NOT NULL,
  `facility_phone2` varchar(20) NOT NULL,
  `facility_email1` varchar(120) NOT NULL,
  `facility_email2` varchar(120) NOT NULL,
  `facility_mobile1` varchar(20) NOT NULL,
  `facility_mobile2` varchar(20) NOT NULL,
  `facility_refered_by` varchar(150) NOT NULL,
  `facility_referred_by_cnic` varchar(512) DEFAULT NULL,
  `facility_referred_by_mobile` varchar(512) DEFAULT NULL,
  `facility_referred_by_email` varchar(512) DEFAULT NULL,
  `facility_referred_by_phone` varchar(512) DEFAULT NULL,
  `facility_referred_by_home_address` varchar(512) DEFAULT NULL,
  `facility_referred_by_office_address` varchar(512) DEFAULT NULL,
  `facility_added` datetime NOT NULL,
  `facility_added_by` int(11) NOT NULL,
  `facility_updated` datetime NOT NULL,
  `facility_updated_by` int(11) NOT NULL,
  `facility_deleted` char(1) NOT NULL,
  `facility_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facility_id`, `facility_client_id`, `facility_zone_id`, `facility_supervisor_id`, `facility_name`, `facility_manager`, `facility_manager_whatsapp`, `facility_manager_email`, `facility_bom`, `facility_bom_whatsapp`, `facility_bom_email`, `facility_address`, `facility_address2`, `facility_city`, `facility_state`, `facility_country`, `facility_zipcode`, `facility_contract_date`, `facility_contract_ended`, `facility_phone1`, `facility_phone2`, `facility_email1`, `facility_email2`, `facility_mobile1`, `facility_mobile2`, `facility_refered_by`, `facility_referred_by_cnic`, `facility_referred_by_mobile`, `facility_referred_by_email`, `facility_referred_by_phone`, `facility_referred_by_home_address`, `facility_referred_by_office_address`, `facility_added`, `facility_added_by`, `facility_updated`, `facility_updated_by`, `facility_deleted`, `facility_status`) VALUES
(1, 1, 5, 6, 'Bank Al-Habib Nazimabad Branch', 'Muhammad Ali', '03131234567', '', '', '', '', 'Nazimabad', 'Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01', '2029-12-31', '03131234567', '03131234567', 'bankalhabib_nz@gmail.com', 'bankalhabib_nz@gmail.com', '03131234567', '03131234567', '', '', '', '', '', '', '', '2020-11-11 17:36:52', 1, '2020-11-14 12:22:22', 1, '0', 'Published'),
(2, 1, 5, 6, 'Bank Al-Habib Gulshan Branch', 'Muhammad Shahbaz', '03131234569', '', '', '', '', 'Gulshan', 'Gulshan', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01', '2029-12-31', '03131231234', '03131231234', 'faisalbank_gulshan@gmail.com', 'faisalbank_gulshan@gmail.com', '03131231234', '03131231234', '', '', '', '', '', '', '', '2020-11-11 17:39:04', 1, '2020-11-14 12:22:17', 1, '0', 'Published'),
(3, 1, 5, 6, 'Bank Al-Habib North Nazimabad Branch', 'Zeeshan', '03131234567', '', '', '', '', 'North Nazimabad', 'North Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01', '2029-12-31', '03131234567', '03131234567', 'bankalhabib_nn@gmail.com', 'bankalhabib_nn@gmail.com', '03131234567', '03131234567', '', '', '', '', '', '', '', '2020-11-12 14:39:26', 1, '2020-11-14 12:22:10', 1, '0', 'Published'),
(4, 2, 1, 6, 'Faisal Bank Gulshan Branch', 'Gulbadin', '03131234567', '', '', '', '', 'Gulshan', 'Gulshan', 'Karachi', 'Sindh', 'Pakistan', '74600', '2020-01-01', '2029-12-31', '03131234567', '03131234567', 'faisalbank_gulshan@gmail.com', 'faisalbank_gulshan@gmail.com', '03131234567', '03131234567', '', '', '', '', '', '', '', '2020-11-14 11:52:54', 1, '2020-11-14 12:21:54', 1, '0', 'Published'),
(5, 1, 1, 6, 'Bank Al Habib Johar', 'Shahzaib', '03131324657', 'shahzaib@gmail.com', 'Shahzad', '03131324657', 'shahzad@gmail.com', '', '', 'Karachi', 'Sindh', 'Pakistan', '', '2020-01-01', '2029-12-31', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-17 16:10:57', 1, '0000-00-00 00:00:00', 0, '0', 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `gazetted_holidays`
--

CREATE TABLE `gazetted_holidays` (
  `gh_id` int(11) NOT NULL,
  `gh_date` date NOT NULL,
  `gh_description` text NOT NULL,
  `gh_created_on` datetime NOT NULL,
  `gh_created_by` int(11) NOT NULL,
  `gh_modified_on` datetime NOT NULL,
  `gh_modified_by` int(11) NOT NULL,
  `gh_status` varchar(15) NOT NULL,
  `gh_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `i_id` int(11) NOT NULL,
  `i_facility_id` int(11) NOT NULL,
  `i_name` varchar(160) NOT NULL COMMENT 'Name',
  `i_description` text NOT NULL COMMENT 'Description',
  `i_unit_price` double NOT NULL COMMENT 'Unit Price',
  `i_added` datetime NOT NULL,
  `i_updated` datetime NOT NULL,
  `i_created_by` int(11) NOT NULL,
  `i_updated_by` int(11) NOT NULL,
  `i_is_deleted` char(1) NOT NULL,
  `i_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `p_id` int(11) NOT NULL,
  `p_facility_id` int(11) NOT NULL,
  `p_account_id` int(11) NOT NULL COMMENT 'Account,foreign,accounts,a_,a_id',
  `p_supplier_id` int(11) NOT NULL COMMENT 'Supplier,foreign,suppliers,s_,s_id',
  `p_total` double NOT NULL COMMENT 'Total Amount',
  `p_remaining` double NOT NULL COMMENT 'Remaining',
  `p_paid` double NOT NULL COMMENT 'Paid',
  `p_added` datetime NOT NULL,
  `p_updated` datetime NOT NULL,
  `p_created_by` int(11) NOT NULL,
  `p_updated_by` int(11) NOT NULL,
  `p_is_deleted` char(1) NOT NULL,
  `p_status` varchar(15) NOT NULL,
  `p_remarks` varchar(255) NOT NULL,
  `p_date` date NOT NULL,
  `p_payable` int(11) NOT NULL,
  `p_total_discount_percent` int(11) NOT NULL,
  `p_total_discount_rs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `pd_id` int(11) NOT NULL,
  `pd_facility_id` int(11) NOT NULL,
  `pd_purchase_id` int(11) NOT NULL,
  `pd_item_id` int(11) NOT NULL,
  `pd_qty` int(11) NOT NULL,
  `pd_unit_price` double NOT NULL,
  `pd_added` datetime NOT NULL,
  `pd_updated` datetime NOT NULL,
  `pd_created_by` int(11) NOT NULL,
  `pd_updated_by` int(11) NOT NULL,
  `pd_is_deleted` char(1) NOT NULL,
  `pd_status` varchar(15) NOT NULL,
  `pd_discount_percent` int(11) NOT NULL,
  `pd_discount_rs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(50) NOT NULL,
  `r_status` varchar(15) NOT NULL,
  `r_is_deleted` char(1) NOT NULL,
  `r_created_on` datetime NOT NULL,
  `r_created_by` int(11) NOT NULL,
  `r_modified_on` datetime NOT NULL,
  `r_modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `relative_id` int(11) NOT NULL,
  `relative_name` varchar(50) NOT NULL,
  `relative_created_by` int(11) NOT NULL,
  `relative_created` datetime NOT NULL,
  `relative_updated_by` int(11) NOT NULL,
  `relative_updated` datetime NOT NULL,
  `relative_status` varchar(8) NOT NULL,
  `relative_is_deleted` char(1) NOT NULL,
  `relative_facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`relative_id`, `relative_name`, `relative_created_by`, `relative_created`, `relative_updated_by`, `relative_updated`, `relative_status`, `relative_is_deleted`, `relative_facility_id`) VALUES
(1, 'Father', 1, '2020-11-11 17:26:28', 0, '0000-00-00 00:00:00', 'Enable', '0', 0),
(2, 'Brother', 1, '2020-11-11 17:26:33', 0, '0000-00-00 00:00:00', 'Enable', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `religion_id` int(11) UNSIGNED NOT NULL,
  `religion_name` varchar(50) DEFAULT NULL,
  `religion_created_on` datetime DEFAULT NULL,
  `religion_created_by` int(11) DEFAULT NULL,
  `religion_modified_on` datetime DEFAULT NULL,
  `religion_modified_by` int(11) DEFAULT NULL,
  `religion_is_active` int(11) DEFAULT NULL,
  `religion_is_delete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `r_id` int(11) NOT NULL,
  `r_facility_id` int(11) NOT NULL,
  `r_added` datetime NOT NULL,
  `r_updated` datetime NOT NULL,
  `r_created_by` int(11) NOT NULL,
  `r_updated_by` int(11) NOT NULL,
  `r_is_deleted` char(1) NOT NULL,
  `r_status` varchar(10) NOT NULL,
  `r_remind_on` datetime NOT NULL,
  `r_type` varchar(16) NOT NULL,
  `r_completed` char(1) NOT NULL,
  `r_text` text NOT NULL,
  `r_recurring` char(1) NOT NULL,
  `r_report_to` int(11) NOT NULL,
  `r_priority` varchar(10) NOT NULL,
  `r_lock_after` date NOT NULL,
  `r_assigned_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(120) NOT NULL,
  `r_status` varchar(15) NOT NULL,
  `r_created_by` int(11) NOT NULL,
  `r_updated_by` int(11) NOT NULL,
  `r_added` datetime NOT NULL,
  `r_updated` datetime NOT NULL,
  `r_is_deleted` char(1) NOT NULL,
  `r_facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `facility_id` int(11) NOT NULL,
  `tag_line` varchar(80) NOT NULL,
  `address` varchar(75) NOT NULL,
  `full_address` varchar(130) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tel` varchar(15) NOT NULL,
  `last_attandance_time` time NOT NULL,
  `late_attandance_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `website_title`, `logo`, `website_url`, `facility_id`, `tag_line`, `address`, `full_address`, `tel`, `last_attandance_time`, `late_attandance_time`) VALUES
(1, 'ExactHRMS', 'frontier-courier-service.png', 'http://localhost/exacthrms/', 0, 'A System for HR', 'Gulshan', 'Gulshan', '03131234567', '10:00:00', '10:15:00'),
(2, 'Muhammadi Hospital', 'MHG-Logo-Final.png', 'www.mohammadihospital.com', 1, 'Preventation is better than Cure!', 'Plot No C-53, Shah Jahan Ave, Block 17, Federal B Area, Karachi.', 'Plot No C-53, Shah Jahan Ave, Block 17, Federal B Area, Karachi.', '+92-302-5558485', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `s_id` int(11) NOT NULL,
  `s_facility_id` int(11) NOT NULL,
  `s_item_id` int(11) NOT NULL COMMENT 'Item,foreign,items,i_,i_id',
  `s_qty` int(11) NOT NULL COMMENT 'Quantity',
  `s_min_qty` int(11) NOT NULL COMMENT 'Min. Quantity',
  `s_added` datetime NOT NULL,
  `s_updated` datetime NOT NULL,
  `s_created_by` int(11) NOT NULL,
  `s_updated_by` int(11) NOT NULL,
  `s_is_deleted` char(1) NOT NULL,
  `s_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_release`
--

CREATE TABLE `stock_release` (
  `sr_id` int(11) NOT NULL,
  `sr_facility_id` int(11) NOT NULL,
  `sr_item_id` int(11) NOT NULL COMMENT 'Items,foreign,items,i_,i_id',
  `sr_qty` int(11) NOT NULL COMMENT 'Quantity',
  `sr_issued_to` int(11) NOT NULL COMMENT 'Issued To,foreign,admin_users,,id',
  `sr_description` text NOT NULL COMMENT 'Description',
  `sr_added` datetime NOT NULL,
  `sr_updated` datetime NOT NULL,
  `sr_created_by` int(11) NOT NULL,
  `sr_updated_by` int(11) NOT NULL,
  `sr_is_deleted` char(1) NOT NULL,
  `sr_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subs_plan`
--

CREATE TABLE `subs_plan` (
  `subs_plan_id` int(11) NOT NULL,
  `subs_plan_name` varchar(25) NOT NULL,
  `subs_plan_price` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(150) NOT NULL,
  `s_address` text NOT NULL,
  `s_phone1` varchar(15) NOT NULL,
  `s_contact_person` varchar(120) NOT NULL,
  `s_email` varchar(120) NOT NULL,
  `s_phone2` varchar(15) NOT NULL,
  `s_is_deleted` char(1) NOT NULL,
  `s_added` datetime NOT NULL,
  `s_updated` datetime NOT NULL,
  `s_created_by` int(11) NOT NULL,
  `s_updated_by` int(11) NOT NULL,
  `s_status` varchar(15) NOT NULL,
  `s_facility_id` int(11) NOT NULL,
  `s_payable` int(11) NOT NULL,
  `s_receivable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_employees`
--

CREATE TABLE `temp_employees` (
  `te_id` int(11) NOT NULL,
  `te_first_name` varchar(255) NOT NULL,
  `te_last_name` varchar(255) NOT NULL,
  `te_cnic` varchar(15) NOT NULL,
  `te_attandance` varchar(10) NOT NULL,
  `te_check_in` datetime NOT NULL,
  `te_check_out` datetime DEFAULT NULL,
  `te_facility_id` int(11) NOT NULL,
  `te_supervisor_id` int(11) NOT NULL,
  `te_designation` varchar(256) DEFAULT NULL,
  `te_shift` varchar(256) DEFAULT NULL,
  `te_shift_timing` varchar(256) DEFAULT NULL,
  `te_phone` varchar(20) NOT NULL,
  `te_email` varchar(255) NOT NULL,
  `te_address` varchar(500) NOT NULL,
  `te_image` text DEFAULT NULL,
  `te_salary` varchar(255) NOT NULL,
  `te_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `te_status` int(11) NOT NULL DEFAULT 0,
  `te_is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_employees`
--

INSERT INTO `temp_employees` (`te_id`, `te_first_name`, `te_last_name`, `te_cnic`, `te_attandance`, `te_check_in`, `te_check_out`, `te_facility_id`, `te_supervisor_id`, `te_designation`, `te_shift`, `te_shift_timing`, `te_phone`, `te_email`, `te_address`, `te_image`, `te_salary`, `te_created_at`, `te_status`, `te_is_deleted`) VALUES
(1, 'Kashif', 'Abbas', '4210155577447', 'p', '2020-11-16 10:00:00', NULL, 1, 1, 'Sweeper', 'Day', '9:00 - 6:00', '03131324657', 'kashif@gmail.com', 'Karachi', '', '1200', '2020-11-16 17:36:19', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `title_id` int(11) NOT NULL,
  `title_name` varchar(9) NOT NULL,
  `title_status` varchar(12) NOT NULL,
  `title_created_on` datetime NOT NULL,
  `title_created_by` int(11) NOT NULL,
  `title_modified_on` datetime NOT NULL,
  `title_modified_by` int(11) NOT NULL,
  `title_is_deleted` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `page_id` int(11) NOT NULL,
  `role_title` varchar(150) NOT NULL,
  `permission` text NOT NULL,
  `page_status` enum('Yes','No') NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`page_id`, `role_title`, `permission`, `page_status`, `created_by`, `modified_by`, `date_created`, `date_updated`, `is_deleted`, `facility_id`, `department_id`) VALUES
(1, 'Super Admin', '{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"title\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"gholidays\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"article\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"zone\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}', 'Yes', 1, 1, '2020-03-08 14:37:52', '2020-09-30 17:26:41', '0', 0, 0),
(2, 'Admin', '{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"rolemanagement\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patients\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"profile\":\"true\"},\"reports\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"lab\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"site\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientfiles\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"expenses\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"items\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"issue\":\"true\"},\"stocks\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"accounts\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeepayroll\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"relations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientfacility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"reminders\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"updatestatus\":\"true\"},\"client\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctors\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"procedures\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"invoices\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"healthrecord\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"dentalchart\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"doctortiming\":{\"manage\":\"true\"},\"labtracking\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"worktype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"work\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"tokens\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"roomtype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"room\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"bedtype\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"bed\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"bedpatient\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"roompatient\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientprocedures\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"facilities\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientcase\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"details\":\"true\"},\"treatments\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patienttreatment\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientvisitlog\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientsurgicalnote\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientcaseexaminations\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientoperationrecord\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientcasebirth\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientmedicalhistories\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"patientmedicalcondition\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"}}', 'Yes', 1, 0, '2020-03-08 14:28:07', '2020-03-08 01:28:07', '0', 1, 0),
(3, 'Supervisor', '{\"admins\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\",\"fullaccess\":\"true\"},\"facility\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"rolemanagement\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reports\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"site\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"expenses\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"items\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"issue\":\"false\"},\"stocks\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"accounts\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeepayroll\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeeattendance\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"backup\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"relations\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reminders\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"client\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"title\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"gholidays\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"doctype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"article\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employee\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"true\",\"delete\":\"true\"},\"department\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"}}', 'Yes', 1, 1, '2020-09-10 16:04:57', '2020-09-10 16:07:19', '0', 0, 0),
(4, 'Employee', '{\"admins\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"fullaccess\":\"false\"},\"facility\":{\"create\":\"true\",\"read\":\"true\",\"update\":\"false\",\"delete\":\"false\"},\"rolemanagement\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reports\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"site\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"expenses\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"items\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"issue\":\"false\"},\"stocks\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"accounts\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeepayroll\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeeattendance\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"backup\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"relations\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reminders\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"client\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"title\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"gholidays\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"doctype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"article\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employee\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"department\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"zone\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"}}', 'Yes', 1, 1, '2020-09-19 17:39:27', '2020-11-13 16:42:12', '0', 0, 0),
(5, 'BM', '{\"admins\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"fullaccess\":\"false\"},\"facility\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"rolemanagement\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reports\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"site\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"expenses\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"items\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"issue\":\"false\"},\"stocks\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"accounts\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeepayroll\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeeattendance\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"backup\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"relations\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reminders\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"client\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"title\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"gholidays\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"doctype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"article\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employee\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"department\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"zone\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"}}', 'Yes', 1, 0, '2020-11-13 16:41:53', '0000-00-00 00:00:00', '0', 0, 0),
(6, 'BOM', '{\"admins\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"fullaccess\":\"false\"},\"facility\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"rolemanagement\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reports\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"useractivitylog\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"suppliers\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"site\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"expenses\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"items\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\",\"issue\":\"false\"},\"stocks\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"accounts\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"purchasedetails\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"stockreleases\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeepayroll\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employeeattendance\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"backup\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reporttype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"relations\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"industries\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"professions\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"notes\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"reminders\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"client\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"title\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"gholidays\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"doctype\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"article\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"employee\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"department\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"},\"zone\":{\"create\":\"false\",\"read\":\"false\",\"update\":\"false\",\"delete\":\"false\"}}', 'Yes', 1, 0, '2020-11-13 16:42:03', '0000-00-00 00:00:00', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `z_id` int(11) NOT NULL,
  `z_name` varchar(100) NOT NULL,
  `z_created_on` datetime NOT NULL,
  `z_is_deleted` char(1) NOT NULL,
  `z_status` varchar(15) NOT NULL,
  `z_created_by` int(11) NOT NULL,
  `z_modified_on` datetime NOT NULL,
  `z_modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`z_id`, `z_name`, `z_created_on`, `z_is_deleted`, `z_status`, `z_created_by`, `z_modified_on`, `z_modified_by`) VALUES
(1, 'East', '2020-11-11 17:35:17', '0', 'Enabled', 1, '2020-11-11 17:35:17', 1),
(2, 'West', '2020-11-11 17:35:20', '0', 'Enabled', 1, '2020-11-11 17:35:20', 1),
(3, 'North', '2020-11-11 17:35:25', '0', 'Enabled', 1, '2020-11-11 17:35:25', 1),
(4, 'South', '2020-11-11 17:35:28', '0', 'Enabled', 1, '2020-11-11 17:35:28', 1),
(5, 'Central', '2020-11-11 17:35:34', '0', 'Enabled', 1, '2020-11-11 17:35:34', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`dt_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD PRIMARY KEY (`ea_id`);

--
-- Indexes for table `employee_article`
--
ALTER TABLE `employee_article`
  ADD PRIMARY KEY (`ea_id`);

--
-- Indexes for table `employee_article_remaining`
--
ALTER TABLE `employee_article_remaining`
  ADD PRIMARY KEY (`ear_id`);

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`ea_id`);

--
-- Indexes for table `employee_document`
--
ALTER TABLE `employee_document`
  ADD PRIMARY KEY (`ed_id`);

--
-- Indexes for table `employee_emergency_contact`
--
ALTER TABLE `employee_emergency_contact`
  ADD PRIMARY KEY (`eec_id`);

--
-- Indexes for table `employee_facility`
--
ALTER TABLE `employee_facility`
  ADD PRIMARY KEY (`ef_id`);

--
-- Indexes for table `employee_payroll`
--
ALTER TABLE `employee_payroll`
  ADD PRIMARY KEY (`ep_id`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `employee_supervisor`
--
ALTER TABLE `employee_supervisor`
  ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `gazetted_holidays`
--
ALTER TABLE `gazetted_holidays`
  ADD PRIMARY KEY (`gh_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`relative_id`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`religion_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `stock_release`
--
ALTER TABLE `stock_release`
  ADD PRIMARY KEY (`sr_id`);

--
-- Indexes for table `subs_plan`
--
ALTER TABLE `subs_plan`
  ADD PRIMARY KEY (`subs_plan_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `temp_employees`
--
ALTER TABLE `temp_employees`
  ADD PRIMARY KEY (`te_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`z_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `dt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_address`
--
ALTER TABLE `employee_address`
  MODIFY `ea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_article`
--
ALTER TABLE `employee_article`
  MODIFY `ea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_article_remaining`
--
ALTER TABLE `employee_article_remaining`
  MODIFY `ear_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `ea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `employee_document`
--
ALTER TABLE `employee_document`
  MODIFY `ed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_emergency_contact`
--
ALTER TABLE `employee_emergency_contact`
  MODIFY `eec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_facility`
--
ALTER TABLE `employee_facility`
  MODIFY `ef_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_payroll`
--
ALTER TABLE `employee_payroll`
  MODIFY `ep_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `es_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_supervisor`
--
ALTER TABLE `employee_supervisor`
  MODIFY `es_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gazetted_holidays`
--
ALTER TABLE `gazetted_holidays`
  MODIFY `gh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relation`
--
ALTER TABLE `relation`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `relative_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `religion_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_release`
--
ALTER TABLE `stock_release`
  MODIFY `sr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subs_plan`
--
ALTER TABLE `subs_plan`
  MODIFY `subs_plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_employees`
--
ALTER TABLE `temp_employees`
  MODIFY `te_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `z_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;