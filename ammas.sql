-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 19, 2025 at 05:00 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ammas`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int UNSIGNED NOT NULL,
  `address_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'customer', NULL, 1, NULL, NULL, 'Raj', 'Tiwari', NULL, 'ENS ENTERPRISES', 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '7827795324', '', 1, 0, NULL, '2025-03-26 11:44:45', '2025-03-26 11:44:45'),
(44, 'cart_billing', 1, 1, 26, NULL, 'Raj', 'Tiwari', NULL, 'ENS ENTERPRISES', 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '7827795324', NULL, 0, 1, NULL, '2025-05-02 09:36:47', '2025-05-02 09:36:47'),
(45, 'cart_shipping', 1, 1, 26, NULL, 'Raj', 'Tiwari', NULL, 'ENS ENTERPRISES', 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '7827795324', NULL, 0, 0, NULL, '2025-05-02 09:36:47', '2025-05-02 09:36:47'),
(46, 'cart_billing', NULL, NULL, 36, NULL, 'Raj', 'Tiwari', NULL, NULL, 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '07827795324', NULL, 0, 1, NULL, '2025-05-09 11:09:57', '2025-05-09 11:09:57'),
(47, 'cart_shipping', NULL, NULL, 36, NULL, 'Raj', 'Tiwari', NULL, NULL, 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '07827795324', NULL, 0, 0, NULL, '2025-05-09 11:09:57', '2025-05-09 11:09:57'),
(48, 'cart_billing', NULL, NULL, 40, NULL, 'Raj', 'Tiwari', NULL, NULL, 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '07827795324', NULL, 0, 1, NULL, '2025-05-09 12:17:09', '2025-05-09 12:17:09'),
(49, 'cart_shipping', NULL, NULL, 40, NULL, 'Raj', 'Tiwari', NULL, NULL, 'B-16', 'Noida', 'UP', 'IN', '201301', 'raj.tiwari@ens.enterprises', '07827795324', NULL, 0, 0, NULL, '2025-05-09 12:17:09', '2025-05-09 12:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Superadmin', 'admin@ammaspastries.in', '$2y$10$Pe.mnFL5TJFMi79c0jJ9cOs9Il3sYkaA00MzcEoHgpXUTG8MavpEO', '6HC4rsLON55LZM2NuaZ0gr8mbQ5aveK6RbfUV5bQAuxTsSWQ4ovxHAIVxSOQuAgAhlH3QFCbwno6Xz8b', 1, 1, NULL, NULL, '2025-03-26 05:48:02', '2025-05-12 12:00:33'),
(2, 'Raj Tiwari', 'raj.tiwari@ens.enterprises', '$2y$10$J.f/hzFH/VtwZDLiCSvb2uPwL.okYoWYZkL.TFgAbAxL4FADNO2s2', 'MBWXQJEtnorKCpapNyQza3kzt8t01AT8wmHeXIMTCJONTcrwFcaYMkUmDoYcn3CEd9W7NwhVChSj9D4j', 1, 2, NULL, NULL, '2025-05-01 04:28:25', '2025-05-12 12:01:05');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-03-26 05:48:01', '2025-05-14 06:23:38'),
(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(29, 'Shape', 'Shape', 'select', 'text', NULL, '', NULL, 0, 0, 0, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-04-10 04:18:34', '2025-04-10 12:02:57'),
(30, 'Flavors', 'Flavors', 'select', 'dropdown', NULL, '', NULL, 0, 0, 0, 0, 1, 1, 1, 0, 0, NULL, 0, '2025-04-10 09:50:59', '2025-04-11 05:22:16'),
(31, 'EggOption', 'Egg Option', 'select', 'color', NULL, '', NULL, 0, 0, 0, 0, 1, 1, 1, 0, 0, NULL, 0, '2025-04-10 10:04:33', '2025-04-11 04:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_families`
--

CREATE TABLE `attribute_families` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_families`
--

INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_groups`
--

CREATE TABLE `attribute_groups` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_groups`
--

INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 'general', 1, 'General', 1, 1, 0),
(2, 'description', 1, 'Description', 1, 2, 0),
(3, 'meta_description', 1, 'Meta Description', 1, 3, 0),
(4, 'price', 1, 'Price', 2, 1, 0),
(5, 'shipping', 1, 'Shipping', 2, 2, 0),
(6, 'settings', 1, 'Settings', 2, 3, 0),
(7, 'inventories', 1, 'Inventories', 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_mappings`
--

CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int UNSIGNED NOT NULL,
  `attribute_group_id` int UNSIGNED NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_group_mappings`
--

INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(13, 4, 2),
(14, 4, 3),
(15, 4, 4),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 5, 1),
(20, 5, 2),
(21, 5, 3),
(22, 5, 4),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1),
(29, 1, 6),
(30, 1, 7),
(31, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `admin_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
(10, 29, 'Round', 0, NULL),
(11, 29, 'Square', 1, NULL),
(12, 29, 'Heart', 2, NULL),
(13, 30, 'Black Currant', 0, NULL),
(14, 30, 'Black Forest', 1, NULL),
(15, 30, 'Blueberry', 2, NULL),
(16, 30, 'BlueBerry Cheese', 3, NULL),
(17, 30, 'Butterscotch', 4, NULL),
(18, 30, 'Celebration', 5, NULL),
(19, 30, 'Choco Butterscotch', 6, NULL),
(20, 30, 'Choco Chillz', 7, NULL),
(21, 30, 'Chocolate Almond', 8, NULL),
(22, 30, 'Chocolate Cheese', 9, NULL),
(23, 30, 'Chocolate Mars', 10, NULL),
(24, 30, 'Chocolate Mousse', 11, NULL),
(25, 30, 'Chocolate Salted Caramel', 12, NULL),
(26, 30, 'Chocolate Truffle', 13, NULL),
(27, 30, 'Classic Black Forest', 14, NULL),
(28, 30, 'Fresh Strawberry', 15, NULL),
(29, 30, 'Fruit \"N\"Nut', 16, NULL),
(30, 30, 'Fruit Forest', 17, NULL),
(31, 30, 'Fruit Truffle', 18, NULL),
(32, 30, 'Galaxy', 19, NULL),
(33, 30, 'Honey Cake', 20, NULL),
(34, 30, 'Mango Mousse', 21, NULL),
(35, 30, 'Mocha', 22, NULL),
(36, 30, 'Opera', 23, NULL),
(37, 30, 'Pineapple Pastry', 24, NULL),
(38, 30, 'Pineapple Tidbits', 25, NULL),
(39, 30, 'Pure Chocolate', 26, NULL),
(40, 30, 'Rasmalai', 27, NULL),
(41, 30, 'Red Velvet', 28, NULL),
(42, 30, 'Six Wonders', 29, NULL),
(43, 30, 'Spanish Delight', 30, NULL),
(44, 30, 'Tiramisu', 31, NULL),
(45, 30, 'Triple Queen', 32, NULL),
(46, 30, 'Vanilla Almond', 33, NULL),
(47, 30, 'White Forest', 34, NULL),
(48, 30, 'Wonder Chocolate', 35, NULL),
(49, 31, 'Egg', 0, '#e01a1a'),
(50, 31, 'Eggless', 1, '#16d035');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option_translations`
--

CREATE TABLE `attribute_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `attribute_option_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
(10, 10, 'en', 'Round'),
(11, 11, 'en', 'Square'),
(12, 12, 'en', 'Heart'),
(13, 13, 'en', 'Black Currant'),
(14, 14, 'en', 'Black Forest'),
(15, 15, 'en', 'Blueberry'),
(16, 16, 'en', 'BlueBerry Cheese'),
(17, 17, 'en', 'Butterscotch'),
(18, 18, 'en', 'Celebration'),
(19, 19, 'en', 'Choco Butterscotch'),
(20, 20, 'en', 'Choco Chillz'),
(21, 21, 'en', 'Chocolate Almond'),
(22, 22, 'en', 'Chocolate Cheese'),
(23, 23, 'en', 'Chocolate Mars'),
(24, 24, 'en', 'Chocolate Mousse'),
(25, 25, 'en', 'Chocolate Salted Caramel'),
(26, 26, 'en', 'Chocolate Truffle'),
(27, 27, 'en', 'Classic Black Forest'),
(28, 28, 'en', 'Fresh Strawberry'),
(29, 29, 'en', 'Fruit \"N\"Nut'),
(30, 30, 'en', 'Fruit Forest'),
(31, 31, 'en', 'Fruit Truffle'),
(32, 32, 'en', 'Galaxy'),
(33, 33, 'en', 'Honey Cake'),
(34, 34, 'en', 'Mango Mousse'),
(35, 35, 'en', 'Mocha'),
(36, 36, 'en', 'Opera'),
(37, 37, 'en', 'Pineapple Pastry'),
(38, 38, 'en', 'Pineapple Tidbits'),
(39, 39, 'en', 'Pure Chocolate'),
(40, 40, 'en', 'Rasmalai'),
(41, 41, 'en', 'Red Velvet'),
(42, 42, 'en', 'Six Wonders'),
(43, 43, 'en', 'Spanish Delight'),
(44, 44, 'en', 'Tiramisu'),
(45, 45, 'en', 'Triple Queen'),
(46, 46, 'en', 'Vanilla Almond'),
(47, 47, 'en', 'White Forest'),
(48, 48, 'en', 'Wonder Chocolate'),
(49, 49, 'en', 'Egg'),
(50, 50, 'en', 'Eggless');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_rewards`
--

CREATE TABLE `attribute_rewards` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `attribute_id` int UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'SKU'),
(2, 2, 'en', 'Name'),
(3, 3, 'en', 'URL Key'),
(4, 4, 'en', 'Tax Category'),
(5, 5, 'en', 'New'),
(6, 6, 'en', 'Featured'),
(7, 7, 'en', 'Visible Individually'),
(8, 8, 'en', 'Status'),
(9, 9, 'en', 'Short Description'),
(10, 10, 'en', 'Description'),
(11, 11, 'en', 'Price'),
(12, 12, 'en', 'Cost'),
(13, 13, 'en', 'Special Price'),
(14, 14, 'en', 'Special Price From'),
(15, 15, 'en', 'Special Price To'),
(16, 16, 'en', 'Meta Title'),
(17, 17, 'en', 'Meta Keywords'),
(18, 18, 'en', 'Meta Description'),
(19, 19, 'en', 'Length'),
(20, 20, 'en', 'Width'),
(21, 21, 'en', 'Height'),
(22, 22, 'en', 'Weight'),
(26, 26, 'en', 'Guest Checkout'),
(27, 27, 'en', 'Product Number'),
(28, 28, 'en', 'Manage Stock'),
(29, 29, 'en', 'Shape'),
(30, 30, 'en', 'Flavors'),
(31, 31, 'en', '');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channels` bigint UNSIGNED NOT NULL,
  `default_category` bigint UNSIGNED NOT NULL,
  `categorys` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `src` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `name`, `slug`, `short_description`, `description`, `channels`, `default_category`, `categorys`, `tags`, `author`, `author_id`, `src`, `locale`, `status`, `allow_comments`, `meta_title`, `meta_description`, `meta_keywords`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Jungle theme pink Cake', 'jungle-theme-pink-cake', 'ki', '<p>ki</p>', 1, 1, NULL, '1', 'Superadmin', 1, 'blog-images/2/7TefRlFCwZcTdyrnNcgZNM4zJ5hzDlRoFUJRUsc8.webp', 'en', 1, 0, 'ji', 'ji', 'ji', '2025-04-25 00:00:00', '2025-04-25 10:23:20', '2025-04-25 11:30:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT '0',
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `description`, `image`, `status`, `parent_id`, `locale`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pastries', 'pastries', '<p>pastries</p>', 'blog-category/1/3rKd7eZByNImOgE7u4U4dbFGATSDSeicP9rc3FYO.webp', 1, 0, 'en', 'pastries', 'pastries', 'pastries', '2025-04-25 11:16:34', '2025-04-25 11:16:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `author` bigint UNSIGNED NOT NULL,
  `post` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `name`, `slug`, `description`, `status`, `locale`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'yummy', 'yummy', '<p>yummy</p>', 1, 'en', 'yummy', 'yummy', 'yummy', '2025-04-25 11:20:46', '2025-04-25 11:20:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int UNSIGNED NOT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giftcard_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giftcard_amount` decimal(10,0) DEFAULT NULL,
  `remaining_giftcard_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `points` int DEFAULT NULL,
  `points_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `giftcard_number`, `giftcard_amount`, `remaining_giftcard_amount`, `customer_id`, `channel_id`, `created_at`, `updated_at`, `points`, `points_amount`) VALUES
(25, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 700.0000, 700.0000, 700.0000, 700.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 700.0000, 700.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-01 07:34:41', '2025-05-01 07:53:08', NULL, NULL),
(26, 'raj.tiwari@ens.enterprises', 'Raj', 'Tiwari', 'free_free', NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, NULL, NULL, 0.00, 1, 1, '2025-05-02 09:36:36', '2025-05-16 07:30:58', NULL, NULL),
(27, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 09:29:10', '2025-05-09 09:29:10', NULL, NULL),
(28, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 09:46:20', '2025-05-09 09:46:20', NULL, NULL),
(29, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:41:12', '2025-05-09 10:41:12', NULL, NULL),
(30, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:41:34', '2025-05-09 10:41:34', NULL, NULL),
(31, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:42:15', '2025-05-09 10:42:15', NULL, NULL),
(32, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:42:28', '2025-05-09 10:42:28', NULL, NULL),
(33, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:43:20', '2025-05-09 10:43:20', NULL, NULL),
(34, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 800.0000, 800.0000, 800.0000, 800.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:45:35', '2025-05-09 10:45:35', NULL, NULL),
(35, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:55:13', '2025-05-09 10:55:13', NULL, NULL),
(36, 'raj.tiwari@ens.enterprises', 'Raj', 'Tiwari', 'free_free', NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:55:55', '2025-05-09 11:24:08', NULL, NULL),
(37, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 10:58:58', '2025-05-09 10:58:58', NULL, NULL),
(38, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 11:28:09', '2025-05-09 11:28:09', NULL, NULL),
(39, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 11:30:55', '2025-05-09 11:30:55', NULL, NULL),
(40, 'raj.tiwari@ens.enterprises', 'Raj', 'Tiwari', 'free_free', NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-09 11:31:04', '2025-05-09 12:22:05', NULL, NULL),
(41, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 05:59:01', '2025-05-10 05:59:01', NULL, NULL),
(42, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:01:07', '2025-05-10 06:01:07', NULL, NULL),
(43, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:02:09', '2025-05-10 06:02:09', NULL, NULL),
(44, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:02:19', '2025-05-10 06:02:19', NULL, NULL),
(45, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:02:53', '2025-05-10 06:02:53', NULL, NULL),
(46, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:05:23', '2025-05-10 06:05:23', NULL, NULL),
(47, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:05:30', '2025-05-10 06:05:30', NULL, NULL),
(48, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-10 06:05:40', '2025-05-10 06:05:40', NULL, NULL),
(49, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:25:06', '2025-05-13 04:25:06', NULL, NULL),
(50, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:35:44', '2025-05-13 04:35:44', NULL, NULL),
(51, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:39:43', '2025-05-13 04:39:44', NULL, NULL),
(52, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:53:57', '2025-05-13 04:53:57', NULL, NULL),
(53, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:54:11', '2025-05-13 04:54:11', NULL, NULL),
(54, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:54:40', '2025-05-13 04:54:40', NULL, NULL),
(55, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:54:56', '2025-05-13 04:54:56', NULL, NULL),
(56, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'INR', 'INR', 'INR', 'INR', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:56:59', '2025-05-13 04:56:59', NULL, NULL),
(57, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:57:11', '2025-05-13 04:57:11', NULL, NULL),
(58, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 04:57:35', '2025-05-13 04:57:35', NULL, NULL),
(59, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 05:04:48', '2025-05-13 05:04:48', NULL, NULL),
(60, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 05:04:57', '2025-05-13 05:04:57', NULL, NULL),
(61, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 05:05:40', '2025-05-13 05:05:40', NULL, NULL),
(62, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 05:08:27', '2025-05-13 05:08:27', NULL, NULL),
(63, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'INR', 'INR', 'INR', 'INR', 99.0000, 99.0000, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, NULL, 0.00, NULL, 1, '2025-05-13 05:09:34', '2025-05-13 07:47:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `cart_id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
(1, 1, 'skuwe21', 'configurable', 'Animal Theme cake – 3Kg', NULL, 0.5000, 0.5000, 0.5000, 700.0000, 700.0000, NULL, 700.0000, 700.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 700.0000, 700.0000, 700.0000, 700.0000, NULL, NULL, 13, 25, NULL, NULL, '{\"quantity\": 1, \"attributes\": {\"Flavors\": {\"option_id\": 14, \"option_label\": \"Black Forest\", \"attribute_name\": \"Flavors\"}, \"EggOption\": {\"option_id\": 50, \"option_label\": \"Eggless\", \"attribute_name\": \"Egg Option\"}}, \"is_buy_now\": \"0\", \"product_id\": \"13\", \"super_attribute\": {\"30\": \"14\", \"31\": \"50\"}, \"selected_configurable_option\": \"51\"}', '2025-05-01 07:34:41', '2025-05-01 07:34:41'),
(2, 0, 'skuwe21-variant-14-50', 'simple', 'Variant 14 50', NULL, 0.0000, 0.0000, 0.0000, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 51, 25, NULL, NULL, '{\"parent_id\": 13, \"product_id\": 51}', '2025-05-01 07:34:41', '2025-05-01 07:34:41'),
(3, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 26, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-02 09:36:36', '2025-05-16 06:41:13'),
(4, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 27, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 09:29:10', '2025-05-09 09:29:10'),
(5, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 28, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-09 09:46:20', '2025-05-09 09:46:20'),
(6, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 29, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 10:41:12', '2025-05-09 10:41:12'),
(7, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 30, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-09 10:41:34', '2025-05-09 10:41:34'),
(8, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 31, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-09 10:42:15', '2025-05-09 10:42:15'),
(9, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 32, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-09 10:42:28', '2025-05-09 10:42:28'),
(10, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 33, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-09 10:43:20', '2025-05-09 10:43:20'),
(11, 1, 'skuwe21', 'configurable', 'Animal Theme cake – 3Kg', NULL, 0.5000, 0.5000, 0.5000, 800.0000, 800.0000, NULL, 800.0000, 800.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 800.0000, 800.0000, 800.0000, 800.0000, NULL, NULL, 13, 34, NULL, NULL, '{\"quantity\": 1, \"attributes\": {\"Flavors\": {\"option_id\": 13, \"option_label\": \"Black Currant\", \"attribute_name\": \"Flavors\"}, \"EggOption\": {\"option_id\": 50, \"option_label\": \"Eggless\", \"attribute_name\": \"Egg Option\"}}, \"is_buy_now\": \"0\", \"product_id\": \"13\", \"super_attribute\": {\"30\": \"13\", \"31\": \"50\"}, \"selected_configurable_option\": \"50\"}', '2025-05-09 10:45:35', '2025-05-09 10:45:35'),
(12, 0, 'skuwe21-variant-13-50', 'simple', 'Variant 13 50', NULL, 0.0000, 0.0000, 0.0000, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 11, 50, 34, NULL, NULL, '{\"parent_id\": 13, \"product_id\": 50}', '2025-05-09 10:45:35', '2025-05-09 10:45:35'),
(13, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 35, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 10:55:13', '2025-05-09 10:55:19'),
(14, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 36, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 10:55:55', '2025-05-09 11:09:38'),
(15, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 37, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 10:58:58', '2025-05-09 10:58:58'),
(16, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 38, NULL, NULL, '{\"quantity\": 1, \"product_id\": 1}', '2025-05-09 11:28:09', '2025-05-09 11:28:09'),
(17, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 39, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 11:30:55', '2025-05-09 11:30:59'),
(18, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 40, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-09 11:31:04', '2025-05-09 12:17:01'),
(19, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 41, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 05:59:01', '2025-05-10 05:59:01'),
(20, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 42, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:01:07', '2025-05-10 06:01:07'),
(21, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 43, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:02:09', '2025-05-10 06:02:16'),
(22, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 44, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:02:19', '2025-05-10 06:02:19'),
(23, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 45, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:02:53', '2025-05-10 06:05:21'),
(24, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 46, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:05:23', '2025-05-10 06:05:26'),
(25, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 47, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:05:30', '2025-05-10 06:05:37'),
(26, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 48, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-10 06:05:40', '2025-05-10 06:05:40'),
(27, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 49, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:25:06', '2025-05-13 04:25:10'),
(28, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 50, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:35:44', '2025-05-13 04:35:44'),
(29, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 51, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:39:43', '2025-05-13 04:39:43'),
(30, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 52, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:53:57', '2025-05-13 04:53:57'),
(31, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 53, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:54:11', '2025-05-13 04:54:11'),
(32, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 54, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:54:40', '2025-05-13 04:54:40'),
(33, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 55, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:54:56', '2025-05-13 04:54:56'),
(34, 1, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 0.5000, 0.5000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 1, 56, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:56:59', '2025-05-13 04:56:59'),
(35, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 57, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:57:11', '2025-05-13 04:57:16'),
(36, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 58, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 04:57:35', '2025-05-13 04:57:38'),
(37, 2, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 1.0000, 1.0000, 99.0000, 99.0000, NULL, 198.0000, 198.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 198.0000, 198.0000, NULL, NULL, 2, 59, NULL, NULL, '{\"quantity\": 2, \"product_id\": 2}', '2025-05-13 05:04:48', '2025-05-13 05:04:53'),
(38, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 60, NULL, NULL, '{\"quantity\": 1, \"product_id\": 2}', '2025-05-13 05:04:57', '2025-05-13 05:04:57'),
(39, 2, '001', 'simple', 'Animal Party Cake', NULL, 0.5000, 1.0000, 1.0000, 100.0000, 100.0000, NULL, 200.0000, 200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 200.0000, 200.0000, NULL, NULL, 1, 61, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2025-05-13 05:05:40', '2025-05-13 05:05:43'),
(40, 2, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 1.0000, 1.0000, 99.0000, 99.0000, NULL, 198.0000, 198.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 198.0000, 198.0000, NULL, NULL, 2, 62, NULL, NULL, '{\"quantity\": 2, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-13 05:08:27', '2025-05-13 05:09:27'),
(41, 1, '002', 'simple', 'Jungle theme pink Cake', NULL, 0.5000, 0.5000, 0.5000, 99.0000, 99.0000, NULL, 99.0000, 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL, 2, 63, NULL, NULL, '{\"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"2\"}', '2025-05-13 05:09:34', '2025-05-13 07:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_inventories`
--

CREATE TABLE `cart_item_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL DEFAULT '0',
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `cart_item_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_payment`
--

CREATE TABLE `cart_payment` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_payment`
--

INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
(1, 'razorpay', 'Razorpay', 26, '2025-05-02 09:36:55', '2025-05-02 09:36:55'),
(3, 'cashondelivery', 'Cash On Delivery', 36, '2025-05-09 11:24:06', '2025-05-09 11:24:06'),
(5, 'cashondelivery', 'Cash On Delivery', 40, '2025-05-09 12:22:03', '2025-05-09 12:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rewards`
--

CREATE TABLE `cart_rewards` (
  `id` int UNSIGNED NOT NULL,
  `amount_from` double(8,2) NOT NULL,
  `amount_to` double(8,2) NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_rewards`
--

INSERT INTO `cart_rewards` (`id`, `amount_from`, `amount_to`, `reward_points`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1000.00, 2000.00, 50, '2025-05-09', '2025-09-26', 1, '2025-05-09 09:44:01', '2025-05-09 09:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rules`
--

CREATE TABLE `cart_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_channels`
--

CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupons`
--

CREATE TABLE `cart_rule_coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int UNSIGNED NOT NULL DEFAULT '0',
  `usage_per_customer` int UNSIGNED NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupon_usage`
--

CREATE TABLE `cart_rule_coupon_usage` (
  `id` int UNSIGNED NOT NULL,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customers`
--

CREATE TABLE `cart_rule_customers` (
  `id` int UNSIGNED NOT NULL,
  `times_used` bigint UNSIGNED NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED NOT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customer_groups`
--

CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_translations`
--

CREATE TABLE `cart_rule_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shipping_rates`
--

CREATE TABLE `cart_shipping_rates` (
  `id` int UNSIGNED NOT NULL,
  `carrier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_shipping_rates`
--

INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES
(46, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 45, '2025-05-02 09:36:49', '2025-05-02 09:36:49', 26),
(50, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 47, '2025-05-09 11:24:02', '2025-05-09 11:24:02', 36),
(54, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 49, '2025-05-09 12:22:02', '2025-05-09 12:22:02', 40);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rules`
--

CREATE TABLE `catalog_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_channels`
--

CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_customer_groups`
--

CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_products`
--

CREATE TABLE `catalog_rule_products` (
  `id` int UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_product_prices`
--

CREATE TABLE `catalog_rule_product_prices` (
  `id` int UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 70, NULL, NULL, NULL, '2025-03-26 05:48:01', '2025-03-26 05:48:01'),
(2, 1, NULL, 1, 'products_only', 14, 25, 1, NULL, NULL, '2025-03-26 10:25:09', '2025-04-11 04:06:55'),
(3, 2, NULL, 1, 'products_only', 28, 29, 1, NULL, NULL, '2025-03-26 10:26:22', '2025-04-11 04:07:34'),
(4, 3, 'category/4/mtHwu9n0mXlOyLTe6W8koLFPbswUavMxk2D6DzvC.webp', 1, 'products_only', 26, 27, 1, NULL, 'category/4/AolRRZFPlFhjXV4CBjOAMsuhJzrgSd9UhIspqIuT.webp', '2025-03-26 10:28:28', '2025-04-11 04:18:13'),
(5, 4, NULL, 1, 'products_only', 30, 51, 1, NULL, NULL, '2025-04-11 04:10:11', '2025-04-11 04:10:11'),
(6, 5, NULL, 1, 'products_only', 52, 69, 1, NULL, NULL, '2025-04-11 04:12:35', '2025-04-11 04:12:35'),
(7, 1, NULL, 1, 'products_and_description', 15, 16, 2, NULL, NULL, '2025-04-11 04:15:18', '2025-04-11 04:15:18'),
(8, 2, NULL, 1, 'products_only', 17, 18, 2, NULL, NULL, '2025-04-11 04:20:44', '2025-04-11 04:20:44'),
(9, 3, NULL, 1, 'products_only', 19, 20, 2, NULL, NULL, '2025-04-11 04:21:55', '2025-04-11 04:21:55'),
(10, 4, NULL, 1, 'products_only', 21, 22, 2, NULL, NULL, '2025-04-11 04:23:00', '2025-04-11 04:23:00'),
(11, 5, NULL, 1, 'products_only', 23, 24, 2, NULL, NULL, '2025-04-11 04:23:49', '2025-04-11 04:23:49'),
(12, 1, NULL, 1, 'products_only', 31, 32, 5, NULL, NULL, '2025-04-11 04:24:40', '2025-04-11 04:24:40'),
(13, 2, NULL, 1, 'products_only', 33, 34, 5, NULL, NULL, '2025-04-11 04:25:19', '2025-04-11 04:25:19'),
(14, 3, NULL, 1, 'products_only', 35, 36, 5, NULL, NULL, '2025-04-11 04:26:28', '2025-04-11 04:26:28'),
(15, 4, NULL, 1, 'products_only', 37, 38, 5, NULL, NULL, '2025-04-11 04:26:59', '2025-04-11 04:26:59'),
(16, 5, NULL, 1, 'products_only', 39, 40, 5, NULL, NULL, '2025-04-11 04:27:39', '2025-04-11 04:27:39'),
(17, 6, NULL, 1, 'products_only', 41, 42, 5, NULL, NULL, '2025-04-11 04:28:16', '2025-04-11 04:28:16'),
(18, 7, NULL, 1, 'products_only', 43, 44, 5, NULL, NULL, '2025-04-11 04:28:49', '2025-04-11 04:28:49'),
(19, 8, NULL, 1, 'products_only', 45, 46, 5, NULL, NULL, '2025-04-11 04:29:23', '2025-04-11 04:29:23'),
(20, 9, NULL, 1, 'products_only', 47, 48, 5, NULL, NULL, '2025-04-11 04:29:55', '2025-04-11 04:29:55'),
(21, 10, NULL, 1, 'products_only', 49, 50, 5, NULL, NULL, '2025-04-11 04:30:43', '2025-04-11 04:30:43'),
(22, 1, NULL, 1, 'products_only', 53, 54, 6, NULL, NULL, '2025-04-11 04:31:45', '2025-04-11 04:31:45'),
(23, 2, NULL, 1, 'products_only', 55, 56, 6, NULL, NULL, '2025-04-11 04:32:30', '2025-04-11 04:32:30'),
(24, 3, NULL, 1, 'products_only', 57, 58, 6, NULL, NULL, '2025-04-11 04:33:03', '2025-04-11 04:33:03'),
(25, 4, NULL, 1, 'products_only', 59, 60, 6, NULL, NULL, '2025-04-11 04:34:23', '2025-04-11 04:34:23'),
(26, 5, NULL, 1, 'products_only', 61, 62, 6, NULL, NULL, '2025-04-11 04:35:14', '2025-04-11 04:35:14'),
(27, 6, NULL, 1, 'products_only', 63, 64, 6, NULL, NULL, '2025-04-11 04:35:53', '2025-04-11 04:35:53'),
(28, 7, NULL, 1, 'products_only', 65, 66, 6, NULL, NULL, '2025-04-11 04:36:38', '2025-04-11 04:36:38'),
(29, 8, NULL, 1, 'products_only', 67, 68, 6, NULL, NULL, '2025-04-11 04:37:54', '2025-04-11 04:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `category_filterable_attributes`
--

CREATE TABLE `category_filterable_attributes` (
  `category_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_filterable_attributes`
--

INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11);

-- --------------------------------------------------------

--
-- Table structure for table `category_rewards`
--

CREATE TABLE `category_rewards` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_rewards`
--

INSERT INTO `category_rewards` (`id`, `reward_points`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 25, '', '', 1, '2025-05-09 09:43:09', '2025-05-09 09:43:09', 5);

-- --------------------------------------------------------

--
-- Table structure for table `category_specific_time_rewards`
--

CREATE TABLE `category_specific_time_rewards` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale_id` int UNSIGNED DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(1, 1, 'Root', 'root', '', 'Root Category Description', '', '', '', NULL, 'en'),
(2, 2, 'Cakes & Pastries', 'cakes-pastries', '', '<p>cakes</p>', '', '', '', 1, 'en'),
(3, 3, 'Theme Cakes', 'theme-cakes', '', '<p>pastries</p>', '', '', '', 1, 'en'),
(4, 4, 'PhotoCake', 'photocake', '', '<h2 class=\"product-title\">PhotoCake</h2>', '', '', '', 1, 'en'),
(5, 5, 'snacks', 'snacks', '', '<p>snacks</p>', '', '', '', 1, 'en'),
(6, 6, 'Dessert', 'dessert', '', '', '', '', '', 1, 'en'),
(7, 7, 'Exotic Fruitz', 'exotic-fruitz', '', '<p>exotic-fruitz</p>', '', '', '', 1, 'en'),
(8, 8, 'Mousse Cheese', 'mousse-cheese', '', '', '', '', '', 1, 'en'),
(9, 9, 'Premium Cakes', 'premium-cakes', '', '', '', '', '', 1, 'en'),
(10, 10, 'Regular Cakes', 'regular-cakes', '', '', '', '', '', 1, 'en'),
(11, 11, 'Something Special', 'something-special', '', '', '', '', '', 1, 'en'),
(12, 12, 'Bun', 'bun', '', '', '', '', '', 1, 'en'),
(13, 13, 'Breads', 'breads', '', '', '', '', '', 1, 'en'),
(14, 14, 'Burger', 'burger', '', '', '', '', '', 1, 'en'),
(15, 15, 'Cutlet', 'cutlet', '', '', '', '', '', 1, 'en'),
(16, 16, 'Cookies', 'cookies', '', '', '', '', '', 1, 'en'),
(17, 17, 'Croissants', 'croissants', '', '', '', '', '', 1, 'en'),
(18, 18, 'Samosa', 'samosa', '', '', '', '', '', 1, 'en'),
(19, 19, 'Puff', 'puff', '', '', '', '', '', 1, 'en'),
(20, 20, 'Pizza', 'pizza', '', '', '', '', '', 1, 'en'),
(21, 21, 'Sandwich', 'sandwich', '', '', '', '', '', 1, 'en'),
(22, 22, 'Apple Pie', 'apple-pie', '', '', '', '', '', 1, 'en'),
(23, 23, 'BonBon', 'bonbon', '', '', '', '', '', 1, 'en'),
(24, 24, 'Brownie', 'brownie', '', '', '', '', '', 1, 'en'),
(25, 25, 'Chocolate', 'chocolate', '', '', '', '', '', 1, 'en'),
(26, 26, 'Cup Cakes', 'cup-cakes', '', '', '', '', '', 1, 'en'),
(27, 27, 'Doughnuts', 'doughnuts', '', '', '', '', '', 1, 'en'),
(28, 28, 'Eclair', 'eclair', '', '', '', '', '', 1, 'en'),
(29, 29, 'Tea Cake', 'tea-cake', '', '', '', '', '', 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `root_category_id` int UNSIGNED DEFAULT NULL,
  `default_locale_id` int UNSIGNED NOT NULL,
  `base_currency_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, 'default', 'http://localhost:8000', 'channel/1/GY4KPaunigH9DJmC86iua6bptTxGAGlUf0uiUtiH.png', 'channel/1/X8bzB5k4D5IFtofOxQROqgPFcxe5CHQlnqY2vAzp.png', NULL, 0, '', 1, 1, 2, '2025-03-26 05:48:01', '2025-05-02 05:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `channel_currencies`
--

CREATE TABLE `channel_currencies` (
  `channel_id` int UNSIGNED NOT NULL,
  `currency_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_currencies`
--

INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory_sources`
--

CREATE TABLE `channel_inventory_sources` (
  `channel_id` int UNSIGNED NOT NULL,
  `inventory_source_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_inventory_sources`
--

INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_locales`
--

CREATE TABLE `channel_locales` (
  `channel_id` int UNSIGNED NOT NULL,
  `locale_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_locales`
--

INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_translations`
--

CREATE TABLE `channel_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_translations`
--

INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Default', NULL, '', '{\"meta_title\": \"Home - Ammas Pastries\", \"meta_keywords\": \"Ammas Pastries\", \"meta_description\": \"Home - Ammas Pastries\"}', NULL, '2025-05-02 05:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int UNSIGNED NOT NULL,
  `layout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(2, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(3, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(4, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(5, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(6, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(7, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(8, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(9, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(10, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_channels`
--

CREATE TABLE `cms_page_channels` (
  `cms_page_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_channels`
--

INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_translations`
--

CREATE TABLE `cms_page_translations` (
  `id` int UNSIGNED NOT NULL,
  `page_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_translations`
--

INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(1, 'About Us', 'about-us', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>About Us - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">Welcome to Ammas Pastries, where every bite tells a story of tradition, love, and craftsmanship. Founded with a passion for creating delightful treats, we bring you the finest selection of pastries, cakes, and baked goods that warm the heart and soul. Our name, \"Ammas,\" is a nod to the timeless recipes passed down through generations, inspired by the comforting hands of grandmothers who baked with care.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we believe in the magic of simple, high-quality ingredients. From flaky croissants to rich chocolate cakes, every item is crafted fresh daily by our skilled bakers, blending classic techniques with a modern twist. Whether you\'re celebrating a special moment or simply craving a sweet escape, we&rsquo;re here to make it unforgettable.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">Our mission is to spread joy, one pastry at a time. We&rsquo;re more than just a bakery&mdash;we&rsquo;re a community of flavor enthusiasts, dedicated to bringing smiles to your table. Stop by and experience the warmth of Ammas Pastries, where every treat feels like home.</p>\r\n</div>\r\n</div>\r\n</div>', 'about us', '', 'aboutus', 'en', 1),
(2, 'Return Policy', 'return-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Return Policy - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we bake every treat with care and want you to enjoy them at their best! Due to the perishable nature of our products, our Return Policy is limited to specific cases. This policy explains when and how you can return items. By purchasing from us, you agree to these terms.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Eligible Returns<br></strong><br>We accept returns only for:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Incorrect Orders</strong>: You received something different from what you ordered (e.g., a fruit tart instead of a chocolate pastry).</li>\r\n<li class=\"break-words\"><strong>Defective Items</strong>: The product was damaged, spoiled, or of poor quality due to our error (e.g., broken cake, stale bread).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>2. Non-Returnable Items<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Perishable Goods</strong>: Baked goods cannot be returned once delivered unless defective or incorrect, as they spoil quickly.</li>\r\n<li class=\"break-words\"><strong>Custom Orders</strong>: Personalized items (e.g., cakes with specific designs) cannot be returned unless faulty.</li>\r\n<li class=\"break-words\"><strong>Change of Mind</strong>: We do not accept returns for personal preference or canceled orders after dispatch.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>3. Return Conditions<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Timeframe</strong>: Notify us within 2 hours of delivery or pickup by contacting [e.g., <a href=\"mailto:returns@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">returns@ammaspastries.in</a>] or [e.g., +91 98765 43210].</li>\r\n<li class=\"break-words\"><strong>Condition</strong>: Items must be unused and in their original packaging (if applicable). For defective items, keep them as received for inspection.</li>\r\n<li class=\"break-words\"><strong>Proof</strong>: Provide your order number and photos of the issue (e.g., damaged packaging, wrong item).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. Return Process<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Step 1</strong>: Contact us with details of the problem.</li>\r\n<li class=\"break-words\"><strong>Step 2</strong>: We&rsquo;ll review your request within [e.g., 2 business days] and confirm eligibility.</li>\r\n<li class=\"break-words\"><strong>Step 3</strong>: If approved, we&rsquo;ll arrange:\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Pickup</strong>: For delivered orders, we&rsquo;ll schedule a return pickup at no cost (within our delivery zone).</li>\r\n<li class=\"break-words\"><strong>Drop-Off</strong>: For in-store purchases, return the item to B-16, Sector 63, Noida.</li>\r\n</ul>\r\n</li>\r\n<li class=\"break-words\"><strong>Step 4</strong>: Once received, we&rsquo;ll process a replacement or refund (see below).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>5. Resolution Options<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Replacement</strong>: We&rsquo;ll send a new item at no extra cost, delivered within&nbsp; 1-2 business days, subject to availability.</li>\r\n<li class=\"break-words\"><strong>Refund</strong>: If a replacement isn&rsquo;t possible, we&rsquo;ll issue a refund to your original payment method (see Refund Policy for details).</li>\r\n<li class=\"break-words\">Delivery fees are refunded only if the entire order is defective or incorrect.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>6. Custom Order Returns<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Faulty custom items (e.g., wrong design or damaged) are eligible for replacement or partial refund, based on the error.</li>\r\n<li class=\"break-words\">Non-faulty custom orders cannot be returned due to their personalized nature.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>7. Shipping Costs<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">We cover return shipping costs for eligible items within our delivery zone [e.g., 15 km radius of Mumbai].</li>\r\n<li class=\"break-words\">Outside this zone (if applicable), you may need to arrange return shipping, and we&rsquo;ll reimburse reasonable costs upon approval.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>8. Exceptions<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">We&rsquo;re not responsible for issues caused by mishandling after delivery (e.g., dropping a cake) or incorrect delivery details.</li>\r\n<li class=\"break-words\">Items left unreported beyond [e.g., 24 hours] may not qualify for return.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>9. Changes to This Policy<br></strong><br>We may update this Return Policy as needed. The latest version will be posted here, and continued purchases imply acceptance.<br><br></p>\r\n<p class=\"break-words\"><strong>10. Contact Us<br></strong><br>Questions about returns? Reach out:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Email:&nbsp;<a href=\"mailto:returns@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">returns@ammaspastries.in</a></li>\r\n<li class=\"break-words\">Phone: 9877777700</li>\r\n<li class=\"break-words\">Address: B-16, Sector 63, Noida</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 'return policy', '', 'return, policy', 'en', 2),
(3, 'Refund Policy', 'refund-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Refund Policy - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we want you to love every bite of our treats! Our Refund Policy explains the conditions under which we offer refunds or replacements. By purchasing from us, you agree to these terms.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Eligibility for Refunds<br></strong><br>We offer refunds or replacements in the following cases:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Incorrect Order</strong>: You received something different from what you ordered ( a chocolate cake instead of vanilla).</li>\r\n<li class=\"break-words\"><strong>Defective Product</strong>: The item was damaged, spoiled, or of poor quality due to our error (stale pastries).</li>\r\n<li class=\"break-words\"><strong>Non-Delivery</strong>: Your order didn&rsquo;t arrive within the confirmed delivery window (see Shipping Policy).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>2. Non-Refundable Items<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Custom Orders</strong>: Deposits or payments for personalized items (custom cakes) are non-refundable once production starts.</li>\r\n<li class=\"break-words\"><strong>Perishable Goods</strong>: Standard baked goods are non-returnable unless defective or incorrect, due to their perishable nature.</li>\r\n<li class=\"break-words\"><strong>Change of Mind</strong>: We do not offer refunds for cancellations due to personal preference after dispatch.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>3. Refund Process<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Timeframe</strong>: Report issues within 24 hours of receiving your order (non-delivery) by contacting us at&nbsp;<a href=\"mailto:refunds@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">refunds@ammaspastries.in</a> or 9877777700.</li>\r\n<li class=\"break-words\"><strong>Evidence</strong>: Include your order number and photos of the issue (like- damaged packaging).</li>\r\n<li class=\"break-words\"><strong>Resolution</strong>: We&rsquo;ll review your request and respond within 2 business days. Options include:\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Full or partial refund to your original payment method.</li>\r\n<li class=\"break-words\">Replacement item delivered at no extra cost.<br><br></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. Refund Amount<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Refunds cover the item cost and taxes. Delivery fees are refunded only if the entire order is undelivered or incorrect.</li>\r\n<li class=\"break-words\">For partial issues (e.g., one item in a multi-item order), we&rsquo;ll refund the affected portion.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>5. Cancellation Refunds</strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Cancel standard orders with 24 hours notice before delivery/pickup for a full refund.</li>\r\n<li class=\"break-words\">Cancellations after this period or post-dispatch are not eligible, except in cases of our error.</li>\r\n<li class=\"break-words\">Custom order deposits are non-refundable if canceled after 24 hours from booking.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>6. Processing Time<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Refunds are processed within 5-7 business days after approval.</li>\r\n<li class=\"break-words\">Funds will reflect in your account depending on your bank or payment provider (e.g., 3-10 days for card refunds, instant for UPI).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>7. Payment Methods<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Refunds are issued to the original payment method (e.g., credit/debit card, UPI, cash for in-store purchases).</li>\r\n<li class=\"break-words\">For cash-on-delivery (COD) orders, refunds will be credited via [e.g., bank transfer or UPI]&mdash;provide details when requesting.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>8. Exceptions<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">We&rsquo;re not liable for issues caused by incorrect delivery details or failure to receive the order (e.g., no one available at the address).</li>\r\n<li class=\"break-words\">Refunds may be denied if the product was mishandled after delivery (e.g., left outside in heat).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>9. Changes to This Policy<br></strong><br>We may update this Refund Policy as needed. The latest version will be posted here, and continued purchases imply acceptance.<br><br></p>\r\n<p class=\"break-words\"><strong>10. Contact Us<br></strong><br>Need help with a refund? Reach out:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Email:&nbsp;<a href=\"mailto:refunds@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">refunds@ammaspastries.in</a></li>\r\n<li class=\"break-words\">Phone: 9877777700</li>\r\n<li class=\"break-words\">Address: B-16, Sector 63, Noida</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(4, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Terms &amp; Conditions - Ammas Pastries</strong></p>\r\n<div class=\"elementor-element elementor-element-4cafe4 elementor-widget elementor-widget-text-editor\" data-id=\"4cafe4\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\">\r\n<div class=\"elementor-widget-container\">\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<p>Please carefully review the following terms and conditions (&ldquo;Terms and Conditions&rdquo;) before placing any orders for Goods or Services through this Website. By placing an order for any Goods or Services through this Website, via phone, or through our mobile applications or online platforms, you agree to abide by these Terms and Conditions.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"elementor-element elementor-element-e85646e elementor-align-center elementor-widget elementor-widget-lottie\" data-id=\"e85646e\" data-element_type=\"widget\" data-settings=\"{&quot;source_json&quot;:{&quot;url&quot;:&quot;https:\\/\\/ammaspastries.in\\/wp-content\\/uploads\\/2023\\/08\\/Terms-.json&quot;,&quot;id&quot;:83,&quot;size&quot;:&quot;&quot;,&quot;alt&quot;:&quot;&quot;,&quot;source&quot;:&quot;library&quot;},&quot;loop&quot;:&quot;yes&quot;,&quot;lazyload&quot;:&quot;yes&quot;,&quot;source&quot;:&quot;media_file&quot;,&quot;caption_source&quot;:&quot;none&quot;,&quot;link_to&quot;:&quot;none&quot;,&quot;trigger&quot;:&quot;arriving_to_viewport&quot;,&quot;viewport&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:{&quot;start&quot;:0,&quot;end&quot;:100}},&quot;play_speed&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:1,&quot;sizes&quot;:[]},&quot;start_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:0,&quot;sizes&quot;:[]},&quot;end_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:100,&quot;sizes&quot;:[]},&quot;renderer&quot;:&quot;svg&quot;}\" data-widget_type=\"lottie.default\">\r\n<div class=\"elementor-widget-container\">\r\n<div class=\"e-lottie__container\">\r\n<div class=\"e-lottie__animation\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"elementor-element elementor-element-b9e13bf elementor-widget elementor-widget-text-editor\" data-id=\"b9e13bf\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\">\r\n<div class=\"elementor-widget-container\">\r\n<ul>\r\n<li>The website www.ammaspastries.in/.ae/.com is owned and operated by Amma&rsquo;s Pastries.</li>\r\n<li>The prices and currency displayed at the checkout page will be the same as those printed on the Transaction Receipt, and the amount charged to your card will be shown in your card currency.</li>\r\n<li>The governing law for any purchase, dispute, or claim arising from this website shall be in accordance with applicable laws.</li>\r\n<li>Visa or MasterCard debit and credit cards in the accepted currency will be the mode of payment.</li>\r\n<li>We do not engage in trade or provide services to OFAC and sanctioned countries.</li>\r\n<li>Users under the age of 18 are not permitted to register or transact on the website.</li>\r\n<li>Cardholders are required to retain transaction records as per Amma&rsquo;s Pastries policies.</li>\r\n<li>Users are responsible for maintaining the confidentiality of their accounts.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"elementor-element elementor-element-51e717c elementor-align-center elementor-widget elementor-widget-lottie\" data-id=\"51e717c\" data-element_type=\"widget\" data-settings=\"{&quot;source_json&quot;:{&quot;url&quot;:&quot;https:\\/\\/ammaspastries.in\\/wp-content\\/uploads\\/2023\\/08\\/cake-walk.json&quot;,&quot;id&quot;:69,&quot;size&quot;:&quot;&quot;,&quot;alt&quot;:&quot;&quot;,&quot;source&quot;:&quot;library&quot;},&quot;loop&quot;:&quot;yes&quot;,&quot;lazyload&quot;:&quot;yes&quot;,&quot;source&quot;:&quot;media_file&quot;,&quot;caption_source&quot;:&quot;none&quot;,&quot;link_to&quot;:&quot;none&quot;,&quot;trigger&quot;:&quot;arriving_to_viewport&quot;,&quot;viewport&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:{&quot;start&quot;:0,&quot;end&quot;:100}},&quot;play_speed&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:1,&quot;sizes&quot;:[]},&quot;start_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:0,&quot;sizes&quot;:[]},&quot;end_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:100,&quot;sizes&quot;:[]},&quot;renderer&quot;:&quot;svg&quot;}\" data-widget_type=\"lottie.default\">\r\n<div class=\"elementor-widget-container\">\r\n<div class=\"e-lottie__container\">\r\n<div class=\"e-lottie__animation\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"elementor-element elementor-element-13bcc53 elementor-widget elementor-widget-text-editor\" data-id=\"13bcc53\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\">\r\n<div class=\"elementor-widget-container\">\r\n<h4>&nbsp;</h4>\r\n<h4><strong>Section 1: Definitions</strong><br><br></h4>\r\n<ul>\r\n<li>&ldquo;Agreement&rdquo; refers to these Terms and Conditions, any order form, and payment instructions provided to you.</li>\r\n<li>&ldquo;you&rdquo;, &ldquo;your&rdquo; refers to the individual accessing this Website and placing orders for Goods or Services.</li>\r\n<li>&ldquo;we&rdquo;, &ldquo;us&rdquo;, &ldquo;our&rdquo;, and &ldquo;Amma&rsquo;s Pastries&rdquo; refer to the Company.</li>\r\n<li>&ldquo;Goods&rdquo; refers to any products offered for sale on our Website.</li>\r\n<li>&ldquo;Service&rdquo; or &ldquo;Services&rdquo; refers to any services provided by us that you may request through our Website.</li>\r\n<li>&ldquo;Food Delivery&rdquo; refers to perishable goods and any associated delivery services, for which full responsibility is taken.<br><br></li>\r\n</ul>\r\n<h4><strong>Section 2: Ordering</strong><br><br></h4>\r\n<ul>\r\n<li>Any contract for the supply of Goods from this Website is between you and Amma&rsquo;s Pastries. By placing an order, you warrant the accuracy and completeness of your details and payment information. Goods purchased are for personal use and not for resale.</li>\r\n<li>Please ensure the suitability of products for the intended recipient, particularly concerning age restrictions.</li>\r\n<li>You must keep your account login details secure and not share them with third parties.</li>\r\n<li>While we take reasonable measures to secure your data, we are not liable for any losses resulting from unauthorized access.</li>\r\n<li>Order acceptance is subject to product availability and delivery capacity.</li>\r\n<li>Confirmation of orders will be sent via email or SMS, and availability and delivery details will be confirmed accordingly.<br><br></li>\r\n</ul>\r\n<h4><strong>Section 3: Prices and Payment</strong><br><br></h4>\r\n<ul>\r\n<li>All prices listed on the Website are correct at the time of publication but are subject to change at the time of delivery.</li>\r\n<li>We reserve the right to alter the Goods or Services available for sale on the Website.</li>\r\n<li>The total price, including delivery charges, will be displayed when placing your order, and full payment must be made before delivery.</li>\r\n<li>Online payment methods include credit or debit card or net banking.</li>\r\n<li>Your credit card details will be encrypted for security during online transactions.</li>\r\n<li>Tax rates and applicability are determined by Amma&rsquo;s Pastries in accordance with applicable laws.<br><br></li>\r\n</ul>\r\n<h4><strong>Section 4: Links</strong><br><br></h4>\r\n<ul>\r\n<li>We are not responsible for the content of third-party websites or the Goods or Services they provide.<br><br></li>\r\n</ul>\r\n<h4><strong>Section 5: Complaints</strong><br><br></h4>\r\n<ul>\r\n<li>We aim to respond to complaints within 3 business days. All complaints should be addressed through the provided channels.<br><br></li>\r\n</ul>\r\n<p>These&nbsp;<strong>Terms and Conditions</strong> constitute the entire agreement between you and Amma&rsquo;s Pastries regarding the use of the Website and the purchase of Goods or Services.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(5, 'Terms of Use', 'terms-of-use', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Terms of Use - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">Welcome to Ammas Pastries! By accessing or using our website, placing an order, or engaging with our services, you agree to the following Terms of Use. Please read them carefully.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Acceptance of Terms</strong></p>\r\n<p class=\"break-words\"><br>These Terms of Use govern your interaction with Ammas Pastries, including our website, online ordering platform, and in-store purchases. By using our services, you agree to comply with these terms. If you do not agree, please refrain from using our services.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>2. Products and Services<br></strong><br>We offer a variety of baked goods, custom orders, and related services. All product descriptions, prices, and availability are subject to change without notice. We strive to ensure accuracy but are not liable for errors or omissions.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>3. Orders and Payments<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Orders placed online or in-store are subject to acceptance and availability.</li>\r\n<li class=\"break-words\">Payment is due at the time of purchase unless otherwise agreed. We accept [list payment methods, e.g., credit cards, cash].</li>\r\n<li class=\"break-words\">All sales are final for perishable items unless defective or incorrect due to our error.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. User Conduct<br></strong><br>You agree not to:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Use our website or services for unlawful purposes.</li>\r\n<li class=\"break-words\">Copy, reproduce, or distribute our content without permission.</li>\r\n<li class=\"break-words\">Interfere with the functionality of our website.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>5. Intellectual Property<br></strong><br>All content on our website (e.g., logos, images, recipes) is the property of Ammas Pastries or its licensors and is protected by copyright and trademark laws. You may not use it without our written consent.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>6. Privacy<br></strong><br>Your use of our services is also governed by our Privacy Policy [link to policy if applicable], which outlines how we collect, use, and protect your information.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>7. Limitation of Liability<br></strong><br>Ammas Pastries is not liable for:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Allergic reactions or health issues from consuming our products (please inform us of allergies when ordering).</li>\r\n<li class=\"break-words\">Indirect damages arising from your use of our services.</li>\r\n<li class=\"break-words\">Delays or issues beyond our control (e.g., weather, technical failures)<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>8. Changes to Terms<br></strong><br>We may update these Terms of Use at any time. Changes will be posted on this page, and your continued use of our services constitutes acceptance of the updated terms.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>9. Termination<br></strong><br>We reserve the right to refuse service or terminate access to our website at our discretion, without notice, for any reason.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>10. Contact Us<br></strong><br>Questions about these Terms? Reach out to us at email: <a href=\"mailto:info@ammaspastries.com\" target=\"_blank\" rel=\"noopener noreferrer\">info@ammaspastries.com</a> or phone: 9877777700.</p>\r\n</div>\r\n</div>\r\n</div>', 'Terms of use', '', 'term, use', 'en', 5),
(6, 'Customer Service', 'customer-service', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Customer Service That Cares</strong></p>\r\n<p class=\"break-words\"><br>Our customers are at the heart of everything we do. We&rsquo;re committed to making your time with us as sweet as our pastries. Whether you&rsquo;re stopping by our bakery, placing an order online, or reaching out with a question, our friendly team is here to help. Need a custom cake for a special occasion? Have a dietary request? We&rsquo;ve got you covered. Our goal is to ensure every interaction leaves you smiling&mdash;just like our treats do.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">We pride ourselves on being more than a bakery; we&rsquo;re your go-to for quality, warmth, and reliability. From the moment you walk in to the last crumb of your favorite pastry, we&rsquo;re dedicated to exceptional service that feels like family. Have feedback or a special request? Don&rsquo;t hesitate to let us know&mdash;we&rsquo;re always listening.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">Thank you for choosing Ammas Pastries. We&rsquo;re here to serve you with a sprinkle of joy and a whole lot of care.</p>\r\n</div>\r\n</div>\r\n</div>', 'Customer Service', '', 'customer, service', 'en', 6),
(7, 'What\'s New', 'whats-new', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>What&rsquo;s New - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we&rsquo;re always whipping up something exciting to keep your taste buds tingling. Check out the latest from our ovens and see what&rsquo;s fresh at your favorite bakery!</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>Seasonal Delights</strong></p>\r\n<p class=\"break-words\"><br>Spring has sprung, and so have our new flavors! Try our <strong>Lemon Blossom Tart</strong>, a zesty treat with a buttery crust, or indulge in the <strong>Strawberry Rose Pastry</strong>, a delicate blend of sweet berries and floral notes. These limited-time goodies are perfect for brightening your day.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>New Menu Additions</strong></p>\r\n<p class=\"break-words\"><br>We&rsquo;ve expanded our lineup! Say hello to our <strong>Savory Spinach &amp; Feta Croissant</strong>&mdash;a flaky, golden twist for those who love a little savory with their bake. Pair it with our freshly brewed <strong>Honey Lavender Latte</strong>, now available in-store and to-go.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>Celebration Cakes</strong></p>\r\n<p class=\"break-words\"><br>Planning a party? Our new <strong>Customizable Mini Cake Collection</strong> is here to steal the show. Choose your flavors, colors, and toppings&mdash;perfect for birthdays, showers, or just because. Order ahead and let us make your moments extra sweet.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>Bakery Updates</strong></p>\r\n<p class=\"break-words\"><br>We&rsquo;re thrilled to announce extended weekend hours! Stop by Saturday and Sunday until 8 PM to grab your favorites. Plus, our loyalty program just got tastier&mdash;earn double points on every purchase this month. Sign up today and start savoring the rewards.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">Stay tuned for more delicious surprises! Follow us on social media or pop in to see what&rsquo;s baking. At Ammas Pastries, there&rsquo;s always something new to love.</p>\r\n</div>\r\n</div>\r\n</div>', 'What\'s New', '', 'new', 'en', 7),
(8, 'Payment Policy', 'payment-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Payment Policy - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we aim to make your shopping experience as smooth as our buttercream frosting! This Payment Policy explains how we process payments for your orders, both in-store and online. By making a purchase, you agree to these terms.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Accepted Payment Methods<br></strong><br>We accept the following payment options:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>In-Store</strong>: Cash, credit/debit cards (Visa, Mastercard, American Express), and mobile payments (e.g., Apple Pay, Google Pay).</li>\r\n<li class=\"break-words\"><strong>Online</strong>: Credit/debit cards (Visa, Mastercard, American Express) and [e.g., PayPal, if applicable].</li>\r\n<li class=\"break-words\"><strong>Custom Orders</strong>: A deposit via card or cash, with the balance due upon pickup or delivery.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\">Note: We do not accept checks or cryptocurrency at this time.<br><br></p>\r\n<p class=\"break-words\"><strong>2. Pricing<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">All prices are listed in [e.g., USD] and exclude applicable taxes and fees (e.g., delivery charges), which will be added at checkout.</li>\r\n<li class=\"break-words\">Prices are subject to change without notice, but your order total is locked in once confirmed.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>3. Payment Timing<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Standard Orders</strong>: Full payment is due at the time of purchase, whether online or in-store.</li>\r\n<li class=\"break-words\"><strong>Custom Orders</strong>: A non-refundable deposit of [e.g., 50%] is required at the time of booking, with the remaining balance due [e.g., 48 hours before pickup/delivery or at pickup].</li>\r\n<li class=\"break-words\"><strong>Pre-Orders</strong>: Full payment is required upfront to secure your order.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. Transaction Security<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Online payments are processed through secure, encrypted third-party gateways [e.g., Stripe, PayPal]. We do not store your full payment details on our servers.</li>\r\n<li class=\"break-words\">In-store card transactions use PCI-compliant systems to protect your information.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>5. Failed Payments<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">If a payment fails (e.g., declined card), we&rsquo;ll notify you via email or phone and hold your order for&nbsp; 24 hours. If unresolved, the order may be canceled.</li>\r\n<li class=\"break-words\">Additional fees for failed transactions bank charges are your responsibility.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>6. Refunds<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Refunds are issued to the original payment method for:\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Canceled standard orders with 24 hours notice.</li>\r\n<li class=\"break-words\">Defective or incorrect items, if reported within 24 hours of receipt.</li>\r\n</ul>\r\n</li>\r\n<li class=\"break-words\">Custom order deposits are non-refundable once production begins.</li>\r\n<li class=\"break-words\">Processing time for refunds is 5-10 business days.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>7. Currency<br></strong><br>All transactions are processed in INR. If you&rsquo;re paying from outside the India, your bank may apply currency conversion fees, which are not our responsibility.<br><br></p>\r\n<p class=\"break-words\"><strong>8. Billing Disputes<br></strong><br>If you believe there&rsquo;s an error in your charge, contact us within 7 days at <a href=\"mailto:billing@ammaspastries.com\" target=\"_blank\" rel=\"noopener noreferrer\">billing@ammaspastries.com</a> with your order details. We&rsquo;ll investigate and respond within 5 business days<br>.</p>\r\n<p class=\"break-words\"><strong>9. Changes to This Policy<br></strong><br>We may update this Payment Policy as needed. The latest version will be posted here, and continued purchases imply acceptance.<br><br></p>\r\n<p class=\"break-words\"><strong>10. Contact Us<br></strong><br>Questions about payments? Reach out:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Email:&nbsp;<a href=\"mailto:billing@ammaspastries.com\" target=\"_blank\" rel=\"noopener noreferrer\">billing@ammaspastries.com</a></li>\r\n<li class=\"break-words\">Phone: 9877777700</li>\r\n<li class=\"break-words\">Address: B-16, Sector 63, Noida</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 'Payment Policy', '', 'payment, policy', 'en', 8),
(9, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Shipping Policy - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we&rsquo;re excited to deliver our delicious baked goods right to your door across India! This Shipping Policy explains our delivery process, costs, and terms. By ordering from us, you agree to these conditions.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Shipping Availability<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">We offer delivery within 15 km radius of our bakery in Noida..</li>\r\n<li class=\"break-words\">For areas beyond this, please contact us to check availability&mdash;we&rsquo;re working to expand!</li>\r\n<li class=\"break-words\">In-store pickup is available at&nbsp; B-16, Sector 63, Noida.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>2. Delivery Fees<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Standard Delivery</strong>: ₹ 100 flat rate within our delivery zone.</li>\r\n<li class=\"break-words\"><strong>Rush Delivery</strong>: ₹ 200 for same-day orders placed before 12 PM, subject to availability.</li>\r\n<li class=\"break-words\">Fees are added to your order total at checkout.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>3. Order Processing<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Orders are processed within&nbsp; 1-2 business days unless specified otherwise.</li>\r\n<li class=\"break-words\">Custom orders wedding cakes require 48 hours notice&mdash;confirm with us when booking.</li>\r\n<li class=\"break-words\">Orders placed after 3 PM IST may be processed the next business day.</li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. Delivery Schedule</strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Deliveries occur Monday-Saturday, 10 AM-7 PM IST. No deliveries on Sundays or major Indian holidays (e.g., Diwali, Republic Day).</li>\r\n<li class=\"break-words\">Choose a delivery slot (e.g., 2-hour window) at checkout. We&rsquo;ll aim to meet it, but delays may occur due to traffic or peak demand.</li>\r\n<li class=\"break-words\">You&rsquo;ll get a confirmation with an estimated delivery time via email, SMS, or WhatsApp.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>5. Shipping Conditions<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Our baked goods are perishable and packed to stay fresh (e.g., sealed boxes, cooling packs in summer).</li>\r\n<li class=\"break-words\">Someone should be present to receive the order. If not, we&rsquo;ll leave it in a safe spot, but we&rsquo;re not liable for spoilage post-drop-off.</li>\r\n<li class=\"break-words\">Extreme weather (e.g., monsoon rains, heatwaves) may affect delivery schedules&mdash;we&rsquo;ll notify you of delays.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>6. Incorrect Addresses<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Ensure your delivery address and PIN code are correct at checkout. We&rsquo;re not responsible for delays or losses due to errors.</li>\r\n<li class=\"break-words\">Address changes after confirmation may incur a ₹50 fee or delay delivery.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>7. Damaged or Missing Items<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Check your order on arrival. Report issues&nbsp; damaged pastries, missing items within 24 hours at <a href=\"mailto:shipping@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">shipping@ammaspastries.in</a>&nbsp;with photos.</li>\r\n<li class=\"break-words\">We&rsquo;ll replace or refund affected items if the fault is ours, at our discretion.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>8. Cancellations and Delays<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Cancel orders with&nbsp; 24 hours notice for a full refund (see Payment Policy for details).</li>\r\n<li class=\"break-words\">Delays due to unforeseen events ( traffic, strikes, or weather) are beyond our control&mdash;we&rsquo;ll keep you informed.<br><br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>9. Lost Shipments<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">If your order doesn&rsquo;t arrive within the confirmed window, contact us within [e.g., 48 hours]. We&rsquo;ll track it and resolve the issue (e.g., resend or refund).<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>10. Contact Us<br></strong><br>Questions about shipping? Get in touch:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Email:&nbsp;<a href=\"mailto:shipping@ammaspastries.in\" target=\"_blank\" rel=\"noopener noreferrer\">shipping@ammaspastries.in</a></li>\r\n<li class=\"break-words\">Phone: 9877777700</li>\r\n<li class=\"break-words\">Address: B-16, Sector 63, Noida</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 'Shipping Policy', '', 'shipping, policy', 'en', 9),
(10, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<div>\r\n<p class=\"break-words\"><strong>Privacy Policy - Ammas Pastries</strong></p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\">At Ammas Pastries, we value your trust and are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your personal information when you visit our website, place an order, or interact with our services. By using our services, you agree to the practices described below.</p>\r\n<p class=\"break-words\">&nbsp;</p>\r\n<p class=\"break-words\"><strong>1. Information We Collect<br></strong><br>We may collect the following types of information:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Personal Information</strong>: Name, email address, phone number, and delivery address when you place an order or contact us.</li>\r\n<li class=\"break-words\"><strong>Payment Information</strong>: Credit card details or other payment data, processed securely via our trusted payment partners.</li>\r\n<li class=\"break-words\"><strong>Usage Data</strong>: Information about how you use our website, such as pages visited, IP address, and browser type, collected via cookies or analytics tools.</li>\r\n<li class=\"break-words\"><strong>Feedback</strong>: Comments or inquiries you submit through forms, emails, or surveys.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>2. How We Use Your Information<br></strong><br>We use your information to:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Process and fulfill your orders, including delivery and payment confirmation.</li>\r\n<li class=\"break-words\">Communicate with you about your purchases, updates, or promotions (with your consent).</li>\r\n<li class=\"break-words\">Improve our website, products, and services based on usage trends and feedback.</li>\r\n<li class=\"break-words\">Comply with legal obligations or resolve disputes.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>3. How We Share Your Information<br></strong><br>We do not sell or rent your personal information. We may share it with:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Service Providers</strong>: Third parties who assist with payment processing, delivery, or website hosting (e.g., [list examples like Stripe, UPS]). These partners are bound to protect your data.</li>\r\n<li class=\"break-words\"><strong>Legal Authorities</strong>: If required by law or to protect our rights and safety.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>4. Cookies and Tracking<br></strong><br>Our website uses cookies to enhance your experience (e.g., remembering your cart). You can manage cookie preferences through your browser settings. We may also use analytics tools (e.g., Google Analytics) to track site performance.<br><br></p>\r\n<p class=\"break-words\"><strong>5. Data Security<br></strong><br>We take reasonable steps to protect your information with encryption, secure servers, and access controls. However, no system is 100% secure, and we cannot guarantee absolute protection against breaches.<br><br></p>\r\n<p class=\"break-words\"><strong>6. Your Choices<br><br></strong></p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\"><strong>Opt-Out</strong>: Unsubscribe from marketing emails using the link in any message or by contacting us.</li>\r\n<li class=\"break-words\"><strong>Access or Delete</strong>: Request to see or remove your personal data by emailing [e.g., <a href=\"mailto:privacy@ammaspastries.com\" target=\"_blank\" rel=\"noopener noreferrer\">privacy@ammaspastries.com</a>]. We&rsquo;ll respond within 30 days.</li>\r\n<li class=\"break-words\"><strong>Cookies</strong>: Disable cookies in your browser, though this may limit site functionality.<br><br></li>\r\n</ul>\r\n<p class=\"break-words\"><strong>7. Children&rsquo;s Privacy<br></strong><br>Our services are not intended for children under 13. We do not knowingly collect data from minors. If we learn such data has been collected, we will delete it promptly.<br><br></p>\r\n<p class=\"break-words\"><strong>8. Third-Party Links<br></strong><br>Our website may contain links to external sites (e.g., social media). We are not responsible for their privacy practices&mdash;please review their policies.<br><br></p>\r\n<p class=\"break-words\"><strong>9. Changes to This Policy<br></strong><br>We may update this Privacy Policy as needed. Changes will be posted here, and significant updates will be communicated via email or a website notice. Your continued use of our services after changes implies acceptance.<br><br></p>\r\n<p class=\"break-words\"><strong>10. Contact Us</strong><br>Questions or concerns about your privacy? Reach out at:</p>\r\n<ul class=\"marker:text-secondary\">\r\n<li class=\"break-words\">Email: <a href=\"mailto:privacy@ammaspastries.com\" target=\"_blank\" rel=\"noopener noreferrer\">privacy@ammaspastries.com</a></li>\r\n<li class=\"break-words\">Phone: 9877777700</li>\r\n<li class=\"break-words\">Address: B-16, Sector 63, Noida</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 'Privacy Policy', '', 'privacy, policy', 'en', 10);

-- --------------------------------------------------------

--
-- Table structure for table `compare_items`
--

CREATE TABLE `compare_items` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `contact`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Raj Tiwari', 'raj.tiwari@ens.enterprises', '07827795324', 'test', '2025-04-12 06:05:08', '2025-04-12 06:05:08'),
(2, 'Reyansh Tiwari', 'reyansh.tiwari@ens.enterprises', '7827795345', 'testing 2', '2025-04-14 06:43:40', '2025-04-14 06:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(4, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(5, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(6, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(7, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(8, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(9, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(10, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(11, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(12, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(13, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(14, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(15, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(16, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(17, 'customer.settings.social_login.enable_facebook', '0', 'default', NULL, '2025-03-26 05:48:02', '2025-04-28 05:58:32'),
(18, 'customer.settings.social_login.enable_twitter', '0', 'default', NULL, '2025-03-26 05:48:02', '2025-03-26 11:16:27'),
(19, 'customer.settings.social_login.enable_google', '0', 'default', NULL, '2025-03-26 05:48:02', '2025-04-28 05:58:32'),
(20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(21, 'customer.settings.social_login.enable_github', '0', 'default', NULL, '2025-03-26 05:48:02', '2025-03-26 11:16:27'),
(28, 'general.design.admin_logo.logo_image', 'configuration/2XF0Qch9n500NM4IoMCS2OF4ezdvMBH0L4EFYuvD.png', NULL, NULL, '2025-03-26 09:52:09', '2025-05-02 05:29:27'),
(29, 'general.design.admin_logo.favicon', 'configuration/3GVpJPPJDcTBxD9pZTVvPhKYly2lhp1CcyN3mA3U.png', NULL, NULL, '2025-03-26 09:52:09', '2025-05-02 05:29:27'),
(30, 'catalog.products.settings.compare_option', '1', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(31, 'catalog.products.settings.image_search', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(32, 'catalog.products.search.engine', 'database', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(33, 'catalog.products.search.admin_mode', 'database', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(34, 'catalog.products.search.storefront_mode', 'database', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(35, 'catalog.products.search.min_query_length', '3', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(36, 'catalog.products.search.max_query_length', '1000', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(37, 'catalog.products.product_view_page.no_of_related_products', '6', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(38, 'catalog.products.product_view_page.no_of_up_sells_products', '6', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(39, 'catalog.products.cart_view_page.no_of_cross_sells_products', '6', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(40, 'catalog.products.storefront.mode', 'grid', 'default', NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(41, 'catalog.products.storefront.products_per_page', '12,24,36,48', 'default', NULL, '2025-03-26 09:55:29', '2025-04-23 08:02:05'),
(42, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-05-01 07:40:38'),
(43, 'catalog.products.cache_small_image.width', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(44, 'catalog.products.cache_small_image.height', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(45, 'catalog.products.cache_medium_image.width', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(46, 'catalog.products.cache_medium_image.height', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(47, 'catalog.products.cache_large_image.width', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(48, 'catalog.products.cache_large_image.height', '', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(49, 'catalog.products.review.guest_review', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(50, 'catalog.products.review.customer_review', '1', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(51, 'catalog.products.review.summary', 'review_counts', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(52, 'catalog.products.attribute.image_attribute_upload_size', '1000', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(53, 'catalog.products.attribute.file_attribute_upload_size', '3000', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(54, 'catalog.products.social_share.enabled', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-05-01 07:24:24'),
(55, 'catalog.products.social_share.facebook', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-05-01 07:24:24'),
(56, 'catalog.products.social_share.twitter', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(57, 'catalog.products.social_share.pinterest', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(58, 'catalog.products.social_share.whatsapp', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(59, 'catalog.products.social_share.linkedin', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(60, 'catalog.products.social_share.email', '0', NULL, NULL, '2025-03-26 09:55:29', '2025-03-26 09:55:29'),
(61, 'catalog.products.social_share.share_message', '', NULL, NULL, '2025-03-26 09:55:29', '2025-05-01 07:24:25'),
(62, 'customer.settings.wishlist.wishlist_option', '1', NULL, NULL, '2025-03-26 11:16:27', '2025-04-23 07:59:55'),
(63, 'customer.settings.login_options.redirected_to_page', 'account', NULL, NULL, '2025-03-26 11:16:27', '2025-04-23 07:59:33'),
(64, 'customer.settings.create_new_account_options.default_group', 'general', NULL, NULL, '2025-03-26 11:16:27', '2025-03-26 11:16:27'),
(65, 'customer.settings.create_new_account_options.news_letter', '1', NULL, NULL, '2025-03-26 11:16:27', '2025-03-26 11:16:27'),
(66, 'customer.settings.newsletter.subscription', '1', NULL, NULL, '2025-03-26 11:16:27', '2025-03-26 11:16:27'),
(67, 'customer.settings.email.verification', '0', NULL, NULL, '2025-03-26 11:16:27', '2025-03-26 11:16:27'),
(68, 'customer.settings.social_login.enable_linkedin-openid', '0', 'default', NULL, '2025-03-26 11:16:27', '2025-03-26 11:16:27'),
(69, 'sales.checkout.shopping_cart.cart_page', '1', NULL, NULL, '2025-04-10 11:39:30', '2025-05-01 07:39:47'),
(70, 'sales.checkout.shopping_cart.cross_sell', '1', NULL, NULL, '2025-04-10 11:39:30', '2025-04-10 11:39:30'),
(71, 'sales.checkout.shopping_cart.estimate_shipping', '0', NULL, NULL, '2025-04-10 11:39:30', '2025-04-10 11:39:30'),
(72, 'sales.checkout.my_cart.summary', 'display_item_quantity', NULL, NULL, '2025-04-10 11:39:30', '2025-04-10 11:39:30'),
(73, 'sales.checkout.mini_cart.display_mini_cart', '1', NULL, NULL, '2025-04-10 11:39:30', '2025-05-01 07:36:40'),
(74, 'sales.checkout.mini_cart.offer_info', 'Get Up To 30% OFF on your 1st order', NULL, NULL, '2025-04-10 11:39:31', '2025-04-10 11:39:31'),
(75, 'sales.payment_methods.cashondelivery.title', 'Cash On Delivery', 'default', 'en', '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(76, 'sales.payment_methods.cashondelivery.description', 'Cash On Delivery', 'default', 'en', '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(77, 'sales.payment_methods.cashondelivery.instructions', '', 'default', 'en', '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(78, 'sales.payment_methods.cashondelivery.generate_invoice', '0', 'default', NULL, '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(79, 'sales.payment_methods.cashondelivery.active', '1', 'default', NULL, '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(80, 'sales.payment_methods.cashondelivery.sort', '1', NULL, NULL, '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(81, 'sales.payment_methods.moneytransfer.description', 'Money Transfer', 'default', 'en', '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(82, 'sales.payment_methods.moneytransfer.generate_invoice', '0', 'default', NULL, '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(83, 'sales.payment_methods.moneytransfer.mailing_address', '', 'default', 'en', '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(84, 'sales.payment_methods.moneytransfer.active', '0', 'default', NULL, '2025-04-23 07:49:13', '2025-04-23 07:49:13'),
(85, 'sales.payment_methods.moneytransfer.sort', '2', NULL, NULL, '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(86, 'sales.payment_methods.paypal_standard.description', 'PayPal Standard', 'default', 'en', '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(87, 'sales.payment_methods.paypal_standard.active', '0', 'default', NULL, '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(88, 'sales.payment_methods.paypal_standard.sandbox', '0', 'default', NULL, '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(89, 'sales.payment_methods.paypal_standard.sort', '3', NULL, NULL, '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(90, 'sales.payment_methods.paypal_smart_button.description', 'PayPal', 'default', 'en', '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(91, 'sales.payment_methods.paypal_smart_button.active', '0', 'default', NULL, '2025-04-23 07:49:14', '2025-05-02 08:23:39'),
(92, 'sales.payment_methods.paypal_smart_button.sandbox', '0', 'default', NULL, '2025-04-23 07:49:14', '2025-05-02 08:23:39'),
(93, 'sales.payment_methods.paypal_smart_button.sort', '4', NULL, NULL, '2025-04-23 07:49:14', '2025-04-23 07:49:14'),
(94, 'sales.carriers.free.title', 'Free Shipping', 'default', 'en', '2025-04-23 07:49:30', '2025-04-23 07:49:30'),
(95, 'sales.carriers.free.description', 'Free Shipping', 'default', 'en', '2025-04-23 07:49:30', '2025-04-23 07:49:30'),
(96, 'sales.carriers.free.active', '1', 'default', NULL, '2025-04-23 07:49:30', '2025-04-23 07:49:30'),
(97, 'sales.carriers.flatrate.description', 'Flat Rate Shipping', 'default', 'en', '2025-04-23 07:49:30', '2025-04-23 07:49:30'),
(98, 'sales.carriers.flatrate.type', 'per_unit', 'default', NULL, '2025-04-23 07:49:30', '2025-04-23 07:49:30'),
(99, 'sales.carriers.flatrate.active', '0', 'default', NULL, '2025-04-23 07:49:31', '2025-04-23 07:49:31'),
(100, 'sales.order_settings.order_number.order_number_prefix', '', 'default', NULL, '2025-04-23 07:50:39', '2025-04-23 07:50:39'),
(101, 'sales.order_settings.order_number.order_number_length', '', 'default', NULL, '2025-04-23 07:50:39', '2025-04-23 07:50:39'),
(102, 'sales.order_settings.order_number.order_number_suffix', '', 'default', NULL, '2025-04-23 07:50:40', '2025-04-23 07:50:40'),
(103, 'sales.order_settings.order_number.order_number_generator', '', 'default', NULL, '2025-04-23 07:50:40', '2025-04-23 07:50:40'),
(104, 'sales.order_settings.minimum_order.enable', '0', NULL, NULL, '2025-04-23 07:50:40', '2025-04-23 07:50:40'),
(105, 'sales.order_settings.reorder.admin', '0', NULL, NULL, '2025-04-23 07:50:40', '2025-04-23 07:50:40'),
(106, 'sales.order_settings.reorder.shop', '0', NULL, NULL, '2025-04-23 07:50:40', '2025-04-23 07:50:40'),
(107, '_token', 'NVg6XjudJuZbeODrLlQZoe4Ftm6cW2oBdqpfvQp1', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(108, 'blog_post_per_page', '5', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(109, 'blog_post_maximum_related', '5', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(110, 'blog_post_show_categories_with_count', '1', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(111, 'blog_post_show_tags_with_count', '1', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(112, 'blog_post_show_author_page', '1', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(113, 'blog_post_enable_comment', '1', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(114, 'blog_post_allow_guest_comment', '0', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(115, 'blog_post_maximum_nested_comment', '10', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(116, 'blog_seo_meta_title', '', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(117, 'blog_seo_meta_keywords', '', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(118, 'blog_seo_meta_description', '', NULL, NULL, '2025-04-25 11:22:48', '2025-04-25 11:22:48'),
(119, 'catalog.rich_snippets.products.enable', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:31:19'),
(120, 'catalog.rich_snippets.products.show_sku', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:26:30'),
(121, 'catalog.rich_snippets.products.show_weight', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:26:30'),
(122, 'catalog.rich_snippets.products.show_categories', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:26:30'),
(123, 'catalog.rich_snippets.products.show_images', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:31:20'),
(124, 'catalog.rich_snippets.products.show_reviews', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:31:20'),
(125, 'catalog.rich_snippets.products.show_ratings', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:31:20'),
(126, 'catalog.rich_snippets.products.show_offers', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:26:30'),
(127, 'catalog.rich_snippets.categories.enable', '0', NULL, NULL, '2025-05-01 07:25:09', '2025-05-01 07:33:19'),
(128, 'catalog.rich_snippets.categories.show_search_input_field', '0', NULL, NULL, '2025-05-01 07:25:10', '2025-05-01 07:33:19'),
(129, 'sales.payment_methods.paypal_smart_button.title', 'PayPal Smart Button', 'default', 'en', '2025-05-02 07:59:46', '2025-05-02 07:59:46'),
(130, 'sales.payment_methods.paypal_smart_button.client_id', 'sb', 'default', NULL, '2025-05-02 07:59:46', '2025-05-02 07:59:46'),
(131, 'sales.payment_methods.paypal_smart_button.client_secret', 'gt65tghy78ujhyui', 'default', NULL, '2025-05-02 07:59:47', '2025-05-02 07:59:47'),
(132, 'sales.payment_methods.paypal_smart_button.accepted_currencies', 'USD,INR', 'default', NULL, '2025-05-02 07:59:47', '2025-05-02 07:59:47'),
(133, 'sales.payment_methods.razorpay.title', 'Razorpay', 'default', 'en', '2025-05-02 09:36:18', '2025-05-02 09:36:18'),
(134, 'sales.payment_methods.razorpay.description', 'Razorpay', 'default', 'en', '2025-05-02 09:36:18', '2025-05-02 09:36:18'),
(135, 'sales.payment_methods.razorpay.license_keyid', 'mit', NULL, NULL, '2025-05-02 09:36:18', '2025-05-02 09:36:18'),
(136, 'sales.payment_methods.razorpay.key_id', 'juyh7876yhg', NULL, 'en', '2025-05-02 09:36:18', '2025-05-02 09:36:18'),
(137, 'sales.payment_methods.razorpay.secret', 'ujhuytgtf', NULL, 'en', '2025-05-02 09:36:19', '2025-05-02 09:36:19'),
(138, 'sales.payment_methods.razorpay.active', '1', NULL, 'en', '2025-05-02 09:36:19', '2025-05-02 09:36:19'),
(139, 'reward.general.general.module-status', '1', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(140, 'reward.general.general.reward-when-customer-register', '30', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(141, 'reward.general.general.reward-when-customer-register-exp-days', '90', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(142, 'reward.general.general.reward-when-customer-dob', '50', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(143, 'reward.general.general.reward-when-customer-dob-exp-days', '90', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(144, 'reward.general.general.reward-when-product-reviewed', '40', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(145, 'reward.general.general.reward-when-product-reviewed-exp-days', '90', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(146, 'reward.general.general.reward-used-at-one-time', '100', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32'),
(147, 'reward.general.general.email-notification', '1', 'default', 'en', '2025-05-09 09:41:32', '2025-05-09 09:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Table structure for table `country_state_translations`
--

CREATE TABLE `country_state_translations` (
  `id` int UNSIGNED NOT NULL,
  `country_state_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int UNSIGNED NOT NULL DEFAULT '2',
  `group_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
(2, 'INR', 'Indian Rupees', '₹', 2, ',', '.', 'left_with_space', '2025-03-26 11:10:31', '2025-03-26 11:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_reward_points` int UNSIGNED DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `total_reward_points`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Raj', 'Tiwari', 'Male', NULL, 'raj.tiwari@ens.enterprises', '7827795324', 'customer/1/oMBnKFbWNsg6UG3qlizxisdsPThlb156064PHvGp.jpg', 1, '$2y$10$STAG/gsYQAuD1Jvl069Baub13p3Twg6UGT3smAeDX3ynNVUNlVpU.', NULL, 'zFVzCSRHfwI5O2Lc1OBnDIrV2qfEaHArHJmd25lThjS65IfnkBFgNn2V5pgnm9dyYfYsdzZofow7i0Cj', 2, 1, 1, 1, 0, '1a9c27e2da92d80183e55e398a674f33', 'SAUZBQxCN5IMmTP6rMqRZoedf5aK9RAg2Mz0uBMHONwtUF24GYbCqsDEGx7J', '2025-03-26 11:37:20', '2025-03-26 12:15:11'),
(3, 'Reyansh', 'Tiwari', NULL, NULL, 'reyansh.tiwari@ens.enterprises', '7827795325', NULL, 1, '$2y$10$aqxKzPaN0B0g.aO1OAe.peJlgoVytEd9L4RRcYwFHdfkEXVTDllWG', NULL, 'lzBMQcxe1x3WrKXwx7iBIgmedzLEFM2PUf9F2ODJJY1X8EKYynoxJEn5wBJVNxMjf9XhKJFLdL2hDawV', 2, 1, 1, 1, 0, '7629726a9e81995b0dd3f90b0d4d1beb', NULL, '2025-04-23 09:58:26', '2025-04-23 09:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Guest', 0, NULL, NULL),
(2, 'general', 'General', 0, NULL, NULL),
(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_otps`
--

CREATE TABLE `customer_otps` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_otps`
--

INSERT INTO `customer_otps` (`id`, `customer_id`, `mobile`, `otp`, `expires_at`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 1, '7827795324', '593445', '2025-04-28 07:41:36', 0, '2025-04-28 07:36:36', '2025-04-28 07:36:36'),
(2, 1, '7827795324', '147332', '2025-04-28 07:42:55', 0, '2025-04-28 07:37:55', '2025-04-28 07:37:55'),
(3, 1, '7827795324', '925661', '2025-04-28 07:44:48', 0, '2025-04-28 07:39:48', '2025-04-28 07:39:48'),
(4, 1, '7827795324', '611314', '2025-04-28 07:47:17', 0, '2025-04-28 07:42:17', '2025-04-28 07:42:17'),
(5, 1, '7827795324', '593357', '2025-04-28 07:56:24', 0, '2025-04-28 07:51:24', '2025-04-28 07:51:24'),
(6, 1, '7827795324', '608029', '2025-04-28 07:58:14', 0, '2025-04-28 07:53:14', '2025-04-28 07:53:14'),
(7, 1, '7827795324', '787686', '2025-04-28 08:01:33', 0, '2025-04-28 07:56:33', '2025-04-28 07:56:33'),
(8, 1, '7827795324', '928822', '2025-04-28 10:23:53', 0, '2025-04-28 10:18:53', '2025-04-28 10:18:53'),
(9, 1, '7827795324', '102196', '2025-04-28 10:37:00', 0, '2025-04-28 10:32:00', '2025-04-28 10:32:00'),
(10, 1, '7827795324', '113334', '2025-04-28 10:41:12', 0, '2025-04-28 10:36:12', '2025-04-28 10:36:12'),
(11, 1, '7827795324', '568018', '2025-04-28 10:42:13', 0, '2025-04-28 10:37:13', '2025-04-28 10:37:13'),
(12, 1, '7827795324', '791542', '2025-04-28 10:43:26', 0, '2025-04-28 10:38:26', '2025-04-28 10:38:26'),
(13, 1, '7827795324', '691711', '2025-04-28 10:49:37', 1, '2025-04-28 10:44:37', '2025-04-28 10:46:28'),
(14, 1, '7827795324', '646704', '2025-04-28 10:52:07', 1, '2025-04-28 10:47:07', '2025-04-28 10:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

CREATE TABLE `customer_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_social_accounts`
--

CREATE TABLE `customer_social_accounts` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `provider_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `datagrid_saved_filters`
--

CREATE TABLE `datagrid_saved_filters` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `id` int UNSIGNED NOT NULL,
  `product_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_item_id` int UNSIGNED NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ens_sms`
--

CREATE TABLE `ens_sms` (
  `id` int UNSIGNED NOT NULL,
  `response` json DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `giftcard_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `giftcard_amount` decimal(10,0) NOT NULL,
  `expirationdate` date NOT NULL,
  `expirein` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `giftcard_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sendername` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senderemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipientname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipientemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creationdate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_balances`
--

CREATE TABLE `gift_card_balances` (
  `id` bigint UNSIGNED NOT NULL,
  `giftcard_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `giftcard_amount` decimal(10,2) NOT NULL,
  `used_giftcard_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remaining_giftcard_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_payments`
--

CREATE TABLE `gift_card_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `giftcard_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_data` json NOT NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int UNSIGNED NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `import_batches`
--

CREATE TABLE `import_batches` (
  `id` int UNSIGNED NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sources`
--

CREATE TABLE `inventory_sources` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `inventory_sources`
--

INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `giftcard_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giftcard_amount` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', 'locales/oaKFH0wUGjlm4MRPSHhBm9vHnXxgVKmnUN7j32CG.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `marketing_template_id` int UNSIGNED DEFAULT NULL,
  `marketing_event_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `marketing_events`
--

INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_templates`
--

CREATE TABLE `marketing_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_30_153530_create_cms_pages_table', 1),
(65, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(66, '2019_08_02_105320_create_product_grouped_products_table', 1),
(67, '2019_08_20_170510_create_product_bundle_options_table', 1),
(68, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(69, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(70, '2019_09_11_184511_create_refunds_table', 1),
(71, '2019_09_11_184519_create_refund_items_table', 1),
(72, '2019_12_03_184613_create_catalog_rules_table', 1),
(73, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(74, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(75, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(76, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(77, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(78, '2020_01_14_191854_create_cms_page_translations_table', 1),
(79, '2020_01_15_130209_create_cms_page_channels_table', 1),
(80, '2020_04_16_185147_add_table_addresses', 1),
(81, '2020_05_06_171638_create_order_comments_table', 1),
(82, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(83, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(84, '2020_11_19_112228_create_product_videos_table', 1),
(85, '2020_11_26_141455_create_marketing_templates_table', 1),
(86, '2020_11_26_150534_create_marketing_events_table', 1),
(87, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(88, '2020_12_21_000200_create_channel_translations_table', 1),
(89, '2020_12_27_121950_create_jobs_table', 1),
(90, '2021_03_11_212124_create_order_transactions_table', 1),
(91, '2021_04_07_132010_create_product_review_images_table', 1),
(92, '2021_12_15_104544_notifications', 1),
(93, '2022_03_15_160510_create_failed_jobs_table', 1),
(94, '2022_04_01_094622_create_sitemaps_table', 1),
(95, '2022_10_03_144232_create_product_price_indices_table', 1),
(96, '2022_10_04_144444_create_job_batches_table', 1),
(97, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(98, '2023_05_26_213105_create_wishlist_items_table', 1),
(99, '2023_05_26_213120_create_compare_items_table', 1),
(100, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(101, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(102, '2023_07_10_184256_create_theme_customizations_table', 1),
(103, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(104, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(105, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(106, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(107, '2023_07_25_171058_create_customer_notes_table', 1),
(108, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(109, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(110, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(111, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(112, '2023_09_26_155709_add_columns_to_currencies', 1),
(113, '2023_10_05_163612_create_visits_table', 1),
(114, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
(115, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
(116, '2023_11_08_140116_create_search_terms_table', 1),
(117, '2023_11_09_162805_create_url_rewrites_table', 1),
(118, '2023_11_17_150401_create_search_synonyms_table', 1),
(119, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
(120, '2024_01_11_154640_create_imports_table', 1),
(121, '2024_01_11_154741_create_import_batches_table', 1),
(122, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
(123, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
(124, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
(125, '2024_02_26_153000_add_columns_to_addresses_table', 1),
(126, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
(127, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
(128, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
(129, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
(130, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
(131, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
(132, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
(133, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
(134, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
(135, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
(136, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
(137, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
(138, '2024_05_10_152848_create_saved_filters_table', 1),
(139, '2024_06_03_174128_create_product_channels_table', 1),
(140, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
(141, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1),
(142, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1),
(143, '2024_05_16_171007_create_gift_cards_table', 2),
(144, '2024_05_16_171240_create_gift_card_balances_table', 2),
(145, '2024_05_16_171417_create_gift_card_payments_table', 2),
(146, '2024_05_27_102417_add_giftcard_fields_to_cart_table', 2),
(147, '2024_05_28_162854_add_giftcard_fields_to_orders_table', 2),
(148, '2024_05_28_163618_add_giftcard_info_to_invoices_table', 2),
(149, '2025_04_11_114352_create_posts_table', 3),
(150, '2025_04_12_111942_create_contacts_table', 4),
(151, '2025_04_25_132649_createblogs_table', 5),
(152, '2025_04_25_133336_create_blog_categories_table', 5),
(153, '2025_04_25_133532_create_blog_tags_table', 5),
(154, '2025_04_25_133654_create_blog_comments_table', 5),
(155, '2025_04_28_123806_customer_otps_table', 6),
(156, '2020_08_10_105725_add_total_reward_points_to_customers_table', 7),
(157, '2020_08_13_130029_create_attribute_rewards_table', 7),
(158, '2020_08_13_130055_create_cart_rewards_table', 7),
(159, '2020_08_13_130115_create_category_rewards_table', 7),
(160, '2020_08_13_130148_create_category_specific_time_rewards_table', 7),
(161, '2020_08_13_130222_create_product_specific_time_rewards_table', 7),
(162, '2020_08_13_130242_create_product_rewards_table', 7),
(163, '2020_08_13_130302_create_reward_configs_table', 7),
(164, '2020_08_13_130319_create_reward_points_table', 7),
(165, '2020_09_23_064935_create_redemption_settings_table', 7),
(166, '2020_09_24_043517_add_points_to_carts_table', 7),
(167, '2020_09_24_043518_add_points_amount_to_carts_table', 7),
(168, '2025_05_13_120657_create_ens_sms_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giftcard_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giftcard_amount` decimal(12,4) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `points` int DEFAULT NULL,
  `points_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `tax_category_id` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `points` int DEFAULT NULL,
  `points_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 0, 1, '2025-04-25 09:51:22', '2025-04-25 09:51:22'),
(2, NULL, NULL, 0, 1, '2025-04-25 09:52:11', '2025-04-25 09:52:11'),
(3, NULL, NULL, 0, 1, '2025-04-25 09:52:51', '2025-04-25 09:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `attribute_family_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, '001', 'simple', NULL, 1, NULL, '2025-03-26 10:30:03', '2025-03-26 10:30:03'),
(2, '002', 'simple', NULL, 1, NULL, '2025-03-26 10:34:51', '2025-03-26 10:36:44'),
(3, '003', 'simple', NULL, 1, NULL, '2025-03-26 10:37:49', '2025-03-26 10:39:17'),
(4, '004', 'simple', NULL, 1, NULL, '2025-03-26 10:39:59', '2025-03-26 10:40:46'),
(5, '005', 'simple', NULL, 1, NULL, '2025-03-26 10:42:37', '2025-03-26 10:44:49'),
(6, '006', 'simple', NULL, 1, NULL, '2025-03-26 10:46:04', '2025-03-26 10:47:20'),
(7, 'sku', 'simple', NULL, 1, NULL, '2025-04-09 07:47:20', '2025-04-09 07:47:20'),
(9, 'skuss', 'configurable', NULL, 1, NULL, '2025-04-10 04:19:50', '2025-04-10 04:19:50'),
(10, 'skuss-variant-10', 'simple', 9, 1, NULL, '2025-04-10 04:19:50', '2025-04-10 04:19:50'),
(11, 'skuss-variant-11', 'simple', 9, 1, NULL, '2025-04-10 04:19:50', '2025-04-10 04:19:50'),
(12, 'skuss-variant-12', 'simple', 9, 1, NULL, '2025-04-10 04:19:50', '2025-04-10 04:19:50'),
(13, 'skuwe21', 'configurable', NULL, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(14, 'skuwe21-variant-13-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(15, 'skuwe21-variant-14-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(16, 'skuwe21-variant-15-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(17, 'skuwe21-variant-16-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(18, 'skuwe21-variant-17-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(19, 'skuwe21-variant-18-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(20, 'skuwe21-variant-19-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(21, 'skuwe21-variant-20-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(22, 'skuwe21-variant-21-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(23, 'skuwe21-variant-22-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(24, 'skuwe21-variant-23-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(25, 'skuwe21-variant-24-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(26, 'skuwe21-variant-25-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(27, 'skuwe21-variant-26-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(28, 'skuwe21-variant-27-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(29, 'skuwe21-variant-28-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(30, 'skuwe21-variant-29-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(31, 'skuwe21-variant-30-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(32, 'skuwe21-variant-31-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(33, 'skuwe21-variant-32-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(34, 'skuwe21-variant-33-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(35, 'skuwe21-variant-34-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(36, 'skuwe21-variant-35-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(37, 'skuwe21-variant-36-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(38, 'skuwe21-variant-37-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(39, 'skuwe21-variant-38-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(40, 'skuwe21-variant-39-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(41, 'skuwe21-variant-40-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(42, 'skuwe21-variant-41-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(43, 'skuwe21-variant-42-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(44, 'skuwe21-variant-43-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(45, 'skuwe21-variant-44-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(46, 'skuwe21-variant-45-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(47, 'skuwe21-variant-46-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(48, 'skuwe21-variant-47-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(49, 'skuwe21-variant-48-49', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(50, 'skuwe21-variant-13-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(51, 'skuwe21-variant-14-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(52, 'skuwe21-variant-15-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(53, 'skuwe21-variant-16-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(54, 'skuwe21-variant-17-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(55, 'skuwe21-variant-18-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(56, 'skuwe21-variant-19-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(57, 'skuwe21-variant-20-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(58, 'skuwe21-variant-21-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(59, 'skuwe21-variant-22-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(60, 'skuwe21-variant-23-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(61, 'skuwe21-variant-24-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(62, 'skuwe21-variant-25-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(63, 'skuwe21-variant-26-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(64, 'skuwe21-variant-27-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(65, 'skuwe21-variant-28-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(66, 'skuwe21-variant-29-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(67, 'skuwe21-variant-30-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(68, 'skuwe21-variant-31-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(69, 'skuwe21-variant-32-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(70, 'skuwe21-variant-33-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(71, 'skuwe21-variant-34-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(72, 'skuwe21-variant-35-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(73, 'skuwe21-variant-36-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:41', '2025-04-10 10:05:41'),
(74, 'skuwe21-variant-37-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(75, 'skuwe21-variant-38-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(76, 'skuwe21-variant-39-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(77, 'skuwe21-variant-40-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(78, 'skuwe21-variant-41-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(79, 'skuwe21-variant-42-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(80, 'skuwe21-variant-43-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(81, 'skuwe21-variant-44-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(82, 'skuwe21-variant-45-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(83, 'skuwe21-variant-46-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(84, 'skuwe21-variant-47-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(85, 'skuwe21-variant-48-50', 'simple', 13, 1, NULL, '2025-04-10 10:05:42', '2025-04-10 10:05:42'),
(86, '098', 'simple', NULL, 1, NULL, '2025-04-24 12:21:08', '2025-04-24 12:21:08'),
(87, '00611', 'simple', NULL, 1, NULL, '2025-05-14 06:23:56', '2025-05-14 06:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
(1, 'en', NULL, '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, 'en|1|9'),
(2, 'en', NULL, '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 'en|1|10'),
(3, NULL, NULL, '001', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '1|1'),
(4, 'en', NULL, 'Animal Party Cake', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'en|1|2'),
(5, 'en', NULL, 'animal-party-cake', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'en|1|3'),
(6, NULL, NULL, '0001', NULL, NULL, NULL, NULL, NULL, NULL, 1, 27, '1|27'),
(7, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 28, 'default|1|28'),
(8, 'en', NULL, 'Animal Party Cake', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, 'en|1|16'),
(9, 'en', NULL, 'Animal Party Cake', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 'en|1|17'),
(10, 'en', NULL, 'Animal Party Cake', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 'en|1|18'),
(11, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 1, 11, '1|11'),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, '1|12'),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 13, '1|13'),
(14, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 'default|1|14'),
(15, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 'default|1|15'),
(16, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 5, '1|5'),
(17, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 6, '1|6'),
(18, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 7, '1|7'),
(19, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 8, 'default|1|8'),
(20, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 26, '1|26'),
(21, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 19, '1|19'),
(22, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 20, '1|20'),
(23, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 21, '1|21'),
(24, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, '1|22'),
(25, 'en', NULL, '<p>This pink jungle theme cake is the key to your kid\'s happiness. It comes with handcrafted fondant animals and beautiful pink leaves. This decadent and adorable cake will make your little one\'s party a hit.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, 'en|2|9'),
(26, 'en', NULL, '<p>This pink jungle theme cake is the key to your kid\'s happiness. It comes with handcrafted fondant animals and beautiful pink leaves. This decadent and adorable cake will make your little one\'s party a hit.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 'en|2|10'),
(27, NULL, NULL, '002', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2|1'),
(28, 'en', NULL, 'Jungle theme pink Cake', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'en|2|2'),
(29, 'en', NULL, 'jungle-theme-pink-cake', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 'en|2|3'),
(30, NULL, NULL, '0002', NULL, NULL, NULL, NULL, NULL, NULL, 2, 27, '2|27'),
(31, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 28, 'default|2|28'),
(32, 'en', NULL, 'Jungle theme pink Cake', NULL, NULL, NULL, NULL, NULL, NULL, 2, 16, 'en|2|16'),
(33, 'en', NULL, 'Jungle theme pink Cake', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17, 'en|2|17'),
(34, 'en', NULL, 'Jungle theme pink Cake', NULL, NULL, NULL, NULL, NULL, NULL, 2, 18, 'en|2|18'),
(35, NULL, NULL, NULL, NULL, NULL, 99.0000, NULL, NULL, NULL, 2, 11, '2|11'),
(36, NULL, NULL, NULL, NULL, NULL, 89.0000, NULL, NULL, NULL, 2, 12, '2|12'),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 13, '2|13'),
(38, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 14, 'default|2|14'),
(39, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 15, 'default|2|15'),
(40, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 5, '2|5'),
(41, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 6, '2|6'),
(42, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 7, '2|7'),
(43, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8, 'default|2|8'),
(44, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 26, '2|26'),
(45, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 19, '2|19'),
(46, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 20, '2|20'),
(47, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 21, '2|21'),
(48, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22, '2|22'),
(49, 'en', NULL, '<p>Animals are kids first best friends and the kind of joy they bring in their life is so lovable to see. This cake is best for your kids initial birthdays where they can feel them coming to life in the form of a cake</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'en|3|9'),
(50, 'en', NULL, '<p>Animals are kids first best friends and the kind of joy they bring in their life is so lovable to see. This cake is best for your kids initial birthdays where they can feel them coming to life in the form of a cake</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'en|3|10'),
(51, NULL, NULL, '003', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '3|1'),
(52, 'en', NULL, 'Minimal Forest Cake', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'en|3|2'),
(53, 'en', NULL, 'minimal-forest-cake', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'en|3|3'),
(54, NULL, NULL, '0003', NULL, NULL, NULL, NULL, NULL, NULL, 3, 27, '3|27'),
(55, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 28, 'default|3|28'),
(56, 'en', NULL, 'Minimal Forest Cake', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16, 'en|3|16'),
(57, 'en', NULL, 'Minimal Forest Cake', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, 'en|3|17'),
(58, 'en', NULL, 'Minimal Forest Cake', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18, 'en|3|18'),
(59, NULL, NULL, NULL, NULL, NULL, 150.0000, NULL, NULL, NULL, 3, 11, '3|11'),
(60, NULL, NULL, NULL, NULL, NULL, 80.0000, NULL, NULL, NULL, 3, 12, '3|12'),
(61, NULL, NULL, NULL, NULL, NULL, 130.0000, NULL, NULL, NULL, 3, 13, '3|13'),
(62, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-04-06', NULL, 3, 14, 'default|3|14'),
(63, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-04-11', NULL, 3, 15, 'default|3|15'),
(64, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 5, '3|5'),
(65, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 6, '3|6'),
(66, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7, '3|7'),
(67, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 8, 'default|3|8'),
(68, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 26, '3|26'),
(69, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 19, '3|19'),
(70, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 20, '3|20'),
(71, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 21, '3|21'),
(72, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22, '3|22'),
(73, 'en', NULL, '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 'en|4|9'),
(74, 'en', NULL, '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 'en|4|10'),
(75, NULL, NULL, '004', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, '4|1'),
(76, 'en', NULL, 'Pastry Pack of 4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 'en|4|2'),
(77, 'en', NULL, 'pastry-pack-of-4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, 'en|4|3'),
(78, NULL, NULL, '0004', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27, '4|27'),
(79, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 28, 'default|4|28'),
(80, 'en', NULL, 'Pastry Pack of 4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 'en|4|16'),
(81, 'en', NULL, 'Pastry Pack of 4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17, 'en|4|17'),
(82, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18, 'en|4|18'),
(83, NULL, NULL, NULL, NULL, NULL, 65.0000, NULL, NULL, NULL, 4, 11, '4|11'),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 12, '4|12'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 13, '4|13'),
(86, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 14, 'default|4|14'),
(87, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 15, 'default|4|15'),
(88, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5, '4|5'),
(89, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 6, '4|6'),
(90, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7, '4|7'),
(91, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8, 'default|4|8'),
(92, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 26, '4|26'),
(93, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 19, '4|19'),
(94, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 20, '4|20'),
(95, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 21, '4|21'),
(96, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22, '4|22'),
(97, 'en', NULL, '<p>A typical Hawaiian cake made with chopped pineapple inside. The pulp of real pineapple leaves a freshness of taste which makes the occasion all the more wonderful. A pineapple is the result of many flowers whose fruitlets have joined around the core</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'en|5|9'),
(98, 'en', NULL, '<p>A typical Hawaiian cake made with chopped pineapple inside. The pulp of real pineapple leaves a freshness of taste which makes the occasion all the more wonderful. A pineapple is the result of many flowers whose fruitlets have joined around the core</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'en|5|10'),
(99, NULL, NULL, '005', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, '5|1'),
(100, 'en', NULL, 'Pineapple Pastry [Pack of 2]', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'en|5|2'),
(101, 'en', NULL, 'pineapple-pastry-pack-of-2', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'en|5|3'),
(102, NULL, NULL, '0005', NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, '5|27'),
(103, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 28, 'default|5|28'),
(104, 'en', NULL, 'Pineapple Pastry [Pack of 2]', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16, 'en|5|16'),
(105, 'en', NULL, 'Pineapple Pastry [Pack of 2]', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17, 'en|5|17'),
(106, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18, 'en|5|18'),
(107, NULL, NULL, NULL, NULL, NULL, 79.0000, NULL, NULL, NULL, 5, 11, '5|11'),
(108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 12, '5|12'),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 13, '5|13'),
(110, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 14, 'default|5|14'),
(111, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 15, 'default|5|15'),
(112, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 5, '5|5'),
(113, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 6, '5|6'),
(114, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7, '5|7'),
(115, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8, 'default|5|8'),
(116, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 26, '5|26'),
(117, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 19, '5|19'),
(118, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, '5|20'),
(119, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 21, '5|21'),
(120, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22, '5|22'),
(121, 'en', NULL, '<div class=\"product__description rte quick-add-hidden\">\r\n<div id=\"descriptionContainer\">\r\n<div id=\"descriptionText\" class=\"collapsed\">\r\n<p>A Custom photo cake with a pretty background. You can share your image which will be used to put in the placeholder image</p>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'en|6|9'),
(122, 'en', NULL, '<div class=\"product__description rte quick-add-hidden\">\r\n<div id=\"descriptionContainer\">\r\n<div id=\"descriptionText\" class=\"collapsed\">\r\n<p>A Custom photo cake with a pretty background. You can share your image which will be used to put in the placeholder image</p>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'en|6|10'),
(123, NULL, NULL, '006', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, '6|1'),
(124, 'en', NULL, 'Heart Shape Photo Cake', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'en|6|2'),
(125, 'en', NULL, 'heart-shape-photo-cake', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'en|6|3'),
(126, NULL, NULL, '0006', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27, '6|27'),
(127, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 28, 'default|6|28'),
(128, 'en', NULL, 'Heart Shape Anniversary Photo Cake', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 'en|6|16'),
(129, 'en', NULL, 'Heart Shape Anniversary Photo Cake', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17, 'en|6|17'),
(130, 'en', NULL, 'Heart Shape Anniversary Photo Cake', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18, 'en|6|18'),
(131, NULL, NULL, NULL, NULL, NULL, 200.0000, NULL, NULL, NULL, 6, 11, '6|11'),
(132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 12, '6|12'),
(133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13, '6|13'),
(134, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'default|6|14'),
(135, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15, 'default|6|15'),
(136, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5, '6|5'),
(137, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 6, '6|6'),
(138, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7, '6|7'),
(139, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8, 'default|6|8'),
(140, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26, '6|26'),
(141, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 19, '6|19'),
(142, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 20, '6|20'),
(143, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 21, '6|21'),
(144, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22, '6|22'),
(145, 'en', NULL, '<p>Test desc</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'en|7|9'),
(146, 'en', NULL, '<p>Test mIN DESC</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10, 'en|7|10'),
(147, NULL, NULL, 'sku', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, '7|1'),
(148, 'en', NULL, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2, 'en|7|2'),
(149, 'en', NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'en|7|3'),
(152, NULL, NULL, '001', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27, '7|27'),
(153, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 28, 'default|7|28'),
(154, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16, 'en|7|16'),
(155, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17, 'en|7|17'),
(156, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18, 'en|7|18'),
(157, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 7, 11, '7|11'),
(158, NULL, NULL, NULL, NULL, NULL, 89.0000, NULL, NULL, NULL, 7, 12, '7|12'),
(159, NULL, NULL, NULL, NULL, NULL, 90.0000, NULL, NULL, NULL, 7, 13, '7|13'),
(160, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 14, 'default|7|14'),
(161, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 15, 'default|7|15'),
(162, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 5, '7|5'),
(163, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 6, '7|6'),
(164, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7, '7|7'),
(165, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8, 'default|7|8'),
(166, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 26, '7|26'),
(167, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 19, '7|19'),
(168, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 20, '7|20'),
(169, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 21, '7|21'),
(170, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22, '7|22'),
(171, NULL, NULL, 'skuss-variant-10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, '10|1'),
(172, 'en', NULL, 'Variant 10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 'en|10|2'),
(173, 'en', NULL, 'skuss-variant-10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3, 'en|10|3'),
(174, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 10, 4, 'default|10|4'),
(175, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8, 'default|10|8'),
(176, 'en', NULL, 'skuss-variant-10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9, 'en|10|9'),
(177, 'en', NULL, 'skuss-variant-10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 'en|10|10'),
(178, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 10, 11, '10|11'),
(179, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 10, 22, '10|22'),
(180, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 10, 29, '10|29'),
(181, NULL, NULL, 'skuss-variant-11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, '11|1'),
(182, 'en', NULL, 'Variant 11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 'en|11|2'),
(183, 'en', NULL, 'skuss-variant-11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3, 'en|11|3'),
(184, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 11, 4, 'default|11|4'),
(185, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8, 'default|11|8'),
(186, 'en', NULL, 'skuss-variant-11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9, 'en|11|9'),
(187, 'en', NULL, 'skuss-variant-11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 'en|11|10'),
(188, NULL, NULL, NULL, NULL, NULL, 120.0000, NULL, NULL, NULL, 11, 11, '11|11'),
(189, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22, '11|22'),
(190, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 11, 29, '11|29'),
(191, NULL, NULL, 'skuss-variant-12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, '12|1'),
(192, 'en', NULL, 'Variant 12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 2, 'en|12|2'),
(193, 'en', NULL, 'skuss-variant-12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 3, 'en|12|3'),
(194, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 12, 4, 'default|12|4'),
(195, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 8, 'default|12|8'),
(196, 'en', NULL, 'skuss-variant-12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 9, 'en|12|9'),
(197, 'en', NULL, 'skuss-variant-12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10, 'en|12|10'),
(198, NULL, NULL, NULL, NULL, NULL, 99.0000, NULL, NULL, NULL, 12, 11, '12|11'),
(199, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 12, 22, '12|22'),
(200, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 12, 29, '12|29'),
(201, 'en', NULL, '<p>ss</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, 'en|9|9'),
(202, 'en', NULL, '<p>s</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10, 'en|9|10'),
(203, NULL, NULL, 'skuss', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, '9|1'),
(204, 'en', NULL, 'Jungle theme pink Cakes', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2, 'en|9|2'),
(205, 'en', NULL, 'jungle-theme-pink-cakes', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3, 'en|9|3'),
(206, NULL, NULL, '0002s', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27, '9|27'),
(207, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 28, 'default|9|28'),
(208, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16, 'en|9|16'),
(209, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17, 'en|9|17'),
(210, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18, 'en|9|18'),
(211, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5, '9|5'),
(212, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6, '9|6'),
(213, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7, '9|7'),
(214, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8, 'default|9|8'),
(215, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26, '9|26'),
(216, NULL, NULL, 'skuwe21-variant-13-49', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1, '14|1'),
(217, 'en', NULL, 'Variant 13 49', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2, 'en|14|2'),
(218, 'en', NULL, 'skuwe21-variant-13-49', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3, 'en|14|3'),
(219, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 14, 4, 'default|14|4'),
(220, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8, 'default|14|8'),
(221, 'en', NULL, 'skuwe21-variant-13-49', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9, 'en|14|9'),
(222, 'en', NULL, 'skuwe21-variant-13-49', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10, 'en|14|10'),
(223, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 14, 11, '14|11'),
(224, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 14, 22, '14|22'),
(225, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 14, 30, '14|30'),
(226, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 14, 31, '14|31'),
(227, NULL, NULL, 'skuwe21-variant-14-49', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1, '15|1'),
(228, 'en', NULL, 'Variant 14 49', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 'en|15|2'),
(229, 'en', NULL, 'skuwe21-variant-14-49', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3, 'en|15|3'),
(230, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 15, 4, 'default|15|4'),
(231, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8, 'default|15|8'),
(232, 'en', NULL, 'skuwe21-variant-14-49', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9, 'en|15|9'),
(233, 'en', NULL, 'skuwe21-variant-14-49', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10, 'en|15|10'),
(234, NULL, NULL, NULL, NULL, NULL, 90.0000, NULL, NULL, NULL, 15, 11, '15|11'),
(235, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, '15|22'),
(236, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, 15, 30, '15|30'),
(237, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 15, 31, '15|31'),
(238, NULL, NULL, 'skuwe21-variant-15-49', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, '16|1'),
(239, 'en', NULL, 'Variant 15 49', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 'en|16|2'),
(240, 'en', NULL, 'skuwe21-variant-15-49', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3, 'en|16|3'),
(241, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 16, 4, 'default|16|4'),
(242, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8, 'default|16|8'),
(243, 'en', NULL, 'skuwe21-variant-15-49', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9, 'en|16|9'),
(244, 'en', NULL, 'skuwe21-variant-15-49', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10, 'en|16|10'),
(245, NULL, NULL, NULL, NULL, NULL, 80.0000, NULL, NULL, NULL, 16, 11, '16|11'),
(246, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 16, 22, '16|22'),
(247, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, 16, 30, '16|30'),
(248, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 16, 31, '16|31'),
(249, NULL, NULL, 'skuwe21-variant-16-49', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1, '17|1'),
(250, 'en', NULL, 'Variant 16 49', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 'en|17|2'),
(251, 'en', NULL, 'skuwe21-variant-16-49', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3, 'en|17|3'),
(252, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 17, 4, 'default|17|4'),
(253, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8, 'default|17|8'),
(254, 'en', NULL, 'skuwe21-variant-16-49', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9, 'en|17|9'),
(255, 'en', NULL, 'skuwe21-variant-16-49', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10, 'en|17|10'),
(256, NULL, NULL, NULL, NULL, NULL, 34.0000, NULL, NULL, NULL, 17, 11, '17|11'),
(257, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 17, 22, '17|22'),
(258, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, 17, 30, '17|30'),
(259, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 17, 31, '17|31'),
(260, NULL, NULL, 'skuwe21-variant-17-49', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1, '18|1'),
(261, 'en', NULL, 'Variant 17 49', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 'en|18|2'),
(262, 'en', NULL, 'skuwe21-variant-17-49', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3, 'en|18|3'),
(263, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 18, 4, 'default|18|4'),
(264, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8, 'default|18|8'),
(265, 'en', NULL, 'skuwe21-variant-17-49', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9, 'en|18|9'),
(266, 'en', NULL, 'skuwe21-variant-17-49', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10, 'en|18|10'),
(267, NULL, NULL, NULL, NULL, NULL, 57.0000, NULL, NULL, NULL, 18, 11, '18|11'),
(268, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 18, 22, '18|22'),
(269, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, 18, 30, '18|30'),
(270, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 18, 31, '18|31'),
(271, NULL, NULL, 'skuwe21-variant-18-49', NULL, NULL, NULL, NULL, NULL, NULL, 19, 1, '19|1'),
(272, 'en', NULL, 'Variant 18 49', NULL, NULL, NULL, NULL, NULL, NULL, 19, 2, 'en|19|2'),
(273, 'en', NULL, 'skuwe21-variant-18-49', NULL, NULL, NULL, NULL, NULL, NULL, 19, 3, 'en|19|3'),
(274, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 19, 4, 'default|19|4'),
(275, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 8, 'default|19|8'),
(276, 'en', NULL, 'skuwe21-variant-18-49', NULL, NULL, NULL, NULL, NULL, NULL, 19, 9, 'en|19|9'),
(277, 'en', NULL, 'skuwe21-variant-18-49', NULL, NULL, NULL, NULL, NULL, NULL, 19, 10, 'en|19|10'),
(278, NULL, NULL, NULL, NULL, NULL, 78.0000, NULL, NULL, NULL, 19, 11, '19|11'),
(279, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 19, 22, '19|22'),
(280, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, 19, 30, '19|30'),
(281, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 19, 31, '19|31'),
(282, NULL, NULL, 'skuwe21-variant-19-49', NULL, NULL, NULL, NULL, NULL, NULL, 20, 1, '20|1'),
(283, 'en', NULL, 'Variant 19 49', NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 'en|20|2'),
(284, 'en', NULL, 'skuwe21-variant-19-49', NULL, NULL, NULL, NULL, NULL, NULL, 20, 3, 'en|20|3'),
(285, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 20, 4, 'default|20|4'),
(286, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 8, 'default|20|8'),
(287, 'en', NULL, 'skuwe21-variant-19-49', NULL, NULL, NULL, NULL, NULL, NULL, 20, 9, 'en|20|9'),
(288, 'en', NULL, 'skuwe21-variant-19-49', NULL, NULL, NULL, NULL, NULL, NULL, 20, 10, 'en|20|10'),
(289, NULL, NULL, NULL, NULL, NULL, 98.0000, NULL, NULL, NULL, 20, 11, '20|11'),
(290, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 20, 22, '20|22'),
(291, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, 20, 30, '20|30'),
(292, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 20, 31, '20|31'),
(293, NULL, NULL, 'skuwe21-variant-20-49', NULL, NULL, NULL, NULL, NULL, NULL, 21, 1, '21|1'),
(294, 'en', NULL, 'Variant 20 49', NULL, NULL, NULL, NULL, NULL, NULL, 21, 2, 'en|21|2'),
(295, 'en', NULL, 'skuwe21-variant-20-49', NULL, NULL, NULL, NULL, NULL, NULL, 21, 3, 'en|21|3'),
(296, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 21, 4, 'default|21|4'),
(297, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 8, 'default|21|8'),
(298, 'en', NULL, 'skuwe21-variant-20-49', NULL, NULL, NULL, NULL, NULL, NULL, 21, 9, 'en|21|9'),
(299, 'en', NULL, 'skuwe21-variant-20-49', NULL, NULL, NULL, NULL, NULL, NULL, 21, 10, 'en|21|10'),
(300, NULL, NULL, NULL, NULL, NULL, 97.0000, NULL, NULL, NULL, 21, 11, '21|11'),
(301, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 21, 22, '21|22'),
(302, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, 21, 30, '21|30'),
(303, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 21, 31, '21|31'),
(304, NULL, NULL, 'skuwe21-variant-21-49', NULL, NULL, NULL, NULL, NULL, NULL, 22, 1, '22|1'),
(305, 'en', NULL, 'Variant 21 49', NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 'en|22|2'),
(306, 'en', NULL, 'skuwe21-variant-21-49', NULL, NULL, NULL, NULL, NULL, NULL, 22, 3, 'en|22|3'),
(307, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 22, 4, 'default|22|4'),
(308, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 8, 'default|22|8'),
(309, 'en', NULL, 'skuwe21-variant-21-49', NULL, NULL, NULL, NULL, NULL, NULL, 22, 9, 'en|22|9'),
(310, 'en', NULL, 'skuwe21-variant-21-49', NULL, NULL, NULL, NULL, NULL, NULL, 22, 10, 'en|22|10'),
(311, NULL, NULL, NULL, NULL, NULL, 95.0000, NULL, NULL, NULL, 22, 11, '22|11'),
(312, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 22, 22, '22|22'),
(313, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, 22, 30, '22|30'),
(314, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 22, 31, '22|31'),
(315, NULL, NULL, 'skuwe21-variant-22-49', NULL, NULL, NULL, NULL, NULL, NULL, 23, 1, '23|1'),
(316, 'en', NULL, 'Variant 22 49', NULL, NULL, NULL, NULL, NULL, NULL, 23, 2, 'en|23|2'),
(317, 'en', NULL, 'skuwe21-variant-22-49', NULL, NULL, NULL, NULL, NULL, NULL, 23, 3, 'en|23|3'),
(318, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 23, 4, 'default|23|4'),
(319, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 8, 'default|23|8'),
(320, 'en', NULL, 'skuwe21-variant-22-49', NULL, NULL, NULL, NULL, NULL, NULL, 23, 9, 'en|23|9'),
(321, 'en', NULL, 'skuwe21-variant-22-49', NULL, NULL, NULL, NULL, NULL, NULL, 23, 10, 'en|23|10'),
(322, NULL, NULL, NULL, NULL, NULL, 93.0000, NULL, NULL, NULL, 23, 11, '23|11'),
(323, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 23, 22, '23|22'),
(324, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, 23, 30, '23|30'),
(325, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 23, 31, '23|31'),
(326, NULL, NULL, 'skuwe21-variant-23-49', NULL, NULL, NULL, NULL, NULL, NULL, 24, 1, '24|1'),
(327, 'en', NULL, 'Variant 23 49', NULL, NULL, NULL, NULL, NULL, NULL, 24, 2, 'en|24|2'),
(328, 'en', NULL, 'skuwe21-variant-23-49', NULL, NULL, NULL, NULL, NULL, NULL, 24, 3, 'en|24|3'),
(329, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 24, 4, 'default|24|4'),
(330, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 8, 'default|24|8'),
(331, 'en', NULL, 'skuwe21-variant-23-49', NULL, NULL, NULL, NULL, NULL, NULL, 24, 9, 'en|24|9'),
(332, 'en', NULL, 'skuwe21-variant-23-49', NULL, NULL, NULL, NULL, NULL, NULL, 24, 10, 'en|24|10'),
(333, NULL, NULL, NULL, NULL, NULL, 78.0000, NULL, NULL, NULL, 24, 11, '24|11'),
(334, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 24, 22, '24|22'),
(335, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, 24, 30, '24|30'),
(336, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 24, 31, '24|31'),
(337, NULL, NULL, 'skuwe21-variant-24-49', NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, '25|1'),
(338, 'en', NULL, 'Variant 24 49', NULL, NULL, NULL, NULL, NULL, NULL, 25, 2, 'en|25|2'),
(339, 'en', NULL, 'skuwe21-variant-24-49', NULL, NULL, NULL, NULL, NULL, NULL, 25, 3, 'en|25|3'),
(340, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 25, 4, 'default|25|4'),
(341, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 8, 'default|25|8'),
(342, 'en', NULL, 'skuwe21-variant-24-49', NULL, NULL, NULL, NULL, NULL, NULL, 25, 9, 'en|25|9'),
(343, 'en', NULL, 'skuwe21-variant-24-49', NULL, NULL, NULL, NULL, NULL, NULL, 25, 10, 'en|25|10'),
(344, NULL, NULL, NULL, NULL, NULL, 65.0000, NULL, NULL, NULL, 25, 11, '25|11'),
(345, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 25, 22, '25|22'),
(346, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, 25, 30, '25|30'),
(347, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 25, 31, '25|31'),
(348, NULL, NULL, 'skuwe21-variant-25-49', NULL, NULL, NULL, NULL, NULL, NULL, 26, 1, '26|1'),
(349, 'en', NULL, 'Variant 25 49', NULL, NULL, NULL, NULL, NULL, NULL, 26, 2, 'en|26|2'),
(350, 'en', NULL, 'skuwe21-variant-25-49', NULL, NULL, NULL, NULL, NULL, NULL, 26, 3, 'en|26|3'),
(351, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 26, 4, 'default|26|4'),
(352, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 8, 'default|26|8'),
(353, 'en', NULL, 'skuwe21-variant-25-49', NULL, NULL, NULL, NULL, NULL, NULL, 26, 9, 'en|26|9'),
(354, 'en', NULL, 'skuwe21-variant-25-49', NULL, NULL, NULL, NULL, NULL, NULL, 26, 10, 'en|26|10'),
(355, NULL, NULL, NULL, NULL, NULL, 87.0000, NULL, NULL, NULL, 26, 11, '26|11'),
(356, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 26, 22, '26|22'),
(357, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 26, 30, '26|30'),
(358, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 26, 31, '26|31'),
(359, NULL, NULL, 'skuwe21-variant-26-49', NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, '27|1'),
(360, 'en', NULL, 'Variant 26 49', NULL, NULL, NULL, NULL, NULL, NULL, 27, 2, 'en|27|2'),
(361, 'en', NULL, 'skuwe21-variant-26-49', NULL, NULL, NULL, NULL, NULL, NULL, 27, 3, 'en|27|3'),
(362, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 27, 4, 'default|27|4'),
(363, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 8, 'default|27|8'),
(364, 'en', NULL, 'skuwe21-variant-26-49', NULL, NULL, NULL, NULL, NULL, NULL, 27, 9, 'en|27|9'),
(365, 'en', NULL, 'skuwe21-variant-26-49', NULL, NULL, NULL, NULL, NULL, NULL, 27, 10, 'en|27|10'),
(366, NULL, NULL, NULL, NULL, NULL, 48.0000, NULL, NULL, NULL, 27, 11, '27|11'),
(367, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 27, 22, '27|22'),
(368, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, 27, 30, '27|30'),
(369, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 27, 31, '27|31'),
(370, NULL, NULL, 'skuwe21-variant-27-49', NULL, NULL, NULL, NULL, NULL, NULL, 28, 1, '28|1'),
(371, 'en', NULL, 'Variant 27 49', NULL, NULL, NULL, NULL, NULL, NULL, 28, 2, 'en|28|2'),
(372, 'en', NULL, 'skuwe21-variant-27-49', NULL, NULL, NULL, NULL, NULL, NULL, 28, 3, 'en|28|3'),
(373, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 28, 4, 'default|28|4'),
(374, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 8, 'default|28|8'),
(375, 'en', NULL, 'skuwe21-variant-27-49', NULL, NULL, NULL, NULL, NULL, NULL, 28, 9, 'en|28|9'),
(376, 'en', NULL, 'skuwe21-variant-27-49', NULL, NULL, NULL, NULL, NULL, NULL, 28, 10, 'en|28|10'),
(377, NULL, NULL, NULL, NULL, NULL, 56.0000, NULL, NULL, NULL, 28, 11, '28|11'),
(378, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 28, 22, '28|22'),
(379, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, 28, 30, '28|30'),
(380, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 28, 31, '28|31'),
(381, NULL, NULL, 'skuwe21-variant-28-49', NULL, NULL, NULL, NULL, NULL, NULL, 29, 1, '29|1'),
(382, 'en', NULL, 'Variant 28 49', NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 'en|29|2'),
(383, 'en', NULL, 'skuwe21-variant-28-49', NULL, NULL, NULL, NULL, NULL, NULL, 29, 3, 'en|29|3'),
(384, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 29, 4, 'default|29|4'),
(385, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 8, 'default|29|8'),
(386, 'en', NULL, 'skuwe21-variant-28-49', NULL, NULL, NULL, NULL, NULL, NULL, 29, 9, 'en|29|9'),
(387, 'en', NULL, 'skuwe21-variant-28-49', NULL, NULL, NULL, NULL, NULL, NULL, 29, 10, 'en|29|10'),
(388, NULL, NULL, NULL, NULL, NULL, 82.0000, NULL, NULL, NULL, 29, 11, '29|11'),
(389, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 29, 22, '29|22'),
(390, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, 29, 30, '29|30'),
(391, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 29, 31, '29|31'),
(392, NULL, NULL, 'skuwe21-variant-29-49', NULL, NULL, NULL, NULL, NULL, NULL, 30, 1, '30|1'),
(393, 'en', NULL, 'Variant 29 49', NULL, NULL, NULL, NULL, NULL, NULL, 30, 2, 'en|30|2'),
(394, 'en', NULL, 'skuwe21-variant-29-49', NULL, NULL, NULL, NULL, NULL, NULL, 30, 3, 'en|30|3'),
(395, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 30, 4, 'default|30|4'),
(396, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 8, 'default|30|8'),
(397, 'en', NULL, 'skuwe21-variant-29-49', NULL, NULL, NULL, NULL, NULL, NULL, 30, 9, 'en|30|9'),
(398, 'en', NULL, 'skuwe21-variant-29-49', NULL, NULL, NULL, NULL, NULL, NULL, 30, 10, 'en|30|10'),
(399, NULL, NULL, NULL, NULL, NULL, 109.0000, NULL, NULL, NULL, 30, 11, '30|11'),
(400, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 30, 22, '30|22'),
(401, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, 30, 30, '30|30'),
(402, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 30, 31, '30|31'),
(403, NULL, NULL, 'skuwe21-variant-30-49', NULL, NULL, NULL, NULL, NULL, NULL, 31, 1, '31|1'),
(404, 'en', NULL, 'Variant 30 49', NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 'en|31|2'),
(405, 'en', NULL, 'skuwe21-variant-30-49', NULL, NULL, NULL, NULL, NULL, NULL, 31, 3, 'en|31|3'),
(406, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 31, 4, 'default|31|4'),
(407, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 8, 'default|31|8'),
(408, 'en', NULL, 'skuwe21-variant-30-49', NULL, NULL, NULL, NULL, NULL, NULL, 31, 9, 'en|31|9'),
(409, 'en', NULL, 'skuwe21-variant-30-49', NULL, NULL, NULL, NULL, NULL, NULL, 31, 10, 'en|31|10'),
(410, NULL, NULL, NULL, NULL, NULL, 102.0000, NULL, NULL, NULL, 31, 11, '31|11'),
(411, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 31, 22, '31|22'),
(412, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 31, 30, '31|30'),
(413, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 31, 31, '31|31'),
(414, NULL, NULL, 'skuwe21-variant-31-49', NULL, NULL, NULL, NULL, NULL, NULL, 32, 1, '32|1'),
(415, 'en', NULL, 'Variant 31 49', NULL, NULL, NULL, NULL, NULL, NULL, 32, 2, 'en|32|2'),
(416, 'en', NULL, 'skuwe21-variant-31-49', NULL, NULL, NULL, NULL, NULL, NULL, 32, 3, 'en|32|3'),
(417, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 32, 4, 'default|32|4'),
(418, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 8, 'default|32|8'),
(419, 'en', NULL, 'skuwe21-variant-31-49', NULL, NULL, NULL, NULL, NULL, NULL, 32, 9, 'en|32|9'),
(420, 'en', NULL, 'skuwe21-variant-31-49', NULL, NULL, NULL, NULL, NULL, NULL, 32, 10, 'en|32|10'),
(421, NULL, NULL, NULL, NULL, NULL, 103.0000, NULL, NULL, NULL, 32, 11, '32|11'),
(422, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 32, 22, '32|22'),
(423, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, 32, 30, '32|30'),
(424, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 32, 31, '32|31'),
(425, NULL, NULL, 'skuwe21-variant-32-49', NULL, NULL, NULL, NULL, NULL, NULL, 33, 1, '33|1'),
(426, 'en', NULL, 'Variant 32 49', NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 'en|33|2'),
(427, 'en', NULL, 'skuwe21-variant-32-49', NULL, NULL, NULL, NULL, NULL, NULL, 33, 3, 'en|33|3'),
(428, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 33, 4, 'default|33|4'),
(429, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 8, 'default|33|8'),
(430, 'en', NULL, 'skuwe21-variant-32-49', NULL, NULL, NULL, NULL, NULL, NULL, 33, 9, 'en|33|9'),
(431, 'en', NULL, 'skuwe21-variant-32-49', NULL, NULL, NULL, NULL, NULL, NULL, 33, 10, 'en|33|10'),
(432, NULL, NULL, NULL, NULL, NULL, 194.0000, NULL, NULL, NULL, 33, 11, '33|11'),
(433, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 33, 22, '33|22'),
(434, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, 33, 30, '33|30'),
(435, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 33, 31, '33|31'),
(436, NULL, NULL, 'skuwe21-variant-33-49', NULL, NULL, NULL, NULL, NULL, NULL, 34, 1, '34|1'),
(437, 'en', NULL, 'Variant 33 49', NULL, NULL, NULL, NULL, NULL, NULL, 34, 2, 'en|34|2'),
(438, 'en', NULL, 'skuwe21-variant-33-49', NULL, NULL, NULL, NULL, NULL, NULL, 34, 3, 'en|34|3'),
(439, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 34, 4, 'default|34|4'),
(440, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 8, 'default|34|8'),
(441, 'en', NULL, 'skuwe21-variant-33-49', NULL, NULL, NULL, NULL, NULL, NULL, 34, 9, 'en|34|9'),
(442, 'en', NULL, 'skuwe21-variant-33-49', NULL, NULL, NULL, NULL, NULL, NULL, 34, 10, 'en|34|10'),
(443, NULL, NULL, NULL, NULL, NULL, 760.0000, NULL, NULL, NULL, 34, 11, '34|11'),
(444, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 34, 22, '34|22'),
(445, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, 34, 30, '34|30'),
(446, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 34, 31, '34|31'),
(447, NULL, NULL, 'skuwe21-variant-34-49', NULL, NULL, NULL, NULL, NULL, NULL, 35, 1, '35|1'),
(448, 'en', NULL, 'Variant 34 49', NULL, NULL, NULL, NULL, NULL, NULL, 35, 2, 'en|35|2'),
(449, 'en', NULL, 'skuwe21-variant-34-49', NULL, NULL, NULL, NULL, NULL, NULL, 35, 3, 'en|35|3'),
(450, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 35, 4, 'default|35|4'),
(451, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 8, 'default|35|8'),
(452, 'en', NULL, 'skuwe21-variant-34-49', NULL, NULL, NULL, NULL, NULL, NULL, 35, 9, 'en|35|9'),
(453, 'en', NULL, 'skuwe21-variant-34-49', NULL, NULL, NULL, NULL, NULL, NULL, 35, 10, 'en|35|10'),
(454, NULL, NULL, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 35, 11, '35|11'),
(455, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 35, 22, '35|22'),
(456, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, 35, 30, '35|30'),
(457, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 35, 31, '35|31'),
(458, NULL, NULL, 'skuwe21-variant-35-49', NULL, NULL, NULL, NULL, NULL, NULL, 36, 1, '36|1'),
(459, 'en', NULL, 'Variant 35 49', NULL, NULL, NULL, NULL, NULL, NULL, 36, 2, 'en|36|2'),
(460, 'en', NULL, 'skuwe21-variant-35-49', NULL, NULL, NULL, NULL, NULL, NULL, 36, 3, 'en|36|3'),
(461, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 36, 4, 'default|36|4'),
(462, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 8, 'default|36|8'),
(463, 'en', NULL, 'skuwe21-variant-35-49', NULL, NULL, NULL, NULL, NULL, NULL, 36, 9, 'en|36|9'),
(464, 'en', NULL, 'skuwe21-variant-35-49', NULL, NULL, NULL, NULL, NULL, NULL, 36, 10, 'en|36|10'),
(465, NULL, NULL, NULL, NULL, NULL, 410.0000, NULL, NULL, NULL, 36, 11, '36|11'),
(466, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 36, 22, '36|22'),
(467, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, 36, 30, '36|30'),
(468, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 36, 31, '36|31'),
(469, NULL, NULL, 'skuwe21-variant-36-49', NULL, NULL, NULL, NULL, NULL, NULL, 37, 1, '37|1'),
(470, 'en', NULL, 'Variant 36 49', NULL, NULL, NULL, NULL, NULL, NULL, 37, 2, 'en|37|2'),
(471, 'en', NULL, 'skuwe21-variant-36-49', NULL, NULL, NULL, NULL, NULL, NULL, 37, 3, 'en|37|3'),
(472, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 37, 4, 'default|37|4'),
(473, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 8, 'default|37|8'),
(474, 'en', NULL, 'skuwe21-variant-36-49', NULL, NULL, NULL, NULL, NULL, NULL, 37, 9, 'en|37|9'),
(475, 'en', NULL, 'skuwe21-variant-36-49', NULL, NULL, NULL, NULL, NULL, NULL, 37, 10, 'en|37|10'),
(476, NULL, NULL, NULL, NULL, NULL, 128.0000, NULL, NULL, NULL, 37, 11, '37|11'),
(477, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 37, 22, '37|22'),
(478, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, 37, 30, '37|30'),
(479, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 37, 31, '37|31'),
(480, NULL, NULL, 'skuwe21-variant-37-49', NULL, NULL, NULL, NULL, NULL, NULL, 38, 1, '38|1'),
(481, 'en', NULL, 'Variant 37 49', NULL, NULL, NULL, NULL, NULL, NULL, 38, 2, 'en|38|2'),
(482, 'en', NULL, 'skuwe21-variant-37-49', NULL, NULL, NULL, NULL, NULL, NULL, 38, 3, 'en|38|3'),
(483, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 38, 4, 'default|38|4'),
(484, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 8, 'default|38|8'),
(485, 'en', NULL, 'skuwe21-variant-37-49', NULL, NULL, NULL, NULL, NULL, NULL, 38, 9, 'en|38|9'),
(486, 'en', NULL, 'skuwe21-variant-37-49', NULL, NULL, NULL, NULL, NULL, NULL, 38, 10, 'en|38|10'),
(487, NULL, NULL, NULL, NULL, NULL, 127.0000, NULL, NULL, NULL, 38, 11, '38|11'),
(488, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 38, 22, '38|22'),
(489, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, 38, 30, '38|30'),
(490, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 38, 31, '38|31'),
(491, NULL, NULL, 'skuwe21-variant-38-49', NULL, NULL, NULL, NULL, NULL, NULL, 39, 1, '39|1'),
(492, 'en', NULL, 'Variant 38 49', NULL, NULL, NULL, NULL, NULL, NULL, 39, 2, 'en|39|2'),
(493, 'en', NULL, 'skuwe21-variant-38-49', NULL, NULL, NULL, NULL, NULL, NULL, 39, 3, 'en|39|3'),
(494, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 39, 4, 'default|39|4'),
(495, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 39, 8, 'default|39|8'),
(496, 'en', NULL, 'skuwe21-variant-38-49', NULL, NULL, NULL, NULL, NULL, NULL, 39, 9, 'en|39|9'),
(497, 'en', NULL, 'skuwe21-variant-38-49', NULL, NULL, NULL, NULL, NULL, NULL, 39, 10, 'en|39|10'),
(498, NULL, NULL, NULL, NULL, NULL, 138.0000, NULL, NULL, NULL, 39, 11, '39|11'),
(499, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 39, 22, '39|22'),
(500, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, 39, 30, '39|30'),
(501, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 39, 31, '39|31'),
(502, NULL, NULL, 'skuwe21-variant-39-49', NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, '40|1'),
(503, 'en', NULL, 'Variant 39 49', NULL, NULL, NULL, NULL, NULL, NULL, 40, 2, 'en|40|2'),
(504, 'en', NULL, 'skuwe21-variant-39-49', NULL, NULL, NULL, NULL, NULL, NULL, 40, 3, 'en|40|3'),
(505, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 40, 4, 'default|40|4'),
(506, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 40, 8, 'default|40|8'),
(507, 'en', NULL, 'skuwe21-variant-39-49', NULL, NULL, NULL, NULL, NULL, NULL, 40, 9, 'en|40|9'),
(508, 'en', NULL, 'skuwe21-variant-39-49', NULL, NULL, NULL, NULL, NULL, NULL, 40, 10, 'en|40|10'),
(509, NULL, NULL, NULL, NULL, NULL, 134.0000, NULL, NULL, NULL, 40, 11, '40|11'),
(510, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 40, 22, '40|22'),
(511, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, 40, 30, '40|30'),
(512, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 40, 31, '40|31'),
(513, NULL, NULL, 'skuwe21-variant-40-49', NULL, NULL, NULL, NULL, NULL, NULL, 41, 1, '41|1'),
(514, 'en', NULL, 'Variant 40 49', NULL, NULL, NULL, NULL, NULL, NULL, 41, 2, 'en|41|2'),
(515, 'en', NULL, 'skuwe21-variant-40-49', NULL, NULL, NULL, NULL, NULL, NULL, 41, 3, 'en|41|3'),
(516, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 41, 4, 'default|41|4'),
(517, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 41, 8, 'default|41|8'),
(518, 'en', NULL, 'skuwe21-variant-40-49', NULL, NULL, NULL, NULL, NULL, NULL, 41, 9, 'en|41|9'),
(519, 'en', NULL, 'skuwe21-variant-40-49', NULL, NULL, NULL, NULL, NULL, NULL, 41, 10, 'en|41|10'),
(520, NULL, NULL, NULL, NULL, NULL, 130.0000, NULL, NULL, NULL, 41, 11, '41|11'),
(521, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 41, 22, '41|22'),
(522, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 41, 30, '41|30'),
(523, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 41, 31, '41|31'),
(524, NULL, NULL, 'skuwe21-variant-41-49', NULL, NULL, NULL, NULL, NULL, NULL, 42, 1, '42|1'),
(525, 'en', NULL, 'Variant 41 49', NULL, NULL, NULL, NULL, NULL, NULL, 42, 2, 'en|42|2'),
(526, 'en', NULL, 'skuwe21-variant-41-49', NULL, NULL, NULL, NULL, NULL, NULL, 42, 3, 'en|42|3'),
(527, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 42, 4, 'default|42|4'),
(528, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 42, 8, 'default|42|8'),
(529, 'en', NULL, 'skuwe21-variant-41-49', NULL, NULL, NULL, NULL, NULL, NULL, 42, 9, 'en|42|9'),
(530, 'en', NULL, 'skuwe21-variant-41-49', NULL, NULL, NULL, NULL, NULL, NULL, 42, 10, 'en|42|10'),
(531, NULL, NULL, NULL, NULL, NULL, 148.0000, NULL, NULL, NULL, 42, 11, '42|11'),
(532, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 42, 22, '42|22'),
(533, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, 42, 30, '42|30'),
(534, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 42, 31, '42|31'),
(535, NULL, NULL, 'skuwe21-variant-42-49', NULL, NULL, NULL, NULL, NULL, NULL, 43, 1, '43|1'),
(536, 'en', NULL, 'Variant 42 49', NULL, NULL, NULL, NULL, NULL, NULL, 43, 2, 'en|43|2'),
(537, 'en', NULL, 'skuwe21-variant-42-49', NULL, NULL, NULL, NULL, NULL, NULL, 43, 3, 'en|43|3'),
(538, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 43, 4, 'default|43|4'),
(539, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 43, 8, 'default|43|8'),
(540, 'en', NULL, 'skuwe21-variant-42-49', NULL, NULL, NULL, NULL, NULL, NULL, 43, 9, 'en|43|9'),
(541, 'en', NULL, 'skuwe21-variant-42-49', NULL, NULL, NULL, NULL, NULL, NULL, 43, 10, 'en|43|10'),
(542, NULL, NULL, NULL, NULL, NULL, 134.0000, NULL, NULL, NULL, 43, 11, '43|11'),
(543, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 43, 22, '43|22'),
(544, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, 43, 30, '43|30'),
(545, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 43, 31, '43|31'),
(546, NULL, NULL, 'skuwe21-variant-43-49', NULL, NULL, NULL, NULL, NULL, NULL, 44, 1, '44|1'),
(547, 'en', NULL, 'Variant 43 49', NULL, NULL, NULL, NULL, NULL, NULL, 44, 2, 'en|44|2'),
(548, 'en', NULL, 'skuwe21-variant-43-49', NULL, NULL, NULL, NULL, NULL, NULL, 44, 3, 'en|44|3'),
(549, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 44, 4, 'default|44|4'),
(550, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 44, 8, 'default|44|8'),
(551, 'en', NULL, 'skuwe21-variant-43-49', NULL, NULL, NULL, NULL, NULL, NULL, 44, 9, 'en|44|9'),
(552, 'en', NULL, 'skuwe21-variant-43-49', NULL, NULL, NULL, NULL, NULL, NULL, 44, 10, 'en|44|10'),
(553, NULL, NULL, NULL, NULL, NULL, 231.0000, NULL, NULL, NULL, 44, 11, '44|11'),
(554, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 44, 22, '44|22'),
(555, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, 44, 30, '44|30'),
(556, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 44, 31, '44|31'),
(557, NULL, NULL, 'skuwe21-variant-44-49', NULL, NULL, NULL, NULL, NULL, NULL, 45, 1, '45|1'),
(558, 'en', NULL, 'Variant 44 49', NULL, NULL, NULL, NULL, NULL, NULL, 45, 2, 'en|45|2'),
(559, 'en', NULL, 'skuwe21-variant-44-49', NULL, NULL, NULL, NULL, NULL, NULL, 45, 3, 'en|45|3'),
(560, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 45, 4, 'default|45|4'),
(561, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 45, 8, 'default|45|8'),
(562, 'en', NULL, 'skuwe21-variant-44-49', NULL, NULL, NULL, NULL, NULL, NULL, 45, 9, 'en|45|9'),
(563, 'en', NULL, 'skuwe21-variant-44-49', NULL, NULL, NULL, NULL, NULL, NULL, 45, 10, 'en|45|10'),
(564, NULL, NULL, NULL, NULL, NULL, 234.0000, NULL, NULL, NULL, 45, 11, '45|11');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
(565, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 45, 22, '45|22'),
(566, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, 45, 30, '45|30'),
(567, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 45, 31, '45|31'),
(568, NULL, NULL, 'skuwe21-variant-45-49', NULL, NULL, NULL, NULL, NULL, NULL, 46, 1, '46|1'),
(569, 'en', NULL, 'Variant 45 49', NULL, NULL, NULL, NULL, NULL, NULL, 46, 2, 'en|46|2'),
(570, 'en', NULL, 'skuwe21-variant-45-49', NULL, NULL, NULL, NULL, NULL, NULL, 46, 3, 'en|46|3'),
(571, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 46, 4, 'default|46|4'),
(572, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 8, 'default|46|8'),
(573, 'en', NULL, 'skuwe21-variant-45-49', NULL, NULL, NULL, NULL, NULL, NULL, 46, 9, 'en|46|9'),
(574, 'en', NULL, 'skuwe21-variant-45-49', NULL, NULL, NULL, NULL, NULL, NULL, 46, 10, 'en|46|10'),
(575, NULL, NULL, NULL, NULL, NULL, 235.0000, NULL, NULL, NULL, 46, 11, '46|11'),
(576, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 46, 22, '46|22'),
(577, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, 46, 30, '46|30'),
(578, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 46, 31, '46|31'),
(579, NULL, NULL, 'skuwe21-variant-46-49', NULL, NULL, NULL, NULL, NULL, NULL, 47, 1, '47|1'),
(580, 'en', NULL, 'Variant 46 49', NULL, NULL, NULL, NULL, NULL, NULL, 47, 2, 'en|47|2'),
(581, 'en', NULL, 'skuwe21-variant-46-49', NULL, NULL, NULL, NULL, NULL, NULL, 47, 3, 'en|47|3'),
(582, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 47, 4, 'default|47|4'),
(583, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 8, 'default|47|8'),
(584, 'en', NULL, 'skuwe21-variant-46-49', NULL, NULL, NULL, NULL, NULL, NULL, 47, 9, 'en|47|9'),
(585, 'en', NULL, 'skuwe21-variant-46-49', NULL, NULL, NULL, NULL, NULL, NULL, 47, 10, 'en|47|10'),
(586, NULL, NULL, NULL, NULL, NULL, 248.0000, NULL, NULL, NULL, 47, 11, '47|11'),
(587, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 47, 22, '47|22'),
(588, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, 47, 30, '47|30'),
(589, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 47, 31, '47|31'),
(590, NULL, NULL, 'skuwe21-variant-47-49', NULL, NULL, NULL, NULL, NULL, NULL, 48, 1, '48|1'),
(591, 'en', NULL, 'Variant 47 49', NULL, NULL, NULL, NULL, NULL, NULL, 48, 2, 'en|48|2'),
(592, 'en', NULL, 'skuwe21-variant-47-49', NULL, NULL, NULL, NULL, NULL, NULL, 48, 3, 'en|48|3'),
(593, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 48, 4, 'default|48|4'),
(594, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 8, 'default|48|8'),
(595, 'en', NULL, 'skuwe21-variant-47-49', NULL, NULL, NULL, NULL, NULL, NULL, 48, 9, 'en|48|9'),
(596, 'en', NULL, 'skuwe21-variant-47-49', NULL, NULL, NULL, NULL, NULL, NULL, 48, 10, 'en|48|10'),
(597, NULL, NULL, NULL, NULL, NULL, 240.0000, NULL, NULL, NULL, 48, 11, '48|11'),
(598, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 48, 22, '48|22'),
(599, NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, 48, 30, '48|30'),
(600, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 48, 31, '48|31'),
(601, NULL, NULL, 'skuwe21-variant-48-49', NULL, NULL, NULL, NULL, NULL, NULL, 49, 1, '49|1'),
(602, 'en', NULL, 'Variant 48 49', NULL, NULL, NULL, NULL, NULL, NULL, 49, 2, 'en|49|2'),
(603, 'en', NULL, 'skuwe21-variant-48-49', NULL, NULL, NULL, NULL, NULL, NULL, 49, 3, 'en|49|3'),
(604, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 49, 4, 'default|49|4'),
(605, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 8, 'default|49|8'),
(606, 'en', NULL, 'skuwe21-variant-48-49', NULL, NULL, NULL, NULL, NULL, NULL, 49, 9, 'en|49|9'),
(607, 'en', NULL, 'skuwe21-variant-48-49', NULL, NULL, NULL, NULL, NULL, NULL, 49, 10, 'en|49|10'),
(608, NULL, NULL, NULL, NULL, NULL, 900.0000, NULL, NULL, NULL, 49, 11, '49|11'),
(609, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 49, 22, '49|22'),
(610, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, 49, 30, '49|30'),
(611, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 49, 31, '49|31'),
(612, NULL, NULL, 'skuwe21-variant-13-50', NULL, NULL, NULL, NULL, NULL, NULL, 50, 1, '50|1'),
(613, 'en', NULL, 'Variant 13 50', NULL, NULL, NULL, NULL, NULL, NULL, 50, 2, 'en|50|2'),
(614, 'en', NULL, 'skuwe21-variant-13-50', NULL, NULL, NULL, NULL, NULL, NULL, 50, 3, 'en|50|3'),
(615, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 50, 4, 'default|50|4'),
(616, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 50, 8, 'default|50|8'),
(617, 'en', NULL, 'skuwe21-variant-13-50', NULL, NULL, NULL, NULL, NULL, NULL, 50, 9, 'en|50|9'),
(618, 'en', NULL, 'skuwe21-variant-13-50', NULL, NULL, NULL, NULL, NULL, NULL, 50, 10, 'en|50|10'),
(619, NULL, NULL, NULL, NULL, NULL, 800.0000, NULL, NULL, NULL, 50, 11, '50|11'),
(620, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 50, 22, '50|22'),
(621, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 50, 30, '50|30'),
(622, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 50, 31, '50|31'),
(623, NULL, NULL, 'skuwe21-variant-14-50', NULL, NULL, NULL, NULL, NULL, NULL, 51, 1, '51|1'),
(624, 'en', NULL, 'Variant 14 50', NULL, NULL, NULL, NULL, NULL, NULL, 51, 2, 'en|51|2'),
(625, 'en', NULL, 'skuwe21-variant-14-50', NULL, NULL, NULL, NULL, NULL, NULL, 51, 3, 'en|51|3'),
(626, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 51, 4, 'default|51|4'),
(627, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 51, 8, 'default|51|8'),
(628, 'en', NULL, 'skuwe21-variant-14-50', NULL, NULL, NULL, NULL, NULL, NULL, 51, 9, 'en|51|9'),
(629, 'en', NULL, 'skuwe21-variant-14-50', NULL, NULL, NULL, NULL, NULL, NULL, 51, 10, 'en|51|10'),
(630, NULL, NULL, NULL, NULL, NULL, 700.0000, NULL, NULL, NULL, 51, 11, '51|11'),
(631, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 51, 22, '51|22'),
(632, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, 51, 30, '51|30'),
(633, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 51, 31, '51|31'),
(634, NULL, NULL, 'skuwe21-variant-15-50', NULL, NULL, NULL, NULL, NULL, NULL, 52, 1, '52|1'),
(635, 'en', NULL, 'Variant 15 50', NULL, NULL, NULL, NULL, NULL, NULL, 52, 2, 'en|52|2'),
(636, 'en', NULL, 'skuwe21-variant-15-50', NULL, NULL, NULL, NULL, NULL, NULL, 52, 3, 'en|52|3'),
(637, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 52, 4, 'default|52|4'),
(638, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 52, 8, 'default|52|8'),
(639, 'en', NULL, 'skuwe21-variant-15-50', NULL, NULL, NULL, NULL, NULL, NULL, 52, 9, 'en|52|9'),
(640, 'en', NULL, 'skuwe21-variant-15-50', NULL, NULL, NULL, NULL, NULL, NULL, 52, 10, 'en|52|10'),
(641, NULL, NULL, NULL, NULL, NULL, 300.0000, NULL, NULL, NULL, 52, 11, '52|11'),
(642, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 52, 22, '52|22'),
(643, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, 52, 30, '52|30'),
(644, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 52, 31, '52|31'),
(645, NULL, NULL, 'skuwe21-variant-16-50', NULL, NULL, NULL, NULL, NULL, NULL, 53, 1, '53|1'),
(646, 'en', NULL, 'Variant 16 50', NULL, NULL, NULL, NULL, NULL, NULL, 53, 2, 'en|53|2'),
(647, 'en', NULL, 'skuwe21-variant-16-50', NULL, NULL, NULL, NULL, NULL, NULL, 53, 3, 'en|53|3'),
(648, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 53, 4, 'default|53|4'),
(649, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 53, 8, 'default|53|8'),
(650, 'en', NULL, 'skuwe21-variant-16-50', NULL, NULL, NULL, NULL, NULL, NULL, 53, 9, 'en|53|9'),
(651, 'en', NULL, 'skuwe21-variant-16-50', NULL, NULL, NULL, NULL, NULL, NULL, 53, 10, 'en|53|10'),
(652, NULL, NULL, NULL, NULL, NULL, 400.0000, NULL, NULL, NULL, 53, 11, '53|11'),
(653, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 53, 22, '53|22'),
(654, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, 53, 30, '53|30'),
(655, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 53, 31, '53|31'),
(656, NULL, NULL, 'skuwe21-variant-17-50', NULL, NULL, NULL, NULL, NULL, NULL, 54, 1, '54|1'),
(657, 'en', NULL, 'Variant 17 50', NULL, NULL, NULL, NULL, NULL, NULL, 54, 2, 'en|54|2'),
(658, 'en', NULL, 'skuwe21-variant-17-50', NULL, NULL, NULL, NULL, NULL, NULL, 54, 3, 'en|54|3'),
(659, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 54, 4, 'default|54|4'),
(660, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 54, 8, 'default|54|8'),
(661, 'en', NULL, 'skuwe21-variant-17-50', NULL, NULL, NULL, NULL, NULL, NULL, 54, 9, 'en|54|9'),
(662, 'en', NULL, 'skuwe21-variant-17-50', NULL, NULL, NULL, NULL, NULL, NULL, 54, 10, 'en|54|10'),
(663, NULL, NULL, NULL, NULL, NULL, 200.0000, NULL, NULL, NULL, 54, 11, '54|11'),
(664, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 54, 22, '54|22'),
(665, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, 54, 30, '54|30'),
(666, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 54, 31, '54|31'),
(667, NULL, NULL, 'skuwe21-variant-18-50', NULL, NULL, NULL, NULL, NULL, NULL, 55, 1, '55|1'),
(668, 'en', NULL, 'Variant 18 50', NULL, NULL, NULL, NULL, NULL, NULL, 55, 2, 'en|55|2'),
(669, 'en', NULL, 'skuwe21-variant-18-50', NULL, NULL, NULL, NULL, NULL, NULL, 55, 3, 'en|55|3'),
(670, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 55, 4, 'default|55|4'),
(671, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 55, 8, 'default|55|8'),
(672, 'en', NULL, 'skuwe21-variant-18-50', NULL, NULL, NULL, NULL, NULL, NULL, 55, 9, 'en|55|9'),
(673, 'en', NULL, 'skuwe21-variant-18-50', NULL, NULL, NULL, NULL, NULL, NULL, 55, 10, 'en|55|10'),
(674, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 55, 11, '55|11'),
(675, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 55, 22, '55|22'),
(676, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, 55, 30, '55|30'),
(677, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 55, 31, '55|31'),
(678, NULL, NULL, 'skuwe21-variant-19-50', NULL, NULL, NULL, NULL, NULL, NULL, 56, 1, '56|1'),
(679, 'en', NULL, 'Variant 19 50', NULL, NULL, NULL, NULL, NULL, NULL, 56, 2, 'en|56|2'),
(680, 'en', NULL, 'skuwe21-variant-19-50', NULL, NULL, NULL, NULL, NULL, NULL, 56, 3, 'en|56|3'),
(681, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 56, 4, 'default|56|4'),
(682, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 56, 8, 'default|56|8'),
(683, 'en', NULL, 'skuwe21-variant-19-50', NULL, NULL, NULL, NULL, NULL, NULL, 56, 9, 'en|56|9'),
(684, 'en', NULL, 'skuwe21-variant-19-50', NULL, NULL, NULL, NULL, NULL, NULL, 56, 10, 'en|56|10'),
(685, NULL, NULL, NULL, NULL, NULL, 129.0000, NULL, NULL, NULL, 56, 11, '56|11'),
(686, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 56, 22, '56|22'),
(687, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, 56, 30, '56|30'),
(688, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 56, 31, '56|31'),
(689, NULL, NULL, 'skuwe21-variant-20-50', NULL, NULL, NULL, NULL, NULL, NULL, 57, 1, '57|1'),
(690, 'en', NULL, 'Variant 20 50', NULL, NULL, NULL, NULL, NULL, NULL, 57, 2, 'en|57|2'),
(691, 'en', NULL, 'skuwe21-variant-20-50', NULL, NULL, NULL, NULL, NULL, NULL, 57, 3, 'en|57|3'),
(692, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 57, 4, 'default|57|4'),
(693, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 57, 8, 'default|57|8'),
(694, 'en', NULL, 'skuwe21-variant-20-50', NULL, NULL, NULL, NULL, NULL, NULL, 57, 9, 'en|57|9'),
(695, 'en', NULL, 'skuwe21-variant-20-50', NULL, NULL, NULL, NULL, NULL, NULL, 57, 10, 'en|57|10'),
(696, NULL, NULL, NULL, NULL, NULL, 230.0000, NULL, NULL, NULL, 57, 11, '57|11'),
(697, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 57, 22, '57|22'),
(698, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, 57, 30, '57|30'),
(699, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 57, 31, '57|31'),
(700, NULL, NULL, 'skuwe21-variant-21-50', NULL, NULL, NULL, NULL, NULL, NULL, 58, 1, '58|1'),
(701, 'en', NULL, 'Variant 21 50', NULL, NULL, NULL, NULL, NULL, NULL, 58, 2, 'en|58|2'),
(702, 'en', NULL, 'skuwe21-variant-21-50', NULL, NULL, NULL, NULL, NULL, NULL, 58, 3, 'en|58|3'),
(703, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 58, 4, 'default|58|4'),
(704, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 58, 8, 'default|58|8'),
(705, 'en', NULL, 'skuwe21-variant-21-50', NULL, NULL, NULL, NULL, NULL, NULL, 58, 9, 'en|58|9'),
(706, 'en', NULL, 'skuwe21-variant-21-50', NULL, NULL, NULL, NULL, NULL, NULL, 58, 10, 'en|58|10'),
(707, NULL, NULL, NULL, NULL, NULL, 1234.0000, NULL, NULL, NULL, 58, 11, '58|11'),
(708, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 58, 22, '58|22'),
(709, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, 58, 30, '58|30'),
(710, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 58, 31, '58|31'),
(711, NULL, NULL, 'skuwe21-variant-22-50', NULL, NULL, NULL, NULL, NULL, NULL, 59, 1, '59|1'),
(712, 'en', NULL, 'Variant 22 50', NULL, NULL, NULL, NULL, NULL, NULL, 59, 2, 'en|59|2'),
(713, 'en', NULL, 'skuwe21-variant-22-50', NULL, NULL, NULL, NULL, NULL, NULL, 59, 3, 'en|59|3'),
(714, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 59, 4, 'default|59|4'),
(715, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 59, 8, 'default|59|8'),
(716, 'en', NULL, 'skuwe21-variant-22-50', NULL, NULL, NULL, NULL, NULL, NULL, 59, 9, 'en|59|9'),
(717, 'en', NULL, 'skuwe21-variant-22-50', NULL, NULL, NULL, NULL, NULL, NULL, 59, 10, 'en|59|10'),
(718, NULL, NULL, NULL, NULL, NULL, 123.0000, NULL, NULL, NULL, 59, 11, '59|11'),
(719, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 59, 22, '59|22'),
(720, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, 59, 30, '59|30'),
(721, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 59, 31, '59|31'),
(722, NULL, NULL, 'skuwe21-variant-23-50', NULL, NULL, NULL, NULL, NULL, NULL, 60, 1, '60|1'),
(723, 'en', NULL, 'Variant 23 50', NULL, NULL, NULL, NULL, NULL, NULL, 60, 2, 'en|60|2'),
(724, 'en', NULL, 'skuwe21-variant-23-50', NULL, NULL, NULL, NULL, NULL, NULL, 60, 3, 'en|60|3'),
(725, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 60, 4, 'default|60|4'),
(726, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 60, 8, 'default|60|8'),
(727, 'en', NULL, 'skuwe21-variant-23-50', NULL, NULL, NULL, NULL, NULL, NULL, 60, 9, 'en|60|9'),
(728, 'en', NULL, 'skuwe21-variant-23-50', NULL, NULL, NULL, NULL, NULL, NULL, 60, 10, 'en|60|10'),
(729, NULL, NULL, NULL, NULL, NULL, 154.0000, NULL, NULL, NULL, 60, 11, '60|11'),
(730, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 60, 22, '60|22'),
(731, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, 60, 30, '60|30'),
(732, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 60, 31, '60|31'),
(733, NULL, NULL, 'skuwe21-variant-24-50', NULL, NULL, NULL, NULL, NULL, NULL, 61, 1, '61|1'),
(734, 'en', NULL, 'Variant 24 50', NULL, NULL, NULL, NULL, NULL, NULL, 61, 2, 'en|61|2'),
(735, 'en', NULL, 'skuwe21-variant-24-50', NULL, NULL, NULL, NULL, NULL, NULL, 61, 3, 'en|61|3'),
(736, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 61, 4, 'default|61|4'),
(737, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 61, 8, 'default|61|8'),
(738, 'en', NULL, 'skuwe21-variant-24-50', NULL, NULL, NULL, NULL, NULL, NULL, 61, 9, 'en|61|9'),
(739, 'en', NULL, 'skuwe21-variant-24-50', NULL, NULL, NULL, NULL, NULL, NULL, 61, 10, 'en|61|10'),
(740, NULL, NULL, NULL, NULL, NULL, 235.0000, NULL, NULL, NULL, 61, 11, '61|11'),
(741, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 61, 22, '61|22'),
(742, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, 61, 30, '61|30'),
(743, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 61, 31, '61|31'),
(744, NULL, NULL, 'skuwe21-variant-25-50', NULL, NULL, NULL, NULL, NULL, NULL, 62, 1, '62|1'),
(745, 'en', NULL, 'Variant 25 50', NULL, NULL, NULL, NULL, NULL, NULL, 62, 2, 'en|62|2'),
(746, 'en', NULL, 'skuwe21-variant-25-50', NULL, NULL, NULL, NULL, NULL, NULL, 62, 3, 'en|62|3'),
(747, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 62, 4, 'default|62|4'),
(748, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 62, 8, 'default|62|8'),
(749, 'en', NULL, 'skuwe21-variant-25-50', NULL, NULL, NULL, NULL, NULL, NULL, 62, 9, 'en|62|9'),
(750, 'en', NULL, 'skuwe21-variant-25-50', NULL, NULL, NULL, NULL, NULL, NULL, 62, 10, 'en|62|10'),
(751, NULL, NULL, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 62, 11, '62|11'),
(752, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 62, 22, '62|22'),
(753, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 62, 30, '62|30'),
(754, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 62, 31, '62|31'),
(755, NULL, NULL, 'skuwe21-variant-26-50', NULL, NULL, NULL, NULL, NULL, NULL, 63, 1, '63|1'),
(756, 'en', NULL, 'Variant 26 50', NULL, NULL, NULL, NULL, NULL, NULL, 63, 2, 'en|63|2'),
(757, 'en', NULL, 'skuwe21-variant-26-50', NULL, NULL, NULL, NULL, NULL, NULL, 63, 3, 'en|63|3'),
(758, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 63, 4, 'default|63|4'),
(759, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 63, 8, 'default|63|8'),
(760, 'en', NULL, 'skuwe21-variant-26-50', NULL, NULL, NULL, NULL, NULL, NULL, 63, 9, 'en|63|9'),
(761, 'en', NULL, 'skuwe21-variant-26-50', NULL, NULL, NULL, NULL, NULL, NULL, 63, 10, 'en|63|10'),
(762, NULL, NULL, NULL, NULL, NULL, 654.0000, NULL, NULL, NULL, 63, 11, '63|11'),
(763, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 63, 22, '63|22'),
(764, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, 63, 30, '63|30'),
(765, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 63, 31, '63|31'),
(766, NULL, NULL, 'skuwe21-variant-27-50', NULL, NULL, NULL, NULL, NULL, NULL, 64, 1, '64|1'),
(767, 'en', NULL, 'Variant 27 50', NULL, NULL, NULL, NULL, NULL, NULL, 64, 2, 'en|64|2'),
(768, 'en', NULL, 'skuwe21-variant-27-50', NULL, NULL, NULL, NULL, NULL, NULL, 64, 3, 'en|64|3'),
(769, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 64, 4, 'default|64|4'),
(770, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 64, 8, 'default|64|8'),
(771, 'en', NULL, 'skuwe21-variant-27-50', NULL, NULL, NULL, NULL, NULL, NULL, 64, 9, 'en|64|9'),
(772, 'en', NULL, 'skuwe21-variant-27-50', NULL, NULL, NULL, NULL, NULL, NULL, 64, 10, 'en|64|10'),
(773, NULL, NULL, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 64, 11, '64|11'),
(774, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 64, 22, '64|22'),
(775, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, 64, 30, '64|30'),
(776, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 64, 31, '64|31'),
(777, NULL, NULL, 'skuwe21-variant-28-50', NULL, NULL, NULL, NULL, NULL, NULL, 65, 1, '65|1'),
(778, 'en', NULL, 'Variant 28 50', NULL, NULL, NULL, NULL, NULL, NULL, 65, 2, 'en|65|2'),
(779, 'en', NULL, 'skuwe21-variant-28-50', NULL, NULL, NULL, NULL, NULL, NULL, 65, 3, 'en|65|3'),
(780, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 65, 4, 'default|65|4'),
(781, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 65, 8, 'default|65|8'),
(782, 'en', NULL, 'skuwe21-variant-28-50', NULL, NULL, NULL, NULL, NULL, NULL, 65, 9, 'en|65|9'),
(783, 'en', NULL, 'skuwe21-variant-28-50', NULL, NULL, NULL, NULL, NULL, NULL, 65, 10, 'en|65|10'),
(784, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 65, 11, '65|11'),
(785, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 65, 22, '65|22'),
(786, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, 65, 30, '65|30'),
(787, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 65, 31, '65|31'),
(788, NULL, NULL, 'skuwe21-variant-29-50', NULL, NULL, NULL, NULL, NULL, NULL, 66, 1, '66|1'),
(789, 'en', NULL, 'Variant 29 50', NULL, NULL, NULL, NULL, NULL, NULL, 66, 2, 'en|66|2'),
(790, 'en', NULL, 'skuwe21-variant-29-50', NULL, NULL, NULL, NULL, NULL, NULL, 66, 3, 'en|66|3'),
(791, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 66, 4, 'default|66|4'),
(792, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 66, 8, 'default|66|8'),
(793, 'en', NULL, 'skuwe21-variant-29-50', NULL, NULL, NULL, NULL, NULL, NULL, 66, 9, 'en|66|9'),
(794, 'en', NULL, 'skuwe21-variant-29-50', NULL, NULL, NULL, NULL, NULL, NULL, 66, 10, 'en|66|10'),
(795, NULL, NULL, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 66, 11, '66|11'),
(796, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 66, 22, '66|22'),
(797, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, 66, 30, '66|30'),
(798, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 66, 31, '66|31'),
(799, NULL, NULL, 'skuwe21-variant-30-50', NULL, NULL, NULL, NULL, NULL, NULL, 67, 1, '67|1'),
(800, 'en', NULL, 'Variant 30 50', NULL, NULL, NULL, NULL, NULL, NULL, 67, 2, 'en|67|2'),
(801, 'en', NULL, 'skuwe21-variant-30-50', NULL, NULL, NULL, NULL, NULL, NULL, 67, 3, 'en|67|3'),
(802, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 67, 4, 'default|67|4'),
(803, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 67, 8, 'default|67|8'),
(804, 'en', NULL, 'skuwe21-variant-30-50', NULL, NULL, NULL, NULL, NULL, NULL, 67, 9, 'en|67|9'),
(805, 'en', NULL, 'skuwe21-variant-30-50', NULL, NULL, NULL, NULL, NULL, NULL, 67, 10, 'en|67|10'),
(806, NULL, NULL, NULL, NULL, NULL, 543.0000, NULL, NULL, NULL, 67, 11, '67|11'),
(807, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 67, 22, '67|22'),
(808, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 67, 30, '67|30'),
(809, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 67, 31, '67|31'),
(810, NULL, NULL, 'skuwe21-variant-31-50', NULL, NULL, NULL, NULL, NULL, NULL, 68, 1, '68|1'),
(811, 'en', NULL, 'Variant 31 50', NULL, NULL, NULL, NULL, NULL, NULL, 68, 2, 'en|68|2'),
(812, 'en', NULL, 'skuwe21-variant-31-50', NULL, NULL, NULL, NULL, NULL, NULL, 68, 3, 'en|68|3'),
(813, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 68, 4, 'default|68|4'),
(814, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 68, 8, 'default|68|8'),
(815, 'en', NULL, 'skuwe21-variant-31-50', NULL, NULL, NULL, NULL, NULL, NULL, 68, 9, 'en|68|9'),
(816, 'en', NULL, 'skuwe21-variant-31-50', NULL, NULL, NULL, NULL, NULL, NULL, 68, 10, 'en|68|10'),
(817, NULL, NULL, NULL, NULL, NULL, 560.0000, NULL, NULL, NULL, 68, 11, '68|11'),
(818, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 68, 22, '68|22'),
(819, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, 68, 30, '68|30'),
(820, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 68, 31, '68|31'),
(821, NULL, NULL, 'skuwe21-variant-32-50', NULL, NULL, NULL, NULL, NULL, NULL, 69, 1, '69|1'),
(822, 'en', NULL, 'Variant 32 50', NULL, NULL, NULL, NULL, NULL, NULL, 69, 2, 'en|69|2'),
(823, 'en', NULL, 'skuwe21-variant-32-50', NULL, NULL, NULL, NULL, NULL, NULL, 69, 3, 'en|69|3'),
(824, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 69, 4, 'default|69|4'),
(825, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 69, 8, 'default|69|8'),
(826, 'en', NULL, 'skuwe21-variant-32-50', NULL, NULL, NULL, NULL, NULL, NULL, 69, 9, 'en|69|9'),
(827, 'en', NULL, 'skuwe21-variant-32-50', NULL, NULL, NULL, NULL, NULL, NULL, 69, 10, 'en|69|10'),
(828, NULL, NULL, NULL, NULL, NULL, 652.0000, NULL, NULL, NULL, 69, 11, '69|11'),
(829, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 69, 22, '69|22'),
(830, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, 69, 30, '69|30'),
(831, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 69, 31, '69|31'),
(832, NULL, NULL, 'skuwe21-variant-33-50', NULL, NULL, NULL, NULL, NULL, NULL, 70, 1, '70|1'),
(833, 'en', NULL, 'Variant 33 50', NULL, NULL, NULL, NULL, NULL, NULL, 70, 2, 'en|70|2'),
(834, 'en', NULL, 'skuwe21-variant-33-50', NULL, NULL, NULL, NULL, NULL, NULL, 70, 3, 'en|70|3'),
(835, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 70, 4, 'default|70|4'),
(836, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 70, 8, 'default|70|8'),
(837, 'en', NULL, 'skuwe21-variant-33-50', NULL, NULL, NULL, NULL, NULL, NULL, 70, 9, 'en|70|9'),
(838, 'en', NULL, 'skuwe21-variant-33-50', NULL, NULL, NULL, NULL, NULL, NULL, 70, 10, 'en|70|10'),
(839, NULL, NULL, NULL, NULL, NULL, 496.0000, NULL, NULL, NULL, 70, 11, '70|11'),
(840, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 70, 22, '70|22'),
(841, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, 70, 30, '70|30'),
(842, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 70, 31, '70|31'),
(843, NULL, NULL, 'skuwe21-variant-34-50', NULL, NULL, NULL, NULL, NULL, NULL, 71, 1, '71|1'),
(844, 'en', NULL, 'Variant 34 50', NULL, NULL, NULL, NULL, NULL, NULL, 71, 2, 'en|71|2'),
(845, 'en', NULL, 'skuwe21-variant-34-50', NULL, NULL, NULL, NULL, NULL, NULL, 71, 3, 'en|71|3'),
(846, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 71, 4, 'default|71|4'),
(847, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 71, 8, 'default|71|8'),
(848, 'en', NULL, 'skuwe21-variant-34-50', NULL, NULL, NULL, NULL, NULL, NULL, 71, 9, 'en|71|9'),
(849, 'en', NULL, 'skuwe21-variant-34-50', NULL, NULL, NULL, NULL, NULL, NULL, 71, 10, 'en|71|10'),
(850, NULL, NULL, NULL, NULL, NULL, 47.0000, NULL, NULL, NULL, 71, 11, '71|11'),
(851, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 71, 22, '71|22'),
(852, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, 71, 30, '71|30'),
(853, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 71, 31, '71|31'),
(854, NULL, NULL, 'skuwe21-variant-35-50', NULL, NULL, NULL, NULL, NULL, NULL, 72, 1, '72|1'),
(855, 'en', NULL, 'Variant 35 50', NULL, NULL, NULL, NULL, NULL, NULL, 72, 2, 'en|72|2'),
(856, 'en', NULL, 'skuwe21-variant-35-50', NULL, NULL, NULL, NULL, NULL, NULL, 72, 3, 'en|72|3'),
(857, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 72, 4, 'default|72|4'),
(858, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 72, 8, 'default|72|8'),
(859, 'en', NULL, 'skuwe21-variant-35-50', NULL, NULL, NULL, NULL, NULL, NULL, 72, 9, 'en|72|9'),
(860, 'en', NULL, 'skuwe21-variant-35-50', NULL, NULL, NULL, NULL, NULL, NULL, 72, 10, 'en|72|10'),
(861, NULL, NULL, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 72, 11, '72|11'),
(862, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 72, 22, '72|22'),
(863, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, 72, 30, '72|30'),
(864, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 72, 31, '72|31'),
(865, NULL, NULL, 'skuwe21-variant-36-50', NULL, NULL, NULL, NULL, NULL, NULL, 73, 1, '73|1'),
(866, 'en', NULL, 'Variant 36 50', NULL, NULL, NULL, NULL, NULL, NULL, 73, 2, 'en|73|2'),
(867, 'en', NULL, 'skuwe21-variant-36-50', NULL, NULL, NULL, NULL, NULL, NULL, 73, 3, 'en|73|3'),
(868, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 73, 4, 'default|73|4'),
(869, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 73, 8, 'default|73|8'),
(870, 'en', NULL, 'skuwe21-variant-36-50', NULL, NULL, NULL, NULL, NULL, NULL, 73, 9, 'en|73|9'),
(871, 'en', NULL, 'skuwe21-variant-36-50', NULL, NULL, NULL, NULL, NULL, NULL, 73, 10, 'en|73|10'),
(872, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 73, 11, '73|11'),
(873, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 73, 22, '73|22'),
(874, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, 73, 30, '73|30'),
(875, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 73, 31, '73|31'),
(876, NULL, NULL, 'skuwe21-variant-37-50', NULL, NULL, NULL, NULL, NULL, NULL, 74, 1, '74|1'),
(877, 'en', NULL, 'Variant 37 50', NULL, NULL, NULL, NULL, NULL, NULL, 74, 2, 'en|74|2'),
(878, 'en', NULL, 'skuwe21-variant-37-50', NULL, NULL, NULL, NULL, NULL, NULL, 74, 3, 'en|74|3'),
(879, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 74, 4, 'default|74|4'),
(880, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 74, 8, 'default|74|8'),
(881, 'en', NULL, 'skuwe21-variant-37-50', NULL, NULL, NULL, NULL, NULL, NULL, 74, 9, 'en|74|9'),
(882, 'en', NULL, 'skuwe21-variant-37-50', NULL, NULL, NULL, NULL, NULL, NULL, 74, 10, 'en|74|10'),
(883, NULL, NULL, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 74, 11, '74|11'),
(884, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 74, 22, '74|22'),
(885, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, 74, 30, '74|30'),
(886, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 74, 31, '74|31'),
(887, NULL, NULL, 'skuwe21-variant-38-50', NULL, NULL, NULL, NULL, NULL, NULL, 75, 1, '75|1'),
(888, 'en', NULL, 'Variant 38 50', NULL, NULL, NULL, NULL, NULL, NULL, 75, 2, 'en|75|2'),
(889, 'en', NULL, 'skuwe21-variant-38-50', NULL, NULL, NULL, NULL, NULL, NULL, 75, 3, 'en|75|3'),
(890, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 75, 4, 'default|75|4'),
(891, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 75, 8, 'default|75|8'),
(892, 'en', NULL, 'skuwe21-variant-38-50', NULL, NULL, NULL, NULL, NULL, NULL, 75, 9, 'en|75|9'),
(893, 'en', NULL, 'skuwe21-variant-38-50', NULL, NULL, NULL, NULL, NULL, NULL, 75, 10, 'en|75|10'),
(894, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 75, 11, '75|11'),
(895, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 75, 22, '75|22'),
(896, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, 75, 30, '75|30'),
(897, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 75, 31, '75|31'),
(898, NULL, NULL, 'skuwe21-variant-39-50', NULL, NULL, NULL, NULL, NULL, NULL, 76, 1, '76|1'),
(899, 'en', NULL, 'Variant 39 50', NULL, NULL, NULL, NULL, NULL, NULL, 76, 2, 'en|76|2'),
(900, 'en', NULL, 'skuwe21-variant-39-50', NULL, NULL, NULL, NULL, NULL, NULL, 76, 3, 'en|76|3'),
(901, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 76, 4, 'default|76|4'),
(902, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 76, 8, 'default|76|8'),
(903, 'en', NULL, 'skuwe21-variant-39-50', NULL, NULL, NULL, NULL, NULL, NULL, 76, 9, 'en|76|9'),
(904, 'en', NULL, 'skuwe21-variant-39-50', NULL, NULL, NULL, NULL, NULL, NULL, 76, 10, 'en|76|10'),
(905, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 76, 11, '76|11'),
(906, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 76, 22, '76|22'),
(907, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, 76, 30, '76|30'),
(908, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 76, 31, '76|31'),
(909, NULL, NULL, 'skuwe21-variant-40-50', NULL, NULL, NULL, NULL, NULL, NULL, 77, 1, '77|1'),
(910, 'en', NULL, 'Variant 40 50', NULL, NULL, NULL, NULL, NULL, NULL, 77, 2, 'en|77|2'),
(911, 'en', NULL, 'skuwe21-variant-40-50', NULL, NULL, NULL, NULL, NULL, NULL, 77, 3, 'en|77|3'),
(912, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 77, 4, 'default|77|4'),
(913, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 77, 8, 'default|77|8'),
(914, 'en', NULL, 'skuwe21-variant-40-50', NULL, NULL, NULL, NULL, NULL, NULL, 77, 9, 'en|77|9'),
(915, 'en', NULL, 'skuwe21-variant-40-50', NULL, NULL, NULL, NULL, NULL, NULL, 77, 10, 'en|77|10'),
(916, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 77, 11, '77|11'),
(917, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 77, 22, '77|22'),
(918, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 77, 30, '77|30'),
(919, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 77, 31, '77|31'),
(920, NULL, NULL, 'skuwe21-variant-41-50', NULL, NULL, NULL, NULL, NULL, NULL, 78, 1, '78|1'),
(921, 'en', NULL, 'Variant 41 50', NULL, NULL, NULL, NULL, NULL, NULL, 78, 2, 'en|78|2'),
(922, 'en', NULL, 'skuwe21-variant-41-50', NULL, NULL, NULL, NULL, NULL, NULL, 78, 3, 'en|78|3'),
(923, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 78, 4, 'default|78|4'),
(924, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 78, 8, 'default|78|8'),
(925, 'en', NULL, 'skuwe21-variant-41-50', NULL, NULL, NULL, NULL, NULL, NULL, 78, 9, 'en|78|9'),
(926, 'en', NULL, 'skuwe21-variant-41-50', NULL, NULL, NULL, NULL, NULL, NULL, 78, 10, 'en|78|10'),
(927, NULL, NULL, NULL, NULL, NULL, 987.0000, NULL, NULL, NULL, 78, 11, '78|11'),
(928, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 78, 22, '78|22'),
(929, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, 78, 30, '78|30'),
(930, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 78, 31, '78|31'),
(931, NULL, NULL, 'skuwe21-variant-42-50', NULL, NULL, NULL, NULL, NULL, NULL, 79, 1, '79|1'),
(932, 'en', NULL, 'Variant 42 50', NULL, NULL, NULL, NULL, NULL, NULL, 79, 2, 'en|79|2'),
(933, 'en', NULL, 'skuwe21-variant-42-50', NULL, NULL, NULL, NULL, NULL, NULL, 79, 3, 'en|79|3'),
(934, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 79, 4, 'default|79|4'),
(935, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 79, 8, 'default|79|8'),
(936, 'en', NULL, 'skuwe21-variant-42-50', NULL, NULL, NULL, NULL, NULL, NULL, 79, 9, 'en|79|9'),
(937, 'en', NULL, 'skuwe21-variant-42-50', NULL, NULL, NULL, NULL, NULL, NULL, 79, 10, 'en|79|10'),
(938, NULL, NULL, NULL, NULL, NULL, 875.0000, NULL, NULL, NULL, 79, 11, '79|11'),
(939, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 79, 22, '79|22'),
(940, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, 79, 30, '79|30'),
(941, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 79, 31, '79|31'),
(942, NULL, NULL, 'skuwe21-variant-43-50', NULL, NULL, NULL, NULL, NULL, NULL, 80, 1, '80|1'),
(943, 'en', NULL, 'Variant 43 50', NULL, NULL, NULL, NULL, NULL, NULL, 80, 2, 'en|80|2'),
(944, 'en', NULL, 'skuwe21-variant-43-50', NULL, NULL, NULL, NULL, NULL, NULL, 80, 3, 'en|80|3'),
(945, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 80, 4, 'default|80|4'),
(946, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 80, 8, 'default|80|8'),
(947, 'en', NULL, 'skuwe21-variant-43-50', NULL, NULL, NULL, NULL, NULL, NULL, 80, 9, 'en|80|9'),
(948, 'en', NULL, 'skuwe21-variant-43-50', NULL, NULL, NULL, NULL, NULL, NULL, 80, 10, 'en|80|10'),
(949, NULL, NULL, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 80, 11, '80|11'),
(950, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 80, 22, '80|22'),
(951, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, 80, 30, '80|30'),
(952, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 80, 31, '80|31'),
(953, NULL, NULL, 'skuwe21-variant-44-50', NULL, NULL, NULL, NULL, NULL, NULL, 81, 1, '81|1'),
(954, 'en', NULL, 'Variant 44 50', NULL, NULL, NULL, NULL, NULL, NULL, 81, 2, 'en|81|2'),
(955, 'en', NULL, 'skuwe21-variant-44-50', NULL, NULL, NULL, NULL, NULL, NULL, 81, 3, 'en|81|3'),
(956, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 81, 4, 'default|81|4'),
(957, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 81, 8, 'default|81|8'),
(958, 'en', NULL, 'skuwe21-variant-44-50', NULL, NULL, NULL, NULL, NULL, NULL, 81, 9, 'en|81|9'),
(959, 'en', NULL, 'skuwe21-variant-44-50', NULL, NULL, NULL, NULL, NULL, NULL, 81, 10, 'en|81|10'),
(960, NULL, NULL, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 81, 11, '81|11'),
(961, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 81, 22, '81|22'),
(962, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, 81, 30, '81|30'),
(963, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 81, 31, '81|31'),
(964, NULL, NULL, 'skuwe21-variant-45-50', NULL, NULL, NULL, NULL, NULL, NULL, 82, 1, '82|1'),
(965, 'en', NULL, 'Variant 45 50', NULL, NULL, NULL, NULL, NULL, NULL, 82, 2, 'en|82|2'),
(966, 'en', NULL, 'skuwe21-variant-45-50', NULL, NULL, NULL, NULL, NULL, NULL, 82, 3, 'en|82|3'),
(967, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 82, 4, 'default|82|4'),
(968, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 82, 8, 'default|82|8'),
(969, 'en', NULL, 'skuwe21-variant-45-50', NULL, NULL, NULL, NULL, NULL, NULL, 82, 9, 'en|82|9'),
(970, 'en', NULL, 'skuwe21-variant-45-50', NULL, NULL, NULL, NULL, NULL, NULL, 82, 10, 'en|82|10'),
(971, NULL, NULL, NULL, NULL, NULL, 866.0000, NULL, NULL, NULL, 82, 11, '82|11'),
(972, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 82, 22, '82|22'),
(973, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, 82, 30, '82|30'),
(974, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 82, 31, '82|31'),
(975, NULL, NULL, 'skuwe21-variant-46-50', NULL, NULL, NULL, NULL, NULL, NULL, 83, 1, '83|1'),
(976, 'en', NULL, 'Variant 46 50', NULL, NULL, NULL, NULL, NULL, NULL, 83, 2, 'en|83|2'),
(977, 'en', NULL, 'skuwe21-variant-46-50', NULL, NULL, NULL, NULL, NULL, NULL, 83, 3, 'en|83|3'),
(978, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 83, 4, 'default|83|4'),
(979, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 83, 8, 'default|83|8'),
(980, 'en', NULL, 'skuwe21-variant-46-50', NULL, NULL, NULL, NULL, NULL, NULL, 83, 9, 'en|83|9'),
(981, 'en', NULL, 'skuwe21-variant-46-50', NULL, NULL, NULL, NULL, NULL, NULL, 83, 10, 'en|83|10'),
(982, NULL, NULL, NULL, NULL, NULL, 654.0000, NULL, NULL, NULL, 83, 11, '83|11'),
(983, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 83, 22, '83|22'),
(984, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, 83, 30, '83|30'),
(985, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 83, 31, '83|31'),
(986, NULL, NULL, 'skuwe21-variant-47-50', NULL, NULL, NULL, NULL, NULL, NULL, 84, 1, '84|1'),
(987, 'en', NULL, 'Variant 47 50', NULL, NULL, NULL, NULL, NULL, NULL, 84, 2, 'en|84|2'),
(988, 'en', NULL, 'skuwe21-variant-47-50', NULL, NULL, NULL, NULL, NULL, NULL, 84, 3, 'en|84|3'),
(989, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 84, 4, 'default|84|4'),
(990, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 84, 8, 'default|84|8'),
(991, 'en', NULL, 'skuwe21-variant-47-50', NULL, NULL, NULL, NULL, NULL, NULL, 84, 9, 'en|84|9'),
(992, 'en', NULL, 'skuwe21-variant-47-50', NULL, NULL, NULL, NULL, NULL, NULL, 84, 10, 'en|84|10'),
(993, NULL, NULL, NULL, NULL, NULL, 647.0000, NULL, NULL, NULL, 84, 11, '84|11'),
(994, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 84, 22, '84|22'),
(995, NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, 84, 30, '84|30'),
(996, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 84, 31, '84|31'),
(997, NULL, NULL, 'skuwe21-variant-48-50', NULL, NULL, NULL, NULL, NULL, NULL, 85, 1, '85|1'),
(998, 'en', NULL, 'Variant 48 50', NULL, NULL, NULL, NULL, NULL, NULL, 85, 2, 'en|85|2'),
(999, 'en', NULL, 'skuwe21-variant-48-50', NULL, NULL, NULL, NULL, NULL, NULL, 85, 3, 'en|85|3'),
(1000, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 85, 4, 'default|85|4'),
(1001, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 85, 8, 'default|85|8'),
(1002, 'en', NULL, 'skuwe21-variant-48-50', NULL, NULL, NULL, NULL, NULL, NULL, 85, 9, 'en|85|9'),
(1003, 'en', NULL, 'skuwe21-variant-48-50', NULL, NULL, NULL, NULL, NULL, NULL, 85, 10, 'en|85|10'),
(1004, NULL, NULL, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 85, 11, '85|11'),
(1005, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 85, 22, '85|22'),
(1006, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, 85, 30, '85|30'),
(1007, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 85, 31, '85|31'),
(1008, 'en', NULL, '<h2 class=\"product-title\">Animal Theme cake &ndash; 3Kg</h2>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9, 'en|13|9'),
(1009, 'en', NULL, '<h2 class=\"product-title\">Animal Theme cake &ndash; 3Kg</h2>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10, 'en|13|10'),
(1010, NULL, NULL, 'skuwe21', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '13|1'),
(1011, 'en', NULL, 'Animal Theme cake – 3Kg', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'en|13|2'),
(1012, 'en', NULL, 'animal-theme-cake-3kg', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3, 'en|13|3'),
(1013, NULL, NULL, '00063', NULL, NULL, NULL, NULL, NULL, NULL, 13, 27, '13|27'),
(1014, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 13, 29, '13|29'),
(1015, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 28, 'default|13|28'),
(1016, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16, 'en|13|16'),
(1017, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17, 'en|13|17'),
(1018, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18, 'en|13|18'),
(1019, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5, '13|5'),
(1020, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6, '13|6'),
(1021, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7, '13|7'),
(1022, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8, 'default|13|8'),
(1023, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 26, '13|26');

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_options`
--

CREATE TABLE `product_bundle_options` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_products`
--

CREATE TABLE `product_bundle_option_products` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_translations`
--

CREATE TABLE `product_bundle_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(7, 2),
(9, 2),
(13, 2),
(1, 3),
(4, 3),
(5, 3),
(9, 3),
(13, 3),
(6, 4),
(9, 4),
(13, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29);

-- --------------------------------------------------------

--
-- Table structure for table `product_channels`
--

CREATE TABLE `product_channels` (
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_channels`
--

INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_cross_sells`
--

INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES
(3, 1),
(13, 1),
(3, 2),
(13, 2),
(13, 3),
(3, 6),
(13, 6),
(3, 9),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_prices`
--

CREATE TABLE `product_customer_group_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_links`
--

CREATE TABLE `product_downloadable_links` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_link_translations`
--

CREATE TABLE `product_downloadable_link_translations` (
  `id` int UNSIGNED NOT NULL,
  `product_downloadable_link_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_samples`
--

CREATE TABLE `product_downloadable_samples` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_sample_translations`
--

CREATE TABLE `product_downloadable_sample_translations` (
  `id` int UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_flat`
--

CREATE TABLE `product_flat` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_flat`
--

INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
(1, '001', 'simple', '0001', 'Animal Party Cake', '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', 'animal-party-cake', 1, 1, 1, 'Animal Party Cake', 'Animal Party Cake', 'Animal Party Cake', 100.0000, NULL, NULL, NULL, 0.5000, '2025-03-26 16:00:03', 'en', 'default', 1, 1, '2025-04-14 10:24:52', NULL, 1),
(2, '002', 'simple', '0002', 'Jungle theme pink Cake', '<p>This pink jungle theme cake is the key to your kid\'s happiness. It comes with handcrafted fondant animals and beautiful pink leaves. This decadent and adorable cake will make your little one\'s party a hit.</p>', '<p>This pink jungle theme cake is the key to your kid\'s happiness. It comes with handcrafted fondant animals and beautiful pink leaves. This decadent and adorable cake will make your little one\'s party a hit.</p>', 'jungle-theme-pink-cake', 1, 1, 1, 'Jungle theme pink Cake', 'Jungle theme pink Cake', 'Jungle theme pink Cake', 99.0000, NULL, NULL, NULL, 0.5000, '2025-03-26 16:04:51', 'en', 'default', 1, 2, '2025-04-24 17:20:25', NULL, 1),
(3, '003', 'simple', '0003', 'Minimal Forest Cake', '<p>Animals are kids first best friends and the kind of joy they bring in their life is so lovable to see. This cake is best for your kids initial birthdays where they can feel them coming to life in the form of a cake</p>', '<p>Animals are kids first best friends and the kind of joy they bring in their life is so lovable to see. This cake is best for your kids initial birthdays where they can feel them coming to life in the form of a cake</p>', 'minimal-forest-cake', 1, 1, 1, 'Minimal Forest Cake', 'Minimal Forest Cake', 'Minimal Forest Cake', 150.0000, 130.0000, '2025-04-06', '2025-04-11', 0.5000, '2025-03-26 16:07:49', 'en', 'default', 1, 3, '2025-04-10 17:06:01', NULL, 1),
(4, '004', 'simple', '0004', 'Pastry Pack of 4', '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', '<p>This animal party cake is delicious, fun and everything you need to make your kid\'s birthday memorable. It comes with handcrafted fondant animals and trees and can be customized to suit your taste.</p>', 'pastry-pack-of-4', 1, 1, 1, 'Pastry Pack of 4', 'Pastry Pack of 4', '', 65.0000, NULL, NULL, NULL, 0.5000, '2025-03-26 16:09:59', 'en', 'default', 1, 4, '2025-03-26 16:11:50', NULL, 1),
(5, '005', 'simple', '0005', 'Pineapple Pastry [Pack of 2]', '<p>A typical Hawaiian cake made with chopped pineapple inside. The pulp of real pineapple leaves a freshness of taste which makes the occasion all the more wonderful. A pineapple is the result of many flowers whose fruitlets have joined around the core</p>', '<p>A typical Hawaiian cake made with chopped pineapple inside. The pulp of real pineapple leaves a freshness of taste which makes the occasion all the more wonderful. A pineapple is the result of many flowers whose fruitlets have joined around the core</p>', 'pineapple-pastry-pack-of-2', 1, 1, 1, 'Pineapple Pastry [Pack of 2]', 'Pineapple Pastry [Pack of 2]', '', 79.0000, NULL, NULL, NULL, 0.5000, '2025-03-26 16:12:37', 'en', 'default', 1, 5, '2025-03-26 16:14:49', NULL, 1),
(6, '006', 'simple', '0006', 'Heart Shape Photo Cake', '<div class=\"product__description rte quick-add-hidden\">\r\n<div id=\"descriptionContainer\">\r\n<div id=\"descriptionText\" class=\"collapsed\">\r\n<p>A Custom photo cake with a pretty background. You can share your image which will be used to put in the placeholder image</p>\r\n</div>\r\n</div>\r\n</div>', '<div class=\"product__description rte quick-add-hidden\">\r\n<div id=\"descriptionContainer\">\r\n<div id=\"descriptionText\" class=\"collapsed\">\r\n<p>A Custom photo cake with a pretty background. You can share your image which will be used to put in the placeholder image</p>\r\n</div>\r\n</div>\r\n</div>', 'heart-shape-photo-cake', 1, 1, 1, 'Heart Shape Anniversary Photo Cake', 'Heart Shape Anniversary Photo Cake', 'Heart Shape Anniversary Photo Cake', 200.0000, NULL, NULL, NULL, 0.5000, '2025-03-26 16:16:04', 'en', 'default', 1, 6, '2025-04-14 10:34:23', NULL, 1),
(7, 'sku', 'simple', '001', 'Test', '<p>Test desc</p>', '<p>Test mIN DESC</p>', 'test', 0, 0, 1, '', '', '', 100.0000, 90.0000, NULL, NULL, 0.5000, '2025-04-09 13:17:20', 'en', 'default', 1, 7, '2025-04-09 13:24:59', NULL, 1),
(9, 'skuss', 'configurable', '0002s', 'Jungle theme pink Cakes', '<p>ss</p>', '<p>s</p>', 'jungle-theme-pink-cakes', 1, 1, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, '2025-04-10 09:49:50', 'en', 'default', 1, 9, '2025-04-10 09:52:43', NULL, 1),
(10, 'skuss-variant-10', 'simple', NULL, 'Variant 10', 'skuss-variant-10', 'skuss-variant-10', 'skuss-variant-10', NULL, NULL, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 09:49:50', 'en', 'default', 1, 10, '2025-04-10 09:52:43', NULL, NULL),
(11, 'skuss-variant-11', 'simple', NULL, 'Variant 11', 'skuss-variant-11', 'skuss-variant-11', 'skuss-variant-11', NULL, NULL, 1, NULL, NULL, NULL, 120.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 09:49:50', 'en', 'default', 1, 11, '2025-04-10 09:52:43', NULL, NULL),
(12, 'skuss-variant-12', 'simple', NULL, 'Variant 12', 'skuss-variant-12', 'skuss-variant-12', 'skuss-variant-12', NULL, NULL, 1, NULL, NULL, NULL, 99.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 09:49:50', 'en', 'default', 1, 12, '2025-04-10 09:52:43', NULL, NULL),
(13, 'skuwe21', 'configurable', '00063', 'Animal Theme cake – 3Kg', '<h2 class=\"product-title\">Animal Theme cake &ndash; 3Kg</h2>', '<h2 class=\"product-title\">Animal Theme cake &ndash; 3Kg</h2>', 'animal-theme-cake-3kg', 1, 1, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, '2025-04-10 15:35:42', 'en', 'default', 1, 13, '2025-04-10 15:42:14', NULL, 1),
(14, 'skuwe21-variant-13-49', 'simple', NULL, 'Variant 13 49', 'skuwe21-variant-13-49', 'skuwe21-variant-13-49', 'skuwe21-variant-13-49', NULL, NULL, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 14, '2025-04-10 17:52:30', NULL, NULL),
(15, 'skuwe21-variant-14-49', 'simple', NULL, 'Variant 14 49', 'skuwe21-variant-14-49', 'skuwe21-variant-14-49', 'skuwe21-variant-14-49', NULL, NULL, 1, NULL, NULL, NULL, 90.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 15, '2025-04-10 17:52:30', NULL, NULL),
(16, 'skuwe21-variant-15-49', 'simple', NULL, 'Variant 15 49', 'skuwe21-variant-15-49', 'skuwe21-variant-15-49', 'skuwe21-variant-15-49', NULL, NULL, 1, NULL, NULL, NULL, 80.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 16, '2025-04-10 17:52:30', NULL, NULL),
(17, 'skuwe21-variant-16-49', 'simple', NULL, 'Variant 16 49', 'skuwe21-variant-16-49', 'skuwe21-variant-16-49', 'skuwe21-variant-16-49', NULL, NULL, 1, NULL, NULL, NULL, 34.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 17, '2025-04-10 17:52:30', NULL, NULL),
(18, 'skuwe21-variant-17-49', 'simple', NULL, 'Variant 17 49', 'skuwe21-variant-17-49', 'skuwe21-variant-17-49', 'skuwe21-variant-17-49', NULL, NULL, 1, NULL, NULL, NULL, 57.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 18, '2025-04-10 17:52:30', NULL, NULL),
(19, 'skuwe21-variant-18-49', 'simple', NULL, 'Variant 18 49', 'skuwe21-variant-18-49', 'skuwe21-variant-18-49', 'skuwe21-variant-18-49', NULL, NULL, 1, NULL, NULL, NULL, 78.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 19, '2025-04-10 17:52:30', NULL, NULL),
(20, 'skuwe21-variant-19-49', 'simple', NULL, 'Variant 19 49', 'skuwe21-variant-19-49', 'skuwe21-variant-19-49', 'skuwe21-variant-19-49', NULL, NULL, 1, NULL, NULL, NULL, 98.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 20, '2025-04-10 17:52:30', NULL, NULL),
(21, 'skuwe21-variant-20-49', 'simple', NULL, 'Variant 20 49', 'skuwe21-variant-20-49', 'skuwe21-variant-20-49', 'skuwe21-variant-20-49', NULL, NULL, 1, NULL, NULL, NULL, 97.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 21, '2025-04-10 17:52:30', NULL, NULL),
(22, 'skuwe21-variant-21-49', 'simple', NULL, 'Variant 21 49', 'skuwe21-variant-21-49', 'skuwe21-variant-21-49', 'skuwe21-variant-21-49', NULL, NULL, 1, NULL, NULL, NULL, 95.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 22, '2025-04-10 17:52:30', NULL, NULL),
(23, 'skuwe21-variant-22-49', 'simple', NULL, 'Variant 22 49', 'skuwe21-variant-22-49', 'skuwe21-variant-22-49', 'skuwe21-variant-22-49', NULL, NULL, 1, NULL, NULL, NULL, 93.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 23, '2025-04-10 17:52:30', NULL, NULL),
(24, 'skuwe21-variant-23-49', 'simple', NULL, 'Variant 23 49', 'skuwe21-variant-23-49', 'skuwe21-variant-23-49', 'skuwe21-variant-23-49', NULL, NULL, 1, NULL, NULL, NULL, 78.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 24, '2025-04-10 17:52:30', NULL, NULL),
(25, 'skuwe21-variant-24-49', 'simple', NULL, 'Variant 24 49', 'skuwe21-variant-24-49', 'skuwe21-variant-24-49', 'skuwe21-variant-24-49', NULL, NULL, 1, NULL, NULL, NULL, 65.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 25, '2025-04-10 17:52:30', NULL, NULL),
(26, 'skuwe21-variant-25-49', 'simple', NULL, 'Variant 25 49', 'skuwe21-variant-25-49', 'skuwe21-variant-25-49', 'skuwe21-variant-25-49', NULL, NULL, 1, NULL, NULL, NULL, 87.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 26, '2025-04-10 17:52:30', NULL, NULL),
(27, 'skuwe21-variant-26-49', 'simple', NULL, 'Variant 26 49', 'skuwe21-variant-26-49', 'skuwe21-variant-26-49', 'skuwe21-variant-26-49', NULL, NULL, 1, NULL, NULL, NULL, 48.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 27, '2025-04-10 17:52:30', NULL, NULL),
(28, 'skuwe21-variant-27-49', 'simple', NULL, 'Variant 27 49', 'skuwe21-variant-27-49', 'skuwe21-variant-27-49', 'skuwe21-variant-27-49', NULL, NULL, 1, NULL, NULL, NULL, 56.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 28, '2025-04-10 17:52:30', NULL, NULL),
(29, 'skuwe21-variant-28-49', 'simple', NULL, 'Variant 28 49', 'skuwe21-variant-28-49', 'skuwe21-variant-28-49', 'skuwe21-variant-28-49', NULL, NULL, 1, NULL, NULL, NULL, 82.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 29, '2025-04-10 17:52:30', NULL, NULL),
(30, 'skuwe21-variant-29-49', 'simple', NULL, 'Variant 29 49', 'skuwe21-variant-29-49', 'skuwe21-variant-29-49', 'skuwe21-variant-29-49', NULL, NULL, 1, NULL, NULL, NULL, 109.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 30, '2025-04-10 17:52:30', NULL, NULL),
(31, 'skuwe21-variant-30-49', 'simple', NULL, 'Variant 30 49', 'skuwe21-variant-30-49', 'skuwe21-variant-30-49', 'skuwe21-variant-30-49', NULL, NULL, 1, NULL, NULL, NULL, 102.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 31, '2025-04-10 17:52:30', NULL, NULL),
(32, 'skuwe21-variant-31-49', 'simple', NULL, 'Variant 31 49', 'skuwe21-variant-31-49', 'skuwe21-variant-31-49', 'skuwe21-variant-31-49', NULL, NULL, 1, NULL, NULL, NULL, 103.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 32, '2025-04-10 17:52:30', NULL, NULL),
(33, 'skuwe21-variant-32-49', 'simple', NULL, 'Variant 32 49', 'skuwe21-variant-32-49', 'skuwe21-variant-32-49', 'skuwe21-variant-32-49', NULL, NULL, 1, NULL, NULL, NULL, 194.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 33, '2025-04-10 17:52:30', NULL, NULL),
(34, 'skuwe21-variant-33-49', 'simple', NULL, 'Variant 33 49', 'skuwe21-variant-33-49', 'skuwe21-variant-33-49', 'skuwe21-variant-33-49', NULL, NULL, 1, NULL, NULL, NULL, 760.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 34, '2025-04-10 17:52:30', NULL, NULL),
(35, 'skuwe21-variant-34-49', 'simple', NULL, 'Variant 34 49', 'skuwe21-variant-34-49', 'skuwe21-variant-34-49', 'skuwe21-variant-34-49', NULL, NULL, 1, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 35, '2025-04-10 17:52:30', NULL, NULL),
(36, 'skuwe21-variant-35-49', 'simple', NULL, 'Variant 35 49', 'skuwe21-variant-35-49', 'skuwe21-variant-35-49', 'skuwe21-variant-35-49', NULL, NULL, 1, NULL, NULL, NULL, 410.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 36, '2025-04-10 17:52:30', NULL, NULL),
(37, 'skuwe21-variant-36-49', 'simple', NULL, 'Variant 36 49', 'skuwe21-variant-36-49', 'skuwe21-variant-36-49', 'skuwe21-variant-36-49', NULL, NULL, 1, NULL, NULL, NULL, 128.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 37, '2025-04-10 17:52:31', NULL, NULL),
(38, 'skuwe21-variant-37-49', 'simple', NULL, 'Variant 37 49', 'skuwe21-variant-37-49', 'skuwe21-variant-37-49', 'skuwe21-variant-37-49', NULL, NULL, 1, NULL, NULL, NULL, 127.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 38, '2025-04-10 17:52:31', NULL, NULL),
(39, 'skuwe21-variant-38-49', 'simple', NULL, 'Variant 38 49', 'skuwe21-variant-38-49', 'skuwe21-variant-38-49', 'skuwe21-variant-38-49', NULL, NULL, 1, NULL, NULL, NULL, 138.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 39, '2025-04-10 17:52:31', NULL, NULL),
(40, 'skuwe21-variant-39-49', 'simple', NULL, 'Variant 39 49', 'skuwe21-variant-39-49', 'skuwe21-variant-39-49', 'skuwe21-variant-39-49', NULL, NULL, 1, NULL, NULL, NULL, 134.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 40, '2025-04-10 17:52:31', NULL, NULL),
(41, 'skuwe21-variant-40-49', 'simple', NULL, 'Variant 40 49', 'skuwe21-variant-40-49', 'skuwe21-variant-40-49', 'skuwe21-variant-40-49', NULL, NULL, 1, NULL, NULL, NULL, 130.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 41, '2025-04-10 17:52:31', NULL, NULL),
(42, 'skuwe21-variant-41-49', 'simple', NULL, 'Variant 41 49', 'skuwe21-variant-41-49', 'skuwe21-variant-41-49', 'skuwe21-variant-41-49', NULL, NULL, 1, NULL, NULL, NULL, 148.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 42, '2025-04-10 17:52:31', NULL, NULL),
(43, 'skuwe21-variant-42-49', 'simple', NULL, 'Variant 42 49', 'skuwe21-variant-42-49', 'skuwe21-variant-42-49', 'skuwe21-variant-42-49', NULL, NULL, 1, NULL, NULL, NULL, 134.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 43, '2025-04-10 17:52:31', NULL, NULL),
(44, 'skuwe21-variant-43-49', 'simple', NULL, 'Variant 43 49', 'skuwe21-variant-43-49', 'skuwe21-variant-43-49', 'skuwe21-variant-43-49', NULL, NULL, 1, NULL, NULL, NULL, 231.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 44, '2025-04-10 17:52:31', NULL, NULL),
(45, 'skuwe21-variant-44-49', 'simple', NULL, 'Variant 44 49', 'skuwe21-variant-44-49', 'skuwe21-variant-44-49', 'skuwe21-variant-44-49', NULL, NULL, 1, NULL, NULL, NULL, 234.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 45, '2025-04-10 17:52:31', NULL, NULL),
(46, 'skuwe21-variant-45-49', 'simple', NULL, 'Variant 45 49', 'skuwe21-variant-45-49', 'skuwe21-variant-45-49', 'skuwe21-variant-45-49', NULL, NULL, 1, NULL, NULL, NULL, 235.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 46, '2025-04-10 17:52:31', NULL, NULL),
(47, 'skuwe21-variant-46-49', 'simple', NULL, 'Variant 46 49', 'skuwe21-variant-46-49', 'skuwe21-variant-46-49', 'skuwe21-variant-46-49', NULL, NULL, 1, NULL, NULL, NULL, 248.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 47, '2025-04-10 17:52:31', NULL, NULL),
(48, 'skuwe21-variant-47-49', 'simple', NULL, 'Variant 47 49', 'skuwe21-variant-47-49', 'skuwe21-variant-47-49', 'skuwe21-variant-47-49', NULL, NULL, 1, NULL, NULL, NULL, 240.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 48, '2025-04-10 17:52:31', NULL, NULL),
(49, 'skuwe21-variant-48-49', 'simple', NULL, 'Variant 48 49', 'skuwe21-variant-48-49', 'skuwe21-variant-48-49', 'skuwe21-variant-48-49', NULL, NULL, 1, NULL, NULL, NULL, 900.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 49, '2025-04-10 17:52:31', NULL, NULL),
(50, 'skuwe21-variant-13-50', 'simple', NULL, 'Variant 13 50', 'skuwe21-variant-13-50', 'skuwe21-variant-13-50', 'skuwe21-variant-13-50', NULL, NULL, 1, NULL, NULL, NULL, 800.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 50, '2025-04-10 17:52:31', NULL, NULL),
(51, 'skuwe21-variant-14-50', 'simple', NULL, 'Variant 14 50', 'skuwe21-variant-14-50', 'skuwe21-variant-14-50', 'skuwe21-variant-14-50', NULL, NULL, 1, NULL, NULL, NULL, 700.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 51, '2025-04-10 17:52:31', NULL, NULL),
(52, 'skuwe21-variant-15-50', 'simple', NULL, 'Variant 15 50', 'skuwe21-variant-15-50', 'skuwe21-variant-15-50', 'skuwe21-variant-15-50', NULL, NULL, 1, NULL, NULL, NULL, 300.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:42', 'en', 'default', 1, 52, '2025-04-10 17:52:31', NULL, NULL),
(53, 'skuwe21-variant-16-50', 'simple', NULL, 'Variant 16 50', 'skuwe21-variant-16-50', 'skuwe21-variant-16-50', 'skuwe21-variant-16-50', NULL, NULL, 1, NULL, NULL, NULL, 400.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 53, '2025-04-10 17:52:31', NULL, NULL),
(54, 'skuwe21-variant-17-50', 'simple', NULL, 'Variant 17 50', 'skuwe21-variant-17-50', 'skuwe21-variant-17-50', 'skuwe21-variant-17-50', NULL, NULL, 1, NULL, NULL, NULL, 200.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 54, '2025-04-10 17:52:31', NULL, NULL),
(55, 'skuwe21-variant-18-50', 'simple', NULL, 'Variant 18 50', 'skuwe21-variant-18-50', 'skuwe21-variant-18-50', 'skuwe21-variant-18-50', NULL, NULL, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 55, '2025-04-10 17:52:31', NULL, NULL),
(56, 'skuwe21-variant-19-50', 'simple', NULL, 'Variant 19 50', 'skuwe21-variant-19-50', 'skuwe21-variant-19-50', 'skuwe21-variant-19-50', NULL, NULL, 1, NULL, NULL, NULL, 129.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 56, '2025-04-10 17:52:31', NULL, NULL),
(57, 'skuwe21-variant-20-50', 'simple', NULL, 'Variant 20 50', 'skuwe21-variant-20-50', 'skuwe21-variant-20-50', 'skuwe21-variant-20-50', NULL, NULL, 1, NULL, NULL, NULL, 230.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 57, '2025-04-10 17:52:31', NULL, NULL),
(58, 'skuwe21-variant-21-50', 'simple', NULL, 'Variant 21 50', 'skuwe21-variant-21-50', 'skuwe21-variant-21-50', 'skuwe21-variant-21-50', NULL, NULL, 1, NULL, NULL, NULL, 1234.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 58, '2025-04-10 17:52:31', NULL, NULL),
(59, 'skuwe21-variant-22-50', 'simple', NULL, 'Variant 22 50', 'skuwe21-variant-22-50', 'skuwe21-variant-22-50', 'skuwe21-variant-22-50', NULL, NULL, 1, NULL, NULL, NULL, 123.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 59, '2025-04-10 17:52:31', NULL, NULL),
(60, 'skuwe21-variant-23-50', 'simple', NULL, 'Variant 23 50', 'skuwe21-variant-23-50', 'skuwe21-variant-23-50', 'skuwe21-variant-23-50', NULL, NULL, 1, NULL, NULL, NULL, 154.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 60, '2025-04-10 17:52:31', NULL, NULL),
(61, 'skuwe21-variant-24-50', 'simple', NULL, 'Variant 24 50', 'skuwe21-variant-24-50', 'skuwe21-variant-24-50', 'skuwe21-variant-24-50', NULL, NULL, 1, NULL, NULL, NULL, 235.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 61, '2025-04-10 17:52:31', NULL, NULL),
(62, 'skuwe21-variant-25-50', 'simple', NULL, 'Variant 25 50', 'skuwe21-variant-25-50', 'skuwe21-variant-25-50', 'skuwe21-variant-25-50', NULL, NULL, 1, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 62, '2025-04-10 17:52:31', NULL, NULL),
(63, 'skuwe21-variant-26-50', 'simple', NULL, 'Variant 26 50', 'skuwe21-variant-26-50', 'skuwe21-variant-26-50', 'skuwe21-variant-26-50', NULL, NULL, 1, NULL, NULL, NULL, 654.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 63, '2025-04-10 17:52:31', NULL, NULL),
(64, 'skuwe21-variant-27-50', 'simple', NULL, 'Variant 27 50', 'skuwe21-variant-27-50', 'skuwe21-variant-27-50', 'skuwe21-variant-27-50', NULL, NULL, 1, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 64, '2025-04-10 17:52:31', NULL, NULL),
(65, 'skuwe21-variant-28-50', 'simple', NULL, 'Variant 28 50', 'skuwe21-variant-28-50', 'skuwe21-variant-28-50', 'skuwe21-variant-28-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 65, '2025-04-10 17:52:31', NULL, NULL),
(66, 'skuwe21-variant-29-50', 'simple', NULL, 'Variant 29 50', 'skuwe21-variant-29-50', 'skuwe21-variant-29-50', 'skuwe21-variant-29-50', NULL, NULL, 1, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 66, '2025-04-10 17:52:31', NULL, NULL),
(67, 'skuwe21-variant-30-50', 'simple', NULL, 'Variant 30 50', 'skuwe21-variant-30-50', 'skuwe21-variant-30-50', 'skuwe21-variant-30-50', NULL, NULL, 1, NULL, NULL, NULL, 543.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 67, '2025-04-10 17:52:31', NULL, NULL),
(68, 'skuwe21-variant-31-50', 'simple', NULL, 'Variant 31 50', 'skuwe21-variant-31-50', 'skuwe21-variant-31-50', 'skuwe21-variant-31-50', NULL, NULL, 1, NULL, NULL, NULL, 560.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 68, '2025-04-10 17:52:31', NULL, NULL),
(69, 'skuwe21-variant-32-50', 'simple', NULL, 'Variant 32 50', 'skuwe21-variant-32-50', 'skuwe21-variant-32-50', 'skuwe21-variant-32-50', NULL, NULL, 1, NULL, NULL, NULL, 652.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 69, '2025-04-10 17:52:31', NULL, NULL),
(70, 'skuwe21-variant-33-50', 'simple', NULL, 'Variant 33 50', 'skuwe21-variant-33-50', 'skuwe21-variant-33-50', 'skuwe21-variant-33-50', NULL, NULL, 1, NULL, NULL, NULL, 496.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 70, '2025-04-10 17:52:31', NULL, NULL),
(71, 'skuwe21-variant-34-50', 'simple', NULL, 'Variant 34 50', 'skuwe21-variant-34-50', 'skuwe21-variant-34-50', 'skuwe21-variant-34-50', NULL, NULL, 1, NULL, NULL, NULL, 47.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 71, '2025-04-10 17:52:31', NULL, NULL),
(72, 'skuwe21-variant-35-50', 'simple', NULL, 'Variant 35 50', 'skuwe21-variant-35-50', 'skuwe21-variant-35-50', 'skuwe21-variant-35-50', NULL, NULL, 1, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 72, '2025-04-10 17:52:31', NULL, NULL),
(73, 'skuwe21-variant-36-50', 'simple', NULL, 'Variant 36 50', 'skuwe21-variant-36-50', 'skuwe21-variant-36-50', 'skuwe21-variant-36-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 73, '2025-04-10 17:52:31', NULL, NULL),
(74, 'skuwe21-variant-37-50', 'simple', NULL, 'Variant 37 50', 'skuwe21-variant-37-50', 'skuwe21-variant-37-50', 'skuwe21-variant-37-50', NULL, NULL, 1, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 74, '2025-04-10 17:52:31', NULL, NULL),
(75, 'skuwe21-variant-38-50', 'simple', NULL, 'Variant 38 50', 'skuwe21-variant-38-50', 'skuwe21-variant-38-50', 'skuwe21-variant-38-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 75, '2025-04-10 17:52:31', NULL, NULL),
(76, 'skuwe21-variant-39-50', 'simple', NULL, 'Variant 39 50', 'skuwe21-variant-39-50', 'skuwe21-variant-39-50', 'skuwe21-variant-39-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 76, '2025-04-10 17:52:31', NULL, NULL),
(77, 'skuwe21-variant-40-50', 'simple', NULL, 'Variant 40 50', 'skuwe21-variant-40-50', 'skuwe21-variant-40-50', 'skuwe21-variant-40-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 77, '2025-04-10 17:52:31', NULL, NULL),
(78, 'skuwe21-variant-41-50', 'simple', NULL, 'Variant 41 50', 'skuwe21-variant-41-50', 'skuwe21-variant-41-50', 'skuwe21-variant-41-50', NULL, NULL, 1, NULL, NULL, NULL, 987.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 78, '2025-04-10 17:52:31', NULL, NULL),
(79, 'skuwe21-variant-42-50', 'simple', NULL, 'Variant 42 50', 'skuwe21-variant-42-50', 'skuwe21-variant-42-50', 'skuwe21-variant-42-50', NULL, NULL, 1, NULL, NULL, NULL, 875.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 79, '2025-04-10 17:52:31', NULL, NULL),
(80, 'skuwe21-variant-43-50', 'simple', NULL, 'Variant 43 50', 'skuwe21-variant-43-50', 'skuwe21-variant-43-50', 'skuwe21-variant-43-50', NULL, NULL, 1, NULL, NULL, NULL, 456.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 80, '2025-04-10 17:52:31', NULL, NULL),
(81, 'skuwe21-variant-44-50', 'simple', NULL, 'Variant 44 50', 'skuwe21-variant-44-50', 'skuwe21-variant-44-50', 'skuwe21-variant-44-50', NULL, NULL, 1, NULL, NULL, NULL, 876.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 81, '2025-04-10 17:52:31', NULL, NULL),
(82, 'skuwe21-variant-45-50', 'simple', NULL, 'Variant 45 50', 'skuwe21-variant-45-50', 'skuwe21-variant-45-50', 'skuwe21-variant-45-50', NULL, NULL, 1, NULL, NULL, NULL, 866.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 82, '2025-04-10 17:52:31', NULL, NULL),
(83, 'skuwe21-variant-46-50', 'simple', NULL, 'Variant 46 50', 'skuwe21-variant-46-50', 'skuwe21-variant-46-50', 'skuwe21-variant-46-50', NULL, NULL, 1, NULL, NULL, NULL, 654.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 83, '2025-04-10 17:52:31', NULL, NULL),
(84, 'skuwe21-variant-47-50', 'simple', NULL, 'Variant 47 50', 'skuwe21-variant-47-50', 'skuwe21-variant-47-50', 'skuwe21-variant-47-50', NULL, NULL, 1, NULL, NULL, NULL, 647.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 84, '2025-04-10 17:52:31', NULL, NULL),
(85, 'skuwe21-variant-48-50', 'simple', NULL, 'Variant 48 50', 'skuwe21-variant-48-50', 'skuwe21-variant-48-50', 'skuwe21-variant-48-50', NULL, NULL, 1, NULL, NULL, NULL, 765.0000, NULL, NULL, NULL, 0.5000, '2025-04-10 15:35:43', 'en', 'default', 1, 85, '2025-04-10 17:52:31', NULL, NULL),
(86, '098', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 17:51:08', 'en', 'default', 1, 86, '2025-04-24 17:51:08', NULL, NULL),
(87, '00611', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-14 11:53:56', 'en', 'default', 1, 87, '2025-05-14 11:53:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_grouped_products`
--

CREATE TABLE `product_grouped_products` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `associated_product_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(1, 'images', 'product/1/2PD7IofoUdaceXsdILUx7zwTMBjGpxO0iVFQ5NmX.webp', 1, 1),
(5, 'images', 'product/3/nZ5uhH3mpS7vMaqzEvJFHrZWq2yD9O2HOBnOllbB.webp', 3, 1),
(7, 'images', 'product/4/pDF4FZLsZY4Cft8mjWamhqO1DNVrabDvANqIqKVr.webp', 4, 1),
(9, 'images', 'product/5/YYqASXG0C9ON93So1snZZSHavooQ4dcfJnxmkdjr.webp', 5, 1),
(14, 'images', 'product/7/eyoeHLW0OAZoEwNbv7IfhsMqdiswORGGIdQGEhy0.webp', 7, 1),
(15, 'images', 'product/9/BPHcFXICNlC6IPq40t9iXDnVSNaODe0vOEtIa7we.webp', 9, 1),
(18, 'images', 'product/13/hJasjThdGqSAJZyMl0dd9fPVWUlhrAZYQIFKjN1M.webp', 13, 1),
(19, 'images', 'product/6/lHSRQ8dx8SgfPIs5PglHkqExd63brRpV90i4HXKk.webp', 6, 1),
(20, 'images', 'product/2/HNRxkfVnCxb9BPweace5969inKwBqCt0062p4u7t.webp', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
(1, 100, 1, 0, 1),
(2, 100, 2, 0, 1),
(3, 100, 3, 0, 1),
(4, 100, 4, 0, 1),
(5, 100, 5, 0, 1),
(6, 100, 6, 0, 1),
(7, 10, 7, 0, 1),
(8, 10, 10, 0, 1),
(9, 10, 11, 0, 1),
(10, 10, 12, 0, 1),
(11, 10, 14, 0, 1),
(12, 10, 15, 0, 1),
(13, 10, 16, 0, 1),
(14, 10, 17, 0, 1),
(15, 10, 18, 0, 1),
(16, 10, 19, 0, 1),
(17, 10, 20, 0, 1),
(18, 10, 21, 0, 1),
(19, 10, 22, 0, 1),
(20, 10, 23, 0, 1),
(21, 10, 24, 0, 1),
(22, 10, 25, 0, 1),
(23, 10, 26, 0, 1),
(24, 10, 27, 0, 1),
(25, 10, 28, 0, 1),
(26, 10, 29, 0, 1),
(27, 10, 30, 0, 1),
(28, 10, 31, 0, 1),
(29, 10, 32, 0, 1),
(30, 10, 33, 0, 1),
(31, 10, 34, 0, 1),
(32, 10, 35, 0, 1),
(33, 10, 36, 0, 1),
(34, 10, 37, 0, 1),
(35, 10, 38, 0, 1),
(36, 10, 39, 0, 1),
(37, 10, 40, 0, 1),
(38, 10, 41, 0, 1),
(39, 10, 42, 0, 1),
(40, 10, 43, 0, 1),
(41, 10, 44, 0, 1),
(42, 10, 45, 0, 1),
(43, 10, 46, 0, 1),
(44, 10, 47, 0, 1),
(45, 10, 48, 0, 1),
(46, 10, 49, 0, 1),
(47, 10, 50, 0, 1),
(48, 10, 51, 0, 1),
(49, 10, 52, 0, 1),
(50, 10, 53, 0, 1),
(51, 10, 54, 0, 1),
(52, 10, 55, 0, 1),
(53, 10, 56, 0, 1),
(54, 10, 57, 0, 1),
(55, 10, 58, 0, 1),
(56, 10, 59, 0, 1),
(57, 10, 60, 0, 1),
(58, 10, 61, 0, 1),
(59, 10, 62, 0, 1),
(60, 10, 63, 0, 1),
(61, 10, 64, 0, 1),
(62, 10, 65, 0, 1),
(63, 10, 66, 0, 1),
(64, 10, 67, 0, 1),
(65, 10, 68, 0, 1),
(66, 10, 69, 0, 1),
(67, 10, 70, 0, 1),
(68, 10, 71, 0, 1),
(69, 10, 72, 0, 1),
(70, 10, 73, 0, 1),
(71, 10, 74, 0, 1),
(72, 10, 75, 0, 1),
(73, 10, 76, 0, 1),
(74, 10, 77, 0, 1),
(75, 10, 78, 0, 1),
(76, 10, 79, 0, 1),
(77, 10, 80, 0, 1),
(78, 10, 81, 0, 1),
(79, 10, 82, 0, 1),
(80, 10, 83, 0, 1),
(81, 10, 84, 0, 1),
(82, 10, 85, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory_indices`
--

CREATE TABLE `product_inventory_indices` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventory_indices`
--

INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 100, 1, 1, NULL, '2025-04-11 05:49:40'),
(2, 100, 2, 1, NULL, '2025-04-24 11:50:25'),
(3, 100, 3, 1, NULL, '2025-04-10 11:36:01'),
(4, 99, 4, 1, NULL, '2025-04-09 12:02:00'),
(5, 100, 5, 1, NULL, NULL),
(6, 98, 6, 1, NULL, '2025-04-24 07:38:13'),
(7, 10, 7, 1, NULL, NULL),
(8, 10, 10, 1, NULL, NULL),
(9, 10, 11, 1, NULL, NULL),
(10, 10, 12, 1, NULL, NULL),
(11, 0, 9, 1, NULL, NULL),
(12, 10, 14, 1, NULL, NULL),
(13, 10, 15, 1, NULL, NULL),
(14, 10, 16, 1, NULL, NULL),
(15, 10, 17, 1, NULL, NULL),
(16, 10, 18, 1, NULL, NULL),
(17, 10, 19, 1, NULL, NULL),
(18, 10, 20, 1, NULL, NULL),
(19, 10, 21, 1, NULL, NULL),
(20, 10, 22, 1, NULL, NULL),
(21, 10, 23, 1, NULL, NULL),
(22, 10, 24, 1, NULL, NULL),
(23, 10, 25, 1, NULL, NULL),
(24, 10, 26, 1, NULL, NULL),
(25, 10, 27, 1, NULL, NULL),
(26, 10, 28, 1, NULL, NULL),
(27, 10, 29, 1, NULL, NULL),
(28, 10, 30, 1, NULL, NULL),
(29, 10, 31, 1, NULL, NULL),
(30, 10, 32, 1, NULL, NULL),
(31, 10, 33, 1, NULL, NULL),
(32, 10, 34, 1, NULL, NULL),
(33, 10, 35, 1, NULL, NULL),
(34, 10, 36, 1, NULL, NULL),
(35, 10, 37, 1, NULL, NULL),
(36, 10, 38, 1, NULL, NULL),
(37, 10, 39, 1, NULL, NULL),
(38, 10, 40, 1, NULL, NULL),
(39, 10, 41, 1, NULL, NULL),
(40, 10, 42, 1, NULL, NULL),
(41, 10, 43, 1, NULL, NULL),
(42, 10, 44, 1, NULL, NULL),
(43, 10, 45, 1, NULL, NULL),
(44, 10, 46, 1, NULL, NULL),
(45, 10, 47, 1, NULL, NULL),
(46, 10, 48, 1, NULL, NULL),
(47, 10, 49, 1, NULL, NULL),
(48, 10, 50, 1, NULL, NULL),
(49, 10, 51, 1, NULL, NULL),
(50, 10, 52, 1, NULL, NULL),
(51, 10, 53, 1, NULL, NULL),
(52, 10, 54, 1, NULL, NULL),
(53, 10, 55, 1, NULL, NULL),
(54, 10, 56, 1, NULL, NULL),
(55, 10, 57, 1, NULL, NULL),
(56, 10, 58, 1, NULL, NULL),
(57, 10, 59, 1, NULL, NULL),
(58, 10, 60, 1, NULL, NULL),
(59, 10, 61, 1, NULL, NULL),
(60, 10, 62, 1, NULL, NULL),
(61, 10, 63, 1, NULL, NULL),
(62, 10, 64, 1, NULL, NULL),
(63, 10, 65, 1, NULL, NULL),
(64, 10, 66, 1, NULL, NULL),
(65, 10, 67, 1, NULL, NULL),
(66, 10, 68, 1, NULL, NULL),
(67, 10, 69, 1, NULL, NULL),
(68, 10, 70, 1, NULL, NULL),
(69, 10, 71, 1, NULL, NULL),
(70, 10, 72, 1, NULL, NULL),
(71, 10, 73, 1, NULL, NULL),
(72, 10, 74, 1, NULL, NULL),
(73, 10, 75, 1, NULL, NULL),
(74, 10, 76, 1, NULL, NULL),
(75, 10, 77, 1, NULL, NULL),
(76, 10, 78, 1, NULL, NULL),
(77, 10, 79, 1, NULL, NULL),
(78, 10, 80, 1, NULL, NULL),
(79, 10, 81, 1, NULL, NULL),
(80, 10, 82, 1, NULL, NULL),
(81, 10, 83, 1, NULL, NULL),
(82, 10, 84, 1, NULL, NULL),
(83, 10, 85, 1, NULL, NULL),
(84, 0, 13, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered_inventories`
--

CREATE TABLE `product_ordered_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_ordered_inventories`
--

INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES
(5, 1, 4, 1),
(6, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_price_indices`
--

CREATE TABLE `product_price_indices` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_price_indices`
--

INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(2, 1, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(3, 1, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(4, 2, 1, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(5, 2, 2, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(6, 2, 3, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(7, 3, 1, 1, 130.0000, 150.0000, 130.0000, 150.0000, NULL, '2025-04-10 11:36:01'),
(8, 3, 2, 1, 130.0000, 150.0000, 130.0000, 150.0000, NULL, '2025-04-10 11:36:01'),
(9, 3, 3, 1, 130.0000, 150.0000, 130.0000, 150.0000, NULL, '2025-04-10 11:36:01'),
(10, 4, 1, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(11, 4, 2, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(12, 4, 3, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(13, 5, 1, 1, 79.0000, 79.0000, 79.0000, 79.0000, NULL, NULL),
(14, 5, 2, 1, 79.0000, 79.0000, 79.0000, 79.0000, NULL, NULL),
(15, 5, 3, 1, 79.0000, 79.0000, 79.0000, 79.0000, NULL, NULL),
(16, 6, 1, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, '2025-03-26 10:47:44'),
(17, 6, 2, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, '2025-03-26 10:47:44'),
(18, 6, 3, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, '2025-03-26 10:47:44'),
(19, 7, 1, 1, 90.0000, 100.0000, 90.0000, 100.0000, NULL, NULL),
(20, 7, 2, 1, 90.0000, 100.0000, 90.0000, 100.0000, NULL, NULL),
(21, 7, 3, 1, 90.0000, 100.0000, 90.0000, 100.0000, NULL, NULL),
(22, 10, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(23, 10, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(24, 10, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(25, 11, 1, 1, 120.0000, 120.0000, 120.0000, 120.0000, NULL, NULL),
(26, 11, 2, 1, 120.0000, 120.0000, 120.0000, 120.0000, NULL, NULL),
(27, 11, 3, 1, 120.0000, 120.0000, 120.0000, 120.0000, NULL, NULL),
(28, 12, 1, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(29, 12, 2, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(30, 12, 3, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(31, 9, 1, 1, 99.0000, 99.0000, 120.0000, 120.0000, NULL, NULL),
(32, 9, 2, 1, 99.0000, 99.0000, 120.0000, 120.0000, NULL, NULL),
(33, 9, 3, 1, 99.0000, 99.0000, 120.0000, 120.0000, NULL, NULL),
(34, 14, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(35, 14, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(36, 14, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(37, 15, 1, 1, 90.0000, 90.0000, 90.0000, 90.0000, NULL, NULL),
(38, 15, 2, 1, 90.0000, 90.0000, 90.0000, 90.0000, NULL, NULL),
(39, 15, 3, 1, 90.0000, 90.0000, 90.0000, 90.0000, NULL, NULL),
(40, 16, 1, 1, 80.0000, 80.0000, 80.0000, 80.0000, NULL, NULL),
(41, 16, 2, 1, 80.0000, 80.0000, 80.0000, 80.0000, NULL, NULL),
(42, 16, 3, 1, 80.0000, 80.0000, 80.0000, 80.0000, NULL, NULL),
(43, 17, 1, 1, 34.0000, 34.0000, 34.0000, 34.0000, NULL, NULL),
(44, 17, 2, 1, 34.0000, 34.0000, 34.0000, 34.0000, NULL, NULL),
(45, 17, 3, 1, 34.0000, 34.0000, 34.0000, 34.0000, NULL, NULL),
(46, 18, 1, 1, 57.0000, 57.0000, 57.0000, 57.0000, NULL, NULL),
(47, 18, 2, 1, 57.0000, 57.0000, 57.0000, 57.0000, NULL, NULL),
(48, 18, 3, 1, 57.0000, 57.0000, 57.0000, 57.0000, NULL, NULL),
(49, 19, 1, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(50, 19, 2, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(51, 19, 3, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(52, 20, 1, 1, 98.0000, 98.0000, 98.0000, 98.0000, NULL, NULL),
(53, 20, 2, 1, 98.0000, 98.0000, 98.0000, 98.0000, NULL, NULL),
(54, 20, 3, 1, 98.0000, 98.0000, 98.0000, 98.0000, NULL, NULL),
(55, 21, 1, 1, 97.0000, 97.0000, 97.0000, 97.0000, NULL, NULL),
(56, 21, 2, 1, 97.0000, 97.0000, 97.0000, 97.0000, NULL, NULL),
(57, 21, 3, 1, 97.0000, 97.0000, 97.0000, 97.0000, NULL, NULL),
(58, 22, 1, 1, 95.0000, 95.0000, 95.0000, 95.0000, NULL, NULL),
(59, 22, 2, 1, 95.0000, 95.0000, 95.0000, 95.0000, NULL, NULL),
(60, 22, 3, 1, 95.0000, 95.0000, 95.0000, 95.0000, NULL, NULL),
(61, 23, 1, 1, 93.0000, 93.0000, 93.0000, 93.0000, NULL, NULL),
(62, 23, 2, 1, 93.0000, 93.0000, 93.0000, 93.0000, NULL, NULL),
(63, 23, 3, 1, 93.0000, 93.0000, 93.0000, 93.0000, NULL, NULL),
(64, 24, 1, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(65, 24, 2, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(66, 24, 3, 1, 78.0000, 78.0000, 78.0000, 78.0000, NULL, NULL),
(67, 25, 1, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(68, 25, 2, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(69, 25, 3, 1, 65.0000, 65.0000, 65.0000, 65.0000, NULL, NULL),
(70, 26, 1, 1, 87.0000, 87.0000, 87.0000, 87.0000, NULL, NULL),
(71, 26, 2, 1, 87.0000, 87.0000, 87.0000, 87.0000, NULL, NULL),
(72, 26, 3, 1, 87.0000, 87.0000, 87.0000, 87.0000, NULL, NULL),
(73, 27, 1, 1, 48.0000, 48.0000, 48.0000, 48.0000, NULL, NULL),
(74, 27, 2, 1, 48.0000, 48.0000, 48.0000, 48.0000, NULL, NULL),
(75, 27, 3, 1, 48.0000, 48.0000, 48.0000, 48.0000, NULL, NULL),
(76, 28, 1, 1, 56.0000, 56.0000, 56.0000, 56.0000, NULL, NULL),
(77, 28, 2, 1, 56.0000, 56.0000, 56.0000, 56.0000, NULL, NULL),
(78, 28, 3, 1, 56.0000, 56.0000, 56.0000, 56.0000, NULL, NULL),
(79, 29, 1, 1, 82.0000, 82.0000, 82.0000, 82.0000, NULL, NULL),
(80, 29, 2, 1, 82.0000, 82.0000, 82.0000, 82.0000, NULL, NULL),
(81, 29, 3, 1, 82.0000, 82.0000, 82.0000, 82.0000, NULL, NULL),
(82, 30, 1, 1, 109.0000, 109.0000, 109.0000, 109.0000, NULL, NULL),
(83, 30, 2, 1, 109.0000, 109.0000, 109.0000, 109.0000, NULL, NULL),
(84, 30, 3, 1, 109.0000, 109.0000, 109.0000, 109.0000, NULL, NULL),
(85, 31, 1, 1, 102.0000, 102.0000, 102.0000, 102.0000, NULL, NULL),
(86, 31, 2, 1, 102.0000, 102.0000, 102.0000, 102.0000, NULL, NULL),
(87, 31, 3, 1, 102.0000, 102.0000, 102.0000, 102.0000, NULL, NULL),
(88, 32, 1, 1, 103.0000, 103.0000, 103.0000, 103.0000, NULL, NULL),
(89, 32, 2, 1, 103.0000, 103.0000, 103.0000, 103.0000, NULL, NULL),
(90, 32, 3, 1, 103.0000, 103.0000, 103.0000, 103.0000, NULL, NULL),
(91, 33, 1, 1, 194.0000, 194.0000, 194.0000, 194.0000, NULL, NULL),
(92, 33, 2, 1, 194.0000, 194.0000, 194.0000, 194.0000, NULL, NULL),
(93, 33, 3, 1, 194.0000, 194.0000, 194.0000, 194.0000, NULL, NULL),
(94, 34, 1, 1, 760.0000, 760.0000, 760.0000, 760.0000, NULL, NULL),
(95, 34, 2, 1, 760.0000, 760.0000, 760.0000, 760.0000, NULL, NULL),
(96, 34, 3, 1, 760.0000, 760.0000, 760.0000, 760.0000, NULL, NULL),
(97, 35, 1, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(98, 35, 2, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(99, 35, 3, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(100, 36, 1, 1, 410.0000, 410.0000, 410.0000, 410.0000, NULL, NULL),
(101, 36, 2, 1, 410.0000, 410.0000, 410.0000, 410.0000, NULL, NULL),
(102, 36, 3, 1, 410.0000, 410.0000, 410.0000, 410.0000, NULL, NULL),
(103, 37, 1, 1, 128.0000, 128.0000, 128.0000, 128.0000, NULL, NULL),
(104, 37, 2, 1, 128.0000, 128.0000, 128.0000, 128.0000, NULL, NULL),
(105, 37, 3, 1, 128.0000, 128.0000, 128.0000, 128.0000, NULL, NULL),
(106, 38, 1, 1, 127.0000, 127.0000, 127.0000, 127.0000, NULL, NULL),
(107, 38, 2, 1, 127.0000, 127.0000, 127.0000, 127.0000, NULL, NULL),
(108, 38, 3, 1, 127.0000, 127.0000, 127.0000, 127.0000, NULL, NULL),
(109, 39, 1, 1, 138.0000, 138.0000, 138.0000, 138.0000, NULL, NULL),
(110, 39, 2, 1, 138.0000, 138.0000, 138.0000, 138.0000, NULL, NULL),
(111, 39, 3, 1, 138.0000, 138.0000, 138.0000, 138.0000, NULL, NULL),
(112, 40, 1, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(113, 40, 2, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(114, 40, 3, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(115, 41, 1, 1, 130.0000, 130.0000, 130.0000, 130.0000, NULL, NULL),
(116, 41, 2, 1, 130.0000, 130.0000, 130.0000, 130.0000, NULL, NULL),
(117, 41, 3, 1, 130.0000, 130.0000, 130.0000, 130.0000, NULL, NULL),
(118, 42, 1, 1, 148.0000, 148.0000, 148.0000, 148.0000, NULL, NULL),
(119, 42, 2, 1, 148.0000, 148.0000, 148.0000, 148.0000, NULL, NULL),
(120, 42, 3, 1, 148.0000, 148.0000, 148.0000, 148.0000, NULL, NULL),
(121, 43, 1, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(122, 43, 2, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(123, 43, 3, 1, 134.0000, 134.0000, 134.0000, 134.0000, NULL, NULL),
(124, 44, 1, 1, 231.0000, 231.0000, 231.0000, 231.0000, NULL, NULL),
(125, 44, 2, 1, 231.0000, 231.0000, 231.0000, 231.0000, NULL, NULL),
(126, 44, 3, 1, 231.0000, 231.0000, 231.0000, 231.0000, NULL, NULL),
(127, 45, 1, 1, 234.0000, 234.0000, 234.0000, 234.0000, NULL, NULL),
(128, 45, 2, 1, 234.0000, 234.0000, 234.0000, 234.0000, NULL, NULL),
(129, 45, 3, 1, 234.0000, 234.0000, 234.0000, 234.0000, NULL, NULL),
(130, 46, 1, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(131, 46, 2, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(132, 46, 3, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(133, 47, 1, 1, 248.0000, 248.0000, 248.0000, 248.0000, NULL, NULL),
(134, 47, 2, 1, 248.0000, 248.0000, 248.0000, 248.0000, NULL, NULL),
(135, 47, 3, 1, 248.0000, 248.0000, 248.0000, 248.0000, NULL, NULL),
(136, 48, 1, 1, 240.0000, 240.0000, 240.0000, 240.0000, NULL, NULL),
(137, 48, 2, 1, 240.0000, 240.0000, 240.0000, 240.0000, NULL, NULL),
(138, 48, 3, 1, 240.0000, 240.0000, 240.0000, 240.0000, NULL, NULL),
(139, 49, 1, 1, 900.0000, 900.0000, 900.0000, 900.0000, NULL, NULL),
(140, 49, 2, 1, 900.0000, 900.0000, 900.0000, 900.0000, NULL, NULL),
(141, 49, 3, 1, 900.0000, 900.0000, 900.0000, 900.0000, NULL, NULL),
(142, 50, 1, 1, 800.0000, 800.0000, 800.0000, 800.0000, NULL, NULL),
(143, 50, 2, 1, 800.0000, 800.0000, 800.0000, 800.0000, NULL, NULL),
(144, 50, 3, 1, 800.0000, 800.0000, 800.0000, 800.0000, NULL, NULL),
(145, 51, 1, 1, 700.0000, 700.0000, 700.0000, 700.0000, NULL, NULL),
(146, 51, 2, 1, 700.0000, 700.0000, 700.0000, 700.0000, NULL, NULL),
(147, 51, 3, 1, 700.0000, 700.0000, 700.0000, 700.0000, NULL, NULL),
(148, 52, 1, 1, 300.0000, 300.0000, 300.0000, 300.0000, NULL, NULL),
(149, 52, 2, 1, 300.0000, 300.0000, 300.0000, 300.0000, NULL, NULL),
(150, 52, 3, 1, 300.0000, 300.0000, 300.0000, 300.0000, NULL, NULL),
(151, 53, 1, 1, 400.0000, 400.0000, 400.0000, 400.0000, NULL, NULL),
(152, 53, 2, 1, 400.0000, 400.0000, 400.0000, 400.0000, NULL, NULL),
(153, 53, 3, 1, 400.0000, 400.0000, 400.0000, 400.0000, NULL, NULL),
(154, 54, 1, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, NULL),
(155, 54, 2, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, NULL),
(156, 54, 3, 1, 200.0000, 200.0000, 200.0000, 200.0000, NULL, NULL),
(157, 55, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(158, 55, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(159, 55, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
(160, 56, 1, 1, 129.0000, 129.0000, 129.0000, 129.0000, NULL, NULL),
(161, 56, 2, 1, 129.0000, 129.0000, 129.0000, 129.0000, NULL, NULL),
(162, 56, 3, 1, 129.0000, 129.0000, 129.0000, 129.0000, NULL, NULL),
(163, 57, 1, 1, 230.0000, 230.0000, 230.0000, 230.0000, NULL, NULL),
(164, 57, 2, 1, 230.0000, 230.0000, 230.0000, 230.0000, NULL, NULL),
(165, 57, 3, 1, 230.0000, 230.0000, 230.0000, 230.0000, NULL, NULL),
(166, 58, 1, 1, 1234.0000, 1234.0000, 1234.0000, 1234.0000, NULL, NULL),
(167, 58, 2, 1, 1234.0000, 1234.0000, 1234.0000, 1234.0000, NULL, NULL),
(168, 58, 3, 1, 1234.0000, 1234.0000, 1234.0000, 1234.0000, NULL, NULL),
(169, 59, 1, 1, 123.0000, 123.0000, 123.0000, 123.0000, NULL, NULL),
(170, 59, 2, 1, 123.0000, 123.0000, 123.0000, 123.0000, NULL, NULL),
(171, 59, 3, 1, 123.0000, 123.0000, 123.0000, 123.0000, NULL, NULL),
(172, 60, 1, 1, 154.0000, 154.0000, 154.0000, 154.0000, NULL, NULL),
(173, 60, 2, 1, 154.0000, 154.0000, 154.0000, 154.0000, NULL, NULL),
(174, 60, 3, 1, 154.0000, 154.0000, 154.0000, 154.0000, NULL, NULL),
(175, 61, 1, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(176, 61, 2, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(177, 61, 3, 1, 235.0000, 235.0000, 235.0000, 235.0000, NULL, NULL),
(178, 62, 1, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(179, 62, 2, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(180, 62, 3, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(181, 63, 1, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(182, 63, 2, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(183, 63, 3, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(184, 64, 1, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(185, 64, 2, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(186, 64, 3, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(187, 65, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(188, 65, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(189, 65, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(190, 66, 1, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(191, 66, 2, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(192, 66, 3, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(193, 67, 1, 1, 543.0000, 543.0000, 543.0000, 543.0000, NULL, NULL),
(194, 67, 2, 1, 543.0000, 543.0000, 543.0000, 543.0000, NULL, NULL),
(195, 67, 3, 1, 543.0000, 543.0000, 543.0000, 543.0000, NULL, NULL),
(196, 68, 1, 1, 560.0000, 560.0000, 560.0000, 560.0000, NULL, NULL),
(197, 68, 2, 1, 560.0000, 560.0000, 560.0000, 560.0000, NULL, NULL),
(198, 68, 3, 1, 560.0000, 560.0000, 560.0000, 560.0000, NULL, NULL),
(199, 69, 1, 1, 652.0000, 652.0000, 652.0000, 652.0000, NULL, NULL),
(200, 69, 2, 1, 652.0000, 652.0000, 652.0000, 652.0000, NULL, NULL),
(201, 69, 3, 1, 652.0000, 652.0000, 652.0000, 652.0000, NULL, NULL),
(202, 70, 1, 1, 496.0000, 496.0000, 496.0000, 496.0000, NULL, NULL),
(203, 70, 2, 1, 496.0000, 496.0000, 496.0000, 496.0000, NULL, NULL),
(204, 70, 3, 1, 496.0000, 496.0000, 496.0000, 496.0000, NULL, NULL),
(205, 71, 1, 1, 47.0000, 47.0000, 47.0000, 47.0000, NULL, NULL),
(206, 71, 2, 1, 47.0000, 47.0000, 47.0000, 47.0000, NULL, NULL),
(207, 71, 3, 1, 47.0000, 47.0000, 47.0000, 47.0000, NULL, NULL),
(208, 72, 1, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(209, 72, 2, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(210, 72, 3, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(211, 73, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(212, 73, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(213, 73, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(214, 74, 1, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(215, 74, 2, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(216, 74, 3, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(217, 75, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(218, 75, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(219, 75, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(220, 76, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(221, 76, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(222, 76, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(223, 77, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(224, 77, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(225, 77, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(226, 78, 1, 1, 987.0000, 987.0000, 987.0000, 987.0000, NULL, NULL),
(227, 78, 2, 1, 987.0000, 987.0000, 987.0000, 987.0000, NULL, NULL),
(228, 78, 3, 1, 987.0000, 987.0000, 987.0000, 987.0000, NULL, NULL),
(229, 79, 1, 1, 875.0000, 875.0000, 875.0000, 875.0000, NULL, NULL),
(230, 79, 2, 1, 875.0000, 875.0000, 875.0000, 875.0000, NULL, NULL),
(231, 79, 3, 1, 875.0000, 875.0000, 875.0000, 875.0000, NULL, NULL),
(232, 80, 1, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(233, 80, 2, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(234, 80, 3, 1, 456.0000, 456.0000, 456.0000, 456.0000, NULL, NULL),
(235, 81, 1, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(236, 81, 2, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(237, 81, 3, 1, 876.0000, 876.0000, 876.0000, 876.0000, NULL, NULL),
(238, 82, 1, 1, 866.0000, 866.0000, 866.0000, 866.0000, NULL, NULL),
(239, 82, 2, 1, 866.0000, 866.0000, 866.0000, 866.0000, NULL, NULL),
(240, 82, 3, 1, 866.0000, 866.0000, 866.0000, 866.0000, NULL, NULL),
(241, 83, 1, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(242, 83, 2, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(243, 83, 3, 1, 654.0000, 654.0000, 654.0000, 654.0000, NULL, NULL),
(244, 84, 1, 1, 647.0000, 647.0000, 647.0000, 647.0000, NULL, NULL),
(245, 84, 2, 1, 647.0000, 647.0000, 647.0000, 647.0000, NULL, NULL),
(246, 84, 3, 1, 647.0000, 647.0000, 647.0000, 647.0000, NULL, NULL),
(247, 85, 1, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(248, 85, 2, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(249, 85, 3, 1, 765.0000, 765.0000, 765.0000, 765.0000, NULL, NULL),
(250, 13, 1, 1, 34.0000, 34.0000, 1234.0000, 1234.0000, NULL, NULL),
(251, 13, 2, 1, 34.0000, 34.0000, 1234.0000, 1234.0000, NULL, NULL),
(252, 13, 3, 1, 34.0000, 34.0000, 1234.0000, 1234.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES
(3, 1),
(13, 1),
(1, 2),
(3, 2),
(13, 2),
(1, 3),
(13, 3),
(1, 4),
(4, 5),
(1, 6),
(3, 6),
(13, 6),
(3, 9),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `name`, `title`, `rating`, `comment`, `status`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Raj Tiwari', 'I loved it', 5, 'I loved it… In terms of taste it was literally beyond and the design it was alot more than it looked in pictures.', 'approved', 3, 1, '2025-04-10 11:31:25', '2025-04-10 11:32:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_review_attachments`
--

CREATE TABLE `product_review_attachments` (
  `id` int UNSIGNED NOT NULL,
  `review_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'image',
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_review_attachments`
--

INSERT INTO `product_review_attachments` (`id`, `review_id`, `type`, `mime_type`, `path`) VALUES
(1, 1, 'image', 'webp', 'review/1/a45M057kbdDlRkp8prmz9Q4SXtGx5WNY91BR77Rj.webp');

-- --------------------------------------------------------

--
-- Table structure for table `product_rewards`
--

CREATE TABLE `product_rewards` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED DEFAULT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_rewards`
--

INSERT INTO `product_rewards` (`id`, `reward_points`, `product_id`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 20, 2, '', '', 1, '2025-05-09 09:42:05', '2025-05-09 09:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_specific_time_rewards`
--

CREATE TABLE `product_specific_time_rewards` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_super_attributes`
--

CREATE TABLE `product_super_attributes` (
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_super_attributes`
--

INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES
(9, 29),
(13, 30),
(13, 31);

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_up_sells`
--

INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES
(3, 1),
(13, 1),
(3, 2),
(13, 2),
(13, 3),
(3, 6),
(13, 6),
(3, 9),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `redemption_settings`
--

CREATE TABLE `redemption_settings` (
  `id` int UNSIGNED NOT NULL,
  `redemp_over_subtotal` tinyint NOT NULL DEFAULT '1',
  `apply_points_checkout` tinyint NOT NULL DEFAULT '1',
  `points` int DEFAULT NULL,
  `conversion_rate` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `redemption_settings`
--

INSERT INTO `redemption_settings` (`id`, `redemp_over_subtotal`, `apply_points_checkout`, `points`, `conversion_rate`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1.00, '2025-05-09 09:44:46', '2025-05-09 09:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refund_items`
--

CREATE TABLE `refund_items` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `refund_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reward_configs`
--

CREATE TABLE `reward_configs` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reward_points`
--

CREATE TABLE `reward_points` (
  `id` int UNSIGNED NOT NULL,
  `reward_points` int NOT NULL DEFAULT '0',
  `status` enum('processing','approved','closed','pending','fraud','expire','used','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci,
  `exp_date` date DEFAULT NULL,
  `product_purchased` tinyint NOT NULL DEFAULT '0',
  `product_reviewed` tinyint NOT NULL DEFAULT '0',
  `customer_registed` tinyint NOT NULL DEFAULT '0',
  `product_category` tinyint NOT NULL DEFAULT '0',
  `product_attribute` tinyint NOT NULL DEFAULT '0',
  `order_cart` tinyint NOT NULL DEFAULT '0',
  `customer_dob` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `attribute_id` int UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL),
(2, 'Sales Team', 'Manage Orders', 'custom', '[\"dashboard\", \"sales\", \"sales.orders\", \"sales.orders.create\", \"sales.orders.view\", \"sales.orders.cancel\", \"catalog\", \"catalog.products\", \"catalog.products.create\", \"catalog.products.copy\", \"catalog.products.edit\", \"catalog.products.delete\", \"catalog.categories\", \"catalog.categories.create\", \"catalog.categories.edit\", \"catalog.categories.delete\", \"catalog.attributes\", \"catalog.attributes.create\", \"catalog.attributes.edit\", \"catalog.attributes.delete\", \"catalog.families\", \"catalog.families.create\", \"catalog.families.edit\", \"catalog.families.delete\", \"customers\", \"customers.customers\", \"customers.customers.create\", \"customers.customers.edit\", \"customers.customers.delete\", \"customers.addresses\", \"customers.addresses.create\", \"customers.addresses.edit\", \"customers.addresses.delete\", \"customers.note\", \"customers.groups\", \"customers.groups.create\", \"customers.groups.edit\", \"customers.groups.delete\", \"customers.reviews\", \"customers.reviews.edit\", \"customers.reviews.delete\", \"cms\", \"cms.create\", \"cms.edit\", \"cms.delete\"]', '2025-05-01 04:30:36', '2025-05-16 10:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `search_synonyms`
--

CREATE TABLE `search_synonyms` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `search_terms`
--

CREATE TABLE `search_terms` (
  `id` int UNSIGNED NOT NULL,
  `term` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_address_id` int UNSIGNED DEFAULT NULL,
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `shipment_id` int UNSIGNED NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` int UNSIGNED NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE `subscribers_list` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `subscribers_list`
--

INSERT INTO `subscribers_list` (`id`, `email`, `is_subscribed`, `token`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'raj.tiwari@ens.enterprises', 1, '68132854ecfa6', NULL, 1, '2025-05-01 07:52:52', '2025-05-01 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories_tax_rates`
--

CREATE TABLE `tax_categories_tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED NOT NULL,
  `tax_rate_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `theme_customizations`
--

CREATE TABLE `theme_customizations` (
  `id` int UNSIGNED NOT NULL,
  `theme_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customizations`
--

INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'default', 'image_carousel', 'Image Carousel', 1, 1, 1, '2025-03-26 05:48:02', '2025-05-02 04:53:48'),
(2, 'default', 'static_content', 'Offer Information', 2, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(3, 'default', 'category_carousel', 'Categories Collections', 3, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(4, 'default', 'product_carousel', 'New Products', 4, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(5, 'default', 'static_content', 'Top Collections', 5, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(6, 'default', 'static_content', 'Bold Collections', 6, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(7, 'default', 'product_carousel', 'Featured Collections', 7, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(8, 'default', 'static_content', 'Game Container', 8, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(9, 'default', 'product_carousel', 'All Products', 9, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(10, 'default', 'static_content', 'Bold Collections', 10, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02'),
(11, 'default', 'footer_links', 'Footer Links', 11, 1, 1, '2025-03-26 05:48:02', '2025-03-28 06:02:10'),
(12, 'default', 'services_content', 'Services Content', 12, 1, 1, '2025-03-26 05:48:02', '2025-03-26 05:48:02');

-- --------------------------------------------------------

--
-- Table structure for table `theme_customization_translations`
--

CREATE TABLE `theme_customization_translations` (
  `id` int UNSIGNED NOT NULL,
  `theme_customization_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customization_translations`
--

INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(1, 1, 'en', '{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/GsaG6rZvt3tvvu3dKTZiCTjKDQgCNImPx1z90aqm.webp\", \"title\": \"we are open now\"}, {\"link\": \"\", \"image\": \"storage/theme/1/6dAp793whvKZGFAGcH2K9VqXxxVD2ZrhRpyrS9k5.webp\", \"title\": \"new arrivals\"}, {\"link\": \"\", \"image\": \"storage/theme/1/0nlBsWp1NbtkR65TrLsbgrM8WLxTU069jlycdg9T.webp\", \"title\": \"Mothers day\"}]}'),
(2, 2, 'en', '{\"css\": \".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\", \"html\": \"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW</h1></div>\"}'),
(3, 3, 'en', '{\"filters\": {\"sort\": \"asc\", \"limit\": 10, \"parent_id\": 1}}'),
(4, 4, 'en', '{\"title\": \"New Products\", \"filters\": {\"new\": 1, \"sort\": \"name-asc\", \"limit\": 12}}'),
(5, 5, 'en', '{\"css\": \".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\", \"html\": \"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!</h2></div><div class=\\\"top-collection-grid container\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/RAyPoMTko6a6lGzlp7e8pWribKnQz83JHuSsvTwA.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/kBRBHjIT0WFcO28p5k33Cf5DKfIWpv5VUXn0vxzx.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/lSZt04YDOnEoxez1F6e1ptFFCA7UTC1T0OurMnzn.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/CteooSke1qnn48A5OcX6PnHzytgQStsivuqrU64a.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/UhQo4HxLOzf3P0Rp3gdRPP3n5kOV56L07nxW05Vu.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/B59n0nP8Wa1NDyyAB1jk1nU4jFCgyWMxMcOBVHLn.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div></div></div>\"}'),
(6, 6, 'en', '{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/6/i9E9Oa1PO20DAWWN3NPDNoEe9Wm9i7evvPak1Fgt.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button> </div> </div> </div>\"}'),
(7, 7, 'en', '{\"title\": \"Featured Products\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12, \"featured\": 1}}'),
(8, 8, 'en', '{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\", \"html\": \"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>The game with our new additions!</h2> </div> <div class=\\\"section-gap container\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/9faP1sis45lF0YEZndS94kstBGXKLj8I48TvMFUV.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\">Our Collections</h3> </div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/Cq1v2cHiNmXFc5gRk8XHaANHL6ZfMQdETkFect2u.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections </h3> </div> </div> </div> </div>\"}'),
(9, 9, 'en', '{\"title\": \"All Products\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12}}'),
(10, 10, 'en', '{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/10/YvX25y5eyLME2yPchkUYMcy1qRWDqvpqkpntepTK.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button> </div> </div> </div>\"}'),
(11, 11, 'en', '{\"column_1\": [{\"url\": \"http://localhost:8000/page/about-us\", \"title\": \"About Us\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost:8000/contact-us\", \"title\": \"Contact Us\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost:8000/page/customer-service\", \"title\": \"Customer Service\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost:8000/page/whats-new\", \"title\": \"What\'s New\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost:8000/page/terms-of-use\", \"title\": \"Terms of Use\", \"sort_order\": \"5\"}, {\"url\": \"http://localhost:8000/page/terms-conditions\", \"title\": \"Terms & Conditions\", \"sort_order\": \"6\"}], \"column_2\": [{\"url\": \"http://localhost:8000/page/privacy-policy\", \"title\": \"Privacy Policy\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost:8000/page/payment-policy\", \"title\": \"Payment Policy\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost:8000/page/shipping-policy\", \"title\": \"Shipping Policy\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost:8000/page/refund-policy\", \"title\": \"Refund Policy\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost:8000/page/return-policy\", \"title\": \"Return Policy\", \"sort_order\": \"5\"}]}'),
(12, 12, 'en', '{\"services\": [{\"title\": \"Free Shipping\", \"description\": \"Enjoy free shipping on all orders\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Product Replace\", \"description\": \"Easy Product Replacement Available!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Emi Available\", \"description\": \"No cost EMI available on all major credit cards\", \"service_icon\": \"icon-dollar-sign\"}, {\"title\": \"24/7 Support\", \"description\": \"Dedicated 24/7 support via chat and email\", \"service_icon\": \"icon-support\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `url_rewrites`
--

CREATE TABLE `url_rewrites` (
  `id` int UNSIGNED NOT NULL,
  `entity_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint UNSIGNED NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `languages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `useragent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `device` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `platform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `browser` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://localhost:8000/jungle-theme-pink-cake', 'http://localhost:8000/minimal-forest-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/minimal-forest-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InJTV3UzNVc0azZ0R3cwMWgrYk9rL3c9PSIsInZhbHVlIjoiNmVDNVBOUzdMN1VhdVNtT2UwcDdCZTNldWNYYVdabmNOcFVlckJGWDBxREdpNFNvZlBYanpER0NWdUlHbUwxQklBUmRnVitibHhIcGh0Njl3WFpNRWJEc3FVOFFFWEJSTm9zdEh5UzBuQjdjeDE5SlZ3TGZQaGxtTURaYzVHUTAiLCJtYWMiOiIzOWU4YzE1YmFhNGQzMjgxYjFjODkwYmFiZDQ3OTE0MmQ2N2M4YzU5ZmM1Y2JmNDlhNmY3NzRlZDViNGQ1NzIwIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IklPMElENUZ5Q05neDhhRTBJMXl3S0E9PSIsInZhbHVlIjoiU1NLaXNNYk5FelF2Um5QMGZIcHlpY3QyWUpLcTkyU1dzUW40SVlmQmFGS3FUTmxldzBxTDlWNUlxbndEV1IvTjVLaGtrOXE2RWwvK3ljSHJGODU2SmwrdUNiRFNKSm0yKys3Y1VOZ0NGdDBFZHBSVmRKYVJ6OWN2US9PZ2RFWG0iLCJtYWMiOiIzMGJiNmJhNWU1ZGMyOTgyMzY5Y2RmZGFlY2Y4YjQ0MGQ4YzM5Mzc1ODkwNjg1MGQzNGU3YjlmMmEzNDQzNDU1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-24 11:48:54', '2025-04-24 11:48:54'),
(2, 'GET', '[]', 'http://localhost:8000/cakes-pastries', 'http://localhost:8000/jungle-theme-pink-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/jungle-theme-pink-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImU4T2tTTEVyemFyUlVZNnIwN3FSY3c9PSIsInZhbHVlIjoiTWpIbno5L1NVdzRSMDAza1paeGx0YW5HWnFiOFNoRjlvWE03YW1hVmJGcGxkaFdzOTZtL3VFZ2kybmZVdzU3TlYrcHNYUjUvSHlDcnUvRlY3cWRmQ0xGQVYrdldjK2M2NXU5Z09GSk13QnA2dll5N3VZbVdpMC9mVmFlSzZ6Y0oiLCJtYWMiOiJmZWIzMzdkYWI4MGQ4Yzg5Yzk2N2IzMzAyZWI0NmYxZDY3MmNjZGIzNWVlMWE4YmQ3YTdkNGJjZjJkMmE2ZWM3IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilh3ekZ5OWs1dGZLSy92aWw1dC9IUnc9PSIsInZhbHVlIjoiT0xQRFQyME1HTmVlYlpaak1GSnJ5QThCOHZkeHl5VnBTMWg1K3V2cmY0QlJyd1QxV2ZuSHdSaVVsYkdhdXZId1N5N2FPSFUwYk1KSmZzMnUyRk1mVzhLMzU1TmliNnE0UVFYR2dLNnNoVWpDR1I2OVFtZldXUHFybGlFWW1FODQiLCJtYWMiOiJiMTJlMjJhZDI4MmI0M2NiZTNkZTQwNjkyMzQ4NmNkYWI4OWRiY2U1OGUzMDliMWU5ODkxZGE5MWQyYzk5OWI1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-24 12:21:32', '2025-04-24 12:21:32'),
(3, 'GET', '[]', 'http://localhost:8000/photocake', 'http://localhost:8000/cakes-pastries', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/cakes-pastries\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IktqMVlBV2ZCRlVpc093bTVkK05wY1E9PSIsInZhbHVlIjoiNEdmRUhhUlU2azUyT1ZRbCs5Q1R3MFNOMVAyb2tsTCtSbncwZGpJbDh1OTJ6U1llKzRnVjVuTmFFaitTMnhsVW1PUExBTzRLNUxFM3JCa0Npbmc4bkQzdG5VZTREaEJnUG0yblV4NnVrN3BXM3RnbHlHNlFBd2xrQ3gxc2FFOC8iLCJtYWMiOiI1ZjY4Y2EzNDNlOWM1YzE5YmQxY2VhOTcwMzI3YTg5YzI4YmVlNTY0NjlhZTZhMzc2OGM2NGUwNzQ3YjFkOTIwIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Iks2OGxqL3R4bTg2N3hKaTRvMWFlOVE9PSIsInZhbHVlIjoiRklQV3RCVUFmSnNodnRGVFlDSnlMY0tneFgxMHgwM05KeXI1elNhL01jdU1HOUVXYkZrRGtNOWQydGd6Z3M5ekpTc3liQ1BwZ2JwMEhhcUlhT1BXNEdlRGxkS2RCM0lzYWQxeVBJMG9mc0JrWEpFTUczVEFNYjd1dFF4RTlQYkgiLCJtYWMiOiJjNzAxNDNmYjdmYTdjYjE4YTQzZWEyNDkzYzBkNDc1YWJjYzk3MjllMjk1ZGU1OGFmODAzMmM3Y2NlMWQ5ZDk2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-24 12:43:04', '2025-04-24 12:43:04'),
(4, 'GET', '[]', 'http://localhost:8000/heart-shape-photo-cake', 'http://localhost:8000/photocake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImhkZ2JlZC9URmZzZW1DNTdycjN4Unc9PSIsInZhbHVlIjoiWTFGZTBXRFgwR3R2Ty9QWTdXdDlJUTZ6d2l5N1ZuMlBjTk9ST1J2VFRHTWdIMFVBOFhLQjJnR2l6MG56OGZSQlN3QXJnQk5saWovcWxKMXJpdVpYc25xeWNBRDUxZTZOUnhRTWN2aDRVd3N2TzNBK0dPV014Mk9lanFBZUhqRGUiLCJtYWMiOiJhYTlhNmVlOGQ2YzcxOTg3M2ZhMzY3Y2FjMjUyOTYwYzQ4Zjg5MTg4MDZmNWU2MmY0NDA3MTQzMWQyY2NmMzkxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IloxcnZoMmU0N2txZUdrcEp0eDhiRGc9PSIsInZhbHVlIjoiK2pCcS9mNVM1NitCZU81TkV2SHR4ZjBxbm1kcmF6VHN2UEoxQ0hjZXBJQTAzV291VlFsYzBXcUliaHppR2dLTGJrRlIxTXFkdjFzdXkzUVJIeCtkZjA2eUlURjhPbytEZ09kQ0NpdDBzV01aK1lxeUxkK1NYeFFURHQ4cWNWMFQiLCJtYWMiOiI2MzY2NzZlMmZjMDc2MmRmMDk1NTBiYTk3OWI5MDljOWRiNGRiZDBmZWJiZTU4ZTk0ZmI3YTNhZTZlMzY1ZjE2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 6, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-24 12:43:08', '2025-04-24 12:43:08'),
(5, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/blog', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/blog\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlU5ejNiaXUzVEp1bTFmT2x1dkRHZVE9PSIsInZhbHVlIjoidTJOOTVueE1ITWtBWkVQRkd6NTNrWFRzaEZOcTFTVVFPOGtkT0FPcnRFeXEyOEZ0QXJEUW90Y2dsOE9leHdsdytOS3kwWmNmdHprQnViTWVjcTMvVjd0R1NTd2pXMy9vOHdxOEZIQlJrZXBVL052alBuS1JhUVRMNFZmbWVkTkUiLCJtYWMiOiI3MzYwNjY1ZTM5NTVmODQ5ZGMyZTdmMGJiNzExYmVmYjcwZmQ2MjY2YzljZmQ1MzFjOWVlNTE4NmYyZDg0NmNhIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjFUaFAwV2RXZFJaV3J5S1pheDdwQnc9PSIsInZhbHVlIjoiLzAwN3gwN0lOWHB0L1BsMjBJSG4rZmxPWHdUcHE4VmJnNi9OVGZJdGUrQVNDZWdiZVo2eHB4RDRNZFBuZ0Z2Nm9NSmJxWjM0YmhCbmcwZUlERXNFQTg4elIvdlIvWHhCRFRFcERUbXAzTGx5YVZvTkd0ZGMvemhneVIxb2sxaGYiLCJtYWMiOiJiOWM4YTYxMDMyNjU0NTQ2Y2EwYTY3ZjZlOGIzZmI5MGU4NjJhZjgxMDE4M2IzZjhiYWVlOTFkZDhhNjE3NmYxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-24 12:47:23', '2025-04-24 12:47:23'),
(6, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; ammas_session=eyJpdiI6InFzN25XWDVFS0t0M283OHZmKzFHWlE9PSIsInZhbHVlIjoiZmJEMzVmd3hpNE1VcUtCckN0SWxDdzVJVXp1Tzk4T0xHNFNyOXpNSmFRaUxnQVNWSm9zLzRrVGk1bXBlaTZhenhtM2RVdzMvSktpNE1yNzFraVFzeXNkdjIxeDJZbEVvVzFKQjFwaUdEU0sxMEE3Y284WWR6YmRtU0ZRWHR6cmgiLCJtYWMiOiJkNDM4ZWFjNjNkNzYyY2QwMTVmNzAxYzAxNDBlNTljNTRlZTE4YTUzYTM5YjAzNjA2Yzk3MzgyMjZjMzhjODhjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-25 03:54:12', '2025-04-25 03:54:12'),
(7, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InY0QVRwSnlIUmtLSElubG9KbjMzS0E9PSIsInZhbHVlIjoieXptVm41VFplNytFR08zaUJib2IvRkcrSEdmYlViNzRQbHM3TVFrK29YVVQxaXRhTlYzNUMvUS94YkFkMGppYzZJM3BkelMzWXZrK0srQVF4ZFV6Vzk0Ti9HR0xCeUROTldTZlNNRmRuUkJJZzBEaURjUERjSTlJVTE0c1VVZEoiLCJtYWMiOiI0ZjU5N2MzNWI3ZGNlOWI4ZTQyOTA5ZTdiMDFiYzI2OGU1Y2VmY2E2MDQ2MDRlMWYxYjE5YWRmMGQ0MDU0YTk2IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im9lR3RZdUl6MGQxUHBTVkN1ODZHWUE9PSIsInZhbHVlIjoiM3hkTzBqQUV1L1FzeDg2L0ZiZzAvMjBrN0dPODhleVB5YmZoUndqK1pwRnpUcHZkbzZ3NnJVUU9uQlU1NitTU0xrOExsV09qUlFYcnk1Um45UXk3QkZzRm1zVVpHRk5qK2NqWm9XYTlmZjlPaU8vOWE4bjdBV3hQQjdmWUJzbGIiLCJtYWMiOiJjM2YyOGY5ZTE3NDc5MGU1YTAyZjk0Mjk2Mjk1MDM3ZGZiMWFiMDRmMzk2YzM1NzkwNjExYzdjMmJiYjc3ZDYwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-25 03:54:23', '2025-04-25 03:54:23'),
(8, 'GET', '[]', 'http://localhost:8000/theme-cakes', 'http://localhost:8000/contact-us', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/contact-us\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InlaTEdNZzBEeFZwd2lzZVZhWWcxRHc9PSIsInZhbHVlIjoiZkJaaUtYVUNYdWRoYXBoeUZzbFpwandnYUsyRzFoM1IvMnRUeUNGaGxsUWMrNzl4cHptY1grV0ptYSs0RzFvcUd5LzdYNFdvaFd3SFEvQ3k0Y0xsR1ZSajI2N3pGbURud3NJZWRsVytOeS9vckpGaHNBb0J6SlVRS21NOVFFYU4iLCJtYWMiOiI2NWUzYTMxZWZiNGM3YTMwMGFhYzU1NDhmMzU4NmIyNzg5MGVmYTU0NTlmNDM1M2UzNjM5NmFmZWNkNmZkZmM0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IndxZGpQaFo2VCsyUFpHSUt5Y3NXL2c9PSIsInZhbHVlIjoiWjByNzJuQUQwVVFnK01GQVdxQVR0Vk5MRkw0R3I1MnBRYURqbGVpZTF1QklRSWJqdzdhR1hMSHY2bnB5cGM3NGpKd3IwZ1VBb0ZOSHpab3dXa3VFckZZS2dCOWFSME1QMmk1NlRJTS9nZWlZVndKeGgwSkltZEpQL092dlhZMjMiLCJtYWMiOiI5OWQxNDUzNTYyNmQ4M2Y2YzcxMjc1Y2M0ODRiZjIyOWY4ZTU0ODMyZjQ4NzdjY2FmMDM1Y2YzMjk2ZWIxN2E1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-04-25 12:38:44', '2025-04-25 12:38:44'),
(9, 'GET', '[]', 'http://localhost:8000/photocake', 'http://localhost:8000/theme-cakes', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/theme-cakes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InQyZnFkQ0RGL01lWUlwdFZxVmpteXc9PSIsInZhbHVlIjoiTTFZNFo1WlV6QjRldVV2Wjcrall6dE0vRytxUCt1Zm5WUnVEaEh6TVR4M2RQdEdZM1lrME13aDhrdXZURTV5S3JLVVpCaWd5UkhwOWlnRnRXWkhMOXZjdGs0SEh1YXVPTzJLQjBoK24wUE5maGoxZVJMVUs3UkdCa1drMkIrTkMiLCJtYWMiOiJjODQ3YjQzMmM4YjlhMGUyNjcxZmViODBmYmJlNjVhZDEwMDI3NjllNzY0YWE1Y2RlZDk3ZGQ3YWM4ZTMzOTNlIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkFjY1B3ckJPV09CaWwzUm9mdVhSa0E9PSIsInZhbHVlIjoiWElUK3RmdTJydERxSU9zZ2tvbFJoWms0SkpVQzJxT0JxTWlqcjcvbmpxS1hKK3c2MWU4NUFNZmtVVjloanlzdWZsajR2YVJQWUVKNlowZ3hlc05iMi9kUzRxcW1jTUc5ajBxZWNGbGY2L1BLRWsrZDJaV3JtYlJwbkhybjJHTlQiLCJtYWMiOiI1MWNlMGI3ZTRlM2JmZTY3MmU1YmNiMjdlZjkzYjRjOTY0MGRjNjIyYTkxYWZjNWVhODBkYTI4MzE5MWI2ODE0IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-04-25 12:53:01', '2025-04-25 12:53:01'),
(10, 'GET', '[]', 'http://localhost:8000/snacks', 'http://localhost:8000/photocake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlhaTis5UGhVT1pBU25UeXRLeGgwdVE9PSIsInZhbHVlIjoiS3Q4YXdjRUZscVArSmNTZ0xvRWs0NUlEV0FtYTUyMFpFdFl5a3puZTM2bkZQcC9ReGgwOWJCVVJacGZhQUc2Y3NScG4rUTROZ2w4VDNKNTFCK1MwbldXUXExZk5RTGIvK2VXMlFQZmZYSnBGaVVSa0VVbTJFS25jSmFXNlZiTDEiLCJtYWMiOiJlYzA2NWFhNmM4ZDk5MTcwMDc3MTM5OGU0NmI1OWI3ZmExZDJkNjA2YjA1NjI4Zjk0OGQ0ZWY5MWJjYjIzNDM0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ijk1SFBrQXIxRkp1RkRnWnlEOXZqOEE9PSIsInZhbHVlIjoiUXBqQ2tGeFVRRExFODNsanBLYXdqbWloc2pIYVdRYi9GK3dKMEpRU3BndUZCY3NLeHpSUVhScmxaWS9MOVU1Wk9GWEtUOEtTeG5OcFozYnVYeXZvOENiWHEzUENqcUEyQWJIdHlqNkVjT1hZQlRTNDlrcmthK3B5THlIclBoNC8iLCJtYWMiOiI4OGFhYzA4MTY0NTdhYjc0MjY0ZmMxZGEyNTUyMWM4Y2MzMjY1Mzc1NWY2ODgwNjE2Njk1YzMxYjMwMjQyMzY4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 5, NULL, NULL, 1, '2025-04-25 12:53:05', '2025-04-25 12:53:05'),
(11, 'GET', '[]', 'http://localhost:8000/dessert', 'http://localhost:8000/snacks', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/snacks\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjZlaW1jWGJ3bkFCU2FDMlBVQnl4T1E9PSIsInZhbHVlIjoibldKdGIyUFhNVGRzKzV4OEdHNWZWWnZFaXJVSlRUWmhZVlFSMGhVRkcyT09SUWZmOEREMWRENU1FWDc5UllPYzhGQ1pqNlZsMk1pN1F0eXBNYkQxN0pSM0pKbDJaZ3RGTlEzR1g4WjJtaVl6cmQ2Z01UKzZsZGE5QlNSRy8vbmwiLCJtYWMiOiJhZmZlYzEwZjJmNzcyYzBjYjA3ZTg4NjkyMzIwMWNmMWRiNzgxMTg3MGUzNmU2OWUzZmFkM2FhN2QwM2RiMmQxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjRIbGVBNDZEbHZnR1ludnlrTmpoVUE9PSIsInZhbHVlIjoibG5hSkxzWTZtZzRTN1J1TVUwZlJ3bGJRdlh2VDZIRm41QnhXU0VJZkRYQTQ4WTZiVWtuOXMrRGdLQXBxSGltbEF0N096OWsxdW44STJ5QVJ5aXhkb1ZuVEc4QzVoZDJxMk95MDhuUkcwWFdjNVV2WDNiaC9LcjlPaVpDSFVUY00iLCJtYWMiOiI0YWRhNGIyYWQ0NmUzOTFjNGVlNjUxYTE1MWQ1ODFiZDljNjE3ODA0MWFjNzJjYWE3MWMyODRmMzVjYjM0N2E4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-04-25 12:53:09', '2025-04-25 12:53:09'),
(12, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/dessert', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/dessert\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlUyZDF0b2t1dVBES1pVaklFdWRPMEE9PSIsInZhbHVlIjoiWWVUaEhOaWdla2xDWG5CQTZlRzlob25OTWZyRndMT3psK3dsNFVUNWRFSUY4czBQRDVaUjg1ZTNpbTlydlQzbUFqeExDQWYwMDhEVDNlRXl6MWxTRkZsNldtR2JxZUNXMDBvVisyYkt4Y25xK2Z6UTUwN0ZCQ25rcU96TU5MTjEiLCJtYWMiOiI4MGU3OGVkYmY1YTcwMTQxYWI0Njk2NjRjOGFiZmU0OTllMjgyNjdkNWQ5Njk2ZDVjNjlhNDMxNDQyZDEwNWUxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkY2Mkl0TE5QVTZEb0k3d29XTGxsSmc9PSIsInZhbHVlIjoibEF3N29zMENyY2dQQkdOL2pibXl2dDdHVlRvcDNUWGJlUURrbmtrUG5rQnFOVzY0T3VMSnduVDFYODZld3ZhUVdhK3NMM0JIUXZVVXlEdkVHSXd2TGRLM0dSMm51TVN2Mmh0ZDBsSEFPZURnRE5PTmtxQUUyY056cmRhY1RaVG0iLCJtYWMiOiI4NWZlOWYzY2YyNzdjNDY0NWNkZDQ0YzkxZGQ1ZmU2YmEyY2NmM2UxZjZlY2I3ZjFmMWUyOThmYmVjMTE0NTBiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-04-25 12:53:13', '2025-04-25 12:53:13'),
(13, 'GET', '[]', 'http://localhost:8000/cakes-pastries', 'http://localhost:8000/animal-party-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Google Chrome\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/animal-party-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjVwVVd4WVQvOThaVHUzeStxckJIS3c9PSIsInZhbHVlIjoiYVdTR0ZQbll0d3Q5U011NVFDTWNEVEpaY3Z6WTdnaFhTaURLa1lrTTc4SU95NWU3a0RyU240SHZGTUttVUVxVlhXbWlCM1lib09WUlhyallVWWFwVEwvNHB6RXBHNWs5aDROR1c2dExMUmFYRkhRUzVtdGFtVFNtSGhCdmhSVEQiLCJtYWMiOiI0OTRkZWQ1Mjc5MTliYTY1ZDIzZjk5MmM4Yzk1Yzc5ZDBlYWU5OGNmOTk3MmZmMTA2ZjY3YTU2ZjY0ZmI2YTBjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilh1WjRwQldmU1B1MzN2bHF3TmFmUEE9PSIsInZhbHVlIjoiRVdtOUtGdmFCcGRlS0RES3cvckpkdFFBcDdiR0dpWDFLNXN2MW5RRzdLZHF2L2JvNHVvY09QeWlFWjVqUTVUREllUTNvWENjWjFkdk5BSURRNFdjS2g5eElFNmF3azQ2REZua0NSSUUxVkZzeUVJK3pVZ0x5MTVDdGFLVCtQMDciLCJtYWMiOiI4NmI5NmZkYTNhNGFjNmNkMmY2ZGYzMmNkNWQ1YjY1Y2JmMjlkYmJiYWNhNWRiNWE0OGFhN2U2Y2EyYzU0MzU2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-04-25 12:53:16', '2025-04-25 12:53:17'),
(14, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImphVkoxcVAzT3lGVGx2MjdQUzg3bUE9PSIsInZhbHVlIjoiL2RTMEtOWDBkc2pDd2RuSThJQ0hGaVFnT212MTlhQllVQWRDbWxNK2RMa3FvZmhGVVgyN1BWNkNuNTQvRGd2bHNBMVRVbXF6bzcvWkhMM2tncXA4YWJyNjZHMHNlME5xOGtSS01wNTJvanFXdTRjYjlHOGtIWjJsRm9DSG9hVEUiLCJtYWMiOiI1ZmJjYTY5YWJmYjM5MTg3MDIyZWMxMzMxYjYxNDcxODg3YmQ0MjIzZjhjZTEwNDQxNTNhZjBhNjJhZmRhNmQyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImY1UVp6OWdhRTY0MmxKU24rbTRsSWc9PSIsInZhbHVlIjoick9iUmh4V21NM1ovaU5kSFpVK01YNnJnakVxcjlaZitzZVVmQlptQUc0bGpKb2RXdjNpcU5ua0hiK2prVW9JL0UrQkd0Y2hPczFlV25sMHVmL3ZFR3hvT0tYT082L3h0RG5oSytWU3lYY3kxRmtpWExnQkdKVzhENHVHK3ZhMVAiLCJtYWMiOiIxM2M3NDdkNDFlMzRkYjM2YmNhMTFhM2U3NzYxODAwZjk5ODViYmM4MDEyOWIwNWRmMzUzZDgxOWUzMWU1NDFjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-26 04:18:08', '2025-04-26 04:18:08'),
(15, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Im9IZ3lpVGhZemorQUNPTmxGaG9adHc9PSIsInZhbHVlIjoiU1B4REJrWjVIczJZWnl6S0NrZEMvanR3Tmx0Yys1bENMVWxZTmlGNm40MkxreVFGUFIzZFRrek5oRXBqSC80bVhVUVVha2U2aDNNL1RSZG1iMUdyejI2cnYxN0x0ZFhYZFBBZDd4UXBPRHVUbDNITmdYbkE4SSs2b3laRXlJWEMiLCJtYWMiOiI5MDYyMzIxNzQyNzUxN2UwMjM5OTVmMzkzMGViMDU1MTRmMDZhMGZjNGI0NmIxYTEzNWZjZDQyNjdlYWJkZmE0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlBia1Z2UXF1cmx2VytzWlZEWjRPZHc9PSIsInZhbHVlIjoiZ0p3ZS9tTUgwZlFIcXV5VHd3aEgyMDk0RjdvMlBoSmhSSHZBcTBOMDhZRzJOTnR0ZkZnK2NycDFPYnJKcEk5Q1UyQ3RnYzlDU0RqVWxGWmMzY3FVV1RESW1vOGFuYU15RGdXL0tUMWlMN1JUU1FTWUV5YkFOaUc0QkM1bktoR2ciLCJtYWMiOiI2ODE2ZGFlOWI5YTg4ZTU1YjY4ZDI2NmJmZWUwMWVmZDNlZjlmNDdkNDEwY2MyMGU4ZGFmOTc5MjI4YjdmMDE3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-26 06:06:56', '2025-04-26 06:06:56'),
(16, 'GET', '[]', 'http://localhost:8000/heart-shape-photo-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImZaQUY5SVMzMEY3Z1lHWUNKOURGdkE9PSIsInZhbHVlIjoiY3o4WE1rWnY3ZmxiN05YYmQrU1A0V2V2WHMwdFRLNWkxbXdoelBhdDg2aEMxMTFXYVc4V2NuYnQ0Sng3T0s0QTVkeWU0dWpOVnFCdjRJVmliM2pZK28zY2YzRnVoejdCT2ZVOXljb3BsSmc2TWRvTWtlSUptdUFoM2VZOW9DOHAiLCJtYWMiOiIzNDJhOWFmNTIyNTM4NDM2YWZlMTRmOTg0NTVkYmE0M2Y0YjE4NjFhMjYzNDA0OWRiNjhjM2YzZGNhNjBmM2ZkIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InhSeGpSMlFoVmtFa3JmdHNQOWFXZHc9PSIsInZhbHVlIjoiRjZYOVp6dXVhSWhPMnlDOTQzQ3BIakh1VWZvRldnb0pzTVNtdUZrMC8wZkV6Mlg1d1VVWEJKZWIxSW9ET2J3VHg0RnBZTXlkVSt0aXRzYUNaMzRHaFVUbjhzZVNPcDhtdmprTXRoSzNJTEJ2S01TSGlEWWJqM3J1VVF1d3ZidFgiLCJtYWMiOiIzYWEzNjJkYmM5OTVhMTgzM2NhY2Y3MDdmZTQwNWUwNGJjYTFlYTlmMzQ5Zjg3MWFhOWQzY2Y1ZDI1ZDdlNTc4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, 1, '2025-04-26 06:35:51', '2025-04-26 06:35:51'),
(17, 'GET', '[]', 'http://localhost:8000/cakes-pastries', 'http://localhost:8000/heart-shape-photo-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/heart-shape-photo-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjludjB4MWx3djVQMzBjTFBLZlFYSHc9PSIsInZhbHVlIjoiRzVzMUNpejllNDk3dHAvaTd2YVJBWUlmcmdzZ0NkRkUzOWZjbGo3dFdrY2NINWMyMTd6MEFzRWV4bUcvMk1TMW92eUVqSUl0QW9rU2FKS2pRdWY3Y051TlZlc1dCRkNNcUI5S2pacGRPYWFKRnhKb2s4L0JHMlFVU0d6ZElXRFEiLCJtYWMiOiJkMzRlZGIxZjFmZWM4MTY5NGExZDg3YTk5NjM0ZDY4YzU3OTgyZGNjMDQzYjE1NGMzNjBjMGVlOWFmNzdjZTllIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilgra3RGL2NMdG5xOUxsR1BlMVNLYmc9PSIsInZhbHVlIjoiUUFBYW5ZZXI2TXg4eTlLd2lUSUtwelpuSWI4bFN2RTcyMzFuZHJzOU5WVmhWRjdpWFJMaUhBUFNDYndNcjJYVnRBbWIrcDhEUWFFeDBxakF3enNvUGk1NTBNalhZZTBCU1NINkRLWlZiVnJMVVZXYldER1dWYlhvK1AyTWFLOU4iLCJtYWMiOiI1NGZlZWMxYWRkZjZmNTVkOWZjYjY4NTY3ZmIyMDlmYjEyYTg3ZDA2YzY1NzM5MGE0ZWE4MjZjNjgwNDgwYmEyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-04-26 06:36:19', '2025-04-26 06:36:19'),
(18, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkI3ZXNKbzZaeHRZSXZZSDhGclk1aXc9PSIsInZhbHVlIjoiOFVFUXRreXdCNlJReFpKd25Sb0hRaE5TaEVvVWczL0p3NnY2aE1Hd2dKSEdPWmxlVjgvSFZsOUEwU2hRUmV4M3hoYy9PaG5VcHpFc3JuVnc0RDNrUmdPSXY2Vlo2N3g4SGJ2L2d0bkRRQVREVWtOVVFvMVVHNFV5U0JOTUMxYXMiLCJtYWMiOiJmZTMzYzIxMWY1ZjQ4Y2NlZTU2YTRkN2Q1YTQ1NzdmMTM3NjM1NmU3OTA0ODNmZjU2NWJiZjRkNzVhNzQ0YWRhIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjNRWVRtQnIyYk9mb01ieXdmaHJqZHc9PSIsInZhbHVlIjoiVFRHSkI0bzRvaStXZlFVdkFtMGJyVVFQMU1DMTd2OEVxMHVIbTQyNllJSi8xVGt3WDNCRTlFaXUrb3JDcUV6alNiMU9MWmlGeG8xTUVUR3NSVzRJSVhaRVlsbFhUVHhIZzVQbGt0Z3pxdXNGSzNta2RkSnZERitsTjZ4dmlVN3EiLCJtYWMiOiI4NTRmZTFlYzI1YTgwYjUyY2VkMDAzN2FiNDE4YmI0MTU2ZmE1MTQ5ODliMjI3YTMxZDg1Y2RiNGQ3NzQ1MGNlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-28 04:33:03', '2025-04-28 04:33:03'),
(19, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/customer/account/profile', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"referer\":[\"http:\\/\\/localhost:8000\\/customer\\/account\\/profile\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNyMWJ1ZTc2bU94eVF3S3BtekpQUHc9PSIsInZhbHVlIjoiazA0SkJCLzVtN3Jyc2VtcklBc0dnUjdGeEp6U05DVTl4T0N0Z0xjK0Z6Y2xBTFZQZXFCOGJvdjFTdHJ4MzRQS2ExMlpnTkJ3Qlk1dFdmYTNDZjg0dFhIRjZISk1UMWI5eVA1TzlraFRPaGVPalJUY3k0Z1N3dFRybkt2eU9VamkiLCJtYWMiOiJjNmI4OGEyNWM3NzU5NGMwZDE5Y2ZkMDA1NjBhYzkzZmE5ZmE5YTY3MmE3NWQ0ODA1YmZkN2YxMjdjMDE3MjhjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilp1UnlwVkd2Z0tGVndUVmpqTUFyVnc9PSIsInZhbHVlIjoiNXZiQ3psdVNGSnZaUFZIMHNzZlZhKzJwRklhNGlvWkdlQlpFZFlSd3dLbW9hRFhHNlF1M09GSjFoUVlnU1hZYmNtd0dqaVBSbFBsbW5qMTN2dEJnT2ZDT05yUlNFaXhFTGNtT3pMaG54UjdvaXYwaktTam9oeXJESjVXSEpQTVgiLCJtYWMiOiIxYzE3YmE0MjA0Y2QwOGExMTkxMmVjYzY3YTYzZTYyYzhmZjA1YTYzMzM1ZGM0MDJlOTVjMTVjMDcyZGYxNGJmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-28 06:47:22', '2025-04-28 06:47:22'),
(20, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJoNzVxQy9vRC8zMGw1WjluWG40Unc9PSIsInZhbHVlIjoiN0FTeEw5d3RnRUhkTUUrTFJrWWFzVkFyQXJWcTJKeW9xaW5FclNTMmkwQVRlZ2sxU1hJb1M4TXNEUEl5ZW5tM2xrRnp0V21CZ1dsYkU1cTQzMFZDN3VTaE5ndHRad2NzdWNqeEU1aGF2Q08zYmxKWWtaVm8xYlpzNENLMUgyeHQiLCJtYWMiOiJiMTRhZTk0MjE1NmFjYTBkMjBiMjY2MGM5YTVkMjEyYzU4NTQ2NDNkMTVmYmY3MzdiNWQ3YzQxYjk5MTI2NzNiIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImFsN2NWdkNKVWRaQ25xdVBEWGNDMnc9PSIsInZhbHVlIjoiZ1lrbm5Jcys0S1NBUmxOVTRaRG8xanVIM1JtejJTbmhhYUwrZ2g0cVEzMFRoQlJtRVo5Z3p4MFhFRmFIcjFjaUhoVHhQNU1pN3ExMXRnc2NLZEM2NXFVZnUvRmE5NkpDekxvSnFadmNybXJhZTIxdTkyKzR0VjMrVFo5OHJPUWIiLCJtYWMiOiIxNjE0MTM4M2FlZTkyOWZlZDFlYzdlODhiMDA0NGYyZjY3M2UyYTQ3ZDFmMGEwMzNlNTMyYmE0NDU0MjFkMTAyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-28 06:47:56', '2025-04-28 06:47:56'),
(21, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InlPT3dmdnkxcklwMlpoYkc0OW11RWc9PSIsInZhbHVlIjoiMzBsdkFvdGJ1V2FOV1d2ektsMHpQK3pEZnV1eGxBNWhwY3pCS2hxOXJmQy9tMzdlZ29vWUtJbkl3cDNPTm5WYndkUzJnSEZwd0NNTnFTQjhVTDFhQ253dis5RWpjblRxK0l2NTY5UFA4dzd0U20wVUVCelZxRkdzQXNNcEh6RTQiLCJtYWMiOiJjYjg4YzQ1NzgwZWRhYmY3ZGEzN2FlNWQwOTRkYjU0YTM2MTk3OGI1MzQ2NWYyNWFjMDI1ZWI4OGE5ZTJmZjBmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjJqdXMyNE1ZMGVST2Z5OEJSSG1xUHc9PSIsInZhbHVlIjoibThxeldYbmIzWjdqMDc4aVJPK3dsV3VLZGlqYVhwZ0Z4Znk0SHNIVjRJV0crZ0JuUjRUdGxmU2dJQjZ1dVhrR251UXp0K1Jla0RYVHhVMC9iOHFVNWdwUjg2eiswemNYbTZXOU0wUStFUDU5ZXJFWDVnTFRlaFAzNW55NEM4eVYiLCJtYWMiOiJjM2I3OGIyYTRkZjI2MmNmMjI1NGE1ZTQwYmVkZDVmZGMwZTU1NDc2ZmI0ZGVkNzE4YTgxN2M4N2NmM2NlOGUwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-29 05:05:35', '2025-04-29 05:05:35'),
(22, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/customer/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImZnMDZzT2UyRkpUMHpOaHJ6Ni9DVGc9PSIsInZhbHVlIjoiaTJKeVBCN2ZLcHlXSGo3QW5PYTVzem1OWTZEdmRISE1IMWhzTHI5RTVvRC9iMFgrUnlYcFFkVG9mVXZVcy8vclBqUitxR2M5eFFtbTBWTDFTNmxpRW8wSzFtMHE3Nmd1YU42MVhIMHlLT2Vncm9wV1dwSkVlS2ZWZGI4U1haSTYiLCJtYWMiOiI1ZTMwMzAyYjEyMmNjZTdjOWY1MmY5NzU4ODlkYjBhMzIyMTZhN2ZlZWM1NzY4YmM2ZDJkOTllOTMxOWY2NDA4IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjJ0c0FsM05oRHE4Unc1RHVNL1l6RVE9PSIsInZhbHVlIjoielphWXFKc29HaW5YVWVKL1hiaDVoeFdMZVBBbklDd2Nub2ZmNTV1MFJYeXN6Wm1qc1ZPOXZtckdJNFRONXc2ZWhWZi9kZ3pSVE4yempIcmNFMnFwQVNyRk84Y1JNWUtNWmRoSnBmU2FMaWJ4Y1Z1cU1HeitZcktoSk5pS3dVY1ciLCJtYWMiOiIwNGViMGIyNWFjNGZkMzliN2Y3OTQxNTAzZmMzM2MyZThmZTNmNjUxY2E2YTFjODZjODZmNDNjNmY4ODliZDA5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-29 05:07:05', '2025-04-29 05:07:05'),
(23, 'GET', '[]', 'http://localhost:8000/exotic-fruitz', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlJVYkl3eVRHN1NxaGlHdjVLWjFCNEE9PSIsInZhbHVlIjoibXZGQVUwUjlFckdHN2VqVksybDVLUC9UNGpBTWdUWjZYV2ZManhVODJxSWtXalpDWk1XNHlQZU9nUFpHZWg2VnJCVFFzaWk2Q1o4ckdraC9nU1ZJcXFkaFR6NUFPblhDMm9kZXJNZHJXMEVTWUtaVmpuU3BUVlN2SHpMdWZYOWoiLCJtYWMiOiJhYjkyMzI3MTQ2MzcwZTdlMDFkZmZhNjE4MTkzNzcxYTliYWNjMjRjZmIxMWFiYzc1Yjc2Yzc5MGU1YjIxZGQxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImxBaW52NHBEMVQ3UlFjUi9YaFA4c0E9PSIsInZhbHVlIjoiT0dzUlRGRWJ1RUh0bUNRODFmNVQ1Ymo0M0RJMVlGY1NCSEtrd3diaVlOTi9JdDhsUHM5Rnc3REVSbkRhNG5QVVhQbEprbXEwUDBpK3g3QmRuaVMzd1RmcHo1SXhOK01pYU12YjMrQzdHMkhHZFYxR2F4VGo2aXhLMmlPMmdWK2UiLCJtYWMiOiIyMzYyY2U4MDQ2NjQ4OThmMTYxZjZlN2VlZThhZDg2YmI1ZjYwMzhiODEwMzBlZDIyNDE5NDhiZmI5NGQ3NWVmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-04-29 10:21:06', '2025-04-29 10:21:06');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(24, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/exotic-fruitz', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/exotic-fruitz\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkdNdFF6cjJhMHZQNldlRXhVVXVjVnc9PSIsInZhbHVlIjoiMDUwRUxDbC9wa1dTckUzbGJBTVVneEtiTHVRSVJMeEZUUldxWXVESTNKTkFFWDJseU10Mm1UbDVKR0tzaWZXRVJDTXoxV2VvbjJ4UUltLzlWbXp0SFN2RGZpTWFEVnd1andxc2xQVjBjZldabnF0UG42Q01lYmNITzNWVnZQak0iLCJtYWMiOiJmM2JmZTlhMTBkYzcwMTM0NjVjMDcwMThlZDIzYTA1OGQ3MjI1YjBhZWNmZGY3ODVlYmI4MmZkMjEyZjcyMTkzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ii9UM0E1Ujc5NkVHWkhLalhONEQyRlE9PSIsInZhbHVlIjoiRWwrUzlQOG1CVExiVGg4MXNlR2ZEbWp5QXpSNjkyc0R1a2wzMU81TFhxNWNMME0wbTdGbmhoS1JqTVBUYmxGMEs1aUttUkRYMm1FU1NjZEZmcU9LMlFDTDlRaHhoaDFlQWNmUklpVFltSGk3ekt5L1JUY3NZUFMybE14NTJadlQiLCJtYWMiOiJhYmFmYWE2M2ZmNGZjZmY0MDE3ZDkxZTQ3ZmE2MmJmYTczMTNjNWVhNjE2MzEwZDQxMDkwMzdhYTVlMDAzMzU5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-04-29 10:21:15', '2025-04-29 10:21:15'),
(25, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; ammas_session=eyJpdiI6IlM3bUlvWk1iSmxQeWhkeXdkMzBWN1E9PSIsInZhbHVlIjoiWFIwTUd1dmwreDZyWGdESzYyejdMeS9NZ0xrbVdGV0p3YWJXYi8zSHJmQkd0TTF5Zk5zeE1saEsrSEVVREhyTVZGU01zVjJFZEYyRVQ2aWZ3eVJjZE5xeVcxblZhamtOMC9leHBsY1lLbjNDK2p2OUdRVG5QWmluRURaRFFzZWYiLCJtYWMiOiJjZTMwNzM2NmY5NDEwOWNmMzRjMGNiNTFiM2NmOWMyYzBkMmE1ZTFjY2QwMDZmNjEyMmJiOTMwNjEzYjNlN2FmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-30 04:01:39', '2025-04-30 04:01:39'),
(26, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InlwS045NkpJRnN5NUI2L2c0ZVBZYUE9PSIsInZhbHVlIjoicTdwVjd3OEdDaGlGbHdJRlc3UGFPK1p3c3B1Qmc4M2lweVNDVmhROHM5cU9LVFJUZG5obzI3cTRpMWxDQTZwSTVRWGk4T0J3M0krSTdHSDdraEJsVk1BSEJrMmRtdW5JTmViQko1V3BUeTFXRDdDdFBmb1NXZjZPRk4vblE4Nm4iLCJtYWMiOiJiZTQxMzc2ZTRiNmQ1MTMyNmRjNTQ5ZDFmMmJkMDc1ODBmMDdhYzkwZDkxMmFjMTkyNjdiNzcyOWQwYjQ4YTU3IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InF0NEZMazVBTW9NL2grblJwNDFqUWc9PSIsInZhbHVlIjoiZ2hxclUyUnJLcVVkSTFXclhabXF5dmhTT1JTS2Z3TDV0b2Uxd01EVjUxSVVYOWhVazZTeGtoMzRPaDJDTmQ5ZDE4Q3k2ZWNZVHltVWkrT3o0TlFNeXpQNi9uRHpwUXk0R2Yya2U3Q2pqbStwNmZncHBFVlNKNWovUkNkSnk3dE8iLCJtYWMiOiI4MTIxNDBkM2EyMThjZDNjMzg1MjMwMTU4ZjQ3Mjk3OTEyYWY1M2YwZjI5ODc4ZDE4MGM5ZTA3NmYwMjgxZTgxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-30 04:03:57', '2025-04-30 04:03:57'),
(27, 'GET', '[]', 'http://localhost:8000/theme-cakes', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlgvRjNnbVFzbHU4OWJqNS8rb3UxRHc9PSIsInZhbHVlIjoiSCtkZ2JFVnVwZnhLMEk3ZWlqbC9PVFV5Z081azgzSjdUY0V6THVZaFYrelNMUzlROG9YS3VUSmFmNU0zSW1xMktyRXduTXdyMi9aS0pEZTR5endnbHVlVldJNGJDaE80blZGYmVOSE5ZTnNIU0MwQ3EvYVMvb3lXSmt6WExrWVgiLCJtYWMiOiI2ZWU2YWIzODQ3NTBjNTA4Nzk2NWRiMTMwZjBiNTk2MzI0ZjBhNWMzYmIxMmUwYzE1YzA5YWZhOWQyYzcxNTc5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkUrbEsvWWJlcm5qdlZaOTU1b2pwUWc9PSIsInZhbHVlIjoiKzVCdTZhN3RkR1o5OW9UbXM5QXZPUWF1SktxWFBnSkZ0anllcWFWdzdubzJNcnprMjA2SlptWUpJU3JSaVBKaW0yVXlROXhJWU1jVHBMVkg4R0JXL1hzK3BWNGVvNkxxelpLU0xqcVY0V3NMd3hrNHJ3enEvZXdhTXlQSXYwTHYiLCJtYWMiOiJjZWM1YmZmYTU4MzkxZDNlZjJjNDQzNjcwZDVhOGE3MzY0NWNiNmEyNDcwZWI1NWI2MjlkZDA4ZDdjMGU1NzdhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-04-30 07:03:51', '2025-04-30 07:03:51'),
(28, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/theme-cakes', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/theme-cakes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InZLZjJ1dVpabnV5MjRLVklxdC9qTkE9PSIsInZhbHVlIjoia05RbU1YdFFnRUJYcmpyb1RQM2pUeTZvbjc3Q0JsRVNwVW9YWWJRWVFiVE1wRE9aaGNGd0ZVTEFYWTMyTERTZU4rbjkzcGVQZFFuNlpJbml1VEhaMFVZNzluY1hrVDNKa2ZOeVpnM3VoL1Z1UWNkMWxLbnRsSmc0SnpPL0NjV1QiLCJtYWMiOiIxZDA2YWYwOGMxMjBjNjc3MzcyZGU2ZjdiMDNiNDFmZjczY2I2YzI4N2MyOGU4N2M5NjY0NmVkYTYzOWZkYzUyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IndFV1FsaGtvRUxPek9aZkRBRTNIMEE9PSIsInZhbHVlIjoiQTQzak5vWDNNaE11VEdienhmWk43cGlBb1VVMWNZTUg2c1ZweDM4Tkl5ZWFZUElCS0pWNzRkc2QreXUrL0JzcTZDNVFSbUZoREszRVRpalNta2ovTGZYWWpUSzJCN2VyYXhzWERrQ21kQnRMU054MHpmZlVSVHN6aFI5WjJqVVgiLCJtYWMiOiJkZjdjZjIzNjIwM2VhZThjZTlhYzJhODAwZTU4M2E3NmY2OTVmNGM3NzE0YTY3NDU4ZTJmMWZmY2NlN2RkMjBlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-04-30 07:03:55', '2025-04-30 07:03:55'),
(29, 'GET', '[]', 'http://localhost:8000/photocake', 'http://localhost:8000/theme-cakes', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/theme-cakes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkhwRzdrT2VPL3kwQkJoNEwyaUZiUWc9PSIsInZhbHVlIjoiMDRWaU9qSkc4U0ZMTGM5aDJsa1Rwc2t3UDdpMm1JR2tmUS9GTm85UEFsd1hCZjVmcFNOa21MQ0F0eWhhMTNGYzc3RFF1UXR1VkZYdS9mbWQ1WVA1Y2pncVZJTW96KzRhT3ZMenNzV09iNFE2UVZlT3dUK0dNL3VIR1M1Z0pRY0oiLCJtYWMiOiI2MDNiMTI2Yzg1Y2U0MTBlZmIxYjUzMTI0YjliMTkxNDI0ZjA1NDBhNGE1OTVjOWJlZTM2ZGEyNWM5NmUxN2QzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IitsY0FiNFNLZnhDakFUYmlhZWlKbFE9PSIsInZhbHVlIjoiSXk5SGsrUnNOeit6cWpjZGtQeVJGMFhYSC9qVXhGRzNsMDM5emgxQ0QyaTYrZ0lNNVdqRXJuRGFHYkpGM2R1L0JpM0lNUUZUMVEvMjAxY0I2TFd4cGlUQ0FVbG52ZTFqSThUYkdKK3Z4RWFLeCtCaUF4QXFtaVFnZmdVc1h3NHgiLCJtYWMiOiI5MWUzN2U0NDEzNTNiNmFjMGI1YWViODlmMDNjNThhNzM2ZDE3MjFmY2M3ODYzMGUwMDE1ODdjZDJiMDg5ZDRhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-04-30 11:04:24', '2025-04-30 11:04:24'),
(30, 'GET', '[]', 'http://localhost:8000/heart-shape-photo-cake', 'http://localhost:8000/photocake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkpSRHh6c1FVbzNBaE1FSXdHTU1Ya2c9PSIsInZhbHVlIjoiTE9VbWlCQWQzdTN2TGRLZkxaeGlWNGdZdTJjTHM4TUd3aUt5bHpmZjc5Qk1oR1c5cERMS2QxWTIyRTY0NHVOU0lTaTAzVlU0MFBQU2U4NlBZOHMvUjFTUytsUlA2eHdtNkM4VE1jQkxPN3hmdVRpekRDdmh2aHNpRGNYbDdJRFgiLCJtYWMiOiJjNDNjYjhkYjA3MmM0NDliNDViODkwMmFjNTk3YzI4ZDM1YWEzNzEzZGU1MWE3NWU0NmE1NDBhNmE4NTc2YTUyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImlLQlh2TWhDaG1jQWpaUXRocU5TNGc9PSIsInZhbHVlIjoieFZQUTVpeVQ3L2NCR0MxZ09vZ25WVVFjQ3pvN3Z6K2lleU9IZlA2S1pMajQzdmxxK05jMHczaGpqdjREU2xSeU9mNzdHaG1XZHU5ME00alZYL0xKVGVYY29Jd2N0Z1lxLzd0dDVha3hLM1AzMzRaVTh2d2l2OEhJdkJPMVU5Qk8iLCJtYWMiOiJlOTkxMDIxZTJmYjY0ZTA1ZjU5ODExY2VkYTdkODdmMmRjMTE3MDY1MTIxNDk4ZGE1N2JjNDU0ZTQwNjdhOWU5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, 1, '2025-04-30 11:04:29', '2025-04-30 11:04:29'),
(31, 'GET', '[]', 'http://localhost:8000/exotic-fruitz', 'http://localhost:8000/heart-shape-photo-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/heart-shape-photo-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkphV3A5dGQ4cEUwRThlL2ZDd3lSRUE9PSIsInZhbHVlIjoiWklrM0I4MUM0UTZMMmYzUjBoQ0ZBQU5nZ3FiazF5bThVd1B3bjVhSDFTWWQxNitBSmd5NnptdmZnNHl2WHY1NVVKTC9aR1JCUllGM2RBQVRmVFlReXQ3Q0M5eWFlcUhyUkJKR2toaVBTU21PQTlrM2Y3UG13eDZOeWVGbXpWMVYiLCJtYWMiOiIyYWQ4ZDNmNzM4N2M5ZWVhNzMwYzE1MDczOGQ4ZDBlYjI2MmE5OGYwNDVkZjhhMmI3YzEzMDMzODA0Mjk5YjQxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImhZRWd6UDNUdlFLUy9hN09MbGYxcVE9PSIsInZhbHVlIjoibmFEOHVaWldteUpNcGtRWVMvc3dpV0pMKzJFR2JPQVRqTmhFRWtMVTJKR3Bidzk2OVFiRVZlb1U0Z3FPWVR2MmI3SG9CUkhWa3N1Q1BuajJDMzRwUjRjdi9rYXk5YklFQVd2c040K3h0Ty9SWERVeXVzSEZJQStadWRkNDI5WmkiLCJtYWMiOiJkZDQxMTA4ZjQ4ZjdlZGY2ODAzYzMzY2E1NWQ4NDg3MTQyZjc1YzczNWUyYTkzMmFhNWY0ODIwMTliMzNlY2Q4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-04-30 11:16:00', '2025-04-30 11:16:00'),
(32, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImF0ZHNLMURWL0NGSlB0dHJjVHRRRWc9PSIsInZhbHVlIjoiTFdqcXhWVGJCTGtqL1RVbDJ3bVkvZU5RanZOZlFnQ0tCbHZPSkhHcXVKL3BHN3pYekVUc2lvNmtOU2NCSk94QkNkVzJQbU94a3NCZ0FwY3VPWm5TSXpqc2RZZW9HNk5vOFNtVUhzTkk0czg2R0F2QWtmR0FlWVVheGR6K3FjMXciLCJtYWMiOiI0ZWFiMDMxYjViNGZmMjE5NWQ3MzkzMmFkZTYxODU1NDA3MTM0Zjc4NDcwY2QxNDE5YWY2YmVlN2Y3NjZiMmUwIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjRvbUpmajJsZktpcDlPVGNoTXZjRXc9PSIsInZhbHVlIjoiOWZnZ0NTSGtKQU41YVVvcTNFNnZOV2tuYUhOcHlJTFI1Tk84YTZsVTNjSkNZVjVYTk1DMDVDT1V3QnRndTU5dTVMNGdCYUtFbXBFVEdZRkV4R0VYaHJnS2ZaYkpId3ZrVlBpdE1Zd2gyNlFnWGFWVHovSmR2dW9ieU16cThESG4iLCJtYWMiOiI5NDA0ZTM4ZWIyYTgzNzM2NzIzOTM0OWM0MTM5NzkyNTdjZTA2ZDhlZTcwYjg3YWQ5MWE1Mzg2MTA0ZGQzNDY1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-01 04:23:35', '2025-05-01 04:23:35'),
(33, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/customer/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IlMwM3pFbjBiVDFSSUNrRUdFZXlRb1E9PSIsInZhbHVlIjoiMWVIZUU4eGtZejYvMTdxa2p1OHc4NUdRaCtkTHFMTmhnVEVhU1Y0LytlSzN4Tm95b2c1TW9LU0hIL25pdXZ3NzBzYkNBc1hNMEtwSk5IRW8rTlFSbU91Q1p5VjR2SlpYOWcyWlMyd0ZWLzhPWTRTb1RLWVRHRjljZ21pM3NzdGYiLCJtYWMiOiIxNmUwZDBiMzY1ODRmNDIxOGVlNDc2ZjE2MWQxODU3NmU3OTFkNTBkNWM2ZTNjYjk1MTc1OTE2YTBlMGE3NDJkIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlRWaEl5TkZhbWQyeG9RU3pmZ3pmZnc9PSIsInZhbHVlIjoiQ1RBSHN0VTkxSThZZ1pYdWtiejFYY3RRc2pPUlduUXRuMmlKc24vZWdGSXFyWkVDVWVJUThBc2NRS1FxUWNLUEk4dXhnQWsyVW1md2V3azkwYlVzQ1R3R3RGTkl0VGwyb2hhQ25MVFIrL3lsdGFZN3ZVTVBLdEthMjZNRkhoeUUiLCJtYWMiOiJlNWVlNTVkZTMwOTk5NjlhZGYzODRlYTNmZGQ3MmYwMmE4YWVjNjgyZThkMTRkN2YyMTQ3MjE2MjIwYWI2MjMyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-01 07:21:17', '2025-05-01 07:21:17'),
(34, 'GET', '[]', 'http://localhost:8000/animal-theme-cake-3kg', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6ImVDOUNTNDdhUW1qeE9JL082YlpLUXc9PSIsInZhbHVlIjoiNlAzZHd1bkY2OEhrYlpTTnhIZVB3S1BCek9EYlNOSGJjc2RPY2ZobUhvcHVrN1h4RjJyanhEeTE5eWdWRE9jN29mRHhMZ0p3RmxMNFdpaTB3NzNoTmZCa2FVN1NMSjF3ZUtYZzhtS1UyZlg2Q2ZUaWZidmtpR01NV3R4Mlc1Z1AiLCJtYWMiOiI4MmExNDlkMDNlNDQ0OTliYzk3Y2EzYzc0NzIwYTZkZDJlOWYwMDRlMjg0Zjg0YzUxOTgyZDAzZDhkNjYzNDk3IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InMyeld4eVdabG1tc0hzYm5WZ1d5Y1E9PSIsInZhbHVlIjoiNWlJeXlMYVcrZUZsR1pudlB2bHZDbkNNYjNkbDNLbXRER3JlOVR3N01CekFOZDlueGtzVDgzdGQ1bExYQ2hUQ2FJUVZ1UHRIMzdWQTVzSjBia2hwMHlsajFCc1BXWEFZQVVuR3ZrVGlTcEZhN2V0WUVCL0VudkxxUWxmcWplWTYiLCJtYWMiOiIzNjljYjE3NmNhYTM4MDY3ZjJiZGFhZWFhOWNhM2NjMjkwZGJiMzNlNTdlNjliMGZjMzMwY2E0YWVlYzcwMDM0IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-05-01 07:21:23', '2025-05-01 07:21:23'),
(35, 'GET', '[]', 'http://localhost:8000/photocake', 'http://localhost:8000/animal-theme-cake-3kg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/animal-theme-cake-3kg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IkYxWGN1STdJMDhrdVhmaGNMWEtsS3c9PSIsInZhbHVlIjoiZzZTOW5vM0ZDdFIyRVV1WHAvYWE2Z0pIWXg1RmdRNjFKeHBjL3R0TmRVdXZnZG04ekRlOFh1RHZMS05aVktvaW53cFBMTTlaRGJjbVFjZFdiNVRscXhianhWUTVqY3h6aWRMelphU292bVEyQnNpQjFsTjRoMmtuTzRqeUtlTjAiLCJtYWMiOiI2YjE0ODIxOGVjMmM3MGM2YTRmZDkxYzAwMGIyOGU3MmRkMWUzNGRhODRhNmMwOTNkZjc3OTYxNTAzMzIwMWYxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im1WdHpOSVp2cEJNRmR3T0xNRlBEclE9PSIsInZhbHVlIjoiWnUzM2ZTRVJMWjhaYytGaDdoblU1MXhHZlhQa1VpQUlsQytGdkM2S3dUZWQ1UHFROTVUbUdGWm9VNE83TzQzYjBua29URnZnWjVPRHN3aEZPVVk5dHBUNEZYaHdjUFFGNHNPeTZCZmFXWk5tMnUxNW5hSnhxcW00UGpQOElDdEwiLCJtYWMiOiJjN2RhMDZlYmI2YWMzNmYxZWIxZjk4YmU0MGJkNjI4NzBmNGY5ZDFiOTk5NDNmM2ZmMTZlYTVhODNkYTAwMTIxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-05-01 07:21:38', '2025-05-01 07:21:38'),
(36, 'GET', '[]', 'http://localhost:8000/jungle-theme-pink-cakes', 'http://localhost:8000/photocake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IjREWHl4RGNnVkprczJRRUVTWUsxYmc9PSIsInZhbHVlIjoidUVWREQyZGVtZmEyZC9FRE81RVNlcWViSFZ6Y0Z1dEY2TmtYMUwveTczOUpJakhZTEQvMUVJbEFaTkY4ZTNKaWpLSzdvSk9XYTZJQUFUV3J1ZmRkODZGRlRMQkpXcDRNemxuNVdmNmpGTHpuUXZIRUVzc3JzNWNFaG9GUm9RalMiLCJtYWMiOiI5OWRkY2QyNzQxZGJhZjY4MGFlNDI1MTAzMjIwZjFjM2I0ZGE4MDk4MzE0MWZhODE0NzgyOThjMzBkNTk0NTYyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IncyM3hsTFJFRGFDdUl1WC82Tm1Db2c9PSIsInZhbHVlIjoiYlpZSHVwOHF4L1BlTVNVQ2UyREk4V3YvMlFCOVliZUNmT1dQaEJldE5veHFlMGw1MGxLS3NHUkk1cGJGRVdRZG0yV1ptU1g3bjNzRFIvQXFMWnVkend4eGZuZ1d1SHRhR3hmYzJYSnpOT1VITnNwd3NuMkNPaWRmdkI4MDNFMXciLCJtYWMiOiIzNzQ1ZDk0Mzk0M2E5N2FiYTVhN2FkZjdlYjU0OTYzNWMzYzkxMjM5OGU5MjY1YmRiYzg3YTJkMmYyYzc5MjQ4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, 1, '2025-05-01 07:21:42', '2025-05-01 07:21:42'),
(37, 'GET', '[]', 'http://localhost:8000/cakes-pastries', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6ImtyRmZNYmJ0aFpocXdheW05YWJ0eUE9PSIsInZhbHVlIjoidS8xRUNUNFlEZmErUWs4L1ZIaUhvLzJzS0x2NXdxcE5XM2U2Sm5tU3E0ays3WWtsNWFpSnRvdFlSQ1ExV1Z5WVg2WDVacUhPTVFtekVBeVVlRU5iTm9iamJxbUQyWUFCakp1OU9heFJqdDBadFV2aHBGSk1mZTl4cnFFNmo2UjUiLCJtYWMiOiJiMGI0ZjZiODU4ZTc5MzVlNTFiMjNmMWU1YjdmZTEzMTlkMzg1ODI5NDZlOWJiMDM5NDY2MzI0ZWNlYTBkMzgwIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InJJYmFqek9YcnAzSUJ0ZE5SNVpTZXc9PSIsInZhbHVlIjoiZmtCVlh2bkdHbE13b1RPblJJV2NwdExjSmFJRHB6ZG0rOTlza0VETDhidmNqSkc1SFRQYmNxeThsMUFac0dHVnJHL053c1o0Y09PcXovL1NKa2kzYUlEMkVNNEVTNWpGQnArOVNXelZHN0t5SkdnNDhxMENLWXBYQWZkUTVXeHEiLCJtYWMiOiI0ZmFmYTk5YTk1NTFmNDlmNDk4OWJiNTU0YTk4ZmVlOWJlOGM4MmVkMDdhYzM5MDhhYmNhY2IzMmQyN2QwZjQ4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-05-01 07:22:08', '2025-05-01 07:22:08'),
(38, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/cakes-pastries', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/cakes-pastries\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IjR6enhPbFA2QUhDT0JyUytQdmFUeWc9PSIsInZhbHVlIjoiUWdvWVBtenJWVHBuZ1JUc2QyTHJ4UllRMGs0M0xnaytHTXE5SWNLK2loaFhBQ2VpRytXcW5WSXROWjEvNjd1ZFRxbE5mb0Q2Z1d5L2FmU0JNVFVPVEx4S2JKUW5odGxvangwcEIxOEJqa0RQMnhmNUNCT01YMGJHUUdTVlkvbkoiLCJtYWMiOiIyNTY1Mjc1Y2Y5YzA5NjVjODY2ZDUwZTFhMGYyZWExNjFmMDRlZWY5NDU4YmIzYWZlY2ViNjgwZjYxZWJiZjk1IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IngyTnZRTnEvWjdKQ0NZZmUycUlhSHc9PSIsInZhbHVlIjoiQUtKQjgzczRFelhaalRkMTVYbmV0R1pkdkZxQVhWOVNob1JId1ZYUHVvZU9jYXZTM3plRlY3ZkVUQ1hKZFgxWDFWK3o5M3dUZXlnNVpHL0xMak14RWNadUhRZDRGekVUN0I1OTAyNXFoSkpIZzBNZzNWcGxoQTQydXNsY0RlQSsiLCJtYWMiOiJhN2I0ZmE4MjFjMTFjZDM4MDU1OThlOWUzNzAxNTQ5YzU5MmYxNjViODBlNjNkZmI4NTgyNzI1NTUxZTIwM2QzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-01 07:23:03', '2025-05-01 07:23:03'),
(39, 'GET', '[]', 'http://localhost:8000/minimal-forest-cake', 'http://localhost:8000/cakes-pastries', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/cakes-pastries\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IkEwa0FHWnN4V0kweXpyL1VyKzVwckE9PSIsInZhbHVlIjoiazV5a1d1a1QvcHlUZ3QwSzRIekJ3N0hOL1hJRE52NkpncHU5b2pTZHFYZzloNVN3a0owVkFyUG9vQ0hDQm9CYlV0UkZHZU5Ebjduc0pZZVpETWFDQUtuVnVWckpMMlRtS01BSGFJZ1pNang5bHdTV2x6OEtZakw0bHRTMUlxczYiLCJtYWMiOiJlMzVmNDhhOWQwYzM3ZDNmMDU4ODg1MzM5YmQ1MjlkYjkxYmFlYjVlYmVkZTY3YzFhYzQ0YjhlNjVlZmJjZjlhIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjZwbGxKcmlYWURDMlNGcHJCNnBBb2c9PSIsInZhbHVlIjoieFVVZFpQdUVta3hFa2NvZkQwZ1RndElmYy85RFJjTDdUVHJUSTZaYWZnM1dEU0U4UHZVTHZKSnFOSVVYREdnQmF4a0YwaXJNTlZDaDZET05SaXVnVFFFRWkyU3diUHNzdlhkMmhCNXhUK1U0T0FRaHRFOS9qOW5HMElXb3F2aHgiLCJtYWMiOiJkYWYxYTQ0YzVkZGIwNmYxMTgwNzk0YjE2MDBmNWQ0ODc4ZjZmNmZkNDAzNmI5ZTA5NzkxZmU3NTRjMWMzNmNiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, 1, '2025-05-01 07:25:41', '2025-05-01 07:25:41'),
(40, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IkZobFRaRVBTK1grU0VtdS8zMjY1SkE9PSIsInZhbHVlIjoicFF2Qk1nd243MUQxNHg4S2p4Z1lmWWc4ZTB0emFIOVgyWUZybE91WjM3OXYyQkpUUjllemwwOUVVdTV2bmV4RHpkMUkxS1FWTmxCdXlpSTFSVVFscTFFTFE4UnJNRlBUa0Nmb1FzOUt6dEIvTGJBMEtZaVdrZ1dLeTJjSFBPYjciLCJtYWMiOiJkYzZkNDM0M2MxZDlkM2FiMWUxOGJiNTdlOTljOTZjODlmMWY0MDkwZTdhMjhjYWI2MjQ5OWY1YzkzNzRkMjllIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImZDcTV4MElPclIvVnhyT2ptbFE3U3c9PSIsInZhbHVlIjoiV1AycVpsNyt6bHlXQmwxREgxeFlkaEk5K3hlQVRvenEwcTh6N2xMUjNSRjNoV29hTmk1bFdnSGN0WGlCZmM0UGNla0tPT1BicjZoNDVXb0pTSm95ZHprY3NvczFHeHMxUlA3TEZpd1lnb2hPRFJiYWVwbmRmVk1tcFpDZHBzR0oiLCJtYWMiOiI2Y2U1Njk5ZjFhMDU2N2RkYzkwMTcyMDAwZmJlYWE5OGIwZjFlYjkwNzgxZGEzNzYxNTM2YmZmZWFiZTU5ZTRjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-02 04:38:24', '2025-05-02 04:38:24'),
(41, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/admin/dashboard', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IlNEWE9oK1VPajZHY2FOaERWUHFXK2c9PSIsInZhbHVlIjoiNWxzelQ4VUlzWjcrdUxCOG1GVzlNaDZrN1ZRaTdGMnM0MUtOY2J0UTNYOFJGakxQWnN4YS8rMXMxQ0ZKalZ3eDB0UVBFU01ZTE9VVFQzL0VwaE91VlkzaUtZUnJJeE9MKytQcHpQdGpyWDlaWmhXdmNIaEJPejhvNmU3eVMxWW8iLCJtYWMiOiJhYjM3ODliYmJjNjU1NDliMTU2MGQ2MzRmZjBhYmUzOWY5YjUwYzI3NjE0ZGM0NDVjZmEzNTMyNzA4NWY1Zjc5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Imo4RnB3MGllYVpSYVBPZ3hTNTVjS1E9PSIsInZhbHVlIjoibnU4TEU4bTJkY0E0TEUxYmFiWFRuMzFTT1loUnVGcEJuYlpjZE45OHFPUXFva2VGN09HQmVEclJFeklpVEFrS01vNThvRFV5T2w3eTRPWWJFb1c1cHpnMXVGRHFZUU5ub3B4dDRpWWpBb1hESlVvZGNKT2ZsYVMrbDNjVTg0Z3QiLCJtYWMiOiIxZTM3MDQ3ZmEyZjg1YTc1NDlkOGVlNDI1YjFhNjNhYWI4NmIxZjY2ZWI3ZTJkNzNiNWU0NWNlMTkyOTI0ZDM2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-02 04:49:30', '2025-05-02 04:49:30'),
(42, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6Ik9JQjVxN2xqaW9RaThwdUF6NEw3b2c9PSIsInZhbHVlIjoiQUVzMmpkV1E1YUhMTm1sL1NScm9LZ1E5RFNyRWpUbk5SYjVWbzBaUjV0L2d2V3ZKUHpMcVJrdGVpVzNOOFBWbjBkdUhxVCsvM1ZTcWJxTy9FZDVQMkhRaXVpOVY2M29rdXNRdFVKTTlHdW9UaHl5ZVFiRldJbEU2VStveGlnRHEiLCJtYWMiOiIwNjc1NWUwMTc5YmRhM2NhYWNlZTk3ZTYyM2VhYjZkNTgxMjgyYmNhNzA2MmY3NWZjMDViNWRlMjZkYTljODg2IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjVXWnBXbFhEZkZiTWJIOWwxSFlrTmc9PSIsInZhbHVlIjoiL2R2dmttWm5OVVRJRThQcENZc1Z3eUJnZGFSbnlFK3dZQ1kydkQ2TFNOc0pPUW1Vdnl3U01rR3ZLdWFlMTJVb1FDcGFwWlByNGc5L2huTUF1ZnVlcGFuQzdBdDF4YXBqK01VWGJnSk15V0E2cmd5Tk9SendmVmY0cStBalppdlUiLCJtYWMiOiJjZjU0YWE1M2MwM2RmMGJiZWIzZWI2YzliMGQ0MDU2YmFhNDc2YzJhZGUzMWJiZGJkNTNiMjIyMzA1MGE2YTZlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-02 08:13:28', '2025-05-02 08:13:28'),
(43, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/giftcard', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/giftcard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IkJZZzJGdjR5a2FvcEtFWXJuTm93Rmc9PSIsInZhbHVlIjoibnRLdElJaVF2SE5Id0JFaDQ0Y3V0dzlzUVpGajRUaFFiM3NYck45eldvaktYUFVuWWFmdVo5NFk2S3FUTmdlb2tXL01ua1NaNlpHem8yTVd5OVRiOTVvNDl2SUJoZlkxUU8ySkxHQXR6SnFvOWNnb3hHaUd6bGNOdEllMlJRWXMiLCJtYWMiOiIyMTAwZjg0ZDg1ZjMxZDgwZDNmMzQxODcxMGJjZTExNzZhNjdiNzQwNWQ5NGRmMTZiY2I3ODZjNGIwOTE5YzE1IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlNQTmtiNWt2YW1CcmhBc1VDcVUzUlE9PSIsInZhbHVlIjoiZ3JQaDFzclQvRWoxT0R2eUlEM0pxdjdGeXY4MHpzWHkybHhkckRuSVFDZGlwWU5tL2VFcnY1SkFVNEpVZEE4QjlWNVNsRllhSXJycEFPSEQ4d0tLeHR1N1RtV2dzdEtVNTlqTWRLUnVLRFR3ZlBzTU5FVXlMY2p1eXJlbG9hYlQiLCJtYWMiOiI1NDFmZGJhMDQzY2MyMTFkMGFjMDJhOTliMjMyNTBjNDZhODhiYzIwYzAzMzMyYjYzYTMzOTQ2OTAxMWJkNWQwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-02 08:14:47', '2025-05-02 08:14:47'),
(44, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; XSRF-TOKEN=eyJpdiI6IjY2NkFmQ1RrcC9iWHlmMEhRNDVVZFE9PSIsInZhbHVlIjoicSsvdmFuY0ZpbE9aYTFTNlRkWXJVeHRnUnhwMTFFa3RQamY0dEJPWEdxMlIxaTBXUllhQU44WU0vRFFjdkFrMFc2M0pRRk54NnpoYWZOeG4ySjVOQmtqU3VHb0dYRGJzajIwUGFwdHdhUDJVWUlEcEZvZ21Hem1iWkNzZEpXOFciLCJtYWMiOiJjNzkzYWVhMzE2NTI5MTMzNWFmNzEyZTU2NjFhNWU4MTE1NWNkMWNjOGI1MzBiMzNjYWNhMjI5NGIzZWJhMGNiIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilo1Y0ljRlF4dnlTaFZCL3NQaEMzM0E9PSIsInZhbHVlIjoiS2U2UlBpY1FOR0lKeEZJVDRUOXZRWCtxbmJuNnRTNi9BeVh1cUF4R1BWMTVmdERZamFiMFBuWDJhRjc4WXNkaDdMc1g3SDBzS01nVUlYeUs3UjhJQ2VyRUtqM2ZPSmcxcktMeVJCWU1jS09LMGZWcEc0QzVCU25Pa0NRVlNObFEiLCJtYWMiOiJmNjVjYWFiNzFmMWRmODNlYjlhNDZhNDZmOTIxNzNkZDI5ZWM4ZmI3YmNlMGQ4YzJiNDg3YTA5YmY3ZTk2MGY2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-02 09:36:32', '2025-05-02 09:36:32'),
(45, 'GET', '[]', 'http://localhost:8000/theme-cakes', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImRNbVI5UkdGcGNxTmVUSjJJU1FGemc9PSIsInZhbHVlIjoiRkdwTWJ5WENaVUVLYTVjTlJqREQ3L21sY25xUklLRzMxL2poTEVkUmdOa2R0bng2aDZCc3VJM0x5UEtCRXhSOE9GMlRsZ3hBTWYwa0hFSUphcHlUSlFsYkN1TEU1eVVWdHNmTnFYWW5sY1EvZzRXbXVXbWhVTjk4N0NOdFRyUDIiLCJtYWMiOiI1NDUzMDc2NGM3ZTU0MzU2YjcxNzQ1ZjBhYjc0MTNiYTkwMjg5ZGExNjA1ZTZlMDhlODdjYjU0Zjg2NTQxNWViIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InZYWlZNMUlOcFJKbVZRZEczQlFOcmc9PSIsInZhbHVlIjoiKzM3WEVYSXo0M1g3Mm14cGVUbldBWUVjdmJhM1hVeDdOdmpoRVNvamZaOW9XTjVSY0ZGa0NGZnh1dFNOQUdVcmhlR1VpMjM0WDB2KzdoYm51dXVJMktZQ3E1YUxjMzJIeUl5MlcxRy9mSHlWbGdUbnI5d1lnVDlIeDBqaFRnNHEiLCJtYWMiOiJkOThkYTIzZGVkZjJjZDI3ZWRlZTBiOWEzZTMwZjBjYjg3YjE4MjVkYWQxODIyNDcwZmUwMmY5OTAxNmY4OTIxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-05-09 08:26:21', '2025-05-09 08:26:21'),
(46, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IkQ5VzZvNUREY0hRNk9ZZUpWME5GOWc9PSIsInZhbHVlIjoiU0dGRjJEUSs5VVJhb3NaTXRCTW5jUmdOMTFrQmFOZEs4U3Y2OU43bURhdmhEQlBCVnlQb1Urdm1hU2w0UjgwZi9zSlpRdkNoeFBVM3F1OWg1Tm5UbGNlbVVCeEo4UTlQdXdiMmZaS29QVjB5TUdOL25KbU9XbnJrY3V0SUpUR2wiLCJtYWMiOiI5NDRjYTg1NDIzN2QwNzFmY2E2OTFmY2Y2YjQwNWE2YjE2NmU3YmJjMjE3OTZkNDNiYTQ0MmQzOTczZGQwZDFlIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkxPMk5IVi9xSHllMUIxSysrc3J3blE9PSIsInZhbHVlIjoiSnBYdzhycjloUlNSa3FPYzR1dFByU2hFK1RkMmNMczEwTXF2ZUxsWHRqSEZQSU1WMTNaWlBrT2lhQWh6bStjcVVoZVlETUJhZlEzaEMwWU5GRmppaXR3Q01xaExpMWV5YVRzemNYVUxFUG5CakZIK0RoUE9NcGtjV3RMSGZCQXgiLCJtYWMiOiI5NTY2ZTJkOGJjODhkNGJjMzIxOWU0MzkzYTE2YmFiOWVhZTFlNWExMjlhYTNlZTk0N2U3NTg4ZGNlZGViODEyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:33', '2025-05-09 08:31:33');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(47, 'GET', '[]', 'http://localhost:8000/storage/channel/1/GY4KPaunigH9DJmC86iua6bptTxGAGlUf0uiUtiH.png', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6Im4ybHo0QXhWZG1VU0tzQUFUckRCY1E9PSIsInZhbHVlIjoieE13TDBxdU52cXl3UU96b1J4VXhzN083WkVlVEN3R3RkTGh2NVV5UmU3UnlKN2dYUDA4VkFjZVcvMkJtM2NKZEx6ekdId1l5OXhsek9MVy9lbklqamtlNFlsNDJjUW5NVjdCeU45NU1lNm9acjBvNEpPam5ubHIzaG5kK3ZBQ3AiLCJtYWMiOiJhZTNiZmE4ODM2YjhjODlhZGVkMGYzYWQxNTAxNmQ1N2YwNmJmMmQzNmQ1M2I1OWMwNDc3NmRjODY3ZTFlNjk5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjVKTFAvUXJSWFJvQjRhM0xOdjFMQ1E9PSIsInZhbHVlIjoiMFN5N2VndFpnYjhHWERheDRkWFBKdlZWbFd6ZkVhSlh1aWVncFJrVTVlQVkzaSt1US9CQzVMY0ZkNURycDB1WGIyZ2dQV2Jxb2tMZEpoenFJMU56VzFSbU02OHdxajlXOXl1ajJ3TDF5dEc3K1J4SWFPNkpFZDYwUkxabzBJM1ciLCJtYWMiOiI5NzMwMDkwODkzMmEyNDc0Yjg2MGJjZDQ5ZWU2MTM5N2IwYWRhMGIxOGQ3N2I5Yjk3YTFmNWRlNjgyNzA1ZDQwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:35', '2025-05-09 08:31:35'),
(48, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImZHY3BQWGJJbVQxRHhCRHhmTjM2Smc9PSIsInZhbHVlIjoiSDQ5OTJqM2VIZHdObDg4UE5BRjlIQytvZkZMOU9QUzlEZmlhY2hEWmNKR1d4T3BpZWpJeE5uY0srQWpuZ25DcUc2b285bGtKSDBMbmRySXkxRFBaTjNHL0FxN2krWThLaEhoeGNIWW82UVViOWV2NGFWTUUvclZ0NjJ3Z294aGUiLCJtYWMiOiIzZGE5M2U0MTA5M2ZjMGJjNTJhZjExMTkwZDg5Zjk3ODM4ZDhiNTY4ZjEzNWJlY2JmZDI3YWFhMGM0ZTZiMjJiIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im9PYlR5RE84YVp2ODhMa0FVd2VPdmc9PSIsInZhbHVlIjoiVHZ1MGhqUjZzUUxYRHVyUGE4Z3J2ZmMrWmpIV0RSNndLdWdlSHNTWjBYMW1kcDE4cEtnMHZKRVhzN1dMazhPWkVVYzgrQk93cDFUTC9lelpQcVc3d3dtdURrVFZsR09XRTFabXd6eDZqaXdLb05mSUgwWXIxdzl0aCtKV3ZoOVQiLCJtYWMiOiI4ZTRmZjQzY2E2ZDFhNDA4NGZmNGQ1MTBjNjQwMWI5NDhhMjYxODAyZTJiYmVmOGVmMzUyYTY4N2ZkZmIyYTM1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:36', '2025-05-09 08:31:36'),
(49, 'GET', '[]', 'http://localhost:8000/storage/configuration/2XF0Qch9n500NM4IoMCS2OF4ezdvMBH0L4EFYuvD.png', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImZHY3BQWGJJbVQxRHhCRHhmTjM2Smc9PSIsInZhbHVlIjoiSDQ5OTJqM2VIZHdObDg4UE5BRjlIQytvZkZMOU9QUzlEZmlhY2hEWmNKR1d4T3BpZWpJeE5uY0srQWpuZ25DcUc2b285bGtKSDBMbmRySXkxRFBaTjNHL0FxN2krWThLaEhoeGNIWW82UVViOWV2NGFWTUUvclZ0NjJ3Z294aGUiLCJtYWMiOiIzZGE5M2U0MTA5M2ZjMGJjNTJhZjExMTkwZDg5Zjk3ODM4ZDhiNTY4ZjEzNWJlY2JmZDI3YWFhMGM0ZTZiMjJiIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im9PYlR5RE84YVp2ODhMa0FVd2VPdmc9PSIsInZhbHVlIjoiVHZ1MGhqUjZzUUxYRHVyUGE4Z3J2ZmMrWmpIV0RSNndLdWdlSHNTWjBYMW1kcDE4cEtnMHZKRVhzN1dMazhPWkVVYzgrQk93cDFUTC9lelpQcVc3d3dtdURrVFZsR09XRTFabXd6eDZqaXdLb05mSUgwWXIxdzl0aCtKV3ZoOVQiLCJtYWMiOiI4ZTRmZjQzY2E2ZDFhNDA4NGZmNGQ1MTBjNjQwMWI5NDhhMjYxODAyZTJiYmVmOGVmMzUyYTY4N2ZkZmIyYTM1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:36', '2025-05-09 08:31:36'),
(50, 'GET', '[]', 'http://localhost:8000/storage/channel/1/X8bzB5k4D5IFtofOxQROqgPFcxe5CHQlnqY2vAzp.png', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImZHY3BQWGJJbVQxRHhCRHhmTjM2Smc9PSIsInZhbHVlIjoiSDQ5OTJqM2VIZHdObDg4UE5BRjlIQytvZkZMOU9QUzlEZmlhY2hEWmNKR1d4T3BpZWpJeE5uY0srQWpuZ25DcUc2b285bGtKSDBMbmRySXkxRFBaTjNHL0FxN2krWThLaEhoeGNIWW82UVViOWV2NGFWTUUvclZ0NjJ3Z294aGUiLCJtYWMiOiIzZGE5M2U0MTA5M2ZjMGJjNTJhZjExMTkwZDg5Zjk3ODM4ZDhiNTY4ZjEzNWJlY2JmZDI3YWFhMGM0ZTZiMjJiIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im9PYlR5RE84YVp2ODhMa0FVd2VPdmc9PSIsInZhbHVlIjoiVHZ1MGhqUjZzUUxYRHVyUGE4Z3J2ZmMrWmpIV0RSNndLdWdlSHNTWjBYMW1kcDE4cEtnMHZKRVhzN1dMazhPWkVVYzgrQk93cDFUTC9lelpQcVc3d3dtdURrVFZsR09XRTFabXd6eDZqaXdLb05mSUgwWXIxdzl0aCtKV3ZoOVQiLCJtYWMiOiI4ZTRmZjQzY2E2ZDFhNDA4NGZmNGQ1MTBjNjQwMWI5NDhhMjYxODAyZTJiYmVmOGVmMzUyYTY4N2ZkZmIyYTM1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:40', '2025-05-09 08:31:40'),
(51, 'GET', '[]', 'http://localhost:8000/storage/theme/1/GsaG6rZvt3tvvu3dKTZiCTjKDQgCNImPx1z90aqm.webp', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IndkZ3hyK21zbnNUV05sWFpqbWZDeWc9PSIsInZhbHVlIjoiR05oKzBiZjI2b0lDbjdNQ3BYNUcvcXZQMUdXWFUvaXN4R1pRUWdlK3h4V3lhMHhrSkwzUmprakU1TXlCL1FNN0dudVlxOVE5Vjc4VTA0RVNxK0hBSTN3TGNDWEw1ZTZJempFVUxkMWtNSTFnR3dqbk1ReHpyeS8yNjk2c0pTSUgiLCJtYWMiOiIxNDY5YWJjYmIxYTAyOTc4Zjg1MjBhODI1ZjY3MDUyZjllNDA5MjNiYTIwNWE0ODY2MGE4ZDY3ODM0ZTI3NTA5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im04Qkh5SHArTXBYVEllT0w5R3ptWVE9PSIsInZhbHVlIjoiSDZDTTRNNVFGWVExMlVEQXFaMklzRGtUTzJDd1NjT3JvN0VVNWVEZXYrZGRSM1lXUnJUcXlXczVPbVhPNm1WU1lHTDVyV3V5MWVKRGlCVGZwS1NGbjdpYjFtNDRoQjBnOHNDRGxaMmY4N3hyRXZMTXIvdkhmU2xNajRmK1FCY1giLCJtYWMiOiJjYWRlY2YyMmRmOTc5MGE0ZTc3ZjdhMjU5Yzc1ZGE2ODc4ZjY1MjZmNjhjNTM4NjhkMTZjM2JkNGYxNTUyMzk1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:42', '2025-05-09 08:31:42'),
(52, 'GET', '[]', 'http://localhost:8000/storage/theme/1/6dAp793whvKZGFAGcH2K9VqXxxVD2ZrhRpyrS9k5.webp', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IndkZ3hyK21zbnNUV05sWFpqbWZDeWc9PSIsInZhbHVlIjoiR05oKzBiZjI2b0lDbjdNQ3BYNUcvcXZQMUdXWFUvaXN4R1pRUWdlK3h4V3lhMHhrSkwzUmprakU1TXlCL1FNN0dudVlxOVE5Vjc4VTA0RVNxK0hBSTN3TGNDWEw1ZTZJempFVUxkMWtNSTFnR3dqbk1ReHpyeS8yNjk2c0pTSUgiLCJtYWMiOiIxNDY5YWJjYmIxYTAyOTc4Zjg1MjBhODI1ZjY3MDUyZjllNDA5MjNiYTIwNWE0ODY2MGE4ZDY3ODM0ZTI3NTA5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im04Qkh5SHArTXBYVEllT0w5R3ptWVE9PSIsInZhbHVlIjoiSDZDTTRNNVFGWVExMlVEQXFaMklzRGtUTzJDd1NjT3JvN0VVNWVEZXYrZGRSM1lXUnJUcXlXczVPbVhPNm1WU1lHTDVyV3V5MWVKRGlCVGZwS1NGbjdpYjFtNDRoQjBnOHNDRGxaMmY4N3hyRXZMTXIvdkhmU2xNajRmK1FCY1giLCJtYWMiOiJjYWRlY2YyMmRmOTc5MGE0ZTc3ZjdhMjU5Yzc1ZGE2ODc4ZjY1MjZmNjhjNTM4NjhkMTZjM2JkNGYxNTUyMzk1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:43', '2025-05-09 08:31:43'),
(53, 'GET', '[]', 'http://localhost:8000/storage/theme/1/0nlBsWp1NbtkR65TrLsbgrM8WLxTU069jlycdg9T.webp', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IndkZ3hyK21zbnNUV05sWFpqbWZDeWc9PSIsInZhbHVlIjoiR05oKzBiZjI2b0lDbjdNQ3BYNUcvcXZQMUdXWFUvaXN4R1pRUWdlK3h4V3lhMHhrSkwzUmprakU1TXlCL1FNN0dudVlxOVE5Vjc4VTA0RVNxK0hBSTN3TGNDWEw1ZTZJempFVUxkMWtNSTFnR3dqbk1ReHpyeS8yNjk2c0pTSUgiLCJtYWMiOiIxNDY5YWJjYmIxYTAyOTc4Zjg1MjBhODI1ZjY3MDUyZjllNDA5MjNiYTIwNWE0ODY2MGE4ZDY3ODM0ZTI3NTA5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im04Qkh5SHArTXBYVEllT0w5R3ptWVE9PSIsInZhbHVlIjoiSDZDTTRNNVFGWVExMlVEQXFaMklzRGtUTzJDd1NjT3JvN0VVNWVEZXYrZGRSM1lXUnJUcXlXczVPbVhPNm1WU1lHTDVyV3V5MWVKRGlCVGZwS1NGbjdpYjFtNDRoQjBnOHNDRGxaMmY4N3hyRXZMTXIvdkhmU2xNajRmK1FCY1giLCJtYWMiOiJjYWRlY2YyMmRmOTc5MGE0ZTc3ZjdhMjU5Yzc1ZGE2ODc4ZjY1MjZmNjhjNTM4NjhkMTZjM2JkNGYxNTUyMzk1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 08:31:43', '2025-05-09 08:31:43'),
(54, 'GET', '[]', 'http://localhost:8000/animal-theme-cake-3kg', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammas_pastries_session=eyJpdiI6Ii9LSHlKa3UzejFReEZLQlY3REtuTmc9PSIsInZhbHVlIjoieDRmREtBWHZLMXMrUEYzcVk3bWo4aDNFbFczb09leEl5bWt3UEtHK0JUVWtVZUQwODJGcE5ialAwRk11MUVWYnRSb0pvaGsvTWpMYUxVM05VRUIvZWF1cWp2U01vc1FzYkpkWVJmMnE1N05xOFgwaHEzdUY4QVpSVXJwQ09jclIiLCJtYWMiOiIwMjc0MGIzMWM1MmViZTlkZDRhOWFjYWM1ZDBmMThhMDJmN2FmM2IxMTI5ZmQzN2FlYmVkNTY1YTUyODQ5OTg4IiwidGFnIjoiIn0%3D; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IlQxdmVJRWF4TWtNeEZqNmQ3VHpIV3c9PSIsInZhbHVlIjoiUWJMUDhTMWhhQlVORTI1eWFmRFhuelZhenlzUkFSc0h1QkdrTmV4Z3ZPQUNuNXI0VkRiYkQxNHRaVlFScmVwY1c2dGVMTCtwcTRXL1dJRnBBS0V6RFBVT29RVG9IaytzOVBLZnFVSGJ6dU1PV2hjMjFMaEFaaktzVDVlRzgwRmIiLCJtYWMiOiI3M2Q4ODA3YjUyN2YzZGFiOGFiZThmYzk5MTQ4ZDE3NmY0NDNkMzVhZTI3YmNmOTZiNGViYzBjY2VmMWI3MTAyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlhIRlJHdEttQ1hnRDlibktvdk5zVXc9PSIsInZhbHVlIjoiSjdMRS83WGE5c2pCNi85UDNvZ3B6Rjg4UGJWL2NLNXUrMUtMS2tyNGUzMlpOZHFYd3VUbmNUL1BLUkpiWlF3UmlaUVZtcXp2V0pCeWN0dTZsNkRQd1l4WmtDMVBQZXlxUDZtZEJ5bitMWWV4R0pBTjhSZ3RtbDBlTTlLcDlsL1oiLCJtYWMiOiJkNjRmNjVlZWRlZjZiZWE4Y2ZhZjcyZmM3NzVkYWEwYzNiODc4ZDc4NTQ1M2FiOTViNzU2M2VjMTUxYmQ0MjVmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-05-09 08:31:55', '2025-05-09 08:31:55'),
(55, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6InNqeHU4Nms2NGlNR0xkTkhZN0dTRFE9PSIsInZhbHVlIjoiVnkyUG5PWE1wSXNQYWV6NTJwYitvQ3Z0TERVc21mUXJISnpSWGg4Z0tDWWp1RHdIYjlObTJJVFRnN1ROYmFQSDNwNkg2R09BM1d1YSs1MFNjbTdOV1dVY2FqWk1pZzdpa01hSGtOS3p3VEY2aitzaFdZOEUreW1vUGwvRmk1dHkiLCJtYWMiOiIzNTAwZjc1NmYwNmJhYWQyMzJmNGNhYTA1MDlhMGY1YzYzOWFhOWY0MjliYWY4NDIzYTZkN2M3MGY2YmJiMDg4IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IklQNzZsZkg1UXY4Zm0rZ0lCUFVtRkE9PSIsInZhbHVlIjoiWkVReHRoYy9zTW1YYmQwUHBsN1kxeCtOOElKdHNZa3JXRU9LekxiOXBpd3AxOUxUcjRUVVZXMG03ZWV3OGwwM0FyYVB4dXM4SlB6M29adlpxN0FxYm9RYjlUalZSSE1WYVFYSlkvUzViNEIvNkRaazl5QXZ5OCtwN0tPNzhPK3EiLCJtYWMiOiIyMzE1ODYyYzNjMmQ0YjIxMGIxZjg1ZGQ1NmQyMzVlY2FhNjMyYjhkZTc3OGY1MjhjMTI5NWEyYmY3Y2YxMTc3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-09 09:28:51', '2025-05-09 09:28:51'),
(56, 'GET', '[]', 'http://localhost:8000/snacks', 'http://localhost:8000/animal-party-cake', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/animal-party-cake\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IklJWmN1MnJhb3ZXQnhFb2VnempqTlE9PSIsInZhbHVlIjoiN3Ztam9rN2JFR2pTVGF6aVVrQ1BzR2dKeldLVEVJL1QxLzBhczB3NWFSbDBDTjlaTUpBL2lhZC9sc25ybjZBK3ZXWWNITit0am1JWmRKajZDNmh4V3lTNVUxcCtXVVpXTkJoV2JkZFVCVWZ0NzE5Z2FIbWxUcllVUFBZVmRXY3EiLCJtYWMiOiJiZmU5NGFjNGIxYzIyOTFjMDhiYWYzY2E4MGJmOWYxZTBhNmIyNGRhOGJmMTdmZGY4M2QwZGVjMjg4YzcxNzY5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InNyR1o3R054WEs4UitaYjdwZHh4RlE9PSIsInZhbHVlIjoidHRGZXBqakE0T2FreUkyMnppTm95VW93SGRkRU8xaDN2UktLcVRmdVRWSjZoTEV3MUg4NkJ4TGgwdU91U3d2SFFZVzVVblBqOFNUUVZ3TlpVUVp5VFdIYi9OMm5rWGVXaWlxSDI5TFpReHVZOGljZGM2ZUxyMDNoeW5EWmZqeE0iLCJtYWMiOiIwMWQ3ZGZkMmZmYjBkZWYwODUxY2M1N2Q2ZjQ0YWQ0ZWY4ODNiZTUzMDIzYmQwZDZjZDA3YzJmNTZjNzhjZDc5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 5, NULL, NULL, 1, '2025-05-09 09:42:14', '2025-05-09 09:42:14'),
(57, 'GET', '[]', 'http://localhost:8000/dessert', 'http://localhost:8000/snacks?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/snacks?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IkpoaXNKNWg0ZHQyT1NmNC9PTURtSEE9PSIsInZhbHVlIjoiZ3M5bFV3aXNWTXFNbng3bll5S2lQTVd0aWRpY2ZUejY4MkM5L2ZUM0ZtdUsyQlk3RU5sUTRrZ08zZUxOVmZwRVBpbGhVRDJGeGJKdGhjcFNMM0pNOHhhMEdKZXd6Q0xQMnNpdEJKcUVkQUVVcjN4ZVczMnRqbUx6eWtJQzNUTkgiLCJtYWMiOiI1YmU4Zjc1NzQ4N2JmZDcwMWJiMTc0YWNmZTVhYzMyMTVlOGI4MzVhMzFlOTVmMjBiNjcxZDI4NmMwZDEzODNkIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlY1Q0RyVVZNdHBoa1NjbmFrcEs2K0E9PSIsInZhbHVlIjoiNU9sK3BXRHBXbTFRYXh3Q0JOQm9xVy9sRlg5ODVweXUwWW1yMjRoUDlCVElkdUxSV2N6ekRKNnd6R1hmUEJHMWN5R29tWDRadXlab0Z2QklzSmJnZGdZaTR6cFVoTlNZcW8rTFdTMVR2NGd1Tk5WMi9sclB6VXpxdXhyWnN1emQiLCJtYWMiOiJhNDNiNGM5YTdiOTlkMjA0OWFlMjJmYmI2MjA5ZDJjNDQxY2E1MjNiN2JlODFlNDk4OWE5NDJhYjk3NzUyMmRkIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-05-09 09:42:20', '2025-05-09 09:42:20'),
(58, 'GET', '[]', 'http://localhost:8000/cakes-pastries', 'http://localhost:8000/dessert?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/dessert?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IjA1dVZtaWo5WDhUTVBIdkx5ank4eUE9PSIsInZhbHVlIjoiQjExekh1UWdZSHNmY1VOK2lLZ2RwdlVZWldXV3ZTYVZxb0x1LzZlMU9JeUZVYTdVZDNyUGJML2wxeTliZEJEY3JzcVR5ZHVwMjBxa0FnTmxqNDlKYk1QQmh4WWhrU3NuZ3d5ZEZLOWZoMmtCVlJRc2Q3NUxrNEdtOVFBdmJJVmQiLCJtYWMiOiJhY2VhMGZmYTZiNTk3MTE4OTg5NjdhNTJhZGNmOTNhZjI0ZDVlYzBhNGVjMTE3MTRhYmE2YmNiYTk1ODY1NDhmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IktMdGFpU285TDdxMHliKzdJNzMyd3c9PSIsInZhbHVlIjoiK3dTRWV0REwyYXVlaS9SOFpkUmFLU2hkQXZvZ3Z5WUVXNUdrRk5sWFh5Z2I5dzVBc1ZndVcvMTlvWGd6N2thWHlSY1B3K0JFNWRSMTNFMWxqQy9abTVBelJ3K2dpRUU3UFEzVDI3SXM1TDRCYVlJZWlmNXRwRkRYY3VzU1ZJcSsiLCJtYWMiOiIxNjMxMTNiMWQ1YzE4YTkwMWZhZjQ2ODgxN2ZhNDAwMjFiYjQ2Yzk5OTQxYTZkYWVlMTAwY2JhMmMyNDExMWRiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-05-09 09:42:33', '2025-05-09 09:42:33'),
(59, 'GET', '[]', 'http://localhost:8000/jungle-theme-pink-cake', 'http://localhost:8000/cakes-pastries?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/cakes-pastries?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"_ga=GA1.1.853156054.1743059671; _ga_C1RQ7Y82KX=GS1.1.1743059670.1.1.1743063436.0.0.0; tk_ai=eq6V%2F4biQuZ9GnxtsCROuupe; _ga_TREZX4FE14=GS1.1.1743134542.4.1.1743134718.0.0.0; ammaspastries_session=eyJpdiI6IjgyYk5QbjNzSEdPK25RdHV1a0lvbnc9PSIsInZhbHVlIjoiUUF6dlovK2tBNmNlK3c5VUFUU3lhb2Jhb1IyOEhKQU84dXpldHZZVHlvM2xsaWZHK0tvM3NtMFozcDRJZ0xIcUdpVzNsdm95WStMYnN5V29kLzNuR3dURkRUMzFRWlBseTQrUmZIUW9YSG55WjQyUnpQbERnUjFJVlJFWS94OTgiLCJtYWMiOiI4N2EyODBlZmI3MjY5ZGQwYTdlMjFlZjU5Y2JmOTY1ZjZhZDU4ODRmNzYxZDQxMjZjYjI2ZDgyZWE3ZGE5ZTk0IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImhpdUpvSXVyRHUrTHdKMHlqWmpHVnc9PSIsInZhbHVlIjoiU1orRS8zN1pSNUVJUk9vdmJoekMrYXZQTmdYbHBKdVlrN3Z3VE5xNjR1U3pQQ2xKbzdMb1c4dk00YXNpeG4xdmRyelo1Uy9yREVSdGxHY1ZTK0NNLzI0Q3FGMSs5Wm9MQVZUSXEyRTFvL21CcE9wWXYrTlVCbnpqWTZOL3VmVW8iLCJtYWMiOiJhOTExMTAxZmVlODE2MDJiOThhMzExNzIzNDg4NmI1ZDU1MzJlOWE0ZjlkNTQ0N2NkYjI5MDgwOGE0NTE1YjViIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjNPSzZOZzQ0SXNZMkZsMVVTNGJKd2c9PSIsInZhbHVlIjoid0xEWGJlb2w3SlcxYmd2OTZWSCtVZ25iUFA4cnpJUEUxeHlXSnBieUtkNjBUcnpGTkNyQ0JYQ0VVWGZQOGlQT01ybnczK2ovVUlQeG5Ncnd6cndndGszd0R1ci9CUzdhejY1WWFkWmhnb1FnVU5KNDc3c2FnRkZhckMwZzk4a0IiLCJtYWMiOiIxNDgxYWRjNmM4N2M1Yzg3NjEzNTQ1ZjI3YTk2NzU0MTlmMDJhNjE1N2UyYzM1NTM0NzQwN2EwMWQ5MzFlMzE0IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, 1, '2025-05-09 09:46:15', '2025-05-09 09:46:15'),
(60, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"ammaspastries_session=eyJpdiI6InZRUVA0QVNKeHMxVU1saDFCMkFGR0E9PSIsInZhbHVlIjoic0paNVUvcHFrUHB0NVZmWk5rRnphYUtMNFRSTk5heW5sUHVYdE5lSXhKbDRqcUlaUlJ0L1RTZEFYQVZVbHVvTWc3R0tZYjAxdWh1MWJNbXhnczFhNm1mMitRMEFlNFJna1REZkNGZzE4d3paZTlodms0MlgyY2JLQ2NGbW44S2oiLCJtYWMiOiI2NjFlZTI2NmUyNzliYmI5YTk0NWM5MzYwMDk4ZDE5Zjg0MzcwNjJlMWI0MjFjZDI5MTQwNTVkYzA1MDY1MmUyIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IkZDdWRZblZQUkhQRnk1dVNkYStwd1E9PSIsInZhbHVlIjoiUHlyZnY1NjRBdCtlZ08ydS9SMFdKU3VSajRjeUhEMGZidmUxeCtseGpiRkxXaTh5OGpDRG40alcyOUtKT2lnTFFzVGxEaEozRTNBNWRtdDlNVVoydGtydDMxcE82dUxEemtmTkVSdlJuaStpeXUzbFFsRFdnYk1TcXVDenpkK2YiLCJtYWMiOiI1ODU1NGU2NTIzMDg3MmNiOTdmNmFjMDcxMGMyMzQxYmYwZDQwNzFkZjA3MmY1NDk5NTQ4NTEwYzllMWQ2ZTMzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImcyMURPdW54WWEzZE1iOG5QMWd4UEE9PSIsInZhbHVlIjoiQ0YzS3lCMXE0bzhFNTE3UzJlZnZjQ3lGOEhnKzBSdzErbzJDSEE5cEdlREM1Rld5RDIrOElBWXlIbGNYTzkxbEd6VFp2bzZhaTJCOE80OFNtMDZFN3BWamhNZ3FVYkgrSTFQcFlnOVRxMWRXbkl4emM3ajlDQTkvVmlidzh6aFYiLCJtYWMiOiIxN2E2MDFjN2FlODM4NDk2ZmRkZGQ2MWMxMGIxYzE2MDUxNjYwMjM0MDc2MjA0YTE4ZTdiMWFkMDhkN2I2YmVkIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-09 11:19:11', '2025-05-09 11:19:11'),
(61, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"ammas_session=eyJpdiI6Ild5ckNvNVc0MWJmOEVGc2svYUVFblE9PSIsInZhbHVlIjoickRGcHJOMHowcmZIZVlVL0FaeUVzT2FMUG9NYTdLS0ZsWUZtUy9kZTVtUThVS3kzYndjeHRRR3paTzgwaWRLK0E0QkcvT1hMQVYrb3pGSHZ0cDRFZnpUYkpOc2xJZnNjcUlJNTFVQlhaNmlvb05HaldxRU9RVVRWb2t5WHpuMVQiLCJtYWMiOiJiMjZiZDMxOWI5YjA0MjYxZDA2OGNjN2NhMjk0OTMzOWFmMjk1NzEwM2ExMWU2MzlmOTFjYzRlYmZiMGIyYmJlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-10 04:36:12', '2025-05-10 04:36:12'),
(62, 'GET', '[]', 'http://localhost:8000/animal-theme-cake-3kg', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IldxbjdRelBxY1JiT1g3Zi92YzNtdWc9PSIsInZhbHVlIjoiNzVMN3ZDU0hYSmxZRW5IbHpURHdyTWFQcHhMOGVtV2Y5bDRveE9HU3k0Z2d0a3U5OTNkMEZTendlS28yS1NLQllIaDNBZlpjL0FjQmdKSUdJT0E2dmFzTW9yWHRSRHMrSUpPalBZNVAwd0pSVHNyakhUZys1NzdnSnJKR2NnODIiLCJtYWMiOiI0Y2Y4NWU0NWNiMTZmNTU1NWE5MWM4OGFlMjEwZjBhZTk5NzYxYzQxNWVjYzBlM2JhNzA2Y2ExZGE3M2QwOTkzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImVFQkhFbVBROTE3MVJ4Q0NjRmMrMUE9PSIsInZhbHVlIjoiZTlzWENGTVN4ZHF6cFRLYnVodSt4a0tEVkVzSXNBNHlqNlc4MTdCZ2VTdXhaMVRMR2RJSmZUVUg1S3JwUWswQmNPbm5wSHo0WjNXR1hYTFkxeU14Nkx1UlhsNGVHNnVTQWlvYVlFTmlkWFJmZGZmdTNMd1dTWWNBMGRRRkcwekMiLCJtYWMiOiJkYTg3N2FlYTJjYzExNTZiNDY5ZmViZjZlZjMwYTVjODI0NGRiODRjOGRjMDJiNjNhOTMyMWI5MWU1MTg5MzJjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-05-10 04:43:49', '2025-05-10 04:43:49'),
(63, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/animal-theme-cake-3kg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/animal-theme-cake-3kg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkltNzMzdUQyQ2JLZVA2YlhxZ21oS2c9PSIsInZhbHVlIjoidnlnNUhvVFJxK3l4bUs2K1ZWY1pVOUxWNTZLYkZKbjNPc29yZDd4Z0tlRU1DMUZ0TU5CTFhSazVucnRJNXMwamxybE1XbWVHOEg3Qnp0d0VzZGtKLzZha2d3QXlrMzVySDU2WHdBbFpaNmFVU25veTE3VTJnbVlhMDdjOVdJSmoiLCJtYWMiOiI0YmRhMTMzZjE1NWJhZTFiYTQ5OTQ2NDYyZTU0YWEwMzRhZGUzYjIxNWI1ZGFjYWIyYjBhNTM4NjNlMTIzOGY3IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImpVQXlRek5NMFhiaXdSa2ExZTQreGc9PSIsInZhbHVlIjoiUy85cGM3cUEvYW56VkZIcXNVV3dhSUlzMWhYRGRpV2lOL090UkR4cG9OSjU4Z0k4NWVXTlowOXdRZmJZRytwODZPZDlsVCtoZTRZZWdyVTk2QVlKWGgwRG1lV2RBTnlDRWIvMWRRVGtERzlWZFRHVWFvZzBrSEMva3BNK2drd2siLCJtYWMiOiIzMGYzN2YwMjZjMjcyNzBhMzllMWRhM2QwMzEyZTM1NmYzMzFhODNkNzRjYThmZDc1OTViMDc1MGM4OGQwODczIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-10 04:45:31', '2025-05-10 04:45:31'),
(64, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik1TVFV0REdMN0RIbnlhMkUzaGE2Unc9PSIsInZhbHVlIjoicDV2cFh0NlVMeXNWRVo5RnlVV3FsQ3hTcytjYTJOUzRzd3VkRkkxVXNFYlJkR0pjb3lLZmlkVUlXS09NWnpyVmdycmhRNTRYMjkwN1FJR3VSZkpkMTBqemZUZ0pta3VzdithZFlwZjRmNUdEbWV4RVVhcVorZFRua2MvZ3lBSWUiLCJtYWMiOiI3MzZhZWRlMTY4NTQ3NDM3YWZjYzgwOWQ3Y2RlODU1ODQxYTc1ZWViODcyNzJkNmMwZDA1NzA4ZDIyMjRmYzdjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlBDazRpUkxUdEcrcEpZMzVxZnErNGc9PSIsInZhbHVlIjoiUkp4a1FPSzc2YjRBRTB2czZGQjhBYnYyRFd6U0p0L3FOS2tJYUNXWVRaWU94amJseFZVQWdaVExMR295dmdkRFlldmszbVE0U2JhWTNLdGJpc0wvWlE1UHlpUldNU09HdG04M24rNy9GUHA5SGoxTmVPWjZ0RGRLLzlqVkJtRWYiLCJtYWMiOiIxNjAyNjY4MjU0ZmE3NWEyMGQyZTRiZjI3Y2I5ZWRkNDVkZGIzM2JmYmI2ODdiNDNjODEwOGEyMWIxMDEyMzU4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-10 05:46:26', '2025-05-10 05:46:26'),
(65, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InlOZ21jZlRRQUxhcTJCOWxsaGp2d3c9PSIsInZhbHVlIjoidlZ4MWFpNGUvVVNhS1p6dUJwRGVrdWtDQkZLQ0M5U3dLYzZTM08rc2k3b1NGeE92OU9aL2pSNkhydFVWZkc1SEtyb0syZkZpaXBYdXNPM3hiS01nbFo5RkJkOUYvQ2JhRm90OW9HWnFXNW00R1Ewc1dXMFYwNDZzQkhNMzlMNk8iLCJtYWMiOiI2YjNlZjc2NjhkMWU2ZjMxODIyZmRkMzVkYzEzYjk4ODI5MzRjNTk0YWE0OGRlNjQ5YTc2YTliM2EzMmE5NGE5IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ill1STU5T2JkSDA5SVVwODM2cmQzK3c9PSIsInZhbHVlIjoielJJcTVWUUdhdHIzSmoyUklpbnlrcW1PUTRRNmFaYmRuemg1dlBxdE41aHhGa3gvODJYaFBNWjBPY256QS9PNmcvb3o3UnRyTUdRRFk5T1BtQWVBN1JzYTFSMldlLzlreG8zcDYzQ3AxcXQ3YWxqVW41K1lkVmRFNmJHZzV0TzYiLCJtYWMiOiJjZWFiNGVlZTJhNDRjOTdmOGYzNzZmM2MzN2MwMjhhYTM2ODQ2OTRlNjk3ZjJiNmNmNjNmODk4MTljMTQ0MTY4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-12 05:17:25', '2025-05-12 05:17:25'),
(66, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D2%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; laravel_session=eyJpdiI6IlZySVFjL29IenNBZnc4dENtVUpYNlE9PSIsInZhbHVlIjoiUnNiRGhvRERkOGFrZUh1d3grRkYwY2Mxbkt0R0graGx1bVBMOTdqZHE2VFdUZzQwUTdhaEVxWXJFSkdhaE5nQTIwb1VZR2RHZ0pRblJUZC8rdUhoOFhJNHJxSE82TCtuNnJjS1kxa0dHMjJydFM2M055SGtDaHozS29KVG1IaVYiLCJtYWMiOiI5ZWMwMDJjMDNiYWMzYmZlMDE2NDk1MWIyN2IzNDhiMWYzMTdkNDdmNzJiYTAwNzY2ZTliMWIwMjYwOGUwYTZhIiwidGFnIjoiIn0%3D; newlaravel_session=eyJpdiI6IkMxNmtwVCszUStKbk5pdFhIMlJqTGc9PSIsInZhbHVlIjoiTVVaeENDVWxvZFBtSS9Ha3hyd2M0ajBqMEtoN3RJT3hqMzk2eml0Q01LbVVydHZROWhXMzY2eW9JOUZZKzE1VkI1QXR1Qk9zeVFtK2FNN21PQUo2VUhudUtpREN1akZRQ21kbmh2UjZqVCtieGIwQjJjVXd6M0o0R2h2YUxuZTciLCJtYWMiOiJiYWIwYjk4ZjBmMmVkZjVkNmRhNjIwMzA3NWY4ZDQyNWQzZjY0MjllOWYwNWMwZjY4MGRkODI2YzYyMWE5YzY1IiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IjZ2Q3BoUUxmK2Q2NXYyRGVHdmc5cVE9PSIsInZhbHVlIjoiVFF2NjF1eHlmZmlaL2wrUGtBZHE3K3lQMGRMMjZWSnFxWHc2SmxrNEtwWE56MzNYUmx6UVA2bnF0aklZemR2Ly9Bc3R5S2FyY2VqbFIyNGN5ZTA2TTVkeERnR2tUODBNUStSYitpZTI1OTlqMlNORmhHSzBLMitFYWRQNm1QR0YiLCJtYWMiOiIzN2M0ZjVmMThmNTVhZGQyYWQ5ZTFjNTU0M2QwOWY4NDY3ZDNjNDQ2ZmM0ZDZlZDQzNThlZjdmMjIyNzNmNzA2IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImNjYTVUbENDQVhOdk1nYXdTTzl2ZUE9PSIsInZhbHVlIjoiQXZiaS92RjR5bnoxSzVhOVd4WGtyTmVZVkdOazN4bTdsTWQxOG53Tlg1K1VZeVJmWVF0RWFpTnNhdHY4N3hUVERMNGhVRlNZMnFXWmZFRUxtVlQ2cDdyRnpuYjRCWWptWU8rcURzZ0Y1bmNsTnJPME1jQWhObVhDcUtsMVpGMmoiLCJtYWMiOiJlZmIwN2UxMDI5N2U2ZTJmYzgyYmY4MzYwZjkyZDE1MmZhN2YzODNlODMyNmNhN2FlYmQ0ZGRiMzk2N2NlYzc5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-12 11:59:23', '2025-05-12 11:59:23');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(67, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; ammas_session=eyJpdiI6IjhobEVBWkltTTlRSTM0VGtIdyszU3c9PSIsInZhbHVlIjoiZXcyRWhWRHRyTldqK1ZEaUNZZVF5RHl1RVZnYUd2R0U3WDFrQjlmanBmVTVKTUpEMFI1SW9ESDcxSXVuVkdvNmlHVnY0Z2JleklqeWlmZWptMDdEYm5yOEFDRUFJZFBMeVQxWHNlcTFZZjluUTFCaFh0emtxRE83RjdFYTI4V0EiLCJtYWMiOiJjZjY5OTAzYmE3OTQzYmQ1MDg0Y2NhMDVhZTZlYTI5MzAyZmY1YmNlOGZhY2UxNGE1YWZkZTA1M2YyYTg1MDk0IiwidGFnIjoiIn0%3D; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2Fcategory%2Finterior%2F\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-13 04:24:55', '2025-05-13 04:24:55'),
(68, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/checkout/cart', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ik54a21SSURHS2xGKytZdUpHb2hDS3c9PSIsInZhbHVlIjoiTitRNFZRNDU4M21JdTBnMFd2bWg1ZHpXOEEwWHBuNEdkYVdOTTdleGtDMTNWZk9qSEpFbnJucDV0U05jdEQ0MkgyL29jK2I4WXprQndLTnNOdllQTk54R0FnbWNGM2NxWE01VkdZUTJneWFWb0VueE9JL0tmdlFLaURjNTlOUUMiLCJtYWMiOiJjM2NlMDkyZGY1MTNiNzU0ODhlNmY3NTQ5MmNmZDhhYTAwYzUzZDEyZTE1ZmRjNTBkMzEyYzk4ODlhYmRmOWY4IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ikd3a1BIZExZMUF2bmNHaWQ2djNTZHc9PSIsInZhbHVlIjoiamhRREMyRWRxQmorMmkySlo2T3BicUpZc2FwdVZ2clFGeC8yYXZac1VUSlFRNkRKYWdNVER5MG1YN0hyUmhOQUY1MEFnajRyUHQ5ekFCbUNGRGNIT0plYWdSWEJRNUpSNWJJK0VMOVIxTERTaUpXZWM1RkNZcDBSc044ekE2ZFMiLCJtYWMiOiI1MGY5ZjE0NzcyNjhhYTM5YTIyYTUyNGE0N2Y0ZDFlZDUyZDg1ZWRmMmJlZmQ3NjIyNjM1NzYwYTJiMWYzOWU2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-13 04:53:46', '2025-05-13 04:53:46'),
(69, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6ImlucVRCdi9xTURMV2lFaTM3OUl1Y2c9PSIsInZhbHVlIjoiUEE3VGxMMkFnMnQ2ZEFYa09rN2Ewc1ExZkZJaWswNDZLYTBKT2tLL3RyZWpxZ3FNbnBxc0VJS21ZeDlreFkxa29oOHlUUzhjMW5iTkhKcUVRdE9CanhFTDNVN3FNclBtOVZoUjdmQW1DS3k4VWVnbVo1anpqbnVOUURsK3NFTTEiLCJtYWMiOiIwNjE2ZmNjNTkwMDliNWMzYTRkNDY4ZDQwODNmOTNiMGE2NjlhNGQyNmEzMGM0OWU1MzZhOTliOTIyYjcxMGZjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ildhbm1XL3ZpaDZyMi9nRGhoMzE4ZHc9PSIsInZhbHVlIjoiV1J0MjlWSWgxOVRIRFFUcSsxWitVMEpnNUZ2QXBuTm0zaWp1UUhGdE9MeXRSb283ME0wSHhjcTIzN01ZVnd1Nmdxck1EUzBValJveXRrMHlXTDRhM08vdjI3Z3ZrMlJrTUNreTJHQkFoQXFOR2I3K2JFOXA4R2V1VXRXTzBidWciLCJtYWMiOiJhY2NkN2EzOGFiMzZjZjYzM2YzNDkwMWNmZjhlZmU1NDExMTk4MmNmYjE1ODU3Y2JhNjM0NTUzMDY5NGMwOWJjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-13 05:07:56', '2025-05-13 05:07:56'),
(70, 'GET', '[]', 'http://localhost:8000/jungle-theme-pink-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ikk4TUxZYzdDeEUrTlpub29seUZkVXc9PSIsInZhbHVlIjoiNGx1bnZFaVhzZkhMVjFma09sdW1PY1ROVTFkaDhhYUVSdUFCc3pxWGc0TitPK3dDQU51T0plajIreTlLTENicXZ2Vks4VDNaVVBWY3BvZFIxSTd3a3hxaVUzK1F1bXAwTWdLamM1Y05aS1oxRXhXMzdOcXBkdGJtS2dPYVJhbXAiLCJtYWMiOiJiZGE2NWMwNTU1NzBlYWEzZGEwMmZmZjlkNDRjNzg1ZDExYjZhMDMwMmIxNWYwZjM0MjNjMDdhNzk2MDU2MGIzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImJab3Rxa1R2eUZSOGRCY2lZU2trUGc9PSIsInZhbHVlIjoiTkJNR01KdXhWRkh3WDd5UjkyaHBWMU5wSnNiZWFKVGpGeXhoZy9SRHFrY3huRlR2VWtycGhFcUJIT25EZ01IdC9ndVhPQUZqR0IzcHpPOTQrT0dNQ1F0TEZEbHJ2VGN4T2hpY2kyc0NnNjZYQTlYbm5TT1pyL09qQ0MyeXlLNWQiLCJtYWMiOiIyZjU5YWM0ZmVhYjU3ODMyNDk4MzM3YzY1ZTkzMTUyNWYwYzMwNDIwZDFhMzY0MmUzMzI4Y2Q1YzEzYjNmMzExIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, 1, '2025-05-13 05:08:24', '2025-05-13 05:08:24'),
(71, 'GET', '[]', 'http://localhost:8000/photocake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IlovdnE1azZ5NkxQMUtXK01mSCt1RUE9PSIsInZhbHVlIjoidHhqTEY3cDlrWlR1VFk2Z3hKWTVMNC9xWXgyRlhFOFU4VG04OGt2ZU5lbndaRlVubktBTUxSL2pDbk1QK29zYm9nVUI3REtaQkYzSUtpY0NON01BWVkyVldSdXN2RWNHVEN6NlNHNk9ReTlFaEV5V3c3TWRaV2VUbS9hUWNoVWMiLCJtYWMiOiIwZDFhMTJhM2JjZWE4NDhmYzU5NTdmOTI2NjM0ODRkY2RlYWVjZmQ0OGFjMWI3YWE2ZmUwMzhjMzhmZDk5MTZmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IiszOTJUTThKN1NsTWRDQTFsc1N5RWc9PSIsInZhbHVlIjoiSVpHSnZucGQvV3QvOW9hWjNlZ2FEWkFhYzlyMzJ6NTYvMjE4MXBsNnRydEc0K1d4ODdQcjFEZGpic3VSNGZNdThRYk5qazMrN0l4cTRlZ29kaVJCejZLNlk5clZKYWJuaVBKb3crKzhkeEpkYmxWNkkwak0rcGZ6d0xvY3cvSnciLCJtYWMiOiI0NDVlZGYzM2I4ZmUzNDI3MGQ3ODIxMDYzNGQ5NWE1Y2EyYWYzZGZmNmM1ZWZkMTgxOTY1ZmJhZWI5OTg0YWY5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-05-13 05:35:00', '2025-05-13 05:35:00'),
(72, 'GET', '[]', 'http://localhost:8000/heart-shape-photo-cake', 'http://localhost:8000/photocake?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IitpZjZOM0hLTC8rQk1Xa3dkSHA5N0E9PSIsInZhbHVlIjoialdyYklzM1NDS1JJWGlRWDU4WjhlMUxTeU5kRmJPK2dPTUpXdVVZODhnd203NTJ3WjBFbW5sZnZCUkppTVBBRGhJM2JzSjNaQ0R6Z0dwSW0yY0orcEltTmpDQTZPeTlDNDM5ajJxZHgxWkRRSXREYVU5TVlMbjl6THVBZm5nTnIiLCJtYWMiOiJhODM5MzA3N2RlODZlNWRhYzRjNDI2ZmU5ZDkzZjVkYjAwOTlkYWRkNmRiNDkyOWQwNmQ0YzAzNDU0MjJhYTRmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkxtRzJOS3VkZ3VGWGFpVk5obndtSFE9PSIsInZhbHVlIjoiMHAvMU42Y3JSZ0FHNFB5WTBBQnh3a2xDZzMxY0lxaUtmMGdLZlpEYk5pWno5c2V4WnFEOXBtSVF6VjJpcytQRHI1SHZzeXJGTVlmeDA0U0xMQXBxS0s3MTdiNnBDZ2MycGFVQWZPRlc1ZnVTb3FIVjBOQUREdWNKQkN4ZUx0cWQiLCJtYWMiOiIyNjAyNzEwYmZkZGI4MjQ4ZTZhYzBhZjFmNTRjZjJiMWU2ZDQ5OTA5Zjk5MmFkODExOGFkYWU5N2U0ZTkwYzAzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, 1, '2025-05-13 05:35:05', '2025-05-13 05:35:05'),
(73, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D3%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; ammas_session=eyJpdiI6ImJBSG9MdlVPdFlickZiRW1OSnNqYUE9PSIsInZhbHVlIjoicFFYakFDbFpFVDRNMW16TXEyNm5xMzR4ZnAzL29VRW5HV25mRDhidXZ5SGlYdk95REJJSkhja1JHWlZDNUJzbU95QldKMmtsaG9jYXNMZVRhWkdyR2szQk9pcmdOOTBQTkdQR1JaL0YrblpPTzRNRmhUWkFteTZhWjZabFN5OGoiLCJtYWMiOiI1NzRiOTFmM2EyMjY2YjRlYzVkMGZjNGY2MzRjNTQzZWM4NTg4NjU0M2QzMTQwMTUwYzkwMGEyYWYyMzdkZjI2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-14 05:18:03', '2025-05-14 05:18:03'),
(74, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D4%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2Fcategory%2Finterior%2F; XSRF-TOKEN=eyJpdiI6Ijg2aFdsL3AzTlhtZlVUc21yM0xudUE9PSIsInZhbHVlIjoiZ3A3VmYwYlJUTDQyYnNmK25ocXVKamdXckFiOG1BL0U2MzZFTUhEWWI4SFpoZG9hYmcvZVEwV3hCaUZ3bGNpS1V2NU54cjhPSXJVQTlHV2lGeEVsU0VtM2FINDBJazVtemM1d2ZXK0RxaUpuWkFFU3NDYzZ1VXBqMG5yS29XYVQiLCJtYWMiOiI4Zjg4OTU1NjY1MDg3NzdhNDg2YmQ1Yzc1YTk1NzA3NTNmM2QxZTRmNTY1ZDM5NjNjMmFmNWM0M2Q2ZGY4MDBmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImR3VE04MmNiYU55NFVCeHBvRlN1S2c9PSIsInZhbHVlIjoiS0F6Q2swUFJzOHdxUzBpeDduTlFneG5mUHZ2UXNoWmxiejhLbjdDTFJaYS90UGpsNFlNWk1UclcxNEtQU0dpYWR5dEdPM1R6TktGQnF5dnRjRDc5ZDY4bElHZmlZSnhUeHRWR3o0US9WNTMxVDVxYi9uOUgvVEd3WnFIRFNhdlQiLCJtYWMiOiIwM2ExMzQxMDMwMGQzMGU0OGM2MGUwMTE0NzU4OTBjNWZlOTdhZjBkMTQ5ZGFlNTIwN2VhNGQyMTBhOTgxYzZiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-14 06:19:50', '2025-05-14 06:19:50'),
(75, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D4%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2Fcategory%2Finterior%2F; XSRF-TOKEN=eyJpdiI6IkhnRFRHV2RHS005VktIYnMwRGVMOGc9PSIsInZhbHVlIjoiS3lmaDRUWmpLdkliT1M4NEVoY05KeG0vdkFza3pSMC9mZ1JBL3J6Y2ZVclF4bWZGb1BMMHI1V0hGbFo3dE85M1lJODRERmtOVlNKQUYxM0J1M3BWaDRDdEhXUXppSHVaMTJMSHBXaGc3U2NLQkxpN1pCUmlDZFQzT0oyMGxndjAiLCJtYWMiOiJiZTQ4MDEwOWEzMzEzZWRmM2U4ZmFkYWZkOWMyYTc1MWJiNzU1MzdmM2QxY2JkZmRiYjAxMDFhMTlkMTBiM2JjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjN3MG9JRmI1Zk5WdmgzZFhraTJJUlE9PSIsInZhbHVlIjoiSnozSmtRNU1FRlQ3VHdXd0hZUjRlUkMvVnhwTGRGMk1GVVhINGpBRS9JMTlPcW9iTjBGU1V1eEI4a3NwT3I4V2NsV2JmUERZVE1NWEx0bk1UMVZwQzlVZitQeCtJZUxBYnR1S05URU5hQTQ3bzkvQVpSTGZubjdPcjBYS3crTEYiLCJtYWMiOiI2Y2NiYzI1MDBlOGJmMmJmMzJlMWE2YWNkNmM5OGQ4MmQ5YjkzZWI3ZWE4ZWQxZjRjY2ViMTEzMDQ0ZjZhZDE3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-14 06:21:09', '2025-05-14 06:21:09'),
(76, 'GET', '[]', 'http://localhost:8000/storage/theme/8/9faP1sis45lF0YEZndS94kstBGXKLj8I48TvMFUV.webp', 'http://localhost:8000/admin/settings/themes/edit/8', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/settings\\/themes\\/edit\\/8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D4%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IktpNnNNMjNIOXVOSUJ0dkl6UlJ5OGc9PSIsInZhbHVlIjoicWlhRnBGaVI2S2RwS2FxeXZrR2dZUmllQXFuRUozMzNEeUFhVldnT2d2cE4xSkpuYS9scWxCbkNZSXhrTmtGSTdRN3I5THJUL2dWVkUvTFYwQkxzYjVaUVdGZEZsdW9VQVEzNjF4SWNyNDQyNWY0NUtXUDFlMVd5eEJBamVLVHUiLCJtYWMiOiIxN2ZlZjhkODFmMTI1YmE3NjUzNTAyY2IwMTNlYzEwZDY1MTdmY2IzODg0MWJhNzExOGRmMWZjNjAzOGEwYjdjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InIyRXBYOXFtMU5mNDRXMjk0cTZZa2c9PSIsInZhbHVlIjoiWGk0Qm1DTDkwT2VxaFp5aUJWN1JSeDlIV2IxZUlFVitvb2NYOTFtVGJrTzlMNGxIczBFVmhHUS9LVVNQVFQ2a2RrdTFXQ0ZyejE1ZGdQT0wrN0F1ODJycm9GSGxpVUsxSUo3NFVXdm5pQ2x3Q25aT29yejJueHN5TE1PL3JEa1MiLCJtYWMiOiJjN2Q5MWUxMmFkMDlkZWVmM2M3N2QyMTI0OWZhZmQwZmY3MmM3MjZiZjdkMDY2ZWM1MzQ1NTViZjMzNzhkMzA5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-14 08:20:55', '2025-05-14 08:20:55'),
(77, 'GET', '[]', 'http://localhost:8000/storage/theme/8/Cq1v2cHiNmXFc5gRk8XHaANHL6ZfMQdETkFect2u.webp', 'http://localhost:8000/admin/settings/themes/edit/8', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/settings\\/themes\\/edit\\/8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D4%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IktpNnNNMjNIOXVOSUJ0dkl6UlJ5OGc9PSIsInZhbHVlIjoicWlhRnBGaVI2S2RwS2FxeXZrR2dZUmllQXFuRUozMzNEeUFhVldnT2d2cE4xSkpuYS9scWxCbkNZSXhrTmtGSTdRN3I5THJUL2dWVkUvTFYwQkxzYjVaUVdGZEZsdW9VQVEzNjF4SWNyNDQyNWY0NUtXUDFlMVd5eEJBamVLVHUiLCJtYWMiOiIxN2ZlZjhkODFmMTI1YmE3NjUzNTAyY2IwMTNlYzEwZDY1MTdmY2IzODg0MWJhNzExOGRmMWZjNjAzOGEwYjdjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6InIyRXBYOXFtMU5mNDRXMjk0cTZZa2c9PSIsInZhbHVlIjoiWGk0Qm1DTDkwT2VxaFp5aUJWN1JSeDlIV2IxZUlFVitvb2NYOTFtVGJrTzlMNGxIczBFVmhHUS9LVVNQVFQ2a2RrdTFXQ0ZyejE1ZGdQT0wrN0F1ODJycm9GSGxpVUsxSUo3NFVXdm5pQ2x3Q25aT29yejJueHN5TE1PL3JEa1MiLCJtYWMiOiJjN2Q5MWUxMmFkMDlkZWVmM2M3N2QyMTI0OWZhZmQwZmY3MmM3MjZiZjdkMDY2ZWM1MzQ1NTViZjMzNzhkMzA5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-14 08:20:56', '2025-05-14 08:20:56'),
(78, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/photocake?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/photocake?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2Fcategory%2Finterior%2F; XSRF-TOKEN=eyJpdiI6IlBTbnJsSFV0M21QR0JZci9EcndLaGc9PSIsInZhbHVlIjoiSzdKaTMzcnhqN0lTRGFlbWtCTjhtbnJPeWhxOHdhS0hBT29jSTZ2cWpwQ0NlaS9aWERYOVh6OWtoaWQrUlkwbis1VSticFRGYjU1OVg4R0t1dUJLenpJMHc1dTlMaEtGMTk4cVJFTzFyblFSMU4rL2xBc1JxUnhoczNadUpKaW0iLCJtYWMiOiI3YzIyNmJlNmFkNDBlMzFlOTUxMjY5MThmNmMxYjYzY2UwYTdmMWJlMjU0YTAwZDZhNGM0OTBkMzI0ZDFhNjExIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjB1RE9vYVhQYmJoY0plRnRZajE2YXc9PSIsInZhbHVlIjoiTmx6NEN2NEhYUkN6czdRYWY5MFVWOVliQlovaTlsalQvL1NXUkdvSDluUitibTRtZUVhT1VBeVpoc2c2M3RrYUJPcUwyelBHZk15Q1Y2OG5BejY1TERYdGVvbnI5VjlHVEZlZUVrc2FFWlgyMnFTMi9DTnZTczk3Q0tlaVlWTjYiLCJtYWMiOiIwMWQ4NDI0ZTcyMmQ4YjkyNDhmZTUwNGY0YTY1OGQzMjJlMTQzZGRhNjk1NjEyMzg5NjExMzdmZGViMzZmZDIwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-15 04:19:13', '2025-05-15 04:19:13'),
(79, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2Fcategory%2Finterior%2F; XSRF-TOKEN=eyJpdiI6IlJXVStvb2pMTlNpbUpNcHpxbERveWc9PSIsInZhbHVlIjoibU5UTkhqT1ArM3dZeFc2ZUphWXo3czlra0c3M0hKdnZhUjhwTFdVZU9ISlpHTWhlYmNhWWtpUUJyMUUzWDlXR2txRWVmYWR3S3BQZlJSVXhHM0IrNlZwZFdUTWNxbW9Gb3F4QzRXYzQwZWsvdWZxV0FQWGdxV3R3Mlo5L2xFQWgiLCJtYWMiOiI1MDI2OTc2MzQyOGFiMGRkMWE5MjRmMTViNTEzZjk5ZWVkZTFiODRkZTkxOTJmNjZmZGY2OTdlOWZkOWQ1NGVhIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkxKY0kwS1ord25PdjdRdXpIVXVGVGc9PSIsInZhbHVlIjoiS2RnSjVmWnowc2RBM21sTjZMNTZyM0ZQSW5haG1CMUtGUXp5Ky9VN0daS3E1YnUwQ0ZQMXFkaW4vQXhqblAwOFZ3b1ZVcW52S3E2eGQ3MU9MQ2FJaGpFaWVpdDlCb0sweHdKbllIREFJcFFrOEh0RitEeWV0cWl2NkI4THUyMjEiLCJtYWMiOiJjYWJjZjY5ZmY4MjIzMjMxZDNiZTg2MTliYWUyMDM1OWIyYzdhZWQzZjMxM2Y3MDU5YjJhMDQwNjY5MWUzYzZlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-15 04:21:37', '2025-05-15 04:21:37'),
(80, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IlhuYkN5OFZNMGl0Y01ReUQybldWMUE9PSIsInZhbHVlIjoic3pMbWZweS9wVSsrODkrRmlFL2tEeUpmei9wb01DOTl6T2cvKzFLRG5mclpSTlJ2anQwaXNuQUliYzB5ZlRXNS9IWDZseG9yOEhheGZ1ZDhFVSsxQVVxNU1lT2g4NTFiZUJiVUZoWFpHQXVKVGZqSEhkWmFxUThWNlM2UGVyTWUiLCJtYWMiOiI5YTMzMGRmMWI2MDE5ODBhNDA5YjE0YjJjMTM1OWE3MTc1NWNiMTUxZWQ3MDAyZTdjNzRkNzU2MDUzZWEyZmQxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ing1ZXg2SUVtelRtWndBOHBqNFhYUVE9PSIsInZhbHVlIjoiRGZjd0h4WHhSbFJBTm0wdXNXeWFuamxJRlFGQWdGcGJLSWtrYy8vWjdnalArSXA0UjM2K2kwTW9BYUdpVGZMaWNyL2JoYWYyTVluVVVtV0NvWXhCcmV0Qkh5bXNlQjBIblBDRGRwNEoweW9tRisyOHRyNUh2T3JmVVYySjRieVMiLCJtYWMiOiI5NThiMjZmODgwNTlkM2FlZGQ2MGIxOTY5YTVmMjc2YzEyOTRiOTI0NjIxN2RhOTUwNmVlZWQ4NmJhZTc1ZWJiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-15 06:25:46', '2025-05-15 06:25:46'),
(81, 'GET', '[]', 'http://localhost:8000/images/login-bg.jpg', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6InhnRklHeVJJV0xaSzFLbHVTRjlGcnc9PSIsInZhbHVlIjoiT2VOVUp0bkhQbzdtWFlzQytGRGlVOVVFeHRiUy9obnVDQlMzSFpCQUhuLzQ2eE1jRzhRck9CNi9EOWowaVovczJXM01CTnZmS2hKeXFJcEhyTGcrYzBHNFc2aE50dm1OMEZvci9meEdaYUVFUGxDcmo0NEpBclJ1ZzJPdE94U2kiLCJtYWMiOiIyMWY0OGQwYjZjODY2MWJlZmY3ZDQ1NjI4MmE0MTFlMzk1MmJjZmQwYTVlZWJkODQwMjI4NjVhMzk1YjkxMTcxIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlhuTWxEQko0OWxxcGtzeWFMNGkrcHc9PSIsInZhbHVlIjoiSXR6RzZYQ2VGTVI1WHF2Q1JaWFVqRXdNY3dVYXhZNWN4MWhKT1p6SGdhMmVTVk45SUw0UTF0TFNVQXJKV005b0RHQmxvd1FPZlJxNVNjVVdyQUNzbVlGRE0rMncrVGhmbDhFbjlicmEwbUt6MWU3V3g3UFdwZDIrNXUxZzhHZHciLCJtYWMiOiI0NjMzY2Q0NTJiMzc2Y2Q1MzhiMjY1MDY5ZWYxMGQ4YzRlOTRjMmE3NjM5Y2FiNGM2ZmU5N2JkNjRiZTcwNjk1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-15 07:23:44', '2025-05-15 07:23:44'),
(82, 'GET', '[]', 'http://localhost:8000/pastry-pack-of-4', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6ImJ0VVg4c3gwN210Zm1KUmsrcEI0eUE9PSIsInZhbHVlIjoiYjRQMkJ3ZUphZkxMK2V5d05JNFpoWVZ4YmprbGM4NEtwSThyWlpML0czYWhRS0JQalE2ZXhIUFEyMWN3MnNyWHJFTm1YdzBlRTJiUHdQSzFZMjZJM01YMXcrZ3dNb2hXYWcwTjVUTFR5c0F1SEZJNkw4S1E2RG82MXZ3RVVCSjMiLCJtYWMiOiJmMDIyNWM5ZjY4M2ZjZmI2MzUxNzQxYTNiODY3MjdjNWY2ODgyOGRmZDg5YjBkODdhNTIzZTVjMTUzNWQwM2U2IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ik5xd3dWS3ZCUVdYd0MrTS96ZVRFK1E9PSIsInZhbHVlIjoiQVBybkJzSy82MCtwSjZsdVJzM0F1TGl5Sk1QdjZZR0RXVmJsN1M1dmRPL0dwTjd4VVVkamJXR2VDNGFGR2NaS3h3SCs3cHlaQ210RXd1Y3VEM3Ixc0ZvZzUzemNCT3hSYTloUXBGMlZObmFFenlEazVJMGdmOUY5QXVrWkJzZFAiLCJtYWMiOiIyZDEwODQ3N2Y1ZDQwMzJjZGE0NDljYWFhMTQwYjUwM2NhNjQzMWRjZjVlYWI3MTA5YTViYzllZGI0NTkyNzIzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, 1, '2025-05-15 08:08:46', '2025-05-15 08:08:46'),
(83, 'GET', '[]', 'http://localhost:8000/theme-cakes', 'http://localhost:8000/pastry-pack-of-4', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/pastry-pack-of-4\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IjgrRHpxYnhsTnR0dWp1RGRGMXBiR2c9PSIsInZhbHVlIjoiWERYOVVrYmdwTHdHOEliM1JxSnVQM3RjM3ZHUTUxNlVDOXZqUEZtSWFLZDNJOVB5MjUxbTdMVW9rdVovSHRqSlNJY3pVN3BkYWx6RjEwSHdOaHIvc0p5clA5NTZ2Q0hBdFpkeFpiMGpWNS93cVMwb3QyNVdVV3ZpU2ZnbEd1blgiLCJtYWMiOiIzOWZkZjAzNTBiMTE1YzYwM2YyZjU1OGYzYjk1MmQzNjIwNzc3OTM0ZGQzNGQ3Mjk3N2FjMzU2YTVjNmEzZTFjIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkFmcTdrL2hZL1lFZUJsc2RSekorZXc9PSIsInZhbHVlIjoibkdlNDRRR0tRcEtnaFpuY2RYT0RONVZ2RU1UQUZiUmhDZGQxSWFkN2h5SjF5S25WYncvcWs0d25EMnV4aHhpUDd6Ung1enJIUEFkenlIT1NOV0dOM1RGeVlldzdjVE5pdk9raWxVWmNDQlg1ZFpyaW0xd282V3phamUvWEVqNUQiLCJtYWMiOiIwZjUwYzc3ZDcwZDRmNTBkOTY1N2Y1NTRmYjk0ZjgyOThhNTlkNzIxZTRkMjgzZDc3YTQwMmIwNDE4ZTRjMDRmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-05-15 08:08:52', '2025-05-15 08:08:52');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(84, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IkNWVXcrV285VnlyTm5WYkRHblRiVXc9PSIsInZhbHVlIjoiVXhldlpGRnBCd0JUeUZTYm4xYVE3U21QU0xKSmwwUE1wTTZTeFBVZGNRQ1RqcmQrUFo4SVFRSlI3bXM4YUVHd2RlNzVpNmQ1M0U4Ni9xUlRKaHVBYUtVTkpKTGt0QThiYVNWeFhyWFhvdTNvMWZabjF2U3Z2SmkwY24yRXdJMTIiLCJtYWMiOiI5NmU1NDc3Yjc1Yzk4MTZlYmJhNjc5NjYzZDkwZjkyNTY3ZGY5YjA0ZGM2ZmYwYjk0MjAwYjAyMDdmZmVhYjIzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6ImZna0F5U09yR0FyeHpKSFFCVmE2enc9PSIsInZhbHVlIjoiT2U4WVFEWFpaWmcwOS9yRjJVRTJMeENZbk5XTDJuWFpsN2UzYjdFRVAzOXAza1VMb25WQmdGby9xMHQwbWxSeWppU2VMRWdsY1FOSFN5ZkQwaEhKTDVzNHlPMlRyZHlFZ2tMTmxKVzU3RGJTWERaTXpjYWZaMW1DdFk2UHAwTlMiLCJtYWMiOiI2NGEzNzRhZWI1ZGFkZDBkMDRlMGZjYzMyYzAxOWRmYjZlNzc2MmU4YzAwY2M3MWY5NWI4YTA2OGVjMGZlYmQ0IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-15 09:29:10', '2025-05-15 09:29:10'),
(85, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IlR4T2gzVHZ0eHNMMnVJYklIR3plU2c9PSIsInZhbHVlIjoiODA0N20yUG14Y1lmbHU2cUw3RTcwSGl6amExN0UvTjVZbi9iVktlNVJYK05zdXNUckpvMjFDMjd1VkJWWDhxbmpCSkp0MmZwRU4yRWlJeng5VGlYYjBUTUJCdFZ4MkZydmROYU9qRG0zVDRDdUtPcG5FeVBwdmZwK1R4RDRiRDIiLCJtYWMiOiJmNTA5NjI2NzU2OTk5ZjhmYjcxNDQzY2I3YmQ3ZjMzNWQ2ZGY1YmNkN2UyNTkzOWQ3MTVlNGU0NWYxNzI2MmVlIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkdjWkN6WWlwRm5WUkM3NWwzUHI5UlE9PSIsInZhbHVlIjoiOWZIVUdXNG9tTWJhbDNwS1YzRjlPMW00a1NMRGpZWFREM1hPU0dCTkpnaVQ0anNUYks3TVhZM044YWdnWlhNSFhNdllxc041eVdDcXpHaThJNkh3c1Z4R2FHR0FLMHZsQml3Z0hPNy9TWlEyK3hwZHo2V1A2Tkt2dEltRkpldjciLCJtYWMiOiI0MzIzODAxZTJmODZhYjlhNDA0MTM2YWFjZWRhNjkxMDhkYTU2YjY3NzkyYmE2OGQ3M2YwNzNhMDJlMGRhMTZhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-16 05:42:20', '2025-05-16 05:42:20'),
(86, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ik13YU1sZmwyRjZ0endsbk8rWFFmSGc9PSIsInZhbHVlIjoiS0NUVzhiVzdyb1ZqTHNwTVZiVk44c0w5akxuc1lSRWt1RzZxMmt2N0NqVHF6c21GTHNsZ2c5cGh6TW5VS2JtazVwT2syTkpRK2lxay9DYzdTUVExY2g0VVRyOHI4bUpuMjRpRHp4allpYmNiTGluL01NWkt5UmFsYjkvZzFZemQiLCJtYWMiOiIyZGMzOTE0Yjc0NTlmOTUzYTg4ZGM0MzBmMjRjZmQyZTAzOGNlN2IyNWZlOWYzMDJjNThkNWJiNTc0YTU5Yjg4IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Ilh2ZVJzWmk0ckFKY21aTU0xQVV5WkE9PSIsInZhbHVlIjoiaFhSQjZra09BTE1YQWtxYmo0ZzVQUGcyYkEzZi9UU3ZnbytoTURiSEEvYTNjUjgvUHhsZXBTSnEzNE92Q3J3dWpJbUxMb3U5WjhiOXRTRitMYWJ3U1NUNmx0TDFWV1FWMTNoanhReU1OTFBvUy9YNmR0QVFMVm54ZnFHUWFLOUwiLCJtYWMiOiJmYmJhMWJmYWFkYjVhNTM1ZTk2NWYxYjUzOWUzYjJlM2U1MDgyNzdlZDBjYjZiMTQ5OWIyYjRkMDQ5MzZiOGU3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-16 05:50:00', '2025-05-16 05:50:00'),
(87, 'GET', '[]', 'http://localhost:8000/vendor/giftcard/assets/images/rakshabandhan.jpeg', 'http://localhost:8000/giftcard', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/giftcard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IjhxbVovMnRKdENGNnZRTjVXV1Vwd3c9PSIsInZhbHVlIjoibW9DeDd1REpwWkx1L1VMUjB0ZTNJbURTaTRlYVF5QjgrblJoQkt4QkU5dnlFL2pvbjg5ZmE2QmNQYVovU1JQcHkzT2d5anBtYnNzR0NMMmh1R0dRdjJ2Vzk2OTJIcmZJNXkrRFNKalRCSzBhaExheEd1NFdLK09uMkdCMkM2YVgiLCJtYWMiOiJlZTQyZDFkMGExNGJlNjkxMmE4YWU3NGIxZGJkZDZkYTU4ZGFhZDNiMzRmOTJhMTIzZGEzYjQ3MzI1N2VhN2EzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6Im05Yjl4S3VrN21SSmYrM2UycnNBRHc9PSIsInZhbHVlIjoid21Lb0kxMi92VlRZRjJGWDhwNlVCVEswcTdUTTE3NVBCN1VxaUdoSWoxRkl3ZUZjeTdrRWU0bURWdlFaS1E1VXRTUGRwSU15T0hXOVZkVGYwSHRObnJMK3dtNmI4T2xUSWp4OHZJZXRlRjdoQnc4MCtPZURDTGwxellVNk91ZmYiLCJtYWMiOiIzYjIyMjM5MzJlMzdjNDBjMTI2NTcwZGNhYWVlNTZmZjA3MDBjOTkyY2IwMWQ4OGY1ZWEwMGRjZGE5MDA4ZTk4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:29:11', '2025-05-16 06:29:11'),
(88, 'GET', '[]', 'http://localhost:8000/vendor/giftcard/assets/images/storage/theme/1/GsaG6rZvt3tvvu3dKTZiCTjKDQgCNImPx1z90aqm.webp', 'http://localhost:8000/vendor/giftcard/assets/images/rakshabandhan.jpeg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/vendor\\/giftcard\\/assets\\/images\\/rakshabandhan.jpeg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ii9SdDhuZXcrYktrcW1uQzluN292eFE9PSIsInZhbHVlIjoiVEN0MkFaU1BaaHc4ZW0xclROb0Zta1did3l5RERlcU1hVkl6eW55ZVNzanl0NDZLWDBnaFcrekZIR1NoNzVZQ3NjVkp2bmtsTmhpdGtTbzRtMXBRVjl6VE1vVThzV3RXQkM3TnRjdlVacmNHakg4RnMzTTBmOFIrS2VVcEVEZ1oiLCJtYWMiOiI5MWU2ODQxNzQyZGRjNDcwMTY4MDI3MDU0MThhN2QzOTRjYzViYjFiODkxZDlkNmQxMGMzNGY1YWM3OGU2YWQ0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjdYU0lPKzYycGsxTXdiN3BmTzBJdlE9PSIsInZhbHVlIjoialYxUnlONWlXRmZ0R2tKdzdJU3RHKzQ3RzlGRFZQMXB5bmhQSEdPNXJmYm9Ta1NOTlZzSkJ4dHhKZm1rMHl0R3FPTk93a25WOG4yK2NVL3NtYS9OTnUrenNiaktPWit0c2U3Tmkxb1hSdGVWL3I1czFIeHJoTUtzejcvM1Vzak4iLCJtYWMiOiJiMzRiOGVlMTM0OWQ3MzE4YWM2MzA4MzE0Y2QwZjgyZmUyZGMyZGMzNjMzMjVmOTczNDE2MzNjZjBhMTU0MjZjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:30:07', '2025-05-16 06:30:07'),
(89, 'GET', '[]', 'http://localhost:8000/vendor/giftcard/assets/images/storage/theme/1/6dAp793whvKZGFAGcH2K9VqXxxVD2ZrhRpyrS9k5.webp', 'http://localhost:8000/vendor/giftcard/assets/images/rakshabandhan.jpeg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/vendor\\/giftcard\\/assets\\/images\\/rakshabandhan.jpeg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ii9SdDhuZXcrYktrcW1uQzluN292eFE9PSIsInZhbHVlIjoiVEN0MkFaU1BaaHc4ZW0xclROb0Zta1did3l5RERlcU1hVkl6eW55ZVNzanl0NDZLWDBnaFcrekZIR1NoNzVZQ3NjVkp2bmtsTmhpdGtTbzRtMXBRVjl6VE1vVThzV3RXQkM3TnRjdlVacmNHakg4RnMzTTBmOFIrS2VVcEVEZ1oiLCJtYWMiOiI5MWU2ODQxNzQyZGRjNDcwMTY4MDI3MDU0MThhN2QzOTRjYzViYjFiODkxZDlkNmQxMGMzNGY1YWM3OGU2YWQ0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjdYU0lPKzYycGsxTXdiN3BmTzBJdlE9PSIsInZhbHVlIjoialYxUnlONWlXRmZ0R2tKdzdJU3RHKzQ3RzlGRFZQMXB5bmhQSEdPNXJmYm9Ta1NOTlZzSkJ4dHhKZm1rMHl0R3FPTk93a25WOG4yK2NVL3NtYS9OTnUrenNiaktPWit0c2U3Tmkxb1hSdGVWL3I1czFIeHJoTUtzejcvM1Vzak4iLCJtYWMiOiJiMzRiOGVlMTM0OWQ3MzE4YWM2MzA4MzE0Y2QwZjgyZmUyZGMyZGMzNjMzMjVmOTczNDE2MzNjZjBhMTU0MjZjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:30:07', '2025-05-16 06:30:07'),
(90, 'GET', '[]', 'http://localhost:8000/vendor/giftcard/assets/images/storage/theme/1/0nlBsWp1NbtkR65TrLsbgrM8WLxTU069jlycdg9T.webp', 'http://localhost:8000/vendor/giftcard/assets/images/rakshabandhan.jpeg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/vendor\\/giftcard\\/assets\\/images\\/rakshabandhan.jpeg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ii9SdDhuZXcrYktrcW1uQzluN292eFE9PSIsInZhbHVlIjoiVEN0MkFaU1BaaHc4ZW0xclROb0Zta1did3l5RERlcU1hVkl6eW55ZVNzanl0NDZLWDBnaFcrekZIR1NoNzVZQ3NjVkp2bmtsTmhpdGtTbzRtMXBRVjl6VE1vVThzV3RXQkM3TnRjdlVacmNHakg4RnMzTTBmOFIrS2VVcEVEZ1oiLCJtYWMiOiI5MWU2ODQxNzQyZGRjNDcwMTY4MDI3MDU0MThhN2QzOTRjYzViYjFiODkxZDlkNmQxMGMzNGY1YWM3OGU2YWQ0IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjdYU0lPKzYycGsxTXdiN3BmTzBJdlE9PSIsInZhbHVlIjoialYxUnlONWlXRmZ0R2tKdzdJU3RHKzQ3RzlGRFZQMXB5bmhQSEdPNXJmYm9Ta1NOTlZzSkJ4dHhKZm1rMHl0R3FPTk93a25WOG4yK2NVL3NtYS9OTnUrenNiaktPWit0c2U3Tmkxb1hSdGVWL3I1czFIeHJoTUtzejcvM1Vzak4iLCJtYWMiOiJiMzRiOGVlMTM0OWQ3MzE4YWM2MzA4MzE0Y2QwZjgyZmUyZGMyZGMzNjMzMjVmOTczNDE2MzNjZjBhMTU0MjZjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:30:08', '2025-05-16 06:30:08'),
(91, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/giftcard', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/giftcard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IitFNlQybmhPWVRueGxpSXRidTRtRmc9PSIsInZhbHVlIjoiTm5pUks3bUV3UC9jTnd4clZaeHdWSS8xZjBXdVdRRXAwRSttMHp2aEFGZldEekc3VzZNdWRBY2NQMWQwbTNmaVNHNS8wQ2FUN2tORGI0SzVFNGV1RWFhTThsRFYwc01LOWFLNVpFZFFaeVhvNXdNQXYrV1NkZmtpOW5ReitZV3kiLCJtYWMiOiI2ZjMyMjEwNWJmZmNhNTdmYjQ0MzExOTEyZDEzNDE1M2M2NzA0YWY1OGU3NzNiNGFhMzUwYzAxZDJkMDE3NTg2IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IktiN1lUdVNmdXBocm40S1U1dlJnQUE9PSIsInZhbHVlIjoibHJmcVBBbWJtYmJscDN6OVltUWNBM01jZmsrOUROSWRqb1pNRFR3UjNjRkhES2F1WEdQMzJzbFlDTFkydklWaDlVZmtlRTBHVjc0ek95Nzk3empOTGhVdnJZWDNpQktaU3ZHZWhXRXdVaXZURndSQ3NTWW5TVER6b1NrN0x1dDMiLCJtYWMiOiI2ZjVlYmVkMDQ0OGUyYjdiMjkyYThmZGEzMDM5YjY4ZmI3ZjkyOTY2ZTJlOTlmNTQyZDU0NTc3ODU4OGJhNzE1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:40:24', '2025-05-16 06:40:24'),
(92, 'GET', '[]', 'http://localhost:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6InBYV0ZwaTAxU0UzVm5SaVFWMmU2clE9PSIsInZhbHVlIjoiNXRYVmJOQk9FRTZaNGVGTE9ZNU84eTNWcmUzOFRUL3RUL1lXcDdWNWZxYTV4MGFqZzlFTk1qWnl6dENlZHZFVTAzWlk0cUZWRVRobWcrS2JLQWcxajZYQVBJajEyc1UzMTRSZ2tnTU8xYzIyOWU4UEdxaUxhQWhwMW0rWmEranoiLCJtYWMiOiJkNTIyMTkxNGJkZGY1MjlmM2NkM2Y4YzYwMDA0NGE1OTJjMjQ5NTc1YzQxZmNkNTU4NzMxZjdiNTU2ZDIxMTFkIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjZTbm1kRHdKeE5yOXlQTmphTDB6YVE9PSIsInZhbHVlIjoia2FMN0VaOEVBMXM0RmZvZEJ0WkZrb2xVNks3RzdHWk1VV0NLaWhhamkzNEV3MUY1NlhHdSs3UlpwU2h0Y09sek1PRTVrYVhsL3hWMDJpOVh1T01TYTZjVXdFZXE3R0ROSjBMOTBYZ2w4ai9vRVJ3YzA4SGVoY1lETi81VXVUWnoiLCJtYWMiOiIzNDZlY2UzOGI4MDIyM2IyYzgyMzcyZmY4NjcyZTBjMmZkMjUzYzhlNzIwOWU2ZTUwNzgxM2RjY2VkMGExYzhhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-05-16 06:40:57', '2025-05-16 06:40:57'),
(93, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6InZBcTJubjhLRzlLZTB3ZFBjbjhlUUE9PSIsInZhbHVlIjoibGRVeENCdjRrbmttUUJWQmhIMzZ5dEdDZHUxcC9zQ05wL3VsNVhMYjJSdVpiOHFIT01WYm1rNFVsV3NaTTBPNUtILzQrY3dSVlltNE9kRnBHNUErS2ZjM1B2aFRQRlR3RElHSFhrdlZhVjV1eWpianRYdUFYK3BTN0pKcXNFSHciLCJtYWMiOiIzZDM5MzRmYzljMWIxYzljZTI0N2M5OTU0NDg3YjFkYjAzMWFkMzUwZmFkMTI4NGRiYWY2YjFlZGViYmU5YWIzIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjJCd3hsUU5neXpFU0ozWmNnQ25USnc9PSIsInZhbHVlIjoiTk9qZjUxVzlNZG5lQkZ6OWJpekpvVTg5UDkyR3VWQkVYMG9DWmRIQm9tTDh4SXk3TW5Nak1MM0ZEMmxBd1JDUjMvREJLY2VhN25DQXFEMzNEMll5alVHZGdNMzFvUXNyajM1dXFVQTlmTFhZUTc1dklTYWQ5d3N3L3lJd29hVGkiLCJtYWMiOiJlZGY1NjZlM2ViMjIyNWRhODgxOTZiYTliMzZmMTJiMmI4NjJkZTExZDI5ODgyMWJmNjQwNmFiYzNiNmNkYmM4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-16 10:05:48', '2025-05-16 10:05:48'),
(94, 'GET', '[]', 'http://localhost:8000/theme-cakes', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Iko4Y2JEczVLMXZQY2V6VmpEejU3aGc9PSIsInZhbHVlIjoiU2dRbGxYVHlGZVk2eUI5c3JMUEFhcG5qVkZQT3BCZWZUdk9MeG1hZDZUemx5Slo5UVJUTk02TEs3MWlXaStNOHZESEdmUTQzOHVJVjlCMUxpUXVDK0hmaGdKdzcwdzB0eU43VlhicDN5WkwzWHdKc2NhV0hKblBDQVZvVFJHWkYiLCJtYWMiOiI2ODIzNDM3NjA0NWRiYzY1MjNhZDJjYTIxYmM1NTNmY2RkMDA2YjFlNjg4YzYwNjlmYWJkYTMzYTYzZjRmYjEyIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlE0b0NMMk92ZVRKSEwxTVJCTWlmNmc9PSIsInZhbHVlIjoiMmZ4TTRqVHRvUC9Ja1VucXJOMWdlbWxwNkszckYra084TVVzdFg1endtbmtCQit0WG5xbGRGOTBVLzhMc0hqUkRVaGxpbm1IMG5MRnJtRGJMV1ZhWk50ZE1jaVM1NHBmK3JHVlVTL3hSUit3Mk9xTTBOQ1ZXWlUxZmVreVNleFkiLCJtYWMiOiJlN2ZmZmUwMTZhYTcwNzI0ZTQ1Nzc3Mzk4N2FjNWJlZjYxZDA4MjY2OTJhYTJmNGRkZDg1NjBmNDcyMWE3M2MxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-05-16 10:12:35', '2025-05-16 10:12:35'),
(95, 'GET', '[]', 'http://localhost:8000/animal-party-cake', 'http://localhost:8000/theme-cakes?sort=price-desc&limit=12&mode=grid', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/theme-cakes?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IkdPczVOci9LN1NObnZnMld5UzJLQ2c9PSIsInZhbHVlIjoic0x5cHZaR1pFcFpkNTZWdGkvNS9SR2t0am1la3VsdHdnSnZPTHJpL3QyMUgyTmNOd0FCSzVDOU9FWkxSQmpia1JMSjRrTDM4MkNUWGZBRXlQblBhbGZ4U2pONi9ZamwvakJrWHRnWWlqQUdUcnM3NCtBb25vcVFOTUxNR21Id2siLCJtYWMiOiI3MTFlNTlmMWYzYTM1OWQzM2I3YTE4NzFjNDMzOWFlNzJlYWJlODM4M2E0YTc1ZjgzOTc5YmNkYjgzNTFhZjI1IiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IkZ3dFpscVBkUEp3RFBaMzhVZ0RBVHc9PSIsInZhbHVlIjoiRFIzTGwrcTAvdVJmL3VZWkhtcTljalB2bC91UDVJZVVoaXNjeGF4Ny9rOURCMkh6MGFUUGN6bFBUNk5VK2dmSnJnaHQ1M0lQUklyRTNNYUdEWkNXSllVV1ppZ0lkMzUvRVZYcjUrd2thYXlMWS9IamlYSVVZeTgvNGFaYmMwS3ciLCJtYWMiOiI2Yjg4YTMwNmUyYzI3NTU4ODE2ZWYyMWQ0MjU3NjkxOGRkMWZlZWM1ODJiYzk4MDkyZjllOTNmNWRhYzk4ZWIzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-05-16 10:12:48', '2025-05-16 10:12:48'),
(96, 'GET', '[]', 'http://localhost:8000/animal-theme-cake-3kg', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6IjVJclZDcHE2UjE5MnRTbTNZcVNXWXc9PSIsInZhbHVlIjoicExLR0hxUVVJOHVwRkxHZFcvR1Y3cEQ0bmtxWFZsL1NUYTZuNGpDaTRCckhXUTlhMVc4OUxWb096K0oyQjVmY1E5SDV0YW5rb2pmNG9DRGJEelJZZ051cjJpUVhJdHdtVENEdXlXZE9pV0xCUmVzNEpQWFN5TDlkSk1SaTVwK2EiLCJtYWMiOiJjNTFiODMwMDRlODFjM2ZlNDE2YzI4YjFhNGVlNTE3MmE0YWE5ZDc1MDNjZjlmZTcyNzYwZWJhYThlNWUwNjExIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IjRrRjNNV0xyd2R4blpTMlhsUlQ0ZXc9PSIsInZhbHVlIjoiSDVLSjF3MHFjcVVsVC9YMFJBci9OMHdqeHR6ajJGNmpKVi9tdjVRWWxRcmdWa2lIbVVJZXY1cEVyeklISFIvZlN3UGF1WDgrd09IVndMU3FkRlQ4OHhXVmNTTFExS1ZiamQrQ2s0ejlYM2FQcGJiTWRnZXFkL1FiMDI1UkV1L3UiLCJtYWMiOiI2Mzc1ZDQ0NTZkNzc2MWQ1N2RmMWQ4OTMwM2QxMzAwZDBhYjYzZjg4MDkwM2RhMzAzYmI5MzAwNWUzM2IwMmJlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-05-16 10:19:51', '2025-05-16 10:19:51'),
(97, 'GET', '[]', 'http://localhost:8000/themes/default/assets/css/admin.css', 'http://localhost:8000/admin/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"136\\\", \\\"Google Chrome\\\";v=\\\"136\\\", \\\"Not.A\\/Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"tk_ai=NRrl5UpmSaltOFvxLpUs4AUJ; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2025-05-12%2006%3A14%3A49%7C%7C%7Cep%3Dhttp%3A%2F%2Flocalhost%3A8888%2Fwordpress%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D7%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Macintosh%3B%20Intel%20Mac%20OS%20X%2010_15_7%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F136.0.0.0%20Safari%2F537.36; XSRF-TOKEN=eyJpdiI6Ik9MWXd5bU1Wbk5NYUd4dHhQMjUwUnc9PSIsInZhbHVlIjoiRnhFelhSdEh5NWZ4QWhob0U0dXBVSTlSWlV4Q0tSWmZUdTdxc1MzVkdGcEJhL1B1QXMyb2dSbHlPblFOYndlYXptck1VSFFTUlFBcFZxdUxWUnJJKzNaNXRQOGZBNG9iSnl4RXlaVS9Od1RtTHZZTXJlRC9nSThNNTJiU244a1QiLCJtYWMiOiIwNGEwYmJmYjQxNzhlMDBmZmYwMzk5YTNmMDg5OTBhMDQ3OTlmYTgxMzNhYzMwY2IxZjY2ZDA3MjhjMTc1NmZmIiwidGFnIjoiIn0%3D; ammas_session=eyJpdiI6IlNvQjFGZGxyVm03MUJJWlUwOTZXRHc9PSIsInZhbHVlIjoiNU5WazBXNlNReEpVUG95cWRMRWJUMU4xaHlEZHdHTjJLaGl3SGtFQytnSUJ3RGNkTktNVHF6MmlXVEZ2cVJ2QW5pMVBUTXRPR2ZZT2hKUWRCWW96OTNoNjlHU0prb1VVWW1HeXRTNWtvV1RFQmt1bU9pTTIyTk9BeDR1dytBbUwiLCJtYWMiOiIzZjQ1MGVkYTBlM2Q2MGZjODllZGEzY2QwODc5M2YxMTRiMGJkNTEwZTI5OTQ0ZGY1ZGZkY2VjZTUxNDI4ZjhmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-05-19 04:37:46', '2025-05-19 04:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`),
  ADD KEY `addresses_parent_address_id_foreign` (`parent_address_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_families`
--
ALTER TABLE `attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `attribute_rewards`
--
ALTER TABLE `attribute_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_rewards_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `cart_rewards`
--
ALTER TABLE `cart_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rules`
--
ALTER TABLE `cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `category_rewards`
--
ALTER TABLE `category_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_rewards_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_specific_time_rewards`
--
ALTER TABLE `category_specific_time_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_specific_time_rewards_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Indexes for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_otps`
--
ALTER TABLE `customer_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_otps_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_otps_mobile_index` (`mobile`),
  ADD KEY `customer_otps_otp_index` (`otp`);

--
-- Indexes for table `customer_password_resets`
--
ALTER TABLE `customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `ens_sms`
--
ALTER TABLE `ens_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_cards_giftcard_number_index` (`giftcard_number`);

--
-- Indexes for table `gift_card_balances`
--
ALTER TABLE `gift_card_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_payments`
--
ALTER TABLE `gift_card_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_card_payments_giftcard_number_index` (`giftcard_number`),
  ADD KEY `gift_card_payments_order_id_index` (`order_id`),
  ADD KEY `gift_card_payments_payment_id_index` (`payment_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_batches_import_id_foreign` (`import_id`);

--
-- Indexes for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

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
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Indexes for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  ADD UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_channels`
--
ALTER TABLE `product_channels`
  ADD UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  ADD KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `product_rewards`
--
ALTER TABLE `product_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_rewards_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_specific_time_rewards`
--
ALTER TABLE `product_specific_time_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specific_time_rewards_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `redemption_settings`
--
ALTER TABLE `redemption_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Indexes for table `reward_configs`
--
ALTER TABLE `reward_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_points`
--
ALTER TABLE `reward_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_points_order_id_foreign` (`order_id`),
  ADD KEY `reward_points_product_id_foreign` (`product_id`),
  ADD KEY `reward_points_category_id_foreign` (`category_id`),
  ADD KEY `reward_points_attribute_id_foreign` (`attribute_id`),
  ADD KEY `reward_points_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_terms`
--
ALTER TABLE `search_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_terms_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customizations_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`);

--
-- Indexes for table `url_rewrites`
--
ALTER TABLE `url_rewrites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  ADD KEY `visits_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `attribute_families`
--
ALTER TABLE `attribute_families`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `attribute_rewards`
--
ALTER TABLE `attribute_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_payment`
--
ALTER TABLE `cart_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_rewards`
--
ALTER TABLE `cart_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_rules`
--
ALTER TABLE `cart_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `category_rewards`
--
ALTER TABLE `category_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_specific_time_rewards`
--
ALTER TABLE `category_specific_time_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channel_translations`
--
ALTER TABLE `channel_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `compare_items`
--
ALTER TABLE `compare_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_otps`
--
ALTER TABLE `customer_otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ens_sms`
--
ALTER TABLE `ens_sms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_balances`
--
ALTER TABLE `gift_card_balances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_payments`
--
ALTER TABLE `gift_card_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_batches`
--
ALTER TABLE `import_batches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1024;

--
-- AUTO_INCREMENT for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_flat`
--
ALTER TABLE `product_flat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_rewards`
--
ALTER TABLE `product_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_specific_time_rewards`
--
ALTER TABLE `product_specific_time_rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `redemption_settings`
--
ALTER TABLE `redemption_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_items`
--
ALTER TABLE `refund_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_configs`
--
ALTER TABLE `reward_configs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_points`
--
ALTER TABLE `reward_points`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_terms`
--
ALTER TABLE `search_terms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `url_rewrites`
--
ALTER TABLE `url_rewrites`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_rewards`
--
ALTER TABLE `attribute_rewards`
  ADD CONSTRAINT `attribute_rewards_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_rewards`
--
ALTER TABLE `category_rewards`
  ADD CONSTRAINT `category_rewards_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_specific_time_rewards`
--
ALTER TABLE `category_specific_time_rewards`
  ADD CONSTRAINT `category_specific_time_rewards_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_otps`
--
ALTER TABLE `customer_otps`
  ADD CONSTRAINT `customer_otps_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gift_card_payments`
--
ALTER TABLE `gift_card_payments`
  ADD CONSTRAINT `gift_card_payments_giftcard_number_foreign` FOREIGN KEY (`giftcard_number`) REFERENCES `gift_cards` (`giftcard_number`) ON DELETE CASCADE;

--
-- Constraints for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_channels`
--
ALTER TABLE `product_channels`
  ADD CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_rewards`
--
ALTER TABLE `product_rewards`
  ADD CONSTRAINT `product_rewards_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_specific_time_rewards`
--
ALTER TABLE `product_specific_time_rewards`
  ADD CONSTRAINT `product_specific_time_rewards_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reward_points`
--
ALTER TABLE `reward_points`
  ADD CONSTRAINT `reward_points_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_points_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_points_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_points_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_points_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_terms`
--
ALTER TABLE `search_terms`
  ADD CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
