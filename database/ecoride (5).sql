-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3307
-- Généré le : mer. 23 juil. 2025 à 23:28
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecoride`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('actif','suspendu') DEFAULT 'actif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `nom`, `prenom`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Super', 'admin@ecoride.com', '$2y$12$gQckKO3BuOvkDseUQEvG8.w3P5ypab1FOWIX/NWPe.KoLzRTDdsOu', 'actif', '2025-07-05 16:53:28', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `trajet` varchar(255) NOT NULL,
  `passager_id` varchar(50) NOT NULL,
  `conducteur_id` varchar(50) NOT NULL,
  `note` tinyint(4) NOT NULL,
  `commentaire` text DEFAULT NULL,
  `statut_avis` enum('en_attente','approuve','rejete') NOT NULL DEFAULT 'en_attente',
  `date_creation` datetime NOT NULL DEFAULT current_timestamp(),
  `ponctualite` varchar(255) DEFAULT NULL,
  `conduite_securisee` tinyint(1) DEFAULT 0,
  `recommande` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `trajet`, `passager_id`, `conducteur_id`, `note`, `commentaire`, `statut_avis`, `date_creation`, `ponctualite`, `conduite_securisee`, `recommande`) VALUES
(6, 'Lyon - Valence', '35', '2', 3, 'j adore !', 'en_attente', '2025-07-02 08:58:29', NULL, 0, 0),
(7, 'Lille → Lyon', '35', '38', 5, 'j aodre !', 'approuve', '2025-07-02 09:52:37', NULL, 0, 0),
(8, 'Lyon - Valence', '35', '38', 2, 'hzshdjnh', 'en_attente', '2025-07-02 11:30:13', NULL, 0, 0),
(9, 'Lyon - Valence', '35', '38', 2, 'hzshdjnh', 'en_attente', '2025-07-02 11:30:14', NULL, 0, 0),
(10, 'Lyon - Valence', '35', '38', 5, 'testte', 'en_attente', '2025-07-02 11:48:28', NULL, 0, 0),
(11, 'Lyon - Valence', '35', '38', 5, 'testeteteetetet', 'en_attente', '2025-07-02 12:03:46', NULL, 0, 0),
(12, 'Lyon - Valence', '35', '38', 1, 'hzgdgzhbdhbzahbdh', 'en_attente', '2025-07-02 12:09:45', NULL, 0, 0),
(13, 'Lyon - Valence', '35', '38', 5, 'super conducteur', 'en_attente', '2025-07-09 14:55:25', NULL, 0, 0),
(14, 'Lyon - Valence', '35', '38', 5, 'super conducteur', 'en_attente', '2025-07-09 14:55:28', NULL, 0, 0),
(15, 'Lyon - Valence', '35', '38', 5, 'au top !', 'en_attente', '2025-07-09 14:56:36', NULL, 0, 0),
(16, 'Lyon - Valence', '35', '38', 5, 'au top !', 'en_attente', '2025-07-09 14:57:34', NULL, 0, 0),
(17, 'Lyon - Valence', '35', '38', 5, 'au top !', 'approuve', '2025-07-09 14:58:15', NULL, 0, 0),
(18, 'Lyon - Valence', '35', '38', 5, 'au top se chauffeur je recommande', 'approuve', '2025-07-09 15:00:38', NULL, 0, 0),
(19, 'Lyon - Valence', '35', '38', 5, 'au top !', 'en_attente', '2025-07-09 15:06:37', NULL, 0, 0),
(20, 'Lyon - Valence', '35', '38', 5, 'au top !', 'en_attente', '2025-07-11 14:57:35', NULL, 0, 0),
(21, 'Annecy - Lyon', '38', '35', 5, 'je l adore !', 'approuve', '2025-07-11 14:59:44', NULL, 0, 0),
(22, 'Lyon - Valence', '38', '35', 5, 'test', 'approuve', '2025-07-11 15:00:01', NULL, 0, 0),
(23, 'Annecy - Valence', '38', '39', 5, 'au top !', 'approuve', '2025-07-13 00:57:51', NULL, 0, 0),
(24, 'Annecy - Lyon', '35', '38', 5, 'au top !', 'approuve', '2025-07-15 10:28:11', NULL, 0, 0),
(25, 'Annecy - Lyon', '35', '38', 5, 'au top !', 'approuve', '2025-07-15 10:28:33', NULL, 0, 0),
(26, 'Annecy - Lyon', '35', '38', 4, 'au top !', 'approuve', '2025-07-15 10:28:54', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `avis_plateformes`
--

CREATE TABLE `avis_plateformes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avis_platforme`
--

CREATE TABLE `avis_platforme` (
  `id` int(11) NOT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `note` int(10) NOT NULL,
  `message` text NOT NULL,
  `valide` tinyint(1) DEFAULT 0,
  `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `avis_platforme`
--

INSERT INTO `avis_platforme` (`id`, `nom_prenom`, `email`, `note`, `message`, `valide`, `utilisateur_id`) VALUES
(38, 'Frank Dubois', 'FKD@gmail.com', 5, 'je trouve votre platforme surprenantes', 1, NULL),
(40, 'John Doe', 'John-Doe@gmail.com', 3, 'au top votre plateforme !', 1, NULL),
(41, 'Thom Le s', 'TomS@eight-id.com', 5, 'j adore !', 1, NULL),
(42, 'aymerick guittard', 'aymerick.guittard@mac.com', 4, 'super platforme !', 1, NULL),
(43, 'aymerick guittard', 'aymerick.guittard@mac.com', 5, 'tesr', 1, NULL),
(44, 'aymerick guittard', 'aymerick.guittard@mac.com', 5, 'j adore !', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('ecoride_v2_cache_8fafc9d04046ece097e21901c7f3dc28', 'i:18;', 1753194141),
('ecoride_v2_cache_8fafc9d04046ece097e21901c7f3dc28:timer', 'i:1753194141;', 1753194141),
('ecoride_v2_cache_a75f3f172bfb296f2e10cbfc6dfc1883', 'i:8;', 1753254207),
('ecoride_v2_cache_a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1753254206;', 1753254207),
('ecoride_v2_cache_bfa48a140c1129277232d8e74d8b4776', 'i:9;', 1753175512),
('ecoride_v2_cache_bfa48a140c1129277232d8e74d8b4776:timer', 'i:1753175512;', 1753175512),
('ecoride_v2_cache_d07b9d9e291aa644ffd589885212e66b', 'i:9;', 1753254228),
('ecoride_v2_cache_d07b9d9e291aa644ffd589885212e66b:timer', 'i:1753254228;', 1753254228),
('ecoride_v2_cache_ec8976ae5d6033a9bd042aaf6d3362d9', 'i:9;', 1753194361),
('ecoride_v2_cache_ec8976ae5d6033a9bd042aaf6d3362d9:timer', 'i:1753194361;', 1753194361),
('ecoride_v2_cache_f1f70ec40aaa556905d4a030501c0ba4', 'i:1;', 1753111891),
('ecoride_v2_cache_f1f70ec40aaa556905d4a030501c0ba4:timer', 'i:1753111891;', 1753111891),
('ecoride_v2_cache_fc189ce74afb392bb58da69b73e35554', 'i:9;', 1753172288),
('ecoride_v2_cache_fc189ce74afb392bb58da69b73e35554:timer', 'i:1753172288;', 1753172288);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(21, 'aymerick guittard', 'aymerick.guittard@mac.com', 'renseignement', 'test encore un test', '2025-07-10 21:26:56', '2025-07-10 21:26:56'),
(22, 'aymerick guittard', 'aymerick.guittard@mac.com', 'encore un test', 'ceci est un test', '2025-07-12 08:24:02', '2025-07-12 08:24:02'),
(23, 'aymerick guittard', 'aymerick.guittard@mac.com', 'encore un test', 'ceci est un test', '2025-07-13 02:26:38', '2025-07-13 02:26:38'),
(24, 'Cedric Guittard', 'CGU@gmail.com', 'encore un test', 'ceci est un tesssssssssssssssssssssssss', '2025-07-14 19:59:06', '2025-07-14 19:59:06'),
(25, 'John Doe', 'John-Doe@gmail.com', 'nouvelle version', 'HO une nouvelle version de Ecoride ! J adore !', '2025-07-17 09:54:37', '2025-07-17 09:54:37'),
(26, 'John Doe', 'John-Doe@gmail.com', 'encore un test', 'tetste', '2025-07-17 10:01:37', '2025-07-17 10:01:37'),
(28, 'John Doe', 'aymerick.guittard@mac.com', 'encore un test', 'tetsetet', '2025-07-17 10:03:03', '2025-07-17 10:03:03'),
(29, 'aymerick guittard', 'aymerick.guittard@mac.com', 'j adore', 'test j adore vraiement', '2025-07-18 12:34:16', '2025-07-18 12:34:16');

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('actif','inactif') DEFAULT 'actif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `nom`, `prenom`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Employe', 'Employe', 'employe@ecoride.com', '$2y$12$Ij8ngY3ZUPOfFmw9lq6AcOw.yR527n0l/DQq6t1Rp6dxvvddjeiPm', 'actif', '2025-07-06 12:54:18', '2025-07-20 16:55:58');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `incidents`
--

CREATE TABLE `incidents` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `conducteur_id` int(11) DEFAULT NULL,
  `trajet` varchar(255) DEFAULT NULL,
  `date_depart` date DEFAULT NULL,
  `heure_depart` time DEFAULT NULL,
  `heure_arrivee` time DEFAULT NULL,
  `message` text DEFAULT NULL,
  `statut` enum('en_attente','valide','rejete') DEFAULT 'en_attente',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `incidents`
--

