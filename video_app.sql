-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 25, 2025 at 02:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `movie_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 'good', '2025-09-25 04:39:42', '2025-09-25 04:39:42'),
(3, 2, 21, 'top', '2025-09-25 04:47:33', '2025-09-25 04:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_25_092511_create_movies_table', 1),
(5, '2025_09_25_112853_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `trailer_url` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'movie',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `poster`, `trailer_url`, `year`, `description`, `type`, `created_at`, `updated_at`) VALUES
(1, 'The Shawshank Redemption', 'The_Shawshank_Redemption', 'https://www.youtube.com/embed/6hB3S9bIaco', '1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(2, 'The Godfather', 'The_Godfather', 'https://www.youtube.com/embed/UaVTIH8mujA', '1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(3, 'The Dark Knight', 'The_Dark_Knight', 'https://www.youtube.com/embed/EXeTwQWrcwY', '2008', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(4, 'The Godfather: Part II', 'The_Godfather_Part_II', 'https://www.youtube.com/embed/9O1Iy9od7-A', '1974', 'The early life and career of Vito Corleone in 1920s New York; the rise of his son Michael Corleone to power in the 1950s.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(5, '12 Angry Men', '12_Angry_Men', 'https://www.youtube.com/embed/TEN-2uTi2c0', '1957', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(6, 'Schindler\'s List', 'Schindlers_List', 'https://www.youtube.com/embed/mxphAlJID9U', '1993', 'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(7, 'The Lord of the Rings: The Return of the King', 'The_Lord_of_the_Rings_The_Return_of_the_King', 'https://www.youtube.com/embed/r5X-hFf6Bwo', '2003', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(8, 'Pulp Fiction', 'Pulp_Fiction', 'https://www.youtube.com/embed/s7EdQ4FqbhY', '1994', 'The lives of two mob hitmen, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'The_Lord_of_the_Rings_The_Fellowship_of_the_Ring', 'https://www.youtube.com/embed/V75dMMIW2B4', '2001', 'A young hobbit, Frodo Baggins, is tasked with the dangerous mission of destroying the One Ring in the fires of Mount Doom.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(10, 'The Good, the Bad and the Ugly', 'The_Good_the_Bad_and_the_Ugly', 'https://www.youtube.com/embed/WCN5JJY_wiA', '1966', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(11, 'Forrest Gump', 'Forrest_Gump', 'https://www.youtube.com/embed/bLvqoHBptjg', '1994', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an extraordinary life.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(12, 'Inception', 'Inception', 'https://www.youtube.com/embed/YoHD9XEInc0', '2010', 'A thief who enters the dreams of others to steal secrets from their subconscious is given the inverse task of planting an idea into the mind of a CEO.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(13, 'The Empire Strikes Back', 'The_Empire_Strikes_Back', 'https://www.youtube.com/embed/1g3_CFmnU7o', '1980', 'After the rebels are overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(14, 'The Dark Knight Rises', 'The_Dark_Knight_Rises', 'https://www.youtube.com/embed/g8evyE9TuYk', '2012', 'Eight years after the Joker\'s reign of anarchy, the Dark Knight is forced to resurface when a new terrorist leader, Bane, overwhelms Gotham\'s finest.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(15, 'The Matrix', 'The_Matrix', 'https://www.youtube.com/embed/m8e-FF8MsqU', '1999', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(16, 'Goodfellas', 'Goodfellas', 'https://www.youtube.com/embed/qo5jJpHtI1Y', '1990', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife and his mob partners.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(17, 'The Silence of the Lambs', 'The_Silence_of_the_Lambs', 'https://www.youtube.com/embed/29Zp6aY5QdM', '1991', 'A young F.B.I. cadet must confide in an incarcerated and manipulative killer to receive his help on catching another serial killer who skins his victims.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(18, 'Se7en', 'Se7en', 'https://www.youtube.com/embed/znmZoVkCjpI', '1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(19, 'Fight Club', 'Fight_Club', 'https://www.youtube.com/embed/SUXWAEX2jlg', '1999', 'An insomniac office worker and a soap maker form an underground fight club that evolves into something much more.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(20, 'Interstellar', 'Interstellar', 'https://www.youtube.com/embed/zSWdZVtXT7E', '2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(21, 'Parasite', 'Parasite', 'https://www.youtube.com/embed/5xH0HfJHsaY', '2019', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(22, 'The Green Mile', 'The_Green_Mile', 'https://www.youtube.com/embed/ktjafK4SgWM', '1999', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(23, 'Gladiator', 'Gladiator', 'https://www.youtube.com/embed/owK1qxDselE', '2000', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(24, 'Whiplash', 'Whiplash', 'https://www.youtube.com/embed/7d_jQycdQGo', '2014', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(25, 'The Prestige', 'The_Prestige', 'https://www.youtube.com/embed/o4gHCmTQDVI', '2006', 'After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(26, 'The Lion King', 'The_Lion_King', 'https://www.youtube.com/embed/4sj1MT05lAA', '1994', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(27, 'The Departed', 'The_Departed', 'https://www.youtube.com/embed/iojhqm0JTW4', '2006', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in Boston.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(28, 'Joker', 'Joker', 'https://www.youtube.com/embed/zAGVQLHvwOY', '2019', 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime.', 'movie', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(29, 'Breaking Bad', 'Breaking_Bad', 'https://www.youtube.com/embed/HhesaQXLuRY', '2008', 'A high school chemistry teacher turned methamphetamine producer navigates the dangers of the criminal world.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(30, 'Game of Thrones', 'Game_of_Thrones', 'https://www.youtube.com/embed/BpJYNVhGf1s', '2011', 'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(31, 'Stranger Things', 'Stranger_Things', 'https://www.youtube.com/embed/mnd7sFt5c3A', '2016', 'A group of kids in a small town uncover supernatural forces and secret government exploits while searching for their missing friend.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(32, 'The Crown', 'The_Crown', 'https://www.youtube.com/embed/JWtnJjn6ng0', '2016', 'Chronicles the life of Queen Elizabeth II from the 1940s to modern times, depicting political and personal events that shaped the monarchy.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(33, 'The Mandalorian', 'The_Mandalorian', 'https://www.youtube.com/embed/aOC8E8z_ifw', '2019', 'A lone bounty hunter in the outer reaches of the galaxy protects a mysterious child while navigating the remnants of the Empire.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(34, 'The Boys', 'The_Boys', 'https://www.youtube.com/embed/pq8TUo7ZSOQ', '2019', 'A group of vigilantes set out to take down corrupt superheroes who abuse their superpowers.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(35, 'Westworld', 'Westworld', 'https://www.youtube.com/embed/2r2evjNDDiA', '2016', 'A futuristic amusement park populated by androids allows guests to live out their fantasies, but secrets of the park emerge.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(36, 'Mindhunter', 'Mindhunter', 'https://www.youtube.com/embed/3vHykq8B9TI', '2017', 'FBI agents develop criminal profiling and behavioral science techniques while interviewing serial killers.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(37, 'Sherlock', 'Sherlock', 'https://www.youtube.com/embed/xK7S9mrFWL4', '2010', 'A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(38, 'House of Cards', 'House_of_Cards', 'https://www.youtube.com/embed/ULwUzF1q5w4', '2013', 'A ruthless politician and his wife manipulate their way through Washington D.C. to gain power at all costs.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(39, 'Chernobyl', 'Chernobyl', 'https://www.youtube.com/embed/s9APLXM9Ei8', '2019', 'Dramatizes the 1986 nuclear disaster and the aftermath, including the cleanup efforts and the sacrifices made by first responders.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(40, 'Vikings', 'Vikings', 'https://www.youtube.com/embed/1qM1XUuZQbE', '2013', 'Follows the adventures of Ragnar Lothbrok, the legendary Viking chieftain, and his family as they raid and conquer territories.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(41, 'The Witcher', 'The_Witcher', 'https://www.youtube.com/embed/ndl1W4ltcmg', '2019', 'Geralt of Rivia, a monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(42, 'Narcos', 'Narcos', 'https://www.youtube.com/embed/U7elNhHwgBU', '2015', 'Follows the rise of the cocaine trade in Colombia and the gripping real-life stories of drug lords.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19'),
(43, 'Ozark', 'Ozark', 'https://www.youtube.com/embed/FLn0NB37asE', '2017', 'A financial planner relocates his family to the Ozarks and becomes entangled with dangerous criminal organizations.', 'tv_show', '2025-09-25 04:15:19', '2025-09-25 04:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3ZAwau17vqWXmqc4Qvn5Qfuo2GjCFa8gopGwacox', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 OPR/121.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY1g0emhrOTAzTUw4ZkhzQVl4M2JodllEZWRuVEtWUkJjNjVpbE9jMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758801626);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Naftali', 'naftali1@test.com', NULL, '$2y$12$n6D6QE/VhodrWdZxxO436eY5X4yFEeqrzU2nF/gVkVx3XMa.0V9OO', NULL, '2025-09-25 04:34:02', '2025-09-25 04:34:02'),
(2, 'Budi', 'budi@test.com', NULL, '$2y$12$KaOiA1Tu4uIneDc7eYcChOF9Coxi8o3zMpwxzLzqlZFzYKBEak.jm', NULL, '2025-09-25 04:40:14', '2025-09-25 04:40:14');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_movie_id_foreign` (`movie_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
