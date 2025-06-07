-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-06-07 16:47:18
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `unitrack`
--

-- --------------------------------------------------------

--
-- 資料表結構 `authorizations`
--

CREATE TABLE `authorizations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `authorization_requests`
--

CREATE TABLE `authorization_requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `authorization_requests`
--

INSERT INTO `authorization_requests` (`id`, `student_id`, `email`, `status`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(2, 1, 'teacher', 'pending', NULL, '2025-06-07 10:55:16', '2025-06-07 10:55:16');

-- --------------------------------------------------------

--
-- 資料表結構 `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `block_type` enum('text','image','code','quote') NOT NULL,
  `content` text DEFAULT NULL,
  `block_order` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `blocks`
--

INSERT INTO `blocks` (`id`, `post_id`, `block_type`, `content`, `block_order`, `created_at`) VALUES
(755, 5, 'text', '我的新的文章', 0, '2025-06-07 18:59:42'),
(756, 5, 'text', '<span style=\"background-color: rgba(249, 250, 251, 0.424);\">我的新的文章</span><div><span style=\"background-color: rgba(249, 250, 251, 0.424);\">一個人想著一個人</span></div><div><span style=\"background-color: rgba(249, 250, 251, 0.424);\">能夠去做一些完美的事情</span></div>', 1, '2025-06-07 18:59:42'),
(757, 5, 'image', 'uploads/20250607_125942_68441b9e29095_1749247878343.jpg', 2, '2025-06-07 18:59:42'),
(758, 5, 'text', '<span style=\"background-color: rgba(249, 250, 251, 0.424);\">我的新的文章</span><div><span style=\"background-color: rgba(249, 250, 251, 0.424);\">一個人想著一個人</span></div><div><span style=\"background-color: rgba(249, 250, 251, 0.424);\">能夠去做一些完美的事情</span></div>', 3, '2025-06-07 18:59:42');

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` varchar(7) DEFAULT '#ff69b4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `color`) VALUES
(1, 'A', 1, '#ff69b4'),
(2, '研討會', 1, '#ff69b4');

-- --------------------------------------------------------

--
-- 資料表結構 `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_locked` tinyint(1) DEFAULT 0,
  `is_private` tinyint(1) DEFAULT 0,
  `allow_teacher_view` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `post_date`, `created_at`, `is_locked`, `is_private`, `allow_teacher_view`) VALUES
(5, 1, 1, '我的第一篇文章', '2025-06-07', '2025-06-06 19:44:01', 0, 0, 1),
(30, 1, 1, '新的文張', '0000-00-00', '2025-06-07 16:50:43', 0, 0, 0),
(31, 1, 1, '', '0000-00-00', '2025-06-07 16:51:01', 0, 0, 0),
(32, 1, NULL, '', '2025-06-07', '2025-06-07 17:03:53', 0, 0, 0),
(33, 1, NULL, '', '0000-00-00', '2025-06-07 17:06:29', 0, 0, 0),
(34, 1, NULL, '', '0000-00-00', '2025-06-07 17:35:15', 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `teacher_name`, `comment`, `created_at`) VALUES
(1, 5, '尉老師', '也許你可以考慮看看資訊管理', '2025-06-07 10:33:44');

-- --------------------------------------------------------

--
-- 資料表結構 `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `teacher_authorizations`
--

CREATE TABLE `teacher_authorizations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('student','teacher','admin') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'user', 'user', 'user@unitrack.dev', 'student', '2025-06-07 04:36:09'),
(2, 'teacher', 'teacher', 'teacher@unitrack.dev', 'teacher', '2025-06-06 04:36:09'),
(3, 'admin', 'admin', 'admin@unitrack.dev', 'admin', '2025-06-05 04:36:09'),
(4, 'patty', 'Aa911115', 'alice911115@gmail.com', 'student', '2025-06-07 00:26:33'),
(5, 'teacher2', 'teacher2', 'teacher2@gmail.com', 'teacher', '2025-06-07 00:27:01');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `authorizations`
--
ALTER TABLE `authorizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_authorization` (`student_id`,`teacher_email`);

--
-- 資料表索引 `authorization_requests`
--
ALTER TABLE `authorization_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- 資料表索引 `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`);

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- 資料表索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- 資料表索引 `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tag` (`post_id`,`tag`);

--
-- 資料表索引 `teacher_authorizations`
--
ALTER TABLE `teacher_authorizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_teacher_auth` (`student_id`,`email`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `authorizations`
--
ALTER TABLE `authorizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `authorization_requests`
--
ALTER TABLE `authorization_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=759;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `teacher_authorizations`
--
ALTER TABLE `teacher_authorizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `authorizations`
--
ALTER TABLE `authorizations`
  ADD CONSTRAINT `authorizations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `authorization_requests`
--
ALTER TABLE `authorization_requests`
  ADD CONSTRAINT `fk_auth_requests_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `fk_blocks_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `fk_tags_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `teacher_authorizations`
--
ALTER TABLE `teacher_authorizations`
  ADD CONSTRAINT `teacher_authorizations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
