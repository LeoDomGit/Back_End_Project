-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2024 at 09:51 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'ATS', 'ats', 1, '2024-06-21 16:08:59', '2024-06-21 23:11:56'),
(3, 'Dr For Skin (Skin Dr)', 'dr-for-skin-skin-dr', 1, '2024-06-21 23:27:32', '2024-06-21 23:27:32'),
(4, 'La Roche Posay', 'la-roche-posay', 1, '2024-06-22 01:42:53', '2024-06-22 01:42:53'),
(5, 'UNO', 'uno', 1, '2024-06-22 01:52:16', '2024-06-22 01:52:16'),
(6, 'Dr.FORHAIR', 'drforhair', 1, '2024-06-22 01:59:43', '2024-06-22 01:59:43'),
(7, 'Blairsom', 'blairsom', 1, '2024-06-22 02:12:23', '2024-06-22 02:12:23'),
(8, 'Davines', 'davines', 1, '2024-06-22 02:22:05', '2024-06-22 02:22:05'),
(9, 'Simple', 'simple', 1, '2024-06-23 00:13:23', '2024-06-23 00:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_customer` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `id_customer`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 1, '2024-06-27 11:16:03', '2024-06-27 11:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_parent` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `id_parent`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dướng tóc', 'duong-toc', NULL, 1, '2024-06-21 05:40:47', '2024-06-21 23:12:12'),
(3, 'Sữa rửa mặt', 'sua-rua-mat', NULL, 1, '2024-06-21 23:24:05', '2024-06-21 23:24:05'),
(4, 'Dưỡng da', 'duong-da', NULL, 1, '2024-06-22 01:41:38', '2024-06-22 01:41:38'),
(5, 'Dầu gội', 'dau-goi', NULL, 1, '2024-06-22 01:58:33', '2024-06-22 01:58:33'),
(6, 'Dầu xả', 'dau-xa', NULL, 1, '2024-06-22 01:58:38', '2024-06-22 01:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone`, `email`, `status`, `created_at`, `updated_at`, `email_verified_at`, `password`, `remember_token`) VALUES
(2, 'Nguyễn Văn A', NULL, NULL, 'leodomsolar@gmail.com', 1, '2024-06-26 09:54:13', '2024-06-26 09:54:13', NULL, '$2y$12$vPdpuorgtBbNvlCFgRJk8OQW8qTWP4LQmB0gmS2wvIx4N7gtdQ366', 'zAoQ47wvoX1TYP3MvyJLVFS5cZTtjyMy6JTatC0C8zMFwL5091V47mHsP78G'),
(3, 'leo', NULL, NULL, 'leodomsolar@gmail.com', 1, '2024-06-26 11:11:51', '2024-06-26 11:11:51', NULL, '$2y$12$zkh9WW7tfBGQ.KGdZRRDg.x/iS8scuLxqbUkA7wCODipbeJM.d4bO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_parent` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`, `id_parent`, `status`, `created_at`, `updated_at`) VALUES
(32, '30SFGO9F-1632369587446-kem-duong-la-roche-posay-effaclar-duo-1.jpg', 8, 0, '2024-06-22 01:51:28', '2024-06-23 19:42:34'),
(33, '30S4DB9A-Capture.jpg', 9, 1, '2024-06-22 01:55:21', '2024-06-23 19:42:41'),
(34, '30SAQA3E-10114695202vn__1__c5e9a1a563cc4fcd908b1ab2e335132c_master.jpg', 10, 1, '2024-06-22 01:58:06', '2024-06-23 19:42:48'),
(35, '30SRLQ6U-1664424012-1000000076_magnify_037.jpg', 11, 1, '2024-06-22 02:01:02', '2024-06-23 19:42:54'),
(36, '30S2OTD2-8809485532660_Dr.forhair_Folligen Silk Shampoo_500ml.jpg', 12, 1, '2024-06-22 02:02:15', '2024-06-23 19:43:01'),
(38, '30SBBGHU-8809485532677_Dr.forhair_Folligen silk treatment_300ml.jpg', 14, 1, '2024-06-22 02:07:22', '2024-06-23 19:43:12'),
(40, '30S00DUZ-1.jpg', 16, 1, '2024-06-22 02:11:16', '2024-06-23 19:43:21'),
(41, '30S344EK-4.jpg', 17, 1, '2024-06-22 02:12:13', '2024-06-23 19:43:26'),
(43, '30SM6YES-Daily-Shampoox350x350x4.jpg', 19, 0, '2024-06-22 02:18:49', '2024-06-23 19:43:35'),
(47, '30SP0HU2-La-Roche-Posay-Effaclar-Purifying-Foaming-Gel-Oily-Sensitive-200ml-200480.jpg', 23, 0, '2024-06-22 02:28:43', '2024-06-23 19:44:04'),
(48, '30SSOA5S-10170190201vn_8b5b3708029544818caba21202410633_grande.jpg', 24, 1, '2024-06-22 02:35:07', '2024-06-23 19:44:09'),
(49, '30S3QNEN-d54776e0-b27b-422c-8731-c94e8cc598dd.jpeg', 25, 1, '2024-06-22 02:36:01', '2024-06-23 19:44:13'),
(50, '30SGDE33-ad723acd-a697-4283-80f5-9eda02f2a278.jpeg', 26, 1, '2024-06-22 02:36:53', '2024-06-23 19:44:18'),
(51, '30SL1NYY-img-2914.jpeg', 27, 1, '2024-06-22 02:40:13', '2024-06-22 21:52:21'),
(59, '30S6283O-3.jpg', 1, 0, '2024-06-23 00:26:27', '2024-06-23 00:26:44'),
(60, '30SR3IDD-2.jpg', 1, 0, '2024-06-23 00:26:27', '2024-06-23 00:26:44'),
(61, '30S9LUM8-1.jpg', 1, 0, '2024-06-23 00:26:27', '2024-06-23 00:26:44'),
(62, '30SF3Q4K-5.jpg', 1, 1, '2024-06-23 00:26:27', '2024-06-23 00:26:44'),
(63, 'Tinh dầu dưỡng tóc Arren Men\'s Grooming 100ml 4.jpg', 2, 1, '2024-06-23 00:31:04', '2024-06-25 03:53:13'),
(64, 'Tinh dầu dưỡng tóc Arren Men\'s Grooming 100ml 3.jpg', 2, 0, '2024-06-23 00:31:04', '2024-06-25 03:53:13'),
(67, '30S23131-u-toc-Davines-Oi-Hair-Butter-1000ml.jpg', 3, 0, '2024-06-23 00:33:46', '2024-06-23 19:41:46'),
(68, '30S9LX64-u-toc-davines-oi-hair-butter-250ml.jpg', 3, 1, '2024-06-23 00:33:46', '2024-06-23 19:41:46'),
(69, 'Kem ủ tóc Davines Oi Hair Butter – 250ml, phục hồi hư tổn, tăng độ bóng mượt.jpg', 3, 0, '2024-06-23 00:34:08', '2024-06-23 19:41:46'),
(70, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML 5.jpeg', 4, 0, '2024-06-23 00:36:35', '2024-06-23 19:41:54'),
(71, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML 4.jpg', 4, 0, '2024-06-23 00:36:35', '2024-06-23 19:41:54'),
(72, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML 3.jpg', 4, 0, '2024-06-23 00:36:35', '2024-06-23 19:41:54'),
(73, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML 2.jpg', 4, 0, '2024-06-23 00:36:35', '2024-06-23 19:41:54'),
(74, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML.jpg', 4, 1, '2024-06-23 00:36:35', '2024-06-23 19:41:54'),
(75, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g 4.jpg', 5, 0, '2024-06-23 00:39:22', '2024-06-23 19:42:07'),
(76, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g 3.jpg', 5, 1, '2024-06-23 00:39:22', '2024-06-23 19:42:07'),
(77, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g 2.jpg', 5, 0, '2024-06-23 00:39:22', '2024-06-23 19:42:07'),
(78, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g.jpg', 5, 0, '2024-06-23 00:39:22', '2024-06-23 19:42:07'),
(80, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus4.jpg', 6, 0, '2024-06-23 00:44:39', '2024-06-23 19:42:18'),
(81, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus3.jpg', 6, 0, '2024-06-23 00:44:39', '2024-06-23 19:42:18'),
(82, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus2.jpg', 6, 1, '2024-06-23 00:44:39', '2024-06-23 19:42:18'),
(84, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus.jpg', 6, 0, '2024-06-23 00:44:59', '2024-06-23 19:42:18'),
(85, 'Xịt khoáng giúp làm dịu da dầu mụn, nhạy cảm La Roche-Posay 4.jpg', 7, 0, '2024-06-23 00:45:29', '2024-06-23 19:42:26'),
(86, 'Xịt khoáng giúp làm dịu da dầu mụn, nhạy cảm La Roche-Posay 3.jpg', 7, 0, '2024-06-23 00:45:29', '2024-06-23 19:42:26'),
(87, 'Xịt khoáng giúp làm dịu da dầu mụn, nhạy cảm La Roche-Posay 2.jpg', 7, 0, '2024-06-23 00:45:29', '2024-06-23 19:42:26'),
(88, 'Xịt khoáng giúp làm dịu da dầu mụn, nhạy cảm La Roche-Posay.jpg', 7, 1, '2024-06-23 00:45:29', '2024-06-23 19:42:26'),
(89, 'Kem giảm mụn mờ thâm sau 12h La Roche-Posay Effaclar Duo+.jpg', 8, 1, '2024-06-23 00:47:20', '2024-06-23 19:42:34'),
(90, 'Kem giảm mụn mờ thâm sau 12h La Roche-Posay Effaclar Duo+ 2.jpg', 8, 0, '2024-06-23 00:47:46', '2024-06-23 19:42:34'),
(91, 'Kem giảm mụn mờ thâm sau 12h La Roche-Posay Effaclar Duo+ 3.jpg', 8, 0, '2024-06-23 00:48:06', '2024-06-23 19:42:34'),
(92, 'Kem đêm Dưỡng ẩm Kiềm dầu 5 trong 1 UNO Cream Perfection 4.jpg', 9, 0, '2024-06-23 00:49:39', '2024-06-23 19:42:41'),
(93, 'Kem đêm Dưỡng ẩm Kiềm dầu 5 trong 1 UNO Cream Perfection 3.jpg', 9, 0, '2024-06-23 00:49:39', '2024-06-23 19:42:41'),
(94, 'Kem đêm Dưỡng ẩm Kiềm dầu 5 trong 1 UNO Cream Perfection 2.jpg', 9, 0, '2024-06-23 00:49:39', '2024-06-23 19:42:41'),
(95, 'Kem ngày Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel 5.jpg', 10, 0, '2024-06-23 00:51:20', '2024-06-23 19:42:48'),
(96, 'Kem ngày Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel 4.jpg', 10, 0, '2024-06-23 00:51:20', '2024-06-23 19:42:48'),
(97, 'Kem ngày Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel 3.jpg', 10, 0, '2024-06-23 00:51:20', '2024-06-23 19:42:48'),
(98, 'Kem ngày Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel 2.jpg', 10, 0, '2024-06-23 00:51:20', '2024-06-23 19:42:48'),
(99, 'Dầu gội giảm rụng tóc và ngăn gàu Dr. For Hair Anti-Dandruff Shampoo 4.jpg', 11, 0, '2024-06-23 00:53:16', '2024-06-23 19:42:54'),
(100, 'Dầu gội giảm rụng tóc và ngăn gàu Dr. For Hair Anti-Dandruff Shampoo 3.jpg', 11, 0, '2024-06-23 00:53:16', '2024-06-23 19:42:54'),
(101, 'Dầu gội giảm rụng tóc và ngăn gàu Dr. For Hair Anti-Dandruff Shampoo 2.jpg', 11, 0, '2024-06-23 00:53:16', '2024-06-23 19:42:54'),
(102, 'Dầu gội phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Shampoo 5.jpg', 12, 0, '2024-06-23 00:55:10', '2024-06-23 19:43:01'),
(103, 'Dầu gội phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Shampoo 4.jpg', 12, 0, '2024-06-23 00:55:10', '2024-06-23 19:43:01'),
(104, 'Dầu gội phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Shampoo 3.jpg', 12, 0, '2024-06-23 00:55:10', '2024-06-23 19:43:01'),
(105, 'Dầu gội phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Shampoo2.jpg', 12, 0, '2024-06-23 00:55:10', '2024-06-23 19:43:01'),
(106, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml 5.png', 13, 0, '2024-06-23 00:57:18', '2024-06-23 19:43:07'),
(107, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml 4.jpg', 13, 0, '2024-06-23 00:57:18', '2024-06-23 19:43:07'),
(108, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml 3.jpg', 13, 0, '2024-06-23 00:57:18', '2024-06-23 19:43:07'),
(109, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml 2.jpg', 13, 1, '2024-06-23 00:57:18', '2024-06-23 19:43:07'),
(110, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml.jpg', 13, 0, '2024-06-23 00:57:18', '2024-06-23 19:43:07'),
(111, 'Dầu xả phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Treatment 5.jpg', 14, 0, '2024-06-23 00:58:29', '2024-06-23 19:43:12'),
(112, 'Dầu xả phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Treatment 4.jpg', 14, 0, '2024-06-23 00:58:29', '2024-06-23 19:43:12'),
(113, 'Dầu xả phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Treatment 3.jpg', 14, 0, '2024-06-23 00:58:29', '2024-06-23 19:43:12'),
(114, 'Dầu xả phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Treatment 2.jpg', 14, 0, '2024-06-23 00:58:29', '2024-06-23 19:43:12'),
(115, 'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy 4.jpg', 15, 0, '2024-06-23 01:00:38', '2024-06-23 19:43:16'),
(116, 'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy 3.jpg', 15, 0, '2024-06-23 01:00:38', '2024-06-23 19:43:16'),
(117, 'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy 2.jpg', 15, 0, '2024-06-23 01:00:38', '2024-06-23 19:43:16'),
(118, 'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy.jpg', 15, 1, '2024-06-23 01:00:38', '2024-06-23 19:43:16'),
(119, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 6.jpg', 16, 0, '2024-06-23 01:03:41', '2024-06-23 19:43:21'),
(120, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 5.jpg', 16, 0, '2024-06-23 01:03:41', '2024-06-23 19:43:21'),
(121, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 4.jpg', 16, 0, '2024-06-23 01:03:41', '2024-06-23 19:43:21'),
(123, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 2.jpg', 16, 0, '2024-06-23 01:03:47', '2024-06-23 19:43:21'),
(124, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 6.jpg', 17, 0, '2024-06-23 01:05:25', '2024-06-23 19:43:26'),
(125, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 5.jpg', 17, 0, '2024-06-23 01:05:25', '2024-06-23 19:43:26'),
(126, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 4.jpg', 17, 0, '2024-06-23 01:05:25', '2024-06-23 19:43:26'),
(128, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml 2.jpg', 17, 0, '2024-06-23 01:05:25', '2024-06-23 19:43:26'),
(129, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml 2.jpeg', 18, 0, '2024-06-23 01:09:21', '2024-06-23 19:43:31'),
(130, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml.jpg', 18, 1, '2024-06-23 01:09:21', '2024-06-23 19:43:31'),
(131, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml4.jpeg', 18, 0, '2024-06-23 01:09:28', '2024-06-23 19:43:31'),
(132, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml3.jpeg', 18, 0, '2024-06-23 01:09:28', '2024-06-23 19:43:31'),
(133, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml4.jpeg', 19, 0, '2024-06-23 01:10:09', '2024-06-23 19:43:35'),
(134, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml3.jpeg', 19, 0, '2024-06-23 01:10:09', '2024-06-23 19:43:35'),
(135, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml 2.jpeg', 19, 0, '2024-06-23 01:10:09', '2024-06-23 19:43:35'),
(136, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml.jpg', 19, 1, '2024-06-23 01:10:09', '2024-06-23 19:43:35'),
(137, 'Tinh dầu dưỡng tóc Davines OI Oil 4.webp', 20, 1, '2024-06-23 01:12:11', '2024-06-23 19:43:53'),
(138, 'Tinh dầu dưỡng tóc Davines OI Oil 3.jpg', 20, 0, '2024-06-23 01:12:11', '2024-06-23 19:43:53'),
(139, 'Tinh dầu dưỡng tóc Davines OI Oil 2.jpg', 20, 0, '2024-06-23 01:12:11', '2024-06-23 19:43:53'),
(140, 'Tinh dầu dưỡng tóc Davines OI Oil.jpg', 20, 0, '2024-06-23 01:12:11', '2024-06-23 19:43:53'),
(141, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml 5.jpg', 21, 1, '2024-06-23 01:14:17', '2024-06-23 19:43:48'),
(142, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml 4.jpg', 21, 0, '2024-06-23 01:14:17', '2024-06-23 19:43:48'),
(143, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml 3.jpg', 21, 0, '2024-06-23 01:14:17', '2024-06-23 19:43:48'),
(144, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml 2.jpg', 21, 0, '2024-06-23 01:14:17', '2024-06-23 19:43:48'),
(145, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml.jpg', 21, 0, '2024-06-23 01:14:17', '2024-06-23 19:43:48'),
(146, 'Gel Davines giảm rụng tóc Energizing 5.webp', 22, 1, '2024-06-23 01:16:30', '2024-06-23 19:43:59'),
(147, 'Gel Davines giảm rụng tóc Energizing 4.jpg', 22, 0, '2024-06-23 01:16:30', '2024-06-23 19:43:59'),
(148, 'Gel Davines giảm rụng tóc Energizing 3.png', 22, 0, '2024-06-23 01:16:30', '2024-06-23 19:43:59'),
(149, 'Gel Davines giảm rụng tóc Energizing 2.jpg', 22, 0, '2024-06-23 01:16:30', '2024-06-23 19:43:59'),
(150, 'Gel rửa mặt cho da dầu mụn, sưng viêm La Roche-Posay 5.webp', 23, 0, '2024-06-23 01:18:35', '2024-06-23 19:44:04'),
(151, 'Gel rửa mặt cho da dầu mụn, sưng viêm La Roche-Posay 4.jpg', 23, 0, '2024-06-23 01:18:35', '2024-06-23 19:44:04'),
(152, 'Gel rửa mặt cho da dầu mụn, sưng viêm La Roche-Posay 3.jpg', 23, 0, '2024-06-23 01:18:35', '2024-06-23 19:44:04'),
(153, 'Gel rửa mặt cho da dầu mụn, sưng viêm La Roche-Posay 2.webp', 23, 1, '2024-06-23 01:18:35', '2024-06-23 19:44:04'),
(154, 'Gel rửa mặt Tạo nhiệt Cấp ẩm Uno Hot Clear Gel 5.jpg', 24, 0, '2024-06-23 01:20:02', '2024-06-23 19:44:09'),
(155, 'Gel rửa mặt Tạo nhiệt Cấp ẩm Uno Hot Clear Gel 4.jpg', 24, 0, '2024-06-23 01:20:02', '2024-06-23 19:44:09'),
(156, 'Gel rửa mặt Tạo nhiệt Cấp ẩm Uno Hot Clear Gel 3.jpg', 24, 0, '2024-06-23 01:20:02', '2024-06-23 19:44:09'),
(157, 'Gel rửa mặt Tạo nhiệt Cấp ẩm Uno Hot Clear Gel 2.jpg', 24, 0, '2024-06-23 01:20:02', '2024-06-23 19:44:09'),
(158, 'Sữa rửa mặt Tạo bọt Sạch nhờn UNO Whip Wash Black 5.gif', 25, 0, '2024-06-23 01:21:42', '2024-06-23 19:44:13'),
(159, 'Sữa rửa mặt Tạo bọt Sạch nhờn UNO Whip Wash Black 4.jpg', 25, 0, '2024-06-23 01:21:42', '2024-06-23 19:44:13'),
(160, 'Sữa rửa mặt Tạo bọt Sạch nhờn UNO Whip Wash Black 3.png', 25, 0, '2024-06-23 01:21:42', '2024-06-23 19:44:13'),
(161, 'Sữa rửa mặt Tạo bọt Sạch nhờn UNO Whip Wash Black2.jpg', 25, 0, '2024-06-23 01:21:42', '2024-06-23 19:44:13'),
(162, 'Sữa rửa mặt Tạo bọt Dạng hạt Sáng da UNO Whip Wash Scrub 4.jpg', 26, 0, '2024-06-23 01:23:25', '2024-06-23 19:44:18'),
(163, 'Sữa rửa mặt Tạo bọt Dạng hạt Sáng da UNO Whip Wash Scrub 3.jpg', 26, 0, '2024-06-23 01:23:25', '2024-06-23 19:44:18'),
(164, 'Sữa rửa mặt Tạo bọt Dạng hạt Sáng da UNO Whip Wash Scrub 2.jpg', 26, 0, '2024-06-23 01:23:25', '2024-06-23 19:44:18'),
(165, 'Sữa rửa mặt Dr. for Skin Charcoal than hoạt tính New 2023 100g Trắng da kiềm dầu 4.jpg', 27, 0, '2024-06-23 01:25:01', '2024-06-23 01:25:01'),
(166, 'Sữa rửa mặt Dr. for Skin Charcoal than hoạt tính New 2023 100g Trắng da kiềm dầu 3.jpg', 27, 0, '2024-06-23 01:25:01', '2024-06-23 01:25:01'),
(167, 'Sữa rửa mặt Dr. for Skin Charcoal than hoạt tính New 2023 100g Trắng da kiềm dầu 2.jpg', 27, 0, '2024-06-23 01:25:01', '2024-06-23 01:25:01'),
(173, 'facebook-dynamic-422210339-1689843735_img_358x358_843626_fit_center.jpg', 2, 0, '2024-06-25 03:08:30', '2024-06-25 03:53:13');

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don`
--

CREATE TABLE `hoa_don` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don_chi_tiet`
--

CREATE TABLE `hoa_don_chi_tiet` (
  `id` bigint UNSIGNED NOT NULL,
  `id_hoa_don` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_19_122048_create_permission_tables', 1),
(5, '2024_06_21_114714_create_categories_table', 2),
(6, '2024_06_21_143443_create_personal_access_tokens_table', 3),
(7, '2024_06_21_145724_update_users_table', 4),
(8, '2024_06_21_163552_update_users_table', 5),
(9, '2024_06_21_223559_create_brands_table', 6),
(10, '2024_06_21_223580_create_products_table', 6),
(11, '2024_06_22_151048_create_slides_table', 6),
(12, '2024_06_24_013826_update_categories_table', 6),
(13, '2024_06_26_130707_create_customers_table', 7),
(14, '2024_06_26_131624_create_carts_table', 8),
(15, '2024_06_26_132602_update_customers_table', 8),
(16, '2024_06_28_081454_create_hoa_don_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin_permissions', NULL, '2024-06-21 07:22:17', '2024-06-22 21:08:22'),
(2, 'staff_permissions', NULL, '2024-06-21 07:22:48', '2024-06-21 07:23:27'),
(3, 'customer_permission', NULL, '2024-06-21 07:24:22', '2024-06-21 07:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'Leo\\Customers\\Models\\Customers', 1, 'CustomerToken', '44084e06ad24115a71eef07ea1db6c691050846fbd07b66e37b63acf27ae1342', '[\"*\"]', NULL, NULL, '2024-06-26 08:20:19', '2024-06-26 08:20:19'),
(2, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '09e43a340acb501c8176da51bd7c426d38a687d2dcfd661debfe0e11bb068084', '[\"*\"]', NULL, NULL, '2024-06-26 11:19:44', '2024-06-26 11:19:44'),
(3, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '705df82f08ac1aa625cb9f9e7ba236aa3b5f99c4f033ccc080f979a03663eaa3', '[\"*\"]', NULL, NULL, '2024-06-26 11:25:13', '2024-06-26 11:25:13'),
(4, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '86bd56ce28c24572d052941fe1c2d0e9164983a63b3c35dd3c4954958cd54117', '[\"*\"]', NULL, NULL, '2024-06-26 12:13:07', '2024-06-26 12:13:07'),
(5, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '6ecd1ec7b19acc68ac3b1716b606e9fe9ed58e3343d038a80bebac69cf62e016', '[\"*\"]', NULL, NULL, '2024-06-27 08:09:41', '2024-06-27 08:09:41'),
(6, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '9318b7f914daa4912077cbabf93fbeb36399d14fbdfacdf67c566e177e4af0d6', '[\"*\"]', NULL, NULL, '2024-06-27 08:22:26', '2024-06-27 08:22:26'),
(7, 'Leo\\Customers\\Models\\Customers', 2, 'CustomerToken', '3f58bfc06d5378a6f9018aee89b305e4a368909dc3b70c771f30314f65da2fc6', '[\"*\"]', NULL, NULL, '2024-06-27 11:15:55', '2024-06-27 11:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `discount` int UNSIGNED NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `idCate` bigint UNSIGNED NOT NULL,
  `idBrand` bigint UNSIGNED NOT NULL,
  `in_stock` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discount`, `content`, `status`, `idCate`, `idBrand`, `in_stock`, `created_at`, `updated_at`) VALUES
(1, 'Tinh dầu dưỡng tóc ATS For man Styling Oil 80ml', 'tinh-dau-duong-toc-ats-for-man-styling-oil-80ml', 550000, 500000, '<p><span style=\"font-size:20px\">L&agrave; sản phẩm chăm s&oacute;c t&oacute;c tự nhi&ecirc;n, c&oacute; c&ocirc;ng dụng cung cấp dưỡng chất v&agrave; độ ẩm cho m&aacute;i t&oacute;c v&agrave; da đầu, trong th&agrave;nh phần của n&oacute; c&oacute; chứa tới hơn 60% l&agrave; bơ v&agrave; dầu hoa tr&agrave;, c&ugrave;ng với đ&oacute; l&agrave; acid amin, vitamin E &amp; độ ẩm, gi&uacute;p cải thiện tối đa t&igrave;nh trạng l&atilde;o h&oacute;a t&oacute;c, đồng thời ngăn ngừa hư tổn hiệu quả tr&ecirc;n t&oacute;c.</span></p>\n\n<p><span style=\"font-size:20px\">Cung cấp độ s&aacute;ng 4.5/5 v&agrave; Điểm Care (mức độ thẩm thấu của dưỡng chất) 5/5. Kh&ocirc;ng chứa Gluten, Para, Paraben (h&oacute;a chất bảo quản c&ocirc;ng nghiệp), Alcohol (cồn) v&agrave; Sulfate (chất tẩy rửa c&ocirc;ng nghiệp). C&oacute; thể sử dụng tr&ecirc;n hầu hết mọi chất t&oacute;c v&agrave; da đầu. Dễ d&agrave;ng thẩm thấu v&agrave;o s&acirc;u ch&acirc;n t&oacute;c, mang lại sự thoải m&aacute;i t&oacute;c người d&ugrave;ng.</span></p>\n\n<p><span style=\"font-size:20px\"><strong>Th&agrave;nh phần:</strong> Hợp chất Hyaluronic gi&uacute;p cung cấp năng lượng, độ ẩm, độ đ&agrave;n hồi v&agrave; độ b&oacute;ng cho m&aacute;i t&oacute;c. Galactomyces đ&acirc;y l&agrave; một loại men rượu tự nhi&ecirc;n c&oacute; gi&aacute; trị cao, chứa nhiều loại axit amin, axit hữu cơ, vitamin, kho&aacute;ng chất gi&uacute;p cho việc nu&ocirc;i dưỡng t&oacute;c ho&agrave;n hảo hơn. CM Plex gi&uacute;p t&aacute;i tạo cấu tr&uacute;c, li&ecirc;n kết của c&aacute;c ph&acirc;n tử sợi t&oacute;c</span></p>', 1, 1, 2, 21, '2024-06-21 23:11:48', '2024-06-25 20:55:30'),
(2, 'Tinh dầu dưỡng tóc Arren Men\'s Grooming 100ml', 'tinh-dau-duong-toc-arren-mens-grooming-100ml', 369000, 360000, '<p>Dầu dưỡng đa năng Arren Multicare cung cấp c&aacute;c th&agrave;nh phần dưỡng t&oacute;c, gi&uacute;p<br />\r\nt&oacute;c b&oacute;ng mềm như &yacute;. Th&iacute;ch hợp cho mọi loại t&oacute;c.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>hướng dẫn sử dụng</p>\r\n\r\n<p>Cho một lượng vừa đủ ra l&ograve;ng b&agrave;n tay rồi thoa đều l&ecirc;n t&oacute;c. Kh&ocirc;ng<br />\r\ncần xả lại với nước.</p>', 1, 1, 2, 200, '2024-06-21 23:14:03', '2024-06-25 03:52:05'),
(3, 'Kem ủ tóc Davines Oi Hair Butter – 250ml, phục hồi hư tổn, tăng độ bóng mượt', 'kem-u-toc-davines-oi-hair-butter-250ml-phuc-hoi-hu-ton-tang-do-bong-muot', 175000, 165000, '<p><span style=\"font-size:20px\">Davines Oi Hair Butter l&agrave; loại một loại kem ủ, hay c&ograve;n gọi l&agrave; mặt nạ, dầu hấp c&oacute; t&aacute;c dụng phục hồi hư tổn chuy&ecirc;n s&acirc;u cho m&aacute;i t&oacute;c, gi&uacute;p t&oacute;c b&oacute;ng, mượt hơn</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px\">Với h&agrave;m lượng dầu Roucou dồi d&agrave;o c&oacute; chứa nhiều Beta-carotene hơn 100 lần so với c&agrave; rốt,vitamin A gi&uacute;p da đầu v&agrave; t&oacute;c khoẻ mạnh, t&aacute;i tạo cấu tr&uacute;c, k&iacute;ch th&iacute;ch sản sinh sắc tố Melanin, giảm hư tổn tế b&agrave;o do tia UV, chống l&atilde;o h&oacute;a, chứa nhiều axit ellatic c&oacute; t&aacute;c dụng trung h&ograve;a c&aacute;c gốc tự do từ đ&oacute; mang lại m&aacute;i t&oacute;c chắc khỏe, kh&ocirc;ng g&atilde;y rụng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sản phẩm th&iacute;ch hợp d&ugrave;ng trong c&aacute;c trị liệu hư tổn v&agrave; chăm s&oacute;c t&oacute;c h&agrave;ng ng&agrave;y</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Kh&ocirc;ng chứa chất bảo quản Parapen v&agrave; chất tạo m&agrave;u, th&acirc;n thiện với m&ocirc;i trường,an to&agrave;n cho cả da đầu nhạy cảm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hương thơm nhẹ nh&agrave;ng, dễ chịu mang lại cảm gi&aacute;c thư th&aacute;i sau mỗi lần d&ugrave;ng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Th&ocirc;ng tin sản phẩm:</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Xuất xứ: Made in Italy</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Dung t&iacute;ch: 250ml</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hạn sử dụng: 3 năm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hướng dẫn sử dụng:</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sau khi gội đầu với dầu gội</span></p>\r\n\r\n<p><span style=\"font-size:20px\">D&ugrave;ng khăn b&ocirc;ng thấm kh&ocirc;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Lấy một lượng kem ủ vừa đủ thoa đều l&ecirc;n t&oacute;c</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Để khoảng 10 đến 15 ph&uacute;t rồi chải đều lại</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Xả sạch lại với nước</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sấy v&agrave; tạo kiểu theo &yacute; mu&ocirc;n</span></p>', 1, 1, 2, 85, '2024-06-21 23:19:23', '2024-06-23 01:29:05'),
(4, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML', 'xit-duong-toc-its-a-10-miracle-leave-in-mem-muot-va-bao-ve-toc-59ml', 327000, 300000, '<p><span style=\"font-size:20px\">Xịt Dưỡng T&oacute;c It&#39;s A Mềm Mượt V&agrave; Bảo Vệ T&oacute;c 10 Miracle Leave-In 120ML</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>C&ocirc;ng dụng:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">Tạm biệt c&aacute;c bước chăm s&oacute;c t&oacute;c cầu k&igrave;, phức tạp! H&atilde;y ch&agrave;o đ&oacute;n người bạn BFF chăm s&oacute;c t&oacute;c mới của bạn, Sản phẩm Xịt dưỡng Miracle Leave-In của ch&uacute;ng t&ocirc;i. Sản phẩm tạo n&ecirc;n thương hiệu đ&igrave;nh đ&aacute;m, loại xịt dễ sử dụng n&agrave;y gi&uacute;p l&agrave;m mượt m&aacute;i t&oacute;c, loại bỏ xoăn rối, phục hồi độ b&oacute;ng v&agrave; tăng cường vẻ đẹp tự nhi&ecirc;n cho t&oacute;c của bạn. Bạn sẽ qu&ecirc;n ngay m&aacute;i t&oacute;c xẹp, hư tổn v&agrave; xỉn m&agrave;u.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><a href=\"https://myphamtocnhapkhau.com/it%E2%80%99s-a-10-my\"><strong>Xịt dưỡng It&#39;s A Miracle Leave-In</strong></a>&nbsp;của ch&uacute;ng t&ocirc;i chứa đầy c&aacute;c th&agrave;nh phần tự nhi&ecirc;n gi&uacute;p mang lại độ s&aacute;ng b&oacute;ng tự nhi&ecirc;n cho mọi loại t&oacute;c, đồng thời l&agrave;m cho t&oacute;c của bạn chắc khỏe hơn qua từng lần sử dụng. T&oacute;c mềm mại, bồng bềnh chưa bao giờ đơn giản hơn thế!</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><img alt=\"\" src=\"https://myphamtocnhapkhau.com/Upload/Editor/2023/4/1/xitduongtocitsamiracleleaveinproduct-66af.jpeg\" /></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>10 C&Ocirc;NG DỤNG TRONG MỖI CHAI:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">1. Nu&ocirc;i dưỡng t&oacute;c&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">2. Bảo vệ chống nhiệt</span></p>\r\n\r\n<p><span style=\"font-size:20px\">3. Gỡ rối&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">4. Chăm s&oacute;c m&agrave;u nhuộm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">5. T&aacute;i tạo độ b&oacute;ng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">6. Giảm thiểu rối x&ugrave;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">7. Bảo vệ chống lại tia UV</span></p>\r\n\r\n<p><span style=\"font-size:20px\">8. Hỗ trợ thay thế những protein bị mất&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">9. Tăng cường độ d&agrave;y th&acirc;n t&oacute;c</span></p>\r\n\r\n<p><span style=\"font-size:20px\">10. Ngăn ngừa chẻ ngọn</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>C&aacute;ch sử dụng:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Gội đầu v&agrave; sử dụng dầu xả t&oacute;c như b&igrave;nh thường.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Khi t&oacute;c bạn vẫn c&ograve;n ẩm, h&atilde;y sử dụng&nbsp;<a href=\"https://myphamtocnhapkhau.com/it%E2%80%99s-a-10-my\"><strong>xịt dưỡng It&rsquo;s a 10</strong></a>. Đối với t&oacute;c ngắn hoặc t&oacute;c lỡ, sử dụng từ 2 đến 3 lần xịt. Đối với t&oacute;c d&agrave;y hoặc d&agrave;i hơn, h&atilde;y sử dụng 4 đến 6 lần xịt.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Gỡ rối t&oacute;c, xịt đều từ ch&acirc;n t&oacute;c đến ngọn t&oacute;c. Sử dụng kỹ thuật ph&ugrave; hợp cho loại t&oacute;c của bạn.<br />\r\nT&oacute;c thẳng hoặc gợn s&oacute;ng - chải t&oacute;c bằng lược gỡ rối nhẹ.<br />\r\nT&oacute;c xoăn - chải t&oacute;c bằng ng&oacute;n tay, v&agrave; n&acirc;ng b&oacute;p để tạo h&igrave;nh c&aacute;c lọn t&oacute;c.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Ho&agrave;n th&agrave;nh th&oacute;i quen chăm s&oacute;c &amp; tạo kiểu t&oacute;c của bạn.</span></p>', 1, 1, 2, 80, '2024-06-21 23:22:59', '2024-06-23 01:29:06'),
(5, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g', 'sua-rua-mat-tram-tra-skindr-tea-tree-100g', 269000, 229000, '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Sữa rửa mặt tr&agrave;m tr&agrave; Skin&amp;Dr Tea tree d&agrave;nh cho nam &ndash; Khắc tinh d&agrave;nh cho da mụn</strong></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><em>Kh&oacute;i bụi, mồ h&ocirc;i, b&atilde; nhờn... l&agrave; những nguy&ecirc;n nh&acirc;n trực tiếp dẫn đến t&igrave;nh trạng b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng, g&acirc;y ra c&aacute;c loại mụn ẩn, mụn trứng c&aacute;, mụn đầu đen... tr&ecirc;n l&agrave;n da nam giới. Vậy l&agrave;m thế n&agrave;o để khắc phục được t&igrave;nh trạng n&agrave;y? Sữa rửa mặt tr&agrave;m tr&agrave; Skin&amp;Dr Tea tree - </em>thuộc thương hiệu <a href=\"https://shop.30shine.com/thuong-hieu/skin-and-dr\" rel=\"noopener noreferrer\" target=\"_blank\">Skin &amp; Dr</a> <em>với khả năng l&agrave;m sạch s&acirc;u, kh&aacute;ng khuẩn v&agrave; kh&ocirc;ng g&acirc;y k&iacute;ch ứng cho da ch&iacute;nh l&agrave; cứu tinh d&agrave;nh cho c&aacute;c &ldquo;đấng m&agrave;y r&acirc;u&rdquo;.</em></span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>4 lợi &iacute;ch tuyệt vời của </strong><strong>sữa rửa mặt Skin Dr tr&agrave;m tr&agrave;</strong></span></span></h2>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Hiệu quả đa chiều cho l&agrave;n da ph&aacute;i mạnh</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">L&agrave;m sạch l&agrave; một bước v&ocirc; c&ugrave;ng quan trọng m&agrave; kh&ocirc;ng ai c&oacute; thể bỏ qua để c&oacute; một l&agrave;n da khỏe mạnh, rạng rỡ. Tuy nhi&ecirc;n, kh&ocirc;ng giống với sự chăm ch&uacute;t của hội chị em, c&aacute;c anh em thường &ldquo;qua loa&rdquo; trong bước n&agrave;y. Thậm ch&iacute; nhiều người nghĩ rằng chỉ cần rửa mặt bằng nước th&ocirc;i l&agrave; đủ.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Điều n&agrave;y dẫn đến việc tạp chất, bụi bẩn kh&ocirc;ng được loại bỏ ho&agrave;n to&agrave;n g&acirc;y b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng, h&igrave;nh th&agrave;nh mụn, vi&ecirc;m v&agrave; c&aacute;c vấn đề kh&aacute;c. V&igrave; vậy, một loại sữa rửa mặt với sức mạnh l&agrave;m sạch da, kh&aacute;ng khuẩn, giảm mụn hiệu quả như Skin&amp;Dr Tea tree xứng đ&aacute;ng được hội anh em &ldquo;rinh&rdquo; ngay cho m&igrave;nh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Sở hữu c&aacute;c th&agrave;nh phần tự nhi&ecirc;n l&agrave;nh t&iacute;nh v&agrave; an to&agrave;n như tinh dầu tr&agrave;m tr&agrave;, chiết xuất từ đu đủ&hellip;, sữa rửa mặt Skin &amp; Dr Tea tree sẽ gi&uacute;p anh em giải quyết hầu hết c&aacute;c vấn đề mụn, vi&ecirc;m, b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng.... một c&aacute;ch nhanh gọn v&agrave; hiệu quả.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>L&agrave;m giảm mụn nhanh&nbsp;</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Những &ldquo;thủ phạm&rdquo; g&acirc;y ra b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng v&agrave; h&igrave;nh th&agrave;nh mụn như: dầu thừa, tế b&agrave;o chết, bụi bẩn, b&atilde; nhờn&hellip; sẽ được Skin&amp;Dr Tea tree &ldquo;đ&aacute;nh bay&rdquo; một c&aacute;ch nhanh ch&oacute;ng. Tất cả l&agrave; nhờ sự kết hợp của tinh dầu tr&agrave;m tr&agrave; v&agrave; Axit Lactobionic. Lỗ ch&acirc;n l&ocirc;ng của anh em sẽ trở n&ecirc;n sạch s&acirc;u, th&ocirc;ng tho&aacute;ng, giảm sự h&igrave;nh th&agrave;nh mụn trứng c&aacute;, mụn vi&ecirc;m v&agrave; giảm sưng đỏ do mụn.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Với Skin&amp;Dr Tea tree, l&agrave;n da kh&ocirc;ng chỉ được l&agrave;m sạch s&acirc;u m&agrave; c&ograve;n được &ldquo;bảo vệ&rdquo; tuyệt đối, bởi sản phẩm c&oacute; th&agrave;nh phần kh&aacute;ng vi&ecirc;m, diệt khuẩn mạnh mẽ. Đặc biệt, Skin&amp;Dr Tea tree v&ocirc; c&ugrave;ng l&agrave;nh t&iacute;nh, kh&ocirc;ng g&acirc;y k&iacute;ch ứng da, kể cả với l&agrave;n da gặp t&igrave;nh trạng mụn nghi&ecirc;m trọng.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Thần dược cải thiện t&igrave;nh trạng da - Khỏe đẹp tự tin, tr&agrave;n trề sức sống</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&ocirc;ng chỉ l&agrave;m sạch da, giảm mụn, sữa rửa mặt Skin&amp;Dr Tea tree c&ograve;n c&oacute; t&aacute;c dụng dưỡng da vượt trội. Anh em sẽ c&oacute; được một l&agrave;n da căng mịn, khỏe khoắn v&agrave; một vẻ ngo&agrave;i tự tin, tr&agrave;n đầy sức sống. Với Skin&amp;Dr Tea tree, l&agrave;n da anh em lu&ocirc;n được cung cấp, duy tr&igrave; độ ẩm đều đặn v&agrave; đảm bảo sự c&acirc;n bằng độ PH tr&ecirc;n da. Anh em sẽ kh&ocirc;ng cần lo ngại t&igrave;nh trạng kh&ocirc; r&iacute;t, bong tr&oacute;c da mặt, kể cả v&agrave;o những ng&agrave;y kh&ocirc; hanh. Hiệu quả n&agrave;y l&agrave; nhờ c&oacute; sự kết hợp của vitamin E, tinh dầu tr&agrave;m tr&agrave; v&agrave; c&aacute;c th&agrave;nh phần tự nhi&ecirc;n l&agrave;nh t&iacute;nh.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">C&aacute;c dưỡng chất trong Skin&amp;Dr Tea tree c&ograve;n tạo n&ecirc;n một lớp m&agrave;ng bảo vệ hiệu quả cho l&agrave;n da, gi&uacute;p chống đỡ mọi t&aacute;c động xấu từ b&ecirc;n ngo&agrave;i như: tia cực t&iacute;m; kh&oacute;i bụi; tạp chất...&nbsp;Đồng thời, sản phẩm cũng hỗ trợ l&agrave;m mờ vết th&acirc;m mụn, dưỡng s&aacute;ng da từ s&acirc;u b&ecirc;n trong. L&agrave;n da anh em sẽ đều m&agrave;u, s&aacute;ng bật tone, đem lại vẻ ngo&agrave;i rạng rỡ, tươi trẻ v&agrave; tr&agrave;n đầy tự tin.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>CHỈ 7 NG&Agrave;Y để c&oacute; được l&agrave;n da mơ ước</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Anh em lo lắng chăm s&oacute;c da phải tốn thời gian d&agrave;i mới cho thấy hiệu quả? Đừng lo! Với t&aacute;c động đa chiều, Skin&amp;Dr Tea tree sẽ r&uacute;t ngắn tối đa quy tr&igrave;nh chăm s&oacute;c da, nhưng vẫn đảm l&agrave;n da khỏe đẹp, trắng s&aacute;ng như mong đợi.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Chỉ sau 7 ng&agrave;y</strong> sử dụng, anh em sẽ cảm nhận r&otilde; rệt sự &ldquo;lột x&aacute;c&rdquo; của l&agrave;n da: giảm mụn, mờ th&acirc;m, trắng s&aacute;ng v&agrave; căng tr&agrave;n sức sống. C&oacute; được l&agrave;n da như &yacute;, anh em c&oacute; thể thỏa sức t&uacute;t t&aacute;t nhan sắc để trở n&ecirc;n tự tin, thu h&uacute;t hơn bao giờ hết!</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><img src=\"https://static.30shine.com/shop-admin/2023/10/04/30S4V5OT-image_2.jpg\" /></span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Trải nghiệm tuyệt vời kh&ocirc;ng thể &ldquo;kh&ocirc;ng thử&rdquo;</strong></span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&ocirc;ng chỉ đem đến những cải thiện r&otilde; rệt đối với l&agrave;n da, Skin&amp;Dr Tea tree chắc chắn c&ograve;n khiến mọi anh em h&agrave;i l&ograve;ng về những trải nghiệm tuyệt vời m&agrave; sản phẩm mang lại.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Dịu nhẹ, &ecirc;m &aacute;i khi sử dụng</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&aacute;c với những sản phẩm sữa rửa mặt nam th&ocirc;ng thường, Skin&amp;Dr Tea tree kh&ocirc;ng c&oacute; th&agrave;nh phần chất tẩy rửa mạnh hay những hạt scrub to g&acirc;y tổn thương, kh&ocirc; r&aacute;t, k&iacute;ch ứng&hellip; da. Với khả năng tạo bọt tuyệt vời c&ugrave;ng kết cấu mỏng nhẹ, sản phẩm đem lại cảm gi&aacute;c dịu nhẹ, thư gi&atilde;n ngay khi vừa sử dụng, nhẹ nh&agrave;ng lấy đi những bụi bẩn, tế b&agrave;o chết&hellip; tr&ecirc;n da.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Thư gi&atilde;n sau ng&agrave;y d&agrave;i mệt mỏi</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">M&ugrave;i thơm nhẹ nh&agrave;ng từ l&aacute; tr&agrave;m tr&agrave; tự nhi&ecirc;n c&oacute; trong Skin&amp;Dr Tea tree đem đến cho anh em cảm gi&aacute;c thư gi&atilde;n v&agrave; m&aacute;t lạnh sảng kho&aacute;i. Kh&ocirc;ng chỉ l&agrave; chăm s&oacute;c da, sử dụng Skin&amp;Dr Tea tree c&ograve;n l&agrave; một bước thư gi&atilde;n v&agrave; tận hưởng tuyệt vời sau một ng&agrave;y d&agrave;i mệt mỏi với nhiều lo &acirc;u, bận rộn&hellip;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Sử dụng </strong><strong>sữa rửa mặt Skin Dr Tea tree</strong><strong> đơn giản - Hiệu quả tối đa</strong></span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Với sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr Tea tree, chỉ cần rửa mặt đều đặn 2 lần/ng&agrave;y v&agrave;o buổi s&aacute;ng v&agrave; tối, anh em chắc chắn sẽ bất ngờ v&igrave; hiệu quả m&agrave; sản phẩm mang lại. 4 bước si&ecirc;u đơn giản khi sử dụng sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 1:</strong> L&agrave;m ướt da mặt bằng nước ấm</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 2:</strong> Cho 1 lượng sản phẩm vừa đủ ra tay, xoa đều để tạo bọt</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 3:</strong> Massage nhẹ nh&agrave;ng da mặt theo chiều từ trong ra ngo&agrave;i</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 4: </strong>Rửa lại bằng nước sạch v&agrave; thấm kh&ocirc; da</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 5: </strong>Để tăng hiệu quả dưỡng da to&agrave;n diện hơn, anh em c&oacute; thể sử dụng th&ecirc;m <a href=\"https://shop.30shine.com/chi-tiet-san-pham/toner-pha-5-lam-sach-va-tai-tao-da-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Control Toner</a> - Toner PHA 5% c&oacute; khả năng l&agrave;m sạch v&agrave; t&aacute;i tạo da v&agrave; <a href=\"https://shop.30shine.com/chi-tiet-san-pham/gel-dac-tri-nhan-mun-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Spot Treatment</a> - d&ograve;ng gel giảm nh&acirc;n mụn hiệu quả. (C&oacute; thể bỏ qua bước n&agrave;y).</span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><img src=\"https://static.30shine.com/shop-admin/2023/10/04/30SZ9HT4-image_4.jpg\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">B&ecirc;n cạnh đ&oacute;, Skin &amp; Dr cũng ph&aacute;t triển th&ecirc;m d&ograve;ng sản phẩm <a href=\"https://shop.30shine.com/chi-tiet-san-pham/sua-rua-mat-than-hoat-tinh-skindr-100g\" rel=\"noopener noreferrer\" target=\"_blank\">sữa rửa mặt than hoạt t&iacute;nh Skin&amp;Dr</a> với c&ocirc;ng dụng l&agrave;m sạch s&acirc;u, tẩy trắng v&agrave; gi&uacute;p kiềm dầu hiệu quả. Anh em c&oacute; thể tham khảo th&ecirc;m.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><em>Một l&agrave;n da sạch sẽ, khỏe mạnh, tươi trẻ kh&ocirc;ng chỉ tăng sự tự tin cho ph&aacute;i mạnh m&agrave; c&ograve;n l&agrave; &ldquo;điểm cộng&rdquo; của c&aacute;c ch&agrave;ng trong mắt những người đối diện. Li&ecirc;n hệ ngay hotline: </em><a href=\"tel:1900272730\"><em>1900.27.27.30</em></a><em> để sở hữu Sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr Tea tree - cải thiện l&agrave;n da, tự tin thu h&uacute;t anh em nh&eacute;!</em></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Th&ocirc;ng tin của sản phẩm sữa rửa mặt nam giới Skin&amp;dr Tr&agrave;m tr&agrave;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Thương hiệu:&nbsp;Skin&amp;Dr&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Dung t&iacute;ch: 100g</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Xuất xứ: H&agrave;n Quốc</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Hạn sử dụng: 2 năm kể từ ng&agrave;y sản xuất</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối: C&ocirc;ng ty TNHH Thương mại v&agrave; Dịch vụ Thi&ecirc;n Uy</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Địa chỉ: 50 Nguyễn Văn Vĩ, Phường 12, Quận T&acirc;n B&igrave;nh, TP Hồ Ch&iacute; Minh</span></span></p>', 1, 3, 3, 80, '2024-06-21 23:29:08', '2024-06-23 01:29:07'),
(6, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus', 'gel-rua-mat-cho-da-dau-mun-dr-for-skin-acsys-plus', 480000, 387000, '<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\">Gel rửa mặt cho da dầu mụn Drforskin Acsys Plus l&agrave; sản phẩm thuộc thương hiệu <a href=\"https://shop.30shine.com/thuong-hieu/skin-and-dr\" rel=\"noopener noreferrer\" target=\"_blank\">Skin Dr</a> đến từ H&agrave;n Quốc.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\"><img src=\"https://static.30shine.com/shop-admin/2023/03/13/30SLQ6DL-AcsysPlus_mild_cleanser_VN_rev.png\" /></span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\">B&ecirc;n cạnh d&ograve;ng gel rửa mặt, Skin Dr c&ograve;n ph&aacute;t triển th&ecirc;m c&aacute;c d&ograve;ng sản phẩm hỗ trợ điều trị c&aacute;c t&igrave;nh trạng da, trong đ&oacute; c&oacute; thể kể đến <a href=\"https://shop.30shine.com/chi-tiet-san-pham/toner-pha-5-lam-sach-va-tai-tao-da-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Control Toner</a> - d&ograve;ng Toner PHA 5% c&oacute; khả năng l&agrave;m sạch v&agrave; t&aacute;i tạo da v&agrave; <a href=\"https://shop.30shine.com/chi-tiet-san-pham/gel-dac-tri-nhan-mun-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Spot Treatment</a> - d&ograve;ng gel chấm mụn.&nbsp;</span></span></p>', 1, 3, 3, 80, '2024-06-21 23:31:17', '2024-06-23 01:29:10'),
(7, 'Xịt khoáng giúp làm dịu da dầu mụn, nhạy cảm La Roche-Posay', 'xit-khoang-giup-lam-diu-da-dau-mun-nhay-cam-la-roche-posay', 495000, 480000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p><strong>Nước xịt kho&aacute;ng l&agrave;m dịu da &amp; giảm b&oacute;ng nhờn cho da dầu mụn La Roche-Posay Serozinc 300ml</strong></p>\r\n\r\n<p>Xịt kho&aacute;ng l&agrave; bước chăm sóc cần thiết cho mọi loại da. Nước xịt kho&aacute;ng l&agrave;m dịu da &amp; giảm b&oacute;ng nhờn cho da dầu mụn La Roche-Posay Serozinc 300ml d&agrave;nh ri&ecirc;ng cho da dầu, da mụn chứa th&agrave;nh phần Kẽm (Zinc) c&oacute; t&aacute;c dụng chống oxy h&oacute;a, điều tiết b&atilde; nhờn, giảm sưng vi&ecirc;m, l&agrave;m dịu v&agrave; phục hồi da. Với nước xịt kho&aacute;ng n&agrave;y bạn c&oacute; thể d&ugrave;ng khi da bị k&iacute;ch ứng, khi vừa cạo r&acirc;u hay c&oacute; thể d&ugrave;ng tr&ecirc;n da của em b&eacute;.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong></p>\r\n\r\n<p>- Dùng nhi&ecirc;̀u l&acirc;̀n trong ngày.</p>\r\n\r\n<p>- Đặt chai nước khoáng song song mặt, cách mặt khoảng 20cm.</p>\r\n\r\n<p>- Xịt đ&ecirc;̀u 1-2 vòng khắp gương mặt.</p>\r\n\r\n<p>- V&ocirc;̃ nhẹ và th&acirc;́m ph&acirc;̀n nước khoáng còn đọng lại bằng bông t&acirc;̉y trang hoặc khăn gi&acirc;́y.</p>\r\n\r\n<h2><strong>Th&agrave;nh phần</strong></h2>\r\n\r\n<p><strong>Nước xịt kho&aacute;ng l&agrave;m dịu da &amp; giảm b&oacute;ng nhờn cho da dầu mụn La Roche-Posay Serozinc 300ml</strong></p>\r\n\r\n<p>Xịt kho&aacute;ng l&agrave; bước chăm sóc cần thiết cho mọi loại da. Nước xịt kho&aacute;ng l&agrave;m dịu da &amp; giảm b&oacute;ng nhờn cho da dầu mụn La Roche-Posay Serozinc 300ml d&agrave;nh ri&ecirc;ng cho da dầu, da mụn chứa th&agrave;nh phần Kẽm (Zinc) c&oacute; t&aacute;c dụng chống oxy h&oacute;a, điều tiết b&atilde; nhờn, giảm sưng vi&ecirc;m, l&agrave;m dịu v&agrave; phục hồi da. Với nước xịt kho&aacute;ng n&agrave;y bạn c&oacute; thể d&ugrave;ng khi da bị k&iacute;ch ứng, khi vừa cạo r&acirc;u hay c&oacute; thể d&ugrave;ng tr&ecirc;n da của em b&eacute;.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong></p>\r\n\r\n<p>- Dùng nhi&ecirc;̀u l&acirc;̀n trong ngày.</p>\r\n\r\n<p>- Đặt chai nước khoáng song song mặt, cách mặt khoảng 20cm.</p>\r\n\r\n<p>- Xịt đ&ecirc;̀u 1-2 vòng khắp gương mặt.</p>\r\n\r\n<p>- V&ocirc;̃ nhẹ và th&acirc;́m ph&acirc;̀n nước khoáng còn đọng lại bằng bông t&acirc;̉y trang hoặc khăn gi&acirc;́y.</p>', 1, 4, 4, 20, '2024-06-22 01:48:16', '2024-06-23 01:29:10'),
(8, 'Kem giảm mụn mờ thâm sau 12h La Roche-Posay Effaclar Duo+', 'kem-giam-mun-mo-tham-sau-12h-la-roche-posay-effaclar-duo', 150000, 120000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p><strong>Kem Dưỡng Da La Roche-Posay Effaclar Duo+ Gi&uacute;p Giảm Mụn, Ngăn Ngừa Vết Th&acirc;m 15ml</strong><br />\r\n<br />\r\nKem Dưỡng Da La Roche-Posay Effaclar Duo+ Gi&uacute;p Giảm Mụn, Giảm Vết Th&acirc;m với c&ocirc;ng thức mới v&agrave; th&agrave;nh phần độc quyền mới, gi&uacute;p chăm s&oacute;c da mụn chuy&ecirc;n biệt với 3 t&aacute;c động: giảm mụn, giảm th&acirc;m v&agrave; giảm mụn t&aacute;i ph&aacute;t. Ngo&agrave;i ra, Duo [+] kh&ocirc;ng l&agrave;m kh&ocirc; da v&igrave; n&oacute; c&oacute; chứa một lượng th&agrave;nh phần dưỡng ẩm đủ để da kh&ocirc;ng bị bong tr&oacute;c, kh&ocirc; căng, da vẫn rất mướt v&agrave; mềm, n&ecirc;n Duo [+] c&ograve;n c&oacute; thể sử dụng như kem l&oacute;t gi&uacute;p bề mặt da l&aacute;ng, mịn m&agrave; kh&ocirc;ng sợ g&acirc;y b&iacute; da.</p>\r\n\r\n<p><strong>Th&agrave;nh phần ch&iacute;nh v&agrave; c&ocirc;ng dụng:&nbsp;</strong><br />\r\n- Kem dưỡng da La Roche-Posay Effaclar Duo+ gi&uacute;p giảm mụn, giảm vết th&acirc;m c&oacute; công thức vượt trội với sự kết hợp của các hoạt ch&acirc;́t trong ng&agrave;nh da liễu như Niacinamide, LHA, Pirotone Olamine giúp giảm viêm, giảm mụn trong v&ograve;ng 12h, thông thoáng l&ocirc;̃ chân lông &amp; làm đ&ecirc;̀u b&ecirc;̀ mặt da.<br />\r\n- Sản phẩm không chứa paraben, không sulfate, không hương liệu &amp; không ch&acirc;́t bảo quản, kh&ocirc;ng chứa x&agrave; ph&ograve;ng, an to&agrave;n cho làn da r&acirc;́t nhạy cảm v&agrave; d&ecirc;̃ kích ứng.<br />\r\n- Hoạt chất độc quy&ecirc;̀n của Viện nghi&ecirc;n cứu La Roche-Posay Procerad&trade; giúp giảm sự xu&acirc;́t hiện của các vết thâm sau mụn v&agrave; Aqua Posae Filiformis gi&uacute;p c&acirc;n bằng hệ vi sinh vật trễn da, gi&uacute;p giảm mụn nhanh hơn &amp; giảm mụn t&aacute;i ph&aacute;t.<br />\r\n- Aqua Posae Filiformis: gi&uacute;p kh&ocirc;i phục v&agrave; c&acirc;n bằng hệ vi sinh vật tr&ecirc;n da<br />\r\n- Niacinamide gi&uacute;p giảm vi&ecirc;m v&agrave; l&agrave;m dịu da.<br />\r\n- Mannose k&iacute;ch th&iacute;ch qu&aacute; tr&igrave;nh t&aacute;i tạo da.<br />\r\n- Hoạt chất LHA c&oacute; trong sản phẩm gi&uacute;p se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng v&agrave; loại bỏ b&atilde; nhờn g&acirc;y tắc nghẽn lỗ ch&acirc;n l&ocirc;ng.<br />\r\n<br />\r\n<strong>Đối tượng sử dụng:</strong><br />\r\nKem dưỡng da La Roche-Posay Effaclar Duo+ gi&uacute;p giảm mụn, giảm vết th&acirc;m d&agrave;nh cho da nhạy cảm, da dầu, da mụn.<br />\r\n<br />\r\n<strong>Hướng&nbsp; dẫn sử dụng:</strong><br />\r\n- Sử dụng hằng ng&agrave;y v&agrave;o buổi s&aacute;ng v&agrave;/hoặc tối sau bước l&agrave;m sạch với gel rửa mặt Effaclar, v&agrave; c&acirc;n bằng &amp; l&agrave;m dịu với nước kho&aacute;ng.<br />\r\n- Thoa một lượng vừa đủ, nhẹ nh&agrave;ng m&aacute;t-xa để kem thấm s&acirc;u v&agrave;o trong da.</p>\r\n\r\n<h2><strong>Th&agrave;nh Phần</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Kem Dưỡng Da La Roche-Posay Effaclar Duo+ Gi&uacute;p Giảm Mụn, Ngăn Ngừa Vết Th&acirc;m 15ml</strong><br />\r\n<br />\r\nKem Dưỡng Da La Roche-Posay Effaclar Duo+ Gi&uacute;p Giảm Mụn, Giảm Vết Th&acirc;m với c&ocirc;ng thức mới v&agrave; th&agrave;nh phần độc quyền mới, gi&uacute;p chăm s&oacute;c da mụn chuy&ecirc;n biệt với 3 t&aacute;c động: giảm mụn, giảm th&acirc;m v&agrave; giảm mụn t&aacute;i ph&aacute;t. Ngo&agrave;i ra, Duo [+] kh&ocirc;ng l&agrave;m kh&ocirc; da v&igrave; n&oacute; c&oacute; chứa một lượng th&agrave;nh phần dưỡng ẩm đủ để da kh&ocirc;ng bị bong tr&oacute;c, kh&ocirc; căng, da vẫn rất mướt v&agrave; mềm, n&ecirc;n Duo [+] c&ograve;n c&oacute; thể sử dụng như kem l&oacute;t gi&uacute;p bề mặt da l&aacute;ng, mịn m&agrave; kh&ocirc;ng sợ g&acirc;y b&iacute; da.</p>\r\n\r\n<p><strong>Th&agrave;nh phần ch&iacute;nh v&agrave; c&ocirc;ng dụng:&nbsp;</strong><br />\r\n- Kem dưỡng da La Roche-Posay Effaclar Duo+ gi&uacute;p giảm mụn, giảm vết th&acirc;m c&oacute; công thức vượt trội với sự kết hợp của các hoạt ch&acirc;́t trong ng&agrave;nh da liễu như Niacinamide, LHA, Pirotone Olamine giúp giảm viêm, giảm mụn trong v&ograve;ng 12h, thông thoáng l&ocirc;̃ chân lông &amp; làm đ&ecirc;̀u b&ecirc;̀ mặt da.<br />\r\n- Sản phẩm không chứa paraben, không sulfate, không hương liệu &amp; không ch&acirc;́t bảo quản, kh&ocirc;ng chứa x&agrave; ph&ograve;ng, an to&agrave;n cho làn da r&acirc;́t nhạy cảm v&agrave; d&ecirc;̃ kích ứng.<br />\r\n- Hoạt chất độc quy&ecirc;̀n của Viện nghi&ecirc;n cứu La Roche-Posay Procerad&trade; giúp giảm sự xu&acirc;́t hiện của các vết thâm sau mụn v&agrave; Aqua Posae Filiformis gi&uacute;p c&acirc;n bằng hệ vi sinh vật trễn da, gi&uacute;p giảm mụn nhanh hơn &amp; giảm mụn t&aacute;i ph&aacute;t.<br />\r\n- Aqua Posae Filiformis: gi&uacute;p kh&ocirc;i phục v&agrave; c&acirc;n bằng hệ vi sinh vật tr&ecirc;n da<br />\r\n- Niacinamide gi&uacute;p giảm vi&ecirc;m v&agrave; l&agrave;m dịu da.<br />\r\n- Mannose k&iacute;ch th&iacute;ch qu&aacute; tr&igrave;nh t&aacute;i tạo da.<br />\r\n- Hoạt chất LHA c&oacute; trong sản phẩm gi&uacute;p se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng v&agrave; loại bỏ b&atilde; nhờn g&acirc;y tắc nghẽn lỗ ch&acirc;n l&ocirc;ng.<br />\r\n<br />\r\n<strong>Đối tượng sử dụng:</strong><br />\r\nKem dưỡng da La Roche-Posay Effaclar Duo+ gi&uacute;p giảm mụn, giảm vết th&acirc;m d&agrave;nh cho da nhạy cảm, da dầu, da mụn.<br />\r\n<br />\r\n<strong>Hướng&nbsp; dẫn sử dụng:</strong><br />\r\n- Sử dụng hằng ng&agrave;y v&agrave;o buổi s&aacute;ng v&agrave;/hoặc tối sau bước l&agrave;m sạch với gel rửa mặt Effaclar, v&agrave; c&acirc;n bằng &amp; l&agrave;m dịu với nước kho&aacute;ng.<br />\r\n- Thoa một lượng vừa đủ, nhẹ nh&agrave;ng m&aacute;t-xa để kem thấm s&acirc;u v&agrave;o trong da.</p>\r\n\r\n<h2><strong>Hướng dẫn sử dụng</strong></h2>', 1, 4, 4, 50, '2024-06-22 01:51:28', '2024-06-23 01:29:11'),
(9, 'Kem đêm Dưỡng ẩm Kiềm dầu 5 trong 1 UNO Cream Perfection', 'kem-dem-duong-am-kiem-dau-5-trong-1-uno-cream-perfection', 199000, 190000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p><strong>C&ocirc;ng dụng:</strong></p>\r\n\r\n<p>- Cấp ẩm nhanh ch&oacute;ng cho l&agrave;n da ẩm mụn nhưng kh&ocirc;ng để lại cảm gi&aacute;c nhờn r&iacute;t</p>\r\n\r\n<p>- Hạn chế dầu nhờn v&agrave; giảm b&oacute;ng dầu tr&ecirc;n da gi&uacute;p ngăn ngừa mụn, hạn chế t&igrave;nh trạng nẻ kh&ocirc; bong tr&oacute;c, gi&uacute;p l&agrave;m dịu da v&agrave; cải thiện t&igrave;nh trạng k&iacute;ch ứng da</p>\r\n\r\n<p>- L&agrave;m mờ nếp nhắn, vết ch&acirc;n chim, hạn chế t&igrave;nh trạng da chảy xệ, cho da căng mịn, săn chắc, đ&agrave;n hồi v&agrave; tươi tắn</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>- Lấy 1 lượng vừa đủ thoa đều khắp mặt (Sử dụng mỗi buổi tối để gi&uacute;p cung cấp dưỡng chất cho l&agrave;n da khỏe mạnh, mềm mại v&agrave; trắng s&aacute;ng, ẩm mịn)</p>\r\n\r\n<h2><strong>Th&agrave;nh phần</strong></h2>\r\n\r\n<p><strong>C&ocirc;ng dụng:</strong></p>\r\n\r\n<p>- Cấp ẩm nhanh ch&oacute;ng cho l&agrave;n da ẩm mụn nhưng kh&ocirc;ng để lại cảm gi&aacute;c nhờn r&iacute;t</p>\r\n\r\n<p>- Hạn chế dầu nhờn v&agrave; giảm b&oacute;ng dầu tr&ecirc;n da gi&uacute;p ngăn ngừa mụn, hạn chế t&igrave;nh trạng nẻ kh&ocirc; bong tr&oacute;c, gi&uacute;p l&agrave;m dịu da v&agrave; cải thiện t&igrave;nh trạng k&iacute;ch ứng da</p>\r\n\r\n<p>- L&agrave;m mờ nếp nhắn, vết ch&acirc;n chim, hạn chế t&igrave;nh trạng da chảy xệ, cho da căng mịn, săn chắc, đ&agrave;n hồi v&agrave; tươi tắn</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>- Lấy 1 lượng vừa đủ thoa đều khắp mặt (Sử dụng mỗi buổi tối để gi&uacute;p cung cấp dưỡng chất cho l&agrave;n da khỏe mạnh, mềm mại v&agrave; trắng s&aacute;ng, ẩm mịn)</p>\r\n\r\n<h2><strong>Hướng dẫn sử dụng</strong></h2>\r\n\r\n<p><strong>C&ocirc;ng dụng:</strong></p>\r\n\r\n<p>- Cấp ẩm nhanh ch&oacute;ng cho l&agrave;n da ẩm mụn nhưng kh&ocirc;ng để lại cảm gi&aacute;c nhờn r&iacute;t</p>\r\n\r\n<p>- Hạn chế dầu nhờn v&agrave; giảm b&oacute;ng dầu tr&ecirc;n da gi&uacute;p ngăn ngừa mụn, hạn chế t&igrave;nh trạng nẻ kh&ocirc; bong tr&oacute;c, gi&uacute;p l&agrave;m dịu da v&agrave; cải thiện t&igrave;nh trạng k&iacute;ch ứng da</p>\r\n\r\n<p>- L&agrave;m mờ nếp nhắn, vết ch&acirc;n chim, hạn chế t&igrave;nh trạng da chảy xệ, cho da căng mịn, săn chắc, đ&agrave;n hồi v&agrave; tươi tắn</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>- Lấy 1 lượng vừa đủ thoa đều khắp mặt (Sử dụng mỗi buổi tối để gi&uacute;p cung cấp dưỡng chất cho l&agrave;n da khỏe mạnh, mềm mại v&agrave; trắng s&aacute;ng, ẩm mịn)</p>', 1, 4, 5, 15, '2024-06-22 01:55:21', '2024-06-23 01:29:11'),
(10, 'Kem ngày Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel', 'kem-ngay-duong-trang-kiem-dau-5-trong-1-uno-uv-perfection-gel', 199000, 188000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Kem ng&agrave;y Dưỡng trắng Kiềm dầu 5 trong 1 UNO UV Perfection Gel</h2>\r\n\r\n<p>- Kem Ng&agrave;y Dạng Gel Dưỡng Trắng Kiềm Dầu 5 Trong 1 UV Perfection Gel UNO 80Gr được nghi&ecirc;n cứu d&agrave;nh ri&ecirc;ng cho da nam giới, chỉ cần 1 bước sử dụng c&oacute; thể thay thế 5 bước dưỡng gi&uacute;p giảm c&aacute;c vấn đề về da<br />\r\n- Ph&ugrave; hợp: mọi loại da<br />\r\n- Kh&ocirc;ng g&acirc;y k&iacute;ch ứng, kh&ocirc;ng dầu kho&aacute;ng</p>\r\n\r\n<p><strong><u>C&Ocirc;NG DỤNG CH&Iacute;NH</u></strong></p>\r\n\r\n<p>- Cấp ẩm nhanh ch&oacute;ng, giải quyết t&igrave;nh trạng da kh&ocirc; nẻ, bong tr&oacute;c<br />\r\n- Dưỡng trắng gi&uacute;p hạn chế h&igrave;nh th&agrave;nh sắc tố melanin, vết th&acirc;m, sạm m&agrave;u tr&ecirc;n da cho l&agrave;n da ẩm mịn, trắng s&aacute;ng nhưng kh&ocirc;ng để lại cảm gi&aacute;c nhờn r&iacute;t<br />\r\n- Hạn chế dầu nhờn v&agrave; giảm b&oacute;ng dầu, gi&uacute;p cải thiện mụn, kh&ocirc;ng g&acirc;y k&iacute;ch ứng, bảo vệ da trước t&aacute;c hại của tia UV cho l&agrave;n da căng mịn, săn chắc</p>\r\n\r\n<p><strong><u>CÁCH DÙNG</u></strong></p>\r\n\r\n<p>Lấy 1 lượng vừa đủ thoa đều khắp mặt</p>\r\n\r\n<p><strong><u>Th&agrave;nh phần:</u></strong>&nbsp;Xem tr&ecirc;n bao b&igrave; sản phẩm</p>\r\n\r\n<p><strong><u>Quy&nbsp;c&aacute;ch:</u></strong>&nbsp;Hộp, 80Gr</p>\r\n\r\n<p><strong><u>Bảo quản:</u></strong> Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Tr&aacute;nh &aacute;nh nắng trực tiếp</p>\r\n\r\n<p><strong><u>Xuất xứ:</u></strong>&nbsp;Nhật Bản</p>\r\n\r\n<p><strong><u>HSD:</u></strong>&nbsp;Xem tr&ecirc;n bao b&igrave; sản phẩm</p>\r\n\r\n<h2><strong>Th&agrave;nh phần</strong></h2>\r\n\r\n<h2><strong>Hướng dẫn sử dụng</strong></h2>', 1, 4, 5, 45, '2024-06-22 01:58:06', '2024-06-23 01:29:12'),
(11, 'Dầu gội giảm rụng tóc và ngăn gàu Dr. For Hair Anti-Dandruff Shampoo', 'dau-goi-giam-rung-toc-va-ngan-gau-dr-for-hair-anti-dandruff-shampoo', 599000, 550000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p><strong>Tên sản phẩm:</strong> Dầu gội chống gàu Dr. For Hair Folligen Anti-Dandruff Shampoo<br><br><strong>Công dụng chính:</strong><br><br>Cung cấp chăm sóc da đầu chuyên sâu, giúp cải thiện các vấn đề về da đầu và tóc1.<br>Loại bỏ bụi bẩn và tế bào chết trong lỗ chân lông bị tắc nghẽn1.<br>Bổ sung độ ẩm để duy trì cân bằng dầu và nước của da đầu1.</p><p><br><strong>Thành phần:</strong><br><br>Folligen Complex: Đã được chứng minh lâm sàng giúp tăng cường sức khỏe da đầu2.<br>Zinc Pyrithione: Giúp giảm ngứa và gàu3.<br>Panthenol và Salicylic Acid: Cung cấp độ ẩm và làm sạch da đầu3.</p><p><br><strong>Lợi ích:</strong><br><br>Tăng cường độ đàn hồi của da đầu và nuôi dưỡng tóc2.<br>Giảm ngứa và gàu, có thể giúp tăng khối lượng tóc2.<br>Hướng dẫn sử dụng:<br><br>Làm ướt tóc và da đầu.<br>Thoa một lượng dầu gội vừa đủ lên tóc và da đầu.<br>Massage nhẹ nhàng và xả sạch với nước.</p><p><br><strong>Đặc điểm nổi bật:</strong><br><br>Sản phẩm được làm từ 93% thành phần tự nhiên4.<br>Không chứa paraben, phù hợp cho việc sử dụng hàng ngày, kể cả trên tóc nhuộm4.<br>An toàn cho:<br><br>Da đầu nhạy cảm và tóc đã qua xử lý hóa chất4.</p>', 1, 5, 6, 89, '2024-06-22 02:01:02', '2024-06-23 02:05:36'),
(12, 'Dầu gội phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Shampoo', 'dau-goi-phuc-hoi-hu-ton-cho-toc-mong-dr-for-hair-folligen-silk-shampoo', 609000, 600000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p><strong>Tên sản phẩm:</strong> Dầu gội chống gàu Dr. For Hair Folligen Anti-Dandruff Shampoo<br><br><strong>Công dụng chính:</strong><br><br>Cung cấp chăm sóc da đầu chuyên sâu, giúp cải thiện các vấn đề về da đầu và tóc1.<br>Loại bỏ bụi bẩn và tế bào chết trong lỗ chân lông bị tắc nghẽn1.<br>Bổ sung độ ẩm để duy trì cân bằng dầu và nước của da đầu1.</p><p><br><strong>Thành phần:</strong><br><br>Folligen Complex: Đã được chứng minh lâm sàng giúp tăng cường sức khỏe da đầu2.<br>Zinc Pyrithione: Giúp giảm ngứa và gàu3.<br>Panthenol và Salicylic Acid: Cung cấp độ ẩm và làm sạch da đầu3.</p><p><br><strong>Lợi ích:</strong><br><br>Tăng cường độ đàn hồi của da đầu và nuôi dưỡng tóc2.<br>Giảm ngứa và gàu, có thể giúp tăng khối lượng tóc2.</p><p><br><strong>Hướng dẫn sử dụng:</strong><br><br>Làm ướt tóc và da đầu.<br>Thoa một lượng dầu gội vừa đủ lên tóc và da đầu.<br>Massage nhẹ nhàng và xả sạch với nước.</p><p><br><strong>Đặc điểm nổi bật:</strong><br><br>Sản phẩm được làm từ 93% thành phần tự nhiên4.<br>Không chứa paraben, phù hợp cho việc sử dụng hàng ngày, kể cả trên tóc nhuộm4.</p><p><br><strong>An toàn cho:</strong><br><br>Da đầu nhạy cảm và tóc đã qua xử lý hóa chất4.</p>', 1, 5, 6, 92, '2024-06-22 02:02:15', '2024-06-23 02:06:30'),
(13, 'Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo 100ml', 'dau-goi-tay-te-bao-chet-2-trong-1-drforhair-head-scaling-shampoo-100ml', 205000, 199000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>Dầu Gội Tẩy Tế Bào Chết 2 Trong 1 Dr.FORHAIR Head Scaling Shampoo dung tích 100ml là một sản phẩm chăm sóc tóc độc đáo, kết hợp giữa dầu gội và tẩy tế bào chết, mang lại sự tiện lợi và hiệu quả cao trong việc làm sạch và nuôi dưỡng da đầu và tóc.<br><br><strong>Công Dụng Chính:</strong><br>Làm sạch sâu: Loại bỏ bụi bẩn, dầu thừa và tế bào chết một cách nhẹ nhàng1.<br>Cân bằng da đầu: Hạn chế hoạt động của tuyến bã nhờn, giảm tình trạng bết dính1.<br>Nuôi dưỡng tóc: Cung cấp dinh dưỡng giúp tóc chắc khỏe, giảm gãy rụng1.<br>Hỗ trợ mọc tóc: Giúp tóc mọc nhanh và dài hơn1.<br>Giảm ngứa và kích ứng: Hỗ trợ giảm các vấn đề da liễu như nấm, gàu, eczema1.</p><p><br><strong>Thành Phần Nổi Bật:<br></strong>Muối từ Biển Chết: Giúp làm sạch sâu và tẩy tế bào chết1.<br>Tảo Bẹ Vàng: Cung cấp dưỡng chất và giảm rụng tóc1.<br>20 loại Amino Acid: Tăng cường sức khỏe cho tóc1.<br>Peptide và Protein từ Sữa và Vảy Cá: Giúp tóc mềm mại và bóng mượt1.</p><p><br><strong>Hướng Dẫn Sử Dụng:</strong><br>Làm ướt tóc và da đầu với nước ấm.<br>Lấy một lượng sản phẩm vừa đủ và thoa đều lên da đầu và tóc.<br>Massage nhẹ nhàng bằng đầu ngón tay trong 2-3 phút.<br>Xả sạch với nước1.</p><p><br><strong>Đối Tượng Sử Dụng:</strong><br>Phù hợp với mọi loại da đầu, đặc biệt là da đầu khô và ngứa1.<br>Những người thường xuyên thay đổi kiểu tóc như nhuộm, uốn, duỗi1.<br>Những người có tóc hư tổn, khô xơ, mỏng và yếu1.</p><p><br><strong>Khuyến Nghị Dùng Kèm:</strong><br>Dr.FORHAIR Folligen Scalp Pack: Để làm sạch sâu và dưỡng ẩm1.<br>UNOVE Deep Damage Treatment EX: Để phục hồi tóc hư tổn nặng1.<br>Phyto Therapy Treatment: Để chăm sóc tóc mềm mượt, vào nếp1.</p><p><br><strong>Lưu ý:</strong> <em>Sản phẩm không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh. Thông tin sản phẩm chỉ mang tính chất tham khảo.</em></p>', 1, 5, 6, 100, '2024-06-22 02:04:39', '2024-06-23 02:03:20'),
(14, 'Dầu xả phục hồi hư tổn cho tóc mỏng Dr. For Hair Folligen Silk Treatment', 'dau-xa-phuc-hoi-hu-ton-cho-toc-mong-dr-for-hair-folligen-silk-treatment', 440000, 430000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>Dầu xả Dr. For Hair Folligen Silk Treatment là một giải pháp chăm sóc tóc chuyên sâu, được thiết kế để phục hồi và nuôi dưỡng tóc mỏng yếu và hư tổn. Sản phẩm này không chỉ giúp cải thiện tình trạng của tóc mà còn mang lại sự mềm mại và bóng mượt cho mái tóc của bạn</p><br><p><strong>Công Dụng Vượt Trội:</strong></p><br><p>Chứng nhận hiệu quả: Được Cục quản lý Thực phẩm Hàn Quốc (KFDA) chứng nhận về hiệu quả1.</p><br><p>Giảm gãy rụng: Giảm rụng tóc trông thấy chỉ sau 1 tháng sử dụng1.</p><br><p>Phục hồi nang tóc: Hỗ trợ phục hồi nang chân tóc, giúp tóc mọc nhanh chóng1.</p><br><p>Nuôi dưỡng từ gốc đến ngọn: Cung cấp dưỡng chất cần thiết cho tóc từ gốc đến ngọn1.</p><br><p>Độ ẩm lý tưởng: Đảm bảo độ ẩm cần thiết cho da đầu và sợi tóc1.</p><br><p>Tăng cường độ săn chắc: Mang lại độ săn chắc và đàn hồi cho da đầu và tóc1.</p><br><p><strong>Thông Tin Đóng Gói:</strong></p><br><p>Dung tích: 300ml1.</p><br><p><strong>Hướng Dẫn Sử Dụng:</strong></p><br><p>Làm ướt da đầu và tóc với nước ấm.</p><br><p>Lấy một lượng dầu gội vừa đủ, tạo bọt và thoa đều lên da đầu và tóc.</p><br><p>Massage nhẹ nhàng bằng đầu ngón tay trong 2-3 phút.</p><br><p>Xả sạch bọt với nước.</p><br><p>Lau nhẹ để tóc hơi ráo nước.</p><br><p>Áp dụng dầu xả Folligen Silk Treatment, massage và ủ tóc từ 5-10 phút.</p><br><p>Xả sạch lại với nước1.</p><br><p>Đối Tượng Sử Dụng:</p><br><p>Những người có da đầu cần làm sạch.</p><br><p>Tóc mỏng, yếu, dễ gãy rụng.</p><br><p>Tóc chẻ ngọn, hư tổn1.</p><br><p><strong>Khuyến Nghị Dùng Kèm:</strong></p><br><p>Để đạt hiệu quả tốt nhất, nên sử dụng kết hợp với Dầu dưỡng UNOVE Silk Oil Essence1.</p><br><br><p><strong>Lưu ý:</strong></p><br><p>Trong 5-7 ngày đầu tiên sử dụng, tóc có thể rụng nhiều hơn do loại bỏ tế bào sừng chết và phần thân tóc yếu, hư tổn.</p><br><p>Tránh để sản phẩm tiếp xúc với mắt và rửa sạch ngay nếu sản phẩm dính vào mắt.</p><br><p>Nếu có dấu hiệu kích ứng, hãy tham khảo ý kiến của chuyên gia hoặc bác sĩ da liễu.</p><p><em>Sản phẩm không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.</em></p>', 1, 6, 6, 120, '2024-06-22 02:07:22', '2024-06-23 02:04:20'),
(15, 'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy', 'dau-xa-cho-da-nhay-cam-dr-forhair-phyto-therapy', 234000, 219000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p>Dầu xả Dr.ForHair Phyto Therapy Treatment gi&uacute;p phục hồi t&oacute;c hư tổn, th&agrave;nh phần kh&ocirc;ng chứa silicone, 98% th&agrave;nh phần c&oacute; nguồn gốc tự nhi&ecirc;n như Moringa Oleifera Hoa Japonica, gi&uacute;p phục hồi m&aacute;i t&oacute;c hư tổn v&agrave; giữ ẩm. Th&agrave;nh phần kh&ocirc;ng chứa silicone th&iacute;ch hợp cả da đầu nhạy cảm.</p>\r\n\r\n<p>Th&agrave;nh phần : Nước, glycerin, capbest / capric triglyceride, rượu cetearyl, rượu cetearyl, rượu etetrimonium methoslfate, rượu stearamidopropyl dimethylamine, glyceryl stearate, nước chanh, rượu beara Clorua, cam qu&yacute;t aurantium dulcis (cam) dầu vỏ, butylene glycol, polyqu Parentium-10, dầu l&aacute; bạch đ&agrave;n, dầu capylyl glycol, axit lanolin, dầu b&atilde; đậu xanh, dầu chanh hexanediol, llicium verum (hồi) dầu tr&aacute;i c&acirc;y / dầu hạt, dầu hạt macadamia ternifolia, dầu tr&aacute;i c&acirc;y olea europaea (dầu &ocirc; liu), dầu hạt simmonsdia chinensis (jojoba), dầu argania spinosa kernal chiết xuất hạt moringa oleifera, chiết xuất từ ​​tr&aacute;i c&acirc;y sapindus trifoliatus, chiết xuất l&aacute; saponaria docinalis, natri citrate, dầu thực vật, chiết xuất hoa camellia japonica, tocopherol, algin.</p>\r\n\r\n<p>Hướng dẫn sử dụng : Sau khi gội sạch đầu với dầu gội, lấy 1 lượng vừa đủ cho l&ecirc;n t&oacute;c ướt. M&aacute;txa nhẹ nh&agrave;ng cho dầu thấm v&agrave;o da đầu v&agrave; t&oacute;c trong v&ograve;ng 5 ph&uacute;t. Sau đ&oacute; xả sạch với nước ấm.</p>\r\n\r\n<p>Gi&uacute;p phục hồi t&oacute;c hư tổn, th&agrave;nh phần kh&ocirc;ng chứa silicone, 98% Th&agrave;nh phần c&oacute; nguồn gốc tự nhi&ecirc;n như Moringa Oleifera Hoa Japonica, gi&uacute;p phục hồi m&aacute;i t&oacute;c hư tổn v&agrave; giữ ẩm. Th&agrave;nh phần kh&ocirc;ng chứa silicone th&iacute;ch hợp cả da đầu nhạy cảm. Hướng dẫn sử dụng : Sau khi gội sạch đầu với dầu gội, lấy 1 lượng vừa đủ cho l&ecirc;n t&oacute;c ướt. M&aacute;txa nhẹ nh&agrave;ng cho dầu thấm v&agrave;o da đầu v&agrave; t&oacute;c trong v&ograve;ng 5 ph&uacute;t. Sau đ&oacute; xả sạch với nước ấm.</p>\r\n\r\n<p><img src=\"https://vn-live-05.slatic.net/shop/31c741678ede76c410316d94f30c1ab1.png_2200x2200q80.jpg_.webp\" /></p>', 1, 6, 6, 102, '2024-06-22 02:08:53', '2024-06-23 01:29:20');
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discount`, `content`, `status`, `idCate`, `idBrand`, `in_stock`, `created_at`, `updated_at`) VALUES
(16, 'Dầu xả Blairsom Thảo Mộc Phục Hồi 500ml', 'dau-xa-blairsom-thao-moc-phuc-hoi-500ml', 655000, 650000, '<p><strong>THÔNG TIN SẢN PHẨM&nbsp;</strong></p><p>Dầu xả Blairsom Thảo Mộc Phục Hồi dung tích 500ml là một sản phẩm chăm sóc tóc cao cấp, được phát triển bởi các chuyên gia hàng đầu với hơn 50 năm kinh nghiệm trong ngành hóa mỹ phẩm. Sản phẩm này chứa Collagen Đại Dương và Tinh Dầu Thảo Mộc nội địa Úc, mang lại nhiều lợi ích cho mái tóc của bạn.<br><br><strong>Công Dụng Chính:</strong><br>Chống oxy hóa: Giúp giảm quá trình lão hóa và tăng độ đàn hồi của da đầu1.<br>Kích thích mọc tóc: Ngăn ngừa rụng tóc và kích thích tăng độ dài và dày của tóc1.<br>Kháng khuẩn: Giảm mụn và viêm chân tóc, loại bỏ dầu thừa tích tụ1.<br>Tạo độ bóng mượt: Mang lại sự bồng bềnh và óng ả cho mái tóc1.<br>Kiểm soát dầu: Hiệu quả trong 55 giờ, giúp da đầu không bị bết dính1.<br><strong>Cam Kết 4 KHÔNG:</strong><br>Không phẩm màu nhân tạo<br>Không hương liệu nhân tạo<br>Không silicon<br>Không parabens1<br><strong>Thành Phần Nổi Bật:</strong><br>Collagen Thủy Phân: Tăng cường độ đàn hồi cho tóc1.<br>Chiết Xuất Lá Nha Đam: Cung cấp độ ẩm và làm dịu da đầu1.<br>Dầu Jojoba và Ô Liu: Nuôi dưỡng tóc, tạo độ bóng mượt1.<br>Tinh Dầu Thảo Mộc: Bao gồm Lá Chanh Myrtle, Bạch Đàn, Hoa Cam, Oải Hương, và Hoa Quýt1.<br><strong>Hướng Dẫn Sử Dụng:</strong><br>Sau khi gội đầu, lấy một lượng dầu xả vừa đủ.<br>Thoa đều dầu xả từ chân tóc tới ngọn.<br>Giữ dầu xả trên tóc và để nghỉ 5 phút.<br>Xả sạch tóc với nước1.<br><strong>Đối Tượng Sử Dụng:</strong><br>Phù hợp với những người có tóc hư tổn, cần phục hồi1.<br>Những người muốn giảm gãy rụng và kích thích mọc tóc1.<br><strong>Khuyến Nghị Dùng Kèm:</strong><br>Dầu gội Blairsom Thảo Mộc Collagen Đại Dương &amp; Tinh Dầu 6 Trong 1: Để tăng cường hiệu quả phục hồi và nuôi dưỡng1.<br><strong>Lưu ý:</strong> <em>Sản phẩm không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.</em></p>', 1, 6, 4, 200, '2024-06-22 02:11:16', '2024-06-23 02:09:02'),
(17, 'Dầu xả Blairsom Óng Mượt Mỗi Ngày 500ml', 'dau-xa-blairsom-ong-muot-moi-ngay-500ml', 655000, 650000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>Dầu xả Blairsom Thảo Mộc Phục Hồi dung tích 500ml là một sản phẩm chăm sóc tóc cao cấp, được phát triển bởi các chuyên gia hàng đầu với hơn 50 năm kinh nghiệm trong ngành hóa mỹ phẩm. Sản phẩm này chứa Collagen Đại Dương và Tinh Dầu Thảo Mộc nội địa Úc, mang lại nhiều lợi ích cho mái tóc của bạn.<br><br><strong>Công Dụng Chính:<br></strong>Chống oxy hóa: Giúp giảm quá trình lão hóa và tăng độ đàn hồi của da đầu1.<br>Kích thích mọc tóc: Ngăn ngừa rụng tóc và kích thích tăng độ dài và dày của tóc1.<br>Kháng khuẩn: Giảm mụn và viêm chân tóc, loại bỏ dầu thừa tích tụ1.<br>Tạo độ bóng mượt: Mang lại sự bồng bềnh và óng ả cho mái tóc1.<br>Kiểm soát dầu: Hiệu quả trong 55 giờ, giúp da đầu không bị bết dính1.<br><strong>Cam Kết 4 KHÔNG:</strong><br>Không phẩm màu nhân tạo<br>Không hương liệu nhân tạo<br>Không silicon<br>Không parabens1<br><strong>Thành Phần Nổi Bật:</strong><br>Collagen Thủy Phân: Tăng cường độ đàn hồi cho tóc1.<br>Chiết Xuất Lá Nha Đam: Cung cấp độ ẩm và làm dịu da đầu1.<br>Dầu Jojoba và Ô Liu: Nuôi dưỡng tóc, tạo độ bóng mượt1.<br>Tinh Dầu Thảo Mộc: Bao gồm Lá Chanh Myrtle, Bạch Đàn, Hoa Cam, Oải Hương, và Hoa Quýt1.<br><strong>Hướng Dẫn Sử Dụng:</strong><br>Sau khi gội đầu, lấy một lượng dầu xả vừa đủ.<br>Thoa đều dầu xả từ chân tóc tới ngọn.<br>Giữ dầu xả trên tóc và để nghỉ 5 phút.<br>Xả sạch tóc với nước1.<br><strong>Đối Tượng Sử Dụng:</strong><br>Phù hợp với những người có tóc hư tổn, cần phục hồi1.<br>Những người muốn giảm gãy rụng và kích thích mọc tóc1.<br><strong>Khuyến Nghị Dùng Kèm:</strong><br>Dầu gội Blairsom Thảo Mộc Collagen Đại Dương &amp; Tinh Dầu 6 Trong 1: Để tăng cường hiệu quả phục hồi và nuôi dưỡng1.<br><strong>Lưu ý:</strong> <em>Sản phẩm không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.</em></p>', 1, 6, 6, 150, '2024-06-22 02:12:13', '2024-06-23 02:11:06'),
(18, 'Dầu gội Blairsom Herbal Refreshing Collagen thảo mộc cho tóc dầu 50ml', 'dau-goi-blairsom-herbal-refreshing-collagen-thao-moc-cho-toc-dau-50ml', 80000, 6000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Dầu gội Blairsom Thảo Mộc Collagen Đại Dương &amp; Tinh Dầu 6 Trong 1</strong>&nbsp;chiết xuất từ Collagen Đại Dương v&agrave; Tinh Dầu Thảo Mộc nội địa &Uacute;c, được ph&aacute;t triển bởi những chuy&ecirc;n gia với hơn 50 năm kinh nghiệm trong ng&agrave;nh h&oacute;a mỹ phẩm.</p>\r\n\r\n<p><strong>C&ocirc;ng dụng</strong></p>\r\n\r\n<p>- Chống oxy h&oacute;a, giảm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a, tăng độ đ&agrave;n hồi của da đầu</p>\r\n\r\n<p>- K&iacute;ch th&iacute;ch mọc t&oacute;c, ngăn ngừa rụng t&oacute;c, giảm g&agrave;u, ngứa da đầu</p>\r\n\r\n<p>- Tạo độ b&oacute;ng mượt tự nhi&ecirc;n</p>\r\n\r\n<p>- Kh&aacute;ng khuẩn, giảm mụn v&agrave; vi&ecirc;m ch&acirc;n t&oacute;c, loại bỏ dầu thừa t&iacute;ch tụ</p>\r\n\r\n<p>- Chống oxy h&oacute;a, gi&uacute;p phục hồi nang t&oacute;c bị hư tổn do d&ugrave;ng h&oacute;a chất tạo kiểu, nhuộm, tẩy</p>\r\n\r\n<p>- Kiểm so&aacute;t dầu hiệu quả trong 55 giờ</p>\r\n\r\n<p>- Cam kết 4 KH&Ocirc;NG: kh&ocirc;ng phẩm m&agrave;u nh&acirc;n tạo, kh&ocirc;ng hương liệu nh&acirc;n tạo, kh&ocirc;ng sillicon, kh&ocirc;ng parabens</p>\r\n\r\n<p><strong>Th&agrave;nh phần:&nbsp;</strong></p>\r\n\r\n<p>Nước, Sodium Cocoyl Sarcosinate, Cocamidopropyl Betaine, Glycerin, Sodium Lauryl Sulfate, Coco Glucoside, Chiết Xuất L&aacute; Nha Đam, Guar Hydroxypropyltrimonium Chloride, Phenoxyethanol, Citric Acid, Collagen Thủy Ph&acirc;n, Tinh Dầu Vỏ Cam Ngọt, Chiết Xuất L&aacute; X&ocirc; Thơm, Benzyl Alcohol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Panthenol, Tinh Dầu L&aacute; Bạch Đ&agrave;n (Khuynh Diệp), Tinh Dầu Hoa Cam, Tinh Dầu Hoa Oải Hương, Tinh Dầu Vỏ Qu&yacute;t, Tinh Dầu L&aacute; Chanh Myrtle, Triethanolamine.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>L&agrave;m ướt t&oacute;c rồi lấy một lượng dầu gội vừa đủ v&agrave;o l&ograve;ng b&agrave;n tay v&agrave; xoa đều. Thoa đều dầu gội l&ecirc;n t&oacute;c v&agrave; da đầu. Xả sạch t&oacute;c với nước.</p>\r\n\r\n<p>Hiệu quả tốt nhất khi sử dụng c&ugrave;ng Dầu xả Blairsom Thảo Mộc Phục Hồi Collagen Đại Dương &amp; Tinh Dầu 7 Trong 1.</p>', 1, 5, 7, 123, '2024-06-22 02:15:47', '2024-06-23 01:29:23'),
(19, 'Dầu gội Blairsom Óng Mượt Mỗi Ngày 500ml', 'dau-goi-blairsom-ong-muot-moi-ngay-500ml', 655000, 630000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>Dầu gội Blairsom Óng Mượt Mỗi Ngày 500ml là sự lựa chọn hoàn hảo cho những ai mong muốn có một mái tóc khỏe mạnh và óng ả mỗi ngày. Sản phẩm này được tạo nên từ sự kết hợp của Collagen đại dương và tinh dầu thực vật tự nhiên từ Úc, mang lại hiệu quả thẩm thấu sâu vào từng nang tóc12.<br><br>Với công thức độc quyền, Dầu gội Blairsom không chỉ giúp làm sạch sâu mà còn kiểm soát dầu lên đến 55 giờ, giúp tóc bạn luôn mềm mại và mượt mà2. Tinh dầu thảo mộc lành tính từ Úc giúp phục hồi hư tổn tóc do hóa chất tạo kiểu, uốn, nhuộm, đồng thời mang lại cảm giác thư thái cho người sử dụng1.<br><br>Dầu gội này còn chứa các thành phần như Sodium Cocoyl Sarcosinate, Cocamidopropyl Betaine, Glycerin, và Sodium Lauryl Sulfate, đảm bảo khả năng tạo bọt nhẹ nhàng, dễ dàng xả sạch mà không làm khô tóc3. Ngoài ra, sự pha trộn của Chiết Xuất Lá Nha Đam, Tinh Dầu Vỏ Cam Ngọt, Chiết Xuất Lá Xô Thơm, và Tinh Dầu Hoa Oải Hương không chỉ nuôi dưỡng tóc từ sâu bên trong mà còn để lại hương thơm dễ chịu, lưu giữ lâu dài3.<br><br>Sử dụng Dầu gội Blairsom Óng Mượt Mỗi Ngày, bạn sẽ cảm nhận được sự khác biệt rõ rệt - tóc trở nên mềm mại, mượt mảng và đầy sức sống. Đặc biệt, khi kết hợp với Dầu xả Blairsom Óng Mượt Mỗi Ngày, hiệu quả chăm sóc tóc sẽ được tối ưu hóa, giúp tóc bạn luôn trong trạng thái tốt nhất4.</p>', 1, 5, 7, 175, '2024-06-22 02:18:49', '2024-06-23 02:14:22'),
(20, 'Tinh dầu dưỡng tóc Davines OI Oil', 'tinh-dau-duong-toc-davines-oi-oil', 416000, 405000, '<p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>Tinh dầu dưỡng tóc Davines OI Oil là một sản phẩm chăm sóc tóc cao cấp, được thiết kế để mang lại sự mềm mại, bóng mượt và tăng cường độ bóng cho mái tóc của bạn. Sản phẩm này phù hợp với mọi loại tóc, đặc biệt hiệu quả với tóc thô xơ và tóc khô.<br><br><strong>Công dụng chính của Tinh dầu dưỡng tóc Davines OI Oil</strong><br>Nuôi dưỡng: Cung cấp dưỡng chất cần thiết, giúp tóc khỏe mạnh từ bên trong.<br>Cấp ẩm: Duy trì độ ẩm cần thiết, giúp tóc không bị khô và gãy rụng.<br>Tăng độ bóng: Làm tóc trở nên bóng mượt và giảm thiểu tình trạng xơ rối.<br>Chống rối xù: Giúp gỡ rối tóc một cách nhẹ nhàng, giảm tình trạng tóc xù.<br>Bảo vệ tóc: Bảo vệ tóc khỏi các yếu tố môi trường và thiết bị tạo kiểu nhiệt.<br>Thành phần và tính năng nổi bật:<br><br>Không chứa Paraben: An toàn cho da đầu và tóc, không gây kích ứng hay khô tóc.<br>Mùi hương lâu trôi: Hương thơm dễ chịu, lưu giữ lâu trên tóc.<br>Dễ sử dụng: Có thể sử dụng trực tiếp lên tóc sau khi gội, không cần xả lại.</p><p><br><strong>Hướng dẫn sử dụng:</strong><br>Sau khi gội đầu, lau khô tóc.<br>Xịt một lượng vừa đủ ra tay hoặc trực tiếp lên thân tóc.<br>Thoa đều từ thân đến ngọn.<br>Không cần xả lại.<br>Làm khô và tạo kiểu mong muốn.<br>Với dung tích 135ml và hạn sử dụng lên đến 3 năm, Tinh dầu dưỡng tóc Davines OI Oil là một sự đầu tư xứng đáng cho việc chăm sóc và bảo vệ mái tóc của bạn mỗi ngày.</p>', 1, 1, 8, 79, '2024-06-22 02:23:14', '2024-06-23 02:17:22'),
(21, 'Xịt Dưỡng Tóc Davines Nourishing Keratin Sealer 100ml', 'xit-duong-toc-davines-nourishing-keratin-sealer-100ml', 462000, 450000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<h2><strong>Xịt Dưỡng T&oacute;c Davines Nourishing Keratin Sealer - Dưỡng ẩm bảo vệ v&agrave; phục hồi m&aacute;i t&oacute;c hư tổn</strong></h2>\r\n\r\n<p><em>Xịt Dưỡng T&oacute;c Davines Nourishing Keratin Sealer l&agrave; một trong những d&ograve;ng sản phẩm rất được ưa chuộng của nh&agrave; Davines. Với t&aacute;c dụng dưỡng ẩm v&agrave; bảo vệ t&oacute;c khỏi t&aacute;c động xấu từ m&ocirc;i trường v&agrave; qu&aacute; tr&igrave;nh tạo kiểu, đ&acirc;y l&agrave; bước bảo vệ thứ ba sau dầu xả v&agrave; dầu gội gi&uacute;p t&oacute;c phục hồi hiệu quả. Anh em c&oacute; thể sử dụng sản phẩm bất cứ l&uacute;c n&agrave;o để tạo lớp bảo vệ cho t&oacute;c ngay trước khi t&oacute;c chịu t&aacute;c động bởi nhiệt hay h&oacute;a chất.</em></p>\r\n\r\n<h3><strong>Ngăn chặn oxy h&oacute;a v&agrave; hư tổn cho từng sợi t&oacute;c</strong></h3>\r\n\r\n<p>Kh&oacute;i bụi, &ocirc; nhiễm m&ocirc;i trường, nhiệt độ cao, h&oacute;a chất&hellip; đều l&agrave; những t&aacute;c nh&acirc;n g&acirc;y ra hư tổn cho m&aacute;i t&oacute;c. C&oacute; một sự thật ch&iacute;nh l&agrave; anh em kh&ocirc;ng thể tr&aacute;nh được ho&agrave;n to&agrave;n c&aacute;c t&aacute;c nh&acirc;n n&agrave;y. Bởi thế, sử dụng sản phẩm bảo vệ v&agrave; phục hồi m&aacute;i t&oacute;c trở n&ecirc;n rất quan trọng gi&uacute;p m&aacute;i t&oacute;c giảm hư tổn, lu&ocirc;n chắc khỏe đẹp từ nhi&ecirc;n.&nbsp;</p>\r\n\r\n<p><img src=\"https://static.30shine.com/shop-admin/2021/09/04/30S8LCX7-67.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\">Xịt Dưỡng T&oacute;c Davines Nourishing Keratin Sealer 100ml</p>\r\n\r\n<p>Davines Naturaltech Nourishing Keratin Sealer l&agrave; loại xịt dưỡng t&oacute;c b&aacute;n chạy top 1 thị trường hỗ trợ bảo vệ m&aacute;i t&oacute;c cực hiệu quả. Với t&aacute;c dụng ch&iacute;nh gi&uacute;p dưỡng ẩm gi&uacute;p phục hồi giảm t&aacute;c động xấu từ m&ocirc;i trường l&ecirc;n t&oacute;c, sản phẩm tạo ra lớp bảo vệ gi&uacute;p phục hồi v&agrave; giữ m&atilde;i t&oacute;c lu&ocirc;n b&oacute;ng đẹp, bồng bềnh.</p>\r\n\r\n<p>Nhờ c&oacute; th&agrave;nh phần ch&iacute;nh oxit dismuta - một loại enzym gi&uacute;p chống l&atilde;o h&oacute;a v&agrave; c&aacute;c gốc tự do, gi&uacute;p giảm triệt để nguy&ecirc;n nh&acirc;n ch&iacute;nh g&acirc;y hư tổn m&aacute;i t&oacute;c. Oxit dismuta kết hợp với c&aacute;c vi lượng oligosaccharit đem lại t&aacute;c dụng t&aacute;i tạo cấu tr&uacute;c t&oacute;c phục hồi m&aacute;i t&oacute;c hư tổn. Kết hợp sử dụng sản phẩm với dầu gội v&agrave; dầu xả sẽ tạo n&ecirc;n c&aacute;c lớp chăm s&oacute;c bảo vệ m&aacute;i t&oacute;c cho hiệu quả tối đa.</p>\r\n\r\n<h3><strong>Xịt dưỡng t&oacute;c đến từ thương hiệu chăm s&oacute;c t&oacute;c được ưa chuộng</strong></h3>\r\n\r\n<p>Davines được biết đến l&agrave; thương hiệu nổi tiếng được th&agrave;nh lập tại &Yacute; với những d&ograve;ng sản phẩm chăm s&oacute;c hiệu quả d&agrave;nh cho m&aacute;i t&oacute;c.&nbsp;</p>\r\n\r\n<p>Được th&agrave;nh lập năm 1983, Davines ban đầu l&agrave; ph&ograve;ng th&iacute; nghiệm nghi&ecirc;n cứu v&agrave; tạo ra những sản phẩm chăm s&oacute;c t&oacute;c cao cấp cho c&ocirc;ng ty mỹ phẩm. Sau khoảng một thập kỷ, những d&ograve;ng sản phẩm c&oacute; thương hiệu Davines mới ra đời. Kể từ đ&oacute; thương hiệu n&agrave;y tập trung sản xuất những sản phẩm cao cấp chăm s&oacute;c t&oacute;c cho c&aacute;c salon.&nbsp;</p>\r\n\r\n<p>Davines lu&ocirc;n hướng tới mục ti&ecirc;u tạo ra vẻ đẹp bền vững cho mọi người v&agrave; khuyến kh&iacute;ch họ tự chăm s&oacute;c bản th&acirc;n thật nhiều. V&igrave; thế, thương hiệu lu&ocirc;n cho ra đời những d&ograve;ng sản phẩm chăm s&oacute;c cao cấp bằng c&ocirc;ng nghệ v&agrave; mang theo phong c&aacute;ch của ri&ecirc;ng m&igrave;nh. Thương hiệu tự tin khẳng định sẽ lu&ocirc;n tạo ra những d&ograve;ng sản phẩm được sản xuất bằng nguy&ecirc;n liệu tốt, c&ocirc;ng nghệ hiện đại h&agrave;ng đầu thị trường. Qua gần 40 năm ph&aacute;t triển Davines đ&atilde; chứng minh c&ocirc;ng nghệ cao cấp từ Italy lu&ocirc;n mang tới những sản phẩm v&agrave; trải nghiệm tuyệt vời cho kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<h3><strong>Cứu nguy cho m&aacute;i t&oacute;c hư tổn ngay lập tức</strong></h3>\r\n\r\n<p>Với thiết kế dạng xịt, dung t&iacute;ch chỉ 100ml sản phẩm thuận tiện để mang đi bất cứ đ&acirc;u. Sản phẩm được sử dụng như xịt dưỡng t&oacute;c chăm s&oacute;c t&oacute;c h&agrave;ng ng&agrave;y sau khi gội đầu. Tuy nhi&ecirc;n t&aacute;c dụng kh&ocirc;ng dừng lại ở đ&oacute;, anh em c&oacute; thể sử dụng xịt dưỡng t&oacute;c bất cứ khi n&agrave;o như lớp bảo vệ ngay trước khi tạo kiểu cho t&oacute;c với nhiệt. Nhờ đ&oacute; t&oacute;c được bảo vệ ho&agrave;n hảo trước t&aacute;c động của nhiệt v&agrave; h&oacute;a chất.</p>\r\n\r\n<p>Xịt Dưỡng T&oacute;c Davines Nourishing Keratin Sealer 100ml</p>\r\n\r\n<h3><strong>Hướng dẫn sử dụng xịt dưỡng t&oacute;c cho hiệu quả tốt</strong></h3>\r\n\r\n<p>Sau khi gội đầu xong, d&ugrave;ng khăn lau kh&ocirc; rồi chia t&oacute;c th&agrave;nh c&aacute;c phần nhỏ</p>\r\n\r\n<p>Xịt dưỡng t&oacute;c từ 2 đến 3 lần v&agrave;o từng phần t&oacute;c</p>\r\n\r\n<p>Sau đ&oacute; d&ugrave;ng lược chải đều v&agrave; sấy kh&ocirc;</p>\r\n\r\n<p>Sử dụng sản phẩm h&agrave;ng ng&agrave;y kết hợp dầu gội, dầu xả c&ugrave;ng t&aacute;c dụng để đạt hiệu quả tối đa</p>\r\n\r\n<p><em>Xịt Dưỡng T&oacute;c Davines Nourishing Keratin Sealer chắc chắn l&agrave; sản phẩm kh&ocirc;ng thể thiếu với những anh em đam m&ecirc; tạo kiểu cho m&aacute;i t&oacute;c. Sở hữu sản phẩm tuyệt vời n&agrave;y, anh em c&oacute; thể thoải m&aacute;i thay đổi kiểu t&oacute;c m&agrave; kh&ocirc;ng lo ngại t&oacute;c sẽ kh&ocirc; xơ hư tổn. Sản phẩm được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại 30Shine Store. Anh em h&atilde;y đến 30Shine để sở hữu ngay một em xịt dưỡng bảo vệ&nbsp; m&aacute;i t&oacute;c. 30Shine lu&ocirc;n cung cấp sản phẩm ch&iacute;nh h&atilde;ng chất lượng h&agrave;ng đầu thị trường chắc chắn sẽ kh&ocirc;ng l&agrave;m anh em thất vọng.</em></p>', 1, 1, 8, 99, '2024-06-22 02:24:59', '2024-06-23 01:29:26'),
(22, 'Gel Davines giảm rụng tóc Energizing', 'gel-davines-giam-rung-toc-energizing', 520000, 505000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<h2><strong>GEL giảm RỤNG T&Oacute;C DAVINES ENERGIZING &ndash; &ldquo;CH&Acirc;N &Aacute;I&rdquo; CỦA TEAM T&Oacute;C THƯA MỎNG, G&Atilde;Y RỤNG</strong></h2>\r\n\r\n<p><em>M&aacute;i t&oacute;c thưa thớt, mỏng xẹp v&agrave; g&atilde;y rụng khiến nhiều anh em mất đi tự tin, đồng thời cũng l&agrave;m cho anh em tr&ocirc;ng thiếu sức sống v&agrave; gi&agrave; nua r&otilde; rệt. Nếu đang gặp phải t&igrave;nh trạng n&agrave;y th&igrave; </em><em>Gel Davines Energizing với khả năng giảm rụng t&oacute;c, chăm s&oacute;c t&oacute;c vượt trội ch&iacute;nh l&agrave; sự lựa chọn tuyệt vời cho anh em.</em></p>\r\n\r\n<h3><strong>Davines &ndash; &ldquo;&Ocirc;ng ho&agrave;ng&rdquo; của l&agrave;ng mỹ phẩm &Yacute;</strong></h3>\r\n\r\n<p>Được th&agrave;nh lập ở Parma (&Yacute;) v&agrave;o năm 1983 bởi gia đ&igrave;nh Bollati, tập đo&agrave;n Davines ban đầu chỉ l&agrave; một ph&ograve;ng th&iacute; nghiệm với mục đ&iacute;ch nghi&ecirc;n cứu v&agrave; tạo ra những sản phẩm chăm s&oacute;c t&oacute;c theo đơn h&agrave;ng của c&aacute;c c&ocirc;ng ty mỹ phẩm nổi tiếng thế giới.</p>\r\n\r\n<p><img src=\"https://static.30shine.com/shop-admin/2021/09/04/30S0IE4P-18.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\">Gel Davines giảm rụng Energizing</p>\r\n\r\n<p>Sau hơn một thập kỷ m&agrave;i giũa kinh nghiệm, tập đo&agrave;n Davines ch&iacute;nh thức cho ra đời thương hiệu Davines chuy&ecirc;n sản xuất v&agrave; ph&acirc;n phối c&aacute;c sản phẩm chăm s&oacute;c t&oacute;c cao cấp chuy&ecirc;n d&ugrave;ng tại salon. Với mục ti&ecirc;u tạo ra cuộc sống tốt đẹp cho tất cả mọi người th&ocirc;ng qua vẻ đẹp, đạo đức v&agrave; sự ph&aacute;t triển bền vững, Davines kh&ocirc;ng ngừng cải tiến v&agrave; ph&aacute;t triển sản phẩm. Kh&ocirc;ng kh&oacute; l&yacute; giải v&igrave; sao c&aacute;c d&ograve;ng sản phẩm của Davines đều nhận được sự tin tưởng tuyệt đối của h&agrave;ng triệu người ti&ecirc;u d&ugrave;ng tr&ecirc;n to&agrave;n thế giới.</p>\r\n\r\n<p>Davines hiện đang l&agrave; một c&ocirc;ng ty đa quốc gia h&ugrave;ng mạnh với sự hiện diện tại hơn 90 quốc gia v&agrave; đội ngũ nh&acirc;n vi&ecirc;n đa văn h&oacute;a. Ngo&agrave;i văn ph&ograve;ng ch&iacute;nh tại Parma, Davines c&ograve;n c&oacute; văn ph&ograve;ng tại New York, London, Paris, Mexico City, Deventer (H&agrave; Lan) v&agrave; Hồng K&ocirc;ng. Davines cũng l&agrave; c&aacute;i t&ecirc;n thường xuy&ecirc;n xuất hiện tại c&aacute;c trang b&igrave;a tạp ch&iacute;, tuần lễ thời trang v&agrave; c&aacute;c sự kiện về t&oacute;c mang tầm cỡ quốc tế.</p>\r\n\r\n<h3><strong>Gel Davines giảm rụng Energizing &ndash; &ldquo;Thần dược&rdquo; cho m&aacute;i t&oacute;c thưa mỏng, g&atilde;y rụng</strong></h3>\r\n\r\n<p>T&igrave;nh trạng t&oacute;c hư tổn, g&atilde;y rụng dẫn đến m&aacute;i t&oacute;c mỏng xẹp, thiếu sức sống l&agrave; nỗi khổ của kh&ocirc;ng &iacute;t anh em. Nhưng Gel Davines Energizing với sức mạnh giảm t&oacute;c g&atilde;y rụng đột ph&aacute; ch&iacute;nh l&agrave; &ldquo;ch&igrave;a kh&oacute;a&rdquo; để giải quyết vấn đề n&agrave;y.</p>\r\n\r\n<p><img src=\"https://static.30shine.com/shop-admin/2021/09/04/30SJPQ17-19.jpg\" /></p>\r\n\r\n<p>Gel Davines Trị rụng Energizing</p>\r\n\r\n<p>Gel Davines Energizing l&agrave; sản phẩm được thiết kế d&agrave;nh ri&ecirc;ng cho những người c&oacute; m&aacute;i t&oacute;c mỏng, yếu, thường xuy&ecirc;n phải đối mặt với vấn đề t&oacute;c hư tổn, g&atilde;y rụng. Th&agrave;nh phần ATP (Adenosine Triphosphate), Pro-vitamin B5, protein l&uacute;a m&igrave; c&oacute; trong Gel Davines Energizing thấm s&acirc;u v&agrave;o ch&acirc;n t&oacute;c, hỗ trợ qu&aacute; tr&igrave;nh trao đổi dưỡng chất v&agrave; ph&aacute;t triển tế b&agrave;o. Nhờ đ&oacute;, sản phẩm k&iacute;ch th&iacute;ch qu&aacute; tr&igrave;nh mọc t&oacute;c, gi&uacute;p t&oacute;c mọc nhanh v&agrave; nhiều hơn. Đồng thời củng cố th&acirc;n t&oacute;c v&agrave; tiếp th&ecirc;m sinh lực cho phần t&oacute;c mới mọc ra.</p>\r\n\r\n<p>Gel Davines Energizing cũng l&agrave;m chậm v&agrave; ph&ograve;ng chống qu&aacute; tr&igrave;nh rụng t&oacute;c theo m&ugrave;a, mang lại sức sống v&agrave; tăng độ d&agrave;y đ&aacute;ng kể cho m&aacute;i t&oacute;c. Anh em c&oacute; thể cảm nhận được m&aacute;i t&oacute;c trở n&ecirc;n d&agrave;y dặn, bồng bềnh vượt trội chỉ sau một thời gian sử dụng sản phẩm.</p>\r\n\r\n<h3><strong>Gel Davines giảm rụng Energizing &ndash; Chăm s&oacute;c t&oacute;c v&agrave; bảo vệ da đầu tối ưu</strong></h3>\r\n\r\n<p>C&aacute;c dưỡng chất c&oacute; trong Davines Energizing c&ograve;n c&oacute; sức mạnh tăng cường dưỡng chất v&agrave; dưỡng ẩm cho t&oacute;c, da đầu, khiến m&aacute;i t&oacute;c đ&agrave;n hồi v&agrave; b&oacute;ng mượt tự nhi&ecirc;n. Tinh dầu quế v&agrave; bạc h&agrave; gi&uacute;p tinh lọc, t&aacute;i tạo sinh lực cho da đầu v&agrave; tăng cường bảo vệ tế b&agrave;o tr&ecirc;n da đầu. Nhờ đ&oacute;, kh&ocirc;ng chỉ m&aacute;i t&oacute;c khỏe đẹp, &oacute;ng mượt m&agrave; ngay cả da đầu cũng được chăm s&oacute;c sạch sẽ v&agrave; khỏe mạnh vượt trội.</p>\r\n\r\n<p>Sản phẩm c&oacute; th&agrave;nh phần tinh dầu tự nhi&ecirc;n mang lại m&ugrave;i hương &ecirc;m &aacute;i v&agrave; cảm gi&aacute;c dễ chịu, khoan kho&aacute;i, tr&agrave;n đầy sức sống cho người sử dụng.</p>\r\n\r\n<h3><strong>Hướng dẫn sử dụng Davines Purifying</strong></h3>\r\n\r\n<p>Bước 1: Sau khi gội đầu v&agrave; thấm nước bằng khăn b&ocirc;ng, thoa đều Gel giảm rụng davines l&ecirc;n da đầu v&agrave; t&oacute;c ẩm.</p>\r\n\r\n<p>Bước 2: Nhẹ nh&agrave;ng xoa b&oacute;p để sản phẩm thẩm thấu v&agrave;o da đầu. Kh&ocirc;ng xả.</p>', 1, 1, 8, 189, '2024-06-22 02:26:43', '2024-06-23 01:29:27'),
(23, 'Gel rửa mặt cho da dầu mụn, sưng viêm La Roche-Posay', 'gel-rua-mat-cho-da-dau-mun-sung-viem-la-roche-posay', 295000, 280000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\n\n<p>Gel rửa mặt La Roche-Posay Effaclar Purifying Foaming Gel l&agrave; một sản phẩm chăm s&oacute;c da mặt đặc biệt, được thiết kế để đ&aacute;p ứng nhu cầu của l&agrave;n da dầu, mụn v&agrave; nhạy cảm.&nbsp;<a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\">Với c&ocirc;ng thức l&agrave;nh t&iacute;nh v&agrave; hiệu quả, sản phẩm n&agrave;y kh&ocirc;ng chỉ gi&uacute;p l&agrave;m sạch s&acirc;u m&agrave; c&ograve;n kiểm so&aacute;t dầu v&agrave; giảm thiểu t&igrave;nh trạng vi&ecirc;m sưng do mụn</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</p>\n\n<p><strong>Đặc điểm nổi bật của Gel rửa mặt La Roche-Posay:</strong></p>\n\n<ul>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Th&agrave;nh phần l&agrave;nh t&iacute;nh:</strong>&nbsp;Chứa&nbsp;<strong>nước kho&aacute;ng thi&ecirc;n nhi&ecirc;n La Roche-Posay</strong>&nbsp;v&agrave;&nbsp;<strong>ZinC PCA</strong>, gi&uacute;p l&agrave;m dịu da v&agrave; giảm k&iacute;ch ứng</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Độ pH 5.5:</strong>&nbsp;Ph&ugrave; hợp với độ pH tự nhi&ecirc;n của da, gi&uacute;p củng cố h&agrave;ng r&agrave;o bảo vệ da m&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c kh&ocirc; căng</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Kết cấu dạng gel:</strong>&nbsp;Tạo bọt nhẹ nh&agrave;ng, mang lại cảm gi&aacute;c tươi m&aacute;t v&agrave; sảng kho&aacute;i sau khi rửa mặt</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Dung t&iacute;ch đa dạng:</strong>&nbsp;C&oacute; sẵn trong c&aacute;c dung t&iacute;ch&nbsp;<strong>50ml, 200ml, v&agrave; 400ml</strong>, ph&ugrave; hợp với nhu cầu sử dụng kh&aacute;c nhau</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n</ul>\n\n<p><strong>Lợi &iacute;ch khi sử dụng sản phẩm:</strong></p>\n\n<ul>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>L&agrave;m sạch s&acirc;u:</strong>&nbsp;Loại bỏ bụi bẩn, tạp chất v&agrave; b&atilde; nhờn dư thừa tr&ecirc;n da hiệu quả</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Kiểm so&aacute;t dầu:</strong>&nbsp;Gi&uacute;p điều tiết lượng dầu tiết ra tr&ecirc;n da, từ đ&oacute; kiểm so&aacute;t b&oacute;ng dầu v&agrave; b&atilde; nhờn dư thừa</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Giảm mụn đầu đen:</strong>&nbsp;ZinC PCA c&oacute; khả năng kiềm dầu, gi&uacute;p giảm h&igrave;nh th&agrave;nh mụn đầu đen</a><a href=\"https://www.lixibox.com/magazine/5-gel-rua-mat-duoc-my-pham-cho-da-dau-mun-vua-lam-sach-sau-lai-khong-lo-gay-mun\" target=\"_blank\"><sup>2</sup></a>.</li>\n	<li><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><strong>Ph&ugrave; hợp với da nhạy cảm:</strong>&nbsp;C&ocirc;ng thức được lựa chọn kỹ c&agrave;ng, ph&ugrave; hợp cho l&agrave;n da dầu, mụn v&agrave; nhạy cảm</a><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\"><sup>1</sup></a>.</li>\n</ul>\n\n<p><strong>Hướng dẫn sử dụng:</strong></p>\n\n<ol>\n	<li>L&agrave;m ướt mặt với nước ấm để gi&uacute;p th&ocirc;ng tho&aacute;ng lỗ ch&acirc;n l&ocirc;ng.</li>\n	<li>Lấy một lượng gel vừa đủ v&agrave; tạo bọt trong l&ograve;ng b&agrave;n tay.</li>\n	<li>M&aacute;t xa nhẹ nh&agrave;ng l&ecirc;n mặt, tập trung v&agrave;o khu vực chữ T v&agrave; cổ.</li>\n	<li>Rửa sạch lại với nước lạnh để gi&uacute;p thu nhỏ lỗ ch&acirc;n l&ocirc;ng.</li>\n</ol>\n\n<p><a href=\"https://hasaki.vn/san-pham/gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-68810.html\" target=\"_blank\">Ngo&agrave;i ra, sản phẩm n&agrave;y c&ograve;n được đ&aacute;nh gi&aacute; cao về khả năng chịu đựng, kh&ocirc;ng g&acirc;y k&iacute;ch ứng da v&agrave; mắt, ph&ugrave; hợp với da bị k&iacute;ch ứng v&agrave; da nhạy cảm</a>. Đ&acirc;y chắc chắn l&agrave; một lựa chọn tuyệt vời cho việc chăm s&oacute;c da h&agrave;ng ng&agrave;y của bạn, gi&uacute;p bạn duy tr&igrave; l&agrave;n da sạch mịn, tho&aacute;ng nhẹ v&agrave; tươi m&aacute;t.</p>', 1, 3, 4, 88, '2024-06-22 02:28:43', '2024-06-23 02:26:53'),
(24, 'Gel rửa mặt Tạo nhiệt Cấp ẩm Uno Hot Clear Gel', 'gel-rua-mat-tao-nhiet-cap-am-uno-hot-clear-gel', 95000, 80000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\n\n<p>&nbsp;</p>', 1, 3, 5, 56, '2024-06-22 02:35:07', '2024-06-23 02:24:16'),
(25, 'Sữa rửa mặt Tạo bọt Sạch nhờn UNO Whip Wash Black', 'sua-rua-mat-tao-bot-sach-nhon-uno-whip-wash-black', 96000, 90000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<h2>UNO WHIP WASH BLACK</h2>\r\n\r\n<h2>Sữa rửa mặt tạo bọt sạch nhờn</h2>\r\n\r\n<p>- L&agrave;m sạch b&atilde; nhờn, bụi bẩn s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng v&agrave; cả tế b&agrave;o da chết, mang đến l&agrave;n da sạch s&acirc;u, hạn chế dầu nhờn &amp; giảm mụn.<br />\r\n- Cung cấp độ ẩm cho da ẩm, mềm mượt &amp; s&aacute;ng rạng rỡ.<br />\r\n- Cảm gi&aacute;c m&aacute;t lạnh sảng kho&aacute;i nhờ th&agrave;nh phần bạc h&agrave; tự nhi&ecirc;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Sữa rửa mặt Tạo bọt Sạch nhờn cho da dầu/da thường UNO Whip Wash Black 130g với th&agrave;nh phần Bọt đất s&eacute;t kho&aacute;ng kết hợp sức mạnh Than hoạt t&iacute;nh gi&uacute;p l&agrave;m sạch b&atilde; nhờn, bụi bẩn s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng v&agrave; cả tế b&agrave;o da chết.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ocirc;ng dụng:</p>\r\n\r\n<p>- Hạn chế dầu nhờn &amp; ngăn ngừa mụn.</p>\r\n\r\n<p>- Cung cấp độ ẩm cho da ẩm, mềm mượt &amp; s&aacute;ng rạng rỡ.</p>\r\n\r\n<p>- Bạc h&agrave; đem lại cảm gi&aacute;c m&aacute;t lạnh sảng kho&aacute;i.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hướng dẫn sử dụng:</p>\r\n\r\n<p>- Bước 1: L&agrave;m ướt mặt.</p>\r\n\r\n<p>- Bước 2: Lấy 1 lượng vừa đủ (khoảng 2-3 cm), tạo nhiều bọt với một &iacute;t nước, m&aacute;t xa mặt.</p>\r\n\r\n<p>- Bước 3: Rửa lại thật sạch với nước.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Th&ocirc;ng tin thương hiệu:</p>\r\n\r\n<p>Ra đời từ năm 1992 tại Nhật Bản, UNO hướng đến những người ch&agrave;ng trai trẻ tuổi tr&ecirc;n thế giới. UNO trong tiếng &Yacute; c&oacute; nghĩa l&agrave; số 1, duy nhất v&agrave; độc đ&aacute;o trong mọi lĩnh vực. UNO mong muốn gi&uacute;p những ch&agrave;ng trai trẻ đạt đến đỉnh cao của sự s&agrave;nh điệu, đồng h&agrave;nh để theo đuổi những xu hướng mới nhất tr&ecirc;n thế giới.</p>\r\n\r\n<p>HSD: 3 năm kể từ ng&agrave;y sản xuất.</p>\r\n\r\n<p>NSX: Xem tr&ecirc;n bao b&igrave; sản phẩm.</p>\r\n\r\n<p>Xuất xứ thương hiệu: Nhật Bản.</p>\r\n\r\n<p>Nơi sản xuất: Việt Nam.</p>\r\n\r\n<p>Hướng dẫn bảo quản: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p>Th&agrave;nh phần: xem tr&ecirc;n bao b&igrave; sản phẩm.</p>', 1, 3, 5, 77, '2024-06-22 02:36:01', '2024-06-23 01:29:28'),
(26, 'Sữa rửa mặt Tạo bọt Dạng hạt Sáng da UNO Whip Wash Scrub', 'sua-rua-mat-tao-bot-dang-hat-sang-da-uno-whip-wash-scrub', 96000, 90000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\n\n<p>Sữa rửa mặt Tạo bọt Dạng hạt S&aacute;ng da UNO Whip Wash Scrub l&agrave; một sản phẩm chăm s&oacute;c da mặt đặc biệt từ thương hiệu UNO của Nhật Bản, được thiết kế để ph&ugrave; hợp với l&agrave;n da nam giới.&nbsp;Với c&ocirc;ng thức độc đ&aacute;o kết hợp&nbsp;<strong>bọt đất s&eacute;t kho&aacute;ng</strong>&nbsp;v&agrave;&nbsp;<strong>hạt tẩy tế b&agrave;o da chết</strong>, sản phẩm n&agrave;y kh&ocirc;ng chỉ gi&uacute;p l&agrave;m sạch s&acirc;u lỗ ch&acirc;n l&ocirc;ng m&agrave; c&ograve;n gi&uacute;p da trở n&ecirc;n s&aacute;ng v&agrave; mịn m&agrave;ng hơn.</p>\n\n<p><strong>C&ocirc;ng dụng ch&iacute;nh của Sữa rửa mặt UNO Whip Wash Scrub:</strong></p>\n\n<ul>\n	<li><strong>L&agrave;m sạch s&acirc;u:</strong>&nbsp;Loại bỏ b&atilde; nhờn, bụi bẩn v&agrave; tế b&agrave;o da chết, gi&uacute;p ngăn ngừa mụn đầu đen.</li>\n	<li><strong>Dưỡng ẩm:</strong>&nbsp;Cung cấp độ ẩm cần thiết, gi&uacute;p da mềm mại v&agrave; kh&ocirc;ng bị kh&ocirc; sau khi rửa mặt.</li>\n	<li><strong>Tạo bọt mịn:</strong>&nbsp;Bọt đất s&eacute;t kho&aacute;ng tạo lớp bọt d&agrave;y v&agrave; mịn, mang lại cảm gi&aacute;c thoải m&aacute;i khi sử dụng.</li>\n	<li><strong>M&aacute;t lạnh:</strong>&nbsp;Chiết xuất bạc h&agrave; mang lại cảm gi&aacute;c m&aacute;t lạnh v&agrave; sảng kho&aacute;i sau khi rửa mặt.</li>\n</ul>\n\n<p><strong>Th&agrave;nh phần nổi bật:</strong></p>\n\n<ul>\n	<li><strong>Bọt đất s&eacute;t kho&aacute;ng:</strong>&nbsp;Gi&uacute;p tạo bọt d&agrave;y v&agrave; mịn, l&agrave;m sạch&nbsp;s&acirc;u.</li>\n	<li><strong>Hạt tẩy tế b&agrave;o da chết:</strong>&nbsp;Nhẹ nh&agrave;ng loại bỏ tế b&agrave;o da chết, gi&uacute;p da s&aacute;ng v&agrave; mịn m&agrave;ng.</li>\n	<li><strong>Chiết xuất bạc h&agrave;:</strong>&nbsp;Mang lại cảm gi&aacute;c m&aacute;t lạnh v&agrave; sảng kho&aacute;i.</li>\n</ul>\n\n<p><strong>Hướng dẫn sử dụng:</strong></p>\n\n<ol>\n	<li>L&agrave;m ướt mặt với nước.</li>\n	<li>Lấy một lượng sản phẩm vừa đủ (khoảng 2-3 cm).</li>\n	<li>Tạo nhiều bọt với một &iacute;t nước v&agrave; m&aacute;t xa nhẹ nh&agrave;ng l&ecirc;n mặt.</li>\n	<li>Rửa sạch lại với nước.</li>\n</ol>\n\n<p>Sản phẩm c&oacute; dung t&iacute;ch&nbsp;<strong>130g</strong>, th&iacute;ch hợp cho da thường v&agrave; da dầu.&nbsp;Được sản xuất tại Việt Nam dưới sự gi&aacute;m s&aacute;t chất lượng của thương hiệu Nhật Bản, UNO Whip Wash Scrub c&oacute; hạn sử dụng l&ecirc;n đến&nbsp;<strong>3 năm</strong>&nbsp;kể từ ng&agrave;y sản xuất. Đ&acirc;y l&agrave; một lựa chọn tuyệt vời cho nam giới mong muốn c&oacute; một l&agrave;n da sạch s&acirc;u v&agrave; s&aacute;ng khỏe mỗi ng&agrave;y.</p>', 1, 3, 5, 43, '2024-06-22 02:36:53', '2024-06-23 01:29:30'),
(27, 'Sữa rửa mặt Dr. for Skin Charcoal than hoạt tính New 2023 100g Trắng da kiềm dầu', 'sua-rua-mat-dr-for-skin-charcoal-than-hoat-tinh-new-2023-100g-trang-da-kiem-dau', 179000, 129000, '<h2><strong>Th&ocirc;ng tin sản phẩm</strong></h2>\r\n\r\n<p>Sữa rửa mặt Dr. for Skin Charcoal than hoạt t&iacute;nh New 2023 100g Trắng da kiềm dầu</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Th&agrave;nh phần</strong>:</p>\r\n\r\n	<ul>\r\n		<li><strong>Than hoạt t&iacute;nh</strong>: Kết hợp với&nbsp;<strong>Salicylic Acid</strong>,&nbsp;<strong>Quả Lựu</strong>,&nbsp;<strong>Rau Sam</strong>,&nbsp;<strong>B&iacute; đỏ</strong>,&nbsp;<strong>gạo</strong>, v&agrave;&nbsp;<strong>yến mạch</strong>.</li>\r\n		<li>Sữa rửa mặt Dr. for Skin Charcoal c&oacute; nguồn gốc từ&nbsp;<strong>bột than</strong>, c&oacute; khả năng hấp thụ mạnh h&uacute;t c&aacute;c tạp chất v&agrave; l&agrave;m sạch tuyệt vời.</li>\r\n		<li>Chiết xuất l&ecirc;n men từ thực vật, kết hợp với th&agrave;nh phần l&ecirc;n men từ ng&ocirc; v&agrave; c&aacute;c thảo dược, sản phẩm c&oacute; nhiều&nbsp;<strong>vitamin A</strong>&nbsp;v&agrave; c&aacute;c vitamin l&agrave;m mềm mịn da.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>C&ocirc;ng dụng</strong>:</p>\r\n\r\n	<ul>\r\n		<li>Loại bỏ tế b&agrave;o chết hiệu quả.</li>\r\n		<li>L&agrave;m sạch s&acirc;u, thẩm thấu dưỡng da s&acirc;u.</li>\r\n		<li>Kiềm dầu, ngừa mụn.</li>\r\n		<li>Gi&uacute;p l&agrave;n da trắng s&aacute;ng, khoẻ mạnh, kh&ocirc;ng c&ograve;n dấu hiệu của mụn.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Hướng dẫn sử dụng</strong>:</p>\r\n\r\n	<ol>\r\n		<li>Lấy một lượng nhỏ sữa rửa mặt ra tay, tạo bọt.</li>\r\n		<li>Xoa đều l&ecirc;n mặt, m&aacute;t-xa khoảng 2-3 ph&uacute;t.</li>\r\n		<li>Rửa sạch mặt với nước.</li>\r\n	</ol>\r\n	</li>\r\n</ul>\r\n\r\n<p>Sữa rửa mặt Dr. for Skin Charcoal than hoạt t&iacute;nh New 2023 100g l&agrave; lựa chọn tốt để chăm s&oacute;c da nam giới, gi&uacute;p da trắng s&aacute;ng v&agrave; khỏe mạnh.</p>', 1, 3, 3, 105, '2024-06-22 02:40:13', '2024-06-23 01:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, '2024-06-21 03:51:02', '2024-06-21 03:51:02'),
(2, 'Nhân viên', NULL, '2024-06-21 03:51:08', '2024-06-21 04:13:31'),
(3, 'Khách hàng', NULL, '2024-06-21 03:51:14', '2024-06-21 03:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ZZitRCCLKHuSbthe9n76bECRrv1CY1CJnxt0br5L', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMk40azVwclc1c2ZnY0FKUXZhYTBRQzdFQTdvMWlMOHdpdzBwUzc4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iaWxscyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJ1c2VyIjtPOjIxOiJMZW9cVXNlcnNcTW9kZWxzXFVzZXIiOjMyOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjU6InVzZXJzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTA6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjE6Imxlb2RvbXNvbGFyQGdtYWlsLmNvbSI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJDVuc3hNQ3hvOWYzY2lSamoybE5GOWUwd3RKa3JKQ0NIdDZLU2l0WFE0RDVDOTkzRlQ5SHF1IjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7czo2MDoiZHZFektZOTV4UHdiZUlFY3RhQ0F4TE1hdG1ja3BxYVVBTEtCcFlaVmhRSU5qQmJGWUc2NklZZ0dWZjdCIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI0LTA2LTIxIDE2OjU1OjExIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI0LTA2LTI2IDA1OjA0OjE3IjtzOjY6ImlkUm9sZSI7aToxO3M6Njoic3RhdHVzIjtpOjE7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjM7czo0OiJuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjIxOiJsZW9kb21zb2xhckBnbWFpbC5jb20iO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiQ1bnN4TUN4bzlmM2NpUmpqMmxORjllMHd0SmtySkNDSHQ2S1NpdFhRNEQ1Qzk5M0ZUOUhxdSI7czoxNDoicmVtZW1iZXJfdG9rZW4iO3M6NjA6ImR2RXpLWTk1eFB3YmVJRWN0YUNBeExNYXRtY2twcWFVQUxLQnBZWlZoUUlOakJiRllHNjZJWWdHVmY3QiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNC0wNi0yMSAxNjo1NToxMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNC0wNi0yNiAwNTowNDoxNyI7czo2OiJpZFJvbGUiO2k6MTtzOjY6InN0YXR1cyI7aToxO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjI6e3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjg6InBhc3N3b3JkIjtzOjY6Imhhc2hlZCI7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YToyOntpOjA7czo4OiJwYXNzd29yZCI7aToxO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6NTp7aTowO3M6NDoibmFtZSI7aToxO3M6NToiZW1haWwiO2k6MjtzOjg6InBhc3N3b3JkIjtpOjM7czo2OiJpZFJvbGUiO2k6NDtzOjY6InN0YXR1cyI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fXM6MTk6IgAqAGF1dGhQYXNzd29yZE5hbWUiO3M6ODoicGFzc3dvcmQiO3M6MjA6IgAqAHJlbWVtYmVyVG9rZW5OYW1lIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7fX0=', 1719543955);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desktop` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `slug`, `status`, `url`, `desktop`, `mobile`, `created_at`, `updated_at`) VALUES
(15, 'Home Slide', 'home-slide', 1, NULL, '240426_banner_1000_w.jpg', '240426_banner_1000_m.jpg', '2024-06-26 09:14:24', '2024-06-26 09:14:59'),
(16, 'Home Slide', 'home-slide', 0, NULL, '240426_banner_binhan_w.jpg', '240426_banner_binhan_m.jpg', '2024-06-26 09:14:43', '2024-06-26 09:14:43'),
(17, 'Home Slide', 'home-slide', 1, NULL, '20240311_banner_dkp_w.jpeg', '20240311_banner_dkp_m.jpeg', '2024-06-26 09:14:58', '2024-06-26 09:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idRole` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `idRole`, `status`) VALUES
(3, 'admin', 'leodomsolar@gmail.com', NULL, '$2y$12$5nsxMCxo9f3ciRjj2lNF9e0wtJkrJCCHt6KSitXQ4D5C993FT9Hqu', 'dvEzKY95xPwbeIEctaCAxLMatmckpqaUALKBpYZVhQINjBbFYG66IYgGVf7B', '2024-06-21 09:55:11', '2024-06-25 22:04:17', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_id_customer_foreign` (`id_customer`),
  ADD KEY `carts_id_product_foreign` (`id_product`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_id_parent_foreign` (`id_parent`);

--
-- Indexes for table `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoa_don_chi_tiet_id_hoa_don_foreign` (`id_hoa_don`),
  ADD KEY `hoa_don_chi_tiet_id_product_foreign` (`id_product`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_idcate_foreign` (`idCate`),
  ADD KEY `products_idbrand_foreign` (`idBrand`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_idrole_foreign` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `hoa_don`
--
ALTER TABLE `hoa_don`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `carts_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_id_parent_foreign` FOREIGN KEY (`id_parent`) REFERENCES `products` (`id`);

--
-- Constraints for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  ADD CONSTRAINT `hoa_don_chi_tiet_id_hoa_don_foreign` FOREIGN KEY (`id_hoa_don`) REFERENCES `hoa_don` (`id`),
  ADD CONSTRAINT `hoa_don_chi_tiet_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_idbrand_foreign` FOREIGN KEY (`idBrand`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_idcate_foreign` FOREIGN KEY (`idCate`) REFERENCES `categories` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_idrole_foreign` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