INSERT INTO `incidents` (`id`, `utilisateur_id`, `conducteur_id`, `trajet`, `date_depart`, `heure_depart`, `heure_arrivee`, `message`, `statut`, `date_creation`) VALUES
(2, 35, 35, '1', '2025-07-02', '11:23:00', '14:23:00', 'probleme avec se chauffeur, manque de respect ', 'valide', '2025-07-03 05:23:37'),
(3, 35, 35, '1', '2025-07-02', '08:41:00', '11:41:00', 'probleme avec se chauffeur, manque de respect ', 'rejete', '2025-07-03 06:42:02'),
(4, 35, 39, '12', '2025-07-02', '08:41:00', '11:41:00', 'probleme avec se chauffeur, manque de respect ', 'valide', '2025-07-03 06:45:29'),
(5, 35, 35, '1', '2025-07-06', '15:48:00', '20:50:00', 'probleme avec se chauffeur, manque de respect ', 'valide', '2025-07-06 16:48:48'),
(8, 35, 38, '11', '2025-07-10', '11:13:00', '18:14:00', 'probleme avec se chauffeur, manque de respect ', 'en_attente', '2025-07-09 13:14:17');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(10, '2025_06_20_153113_create_avis_plateformes_table', 1),
(11, '2025_06_22_105456_create_contacts_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('gabaym140610@gmail.com', '$2y$12$IymgVAzxIU5jwegN0k0J8OvBl/9szyElEkSa9sMfS7DEe7pI1/3RO', '2025-06-28 15:28:53'),
('TomS@eight-id.com', '$2y$12$/a6G1YtJPlipc5Y3.aBDoOxm8bsCTNzqhpYo1RsIRmOm8L9lkBnnW', '2025-06-28 08:29:39');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'f3d31b42371a646bdcd07a1a4608b2761c04ad132a956c18fdbbc7e80439f68f', '[\"*\"]', '2025-06-26 18:09:14', NULL, '2025-06-26 18:08:08', '2025-06-26 18:09:14'),
(2, 'App\\Models\\Utilisateur', 37, 'ecoride-token', 'e2cd7d98b4ef0746b97ff6739e792c68b33f6e80c4bab2593ba86c200b5ea838', '[\"*\"]', '2025-06-26 18:09:31', NULL, '2025-06-26 18:09:24', '2025-06-26 18:09:31'),
(3, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '30cd2f0e813fd5bc8fef366873fda3eee63b7ef93d91e325298d7240397d2693', '[\"*\"]', '2025-06-26 18:09:47', NULL, '2025-06-26 18:09:40', '2025-06-26 18:09:47'),
(4, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'd91678e73a2707537b8304c9b029af6b5aae7d9d32e1b9d3bf3fbe116dfd6cf5', '[\"*\"]', '2025-06-26 18:22:13', NULL, '2025-06-26 18:12:05', '2025-06-26 18:22:13'),
(5, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '53fc2154ba82e53d71eba730f5f979f6391a5c47cea25c6b15a5c4d1d1364adf', '[\"*\"]', '2025-06-26 20:53:26', NULL, '2025-06-26 18:22:55', '2025-06-26 20:53:26'),
(6, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '2598d7abb2699425c241de487ff88617b86b0348db5f41bf93676ba1f1da78da', '[\"*\"]', '2025-06-26 20:58:58', NULL, '2025-06-26 20:58:54', '2025-06-26 20:58:58'),
(7, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'fc1768a09eacfc39dbee8702779fac578041ebc056a7739f04b08397720dd036', '[\"*\"]', '2025-07-04 18:48:25', NULL, '2025-06-26 21:22:05', '2025-07-04 18:48:25'),
(8, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '854fac29fb5e046bfec74514ceb437c89635f426fecbb33bc5b160a479b9936d', '[\"*\"]', NULL, NULL, '2025-06-26 21:22:07', '2025-06-26 21:22:07'),
(9, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '977c5992783409a526548f87ec6886e220ac548b0c5b8bb3237303f939d0d665', '[\"*\"]', '2025-06-27 10:07:13', NULL, '2025-06-27 05:14:42', '2025-06-27 10:07:13'),
(10, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'e751acb1a7a60d0a31f48edd07cb05790e1993071b1848a1e238fcab2a18683a', '[\"*\"]', '2025-06-27 14:22:02', NULL, '2025-06-27 10:12:07', '2025-06-27 14:22:02'),
(11, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '35ad20bf610caa11334ae0e26a668e7ceb0064b25b9d48474e01785c1b9d51f4', '[\"*\"]', '2025-06-27 14:22:13', NULL, '2025-06-27 14:22:10', '2025-06-27 14:22:13'),
(12, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6e148c17ca55ee75a6672a491fce9fae2dd779c96918c12f0e1a4c5168e4d7b4', '[\"*\"]', '2025-06-27 14:35:43', NULL, '2025-06-27 14:22:32', '2025-06-27 14:35:43'),
(13, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'c2a87c58ee7c80cc13a0115f9acfc205d54d3f397265b12149bb2739c411fd22', '[\"*\"]', '2025-06-28 07:31:58', NULL, '2025-06-27 14:36:45', '2025-06-28 07:31:58'),
(14, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '75a0395a54f7fe837a396249509eeb6cb5094f2c7ab3a4b28e1e82059a00cb07', '[\"*\"]', '2025-06-28 07:41:11', NULL, '2025-06-28 07:41:08', '2025-06-28 07:41:11'),
(15, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'dbec8ed520c44421bdd19ff617c7eb2832db90cfd9a219c0923d2d7bd8773081', '[\"*\"]', '2025-06-28 09:01:10', NULL, '2025-06-28 09:01:08', '2025-06-28 09:01:10'),
(16, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '958dc530ec4068bbac6374509577bb25c9eec9fe7148e950d47c1cc37658412a', '[\"*\"]', '2025-06-28 09:04:04', NULL, '2025-06-28 09:04:02', '2025-06-28 09:04:04'),
(17, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'db13f0c3132a845cc3e6cfcaf2ecf3123d4655dae0f02c05281e7bec48444c65', '[\"*\"]', '2025-06-28 09:59:50', NULL, '2025-06-28 09:59:48', '2025-06-28 09:59:50'),
(18, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '51eae49c2c95f88c2f228d68547aa420b5f0d008fe9ca26703c25ab03eb19e97', '[\"*\"]', '2025-06-28 10:09:38', NULL, '2025-06-28 10:01:32', '2025-06-28 10:09:38'),
(19, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'b24b836f36e337f9a4a865fb261ab39799c851326dde3ec9dd32aea9b64478e4', '[\"*\"]', '2025-06-28 10:16:29', NULL, '2025-06-28 10:09:43', '2025-06-28 10:16:29'),
(20, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '851420f05a6225adc1f5cb053cd68b072b0330dde4f0af59100f888c065e2c77', '[\"*\"]', '2025-06-28 10:18:05', NULL, '2025-06-28 10:16:42', '2025-06-28 10:18:05'),
(21, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1ddb406cf17714c7a9141e19e7e318757fe3dbe8ed5934e03421b93504aed3f2', '[\"*\"]', '2025-06-28 10:19:44', NULL, '2025-06-28 10:18:55', '2025-06-28 10:19:44'),
(22, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '31947daa459cd687b3bfbb2ebec81399395e4bf1229b9523cf3e9fdca8eb3821', '[\"*\"]', '2025-06-28 14:51:41', NULL, '2025-06-28 10:20:02', '2025-06-28 14:51:41'),
(23, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '68f70b4167823f2500ac46dce1cdd476e8f9eb1eef8c17cd37d6a768a387f48c', '[\"*\"]', '2025-06-28 21:22:56', NULL, '2025-06-28 14:52:35', '2025-06-28 21:22:56'),
(24, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'c159db9e7d2f885fbcdf5e94dc42d5f799bf0a315c11fd41d07d2b655df6c040', '[\"*\"]', '2025-06-28 21:27:03', NULL, '2025-06-28 21:27:01', '2025-06-28 21:27:03'),
(25, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '938a510e29586a8bd7446e3ce56b34a76c718203bc1f48b7ae9f3cf18afee96a', '[\"*\"]', '2025-06-28 21:33:02', NULL, '2025-06-28 21:28:30', '2025-06-28 21:33:02'),
(26, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '6486ac8603cd4f0508393161823905e7dc882301d77728a5a14a9b94380c791f', '[\"*\"]', '2025-06-28 21:35:02', NULL, '2025-06-28 21:35:01', '2025-06-28 21:35:02'),
(27, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'c104893ae5fb7f07eb61105edf6dfaa567a89a604c1a57428e06b4103e6f867e', '[\"*\"]', '2025-06-29 07:01:20', NULL, '2025-06-29 07:01:17', '2025-06-29 07:01:20'),
(28, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '527d5bcf023401c3592fd8f844f7213e00b90005a57333c47b0c77e9938a5e14', '[\"*\"]', '2025-06-29 14:00:17', NULL, '2025-06-29 07:05:59', '2025-06-29 14:00:17'),
(29, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'c8b4f8efde51d065050f91c50ec35405e09d615ce90513561aaa1ba043ca10ec', '[\"*\"]', NULL, NULL, '2025-06-29 14:00:36', '2025-06-29 14:00:36'),
(30, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '2c095a7a90833b1e0e7ef810ff6fd0d96a2c3565e44c15a325c2c7b0c4eb1e79', '[\"*\"]', '2025-06-29 15:09:56', NULL, '2025-06-29 14:00:37', '2025-06-29 15:09:56'),
(31, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'f345e50f0792124582709456a212a0737f4a8c97ecde4b18c5ca8fd25cfc1f87', '[\"*\"]', NULL, NULL, '2025-06-29 14:00:39', '2025-06-29 14:00:39'),
(32, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '9b5444d7dbc199b1f9d14e92568b5590f1220677027e033384bdfa4a3b1a3496', '[\"*\"]', NULL, NULL, '2025-06-29 14:00:40', '2025-06-29 14:00:40'),
(33, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '31442c687ec499782e66bf2892479e147762c0be6328d2cea7edfbd161370ac2', '[\"*\"]', '2025-06-29 17:17:15', NULL, '2025-06-29 17:17:10', '2025-06-29 17:17:15'),
(34, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '83deb977ad6445585dd2dfb07bb59323c3fafb057182e482f6f7d4f39ddb2957', '[\"*\"]', '2025-06-29 17:17:31', NULL, '2025-06-29 17:17:26', '2025-06-29 17:17:31'),
(35, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'fb02c6d147d90842de905b8b1a585d27f6938774edb227e8bbf2dc3a09db83ff', '[\"*\"]', '2025-06-29 17:20:45', NULL, '2025-06-29 17:20:40', '2025-06-29 17:20:45'),
(36, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '95ac2eb5778106b7ac3d0628449e404b256627ee4c53aa49a999e1f2c61be6de', '[\"*\"]', '2025-06-29 17:28:15', NULL, '2025-06-29 17:28:10', '2025-06-29 17:28:15'),
(37, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'a560a0c90315735a64eba5aaac890532b179f381f10d76207f062352b3fb8a9a', '[\"*\"]', '2025-06-29 17:42:06', NULL, '2025-06-29 17:34:34', '2025-06-29 17:42:06'),
(38, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'b85e8aed7b49029b494c3c072825a03eb5aaaa0a5ad634ba3e23dc6f14a3e0cd', '[\"*\"]', '2025-06-29 17:43:17', NULL, '2025-06-29 17:43:12', '2025-06-29 17:43:17'),
(39, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'ff91c0149f8c3bd027f84f7c7362d93b5844227a51322dc57714342465548a77', '[\"*\"]', '2025-06-29 19:20:43', NULL, '2025-06-29 19:20:39', '2025-06-29 19:20:43'),
(40, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'e92f8d09a518aba7a39efa2c2b7fc23fde00b06c71dd0bd2c878a7ba9a553960', '[\"*\"]', '2025-06-30 05:18:19', NULL, '2025-06-30 04:44:33', '2025-06-30 05:18:19'),
(41, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '8de24d34c4d8de3399e50c5dfe55a3f051e17f73bf27b5cb190dfe2a85e6fc8f', '[\"*\"]', '2025-06-30 05:18:48', NULL, '2025-06-30 05:18:26', '2025-06-30 05:18:48'),
(42, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'd3a2a4dca17305d403539cac806fa6900c53a7b2b0b0ede3e065bec51ac21cff', '[\"*\"]', '2025-06-30 05:18:54', NULL, '2025-06-30 05:18:51', '2025-06-30 05:18:54'),
(43, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '9c3c9a3d499381ef19ee714ec6435fa0e32a967de1fce6e04705a82d1c6175d1', '[\"*\"]', '2025-06-30 05:37:49', NULL, '2025-06-30 05:19:05', '2025-06-30 05:37:49'),
(44, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0ed9dc50cb7a698faf6e471b3a0ea964d54f6fd021ab3c1333dc97920e3c2c81', '[\"*\"]', '2025-06-30 05:51:03', NULL, '2025-06-30 05:50:59', '2025-06-30 05:51:03'),
(45, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'dfdfc36c2241cbe4011cfdc8b34506c7aa73bfc18da8516b8c3257cba429ecf2', '[\"*\"]', '2025-06-30 06:21:23', NULL, '2025-06-30 06:21:20', '2025-06-30 06:21:23'),
(46, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '233b74c79b1c33bf0c90031cdc032a1aadbfa35e0f2539747317ec5c865a21e8', '[\"*\"]', '2025-06-30 06:42:52', NULL, '2025-06-30 06:42:51', '2025-06-30 06:42:52'),
(47, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'fd49a2c8ec8a83d846df9f927695958bffe2e36c43b6580c6a7f0f97acd147f8', '[\"*\"]', '2025-06-30 06:46:23', NULL, '2025-06-30 06:43:04', '2025-06-30 06:46:23'),
(48, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '4c1e903e1a7bfb712452ed6f6fb52668a20ad092509ac7309351c875543aca5e', '[\"*\"]', '2025-06-30 06:47:45', NULL, '2025-06-30 06:46:59', '2025-06-30 06:47:45'),
(49, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'c901e65809965849a5405dcb9d8f6512b6b70eb6d911e0c41c280e80f6c046bd', '[\"*\"]', '2025-06-30 06:48:43', NULL, '2025-06-30 06:48:41', '2025-06-30 06:48:43'),
(50, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'ebe43a37a4d2713024d0550f027f43d7b465e19c553ea117d99bd83a3fa9cab7', '[\"*\"]', '2025-06-30 08:04:37', NULL, '2025-06-30 07:01:44', '2025-06-30 08:04:37'),
(51, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '6884c10cafc56873f4743b6e253a5e4edd1f385316d0351acf26ea5ddfeaea67', '[\"*\"]', '2025-06-30 08:13:37', NULL, '2025-06-30 08:12:31', '2025-06-30 08:13:37'),
(52, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'c4ee91c5d16fd0f6b0e37509c23f05cb7537b5239b0ee90fbc180e386468acae', '[\"*\"]', '2025-06-30 08:15:49', NULL, '2025-06-30 08:14:12', '2025-06-30 08:15:49'),
(53, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '4510b3c25589ba801510bf3fdcf7f4cd5793e22236395d5896c94c5e35ae9de0', '[\"*\"]', '2025-06-30 10:47:59', NULL, '2025-06-30 10:47:57', '2025-06-30 10:47:59'),
(54, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'd89661cc4a1f1d7783a22d4c6975d55ff7c6c985293ab531d76ee5286057b28d', '[\"*\"]', '2025-06-30 10:50:00', NULL, '2025-06-30 10:48:12', '2025-06-30 10:50:00'),
(55, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '73145a649cddd78d6367c90397e5469f49c91ed478e2500bc9f99dd7eabb7229', '[\"*\"]', '2025-06-30 11:19:15', NULL, '2025-06-30 11:05:09', '2025-06-30 11:19:15'),
(56, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '5f266ed4f93a372f2930d3dfe5365173ee0effc4eb1df3f732ee5679ea404207', '[\"*\"]', '2025-06-30 12:51:05', NULL, '2025-06-30 11:21:27', '2025-06-30 12:51:05'),
(57, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '825048925bd0e4123823fcced26ea8587a8da7247f407112855423d25fd947d3', '[\"*\"]', '2025-06-30 17:40:43', NULL, '2025-06-30 15:30:07', '2025-06-30 17:40:43'),
(58, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '7d40bb6e14e6909220c2281f0b2fa3b0a7198a58d7d36cea56ec87c0548f2700', '[\"*\"]', '2025-06-30 17:46:44', NULL, '2025-06-30 17:40:49', '2025-06-30 17:46:44'),
(59, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'fb7dee32cf6e364d2f4ad3533de248499059095ba5ec6fe100bb9a57b2f88797', '[\"*\"]', '2025-06-30 17:47:09', NULL, '2025-06-30 17:47:07', '2025-06-30 17:47:09'),
(60, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'ffbae6f7e83b18127ddb299458899362cf55a24036a6722e95d22e4c60f8fe29', '[\"*\"]', '2025-06-30 17:59:30', NULL, '2025-06-30 17:59:28', '2025-06-30 17:59:30'),
(61, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '9edc3dbec3cdc4d1f90acc69b6929040e631da32e8770d217b894b853762279d', '[\"*\"]', '2025-06-30 18:10:31', NULL, '2025-06-30 18:07:32', '2025-06-30 18:10:31'),
(62, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '3cac2c6d4c707dac8d1ef3dbf9e77090659b2e8bb8a23a5bcf356d63600ec204', '[\"*\"]', '2025-06-30 18:37:08', NULL, '2025-06-30 18:37:05', '2025-06-30 18:37:08'),
(63, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '54f96965b89fb1ac9cdfc2d9cf2b65aa4396630401ddbb502b171a8b44301ebd', '[\"*\"]', '2025-06-30 18:52:48', NULL, '2025-06-30 18:38:41', '2025-06-30 18:52:48'),
(64, 'App\\Models\\Utilisateur', 40, 'ecoride-token', '9da3da656b27f2b928d1c48d6fd18aabdf3b7d22e460a67617cb8bbe3bce58eb', '[\"*\"]', '2025-06-30 18:54:39', NULL, '2025-06-30 18:54:35', '2025-06-30 18:54:39'),
(65, 'App\\Models\\Utilisateur', 40, 'ecoride-token', 'fad3fc1686c43005544fed5eca2eb68af427b2c238475ddcedb775c2dee131d1', '[\"*\"]', '2025-06-30 18:54:52', NULL, '2025-06-30 18:54:48', '2025-06-30 18:54:52'),
(66, 'App\\Models\\Utilisateur', 40, 'ecoride-token', '809ca6020c249d733184d627e24cfec23e4b679e1174085e57d724cda7609938', '[\"*\"]', '2025-06-30 18:55:07', NULL, '2025-06-30 18:54:56', '2025-06-30 18:55:07'),
(67, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '1ef7f37a9db7a76735d17b9441cb9685066732457a8110773d80a5ab7b0ac247', '[\"*\"]', '2025-07-01 04:57:35', NULL, '2025-06-30 18:55:27', '2025-07-01 04:57:35'),
(68, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '7798b388214807495c90cd12a0e07aa85de0afb21e54dd1c9b041aab9f5258cb', '[\"*\"]', '2025-07-01 05:02:37', NULL, '2025-07-01 05:02:26', '2025-07-01 05:02:37'),
(69, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'b8abe2da9ab7641129a4618d1c62f373d40c4acac30851827ab5d1c311e0f55d', '[\"*\"]', NULL, NULL, '2025-07-01 05:06:45', '2025-07-01 05:06:45'),
(70, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '5f96e2b117f1536e77d1d653008ec61596d084edf5821a46b746b5659465895a', '[\"*\"]', '2025-07-01 05:07:02', NULL, '2025-07-01 05:06:47', '2025-07-01 05:07:02'),
(71, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '4ad4b2b1072d0829bfcf29271d4204d4ce70ad36c6f02594d82338a5f25c8edf', '[\"*\"]', '2025-07-01 05:31:18', NULL, '2025-07-01 05:07:07', '2025-07-01 05:31:18'),
(72, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '4cc2f8be5485b04a1d1c1e6cf5315df41103ef9505e9f5b727cca03d2fe89850', '[\"*\"]', '2025-07-01 05:33:11', NULL, '2025-07-01 05:31:24', '2025-07-01 05:33:11'),
(73, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'ab4db0ed7d720ecb5634845e3e55b15841b58148e5308ad56d4a574fc8cd7d71', '[\"*\"]', '2025-07-01 06:53:26', NULL, '2025-07-01 05:33:15', '2025-07-01 06:53:26'),
(74, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'af9871411c7bc129551fcb46d752c2ecd60aef0b4143752595019697c67e03e1', '[\"*\"]', '2025-07-01 07:22:53', NULL, '2025-07-01 06:53:29', '2025-07-01 07:22:53'),
(75, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'd3c7b3ff80dd8043bb28522ecc0ea312be07e2e21c16f2cb046bd41ad36f15f9', '[\"*\"]', '2025-07-01 07:28:58', NULL, '2025-07-01 07:24:19', '2025-07-01 07:28:58'),
(76, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '361c2ab357720a2b9f0fd764b68d419539297b7579ab039b583020025c769059', '[\"*\"]', '2025-07-01 07:45:55', NULL, '2025-07-01 07:34:32', '2025-07-01 07:45:55'),
(77, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '53d540f3f8bae6186e48c8b9fd82b5ed8deb58e300327b6a2cbb8cb75604d24c', '[\"*\"]', '2025-07-01 07:49:33', NULL, '2025-07-01 07:48:37', '2025-07-01 07:49:33'),
(78, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'fa681c24b35abcd6e4e2dd317f1164d4a040a350012483a5d3289d98b42dcbbd', '[\"*\"]', '2025-07-01 07:58:32', NULL, '2025-07-01 07:50:02', '2025-07-01 07:58:32'),
(79, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'cd334b57dc2ac0f035c23f5ed11fb67c89389738a1b472c51f1a62f883e486d3', '[\"*\"]', '2025-07-01 08:01:45', NULL, '2025-07-01 07:59:50', '2025-07-01 08:01:45'),
(80, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'bbd5b2014c2aed8bb56be633bd738a2342537326da7436380987788e8e0b110f', '[\"*\"]', '2025-07-01 08:02:39', NULL, '2025-07-01 08:01:53', '2025-07-01 08:02:39'),
(81, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '6c5ec5f7146525955a127622fb3c37f41a0edcc5da5a30e98acef4744ac61c72', '[\"*\"]', '2025-07-01 08:03:25', NULL, '2025-07-01 08:02:48', '2025-07-01 08:03:25'),
(82, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'bf4b1c478094bf147d1b376b8087a6991289b425dc23b76c0d95ae7c4f383762', '[\"*\"]', '2025-07-01 08:05:03', NULL, '2025-07-01 08:04:18', '2025-07-01 08:05:03'),
(83, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '4921fcac669cc35d09807d7b4e14d9ee917d487ca0e26f0af1e9f1b7f8496174', '[\"*\"]', '2025-07-01 09:00:31', NULL, '2025-07-01 08:05:19', '2025-07-01 09:00:31'),
(84, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '93028072fe2a434b88298f4ce3912f028c004cd1a2a8ebdfe3f742d3b3a07c9f', '[\"*\"]', '2025-07-01 09:14:09', NULL, '2025-07-01 09:00:36', '2025-07-01 09:14:09'),
(85, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '491d9822cc18da0945c341aeab1ba5156bcaa9e37fc4a7421748dfbbe6151f5a', '[\"*\"]', '2025-07-01 09:19:13', NULL, '2025-07-01 09:14:19', '2025-07-01 09:19:13'),
(86, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '8270ed95c0dbc8a72c8b0300ec59f1da494026e6807ed28c0b3910cd34e5eb09', '[\"*\"]', '2025-07-01 09:55:53', NULL, '2025-07-01 09:19:25', '2025-07-01 09:55:53'),
(87, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'bebbd721a8d1c1a4557aadb8c12b7cf7e86a40c9d8493dfb7c77593afd035d25', '[\"*\"]', '2025-07-01 09:58:28', NULL, '2025-07-01 09:56:03', '2025-07-01 09:58:28'),
(88, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '835821f86846f8193dfd92655da2ca511011351e78a15f7eee0d1ac7d6d679f8', '[\"*\"]', '2025-07-01 10:08:32', NULL, '2025-07-01 09:58:39', '2025-07-01 10:08:32'),
(89, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6a08b8314accc967b3fb4bc9e1572fbfa18d086be93854f0fb18de062657a7e1', '[\"*\"]', '2025-07-01 11:33:41', NULL, '2025-07-01 10:08:38', '2025-07-01 11:33:41'),
(90, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '96ceba1c420b673a3f8ea61ee2a367415567eac39663cd53c08f265a042096d0', '[\"*\"]', '2025-07-01 11:35:37', NULL, '2025-07-01 11:33:54', '2025-07-01 11:35:37'),
(91, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '72f759746f6b63fbd9fce083950200596fe34f5cdb0c80182da1f059a104f735', '[\"*\"]', '2025-07-01 11:37:25', NULL, '2025-07-01 11:35:46', '2025-07-01 11:37:25'),
(92, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '873dbf54f92102ce33975d0db2480032f8e613f9d4f5dc0095bbf2ee98587f52', '[\"*\"]', '2025-07-01 12:25:32', NULL, '2025-07-01 11:37:30', '2025-07-01 12:25:32'),
(93, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '636a49fb9c70ab55f64d6f25585306c247902625c833bfcb957244707cc85042', '[\"*\"]', '2025-07-01 12:27:58', NULL, '2025-07-01 12:25:38', '2025-07-01 12:27:58'),
(94, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '58c696c034fb75006e60f8781bf62912b7c6144ec125d4da3b73fb3e7b07fcfc', '[\"*\"]', '2025-07-01 17:18:26', NULL, '2025-07-01 12:28:02', '2025-07-01 17:18:26'),
(95, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '12298aa98f337f090f99df996c09f87cfc316dd37fe3bda3f69a6cde94f39249', '[\"*\"]', '2025-07-01 17:20:20', NULL, '2025-07-01 17:18:49', '2025-07-01 17:20:20'),
(96, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'fafd755a66d195e20b5e31530549fd757c846b756899e3618ef4af4d29d8d8dd', '[\"*\"]', '2025-07-01 17:21:17', NULL, '2025-07-01 17:20:55', '2025-07-01 17:21:17'),
(97, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '30169e9c11fb8558a111720dae1e72805bfc608ee3bc34c107fce9417b2f817a', '[\"*\"]', '2025-07-01 17:21:26', NULL, '2025-07-01 17:21:23', '2025-07-01 17:21:26'),
(98, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0030ddcccd1183f20441463ec302531108d7ccfbd2e56c61183c75b0cb257b11', '[\"*\"]', '2025-07-01 17:23:45', NULL, '2025-07-01 17:21:37', '2025-07-01 17:23:45'),
(99, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '8be4d1509308b6914d6511788ea192dda1015fc72ec2f8e677442c5dfe0f2cea', '[\"*\"]', '2025-07-01 17:25:05', NULL, '2025-07-01 17:23:56', '2025-07-01 17:25:05'),
(100, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'b93e71ea81a0c51b534220658c1c54376405b74aaa0b112ca19a0f3425a48f2e', '[\"*\"]', '2025-07-01 17:32:53', NULL, '2025-07-01 17:25:46', '2025-07-01 17:32:53'),
(101, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '1066047dce7d518dadb590fca6f8af0765e87e6e9b385f0aad9e1b78de12c42c', '[\"*\"]', '2025-07-01 18:28:50', NULL, '2025-07-01 17:32:59', '2025-07-01 18:28:50'),
(102, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '935a5656e2b2a09cbe36955dc9291de5c311b3e9e5e45206a922cae0f934d5d1', '[\"*\"]', '2025-07-01 18:30:26', NULL, '2025-07-01 18:29:08', '2025-07-01 18:30:26'),
(103, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '88d60137ff46a76df150c0e142860945872331eed28b35eeeccfe8d6fb1ca740', '[\"*\"]', '2025-07-01 18:33:04', NULL, '2025-07-01 18:31:26', '2025-07-01 18:33:04'),
(104, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '9abe79f787ec1306a6b28f18f7e2ba6b3251219e4a72c9855241c702b62883d5', '[\"*\"]', '2025-07-01 18:33:46', NULL, '2025-07-01 18:33:08', '2025-07-01 18:33:46'),
(105, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'c72f69b1d2bba7b4ef259d3e183903e0fdb6204037580535e601f5df1b498f16', '[\"*\"]', '2025-07-01 18:34:09', NULL, '2025-07-01 18:33:51', '2025-07-01 18:34:09'),
(106, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '845832f2134da56854e1cb3c8a22358b0fc53f067c1bdf64bc4c1e26a09bd4f2', '[\"*\"]', '2025-07-01 18:53:05', NULL, '2025-07-01 18:34:30', '2025-07-01 18:53:05'),
(107, 'App\\Models\\Utilisateur', 41, 'ecoride-token', '25c441e5a1d17dbdb0388affb91d75b3f69cee4b6225699637cd748616bbed47', '[\"*\"]', '2025-07-01 18:55:02', NULL, '2025-07-01 18:55:00', '2025-07-01 18:55:02'),
(108, 'App\\Models\\Utilisateur', 41, 'ecoride-token', '10cb66ac2ed256f790a5bfe01c0e024419031f56927adaee3f857bf30fb1f2cc', '[\"*\"]', '2025-07-01 20:03:59', NULL, '2025-07-01 18:56:38', '2025-07-01 20:03:59'),
(109, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'c03c5e087ba3d75626c2b1d5e6aecd9f21162f02f0cce3e5b92aa3e50b89f045', '[\"*\"]', '2025-07-01 20:04:10', NULL, '2025-07-01 20:04:08', '2025-07-01 20:04:10'),
(110, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'ac9bba16245b8eac7a6523d19db1de291248236c0b443fc88489daf6c3fab5df', '[\"*\"]', '2025-07-02 18:51:45', NULL, '2025-07-01 20:04:22', '2025-07-02 18:51:45'),
(111, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '367b144c92711d1e51b8236fd22ec8d0a6794031443c88dc7bf21fb6a0e961e7', '[\"*\"]', '2025-07-02 18:52:39', NULL, '2025-07-02 18:51:52', '2025-07-02 18:52:39'),
(112, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'be2999488a98873db72b708c7a61142dd65a824e20b54079e4579729a45d8ea6', '[\"*\"]', '2025-07-02 18:52:52', NULL, '2025-07-02 18:52:46', '2025-07-02 18:52:52'),
(113, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'c459094e274f658d5936a75f7838beeb32948d22b13633013bbc561ec6a1588d', '[\"*\"]', '2025-07-02 18:54:03', NULL, '2025-07-02 18:53:17', '2025-07-02 18:54:03'),
(114, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'a7926e0137ceda273b3590fe3a199eec2cbe9792eeeed49cb91fc86313a651fb', '[\"*\"]', '2025-07-02 18:54:14', NULL, '2025-07-02 18:54:09', '2025-07-02 18:54:14'),
(115, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '8efae716396d119a2dcd5fc605aa7da0e3dc91b0506eb21b1bdc5411ce0a8081', '[\"*\"]', '2025-07-02 18:55:44', NULL, '2025-07-02 18:54:37', '2025-07-02 18:55:44'),
(116, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '7a526ef3efaae64cd67d1d34d3771ddad6daf7ba1a9902e899b817daf7017b53', '[\"*\"]', NULL, NULL, '2025-07-02 18:56:01', '2025-07-02 18:56:01'),
(117, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '476049c8938d56befbe1ef1d15c782688bd0b3b857a56dc100c1040b952d3d35', '[\"*\"]', '2025-07-03 07:46:33', NULL, '2025-07-02 18:56:02', '2025-07-03 07:46:33'),
(118, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'c12d8afdc42898d16e5f077e0f9ed4124f96d6e138c79e3d83f9f00f464095c9', '[\"*\"]', '2025-07-03 10:06:13', NULL, '2025-07-03 07:47:44', '2025-07-03 10:06:13'),
(119, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'c736fd37eba9c3a6c662c46539e3aefef3547ec12ab53a440b28e5cac4ce3772', '[\"*\"]', '2025-07-03 10:07:30', NULL, '2025-07-03 10:06:22', '2025-07-03 10:07:30'),
(120, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '34860bb008398992195d901ea3e42071138781b6e5c14970637cf2c708c20427', '[\"*\"]', '2025-07-03 18:10:22', NULL, '2025-07-03 10:07:39', '2025-07-03 18:10:22'),
(121, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '333b090c061d467daf8f2c6fdf44ee404feef2cb45a0c3544a6fddf6b1dd5910', '[\"*\"]', '2025-07-03 18:18:32', NULL, '2025-07-03 18:14:16', '2025-07-03 18:18:32'),
(122, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '40e6513e1c9ad197a5491a58c24cc9430cf19d63a9a4f611be885905fbde0477', '[\"*\"]', '2025-07-04 07:35:18', NULL, '2025-07-03 18:18:46', '2025-07-04 07:35:18'),
(123, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '423933395e4338b2e5ad7703b6cee48958126d4b1614dfe3a2c963c4c09a55e1', '[\"*\"]', '2025-07-04 07:35:30', NULL, '2025-07-04 07:35:25', '2025-07-04 07:35:30'),
(124, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'e809a141cb5150c1d41099cb205b41e65dd6669efbe58e99720d6abbfbd2dd93', '[\"*\"]', '2025-07-04 10:01:53', NULL, '2025-07-04 08:07:38', '2025-07-04 10:01:53'),
(125, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '791ce6345903cfe58f9f28e2718e6885fbab974807cdb029db6d3b49cf081a45', '[\"*\"]', '2025-07-04 15:03:28', NULL, '2025-07-04 10:02:04', '2025-07-04 15:03:28'),
(126, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '88058f06e12a4a4a9590a3013728f445b7c071fd90297816966def0ca733c543', '[\"*\"]', '2025-07-04 15:07:41', NULL, '2025-07-04 15:03:35', '2025-07-04 15:07:41'),
(127, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'abca680bfae2f439cb5650a1200577780c104947caa4e716e13f933fbcb22b46', '[\"*\"]', '2025-07-05 10:19:50', NULL, '2025-07-04 15:07:57', '2025-07-05 10:19:50'),
(128, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '68f48d782958ba4c2376126388319b6fe187c6e0ecb69481b654b9a4f1ab6a65', '[\"*\"]', '2025-07-05 10:21:03', NULL, '2025-07-05 10:19:58', '2025-07-05 10:21:03'),
(129, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'ef77c591756e5eb4e70c2ff2e286d3037226be3ad1d266f3990d163d2b32707c', '[\"*\"]', '2025-07-05 12:02:06', NULL, '2025-07-05 11:00:48', '2025-07-05 12:02:06'),
(130, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '5e34fa0c4b838f4b15a1e0d0958ab19748226a1d4dd2ae462b64e26b9152ba7e', '[\"*\"]', '2025-07-05 12:12:29', NULL, '2025-07-05 12:02:13', '2025-07-05 12:12:29'),
(131, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '36d3ef3807e841ed6281a980dad1f59a7f32dc9b12947500a1ab0544874af897', '[\"*\"]', '2025-07-05 15:05:10', NULL, '2025-07-05 14:47:19', '2025-07-05 15:05:10'),
(132, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'ff7d1537645aef726db6461599ec9e9696cddf7fde06d719261307558d868620', '[\"*\"]', '2025-07-05 15:05:20', NULL, '2025-07-05 15:05:14', '2025-07-05 15:05:20'),
(133, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '7cad12fe58dae13371c9995e0d1597f086f548b13060cb0b6d6bb5b5c22b1de2', '[\"*\"]', '2025-07-05 15:07:42', NULL, '2025-07-05 15:07:35', '2025-07-05 15:07:42'),
(134, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '28c2827f8a47f665c95944c9a931936468fe45e953977c086cd3e0ac8077c467', '[\"*\"]', '2025-07-05 19:30:35', NULL, '2025-07-05 15:24:46', '2025-07-05 19:30:35'),
(135, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '3551f5c0b07a849534081e88fd175c45cd0418b9bc9fd064852cfd3782d22c7e', '[\"*\"]', '2025-07-05 19:30:46', NULL, '2025-07-05 19:30:39', '2025-07-05 19:30:46'),
(136, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '7753cfc9861859532b297baeb6bf2f1ad7cd8babd38b95516e93ad1938061d57', '[\"*\"]', '2025-07-06 06:39:18', NULL, '2025-07-05 19:31:39', '2025-07-06 06:39:18'),
(137, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'd3fa70ebb74760b0623465a5aa84d82f08791a2d7c622ee7647e62679c8482a7', '[\"*\"]', '2025-07-06 06:42:52', NULL, '2025-07-06 06:39:35', '2025-07-06 06:42:52'),
(138, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '714316aa3c0238b0f2c353f7d1b6cc72c3971e4d1d1846461c0785ba92ac12af', '[\"*\"]', '2025-07-06 06:57:46', NULL, '2025-07-06 06:57:41', '2025-07-06 06:57:46'),
(139, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '75556cd90278e22d2232b6cd638664134fd2f40099deed8b11f705d76411218b', '[\"*\"]', NULL, NULL, '2025-07-06 07:01:00', '2025-07-06 07:01:00'),
(140, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '6d3ec212d8444e50b29fe7174c421a77dbaf0a72d901c7ac70c38edb5ff912fc', '[\"*\"]', '2025-07-06 07:05:54', NULL, '2025-07-06 07:02:43', '2025-07-06 07:05:54'),
(141, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '7bb79ed7ac1dd134f91ee227b3f938620d0c317cd7cf51f0753f846596a45947', '[\"*\"]', '2025-07-06 07:06:17', NULL, '2025-07-06 07:05:59', '2025-07-06 07:06:17'),
(142, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '564a568dcd5d72abc7c864fd8fb4cc351aa5c68badbf3dfa8858d8a9591c4ed7', '[\"*\"]', '2025-07-06 07:38:20', NULL, '2025-07-06 07:30:18', '2025-07-06 07:38:20'),
(143, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'a1ef413852e90172c7ed3334a0de83a3ffc81c17d0816fb9f8c26f43604cad50', '[\"*\"]', NULL, NULL, '2025-07-06 07:41:51', '2025-07-06 07:41:51'),
(144, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '01d096174fc538541544a43b70cd96f3a3886e4764d8b36298be38a959b3d26a', '[\"*\"]', NULL, NULL, '2025-07-06 07:42:03', '2025-07-06 07:42:03'),
(145, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'ab214c70ee9fa0acea86040cf254a019d397d46357e6245d88396e638171d050', '[\"*\"]', NULL, NULL, '2025-07-06 07:42:19', '2025-07-06 07:42:19'),
(146, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'd48fe5db939d76bb2e9169b4c7932af2b52b71598e9f7c14bc70b70dea8cab24', '[\"*\"]', NULL, NULL, '2025-07-06 07:44:01', '2025-07-06 07:44:01'),
(147, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '21a0837259f99beaaf8f01917c83d10bd15fa66345bf4a47b626eeaadc34056e', '[\"*\"]', '2025-07-06 07:44:49', NULL, '2025-07-06 07:44:47', '2025-07-06 07:44:49'),
(148, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '25b39b864d18ec9ea9c12b035fbb90592cdd536e7166a9af64fc59c32358405d', '[\"*\"]', NULL, NULL, '2025-07-06 07:46:52', '2025-07-06 07:46:52'),
(149, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '30a2fc1d92f0aedb9fcfbcb1389a1807ff1ec1290cb64890261e4fe7098bccbe', '[\"*\"]', '2025-07-06 07:50:30', NULL, '2025-07-06 07:47:06', '2025-07-06 07:50:30'),
(150, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'a49732123ffd5743b0ec526dece81dcc10b39f520c68799d4062e471f361d381', '[\"*\"]', '2025-07-06 07:50:53', NULL, '2025-07-06 07:50:36', '2025-07-06 07:50:53'),
(151, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f5b50cc5bb67d6a50972839fd318bf0c2d737088f5e4e3bf99152df15a2c1a60', '[\"*\"]', '2025-07-06 07:51:27', NULL, '2025-07-06 07:51:17', '2025-07-06 07:51:27'),
(152, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '871478ba51192e7fee6d34381c7026cc365e8c7317a8f51982b207efc0c0ea23', '[\"*\"]', '2025-07-06 07:54:08', NULL, '2025-07-06 07:53:03', '2025-07-06 07:54:08'),
(153, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'd0c1e1f8838a63f6c5bf60f9d4ab5b7ab82d272f421baac66e0e90114a261960', '[\"*\"]', '2025-07-06 10:55:34', NULL, '2025-07-06 07:54:17', '2025-07-06 10:55:34'),
(154, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '21656aba753d74c18dc689f3a24c655e3eedc91cf6de2c4184f77a0e6b6bb00f', '[\"*\"]', '2025-07-06 11:00:31', NULL, '2025-07-06 10:56:07', '2025-07-06 11:00:31'),
(155, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '433a5d4307c461028cdcd8a19abbe542cea555da55614147c396989759d96929', '[\"*\"]', '2025-07-06 11:08:46', NULL, '2025-07-06 11:00:37', '2025-07-06 11:08:46'),
(156, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '4f947f98b147222fa7722b4d70df45744b0244cb5dd39fdb5c43ee4904b71cf0', '[\"*\"]', '2025-07-06 11:21:29', NULL, '2025-07-06 11:08:53', '2025-07-06 11:21:29'),
(157, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0bf291806ca771dd9d6f6fba6dbbf0d1992ad7e74be85be9337b2f38eacb6856', '[\"*\"]', '2025-07-06 11:26:02', NULL, '2025-07-06 11:23:03', '2025-07-06 11:26:02'),
(158, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '40b956290139692bbe34ee354669f5fd9dfc33ea2a19812933ea86a8dd91a0f8', '[\"*\"]', '2025-07-06 11:56:37', NULL, '2025-07-06 11:56:34', '2025-07-06 11:56:37'),
(159, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '01856acde4ce3a3a31fe7a135dbbbc83962599a839696f00122e4eca5823dca9', '[\"*\"]', '2025-07-06 12:16:52', NULL, '2025-07-06 12:12:19', '2025-07-06 12:16:52'),
(160, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '838bf41583243f15bbbac3d8a846612fe3f3b42ce71407c7f2691a84b5d46646', '[\"*\"]', '2025-07-06 13:09:27', NULL, '2025-07-06 13:09:22', '2025-07-06 13:09:27'),
(161, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'c099301b0d71b24ba87191e0e250c9cb1d0714366c8165a1c3f8119fa53e4cd4', '[\"*\"]', '2025-07-06 13:18:23', NULL, '2025-07-06 13:13:33', '2025-07-06 13:18:23'),
(162, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '014711e37e3f2ca51b95e03d2be3699d114d08ce7c023cafc8dad1085503a348', '[\"*\"]', '2025-07-06 13:19:02', NULL, '2025-07-06 13:18:58', '2025-07-06 13:19:02'),
(163, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'c57b0b02c54d7f7de7868e1e36c21cdf9e6086262af036a0eeac1ccd80bb951f', '[\"*\"]', '2025-07-06 15:14:20', NULL, '2025-07-06 13:19:17', '2025-07-06 15:14:20'),
(164, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '5b4e9f78537feef8729c7d4f1c3eca5c63bc06a6a03337ef974f01c607dd344b', '[\"*\"]', '2025-07-06 15:20:30', NULL, '2025-07-06 15:14:28', '2025-07-06 15:20:30'),
(165, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'd0989e937a2902230ff69ebf2afbbc59db14356a5036ca70d6e389f4a331adfa', '[\"*\"]', '2025-07-06 15:21:09', NULL, '2025-07-06 15:21:07', '2025-07-06 15:21:09'),
(166, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'a2a354b6976f20507e77fef681a6967a1145041f2fbbb5e4794bfb1720c25fd6', '[\"*\"]', '2025-07-06 16:48:01', NULL, '2025-07-06 15:21:14', '2025-07-06 16:48:01'),
(167, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'da715ea30e23308a2eca66e2e5418a7b1272cffcb82b02eb8285d52fe6c0b220', '[\"*\"]', '2025-07-06 16:48:58', NULL, '2025-07-06 16:48:10', '2025-07-06 16:48:58'),
(168, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '46519041040eb1bcba9e4140821f3386786ef93eedcedba1ed34517773f5bfab', '[\"*\"]', '2025-07-06 16:49:51', NULL, '2025-07-06 16:49:08', '2025-07-06 16:49:51'),
(169, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'bb3e8c144bc59e0e98cc55cda31e6562ca59faea9d319508df804c227b4fdfc0', '[\"*\"]', '2025-07-06 16:51:06', NULL, '2025-07-06 16:51:00', '2025-07-06 16:51:06'),
(170, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'f15f2d2b202e206389f31a06ebddf7a13bb259455881e06b8ded909c10d87934', '[\"*\"]', '2025-07-06 17:01:38', NULL, '2025-07-06 16:54:56', '2025-07-06 17:01:38'),
(171, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'b404efb1e527f92a1014177ed5a8a2fab2679309dfecc47270b4f33b72f58959', '[\"*\"]', '2025-07-06 18:36:24', NULL, '2025-07-06 17:01:47', '2025-07-06 18:36:24'),
(172, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '37c89056e9659a51def2656cb08049f81a297d04dffee7a31a9c1c825ff05a66', '[\"*\"]', '2025-07-06 18:36:41', NULL, '2025-07-06 18:36:38', '2025-07-06 18:36:41'),
(173, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0442137a1187b17d6306e11adb4b9a41b9c0cbb584ce6740d75a816699090776', '[\"*\"]', '2025-07-06 18:36:55', NULL, '2025-07-06 18:36:48', '2025-07-06 18:36:55'),
(174, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '4cacff727e3db8f179f19625d49fa38d89dfa1d92d885b15c0fe1e1a8806ce23', '[\"*\"]', '2025-07-07 07:05:11', NULL, '2025-07-06 18:37:17', '2025-07-07 07:05:11'),
(175, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '151e17df17386286ba2a60373c76d62b7a8f9ac2dd686250b5bd8be3c3455d27', '[\"*\"]', '2025-07-07 07:07:29', NULL, '2025-07-07 07:05:50', '2025-07-07 07:07:29'),
(176, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'bddca48862673b2bead3a89bc213a708191525aa659c72e19730fcd0eafce644', '[\"*\"]', '2025-07-07 07:08:57', NULL, '2025-07-07 07:07:35', '2025-07-07 07:08:57'),
(177, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '98f587a4209641573691a3a7096c5bafe16b8f3afc88ec8b548cd012d3d319dc', '[\"*\"]', '2025-07-07 07:09:31', NULL, '2025-07-07 07:09:02', '2025-07-07 07:09:31'),
(178, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '89f9b4ee47457a6338f986c90999a6dc8fba719086a9e9e6230bf59a8f4e9d12', '[\"*\"]', '2025-07-07 07:18:01', NULL, '2025-07-07 07:09:35', '2025-07-07 07:18:01'),
(179, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '6b05a8e62debebc2bb0ebcde5d41aa516c4c4493e1e9726debd701df236b54d1', '[\"*\"]', '2025-07-07 07:31:49', NULL, '2025-07-07 07:19:54', '2025-07-07 07:31:49'),
(180, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '8d8861cb14cb8c8e1196bb8ef33637924516b49c438eca19ce57c6e08aa53255', '[\"*\"]', '2025-07-07 07:39:01', NULL, '2025-07-07 07:38:38', '2025-07-07 07:39:01'),
(181, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '5a1bbc829f2bd790884d528dca55cc97b035e341677956c0d3b361a5fb64d89e', '[\"*\"]', '2025-07-07 08:38:47', NULL, '2025-07-07 08:17:17', '2025-07-07 08:38:47'),
(182, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'e2cb39defad9be3a91d6a97a5143d0a98cf193ed310eac12171e5008f959d485', '[\"*\"]', '2025-07-07 08:44:01', NULL, '2025-07-07 08:38:53', '2025-07-07 08:44:01'),
(183, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '71f250d3b5af624fa38886126dfc158a4059c356a8b7a89502b38e4507eba84f', '[\"*\"]', '2025-07-07 15:18:29', NULL, '2025-07-07 08:47:26', '2025-07-07 15:18:29'),
(184, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '60329f7d253c751afb7f7980f36b9d4e753bf416d42048ec1b26cb12cf83d9a1', '[\"*\"]', '2025-07-07 15:48:39', NULL, '2025-07-07 15:18:59', '2025-07-07 15:48:39'),
(185, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'efe1f1d0c748e96aafe19b6b4e4077d43cea3e7feda745e203b6c57352395713', '[\"*\"]', '2025-07-07 15:51:50', NULL, '2025-07-07 15:48:50', '2025-07-07 15:51:50'),
(186, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '49fa8017fc791c91856225b10ea43e0b73080ebf997ace7a40fd7aebfac7c8b6', '[\"*\"]', '2025-07-07 17:32:47', NULL, '2025-07-07 15:52:05', '2025-07-07 17:32:47'),
(187, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'c1d6808f9f1a9e74852585153980cb23ec470391a9dfc9b91080a7539fcd3227', '[\"*\"]', '2025-07-07 18:09:17', NULL, '2025-07-07 17:33:30', '2025-07-07 18:09:17'),
(188, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'b6bf21f075517227dcbe3af935b7de4ee1af15861b14f8480057499ad632e4d4', '[\"*\"]', '2025-07-07 18:38:39', NULL, '2025-07-07 18:13:03', '2025-07-07 18:38:39'),
(189, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '26dae38a5d9bed218a1ad6175daeda880597459a6c596f98954db7b94c15bfe8', '[\"*\"]', '2025-07-07 18:39:38', NULL, '2025-07-07 18:39:02', '2025-07-07 18:39:38'),
(190, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1f7f0179da23a36b456090c8bda61928b96125dbb9ae6d27e665e2b56bb4327f', '[\"*\"]', '2025-07-07 18:39:52', NULL, '2025-07-07 18:39:48', '2025-07-07 18:39:52'),
(191, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'a4a0f1d7848fa453485362f720cec73939e600733c0e673dd260dc9103efe97d', '[\"*\"]', '2025-07-07 18:43:41', NULL, '2025-07-07 18:40:09', '2025-07-07 18:43:41'),
(192, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '2c56aeac53716d5c46b1b465183026201623f05fc62c37fba4c7bd97c4e9da4c', '[\"*\"]', '2025-07-07 19:07:08', NULL, '2025-07-07 18:44:14', '2025-07-07 19:07:08'),
(193, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '037bde7dd0ee7cd23db72eb9187e2371d421a3372c39dcb9d856e9b58df2b62b', '[\"*\"]', '2025-07-07 19:16:24', NULL, '2025-07-07 19:07:31', '2025-07-07 19:16:24'),
(194, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'cde8c1763d69c11855b74d87094ef3da1092c8b4efe68dc3bff9277ffabb22e2', '[\"*\"]', NULL, NULL, '2025-07-07 19:16:29', '2025-07-07 19:16:29'),
(195, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'cdc79ee5d327bb2ababf79b5c428efbb897293d1cf945eab304d74359c15891c', '[\"*\"]', '2025-07-08 05:20:15', NULL, '2025-07-07 19:16:29', '2025-07-08 05:20:15'),
(196, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1da9738fa36eec3f55c6598a7ded259e68935d4d743471e6f19a637a321abec2', '[\"*\"]', '2025-07-08 07:25:58', NULL, '2025-07-08 05:20:24', '2025-07-08 07:25:58'),
(197, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'c042e2461b426529bbf088013d089a0cdae3f0d379f40799ef09a6aa203e44b9', '[\"*\"]', '2025-07-08 08:04:54', NULL, '2025-07-08 08:04:51', '2025-07-08 08:04:54'),
(198, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '2a70bfba4f2db8308e0ee5a43b9ee4a232b3bfd36165c8aff2ed0164610cf620', '[\"*\"]', '2025-07-08 13:17:34', NULL, '2025-07-08 08:05:00', '2025-07-08 13:17:34'),
(199, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '08759cb1713341110ab9291c96060adb332fa3346e1af21da8612aa27d31fbf6', '[\"*\"]', '2025-07-08 14:18:50', NULL, '2025-07-08 13:17:53', '2025-07-08 14:18:50'),
(200, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f1dd6daa357100dbb7d889b00a6401556c3ab00facdc4cd3c1884efdca8ed356', '[\"*\"]', '2025-07-08 14:36:36', NULL, '2025-07-08 14:18:57', '2025-07-08 14:36:36'),
(201, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'd93478074dc85edad5f037d08feeb31f620d754acdc151cd9faaa09c729f632f', '[\"*\"]', '2025-07-08 15:00:59', NULL, '2025-07-08 14:37:04', '2025-07-08 15:00:59'),
(202, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'f99c3f6f4758b1dd38329153e5c9637baf1866dee01e3ce9f5c3e5c01316d4db', '[\"*\"]', '2025-07-08 15:02:44', NULL, '2025-07-08 15:01:06', '2025-07-08 15:02:44'),
(203, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '0687d436e8e446ea3c20f9e3f359f5c0d7bb8a4aeebda7fcd38cd0ff7f3f6f41', '[\"*\"]', '2025-07-08 15:06:21', NULL, '2025-07-08 15:02:51', '2025-07-08 15:06:21'),
(204, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '70a4b88db921d43f8d41a56bbc202c410931bcd5a5753afd9fc8f68a26d85229', '[\"*\"]', '2025-07-08 15:56:07', NULL, '2025-07-08 15:06:29', '2025-07-08 15:56:07'),
(205, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '66c4952a42644defee40b79d124506d2826eaebc6e8d5dc63f8da95fb6a401eb', '[\"*\"]', '2025-07-08 15:59:20', NULL, '2025-07-08 15:56:20', '2025-07-08 15:59:20'),
(206, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '5065f51fff8ce0593fd3566b3237f523dbbc3fc1e850c00f9765c483fadd443a', '[\"*\"]', '2025-07-08 16:03:04', NULL, '2025-07-08 15:59:43', '2025-07-08 16:03:04'),
(207, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'a56fb49deda4fe0f1992dfdb490b3d039beba2a9bc5f77877f7f583acf94a8a0', '[\"*\"]', '2025-07-08 18:23:59', NULL, '2025-07-08 16:12:46', '2025-07-08 18:23:59'),
(208, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '4c927c6e2f5dbe4d2c21ef46463b728dfd3e06d85b6e22d64e2cdc22273bf816', '[\"*\"]', '2025-07-08 20:09:00', NULL, '2025-07-08 18:29:44', '2025-07-08 20:09:00'),
(209, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '2c3ecb5d069bccaffaae26b5314ebd0d2b7daa0c6446034b85c35cb0737e0fa7', '[\"*\"]', '2025-07-08 20:29:16', NULL, '2025-07-08 20:09:07', '2025-07-08 20:29:16'),
(210, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '851edf40c1a8422167d47d75690cc5b62541b83a40144358272ff2468efce8b6', '[\"*\"]', '2025-07-08 20:29:31', NULL, '2025-07-08 20:29:26', '2025-07-08 20:29:31'),
(211, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '113f4735d1dc70b4a9360d48204aa49317eb97cd0946ff71944f49cfa6da16c5', '[\"*\"]', '2025-07-09 06:31:04', NULL, '2025-07-08 20:29:38', '2025-07-09 06:31:04'),
(212, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'e8e0c92228ade74a14465ff8b597edd739e0f7669480ab4498753630a1fbd823', '[\"*\"]', '2025-07-09 07:14:24', NULL, '2025-07-09 06:31:47', '2025-07-09 07:14:24'),
(213, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '32bcb657536eab581859b94ad650e3227dad3f50609c0af2e72e1ad68069d8c4', '[\"*\"]', '2025-07-09 09:03:34', NULL, '2025-07-09 07:14:32', '2025-07-09 09:03:34'),
(214, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '57b301e96426067686b121169931b17e75077de8a76198bf55c67902cafd5d1d', '[\"*\"]', '2025-07-09 09:41:05', NULL, '2025-07-09 09:04:41', '2025-07-09 09:41:05'),
(215, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '32bdf3c7ffa9803a0756dfd8730a4973289b599580ffb1ee3ece2c266252925b', '[\"*\"]', '2025-07-09 09:50:50', NULL, '2025-07-09 09:41:10', '2025-07-09 09:50:50'),
(216, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'be229bc302c67d904b76e88e7842b010253f8575981d320f186aaa542504f032', '[\"*\"]', '2025-07-09 10:43:50', NULL, '2025-07-09 09:51:04', '2025-07-09 10:43:50'),
(217, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'cec4bd9dfc160f2f6b96422e6ed5965d0bcecfa574313c5f2bf2f523fac4234f', '[\"*\"]', '2025-07-09 11:40:58', NULL, '2025-07-09 10:43:58', '2025-07-09 11:40:58'),
(218, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1fa7ad5c34ac420bade5cd34f4e9d3695c1e9646a71925f91de76bac701d119a', '[\"*\"]', '2025-07-09 13:13:41', NULL, '2025-07-09 11:41:06', '2025-07-09 13:13:41'),
(219, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'fd3026c57aeffb79bd87ac98f8a37c555dbb3da9097169c269d9d366640b3f01', '[\"*\"]', '2025-07-09 13:15:07', NULL, '2025-07-09 13:14:44', '2025-07-09 13:15:07'),
(220, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '4fbc587c2233e7d29e9495384b2f2633b8c9b0710fc71bf241f9d7865fbba4cb', '[\"*\"]', '2025-07-09 13:17:34', NULL, '2025-07-09 13:15:18', '2025-07-09 13:17:34'),
(221, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'a662a4e9a92d8d726a2ae9fee79cd8ad74c88d38e7bf6c6faad18f55394d438d', '[\"*\"]', '2025-07-09 14:16:39', NULL, '2025-07-09 13:18:23', '2025-07-09 14:16:39'),
(222, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '17c2dfa7a84fcadbb75cc605c442e12f67c45f0935a8377e13f50099e0d5881d', '[\"*\"]', '2025-07-09 14:47:02', NULL, '2025-07-09 14:16:49', '2025-07-09 14:47:02'),
(223, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '2bad73976371ef92c484b13146824e0b87d5a1adac8abf49a6985df04c5e5bbe', '[\"*\"]', '2025-07-09 14:47:39', NULL, '2025-07-09 14:47:10', '2025-07-09 14:47:39'),
(224, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'be40fd00b2b3b6e93d1a47c47a9ab9b3ab7843a9281ab20bc4962beb8cfe8e7f', '[\"*\"]', '2025-07-09 14:49:55', NULL, '2025-07-09 14:47:45', '2025-07-09 14:49:55'),
(225, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '695be41cd1e7d9b02186f911e70bbd4252e4778fcce6446211b1b6d93f29d3cb', '[\"*\"]', '2025-07-09 14:51:44', NULL, '2025-07-09 14:50:21', '2025-07-09 14:51:44'),
(226, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'a4c64fa6e2688d3731e6e636f1a2c3030a9160cc79f730fa7c9ab2047e2a9d79', '[\"*\"]', '2025-07-09 14:55:10', NULL, '2025-07-09 14:51:50', '2025-07-09 14:55:10'),
(227, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'de8609b2c1c493b5e1791028291367a6fd821bb59c7189d30efdccdaee690396', '[\"*\"]', '2025-07-09 14:56:30', NULL, '2025-07-09 14:55:22', '2025-07-09 14:56:30'),
(228, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '1e00e7fc5e7b2bc13257f3741c70b6652907397ccf3bf70c88fbc27711b7c67c', '[\"*\"]', '2025-07-09 14:57:20', NULL, '2025-07-09 14:56:38', '2025-07-09 14:57:20'),
(229, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '0e5af833e5ac08591b4d23b413e71832414fbaa9ca736b936d961f6b38ac7a99', '[\"*\"]', '2025-07-09 16:57:34', NULL, '2025-07-09 14:57:32', '2025-07-09 16:57:34'),
(230, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'e8d358765ad9f05dc7e2a6739341872c3db6e74de30b16d2b487838e8495c4eb', '[\"*\"]', NULL, NULL, '2025-07-09 17:40:06', '2025-07-09 17:40:06'),
(231, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'eda8f552381e9c0cc1dc6a6085493f8f6a2dcd9cc3bf37c6be8f976431bbc75c', '[\"*\"]', '2025-07-09 17:43:09', NULL, '2025-07-09 17:40:07', '2025-07-09 17:43:09'),
(232, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'efbf1d363949dcb567703f29a914b05c165f76af762b6b91804fbc6527e2563c', '[\"*\"]', '2025-07-09 18:21:39', NULL, '2025-07-09 17:43:16', '2025-07-09 18:21:39'),
(233, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '07f5a9090e39f17242fce37002fdcaf6478d59ac5783e31983d7c6050c9ed082', '[\"*\"]', '2025-07-10 05:45:05', NULL, '2025-07-09 18:21:51', '2025-07-10 05:45:05'),
(234, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '8a707f4562b23cabcd8ed9b7f949bb64a8f5a92f49dc8d75c1e7f08dec38356a', '[\"*\"]', '2025-07-10 05:54:05', NULL, '2025-07-10 05:50:34', '2025-07-10 05:54:05'),
(235, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '141b7d9ef105621034903d74b0874b3ebe758c89613d932ca12db7e6f2468670', '[\"*\"]', '2025-07-10 06:24:19', NULL, '2025-07-10 05:55:12', '2025-07-10 06:24:19'),
(236, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '50fbab5381cd5fef269164fd303fbce350a6e81f516e5fe20ad715df069dbcf0', '[\"*\"]', '2025-07-10 09:52:56', NULL, '2025-07-10 06:27:28', '2025-07-10 09:52:56'),
(237, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '6513b339f4eeba9dd7a2006a39410871ce11834133001773be3fc00992e4ee41', '[\"*\"]', '2025-07-10 09:56:13', NULL, '2025-07-10 09:53:31', '2025-07-10 09:56:13'),
(238, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6d5045d7a8098eda5954a3e9b04a5a3131bb19919b176e8ffefa28e9b7632abb', '[\"*\"]', '2025-07-10 13:10:47', NULL, '2025-07-10 09:56:18', '2025-07-10 13:10:47'),
(239, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'ea9218a4ad0936bee27288eb0aa33a017abadd4534e5aaf533b42183c53f7f11', '[\"*\"]', '2025-07-10 13:24:00', NULL, '2025-07-10 13:13:43', '2025-07-10 13:24:00'),
(240, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0596c26b5b9bb0e5fdfc230a1c020c279306f4374b9271034b0ecda5caa06abe', '[\"*\"]', '2025-07-10 13:48:14', NULL, '2025-07-10 13:24:14', '2025-07-10 13:48:14'),
(241, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '6e438a4df2a241620c2a651bf9b30f214a0cf6c67ae4179935159f21588ecc87', '[\"*\"]', '2025-07-10 17:43:06', NULL, '2025-07-10 13:48:42', '2025-07-10 17:43:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(242, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'b225ee5f5fc7dcfe922121efdb5c93943aeae94c1b64055a50b5265ba742d259', '[\"*\"]', '2025-07-10 17:43:32', NULL, '2025-07-10 17:43:18', '2025-07-10 17:43:32'),
(243, 'App\\Models\\Utilisateur', 43, 'ecoride-token', 'fb8842baf64438f171b4a1227c50c0cfae83e3842075f37d314330bddc067f50', '[\"*\"]', '2025-07-10 17:45:46', NULL, '2025-07-10 17:44:57', '2025-07-10 17:45:46'),
(244, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'a737a60f3b3d70336e25a6bcbcded5774b142f33b8586a34e652069ee109666e', '[\"*\"]', '2025-07-10 19:47:31', NULL, '2025-07-10 17:46:01', '2025-07-10 19:47:31'),
(245, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'b66af8c2e757514742c61b2ecf17cd563316ad9cacde50783670076a0fc25192', '[\"*\"]', '2025-07-10 19:49:41', NULL, '2025-07-10 19:47:46', '2025-07-10 19:49:41'),
(246, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '6ebbf92c88e900c7bb248c072c71fa8844a2cd8d0685b3de65ecad36f47d7f94', '[\"*\"]', '2025-07-10 20:42:14', NULL, '2025-07-10 19:49:47', '2025-07-10 20:42:14'),
(247, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'a5d7ea342e7abccfa3114863c00ccfc826112f2406f8df29cbbc96ca88866af4', '[\"*\"]', '2025-07-11 06:10:05', NULL, '2025-07-10 20:42:25', '2025-07-11 06:10:05'),
(248, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6ae95a63f51991d027204bbc9699b3db01dcbe5ef8f064b2f2d9f431bd27c7e2', '[\"*\"]', '2025-07-11 06:10:26', NULL, '2025-07-11 06:10:21', '2025-07-11 06:10:26'),
(249, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '2a9dcb0cc8f2ed17a85f055c8860eb072507b11fbb6a4e8ca3f1bcbbbe213249', '[\"*\"]', '2025-07-11 06:12:23', NULL, '2025-07-11 06:10:36', '2025-07-11 06:12:23'),
(250, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '276837c36800b1ea0f244e0ae9774f4e031272d39e650e994a171a9be63b60bc', '[\"*\"]', '2025-07-11 06:13:50', NULL, '2025-07-11 06:12:31', '2025-07-11 06:13:50'),
(251, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '6128c107b04f4a73fcf37daafeefacca88f85f5df941b151e79204a03b4dd191', '[\"*\"]', '2025-07-11 06:18:20', NULL, '2025-07-11 06:14:04', '2025-07-11 06:18:20'),
(252, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'af9f81da6afab5f214d8f50003ef1f25670658adee9e074c31cd17053c8f2df8', '[\"*\"]', '2025-07-11 06:18:54', NULL, '2025-07-11 06:18:49', '2025-07-11 06:18:54'),
(253, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '043102aa02549b676dcfca727a0ef0f2459ec32f0652c39c7e210f8b03dfb23a', '[\"*\"]', '2025-07-11 06:19:19', NULL, '2025-07-11 06:19:00', '2025-07-11 06:19:19'),
(254, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '178e5162c2b3d0ef1793082a39af865cca42637416f6fff939c86d250665b1e7', '[\"*\"]', '2025-07-11 06:19:30', NULL, '2025-07-11 06:19:25', '2025-07-11 06:19:30'),
(255, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'f92ccc106a711a1d156f7e0158500b7543a8785c09ed40bd3301d76e52e026af', '[\"*\"]', '2025-07-11 06:19:56', NULL, '2025-07-11 06:19:51', '2025-07-11 06:19:56'),
(256, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '81398c70b5dba038aa1a82acd0607d399b8dc5dd99a3ed90d10b9bf016d97800', '[\"*\"]', '2025-07-11 10:18:05', NULL, '2025-07-11 06:20:09', '2025-07-11 10:18:05'),
(257, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '386c5dd2259337e9021c2c9ec96c1d33522057a748e54e3d1e94db7a3f12b17e', '[\"*\"]', '2025-07-11 12:56:49', NULL, '2025-07-11 10:18:19', '2025-07-11 12:56:49'),
(258, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6058f758b835a96ccd45ecfc63cdf13a9213ddf41d94484971e7163202e05d91', '[\"*\"]', '2025-07-11 12:58:39', NULL, '2025-07-11 12:56:57', '2025-07-11 12:58:39'),
(259, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'e78012110d2ee904f43c0c6e8a4a1a74c91e2f8d9947b31587f4cfc3162d0b66', '[\"*\"]', '2025-07-11 13:01:28', NULL, '2025-07-11 12:58:45', '2025-07-11 13:01:28'),
(260, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'db8ceaf1e6e6e3e970cdb24ecfb27c9c8209d34325510953d24e43cc56abb346', '[\"*\"]', '2025-07-11 17:38:03', NULL, '2025-07-11 13:01:33', '2025-07-11 17:38:03'),
(261, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '5c87a59b180df2c180df26cbc38909a21af7ca70eb6b4d20e38fd085d32533ec', '[\"*\"]', '2025-07-12 08:22:35', NULL, '2025-07-11 17:38:18', '2025-07-12 08:22:35'),
(262, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f3810407cf58dcfb96aa5ada7fb132f0bc57a0b915627b89346e7cb794288720', '[\"*\"]', '2025-07-12 08:41:11', NULL, '2025-07-12 08:22:42', '2025-07-12 08:41:11'),
(263, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'cc2f155dfd55aee759ea058627004c0b561c03a2c6c18faffbf1e7948408116b', '[\"*\"]', '2025-07-12 13:01:37', NULL, '2025-07-12 08:41:35', '2025-07-12 13:01:37'),
(264, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'd64df4cdfe1b1a9f1fe0777506104ee305ee36f32fb4129f9fae8f3eb24b6cab', '[\"*\"]', '2025-07-12 13:01:50', NULL, '2025-07-12 13:01:47', '2025-07-12 13:01:50'),
(265, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '28c69ce8477070890efdc650c3a75cf5244ea6237ff5d5d64c72511aa700b31d', '[\"*\"]', NULL, NULL, '2025-07-12 13:01:57', '2025-07-12 13:01:57'),
(266, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '903bf458130cfc8ddd228fd87e9646cc7200de80279fc7b3b46f8e1e119c101e', '[\"*\"]', '2025-07-12 22:32:24', NULL, '2025-07-12 22:20:28', '2025-07-12 22:32:24'),
(267, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '156fe12792a3961a24194b49ac0e5ecdae6296de647a07eee0b750dc6e47d8c9', '[\"*\"]', '2025-07-12 22:32:53', NULL, '2025-07-12 22:32:31', '2025-07-12 22:32:53'),
(268, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '28502ce3e841455d5249a8a95eca477fe2e153a29e2f709fd9c7547b560e5627', '[\"*\"]', '2025-07-12 22:59:26', NULL, '2025-07-12 22:32:59', '2025-07-12 22:59:26'),
(269, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'b7bdbd781538074e8f089daadc054f952da92317de3e65a8b54d5bb11a9e639c', '[\"*\"]', '2025-07-12 23:01:48', NULL, '2025-07-12 22:59:37', '2025-07-12 23:01:48'),
(270, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'dd759fd6ac6d9cad70e747bc626f7a228ce7ca20be50db8bc820800adcd014cd', '[\"*\"]', '2025-07-12 23:07:05', NULL, '2025-07-12 23:01:57', '2025-07-12 23:07:05'),
(271, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '8a6227086b8781011a894b31a4bf9c80a5cfa79d838f67e3b055f77b4585f382', '[\"*\"]', '2025-07-12 23:54:06', NULL, '2025-07-12 23:53:51', '2025-07-12 23:54:06'),
(272, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '4cbb0505675e2cfc05665930364355b1db9fcdbffea9457124cf7fb09a70636b', '[\"*\"]', '2025-07-13 00:12:45', NULL, '2025-07-12 23:55:03', '2025-07-13 00:12:45'),
(273, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '684cb2b458088aa9b22b8fbfa2f8132190c0076cbd7f92f5ea4c9ad5e99b27ac', '[\"*\"]', '2025-07-13 02:21:31', NULL, '2025-07-13 00:13:03', '2025-07-13 02:21:31'),
(274, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '1aa65656aefadb31e5bb82e679eb22e485d79442412ae77eaf0f5df46f9d06ea', '[\"*\"]', '2025-07-13 14:06:20', NULL, '2025-07-13 02:21:47', '2025-07-13 14:06:20'),
(275, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'da05e36ede89c197b251dab10a998a96f5bca8a5379e157ab4356410744e9bde', '[\"*\"]', '2025-07-14 17:25:29', NULL, '2025-07-13 14:07:24', '2025-07-14 17:25:29'),
(276, 'App\\Models\\Utilisateur', 45, 'ecoride-token', '5d79c9ab2c6a463e45c22cad76bb1429baddf5a6d6e3d70ae1f4b68ecb2987b9', '[\"*\"]', '2025-07-14 17:49:03', NULL, '2025-07-14 17:48:36', '2025-07-14 17:49:03'),
(277, 'App\\Models\\Utilisateur', 45, 'ecoride-token', '7484aacdc82d45f38d365c4371a623a7cedde5891dcdee90161385fd006d7b9c', '[\"*\"]', '2025-07-14 18:14:11', NULL, '2025-07-14 17:49:10', '2025-07-14 18:14:11'),
(278, 'App\\Models\\Utilisateur', 45, 'ecoride-token', '25f0f3e842c8b54e2bf4514755043c3c39f1c1af9518220f80f11ec275c3015d', '[\"*\"]', '2025-07-14 18:14:46', NULL, '2025-07-14 18:14:15', '2025-07-14 18:14:46'),
(279, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'b8f2092697eedf089cf3807b4c6792acc7f433f64091e55b0759ab624b910f80', '[\"*\"]', '2025-07-14 18:15:37', NULL, '2025-07-14 18:14:53', '2025-07-14 18:15:37'),
(280, 'App\\Models\\Employe', 3, 'ecoride-employee-token', 'f65aec01c059e8d819ef8cc40ec35efbb75cc915967b28e9f29194855251d582', '[\"*\"]', '2025-07-14 18:16:13', NULL, '2025-07-14 18:15:59', '2025-07-14 18:16:13'),
(281, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'e4aaf3e7614f8d8fd13a1b9259d44e79fa3076299ae7bb5680fedca714ca0791', '[\"*\"]', '2025-07-14 18:42:18', NULL, '2025-07-14 18:27:10', '2025-07-14 18:42:18'),
(282, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'd3e98d6d2ac37290904c3cdc25dc9bf79afa686e5224e6494e0c7e64c7d7984f', '[\"*\"]', '2025-07-14 19:54:49', NULL, '2025-07-14 19:53:42', '2025-07-14 19:54:49'),
(283, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '43295496291800ff681a5ccf49137405c6935089f212f3fbcbd11d60b481c484', '[\"*\"]', '2025-07-14 19:55:55', NULL, '2025-07-14 19:55:01', '2025-07-14 19:55:55'),
(284, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '50d06dd5ce99364c71916330c90d5a29a991365bdca7ace4f0b4129a9924732a', '[\"*\"]', '2025-07-14 19:56:13', NULL, '2025-07-14 19:56:07', '2025-07-14 19:56:13'),
(285, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '2b54e363364294fd4ed99399e1e014ad255947cbb13e9e101650c48730c05100', '[\"*\"]', '2025-07-14 19:56:51', NULL, '2025-07-14 19:56:45', '2025-07-14 19:56:51'),
(286, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'd0d799f6e6dcb9eaca77f95625253a00e498c1211ddd073b7ec1ceeae7964bb4', '[\"*\"]', '2025-07-14 20:00:06', NULL, '2025-07-14 19:57:06', '2025-07-14 20:00:06'),
(287, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '871575e2b78026d325d57d6691d9f337fa7506262e7a0c6ec8947a1e700a1fd0', '[\"*\"]', '2025-07-14 20:01:30', NULL, '2025-07-14 20:00:21', '2025-07-14 20:01:30'),
(288, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '0848873113b849601250c9b001e546b69aaa8f6a789dc2834b8109cca62e6acf', '[\"*\"]', '2025-07-15 07:09:30', NULL, '2025-07-14 20:01:42', '2025-07-15 07:09:30'),
(289, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '27738d7cbdd72f8f895beab7b73f1509b51fca3de6be1ed268eb33bca1b40e64', '[\"*\"]', '2025-07-15 08:26:53', NULL, '2025-07-15 07:48:32', '2025-07-15 08:26:53'),
(290, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'bcfee7e8702761e3c2051c71f5bd710fd8eebc8524a5c9f12f561a889666237f', '[\"*\"]', '2025-07-15 08:27:30', NULL, '2025-07-15 08:27:09', '2025-07-15 08:27:30'),
(291, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '53a3c58a1ae4d6066abfe0028ad5ddde7b0af1a357b14b4cd079b8cc8f633c08', '[\"*\"]', '2025-07-15 08:30:18', NULL, '2025-07-15 08:29:05', '2025-07-15 08:30:18'),
(292, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '7d741c4a0e46b5f7de37483ce5ed1349188787cff99c292bc5a7551253fd2e73', '[\"*\"]', '2025-07-15 08:59:01', NULL, '2025-07-15 08:30:51', '2025-07-15 08:59:01'),
(293, 'App\\Models\\Utilisateur', 45, 'ecoride-token', 'c357ce940a41196f7c9e087d868ba8a3079a9c9ca81b66927fef872f50041d6f', '[\"*\"]', '2025-07-15 12:36:00', NULL, '2025-07-15 08:59:09', '2025-07-15 12:36:00'),
(294, 'App\\Models\\Utilisateur', 48, 'ecoride-token', 'd269e10a010f6dbc473ebc6fb93a8a1f0088f1cea586494fbb8d8be4980cceda', '[\"*\"]', '2025-07-15 17:57:25', NULL, '2025-07-15 12:56:25', '2025-07-15 17:57:25'),
(295, 'App\\Models\\Utilisateur', 48, 'ecoride-token', '8dc9f69316b9bc712c6f3352703ef11ef0f9e22ff30c3e88497f573bdf0b5def', '[\"*\"]', '2025-07-16 13:45:42', NULL, '2025-07-16 13:45:41', '2025-07-16 13:45:42'),
(296, 'App\\Models\\Utilisateur', 48, 'ecoride-token', '9a579887f5963e974fdc89d3f437f3dff7c155e6a6cace6c89d7d730dff5f81b', '[\"*\"]', '2025-07-16 13:51:04', NULL, '2025-07-16 13:50:57', '2025-07-16 13:51:04'),
(297, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '22482c3a473be366f7e74d600aab5904de293433485f364cee4388f4d5e94f1b', '[\"*\"]', '2025-07-16 14:14:11', NULL, '2025-07-16 13:51:25', '2025-07-16 14:14:11'),
(298, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '91d16a1187b38c0ef586edf04b108307876cf96c8b1f1fde73288bc907191413', '[\"*\"]', '2025-07-16 14:37:59', NULL, '2025-07-16 14:37:54', '2025-07-16 14:37:59'),
(299, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '361dbda50d4c279129c61b96fd9165abc5a3b696666963472c053eece96ae7e6', '[\"*\"]', '2025-07-16 14:38:29', NULL, '2025-07-16 14:38:10', '2025-07-16 14:38:29'),
(300, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '8c42bcfc060f94f6aec6e3870f34bf04a05b48d193d27b197279b044c57ca78d', '[\"*\"]', '2025-07-16 15:01:51', NULL, '2025-07-16 14:58:26', '2025-07-16 15:01:51'),
(301, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '7688b2a108b8f292283177abf14960d24e0aedd4bc6eea4dc36fb07cbd1a4068', '[\"*\"]', '2025-07-16 15:11:48', NULL, '2025-07-16 15:11:05', '2025-07-16 15:11:48'),
(302, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1b62a128428ae4099699e5e9fa196939fb009ab4ac1307952dc47160ed881618', '[\"*\"]', '2025-07-16 20:01:11', NULL, '2025-07-16 20:01:06', '2025-07-16 20:01:11'),
(303, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '010fd1843567845fb79996ad3f5136dafcf2f0376ef62d80fc6056c50ac275e3', '[\"*\"]', '2025-07-16 21:12:11', NULL, '2025-07-16 21:12:05', '2025-07-16 21:12:11'),
(304, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f8088890d12939d673a21dc67236d90cec03c576a4d20b0991414a0dd456ee64', '[\"*\"]', '2025-07-16 21:32:05', NULL, '2025-07-16 21:31:41', '2025-07-16 21:32:05'),
(305, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '9b19f03d99cb8ded4b3a82f17b483ea2ba292f4bdd5ac798f676e873d23d7ada', '[\"*\"]', NULL, NULL, '2025-07-17 07:15:46', '2025-07-17 07:15:46'),
(306, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '9acc3127d8f80e5bebfe20578a1430396c680532add0c7d69214fddd10e05dfb', '[\"*\"]', NULL, NULL, '2025-07-17 07:15:47', '2025-07-17 07:15:47'),
(307, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f77db9df321459582ef022253c954cc2ccc31899290c88bfbecd93f32ce25496', '[\"*\"]', NULL, NULL, '2025-07-17 07:15:55', '2025-07-17 07:15:55'),
(308, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'c0f5ee3ba4bfb12bbaf72a60696fab0f0ee31550cef230b34e0829bf8d781ebe', '[\"*\"]', NULL, NULL, '2025-07-17 07:20:00', '2025-07-17 07:20:00'),
(309, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '976745014959067fef8ef6786d24cfd957fb68d80adf4f6ce939a1741b3625c5', '[\"*\"]', NULL, NULL, '2025-07-17 07:22:27', '2025-07-17 07:22:27'),
(310, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '02512c00af26fb2824f59c84e46cb5a3e237ac9bbfb7dd65cb169cd3cd277d56', '[\"*\"]', '2025-07-17 07:33:40', NULL, '2025-07-17 07:33:21', '2025-07-17 07:33:40'),
(311, 'App\\Models\\Employe', 3, 'ecoride-employee-token', '7ed5b0c3f6af6e6544ebbc6eb79ae8c2b35170d80304213751f77f489857acc2', '[\"*\"]', '2025-07-17 07:35:51', NULL, '2025-07-17 07:35:19', '2025-07-17 07:35:51'),
(312, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '05da1c8be318b471f768d479be375ecd678df6a38b049391cc1b647cc3ce5762', '[\"*\"]', '2025-07-17 11:58:42', NULL, '2025-07-17 09:54:47', '2025-07-17 11:58:42'),
(313, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '1d621ad9c48987446fb2ea81947f3fcdc17bd4044170aa307d59ebbee35dd48f', '[\"*\"]', '2025-07-17 14:18:09', NULL, '2025-07-17 13:17:24', '2025-07-17 14:18:09'),
(314, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6139ad8f00f2974fd87ad290b2ba80105891b41fb3345a2b552b6bdf92e1f5c5', '[\"*\"]', '2025-07-18 07:41:06', NULL, '2025-07-17 14:24:50', '2025-07-18 07:41:06'),
(315, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'a67ea2754c47bc06df61c550c79047f58a527a824da923ad5374242fd8e07d9d', '[\"*\"]', '2025-07-18 07:45:09', NULL, '2025-07-18 07:41:23', '2025-07-18 07:45:09'),
(316, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '6e16357c801e82274c1184f338dc3e6695a6eb5dc62f00bcb4a0e44835023696', '[\"*\"]', '2025-07-18 07:52:43', NULL, '2025-07-18 07:45:29', '2025-07-18 07:52:43'),
(317, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'fc2e4d239523361964460268602a6f272c70105a13cbee2ff02f29752033ccc4', '[\"*\"]', '2025-07-18 09:03:03', NULL, '2025-07-18 07:52:58', '2025-07-18 09:03:03'),
(318, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '4348f75f381f2a2391bb5a5d2c459c3b6a2f622bbd43ec034e1597ca55b86715', '[\"*\"]', '2025-07-18 09:18:39', NULL, '2025-07-18 09:04:42', '2025-07-18 09:18:39'),
(319, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'f0daf0a618f86db64a7a189accf408d7b1cd44c6a19557ec40286080b201475d', '[\"*\"]', '2025-07-18 09:19:54', NULL, '2025-07-18 09:19:07', '2025-07-18 09:19:54'),
(320, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'f14b989f040df0ca70cfed71e491e30442dfdd08c037c6333226f0fe16c46d77', '[\"*\"]', '2025-07-18 10:07:20', NULL, '2025-07-18 09:20:11', '2025-07-18 10:07:20'),
(321, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '1748f855e6e243a2d112855ea9a8ded0bc67514c4b748c8f73d3373314f85a8b', '[\"*\"]', '2025-07-18 14:14:31', NULL, '2025-07-18 13:31:00', '2025-07-18 14:14:31'),
(322, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '69f8711a21e7fa28ad10e09885813ff61a92ff95f0668b1f31045fd2dc8a14fa', '[\"*\"]', '2025-07-18 21:51:36', NULL, '2025-07-18 14:16:10', '2025-07-18 21:51:36'),
(323, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '73bd964153b8c2de72cb751d618c636a3ebb83a073bde061e02ca1fc9d41cf33', '[\"*\"]', '2025-07-18 22:27:33', NULL, '2025-07-18 21:51:49', '2025-07-18 22:27:33'),
(324, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'bed1287f636f202a4d0fd4e627f12174e85c85623fb453ed64a2165dcb028896', '[\"*\"]', '2025-07-19 07:54:12', NULL, '2025-07-18 22:32:40', '2025-07-19 07:54:12'),
(325, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '227d205459b9511624b22db6944ad5835da5c87c2fdab10aa7eec5fb10b7f3b9', '[\"*\"]', '2025-07-19 08:02:45', NULL, '2025-07-19 07:54:48', '2025-07-19 08:02:45'),
(326, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '2035c748bd2808f3528803a11ba2b749d83f5c91aa98005a3c40f4d5f95b6550', '[\"*\"]', '2025-07-19 08:03:15', NULL, '2025-07-19 08:02:52', '2025-07-19 08:03:15'),
(327, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '3f2e95a513a4e4989673f2fb3c6d6c9c7f97ff2c3757f4373f16d0ea68111db9', '[\"*\"]', '2025-07-19 08:04:20', NULL, '2025-07-19 08:03:25', '2025-07-19 08:04:20'),
(328, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '27cbebea57a00b303192eba04d77248576fff1fc9ad5228c02faa917edadbed7', '[\"*\"]', '2025-07-19 14:40:39', NULL, '2025-07-19 08:04:43', '2025-07-19 14:40:39'),
(329, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'e1997b72214cfe15ad422115184a9a4103ee3477fc0e1d1847346d0939e0b9a3', '[\"*\"]', '2025-07-19 14:41:06', NULL, '2025-07-19 14:40:58', '2025-07-19 14:41:06'),
(330, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '8a61d04255a13cb5d68367955d1b8f350c16f907d7f29cc670f6cf30606c2854', '[\"*\"]', '2025-07-19 20:28:33', NULL, '2025-07-19 16:45:12', '2025-07-19 20:28:33'),
(331, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '2773fbce97261af2ff44ac3747d6b258eb30249cb66229f33689869a1aa10bac', '[\"*\"]', '2025-07-19 20:29:07', NULL, '2025-07-19 20:29:01', '2025-07-19 20:29:07'),
(332, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'ec5e118a4cfe2b8603081c9876b262b1f15de098535f91314cf84cdb091800a9', '[\"*\"]', '2025-07-20 07:11:09', NULL, '2025-07-19 20:29:17', '2025-07-20 07:11:09'),
(333, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '99f3fa1135df60d7d100341a21bf312add8d8b42965f6e4d6605560e3db9ce1c', '[\"*\"]', '2025-07-20 07:42:51', NULL, '2025-07-20 07:11:24', '2025-07-20 07:42:51'),
(334, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'e6b052f5347c307254ed7e1e4ed1f926d1d1c831c34e408f1730e1fcc3f6f819', '[\"*\"]', '2025-07-20 08:00:28', NULL, '2025-07-20 07:42:58', '2025-07-20 08:00:28'),
(335, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'b24dd6a4e7364e15fbbdd992def71434d0dcc6c0f2ab6c4fb39bda65b4103fb3', '[\"*\"]', '2025-07-20 08:01:21', NULL, '2025-07-20 08:01:14', '2025-07-20 08:01:21'),
(336, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '64ad3158ca6c47699da3ebc8f21a142734ab842f28704bd67bacd260d7fa0a05', '[\"*\"]', '2025-07-20 15:36:05', NULL, '2025-07-20 14:07:10', '2025-07-20 15:36:05'),
(337, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '2b6e7daba3e82cceca336ddbb9df64b9cbdcce78497d4bfc23912f6173a1d58f', '[\"*\"]', '2025-07-20 20:39:16', NULL, '2025-07-20 15:39:26', '2025-07-20 20:39:16'),
(338, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '9c953bbfb0e9c9ea8f7cde9be66f8ea2bc874efd99e8f594910610afa9d9a8bf', '[\"*\"]', '2025-07-20 20:39:35', NULL, '2025-07-20 20:39:27', '2025-07-20 20:39:35'),
(339, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '57fc72fa199b012965a488ce3d53da1d6b37734b7fd0eac0673be6e95d8b9464', '[\"*\"]', '2025-07-20 20:40:18', NULL, '2025-07-20 20:40:02', '2025-07-20 20:40:18'),
(340, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '78e189fe3a6870e5a4d047f71ad60620b17e1c77b4e88e716ecfcca3ec7da224', '[\"*\"]', '2025-07-21 07:12:24', NULL, '2025-07-21 06:59:06', '2025-07-21 07:12:24'),
(341, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '8364d3cbca9dfb836c96ede418df8b4fb308ed42e4ef0786d5f747d1d5a2de4a', '[\"*\"]', NULL, NULL, '2025-07-21 06:59:08', '2025-07-21 06:59:08'),
(342, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '6b17257271c7304103f4756b74f67da8a833738f88118a3898e279b559616ed4', '[\"*\"]', '2025-07-21 07:56:21', NULL, '2025-07-21 07:12:43', '2025-07-21 07:56:21'),
(343, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '86da8c81c990ed883dd08e07ff4f09ae55cd579363c1235867b95889ba0ce2a8', '[\"*\"]', '2025-07-21 08:08:28', NULL, '2025-07-21 08:06:33', '2025-07-21 08:08:28'),
(344, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '6a6ef5598fe49c9b132761024cceb34303a2159f7edd262bac5da3c1a1ad4e47', '[\"*\"]', '2025-07-21 08:09:19', NULL, '2025-07-21 08:08:39', '2025-07-21 08:09:19'),
(345, 'App\\Models\\Admin', 1, 'ecoride-admin-token', '43f5d004a351f8c8eed1dbd91b171ea9fa4c0d0819375938e2d43d85dbf828d5', '[\"*\"]', '2025-07-21 11:54:37', NULL, '2025-07-21 08:58:10', '2025-07-21 11:54:37'),
(346, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '4a3f7a370429624992810a9a0603ef663a577fdee2bf07251da6b43ee2a80cfd', '[\"*\"]', '2025-07-21 12:03:22', NULL, '2025-07-21 12:03:18', '2025-07-21 12:03:22'),
(347, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '81082d4d446496f668ba54e9863b63ad1bba053206c448cbcdbecb12258447f3', '[\"*\"]', '2025-07-21 13:37:33', NULL, '2025-07-21 13:25:03', '2025-07-21 13:37:33'),
(348, 'App\\Models\\Admin', 1, 'ecoride-admin-token', 'ef6dbea651b4c24360b3b7144dd8752bbbf64c8f1a4f014be33f74da2a56f547', '[\"*\"]', '2025-07-21 15:30:31', NULL, '2025-07-21 15:15:52', '2025-07-21 15:30:31'),
(349, 'App\\Models\\Utilisateur', 35, 'ecoride-token', 'e481da9b4c392bbce7c33dcbeccac1428c06ce8591a5e145c98dabe050f5ea8f', '[\"*\"]', '2025-07-21 15:36:10', NULL, '2025-07-21 15:30:52', '2025-07-21 15:36:10'),
(350, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '17e2eac64ba18ec7484937cbd360cafb235cc9f941741e8b0f5845665dd78fa2', '[\"*\"]', '2025-07-21 17:09:53', NULL, '2025-07-21 16:13:45', '2025-07-21 17:09:53'),
(351, 'App\\Models\\Utilisateur', 35, 'ecoride-token', '6c232c3b8d465f70ea4443577c9bf2387770d1b52e30dde4897be2217de4da38', '[\"*\"]', '2025-07-22 08:17:10', NULL, '2025-07-22 08:17:07', '2025-07-22 08:17:10'),
(352, 'App\\Models\\Utilisateur', 38, 'ecoride-token', 'bb19fe344bfeac5122cbcbc15b8d08a48dd2c7388e9101b4b749d83cf8fed2df', '[\"*\"]', '2025-07-22 08:20:16', NULL, '2025-07-22 08:20:14', '2025-07-22 08:20:16'),
(353, 'App\\Models\\Utilisateur', 49, 'ecoride-token', '557990a24c1771c6e823fb021127e249e5fc1c59edabba9e0acb53530bd6a89b', '[\"*\"]', '2025-07-22 09:10:26', NULL, '2025-07-22 09:10:21', '2025-07-22 09:10:26'),
(354, 'App\\Models\\Utilisateur', 38, 'ecoride-token', '846e6624ac4ed1fb9b12f7b11ec37b0d79482b6f67d26a2ee310de29b462d6da', '[\"*\"]', '2025-07-22 09:10:55', NULL, '2025-07-22 09:10:51', '2025-07-22 09:10:55'),
(355, 'App\\Models\\Utilisateur', 49, 'ecoride-token', '5d468fcd78787b7b39fc8667c12f58ac81bc6f931a65039898400e9ae0760f61', '[\"*\"]', '2025-07-22 14:21:40', NULL, '2025-07-22 09:11:18', '2025-07-22 14:21:40'),
(356, 'App\\Models\\Utilisateur', 39, 'ecoride-token', 'ffeba019708bb0db016fdbebfb3abe340da9d268d8c0da33372435f85756a573', '[\"*\"]', '2025-07-22 14:22:52', NULL, '2025-07-22 14:22:33', '2025-07-22 14:22:52'),
(357, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '7e293e80ad44cb7a7f4c56c3abe183bf8c69875d981444333b35520fda6199ad', '[\"*\"]', '2025-07-22 14:23:58', NULL, '2025-07-22 14:23:52', '2025-07-22 14:23:58'),
(358, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '7b9bfa48b1a494464326c952313910fc5d0bb74abe1290d0305a07d9ef2ae127', '[\"*\"]', '2025-07-22 14:24:40', NULL, '2025-07-22 14:24:35', '2025-07-22 14:24:40'),
(359, 'App\\Models\\Utilisateur', 39, 'ecoride-token', '834fb952487343c6944e9eb030a028376f7810f2d47b388ca4211ef907668a70', '[\"*\"]', '2025-07-22 14:25:05', NULL, '2025-07-22 14:25:00', '2025-07-22 14:25:05'),
(360, 'App\\Models\\Utilisateur', 50, 'ecoride-token', '4918d94276be24b9d5093f58b02a383ba25c92a1f77ca619fbdff58f0f84a96a', '[\"*\"]', '2025-07-23 07:02:55', NULL, '2025-07-22 20:36:12', '2025-07-23 07:02:55');

-- --------------------------------------------------------

--
-- Structure de la table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trajets`
--

CREATE TABLE `trajets` (
  `id` int(11) NOT NULL,
  `conducteur_id` int(11) NOT NULL,
  `vehicule_id` int(11) NOT NULL,
  `ville_depart` varchar(100) NOT NULL,
  `ville_arrivee` varchar(100) NOT NULL,
  `heure_depart` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `heure_arrivee` timestamp NOT NULL DEFAULT current_timestamp(),
  `places_disponibles` int(11) NOT NULL,
  `prix_credits` int(11) NOT NULL,
  `eco_responsable` tinyint(1) NOT NULL,
  `statut_trajet` enum('À venir','en_cours','termine','annule') NOT NULL DEFAULT 'À venir',
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajets`
--

INSERT INTO `trajets` (`id`, `conducteur_id`, `vehicule_id`, `ville_depart`, `ville_arrivee`, `heure_depart`, `heure_arrivee`, `places_disponibles`, `prix_credits`, `eco_responsable`, `statut_trajet`, `date_creation`) VALUES
(1, 35, 33, 'Annecy', 'Lyon', '2025-07-08 17:58:05', '2025-06-28 19:20:00', 3, 27, 0, 'annule', '2025-06-28 00:00:00'),
(2, 35, 33, 'Annecy', 'Lyon', '2025-06-28 19:24:00', '2025-06-28 20:24:00', 3, 42, 0, 'À venir', '2025-06-28 00:00:00'),
(3, 35, 38, 'Annecy', 'Lyon', '2025-06-28 20:25:00', '2025-06-28 16:29:00', 5, 35, 0, 'À venir', '2025-06-28 00:00:00'),
(4, 35, 33, 'Annecy', 'Lyon', '2025-06-28 19:32:00', '2025-06-28 20:32:00', 3, 40, 0, 'À venir', '2025-06-28 00:00:00'),
(5, 39, 41, 'Annecy', 'Lyon', '2025-07-20 14:39:10', '2025-07-01 12:45:00', 3, 26, 0, 'termine', '2025-07-01 00:00:00'),
(6, 39, 41, 'Annecy', 'Bourg-en-bresse', '2025-07-20 15:27:49', '2025-06-30 14:47:00', 3, 33, 0, 'annule', '2025-06-30 00:00:00'),
(7, 39, 41, 'Annecy', 'Valence', '2025-07-20 15:35:57', '2025-06-30 15:01:00', 2, 20, 0, 'annule', '2025-06-30 00:00:00'),
(8, 39, 41, 'Vienne', 'Valence', '2025-07-20 14:39:48', '2025-07-01 14:12:00', 2, 53, 0, 'annule', '2025-07-01 00:00:00'),
(9, 35, 39, 'Vienne', 'Valence', '2025-07-09 16:56:56', '2025-07-01 15:15:00', 2, 46, 0, 'À venir', '2025-07-01 00:00:00'),
(10, 38, 42, 'Annecy', 'Valence', '2025-07-01 16:49:00', '2025-07-01 19:49:00', 2, 41, 0, 'À venir', '2025-07-01 00:00:00'),
(11, 38, 42, 'Paris', 'Lyon', '2025-07-01 13:30:00', '2025-07-01 21:30:00', 2, 68, 0, 'À venir', '2025-07-01 00:00:00'),
(12, 39, 41, 'Vienne', 'Valence', '2025-07-20 14:25:48', '2025-07-02 12:32:00', 2, 16, 0, 'termine', '2025-07-02 00:00:00'),
(13, 38, 42, 'Nantes', 'Lyon', '2025-07-01 12:01:00', '2025-07-01 13:01:00', 2, 16, 0, 'À venir', '2025-07-01 00:00:00'),
(14, 38, 42, 'Lyon', 'Annecy', '2025-07-01 19:22:58', '2025-07-02 10:19:00', 1, 32, 0, 'À venir', '2025-07-02 00:00:00'),
(18, 38, 42, 'Lille', 'Lyon', '2025-07-01 20:35:23', '2025-07-02 19:32:00', 1, 29, 0, 'À venir', '2025-07-02 00:00:00'),
(19, 35, 38, 'Boug-en-bresse', 'Annecy', '2025-07-07 20:13:25', '2025-07-03 15:50:00', 4, 30, 0, 'annule', '2025-07-03 00:00:00'),
(21, 35, 38, 'Annecy', 'Lyon', '2025-07-07 20:13:23', '2025-07-04 17:45:00', 4, 73, 0, 'annule', '2025-07-04 00:00:00'),
(22, 35, 33, 'Annecy', 'Lyon', '2025-07-08 17:57:52', '2025-07-04 15:45:00', 2, 58, 0, 'annule', '2025-07-04 00:00:00'),
(24, 38, 42, 'Annecy', 'Lyon', '2025-07-04 20:01:00', '2025-07-03 22:01:00', 2, 39, 0, 'À venir', '2025-07-04 00:00:00'),
(25, 38, 42, 'Annecy', 'Valence', '2025-07-05 15:21:00', '2025-07-05 18:21:00', 2, 41, 0, 'À venir', '2025-07-05 00:00:00'),
(26, 38, 42, 'Nantes', 'Lyon', '2025-07-05 19:41:00', '2025-07-05 00:41:00', 2, 32, 0, 'À venir', '2025-07-05 00:00:00'),
(27, 38, 42, 'Annecy', 'Valence', '2025-07-06 08:44:00', '2025-07-06 09:44:00', 2, 24, 0, 'À venir', '2025-07-06 00:00:00'),
(28, 35, 33, 'Annecy', 'Valence', '2025-07-10 11:53:58', '2025-07-06 13:20:00', 2, 26, 0, 'annule', '2025-07-06 00:00:00'),
(29, 38, 42, 'Paris', 'Lyon', '2025-07-07 10:38:41', '2025-07-06 16:02:00', 2, 70, 0, 'annule', '2025-07-06 00:00:00'),
(30, 38, 42, 'Paris', 'Lyon', '2025-07-07 10:47:04', '2025-07-06 00:07:00', 2, 38, 0, 'annule', '2025-07-06 00:00:00'),
(31, 38, 42, 'Annecy', 'Lyon', '2025-07-07 10:43:51', '2025-07-08 12:38:00', 2, 33, 0, 'annule', '2025-07-08 00:00:00'),
(32, 35, 33, 'Annecy', 'Lyon', '2025-07-08 17:58:50', '2025-07-08 21:36:00', 2, 33, 0, 'termine', '2025-07-08 00:00:00'),
(33, 35, 34, 'Annecy', 'Bourg-en-bresse', '2025-07-10 16:39:00', '2025-07-10 18:38:00', 5, 31, 0, 'À venir', '2025-07-10 00:00:00'),
(34, 35, 53, 'Annecy', 'Lyon', '2025-07-10 22:34:17', '2025-07-11 18:41:00', 5, 56, 0, 'annule', '2025-07-11 00:00:00'),
(35, 35, 39, 'Paris', 'Lyon', '2025-07-10 13:42:00', '2025-07-10 15:42:00', 5, 35, 0, 'À venir', '2025-07-10 00:00:00'),
(36, 38, 56, 'Vienne', 'Valence', '2025-07-09 16:51:23', '2025-07-10 18:49:00', 2, 31, 0, 'À venir', '2025-07-10 00:00:00'),
(37, 38, 56, 'Annecy', 'Valence', '2025-07-10 11:57:26', '2025-07-11 20:22:00', 2, 66, 0, 'À venir', '2025-07-11 00:00:00'),
(38, 35, 54, 'Annecy', 'Lyon', '2025-07-11 06:48:00', '2025-07-11 12:48:00', 3, 34, 0, 'À venir', '2025-07-11 00:00:00'),
(39, 35, 55, 'Annecy', 'Lyon', '2025-07-10 23:48:00', '2025-07-11 02:48:00', 1, 44, 0, 'À venir', '2025-07-11 00:00:00'),
(40, 35, 55, 'Annecy', 'Lyon', '2025-07-11 13:49:00', '2025-07-11 00:49:00', 1, 25, 0, 'À venir', '2025-07-11 00:00:00'),
(41, 38, 56, 'Annecy', 'Lyon', '2025-07-12 10:12:58', '2025-07-12 14:42:00', 3, 49, 0, 'annule', '2025-07-12 00:00:00'),
(42, 38, 57, 'Annecy', 'Lyon', '2025-07-12 11:17:00', '2025-07-12 13:18:00', 3, 36, 0, 'À venir', '2025-07-12 00:00:00'),
(43, 38, 56, 'Paris', 'Lyon', '2025-07-13 12:42:00', '2025-07-13 17:42:00', 3, 46, 0, 'À venir', '2025-07-13 00:00:00'),
(44, 38, 57, 'Annecy', 'Valence', '2025-07-14 03:55:00', '2025-07-14 11:55:00', 3, 34, 0, 'À venir', '2025-07-14 00:00:00'),
(45, 38, 58, 'grillon', 'st tropez', '2025-07-13 06:28:00', '2025-07-13 07:28:00', 5, 44, 0, 'À venir', '2025-07-13 00:00:00'),
(46, 38, 58, 'grillon', 'st tropez', '2025-07-14 09:33:00', '2025-07-14 19:33:00', 5, 37, 0, 'À venir', '2025-07-14 00:00:00'),
(47, 38, 58, 'Annecy', 'saint tropez', '2025-07-13 00:36:00', '2025-07-13 03:36:00', 5, 39, 0, 'À venir', '2025-07-13 00:00:00'),
(48, 38, 58, 'Annecy', 'Valence', '2025-07-12 22:55:57', '2025-07-12 23:50:00', 4, 14, 0, 'À venir', '2025-07-13 00:00:00'),
(49, 38, 58, 'grillon', 'st tropez', '2025-07-15 07:13:00', '2025-07-15 07:13:00', 5, 44, 0, 'À venir', '2025-07-15 00:00:00'),
(50, 38, 58, 'Montelimar', 'Avignon', '2025-07-15 21:35:00', '2025-07-15 02:35:00', 5, 50, 0, 'À venir', '2025-07-15 00:00:00'),
(51, 38, 58, 'Annecy', 'Lyon', '2025-07-18 07:28:58', '2025-07-20 01:38:00', 4, 50, 0, 'À venir', '2025-07-20 00:00:00'),
(52, 38, 58, 'grillon', 'saint tropez', '2025-07-14 02:39:00', '2025-07-14 05:39:00', 5, 50, 0, 'À venir', '2025-07-14 00:00:00'),
(53, 38, 58, 'grillon', 'st tropez', '2025-07-15 06:03:00', '2025-07-15 02:03:00', 5, 45, 0, 'À venir', '2025-07-15 00:00:00'),
(54, 38, 58, 'Valreas', 'Suze-la-rousse', '2025-07-16 12:34:00', '2025-07-16 15:35:00', 5, 35, 0, 'À venir', '2025-07-16 00:00:00'),
(55, 38, 58, 'Reventin', 'La Clusaz', '2025-07-14 19:55:37', '2025-07-16 21:54:00', 4, 42, 0, 'À venir', '2025-07-16 00:00:00'),
(56, 38, 58, 'Lyon', 'geneve', '2025-07-16 22:01:00', '2025-07-17 04:01:00', 5, 59, 0, 'À venir', '2025-07-17 00:00:00'),
(57, 38, 56, 'Annecy', 'Lyon', '2025-07-16 05:25:00', '2025-07-16 13:25:00', 3, 42, 0, 'À venir', '2025-07-16 00:00:00'),
(58, 38, 58, 'Annecy', 'Lyon', '2025-07-16 11:26:00', '2025-07-16 14:26:00', 5, 56, 0, 'À venir', '2025-07-16 00:00:00'),
(59, 38, 58, 'Annecy', 'Lyon', '2025-07-16 10:26:00', '2025-07-16 13:26:00', 5, 46, 0, 'À venir', '2025-07-16 00:00:00'),
(60, 35, 54, 'Annecy', 'Lyon', '2025-07-16 12:57:00', '2025-07-16 14:57:00', 3, 29, 0, 'À venir', '2025-07-16 00:00:00'),
(62, 35, 63, 'Annecy', 'Lyon', '2025-07-18 07:44:23', '2025-07-18 18:56:00', 2, 31, 0, 'À venir', '2025-07-18 00:00:00'),
(63, 39, 41, 'Annecy', 'Lyon', '2025-07-20 15:04:06', '2025-07-18 11:52:00', 2, 30, 0, 'termine', '2025-07-18 00:00:00'),
(64, 39, 41, 'Annecy', 'Lyon', '2025-07-20 14:25:45', '2025-07-18 12:52:00', 2, 27, 0, 'termine', '2025-07-18 00:00:00'),
(65, 35, 67, 'Annecy', 'Valence', '2025-07-18 09:56:00', '2025-07-18 12:56:00', 3, 50, 0, 'À venir', '2025-07-18 00:00:00'),
(66, 35, 34, 'Marseille', 'Avignon', '2025-07-18 10:57:00', '2025-07-18 12:57:00', 5, 55, 0, 'À venir', '2025-07-18 00:00:00'),
(67, 35, 63, 'Annecy', 'Lyon', '2025-07-18 08:35:09', '2025-07-18 12:01:00', 2, 53, 0, 'À venir', '2025-07-18 00:00:00'),
(68, 35, 53, 'Annecy', 'Lyon', '2025-07-18 08:54:04', '2025-07-18 13:04:00', 5, 48, 0, 'À venir', '2025-07-18 00:00:00'),
(69, 35, 33, 'Annecy', 'Lyon', '2025-07-19 08:04:01', '2025-07-19 13:11:00', 2, 41, 0, 'À venir', '2025-07-19 00:00:00'),
(70, 35, 47, 'Annecy', 'Lyon', '2025-07-18 10:19:00', '2025-07-18 13:19:00', 5, 37, 0, 'À venir', '2025-07-18 00:00:00'),
(71, 35, 62, 'Annecy', 'Lyon', '2025-07-19 10:03:00', '2025-07-19 14:03:00', 2, 53, 0, 'À venir', '2025-07-19 00:00:00'),
(72, 38, 58, 'Annecy', 'Lyon', '2025-07-19 21:28:00', '2025-07-19 05:28:00', 5, 30, 0, 'À venir', '2025-07-19 00:00:00'),
(73, 35, 67, 'Annecy', 'Lyon', '2025-07-20 07:45:19', '2025-07-20 11:09:00', 2, 60, 0, 'À venir', '2025-07-20 00:00:00'),
(74, 35, 67, 'Annecy', 'Lyon', '2025-07-20 07:47:33', '2025-07-20 13:10:00', 2, 63, 0, 'À venir', '2025-07-20 00:00:00'),
(75, 35, 63, 'Annecy', 'Lyon', '2025-07-20 09:11:00', '2025-07-20 12:11:00', 3, 49, 0, 'À venir', '2025-07-20 00:00:00'),
(76, 39, 69, 'Annecy', 'Lyon', '2025-07-20 15:33:40', '2025-07-20 21:13:00', 3, 48, 0, 'annule', '2025-07-20 00:00:00'),
(77, 38, 58, 'Annecy', 'Lyon', '2025-07-21 08:09:19', '2025-07-21 13:13:00', 3, 49, 0, 'À venir', '2025-07-21 00:00:00'),
(78, 35, 67, 'Annecy', 'Lyon', '2025-07-21 09:07:00', '2025-07-21 13:07:00', 3, 55, 0, 'À venir', '2025-07-21 00:00:00'),
(79, 35, 67, 'Annecy', 'Lyon', '2025-07-21 11:07:00', '2025-07-21 13:07:00', 3, 67, 0, 'À venir', '2025-07-21 00:00:00'),
(80, 35, 63, 'Annecy', 'Lyon', '2025-07-22 11:08:00', '2025-07-22 12:08:00', 3, 20, 0, 'À venir', '2025-07-22 00:00:00'),
(81, 35, 55, 'Annecy', 'Lyon', '2025-07-22 14:25:00', '2025-07-22 18:25:00', 1, 38, 0, 'À venir', '2025-07-22 00:00:00'),
(82, 35, 67, 'Annecy', 'Lyon', '2025-07-21 19:37:00', '2025-07-21 21:37:00', 3, 40, 0, 'À venir', '2025-07-21 00:00:00'),
(83, 35, 55, 'Annecy', 'Lyon', '2025-07-23 19:31:00', '2025-07-23 01:31:00', 1, 30, 0, 'À venir', '2025-07-23 00:00:00'),
(84, 49, 72, 'Annecy', 'Lyon', '2025-07-23 12:23:00', '2025-07-23 15:23:00', 3, 38, 0, 'À venir', '2025-07-23 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `trajet_participants`
--

CREATE TABLE `trajet_participants` (
  `trajet_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `credits_utilises` int(11) NOT NULL,
  `date_confirmation` datetime DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet_participants`
--

INSERT INTO `trajet_participants` (`trajet_id`, `utilisateur_id`, `credits_utilises`, `date_confirmation`, `confirm`) VALUES
(7, 38, 20, '2025-07-10 11:54:24', 1),
(8, 35, 53, '2025-07-09 16:56:07', 1),
(9, 38, 46, '2025-07-09 16:56:56', 1),
(21, 38, 73, '2025-07-04 20:36:22', 1),
(22, 38, 58, '2025-07-04 20:41:13', 1),
(28, 38, 26, '2025-07-10 11:53:58', 1),
(32, 38, 33, '2025-07-07 20:43:16', 1),
(34, 38, 56, '2025-07-10 22:34:17', 1),
(36, 35, 31, '2025-07-09 16:51:23', 1),
(37, 35, 66, '2025-07-10 11:57:26', 1),
(48, 38, 14, '2025-07-13 00:55:57', 1),
(51, 35, 50, '2025-07-18 09:28:58', 1),
(62, 38, 31, '2025-07-18 09:44:23', 1),
(63, 35, 30, '2025-07-18 09:53:48', 1),
(64, 35, 27, '2025-07-18 10:30:53', 1),
(67, 35, 53, '2025-07-18 10:35:09', 1),
(68, 35, 48, '2025-07-18 10:54:04', 1),
(69, 38, 41, '2025-07-19 10:04:01', 1),
(73, 39, 60, '2025-07-20 09:45:19', 1),
(74, 39, 63, '2025-07-20 09:47:33', 1),
(77, 38, 49, '2025-07-21 09:56:21', 1),
(77, 39, 49, '2025-07-21 10:09:19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `transactions_credits`
--

CREATE TABLE `transactions_credits` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `trajet_id` int(11) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `type_transaction` enum('initial','participation','gains','frais_plateforme','remboursement_annulation') NOT NULL,
  `date_transaction` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `note_moyenne` float DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `date_naissance` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `credits` int(11) NOT NULL DEFAULT 20,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('actif','suspendu') DEFAULT 'actif',
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `note_moyenne`, `password`, `remember_token`, `telephone`, `adresse`, `date_naissance`, `photo`, `credits`, `created_at`, `updated_at`, `status`, `role`) VALUES
(35, 'genillon', 'gabriele', 'gabaym140610@gmail.com', 0, '$2y$12$uAeVPWi3OKGPLtJvnCUoCOQsofobNYQLIxYyDFwcdFd.oRCzh83WC', '36NDK1xSAT71AoZ5Z3fMPItsZR4BFRi0X4t32af1A0EWlk8Kd3Z8jlZHDbo8', '0781636498', '17 rue thomas ruphy', '2005-10-14', 'photos_utilisateurs/wliiNzfTiuUubVMI0TgU4gBJKY5qH5d4WXey3ALF.png', 1286, '2025-06-24 18:15:27', '2025-07-20 20:35:11', 'actif', 'user'),
(37, 'tom', 'leS', 'TomS@eight-id.com', 0, '$2y$12$XBj2kogeZfuYqMMqk21zWeytl9HV312J7mIoxQIlxWOWnpcKR3lXm', NULL, '0670247560', '17 rue thomas ruphy', '2025-06-20', 'photos/KIPdBtHAo6U8KCv35M0PV4iUBm8l74qFK1nEngaz.webp', 20, '2025-06-26 08:12:50', '2025-07-09 14:54:09', 'actif', 'user'),
(38, 'guittard', 'aymerick', 'aymerick.guittard@mac.com', 0, '$2y$12$hwmnLv5nv6MKJzw4.VYXjO5QbqpEiJRBKbkwUmmzwV4sl4KnsahmS', NULL, '0670247542', '17 rue thomas ruphy', '2025-06-29', 'photos_utilisateurs/dgaQH60xodXKblqHUntRjypkuZLC5Ma3j63NqnrD.png', 149, '2025-06-28 10:01:32', '2025-07-21 08:09:19', 'actif', 'user'),
(39, 'Doe', 'John', 'John-Doe@gmail.com', 0, '$2y$12$4X9K1nlu2gIs92oVBCaB6.j.IIOac3WuyYtMR9j8Ma0Bvza3p47K.', NULL, '0670247542', '17 rue thomas ruphy', '2000-01-20', 'photos/fN1foz72UbLfHpxJjgpofwgge90NOujaEiqS5huw.webp', 231, '2025-06-28 21:28:29', '2025-07-21 08:09:19', 'actif', 'user'),
(43, 'Frank', 'Dubois', 'FKD@gmail.com', 0, '$2y$12$ty/1dgeaWh.b.t9JOKJ0n.UXvpJH4zMiD2A4.l5U6UjNZSDOqEmSq', NULL, '0670247542', '17 rue thomas ruphy', '1969-10-16', '1752176696_ecoride_horizontal_transparent_78x40 (1).png', 20, '2025-07-10 17:44:56', '2025-07-10 17:44:56', 'actif', 'user'),
(45, 'TEST', 'Antoine', 'TESTJ@mac.com', 0, '$2y$12$kPpV/Y/eML1ZLApedMJ9I.Vs3XjJtI8xmijg0JVXOr.PcOK8/G4bG', NULL, '0670247542', '17 rue thomas ruphy', '2025-07-16', 'photos_utilisateurs/Jfd9kdABOiiHnTXuf4mP93gDKAkNoqoXkDfQCe5O.png', 20, '2025-07-14 17:48:35', '2025-07-18 09:37:02', 'actif', 'user'),
(48, 'Duquon', 'aymerick', 'duquonAymerick@icloud.com', 0, '$2y$12$vGXSfj3xlKK4bv8vCPmVH.A41L/zC/I5eaZie7ZBTC7NPjhXg17Eu', NULL, '0670247542', '17 rue thomas ruphy', '1990-02-10', '1752584184_ecoride_horizontal_transparent_78x40 (1).png', 20, '2025-07-15 12:56:24', '2025-07-15 12:56:24', 'actif', 'user'),
(49, 'TEST', 'Antony', 'Anttonytest@gmail.com', 0, '$2y$12$VppbiyEBfc/dhI0KmPqMpeiskhK5/n9TMu.W6DLJ/xRe92gmsGn/y', NULL, '0670247542', '17 Rue Thomas Ruphy', '2025-07-15', NULL, 20, '2025-07-22 09:10:19', '2025-07-22 09:10:19', 'actif', 'user'),
(50, 'Mateo', 'Mateo', 'Matt@gmail.com', 0, '$2y$12$v8yxwU/FmAXRRGPNZIFtreIaxao1Po7O418wGdFd3lmn9JGeiTbvq', NULL, '0670247542', '17 Rue Thomas Ruphy', '2025-07-15', NULL, 20, '2025-07-22 20:36:12', '2025-07-22 20:36:12', 'actif', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_preferences`
--

CREATE TABLE `utilisateur_preferences` (
  `utilisateur_id` int(11) NOT NULL,
  `preference_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_roles`
--

CREATE TABLE `utilisateur_roles` (
  `utilisateur_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` int(11) NOT NULL,
  `proprietaire_id` int(11) NOT NULL,
  `immatriculation` varchar(255) NOT NULL,
  `date_premiere_immatriculation` date NOT NULL,
  `marque` varchar(255) NOT NULL,
  `modele` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `type_energie` enum('essence','diesel','electrique','hybride') NOT NULL,
  `nombre_places` int(11) NOT NULL,
  `fumeur` tinyint(1) NOT NULL,
  `animaux` tinyint(1) NOT NULL,
  `voyage_ecologique` tinyint(1) NOT NULL,
  `preferences` text NOT NULL DEFAULT 'Non',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `proprietaire_id`, `immatriculation`, `date_premiere_immatriculation`, `marque`, `modele`, `couleur`, `type_energie`, `nombre_places`, `fumeur`, `animaux`, `voyage_ecologique`, `preferences`, `created_at`, `updated_at`) VALUES
(32, 37, 'AB-600-ML', '2020-06-15', 'giugg', 'Clio 5', 'Rouge métallisé', 'diesel', 4, 1, 1, 1, 'testetetet', '2025-06-26 11:49:00', '2025-06-26 11:49:00'),
(33, 35, 'AB-456-FR', '2020-06-15', 'Renault', 'Clio 5', 'Rouge métallisé', 'diesel', 3, 0, 1, 1, 'Non', '2025-06-26 15:00:45', '2025-06-26 15:00:45'),
(34, 35, 'AB-456-KM', '2020-06-15', 'Renault', 'Clio 5', 'Rouge métallisé', 'electrique', 5, 1, 1, 1, 'Non', '2025-06-26 20:09:03', '2025-06-26 20:09:03'),
(38, 35, 'AB-456-NM', '2020-06-15', 'Renault', 'Clio 5', 'Rouge métallisé', 'essence', 5, 1, 1, 1, 'sdzedz', '2025-06-26 20:23:10', '2025-06-26 20:23:10'),
(39, 35, 'AB-456-XM', '2020-06-15', 'Renault', 'Clio 5', 'Rouge métallisé', 'diesel', 5, 1, 1, 1, 'dcdzsc', '2025-06-26 22:33:36', '2025-06-26 22:33:36'),
(41, 39, 'KL-546-PG', '2017-05-16', 'Renault', 'zoe', 'noir', 'electrique', 3, 1, 1, 1, 'Non', '2025-06-30 08:44:48', '2025-06-30 08:44:48'),
(42, 38, 'KL-451-GK', '2025-01-24', 'Toyota', 'yaris', 'blanc', 'diesel', 2, 1, 1, 1, 'Non', '2025-06-30 12:49:06', '2025-06-30 12:49:06'),
(46, 35, 'KL-546-OI', '2025-01-12', 'Renault', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'vsgdsfgd', '2025-07-08 18:42:47', '2025-07-08 18:42:47'),
(47, 35, 'KL-546-HJ', '2025-01-23', 'Renault', 'zoe', 'blanc', 'diesel', 5, 1, 1, 1, 'non', '2025-07-08 20:06:02', '2025-07-08 20:06:02'),
(48, 35, 'KL-600-PM', '2025-01-24', 'Renault', 'zoe', 'noir', 'essence', 5, 1, 1, 1, 'ehdhjzejd', '2025-07-08 20:13:39', '2025-07-08 20:13:39'),
(49, 35, 'KL-546-KJ', '2025-01-30', 'Renault', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'hedhgaehjgez', '2025-07-08 20:15:43', '2025-07-08 20:15:43'),
(50, 35, 'KL-546-LF', '2020-01-24', 'Renault', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'zézzééz', '2025-07-08 20:20:03', '2025-07-08 20:20:03'),
(51, 35, 'KL-546-MP', '2025-01-10', 'Renault', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'ejdajn', '2025-07-08 20:23:57', '2025-07-08 20:23:57'),
(52, 35, 'KL-546-OK', '2025-01-24', 'Renault', 'zoe', 'noir', 'diesel', 3, 1, 1, 1, 'zszszs', '2025-07-08 22:12:27', '2025-07-08 22:12:27'),
(53, 35, 'KL-546-HG', '2025-01-04', 'Renault', 'zoe', 'blanc', 'essence', 6, 1, 1, 1, 'ggggggggggggg', '2025-07-08 22:18:33', '2025-07-08 22:18:33'),
(54, 35, 'KL-600-OJ', '2020-01-30', 'Renault', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'zedz', '2025-07-09 14:34:42', '2025-07-09 14:34:42'),
(55, 35, 'KL-546-NI', '2020-01-14', 'Jaguard', 'F-Type', 'noir', 'diesel', 1, 1, 1, 1, 'non', '2025-07-09 14:52:22', '2025-07-09 14:52:22'),
(56, 38, 'KL-546-BG', '2020-01-20', 'serie 3', 'Tesla', 'blanc', 'electrique', 3, 1, 1, 1, 'non', '2025-07-09 16:48:18', '2025-07-09 16:48:18'),
(57, 38, 'KL-546-DS', '2025-01-25', 'Renault Toyota', 'yaris tets', 'blanc', 'essence', 3, 1, 1, 1, 'aucune', '2025-07-12 10:15:26', '2025-07-12 10:15:26'),
(58, 38, 'KL-546-OF', '2025-01-12', 'Hundai', 'Tucson', 'blanc', 'hybride', 5, 1, 1, 1, 'non', '2025-07-13 00:25:45', '2025-07-13 00:25:45'),
(59, 45, 'KL-546-UW', '2025-01-30', 'Toyota', 'yaris', 'blanc', 'essence', 5, 1, 1, 1, 'non', '2025-07-15 10:59:46', '2025-07-15 10:59:46'),
(60, 35, 'KL-546-ZA', '2025-01-10', 'Toyota', 'yaris', 'blanc', 'diesel', 2, 1, 1, 1, 'non', '2025-07-17 15:23:18', '2025-07-17 15:23:18'),
(61, 35, 'KL-451-KX', '2025-01-10', 'Hundai', 'Tucson', 'blanc', 'electrique', 5, 1, 1, 1, 'non', '2025-07-17 15:28:52', '2025-07-17 15:28:52'),
(62, 35, 'KL-546-UJ', '2025-01-30', 'Toyota', 'zoe', 'blanc', 'electrique', 2, 1, 1, 1, 'non', '2025-07-17 15:58:17', '2025-07-17 15:58:17'),
(63, 35, 'KL-546-BR', '2025-01-02', 'Toyota', 'yaris', 'blanc', 'electrique', 3, 1, 1, 1, 'non', '2025-07-17 16:01:07', '2025-07-17 16:01:07'),
(67, 35, 'KL-546-PI', '2025-01-02', 'Jaguard', 'Tesla', 'blanc', 'diesel', 3, 1, 1, 1, 'zazazaz', '2025-07-17 16:55:58', '2025-07-17 16:55:58'),
(68, 35, 'KL-546-CV', '2025-01-21', 'Toyota', 'zoe', 'blanc', 'diesel', 3, 1, 1, 1, 'sssssssss', '2025-07-18 11:19:52', '2025-07-18 11:19:52'),
(69, 39, 'KL-546-UY', '2025-01-20', 'Hundai', 'Tucson', 'blanc', 'electrique', 3, 0, 0, 1, 'non', '2025-07-20 17:12:41', '2025-07-20 17:12:41'),
(72, 49, 'KL-546-VC', '2025-01-25', 'Toyota', 'zoe', 'blanc', 'electrique', 3, 1, 1, 1, 'pas de musique trop forte', '2025-07-22 11:19:50', '2025-07-22 11:19:50');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `avis_plateformes`
--
ALTER TABLE `avis_plateformes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `avis_platforme`
--
ALTER TABLE `avis_platforme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_utilisateur_avis` (`utilisateur_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `conducteur_id` (`conducteur_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `trajets`
--
ALTER TABLE `trajets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conducteur_id` (`conducteur_id`),
  ADD KEY `vehicule_id` (`vehicule_id`);

--
-- Index pour la table `trajet_participants`
--
ALTER TABLE `trajet_participants`
  ADD PRIMARY KEY (`trajet_id`,`utilisateur_id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `transactions_credits`
--
ALTER TABLE `transactions_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `trajet_id` (`trajet_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur_preferences`
--
ALTER TABLE `utilisateur_preferences`
  ADD PRIMARY KEY (`utilisateur_id`,`preference_id`),
  ADD KEY `preference_id` (`preference_id`);

--
-- Index pour la table `utilisateur_roles`
--
ALTER TABLE `utilisateur_roles`
  ADD PRIMARY KEY (`utilisateur_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `immatriculation` (`immatriculation`),
  ADD KEY `proprietaire_id` (`proprietaire_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `avis_plateformes`
--
ALTER TABLE `avis_plateformes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `avis_platforme`
--
ALTER TABLE `avis_platforme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT pour la table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trajets`
--
ALTER TABLE `trajets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT pour la table `transactions_credits`
--
ALTER TABLE `transactions_credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis_platforme`
--
ALTER TABLE `avis_platforme`
  ADD CONSTRAINT `fk_utilisateur_avis` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `incidents`
--
ALTER TABLE `incidents`
  ADD CONSTRAINT `incidents_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `incidents_ibfk_2` FOREIGN KEY (`conducteur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `trajets`
--
ALTER TABLE `trajets`
  ADD CONSTRAINT `trajets_ibfk_1` FOREIGN KEY (`conducteur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `trajets_ibfk_2` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`);

--
-- Contraintes pour la table `trajet_participants`
--
ALTER TABLE `trajet_participants`
  ADD CONSTRAINT `trajet_participants_ibfk_1` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`),
  ADD CONSTRAINT `trajet_participants_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `transactions_credits`
--
ALTER TABLE `transactions_credits`
  ADD CONSTRAINT `transactions_credits_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `transactions_credits_ibfk_2` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`);

--
-- Contraintes pour la table `utilisateur_preferences`
--
ALTER TABLE `utilisateur_preferences`
  ADD CONSTRAINT `utilisateur_preferences_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `utilisateur_preferences_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`);

--
-- Contraintes pour la table `utilisateur_roles`
--
ALTER TABLE `utilisateur_roles`
  ADD CONSTRAINT `utilisateur_roles_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `utilisateur_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `vehicules_ibfk_1` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
