-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 24, 2025 alle 11:36
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwtriptales_db`
--
CREATE DATABASE IF NOT EXISTS `pwtriptales_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pwtriptales_db`;

-- --------------------------------------------------------

--
-- Struttura della tabella `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('3c28c666033851be81c594119dc68b987f85dddc', '2025-05-24 07:27:37.429875', 4),
('48504b6a02f59ba0d6c9c7a849c072c3aeecf93a', '2025-05-22 16:22:46.612402', 2),
('ad988dc81388760dc381eec756582e6d065b461f', '2025-05-24 06:49:56.319707', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add badge', 7, 'add_badge'),
(26, 'Can change badge', 7, 'change_badge'),
(27, 'Can delete badge', 7, 'delete_badge'),
(28, 'Can view badge', 7, 'view_badge'),
(29, 'Can add user badge', 8, 'add_userbadge'),
(30, 'Can change user badge', 8, 'change_userbadge'),
(31, 'Can delete user badge', 8, 'delete_userbadge'),
(32, 'Can view user badge', 8, 'view_userbadge'),
(33, 'Can add trip', 9, 'add_trip'),
(34, 'Can change trip', 9, 'change_trip'),
(35, 'Can delete trip', 9, 'delete_trip'),
(36, 'Can view trip', 9, 'view_trip'),
(37, 'Can add comment', 10, 'add_comment'),
(38, 'Can change comment', 10, 'change_comment'),
(39, 'Can delete comment', 10, 'delete_comment'),
(40, 'Can view comment', 10, 'view_comment'),
(41, 'Can add like', 11, 'add_like'),
(42, 'Can change like', 11, 'change_like'),
(43, 'Can delete like', 11, 'delete_like'),
(44, 'Can view like', 11, 'view_like'),
(45, 'Can add post', 12, 'add_post'),
(46, 'Can change post', 12, 'change_post'),
(47, 'Can delete post', 12, 'delete_post'),
(48, 'Can view post', 12, 'view_post'),
(49, 'Can add Token', 13, 'add_token'),
(50, 'Can change Token', 13, 'change_token'),
(51, 'Can delete Token', 13, 'delete_token'),
(52, 'Can view Token', 13, 'view_token'),
(53, 'Can add token', 14, 'add_tokenproxy'),
(54, 'Can change token', 14, 'change_tokenproxy'),
(55, 'Can delete token', 14, 'delete_tokenproxy'),
(56, 'Can view token', 14, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(13, 'authtoken', 'token'),
(14, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(10, 'posts', 'comment'),
(11, 'posts', 'like'),
(12, 'posts', 'post'),
(5, 'sessions', 'session'),
(9, 'trips', 'trip'),
(7, 'users', 'badge'),
(6, 'users', 'user'),
(8, 'users', 'userbadge');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-20 08:18:54.801300'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-05-20 08:18:54.870471'),
(3, 'auth', '0001_initial', '2025-05-20 08:18:55.230949'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-05-20 08:18:55.381561'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-05-20 08:18:55.388520'),
(6, 'auth', '0004_alter_user_username_opts', '2025-05-20 08:18:55.395030'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-05-20 08:18:55.401499'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-05-20 08:18:55.406470'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-05-20 08:18:55.413415'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-05-20 08:18:55.420007'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-05-20 08:18:55.426726'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-05-20 08:18:55.442102'),
(13, 'auth', '0011_update_proxy_permissions', '2025-05-20 08:18:55.449882'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-05-20 08:18:55.456865'),
(15, 'users', '0001_initial', '2025-05-20 08:18:56.085801'),
(16, 'admin', '0001_initial', '2025-05-20 08:18:56.265627'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-05-20 08:18:56.274824'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-20 08:18:56.308984'),
(19, 'trips', '0001_initial', '2025-05-20 08:18:56.361343'),
(20, 'posts', '0001_initial', '2025-05-20 08:18:56.425126'),
(21, 'posts', '0002_initial', '2025-05-20 08:18:56.508006'),
(22, 'posts', '0003_initial', '2025-05-20 08:18:56.940496'),
(23, 'sessions', '0001_initial', '2025-05-20 08:18:56.985268'),
(24, 'trips', '0002_initial', '2025-05-20 08:18:57.271486'),
(25, 'authtoken', '0001_initial', '2025-05-22 14:50:56.983846'),
(26, 'authtoken', '0002_auto_20160226_1747', '2025-05-22 14:50:57.026338'),
(27, 'authtoken', '0003_tokenproxy', '2025-05-22 14:50:57.032726'),
(28, 'users', '0002_alter_user_groups_alter_user_user_permissions', '2025-05-22 14:50:57.058231'),
(29, 'users', '0003_alter_user_badges_alter_user_groups_and_more', '2025-05-22 15:55:33.968417');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('tn49xuqspty4uwlpwk7yd96ww1k75tb2', '.eJxVjEEOwiAURO_C2pD-wi_g0n3PQOADUjWQlHZlvLs06UJn-ebNvJl1-5bt3uJql8CuDNjll3lHz1iOIjxcuVdOtWzr4vmh8LNtfK4hvm6n-3eQXct9LZBEwpHEZFBrg0InoM7kKCBMIEE7DAQoB4hJkfHKJB9diKAG1cM-X7rVNyU:1uI7Jy:k0xmgubJ7z09WY5juiZLbXVykUp-gcx6GUs3yGHILrM', '2025-06-05 14:54:58.207151');

-- --------------------------------------------------------

--
-- Struttura della tabella `posts_comment`
--

CREATE TABLE `posts_comment` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posts_comment`
--

INSERT INTO `posts_comment` (`id`, `content`, `created_at`, `post_id`, `user_id`) VALUES
(1, 'ciao', '2025-05-24 07:12:51.597643', 1, 3),
(2, 'Ottima foto', '2025-05-24 07:26:30.467683', 1, 3),
(3, 'Ottimo gatto', '2025-05-24 07:40:38.822516', 1, 4),
(4, 'sei bellissimo', '2025-05-24 08:13:00.152422', 3, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `posts_like`
--

CREATE TABLE `posts_like` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posts_like`
--

INSERT INTO `posts_like` (`id`, `created_at`, `post_id`, `user_id`) VALUES
(1, '2025-05-24 07:12:19.870945', 1, 3),
(2, '2025-05-24 07:40:27.806977', 1, 4),
(3, '2025-05-24 09:09:57.370516', 4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `posts_post`
--

CREATE TABLE `posts_post` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `location_name` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `ocr_text` longtext DEFAULT NULL,
  `translated_text` longtext DEFAULT NULL,
  `object_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`object_tags`)),
  `smart_caption` longtext DEFAULT NULL,
  `trip_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posts_post`
--

INSERT INTO `posts_post` (`id`, `content`, `image`, `latitude`, `longitude`, `location_name`, `created_at`, `ocr_text`, `translated_text`, `object_tags`, `smart_caption`, `trip_id`, `user_id`) VALUES
(1, 'Gatto', 'post_images/post_image7909870530543238480.jpg', NULL, NULL, 'Posizione non disponibile (permesso negato)', '2025-05-24 07:06:58.382429', '', NULL, '{\"tags\": \"[Wall, Pattern, Metal, Tile, Building, Room]\"}', 'This image appears to contain Wall, Pattern, Metal', 1, 3),
(2, 'Di nuovo gatto', 'post_images/post_image2900042554813157740.jpg', NULL, NULL, 'Posizione non disponibile (permesso negato)', '2025-05-24 07:12:13.286385', '', NULL, '{\"tags\": \"[Wall, Pattern, Metal, Building, Tile]\"}', 'This image appears to contain Wall, Pattern, Metal', 1, 3),
(3, 'Fantin', 'post_images/post_image4572040925887826197.jpg', NULL, NULL, 'Posizione non disponibile (permesso negato)', '2025-05-24 08:12:47.449753', NULL, NULL, NULL, NULL, 1, 4),
(4, 'Fantin felice', 'post_images/post_image7815933453603243956.jpg', 45.5525583, 11.5554065, 'Posizione (45.55256, 11.555407)', '2025-05-24 09:09:17.565882', NULL, NULL, NULL, NULL, 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `trips_trip`
--

CREATE TABLE `trips_trip` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `trips_trip`
--

INSERT INTO `trips_trip` (`id`, `name`, `description`, `start_date`, `end_date`, `created_at`, `created_by_id`) VALUES
(1, 'Sassari', 'Visitiamo sassari', '2025-04-01', '2025-04-15', '2025-05-24 06:50:22.859369', 3),
(2, 'Monticello', 'Andiamo a casa di Fantin :)', '2025-05-25', '2025-05-25', '2025-05-24 08:57:42.669053', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `trips_trip_members`
--

CREATE TABLE `trips_trip_members` (
  `id` bigint(20) NOT NULL,
  `trip_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `trips_trip_members`
--

INSERT INTO `trips_trip_members` (`id`, `trip_id`, `user_id`) VALUES
(1, 1, 3),
(7, 1, 4),
(8, 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `users_badge`
--

CREATE TABLE `users_badge` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users_badge`
--

INSERT INTO `users_badge` (`id`, `name`, `description`, `icon`) VALUES
(1, 'First Trip', 'Created your first trip adventure', 'https://via.placeholder.com/64/4CAF50/FFFFFF?text=🎒'),
(2, 'Explorer', 'Joined 5 different trips', 'https://via.placeholder.com/64/2196F3/FFFFFF?text=🗺️'),
(3, 'Photographer', 'Uploaded 10 photos with memories', 'https://via.placeholder.com/64/FF9800/FFFFFF?text=📸'),
(4, 'Globetrotter', 'Visited 3 different locations', 'https://via.placeholder.com/64/9C27B0/FFFFFF?text=🌍'),
(5, 'Social', 'Left 20 comments on memories', 'https://via.placeholder.com/64/E91E63/FFFFFF?text=💬');

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users_user`
--

INSERT INTO `users_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `profile_image`) VALUES
(1, 'pbkdf2_sha256$600000$2MLQnDvThMJnlqG5wekhVW$Twp3uncgP/TGhcKKtZDsJSDXGZjHQaqpOpQ0uqHWT9M=', '2025-05-22 14:54:58.201469', 1, 'User', '', '', 'user@gmail.com', 1, 1, '2025-05-22 14:52:31.172722', ''),
(2, 'pbkdf2_sha256$600000$IDksU75qGZtYk8x63BOAMD$NGzNvaSuHsd68RwC3Hc+hT0al+MH1768WVaDHsJH084=', '2025-05-22 16:22:46.617300', 0, 'testuser', '', '', 'test@example.com', 0, 1, '2025-05-22 16:20:58.943820', ''),
(3, 'pbkdf2_sha256$600000$UdLASLbtQiV1cDi6Rv54qM$lbA5neO41xOKvoeVuWbTDFcW0pLs9wQwsQmYPzudpBM=', '2025-05-24 06:49:56.324571', 0, 'giovanni', '', '', 'giovanni@gmail.com', 0, 1, '2025-05-24 06:49:44.118904', ''),
(4, 'pbkdf2_sha256$600000$FOnbM9WEjDXWiY5Gixqitn$FckK0ZZlH/wV1gSAGDAgltUlKro/deLQJVrGUcPpjmQ=', '2025-05-24 08:11:59.803967', 0, 'pascoli', '', '', 'pascoli@gmail.com', 0, 1, '2025-05-24 07:27:26.301327', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `users_userbadge`
--

CREATE TABLE `users_userbadge` (
  `id` bigint(20) NOT NULL,
  `date_earned` datetime(6) NOT NULL,
  `badge_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users_userbadge`
--

INSERT INTO `users_userbadge` (`id`, `date_earned`, `badge_id`, `user_id`) VALUES
(1, '2025-05-24 08:57:42.678755', 1, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indici per le tabelle `posts_comment`
--
ALTER TABLE `posts_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_comment_post_id_e81436d7_fk_posts_post_id` (`post_id`),
  ADD KEY `posts_comment_user_id_ad949c47_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `posts_like`
--
ALTER TABLE `posts_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_like_post_id_127195b7_fk_posts_post_id` (`post_id`),
  ADD KEY `posts_like_user_id_1d505823_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `posts_post`
--
ALTER TABLE `posts_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_trip_id_c968296a_fk_trips_trip_id` (`trip_id`),
  ADD KEY `posts_post_user_id_a4f40dc7_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `trips_trip`
--
ALTER TABLE `trips_trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_trip_created_by_id_f8d8c76e_fk_users_user_id` (`created_by_id`);

--
-- Indici per le tabelle `trips_trip_members`
--
ALTER TABLE `trips_trip_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trips_trip_members_trip_id_user_id_5a2c4a44_uniq` (`trip_id`,`user_id`),
  ADD KEY `trips_trip_members_user_id_dcf99f9c_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `users_badge`
--
ALTER TABLE `users_badge`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `users_userbadge`
--
ALTER TABLE `users_userbadge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_userbadge_badge_id_663925dd_fk_users_badge_id` (`badge_id`),
  ADD KEY `users_userbadge_user_id_2b82720a_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `posts_comment`
--
ALTER TABLE `posts_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `posts_like`
--
ALTER TABLE `posts_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `posts_post`
--
ALTER TABLE `posts_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `trips_trip`
--
ALTER TABLE `trips_trip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `trips_trip_members`
--
ALTER TABLE `trips_trip_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `users_badge`
--
ALTER TABLE `users_badge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users_userbadge`
--
ALTER TABLE `users_userbadge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `posts_comment`
--
ALTER TABLE `posts_comment`
  ADD CONSTRAINT `posts_comment_post_id_e81436d7_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`),
  ADD CONSTRAINT `posts_comment_user_id_ad949c47_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `posts_like`
--
ALTER TABLE `posts_like`
  ADD CONSTRAINT `posts_like_post_id_127195b7_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`),
  ADD CONSTRAINT `posts_like_user_id_1d505823_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `posts_post`
--
ALTER TABLE `posts_post`
  ADD CONSTRAINT `posts_post_trip_id_c968296a_fk_trips_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trips_trip` (`id`),
  ADD CONSTRAINT `posts_post_user_id_a4f40dc7_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `trips_trip`
--
ALTER TABLE `trips_trip`
  ADD CONSTRAINT `trips_trip_created_by_id_f8d8c76e_fk_users_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `trips_trip_members`
--
ALTER TABLE `trips_trip_members`
  ADD CONSTRAINT `trips_trip_members_trip_id_b37db600_fk_trips_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trips_trip` (`id`),
  ADD CONSTRAINT `trips_trip_members_user_id_dcf99f9c_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `users_userbadge`
--
ALTER TABLE `users_userbadge`
  ADD CONSTRAINT `users_userbadge_badge_id_663925dd_fk_users_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `users_badge` (`id`),
  ADD CONSTRAINT `users_userbadge_user_id_2b82720a_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
