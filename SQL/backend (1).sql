-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2024 at 09:58 AM
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
(3, 'Dr For Skin (Skin Dr)', 'dr-for-skin-skin-dr', 1, '2024-06-21 23:27:32', '2024-06-21 23:27:32');

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dướng tóc', 'duong-toc', 1, '2024-06-21 05:40:47', '2024-06-21 23:12:12'),
(3, 'Sữa rửa mặt', 'sua-rua-mat', 1, '2024-06-21 23:24:05', '2024-06-21 23:24:05');

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
(1, '30S1B1IS-5.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(2, '30S08OQK-7.jpg', 1, 1, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(3, '30S9LUM8-1.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(4, '30S6283O-3.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(5, '30SF3Q4K-5.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(6, '30SR3IDD-2.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(7, '30SS6MGW-4.jpg', 1, 0, '2024-06-21 23:11:48', '2024-06-21 23:20:10'),
(8, '30S2DQIY-GLANZEN MAGIC SPRAY-9 (1).jpg', 2, 0, '2024-06-21 23:14:03', '2024-06-21 23:20:22'),
(9, '30S2DQIY-GLANZEN MAGIC SPRAY-9.jpg', 2, 1, '2024-06-21 23:14:03', '2024-06-21 23:20:22'),
(10, '30SC3WAR-1.jpg', 2, 0, '2024-06-21 23:14:03', '2024-06-21 23:20:22'),
(11, '30SEPRSW-2.jpg', 2, 0, '2024-06-21 23:14:03', '2024-06-21 23:20:22'),
(12, '30SNXG0L-3.jpg', 2, 0, '2024-06-21 23:14:03', '2024-06-21 23:20:22'),
(13, '30S9LX64-u-toc-davines-oi-hair-butter-250ml (1).jpg', 3, 0, '2024-06-21 23:19:23', '2024-06-21 23:20:34'),
(14, '30S9LX64-u-toc-davines-oi-hair-butter-250ml.jpg', 3, 0, '2024-06-21 23:19:23', '2024-06-21 23:20:34'),
(15, '30S23131-u-toc-Davines-Oi-Hair-Butter-1000ml.jpg', 3, 1, '2024-06-21 23:19:23', '2024-06-21 23:20:34'),
(16, '30S48JNA-143751232_431309368090379_8350052097756210709_n.jpg', 4, 0, '2024-06-21 23:22:59', '2024-06-21 23:31:23'),
(17, '30SB70VL-149510651_253697762865678_942789993904892863_n.jpg', 4, 1, '2024-06-21 23:22:59', '2024-06-21 23:31:23'),
(18, '30SDLXT6-1 (1).jpg', 4, 0, '2024-06-21 23:22:59', '2024-06-21 23:31:23'),
(19, '30SDLXT6-1.jpg', 4, 0, '2024-06-21 23:22:59', '2024-06-21 23:31:23'),
(20, '30SGIFN3-156608710_1126222007825907_6766930635585725325_n.jpg', 4, 0, '2024-06-21 23:22:59', '2024-06-21 23:31:23'),
(21, '30SH1KW0-sg-11134201-22120-0e8f6y6iz4kvd1_tn.jpeg', 5, 0, '2024-06-21 23:29:08', '2024-06-21 23:31:37'),
(22, '30SH3AFF-sg-11134201-22120-1mume31iz4kv9a_tn.jpeg', 5, 0, '2024-06-21 23:29:08', '2024-06-21 23:31:37'),
(23, '30SJGWF9-image_5.jpg', 5, 0, '2024-06-21 23:29:08', '2024-06-21 23:31:37'),
(24, '30SKV9PL-image_3.jpg', 5, 0, '2024-06-21 23:29:08', '2024-06-21 23:31:37'),
(25, '30SMMEIF-vn-11134207-7r98o-lof4ti19hbxzac.jpg', 5, 1, '2024-06-21 23:29:08', '2024-06-21 23:31:37'),
(26, '30SEY66S-7.jpg', 6, 0, '2024-06-21 23:31:17', '2024-06-21 23:32:11'),
(27, '30SLJUNF-4.jpg', 6, 1, '2024-06-21 23:31:17', '2024-06-21 23:32:11'),
(28, '30SLRUSD-5.jpg', 6, 0, '2024-06-21 23:31:17', '2024-06-21 23:32:11'),
(29, '30SOZTUI-Gel rửa mặt cho da dầu mụn Drforskin (1).jpg', 6, 0, '2024-06-21 23:31:17', '2024-06-21 23:32:11'),
(30, '30SOZTUI-Gel rửa mặt cho da dầu mụn Drforskin.jpg', 6, 0, '2024-06-21 23:31:17', '2024-06-21 23:32:11');

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
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint UNSIGNED NOT NULL,
  `id_links` bigint UNSIGNED NOT NULL,
  `id_parent` bigint UNSIGNED NOT NULL,
  `link_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(10, '2024_06_21_223580_create_products_table', 7),
(11, '2024_06_22_140235_create_product_collections_table', 7),
(12, '2024_06_22_151048_create_slides_table', 8);

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
(1, 'admin_permissions', NULL, '2024-06-21 07:22:17', '2024-06-21 07:23:41'),
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
(1, 'Tinh dầu dưỡng tóc ATS For man Styling Oil 80ml', 'tinh-dau-duong-toc-ats-for-man-styling-oil-80ml', 550000, 500000, '<p><span style=\"font-size:20px\">L&agrave; sản phẩm chăm s&oacute;c t&oacute;c tự nhi&ecirc;n, c&oacute; c&ocirc;ng dụng cung cấp dưỡng chất v&agrave; độ ẩm cho m&aacute;i t&oacute;c v&agrave; da đầu, trong th&agrave;nh phần của n&oacute; c&oacute; chứa tới hơn 60% l&agrave; bơ v&agrave; dầu hoa tr&agrave;, c&ugrave;ng với đ&oacute; l&agrave; acid amin, vitamin E &amp; độ ẩm, gi&uacute;p cải thiện tối đa t&igrave;nh trạng l&atilde;o h&oacute;a t&oacute;c, đồng thời ngăn ngừa hư tổn hiệu quả tr&ecirc;n t&oacute;c.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Cung cấp độ s&aacute;ng 4.5/5 v&agrave; Điểm Care (mức độ thẩm thấu của dưỡng chất) 5/5. Kh&ocirc;ng chứa Gluten, Para, Paraben (h&oacute;a chất bảo quản c&ocirc;ng nghiệp), Alcohol (cồn) v&agrave; Sulfate (chất tẩy rửa c&ocirc;ng nghiệp). C&oacute; thể sử dụng tr&ecirc;n hầu hết mọi chất t&oacute;c v&agrave; da đầu. Dễ d&agrave;ng thẩm thấu v&agrave;o s&acirc;u ch&acirc;n t&oacute;c, mang lại sự thoải m&aacute;i t&oacute;c người d&ugrave;ng.</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>Th&agrave;nh phần:</strong> Hợp chất Hyaluronic gi&uacute;p cung cấp năng lượng, độ ẩm, độ đ&agrave;n hồi v&agrave; độ b&oacute;ng cho m&aacute;i t&oacute;c. Galactomyces đ&acirc;y l&agrave; một loại men rượu tự nhi&ecirc;n c&oacute; gi&aacute; trị cao, chứa nhiều loại axit amin, axit hữu cơ, vitamin, kho&aacute;ng chất gi&uacute;p cho việc nu&ocirc;i dưỡng t&oacute;c ho&agrave;n hảo hơn. CM Plex gi&uacute;p t&aacute;i tạo cấu tr&uacute;c, li&ecirc;n kết của c&aacute;c ph&acirc;n tử sợi t&oacute;c.</span></p>', 1, 1, 2, 21, '2024-06-21 23:11:48', '2024-06-21 23:26:35'),
(2, 'Tinh dầu dưỡng tóc Arren Men\'s Grooming 100ml', 'tinh-dau-duong-toc-arren-mens-grooming-100ml', 369000, 360000, '<p>Dầu dưỡng đa năng Arren Multicare cung cấp c&aacute;c th&agrave;nh phần dưỡng t&oacute;c, gi&uacute;p<br />\r\nt&oacute;c b&oacute;ng mềm như &yacute;. Th&iacute;ch hợp cho mọi loại t&oacute;c.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>hướng dẫn sử dụng</p>\r\n\r\n<p>Cho một lượng vừa đủ ra l&ograve;ng b&agrave;n tay rồi thoa đều l&ecirc;n t&oacute;c. Kh&ocirc;ng<br />\r\ncần xả lại với nước.</p>', 1, 1, 2, 200, '2024-06-21 23:14:03', '2024-06-21 23:26:42'),
(3, 'Kem ủ tóc Davines Oi Hair Butter – 250ml, phục hồi hư tổn, tăng độ bóng mượt', 'kem-u-toc-davines-oi-hair-butter-250ml-phuc-hoi-hu-ton-tang-do-bong-muot', 175000, 165000, '<p><span style=\"font-size:20px\">Davines Oi Hair Butter l&agrave; loại một loại kem ủ, hay c&ograve;n gọi l&agrave; mặt nạ, dầu hấp c&oacute; t&aacute;c dụng phục hồi hư tổn chuy&ecirc;n s&acirc;u cho m&aacute;i t&oacute;c, gi&uacute;p t&oacute;c b&oacute;ng, mượt hơn</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px\">Với h&agrave;m lượng dầu Roucou dồi d&agrave;o c&oacute; chứa nhiều Beta-carotene hơn 100 lần so với c&agrave; rốt,vitamin A gi&uacute;p da đầu v&agrave; t&oacute;c khoẻ mạnh, t&aacute;i tạo cấu tr&uacute;c, k&iacute;ch th&iacute;ch sản sinh sắc tố Melanin, giảm hư tổn tế b&agrave;o do tia UV, chống l&atilde;o h&oacute;a, chứa nhiều axit ellatic c&oacute; t&aacute;c dụng trung h&ograve;a c&aacute;c gốc tự do từ đ&oacute; mang lại m&aacute;i t&oacute;c chắc khỏe, kh&ocirc;ng g&atilde;y rụng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sản phẩm th&iacute;ch hợp d&ugrave;ng trong c&aacute;c trị liệu hư tổn v&agrave; chăm s&oacute;c t&oacute;c h&agrave;ng ng&agrave;y</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Kh&ocirc;ng chứa chất bảo quản Parapen v&agrave; chất tạo m&agrave;u, th&acirc;n thiện với m&ocirc;i trường,an to&agrave;n cho cả da đầu nhạy cảm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hương thơm nhẹ nh&agrave;ng, dễ chịu mang lại cảm gi&aacute;c thư th&aacute;i sau mỗi lần d&ugrave;ng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Th&ocirc;ng tin sản phẩm:</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Xuất xứ: Made in Italy</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Dung t&iacute;ch: 250ml</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hạn sử dụng: 3 năm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Hướng dẫn sử dụng:</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sau khi gội đầu với dầu gội</span></p>\r\n\r\n<p><span style=\"font-size:20px\">D&ugrave;ng khăn b&ocirc;ng thấm kh&ocirc;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Lấy một lượng kem ủ vừa đủ thoa đều l&ecirc;n t&oacute;c</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Để khoảng 10 đến 15 ph&uacute;t rồi chải đều lại</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Xả sạch lại với nước</span></p>\r\n\r\n<p><span style=\"font-size:20px\">Sấy v&agrave; tạo kiểu theo &yacute; mu&ocirc;n</span></p>', 1, 1, 2, 85, '2024-06-21 23:19:23', '2024-06-21 23:26:47'),
(4, 'Xịt Dưỡng Tóc It\'s A 10 Miracle Leave-In Mềm Mượt Và Bảo Vệ Tóc 59ML', 'xit-duong-toc-its-a-10-miracle-leave-in-mem-muot-va-bao-ve-toc-59ml', 327000, 300000, '<p><span style=\"font-size:20px\">Xịt Dưỡng T&oacute;c It&#39;s A Mềm Mượt V&agrave; Bảo Vệ T&oacute;c 10 Miracle Leave-In 120ML</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>C&ocirc;ng dụng:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">Tạm biệt c&aacute;c bước chăm s&oacute;c t&oacute;c cầu k&igrave;, phức tạp! H&atilde;y ch&agrave;o đ&oacute;n người bạn BFF chăm s&oacute;c t&oacute;c mới của bạn, Sản phẩm Xịt dưỡng Miracle Leave-In của ch&uacute;ng t&ocirc;i. Sản phẩm tạo n&ecirc;n thương hiệu đ&igrave;nh đ&aacute;m, loại xịt dễ sử dụng n&agrave;y gi&uacute;p l&agrave;m mượt m&aacute;i t&oacute;c, loại bỏ xoăn rối, phục hồi độ b&oacute;ng v&agrave; tăng cường vẻ đẹp tự nhi&ecirc;n cho t&oacute;c của bạn. Bạn sẽ qu&ecirc;n ngay m&aacute;i t&oacute;c xẹp, hư tổn v&agrave; xỉn m&agrave;u.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><a href=\"https://myphamtocnhapkhau.com/it%E2%80%99s-a-10-my\"><strong>Xịt dưỡng It&#39;s A Miracle Leave-In</strong></a>&nbsp;của ch&uacute;ng t&ocirc;i chứa đầy c&aacute;c th&agrave;nh phần tự nhi&ecirc;n gi&uacute;p mang lại độ s&aacute;ng b&oacute;ng tự nhi&ecirc;n cho mọi loại t&oacute;c, đồng thời l&agrave;m cho t&oacute;c của bạn chắc khỏe hơn qua từng lần sử dụng. T&oacute;c mềm mại, bồng bềnh chưa bao giờ đơn giản hơn thế!</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><img alt=\"\" src=\"https://myphamtocnhapkhau.com/Upload/Editor/2023/4/1/xitduongtocitsamiracleleaveinproduct-66af.jpeg\" /></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>10 C&Ocirc;NG DỤNG TRONG MỖI CHAI:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">1. Nu&ocirc;i dưỡng t&oacute;c&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">2. Bảo vệ chống nhiệt</span></p>\r\n\r\n<p><span style=\"font-size:20px\">3. Gỡ rối&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">4. Chăm s&oacute;c m&agrave;u nhuộm</span></p>\r\n\r\n<p><span style=\"font-size:20px\">5. T&aacute;i tạo độ b&oacute;ng</span></p>\r\n\r\n<p><span style=\"font-size:20px\">6. Giảm thiểu rối x&ugrave;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">7. Bảo vệ chống lại tia UV</span></p>\r\n\r\n<p><span style=\"font-size:20px\">8. Hỗ trợ thay thế những protein bị mất&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:20px\">9. Tăng cường độ d&agrave;y th&acirc;n t&oacute;c</span></p>\r\n\r\n<p><span style=\"font-size:20px\">10. Ngăn ngừa chẻ ngọn</span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>C&aacute;ch sử dụng:</strong></span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Gội đầu v&agrave; sử dụng dầu xả t&oacute;c như b&igrave;nh thường.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Khi t&oacute;c bạn vẫn c&ograve;n ẩm, h&atilde;y sử dụng&nbsp;<a href=\"https://myphamtocnhapkhau.com/it%E2%80%99s-a-10-my\"><strong>xịt dưỡng It&rsquo;s a 10</strong></a>. Đối với t&oacute;c ngắn hoặc t&oacute;c lỡ, sử dụng từ 2 đến 3 lần xịt. Đối với t&oacute;c d&agrave;y hoặc d&agrave;i hơn, h&atilde;y sử dụng 4 đến 6 lần xịt.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Gỡ rối t&oacute;c, xịt đều từ ch&acirc;n t&oacute;c đến ngọn t&oacute;c. Sử dụng kỹ thuật ph&ugrave; hợp cho loại t&oacute;c của bạn.<br />\r\nT&oacute;c thẳng hoặc gợn s&oacute;ng - chải t&oacute;c bằng lược gỡ rối nhẹ.<br />\r\nT&oacute;c xoăn - chải t&oacute;c bằng ng&oacute;n tay, v&agrave; n&acirc;ng b&oacute;p để tạo h&igrave;nh c&aacute;c lọn t&oacute;c.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">- Ho&agrave;n th&agrave;nh th&oacute;i quen chăm s&oacute;c &amp; tạo kiểu t&oacute;c của bạn.</span></p>', 1, 1, 2, 80, '2024-06-21 23:22:59', '2024-06-21 23:26:55'),
(5, 'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree 100g', 'sua-rua-mat-tram-tra-skindr-tea-tree-100g', 269000, 229000, '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Sữa rửa mặt tr&agrave;m tr&agrave; Skin&amp;Dr Tea tree d&agrave;nh cho nam &ndash; Khắc tinh d&agrave;nh cho da mụn</strong></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><em>Kh&oacute;i bụi, mồ h&ocirc;i, b&atilde; nhờn... l&agrave; những nguy&ecirc;n nh&acirc;n trực tiếp dẫn đến t&igrave;nh trạng b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng, g&acirc;y ra c&aacute;c loại mụn ẩn, mụn trứng c&aacute;, mụn đầu đen... tr&ecirc;n l&agrave;n da nam giới. Vậy l&agrave;m thế n&agrave;o để khắc phục được t&igrave;nh trạng n&agrave;y? Sữa rửa mặt tr&agrave;m tr&agrave; Skin&amp;Dr Tea tree - </em>thuộc thương hiệu <a href=\"https://shop.30shine.com/thuong-hieu/skin-and-dr\" rel=\"noopener noreferrer\" target=\"_blank\">Skin &amp; Dr</a> <em>với khả năng l&agrave;m sạch s&acirc;u, kh&aacute;ng khuẩn v&agrave; kh&ocirc;ng g&acirc;y k&iacute;ch ứng cho da ch&iacute;nh l&agrave; cứu tinh d&agrave;nh cho c&aacute;c &ldquo;đấng m&agrave;y r&acirc;u&rdquo;.</em></span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>4 lợi &iacute;ch tuyệt vời của </strong><strong>sữa rửa mặt Skin Dr tr&agrave;m tr&agrave;</strong></span></span></h2>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Hiệu quả đa chiều cho l&agrave;n da ph&aacute;i mạnh</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">L&agrave;m sạch l&agrave; một bước v&ocirc; c&ugrave;ng quan trọng m&agrave; kh&ocirc;ng ai c&oacute; thể bỏ qua để c&oacute; một l&agrave;n da khỏe mạnh, rạng rỡ. Tuy nhi&ecirc;n, kh&ocirc;ng giống với sự chăm ch&uacute;t của hội chị em, c&aacute;c anh em thường &ldquo;qua loa&rdquo; trong bước n&agrave;y. Thậm ch&iacute; nhiều người nghĩ rằng chỉ cần rửa mặt bằng nước th&ocirc;i l&agrave; đủ.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Điều n&agrave;y dẫn đến việc tạp chất, bụi bẩn kh&ocirc;ng được loại bỏ ho&agrave;n to&agrave;n g&acirc;y b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng, h&igrave;nh th&agrave;nh mụn, vi&ecirc;m v&agrave; c&aacute;c vấn đề kh&aacute;c. V&igrave; vậy, một loại sữa rửa mặt với sức mạnh l&agrave;m sạch da, kh&aacute;ng khuẩn, giảm mụn hiệu quả như Skin&amp;Dr Tea tree xứng đ&aacute;ng được hội anh em &ldquo;rinh&rdquo; ngay cho m&igrave;nh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Sở hữu c&aacute;c th&agrave;nh phần tự nhi&ecirc;n l&agrave;nh t&iacute;nh v&agrave; an to&agrave;n như tinh dầu tr&agrave;m tr&agrave;, chiết xuất từ đu đủ&hellip;, sữa rửa mặt Skin &amp; Dr Tea tree sẽ gi&uacute;p anh em giải quyết hầu hết c&aacute;c vấn đề mụn, vi&ecirc;m, b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng.... một c&aacute;ch nhanh gọn v&agrave; hiệu quả.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>L&agrave;m giảm mụn nhanh&nbsp;</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Những &ldquo;thủ phạm&rdquo; g&acirc;y ra b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng v&agrave; h&igrave;nh th&agrave;nh mụn như: dầu thừa, tế b&agrave;o chết, bụi bẩn, b&atilde; nhờn&hellip; sẽ được Skin&amp;Dr Tea tree &ldquo;đ&aacute;nh bay&rdquo; một c&aacute;ch nhanh ch&oacute;ng. Tất cả l&agrave; nhờ sự kết hợp của tinh dầu tr&agrave;m tr&agrave; v&agrave; Axit Lactobionic. Lỗ ch&acirc;n l&ocirc;ng của anh em sẽ trở n&ecirc;n sạch s&acirc;u, th&ocirc;ng tho&aacute;ng, giảm sự h&igrave;nh th&agrave;nh mụn trứng c&aacute;, mụn vi&ecirc;m v&agrave; giảm sưng đỏ do mụn.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Với Skin&amp;Dr Tea tree, l&agrave;n da kh&ocirc;ng chỉ được l&agrave;m sạch s&acirc;u m&agrave; c&ograve;n được &ldquo;bảo vệ&rdquo; tuyệt đối, bởi sản phẩm c&oacute; th&agrave;nh phần kh&aacute;ng vi&ecirc;m, diệt khuẩn mạnh mẽ. Đặc biệt, Skin&amp;Dr Tea tree v&ocirc; c&ugrave;ng l&agrave;nh t&iacute;nh, kh&ocirc;ng g&acirc;y k&iacute;ch ứng da, kể cả với l&agrave;n da gặp t&igrave;nh trạng mụn nghi&ecirc;m trọng.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Thần dược cải thiện t&igrave;nh trạng da - Khỏe đẹp tự tin, tr&agrave;n trề sức sống</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&ocirc;ng chỉ l&agrave;m sạch da, giảm mụn, sữa rửa mặt Skin&amp;Dr Tea tree c&ograve;n c&oacute; t&aacute;c dụng dưỡng da vượt trội. Anh em sẽ c&oacute; được một l&agrave;n da căng mịn, khỏe khoắn v&agrave; một vẻ ngo&agrave;i tự tin, tr&agrave;n đầy sức sống. Với Skin&amp;Dr Tea tree, l&agrave;n da anh em lu&ocirc;n được cung cấp, duy tr&igrave; độ ẩm đều đặn v&agrave; đảm bảo sự c&acirc;n bằng độ PH tr&ecirc;n da. Anh em sẽ kh&ocirc;ng cần lo ngại t&igrave;nh trạng kh&ocirc; r&iacute;t, bong tr&oacute;c da mặt, kể cả v&agrave;o những ng&agrave;y kh&ocirc; hanh. Hiệu quả n&agrave;y l&agrave; nhờ c&oacute; sự kết hợp của vitamin E, tinh dầu tr&agrave;m tr&agrave; v&agrave; c&aacute;c th&agrave;nh phần tự nhi&ecirc;n l&agrave;nh t&iacute;nh.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">C&aacute;c dưỡng chất trong Skin&amp;Dr Tea tree c&ograve;n tạo n&ecirc;n một lớp m&agrave;ng bảo vệ hiệu quả cho l&agrave;n da, gi&uacute;p chống đỡ mọi t&aacute;c động xấu từ b&ecirc;n ngo&agrave;i như: tia cực t&iacute;m; kh&oacute;i bụi; tạp chất...&nbsp;Đồng thời, sản phẩm cũng hỗ trợ l&agrave;m mờ vết th&acirc;m mụn, dưỡng s&aacute;ng da từ s&acirc;u b&ecirc;n trong. L&agrave;n da anh em sẽ đều m&agrave;u, s&aacute;ng bật tone, đem lại vẻ ngo&agrave;i rạng rỡ, tươi trẻ v&agrave; tr&agrave;n đầy tự tin.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>CHỈ 7 NG&Agrave;Y để c&oacute; được l&agrave;n da mơ ước</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Anh em lo lắng chăm s&oacute;c da phải tốn thời gian d&agrave;i mới cho thấy hiệu quả? Đừng lo! Với t&aacute;c động đa chiều, Skin&amp;Dr Tea tree sẽ r&uacute;t ngắn tối đa quy tr&igrave;nh chăm s&oacute;c da, nhưng vẫn đảm l&agrave;n da khỏe đẹp, trắng s&aacute;ng như mong đợi.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Chỉ sau 7 ng&agrave;y</strong> sử dụng, anh em sẽ cảm nhận r&otilde; rệt sự &ldquo;lột x&aacute;c&rdquo; của l&agrave;n da: giảm mụn, mờ th&acirc;m, trắng s&aacute;ng v&agrave; căng tr&agrave;n sức sống. C&oacute; được l&agrave;n da như &yacute;, anh em c&oacute; thể thỏa sức t&uacute;t t&aacute;t nhan sắc để trở n&ecirc;n tự tin, thu h&uacute;t hơn bao giờ hết!</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><img src=\"https://static.30shine.com/shop-admin/2023/10/04/30S4V5OT-image_2.jpg\" /></span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Trải nghiệm tuyệt vời kh&ocirc;ng thể &ldquo;kh&ocirc;ng thử&rdquo;</strong></span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&ocirc;ng chỉ đem đến những cải thiện r&otilde; rệt đối với l&agrave;n da, Skin&amp;Dr Tea tree chắc chắn c&ograve;n khiến mọi anh em h&agrave;i l&ograve;ng về những trải nghiệm tuyệt vời m&agrave; sản phẩm mang lại.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Dịu nhẹ, &ecirc;m &aacute;i khi sử dụng</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Kh&aacute;c với những sản phẩm sữa rửa mặt nam th&ocirc;ng thường, Skin&amp;Dr Tea tree kh&ocirc;ng c&oacute; th&agrave;nh phần chất tẩy rửa mạnh hay những hạt scrub to g&acirc;y tổn thương, kh&ocirc; r&aacute;t, k&iacute;ch ứng&hellip; da. Với khả năng tạo bọt tuyệt vời c&ugrave;ng kết cấu mỏng nhẹ, sản phẩm đem lại cảm gi&aacute;c dịu nhẹ, thư gi&atilde;n ngay khi vừa sử dụng, nhẹ nh&agrave;ng lấy đi những bụi bẩn, tế b&agrave;o chết&hellip; tr&ecirc;n da.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Thư gi&atilde;n sau ng&agrave;y d&agrave;i mệt mỏi</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">M&ugrave;i thơm nhẹ nh&agrave;ng từ l&aacute; tr&agrave;m tr&agrave; tự nhi&ecirc;n c&oacute; trong Skin&amp;Dr Tea tree đem đến cho anh em cảm gi&aacute;c thư gi&atilde;n v&agrave; m&aacute;t lạnh sảng kho&aacute;i. Kh&ocirc;ng chỉ l&agrave; chăm s&oacute;c da, sử dụng Skin&amp;Dr Tea tree c&ograve;n l&agrave; một bước thư gi&atilde;n v&agrave; tận hưởng tuyệt vời sau một ng&agrave;y d&agrave;i mệt mỏi với nhiều lo &acirc;u, bận rộn&hellip;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Sử dụng </strong><strong>sữa rửa mặt Skin Dr Tea tree</strong><strong> đơn giản - Hiệu quả tối đa</strong></span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Với sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr Tea tree, chỉ cần rửa mặt đều đặn 2 lần/ng&agrave;y v&agrave;o buổi s&aacute;ng v&agrave; tối, anh em chắc chắn sẽ bất ngờ v&igrave; hiệu quả m&agrave; sản phẩm mang lại. 4 bước si&ecirc;u đơn giản khi sử dụng sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 1:</strong> L&agrave;m ướt da mặt bằng nước ấm</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 2:</strong> Cho 1 lượng sản phẩm vừa đủ ra tay, xoa đều để tạo bọt</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 3:</strong> Massage nhẹ nh&agrave;ng da mặt theo chiều từ trong ra ngo&agrave;i</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 4: </strong>Rửa lại bằng nước sạch v&agrave; thấm kh&ocirc; da</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><strong>Bước 5: </strong>Để tăng hiệu quả dưỡng da to&agrave;n diện hơn, anh em c&oacute; thể sử dụng th&ecirc;m <a href=\"https://shop.30shine.com/chi-tiet-san-pham/toner-pha-5-lam-sach-va-tai-tao-da-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Control Toner</a> - Toner PHA 5% c&oacute; khả năng l&agrave;m sạch v&agrave; t&aacute;i tạo da v&agrave; <a href=\"https://shop.30shine.com/chi-tiet-san-pham/gel-dac-tri-nhan-mun-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Spot Treatment</a> - d&ograve;ng gel giảm nh&acirc;n mụn hiệu quả. (C&oacute; thể bỏ qua bước n&agrave;y).</span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><img src=\"https://static.30shine.com/shop-admin/2023/10/04/30SZ9HT4-image_4.jpg\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">B&ecirc;n cạnh đ&oacute;, Skin &amp; Dr cũng ph&aacute;t triển th&ecirc;m d&ograve;ng sản phẩm <a href=\"https://shop.30shine.com/chi-tiet-san-pham/sua-rua-mat-than-hoat-tinh-skindr-100g\" rel=\"noopener noreferrer\" target=\"_blank\">sữa rửa mặt than hoạt t&iacute;nh Skin&amp;Dr</a> với c&ocirc;ng dụng l&agrave;m sạch s&acirc;u, tẩy trắng v&agrave; gi&uacute;p kiềm dầu hiệu quả. Anh em c&oacute; thể tham khảo th&ecirc;m.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\"><em>Một l&agrave;n da sạch sẽ, khỏe mạnh, tươi trẻ kh&ocirc;ng chỉ tăng sự tự tin cho ph&aacute;i mạnh m&agrave; c&ograve;n l&agrave; &ldquo;điểm cộng&rdquo; của c&aacute;c ch&agrave;ng trong mắt những người đối diện. Li&ecirc;n hệ ngay hotline: </em><a href=\"tel:1900272730\"><em>1900.27.27.30</em></a><em> để sở hữu Sữa rửa mặt Tr&agrave;m Tr&agrave; Skin&amp;Dr Tea tree - cải thiện l&agrave;n da, tự tin thu h&uacute;t anh em nh&eacute;!</em></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">Th&ocirc;ng tin của sản phẩm sữa rửa mặt nam giới Skin&amp;dr Tr&agrave;m tr&agrave;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Thương hiệu:&nbsp;Skin&amp;Dr&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Dung t&iacute;ch: 100g</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Xuất xứ: H&agrave;n Quốc</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Hạn sử dụng: 2 năm kể từ ng&agrave;y sản xuất</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối: C&ocirc;ng ty TNHH Thương mại v&agrave; Dịch vụ Thi&ecirc;n Uy</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:18px\">- Địa chỉ: 50 Nguyễn Văn Vĩ, Phường 12, Quận T&acirc;n B&igrave;nh, TP Hồ Ch&iacute; Minh</span></span></p>', 1, 3, 3, 80, '2024-06-21 23:29:08', '2024-06-21 23:29:16'),
(6, 'Gel rửa mặt cho da dầu mụn Dr. For Skin Acsys Plus', 'gel-rua-mat-cho-da-dau-mun-dr-for-skin-acsys-plus', 480000, 387000, '<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\">Gel rửa mặt cho da dầu mụn Drforskin Acsys Plus l&agrave; sản phẩm thuộc thương hiệu <a href=\"https://shop.30shine.com/thuong-hieu/skin-and-dr\" rel=\"noopener noreferrer\" target=\"_blank\">Skin Dr</a> đến từ H&agrave;n Quốc.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\"><img src=\"https://static.30shine.com/shop-admin/2023/03/13/30SLQ6DL-AcsysPlus_mild_cleanser_VN_rev.png\" /></span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><span style=\"font-family:Times New Roman,Times,serif\">B&ecirc;n cạnh d&ograve;ng gel rửa mặt, Skin Dr c&ograve;n ph&aacute;t triển th&ecirc;m c&aacute;c d&ograve;ng sản phẩm hỗ trợ điều trị c&aacute;c t&igrave;nh trạng da, trong đ&oacute; c&oacute; thể kể đến <a href=\"https://shop.30shine.com/chi-tiet-san-pham/toner-pha-5-lam-sach-va-tai-tao-da-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Control Toner</a> - d&ograve;ng Toner PHA 5% c&oacute; khả năng l&agrave;m sạch v&agrave; t&aacute;i tạo da v&agrave; <a href=\"https://shop.30shine.com/chi-tiet-san-pham/gel-dac-tri-nhan-mun-drforskin-acsys-plus\" rel=\"noopener noreferrer\" target=\"_blank\">Dr for Skin Acsys Plus Spot Treatment</a> - d&ograve;ng gel chấm mụn.&nbsp;</span></span></p>', 1, 3, 3, 80, '2024-06-21 23:31:17', '2024-06-21 23:32:06');

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
('940ZYMb49NOTa5NIbB3zXCXmiJNTXO2O349m3u39', NULL, '104.166.80.226', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0I0dFZveXJLUE80MWJXTnE1RUtXd1dHcTFQQ3g4UmdQNlBjaUFIWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vYmFja2VuZC5jb2Rpbmdmcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1719038107),
('Di0cWzgaucDWMkRxRFafNyJIJXxSkXtEyV2Y6ZQI', NULL, '103.221.220.62', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjBvOEllbkd2Mzh1M3hmZ0NDZ1Y0eVBQRzltaUdHRE5OM3BBdWdkNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9iYWNrZW5kLmNvZGluZ2ZzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718987326),
('khFrnAgPXqfyqj5W8gJZfJLdhGcv7e0wNH6zptbJ', NULL, '103.221.220.62', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGNrMTg5RUpaVURiaTh1T2pRWXlGcllRc3pheUhQRUM2OVA0VFkwVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9iYWNrZW5kLmNvZGluZ2ZzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719005323),
('Lr6K3bGeN1bshkWrsysZHtNs5177SXNliIoCYqes', NULL, '171.248.41.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUR4QlFld0M3eTNoZEVlZnlNWFlNSGRRYUZERTRNRDEydTZrMnAzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vYmFja2VuZC5jb2Rpbmdmcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1719011000),
('OnRJqmF1T9omazCjhoaNUIZlBh9pwenyrzDvXGkq', NULL, '118.69.69.232', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUzFWbG5sUU9rZWFlQkZSUmU0aFdHUnBXZGl6NkVtcFdQREdrN3RZVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719033107),
('TqBJc33LxBTmR673hXuto3IghANJqt4zVaXCsSgh', NULL, '104.166.80.5', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW9XVldNSkU1ZThGNFp0cDJ2OXRoSkFwaEZrcU5oUGVLRTRQRXJPdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vYmFja2VuZC5jb2Rpbmdmcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718995879),
('uJqf155uyAY7ULNZH9gowQXGpIaFAdOgivtzNLOd', NULL, '104.166.80.213', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpWYUFUeFNTczNoQ3JpUHk2SVJ5N2ZQb3drdWJtR3Rsbjh2SmF6aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LmJhY2tlbmQuY29kaW5nZnMuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718995840),
('vu522qVWdKatkpOUs5e6BIfyonNcdKjlCvNgN9Ub', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1YzdFBMTDlReWxuZHMxaENzTHltamFQdE93Z2xxR2xSQ0laTXFNdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1719038598),
('wPcOsPR3HizMbjBxsDmpEc4HP4wYmEM4cF8VfKqo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXRDM0JERko4TXRYTjlmSHBJaXNheU0yd3hSb3M2QmRydnVjbm5yRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719039040),
('yguE09seNXvi99kKQtpGlM7tHLaAyMefPy8Bq4yD', NULL, '103.221.220.62', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2NMdmhqZHZpTldHQnVHN2xzVXVPNzV5Z2g4WHk1Z0FDTDJOVmVLQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9iYWNrZW5kLmNvZGluZ2ZzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719023322);

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
  `desktop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, 'admin', 'leodomsolar@gmail.com', NULL, '$2y$10$D36p44jXgtAewwxljn0b.egWMFpDgtnmoChpoQkQKBqYdnxc7swVy', NULL, '2024-06-21 09:55:11', '2024-06-21 17:53:22', 1, 1);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `links`
--
ALTER TABLE `links`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_id_parent_foreign` FOREIGN KEY (`id_parent`) REFERENCES `products` (`id`);

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
