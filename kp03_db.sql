-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 08:18 AM
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
-- Database: `kp03_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `time`) VALUES
(1, 'E44444', '2024-08-13 17:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `fingerprints`
--

CREATE TABLE `fingerprints` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `fingerprint_id` varchar(255) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fingerprints`
--

INSERT INTO `fingerprints` (`id`, `student_id`, `fingerprint_id`, `reg_date`) VALUES
(132, 'E41220493', '132', '2024-08-14 15:12:54'),
(133, 'E32230095', '133', '2024-08-14 15:34:23'),
(134, 'E42222247', '134', '2024-08-15 01:27:46'),
(135, 'E42222247', '135', '2024-08-15 01:28:02'),
(136, 'E42222247', '136', '2024-08-15 01:30:26'),
(137, 'E31230333', '137', '2024-08-15 01:32:06'),
(138, 'E55555', '138', '2024-08-15 01:37:35'),
(139, 'e20230', '139', '2024-08-15 01:48:33'),
(140, 'E55555', '140', '2024-08-15 01:50:30'),
(141, 'e42243234', '141', '2024-08-15 03:03:38'),
(142, 'e42243234', '142', '2024-08-15 03:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_path`, `upload_time`) VALUES
(1, 'uploads/1723647733__esp32Photo.jpg', '2024-08-14 15:02:13'),
(2, 'uploads/1723647736__esp32Photo.jpg', '2024-08-14 15:02:16'),
(3, 'uploads/1723647739__esp32Photo.jpg', '2024-08-14 15:02:19'),
(4, 'uploads/1723647742__esp32Photo.jpg', '2024-08-14 15:02:22'),
(5, 'uploads/1723647745__esp32Photo.jpg', '2024-08-14 15:02:25'),
(6, 'uploads/1723647748__esp32Photo.jpg', '2024-08-14 15:02:28'),
(7, 'uploads/1723647751__esp32Photo.jpg', '2024-08-14 15:02:31'),
(8, 'uploads/1723647754__esp32Photo.jpg', '2024-08-14 15:02:34'),
(9, 'uploads/1723647757__esp32Photo.jpg', '2024-08-14 15:02:37'),
(10, 'uploads/1723647760__esp32Photo.jpg', '2024-08-14 15:02:40'),
(11, 'uploads/1723647763__esp32Photo.jpg', '2024-08-14 15:02:43'),
(12, 'uploads/1723647766__esp32Photo.jpg', '2024-08-14 15:02:46'),
(13, 'uploads/1723647769__esp32Photo.jpg', '2024-08-14 15:02:49'),
(14, 'uploads/1723647772__esp32Photo.jpg', '2024-08-14 15:02:52'),
(15, 'uploads/1723647775__esp32Photo.jpg', '2024-08-14 15:02:55'),
(16, 'uploads/1723647778__esp32Photo.jpg', '2024-08-14 15:02:58'),
(17, 'uploads/1723647781__esp32Photo.jpg', '2024-08-14 15:03:01'),
(18, 'uploads/1723647784__esp32Photo.jpg', '2024-08-14 15:03:04'),
(19, 'uploads/1723647787__esp32Photo.jpg', '2024-08-14 15:03:07'),
(20, 'uploads/1723647790__esp32Photo.jpg', '2024-08-14 15:03:10'),
(21, 'uploads/1723647793__esp32Photo.jpg', '2024-08-14 15:03:13'),
(22, 'uploads/1723647796__esp32Photo.jpg', '2024-08-14 15:03:16'),
(23, 'uploads/1723647799__esp32Photo.jpg', '2024-08-14 15:03:19'),
(24, 'uploads/1723647802__esp32Photo.jpg', '2024-08-14 15:03:22'),
(25, 'uploads/1723647805__esp32Photo.jpg', '2024-08-14 15:03:25'),
(26, 'uploads/1723647808__esp32Photo.jpg', '2024-08-14 15:03:28'),
(27, 'uploads/1723647811__esp32Photo.jpg', '2024-08-14 15:03:31'),
(28, 'uploads/1723647814__esp32Photo.jpg', '2024-08-14 15:03:34'),
(29, 'uploads/1723647817__esp32Photo.jpg', '2024-08-14 15:03:37'),
(30, 'uploads/1723647820__esp32Photo.jpg', '2024-08-14 15:03:40'),
(31, 'uploads/1723647823__esp32Photo.jpg', '2024-08-14 15:03:43'),
(32, 'uploads/1723647826__esp32Photo.jpg', '2024-08-14 15:03:46'),
(33, 'uploads/1723647829__esp32Photo.jpg', '2024-08-14 15:03:49'),
(34, 'uploads/1723647832__esp32Photo.jpg', '2024-08-14 15:03:52'),
(35, 'uploads/1723647835__esp32Photo.jpg', '2024-08-14 15:03:55'),
(36, 'uploads/1723647838__esp32Photo.jpg', '2024-08-14 15:03:58'),
(37, 'uploads/1723648489__esp32Photo.jpg', '2024-08-14 15:14:49'),
(38, 'uploads/1723648492__esp32Photo.jpg', '2024-08-14 15:14:52'),
(39, 'uploads/1723648495__esp32Photo.jpg', '2024-08-14 15:14:55'),
(40, 'uploads/1723648537__esp32Photo.jpg', '2024-08-14 15:15:37'),
(41, 'uploads/1723648557__esp32Photo.jpg', '2024-08-14 15:15:57'),
(42, 'uploads/1723648577__esp32Photo.jpg', '2024-08-14 15:16:17'),
(43, 'uploads/1723648599__esp32Photo.jpg', '2024-08-14 15:16:39'),
(44, 'uploads/1723648617__esp32Photo.jpg', '2024-08-14 15:16:57'),
(45, 'uploads/1723648637__esp32Photo.jpg', '2024-08-14 15:17:17'),
(46, 'uploads/1723648657__esp32Photo.jpg', '2024-08-14 15:17:37'),
(47, 'uploads/1723648677__esp32Photo.jpg', '2024-08-14 15:17:57'),
(48, 'uploads/1723648697__esp32Photo.jpg', '2024-08-14 15:18:17'),
(49, 'uploads/1723648717__esp32Photo.jpg', '2024-08-14 15:18:37'),
(50, 'uploads/1723648737__esp32Photo.jpg', '2024-08-14 15:18:57'),
(51, 'uploads/1723648757__esp32Photo.jpg', '2024-08-14 15:19:17'),
(52, 'uploads/1723648777__esp32Photo.jpg', '2024-08-14 15:19:37'),
(53, 'uploads/1723648797__esp32Photo.jpg', '2024-08-14 15:19:57'),
(54, 'uploads/1723648817__esp32Photo.jpg', '2024-08-14 15:20:17'),
(55, 'uploads/1723648837__esp32Photo.jpg', '2024-08-14 15:20:37'),
(56, 'uploads/1723648857__esp32Photo.jpg', '2024-08-14 15:20:57'),
(57, 'uploads/1723648877__esp32Photo.jpg', '2024-08-14 15:21:17'),
(58, 'uploads/1723648897__esp32Photo.jpg', '2024-08-14 15:21:37'),
(59, 'uploads/1723648917__esp32Photo.jpg', '2024-08-14 15:21:57'),
(60, 'uploads/1723648937__esp32Photo.jpg', '2024-08-14 15:22:17'),
(61, 'uploads/1723648957__esp32Photo.jpg', '2024-08-14 15:22:37'),
(62, 'uploads/1723648977__esp32Photo.jpg', '2024-08-14 15:22:57'),
(63, 'uploads/1723648997__esp32Photo.jpg', '2024-08-14 15:23:17'),
(64, 'uploads/1723649017__esp32Photo.jpg', '2024-08-14 15:23:37'),
(65, 'uploads/1723649037__esp32Photo.jpg', '2024-08-14 15:23:57'),
(66, 'uploads/1723649057__esp32Photo.jpg', '2024-08-14 15:24:17'),
(67, 'uploads/1723649077__esp32Photo.jpg', '2024-08-14 15:24:37'),
(68, 'uploads/1723649097__esp32Photo.jpg', '2024-08-14 15:24:57'),
(69, 'uploads/1723649117__esp32Photo.jpg', '2024-08-14 15:25:17'),
(70, 'uploads/1723649137__esp32Photo.jpg', '2024-08-14 15:25:37'),
(71, 'uploads/1723649157__esp32Photo.jpg', '2024-08-14 15:25:57'),
(72, 'uploads/1723649177__esp32Photo.jpg', '2024-08-14 15:26:17'),
(73, 'uploads/1723649197__esp32Photo.jpg', '2024-08-14 15:26:37'),
(74, 'uploads/1723649217__esp32Photo.jpg', '2024-08-14 15:26:57'),
(75, 'uploads/1723649237__esp32Photo.jpg', '2024-08-14 15:27:17'),
(76, 'uploads/1723649257__esp32Photo.jpg', '2024-08-14 15:27:37'),
(77, 'uploads/1723649277__esp32Photo.jpg', '2024-08-14 15:27:57'),
(78, 'uploads/1723649297__esp32Photo.jpg', '2024-08-14 15:28:17'),
(79, 'uploads/1723649317__esp32Photo.jpg', '2024-08-14 15:28:37'),
(80, 'uploads/1723649337__esp32Photo.jpg', '2024-08-14 15:28:57'),
(81, 'uploads/1723649357__esp32Photo.jpg', '2024-08-14 15:29:17'),
(82, 'uploads/1723649377__esp32Photo.jpg', '2024-08-14 15:29:37'),
(83, 'uploads/1723649397__esp32Photo.jpg', '2024-08-14 15:29:57'),
(84, 'uploads/1723649417__esp32Photo.jpg', '2024-08-14 15:30:17'),
(85, 'uploads/1723649437__esp32Photo.jpg', '2024-08-14 15:30:37'),
(86, 'uploads/1723649457__esp32Photo.jpg', '2024-08-14 15:30:57'),
(87, 'uploads/1723649477__esp32Photo.jpg', '2024-08-14 15:31:17'),
(88, 'uploads/1723649784__esp32Photo.jpg', '2024-08-14 15:36:24'),
(89, 'uploads/1723685136__esp32Photo.jpg', '2024-08-15 01:25:36'),
(90, 'uploads/1723685165__esp32Photo.jpg', '2024-08-15 01:26:05'),
(91, 'uploads/1723685180__esp32Photo.jpg', '2024-08-15 01:26:20'),
(92, 'uploads/1723685195__esp32Photo.jpg', '2024-08-15 01:26:35'),
(93, 'uploads/1723685210__esp32Photo.jpg', '2024-08-15 01:26:50'),
(94, 'uploads/1723685225__esp32Photo.jpg', '2024-08-15 01:27:05'),
(95, 'uploads/1723685240__esp32Photo.jpg', '2024-08-15 01:27:20'),
(96, 'uploads/1723685254__esp32Photo.jpg', '2024-08-15 01:27:34'),
(97, 'uploads/1723685269__esp32Photo.jpg', '2024-08-15 01:27:49'),
(98, 'uploads/1723685284__esp32Photo.jpg', '2024-08-15 01:28:04'),
(99, 'uploads/1723685315__esp32Photo.jpg', '2024-08-15 01:28:35'),
(100, 'uploads/1723685330__esp32Photo.jpg', '2024-08-15 01:28:50'),
(101, 'uploads/1723685345__esp32Photo.jpg', '2024-08-15 01:29:05'),
(102, 'uploads/1723685359__esp32Photo.jpg', '2024-08-15 01:29:19'),
(103, 'uploads/1723685385__esp32Photo.jpg', '2024-08-15 01:29:45'),
(104, 'uploads/1723685398__esp32Photo.jpg', '2024-08-15 01:29:58'),
(105, 'uploads/1723685413__esp32Photo.jpg', '2024-08-15 01:30:13'),
(106, 'uploads/1723685428__esp32Photo.jpg', '2024-08-15 01:30:28'),
(107, 'uploads/1723685443__esp32Photo.jpg', '2024-08-15 01:30:43'),
(108, 'uploads/1723685458__esp32Photo.jpg', '2024-08-15 01:30:58'),
(109, 'uploads/1723685473__esp32Photo.jpg', '2024-08-15 01:31:13'),
(110, 'uploads/1723685488__esp32Photo.jpg', '2024-08-15 01:31:28'),
(111, 'uploads/1723685503__esp32Photo.jpg', '2024-08-15 01:31:43'),
(112, 'uploads/1723685518__esp32Photo.jpg', '2024-08-15 01:31:58'),
(113, 'uploads/1723685533__esp32Photo.jpg', '2024-08-15 01:32:13'),
(114, 'uploads/1723685548__esp32Photo.jpg', '2024-08-15 01:32:28'),
(115, 'uploads/1723685563__esp32Photo.jpg', '2024-08-15 01:32:43'),
(116, 'uploads/1723685578__esp32Photo.jpg', '2024-08-15 01:32:58'),
(117, 'uploads/1723685593__esp32Photo.jpg', '2024-08-15 01:33:13'),
(118, 'uploads/1723685608__esp32Photo.jpg', '2024-08-15 01:33:28'),
(119, 'uploads/1723685623__esp32Photo.jpg', '2024-08-15 01:33:43'),
(120, 'uploads/1723685638__esp32Photo.jpg', '2024-08-15 01:33:58'),
(121, 'uploads/1723685653__esp32Photo.jpg', '2024-08-15 01:34:13'),
(122, 'uploads/1723685668__esp32Photo.jpg', '2024-08-15 01:34:28'),
(123, 'uploads/1723685683__esp32Photo.jpg', '2024-08-15 01:34:43'),
(124, 'uploads/1723685698__esp32Photo.jpg', '2024-08-15 01:34:58'),
(125, 'uploads/1723685713__esp32Photo.jpg', '2024-08-15 01:35:13'),
(126, 'uploads/1723685728__esp32Photo.jpg', '2024-08-15 01:35:28'),
(127, 'uploads/1723685744__esp32Photo.jpg', '2024-08-15 01:35:44'),
(128, 'uploads/1723685758__esp32Photo.jpg', '2024-08-15 01:35:58'),
(129, 'uploads/1723685773__esp32Photo.jpg', '2024-08-15 01:36:13'),
(130, 'uploads/1723685788__esp32Photo.jpg', '2024-08-15 01:36:28'),
(131, 'uploads/1723685803__esp32Photo.jpg', '2024-08-15 01:36:43'),
(132, 'uploads/1723685818__esp32Photo.jpg', '2024-08-15 01:36:58'),
(133, 'uploads/1723685833__esp32Photo.jpg', '2024-08-15 01:37:13'),
(134, 'uploads/1723685848__esp32Photo.jpg', '2024-08-15 01:37:28'),
(135, 'uploads/1723685863__esp32Photo.jpg', '2024-08-15 01:37:43'),
(136, 'uploads/1723685880__esp32Photo.jpg', '2024-08-15 01:38:00'),
(137, 'uploads/1723685893__esp32Photo.jpg', '2024-08-15 01:38:13'),
(138, 'uploads/1723685908__esp32Photo.jpg', '2024-08-15 01:38:28'),
(139, 'uploads/1723686395__esp32Photo.jpg', '2024-08-15 01:46:35'),
(140, 'uploads/1723686410__esp32Photo.jpg', '2024-08-15 01:46:50'),
(141, 'uploads/1723686425__esp32Photo.jpg', '2024-08-15 01:47:05'),
(142, 'uploads/1723686440__esp32Photo.jpg', '2024-08-15 01:47:20'),
(143, 'uploads/1723686455__esp32Photo.jpg', '2024-08-15 01:47:35'),
(144, 'uploads/1723686470__esp32Photo.jpg', '2024-08-15 01:47:50'),
(145, 'uploads/1723686485__esp32Photo.jpg', '2024-08-15 01:48:05'),
(146, 'uploads/1723686500__esp32Photo.jpg', '2024-08-15 01:48:20'),
(147, 'uploads/1723686515__esp32Photo.jpg', '2024-08-15 01:48:35'),
(148, 'uploads/1723686530__esp32Photo.jpg', '2024-08-15 01:48:50'),
(149, 'uploads/1723686545__esp32Photo.jpg', '2024-08-15 01:49:05'),
(150, 'uploads/1723686560__esp32Photo.jpg', '2024-08-15 01:49:20'),
(151, 'uploads/1723686575__esp32Photo.jpg', '2024-08-15 01:49:35'),
(152, 'uploads/1723686590__esp32Photo.jpg', '2024-08-15 01:49:50'),
(153, 'uploads/1723686605__esp32Photo.jpg', '2024-08-15 01:50:05'),
(154, 'uploads/1723686621__esp32Photo.jpg', '2024-08-15 01:50:21'),
(155, 'uploads/1723686635__esp32Photo.jpg', '2024-08-15 01:50:35'),
(156, 'uploads/1723686650__esp32Photo.jpg', '2024-08-15 01:50:50'),
(157, 'uploads/1723686665__esp32Photo.jpg', '2024-08-15 01:51:05'),
(158, 'uploads/1723686680__esp32Photo.jpg', '2024-08-15 01:51:20'),
(159, 'uploads/1723686695__esp32Photo.jpg', '2024-08-15 01:51:35'),
(160, 'uploads/1723686710__esp32Photo.jpg', '2024-08-15 01:51:50'),
(161, 'uploads/1723686725__esp32Photo.jpg', '2024-08-15 01:52:05'),
(162, 'uploads/1723686740__esp32Photo.jpg', '2024-08-15 01:52:20'),
(163, 'uploads/1723686755__esp32Photo.jpg', '2024-08-15 01:52:35'),
(164, 'uploads/1723686770__esp32Photo.jpg', '2024-08-15 01:52:50'),
(165, 'uploads/1723686785__esp32Photo.jpg', '2024-08-15 01:53:05'),
(166, 'uploads/1723686800__esp32Photo.jpg', '2024-08-15 01:53:20'),
(167, 'uploads/1723686815__esp32Photo.jpg', '2024-08-15 01:53:35'),
(168, 'uploads/1723686830__esp32Photo.jpg', '2024-08-15 01:53:50'),
(169, 'uploads/1723686845__esp32Photo.jpg', '2024-08-15 01:54:05'),
(170, 'uploads/1723686860__esp32Photo.jpg', '2024-08-15 01:54:20'),
(171, 'uploads/1723686875__esp32Photo.jpg', '2024-08-15 01:54:35'),
(172, 'uploads/1723686890__esp32Photo.jpg', '2024-08-15 01:54:50'),
(173, 'uploads/1723686905__esp32Photo.jpg', '2024-08-15 01:55:05'),
(174, 'uploads/1723686961__esp32Photo.jpg', '2024-08-15 01:56:01'),
(175, 'uploads/1723686976__esp32Photo.jpg', '2024-08-15 01:56:16'),
(176, 'uploads/1723686991__esp32Photo.jpg', '2024-08-15 01:56:31'),
(177, 'uploads/1723687006__esp32Photo.jpg', '2024-08-15 01:56:46'),
(178, 'uploads/1723687021__esp32Photo.jpg', '2024-08-15 01:57:01'),
(179, 'uploads/1723687036__esp32Photo.jpg', '2024-08-15 01:57:16'),
(180, 'uploads/1723687051__esp32Photo.jpg', '2024-08-15 01:57:31'),
(181, 'uploads/1723687066__esp32Photo.jpg', '2024-08-15 01:57:46'),
(182, 'uploads/1723687081__esp32Photo.jpg', '2024-08-15 01:58:01'),
(183, 'uploads/1723687096__esp32Photo.jpg', '2024-08-15 01:58:16'),
(184, 'uploads/1723687112__esp32Photo.jpg', '2024-08-15 01:58:32'),
(185, 'uploads/1723687126__esp32Photo.jpg', '2024-08-15 01:58:46'),
(186, 'uploads/1723687141__esp32Photo.jpg', '2024-08-15 01:59:01'),
(187, 'uploads/1723687156__esp32Photo.jpg', '2024-08-15 01:59:16'),
(188, 'uploads/1723687173__esp32Photo.jpg', '2024-08-15 01:59:33'),
(189, 'uploads/1723687187__esp32Photo.jpg', '2024-08-15 01:59:47'),
(190, 'uploads/1723687202__esp32Photo.jpg', '2024-08-15 02:00:02'),
(191, 'uploads/1723687218__esp32Photo.jpg', '2024-08-15 02:00:18'),
(192, 'uploads/1723687231__esp32Photo.jpg', '2024-08-15 02:00:31'),
(193, 'uploads/1723687247__esp32Photo.jpg', '2024-08-15 02:00:47'),
(194, 'uploads/1723687262__esp32Photo.jpg', '2024-08-15 02:01:02'),
(195, 'uploads/1723687277__esp32Photo.jpg', '2024-08-15 02:01:17'),
(196, 'uploads/1723687293__esp32Photo.jpg', '2024-08-15 02:01:33'),
(197, 'uploads/1723687306__esp32Photo.jpg', '2024-08-15 02:01:46'),
(198, 'uploads/1723687530__esp32Photo.jpg', '2024-08-15 02:05:30'),
(199, 'uploads/1723687544__esp32Photo.jpg', '2024-08-15 02:05:44'),
(200, 'uploads/1723687560__esp32Photo.jpg', '2024-08-15 02:06:00'),
(201, 'uploads/1723687574__esp32Photo.jpg', '2024-08-15 02:06:14'),
(202, 'uploads/1723687589__esp32Photo.jpg', '2024-08-15 02:06:29'),
(203, 'uploads/1723687605__esp32Photo.jpg', '2024-08-15 02:06:45'),
(204, 'uploads/1723687619__esp32Photo.jpg', '2024-08-15 02:06:59'),
(205, 'uploads/1723687635__esp32Photo.jpg', '2024-08-15 02:07:15'),
(206, 'uploads/1723687649__esp32Photo.jpg', '2024-08-15 02:07:29'),
(207, 'uploads/1723687664__esp32Photo.jpg', '2024-08-15 02:07:44'),
(208, 'uploads/1723687679__esp32Photo.jpg', '2024-08-15 02:07:59'),
(209, 'uploads/1723687694__esp32Photo.jpg', '2024-08-15 02:08:14'),
(210, 'uploads/1723687709__esp32Photo.jpg', '2024-08-15 02:08:29'),
(211, 'uploads/1723687727__esp32Photo.jpg', '2024-08-15 02:08:47'),
(212, 'uploads/1723687742__esp32Photo.jpg', '2024-08-15 02:09:02'),
(213, 'uploads/1723687757__esp32Photo.jpg', '2024-08-15 02:09:17'),
(214, 'uploads/1723687769__esp32Photo.jpg', '2024-08-15 02:09:29'),
(215, 'uploads/1723687784__esp32Photo.jpg', '2024-08-15 02:09:44'),
(216, 'uploads/1723687799__esp32Photo.jpg', '2024-08-15 02:09:59'),
(217, 'uploads/1723687814__esp32Photo.jpg', '2024-08-15 02:10:14'),
(218, 'uploads/1723687829__esp32Photo.jpg', '2024-08-15 02:10:29'),
(219, 'uploads/1723687845__esp32Photo.jpg', '2024-08-15 02:10:45'),
(220, 'uploads/1723687859__esp32Photo.jpg', '2024-08-15 02:10:59'),
(221, 'uploads/1723687874__esp32Photo.jpg', '2024-08-15 02:11:14'),
(222, 'uploads/1723687889__esp32Photo.jpg', '2024-08-15 02:11:29'),
(223, 'uploads/1723687904__esp32Photo.jpg', '2024-08-15 02:11:44'),
(224, 'uploads/1723687919__esp32Photo.jpg', '2024-08-15 02:11:59'),
(225, 'uploads/1723687934__esp32Photo.jpg', '2024-08-15 02:12:14'),
(226, 'uploads/1723687949__esp32Photo.jpg', '2024-08-15 02:12:29'),
(227, 'uploads/1723687964__esp32Photo.jpg', '2024-08-15 02:12:44'),
(228, 'uploads/1723687979__esp32Photo.jpg', '2024-08-15 02:12:59'),
(229, 'uploads/1723687995__esp32Photo.jpg', '2024-08-15 02:13:15'),
(230, 'uploads/1723688009__esp32Photo.jpg', '2024-08-15 02:13:29'),
(231, 'uploads/1723688025__esp32Photo.jpg', '2024-08-15 02:13:45'),
(232, 'uploads/1723688039__esp32Photo.jpg', '2024-08-15 02:13:59'),
(233, 'uploads/1723688054__esp32Photo.jpg', '2024-08-15 02:14:14'),
(234, 'uploads/1723688070__esp32Photo.jpg', '2024-08-15 02:14:30'),
(235, 'uploads/1723688084__esp32Photo.jpg', '2024-08-15 02:14:44'),
(236, 'uploads/1723688100__esp32Photo.jpg', '2024-08-15 02:15:00'),
(237, 'uploads/1723688115__esp32Photo.jpg', '2024-08-15 02:15:15'),
(238, 'uploads/1723688129__esp32Photo.jpg', '2024-08-15 02:15:29'),
(239, 'uploads/1723688145__esp32Photo.jpg', '2024-08-15 02:15:45'),
(240, 'uploads/1723688159__esp32Photo.jpg', '2024-08-15 02:15:59'),
(241, 'uploads/1723688174__esp32Photo.jpg', '2024-08-15 02:16:14'),
(242, 'uploads/1723688189__esp32Photo.jpg', '2024-08-15 02:16:29'),
(243, 'uploads/1723688205__esp32Photo.jpg', '2024-08-15 02:16:45'),
(244, 'uploads/1723688219__esp32Photo.jpg', '2024-08-15 02:16:59'),
(245, 'uploads/1723688234__esp32Photo.jpg', '2024-08-15 02:17:14'),
(246, 'uploads/1723688250__esp32Photo.jpg', '2024-08-15 02:17:30'),
(247, 'uploads/1723688264__esp32Photo.jpg', '2024-08-15 02:17:44'),
(248, 'uploads/1723688280__esp32Photo.jpg', '2024-08-15 02:18:00'),
(249, 'uploads/1723688294__esp32Photo.jpg', '2024-08-15 02:18:14'),
(250, 'uploads/1723688310__esp32Photo.jpg', '2024-08-15 02:18:30'),
(251, 'uploads/1723688325__esp32Photo.jpg', '2024-08-15 02:18:45'),
(252, 'uploads/1723688340__esp32Photo.jpg', '2024-08-15 02:19:00'),
(253, 'uploads/1723688354__esp32Photo.jpg', '2024-08-15 02:19:14'),
(254, 'uploads/1723688369__esp32Photo.jpg', '2024-08-15 02:19:29'),
(255, 'uploads/1723688384__esp32Photo.jpg', '2024-08-15 02:19:44'),
(256, 'uploads/1723688399__esp32Photo.jpg', '2024-08-15 02:19:59'),
(257, 'uploads/1723688414__esp32Photo.jpg', '2024-08-15 02:20:14'),
(258, 'uploads/1723688430__esp32Photo.jpg', '2024-08-15 02:20:30'),
(259, 'uploads/1723688444__esp32Photo.jpg', '2024-08-15 02:20:44'),
(260, 'uploads/1723688459__esp32Photo.jpg', '2024-08-15 02:20:59'),
(261, 'uploads/1723688474__esp32Photo.jpg', '2024-08-15 02:21:14'),
(262, 'uploads/1723690664__esp32Photo.jpg', '2024-08-15 02:57:44'),
(263, 'uploads/1723690703__esp32Photo.jpg', '2024-08-15 02:58:23'),
(264, 'uploads/1723690730__esp32Photo.jpg', '2024-08-15 02:58:50'),
(265, 'uploads/1723690745__esp32Photo.jpg', '2024-08-15 02:59:05'),
(266, 'uploads/1723690760__esp32Photo.jpg', '2024-08-15 02:59:20'),
(267, 'uploads/1723690775__esp32Photo.jpg', '2024-08-15 02:59:35'),
(268, 'uploads/1723690790__esp32Photo.jpg', '2024-08-15 02:59:50'),
(269, 'uploads/1723690805__esp32Photo.jpg', '2024-08-15 03:00:05'),
(270, 'uploads/1723690820__esp32Photo.jpg', '2024-08-15 03:00:20'),
(271, 'uploads/1723690835__esp32Photo.jpg', '2024-08-15 03:00:35'),
(272, 'uploads/1723690849__esp32Photo.jpg', '2024-08-15 03:00:49'),
(273, 'uploads/1723690865__esp32Photo.jpg', '2024-08-15 03:01:05'),
(274, 'uploads/1723690880__esp32Photo.jpg', '2024-08-15 03:01:20'),
(275, 'uploads/1723690895__esp32Photo.jpg', '2024-08-15 03:01:35'),
(276, 'uploads/1723690910__esp32Photo.jpg', '2024-08-15 03:01:50'),
(277, 'uploads/1723690925__esp32Photo.jpg', '2024-08-15 03:02:05'),
(278, 'uploads/1723690940__esp32Photo.jpg', '2024-08-15 03:02:20'),
(279, 'uploads/1723690956__esp32Photo.jpg', '2024-08-15 03:02:36'),
(280, 'uploads/1723690973__esp32Photo.jpg', '2024-08-15 03:02:53'),
(281, 'uploads/1723690985__esp32Photo.jpg', '2024-08-15 03:03:05'),
(282, 'uploads/1723691000__esp32Photo.jpg', '2024-08-15 03:03:20'),
(283, 'uploads/1723691015__esp32Photo.jpg', '2024-08-15 03:03:35'),
(284, 'uploads/1723691030__esp32Photo.jpg', '2024-08-15 03:03:50'),
(285, 'uploads/1723691045__esp32Photo.jpg', '2024-08-15 03:04:05'),
(286, 'uploads/1723691059__esp32Photo.jpg', '2024-08-15 03:04:19'),
(287, 'uploads/1723691075__esp32Photo.jpg', '2024-08-15 03:04:35'),
(288, 'uploads/1723691090__esp32Photo.jpg', '2024-08-15 03:04:50'),
(289, 'uploads/1723691104__esp32Photo.jpg', '2024-08-15 03:05:04'),
(290, 'uploads/1723691121__esp32Photo.jpg', '2024-08-15 03:05:21'),
(291, 'uploads/1723691135__esp32Photo.jpg', '2024-08-15 03:05:35'),
(292, 'uploads/1723691150__esp32Photo.jpg', '2024-08-15 03:05:50'),
(293, 'uploads/1723691165__esp32Photo.jpg', '2024-08-15 03:06:05'),
(294, 'uploads/1723691180__esp32Photo.jpg', '2024-08-15 03:06:20'),
(295, 'uploads/1723691195__esp32Photo.jpg', '2024-08-15 03:06:35'),
(296, 'uploads/1723691210__esp32Photo.jpg', '2024-08-15 03:06:50'),
(297, 'uploads/1723691225__esp32Photo.jpg', '2024-08-15 03:07:05'),
(298, 'uploads/1723691240__esp32Photo.jpg', '2024-08-15 03:07:20'),
(299, 'uploads/1723691255__esp32Photo.jpg', '2024-08-15 03:07:35'),
(300, 'uploads/1723691270__esp32Photo.jpg', '2024-08-15 03:07:50'),
(301, 'uploads/1723691285__esp32Photo.jpg', '2024-08-15 03:08:05'),
(302, 'uploads/1723691300__esp32Photo.jpg', '2024-08-15 03:08:20'),
(303, 'uploads/1723691315__esp32Photo.jpg', '2024-08-15 03:08:35'),
(304, 'uploads/1723691330__esp32Photo.jpg', '2024-08-15 03:08:50'),
(305, 'uploads/1723691345__esp32Photo.jpg', '2024-08-15 03:09:05'),
(306, 'uploads/1723691360__esp32Photo.jpg', '2024-08-15 03:09:20'),
(307, 'uploads/1723691375__esp32Photo.jpg', '2024-08-15 03:09:35'),
(308, 'uploads/1723691390__esp32Photo.jpg', '2024-08-15 03:09:50'),
(309, 'uploads/1723691405__esp32Photo.jpg', '2024-08-15 03:10:05'),
(310, 'uploads/1723691420__esp32Photo.jpg', '2024-08-15 03:10:20'),
(311, 'uploads/1723691435__esp32Photo.jpg', '2024-08-15 03:10:35'),
(312, 'uploads/1723691450__esp32Photo.jpg', '2024-08-15 03:10:50'),
(313, 'uploads/1723691465__esp32Photo.jpg', '2024-08-15 03:11:05'),
(314, 'uploads/1723691480__esp32Photo.jpg', '2024-08-15 03:11:20'),
(315, 'uploads/1723691495__esp32Photo.jpg', '2024-08-15 03:11:35'),
(316, 'uploads/1723691510__esp32Photo.jpg', '2024-08-15 03:11:50'),
(317, 'uploads/1723691526__esp32Photo.jpg', '2024-08-15 03:12:06'),
(318, 'uploads/1723691540__esp32Photo.jpg', '2024-08-15 03:12:20'),
(319, 'uploads/1723691556__esp32Photo.jpg', '2024-08-15 03:12:36'),
(320, 'uploads/1723691570__esp32Photo.jpg', '2024-08-15 03:12:50'),
(321, 'uploads/1723691586__esp32Photo.jpg', '2024-08-15 03:13:06'),
(322, 'uploads/1723691601__esp32Photo.jpg', '2024-08-15 03:13:21'),
(323, 'uploads/1723691617__esp32Photo.jpg', '2024-08-15 03:13:37'),
(324, 'uploads/1723691630__esp32Photo.jpg', '2024-08-15 03:13:50'),
(325, 'uploads/1723691646__esp32Photo.jpg', '2024-08-15 03:14:06'),
(326, 'uploads/1723691662__esp32Photo.jpg', '2024-08-15 03:14:22'),
(327, 'uploads/1723691676__esp32Photo.jpg', '2024-08-15 03:14:36'),
(328, 'uploads/1723691690__esp32Photo.jpg', '2024-08-15 03:14:50'),
(329, 'uploads/1723691705__esp32Photo.jpg', '2024-08-15 03:15:05'),
(330, 'uploads/1723691720__esp32Photo.jpg', '2024-08-15 03:15:20'),
(331, 'uploads/1723691735__esp32Photo.jpg', '2024-08-15 03:15:35'),
(332, 'uploads/1723691750__esp32Photo.jpg', '2024-08-15 03:15:50'),
(333, 'uploads/1723691765__esp32Photo.jpg', '2024-08-15 03:16:05'),
(334, 'uploads/1723691780__esp32Photo.jpg', '2024-08-15 03:16:20'),
(335, 'uploads/1723691798__esp32Photo.jpg', '2024-08-15 03:16:38'),
(336, 'uploads/1723691810__esp32Photo.jpg', '2024-08-15 03:16:50'),
(337, 'uploads/1723691826__esp32Photo.jpg', '2024-08-15 03:17:06'),
(338, 'uploads/1723691840__esp32Photo.jpg', '2024-08-15 03:17:20'),
(339, 'uploads/1723691855__esp32Photo.jpg', '2024-08-15 03:17:35'),
(340, 'uploads/1723691870__esp32Photo.jpg', '2024-08-15 03:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `fingerprint_id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('SUCCESS','FAILURE') NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `fingerprint_id`, `student_id`, `attempt_time`, `status`, `message`) VALUES
(1, 80, 'E44444', '2024-08-13 17:03:17', 'SUCCESS', 'Registration successful'),
(2, 81, 'E44444', '2024-08-13 17:03:41', 'SUCCESS', 'Registration successful'),
(3, 82, 'E5555533', '2024-08-13 17:11:08', 'SUCCESS', 'Registration successful'),
(4, 83, 'E5555533', '2024-08-13 17:11:35', 'SUCCESS', 'Registration successful'),
(5, 84, 'E55555', '2024-08-13 17:26:38', 'SUCCESS', 'Registration successful'),
(6, 85, 'asdasd', '2024-08-13 17:27:42', 'SUCCESS', 'Registration successful'),
(7, 86, 'asdasd', '2024-08-13 17:28:16', 'SUCCESS', 'Registration successful'),
(8, 87, 'asdasd', '2024-08-13 17:28:38', 'SUCCESS', 'Registration successful'),
(9, 88, 'asdasd', '2024-08-13 17:28:57', 'SUCCESS', 'Registration successful'),
(10, 89, 'E44445', '2024-08-13 17:38:22', 'SUCCESS', 'Registration successful'),
(11, 90, 'E44445', '2024-08-13 17:38:49', 'SUCCESS', 'Registration successful'),
(12, 91, 'E44445', '2024-08-13 17:39:24', 'SUCCESS', 'Registration successful'),
(13, 92, 'E44445', '2024-08-13 17:39:49', 'SUCCESS', 'Registration successful'),
(14, 93, 'E44445', '2024-08-13 17:40:19', 'SUCCESS', 'Registration successful'),
(15, 94, 'E44445', '2024-08-13 18:52:07', 'SUCCESS', 'Registration successful'),
(16, 95, 'E44445', '2024-08-13 18:52:34', 'SUCCESS', 'Registration successful'),
(17, 96, 'E44445', '2024-08-13 18:59:39', 'SUCCESS', 'Registration successful'),
(18, 97, 'E55555', '2024-08-13 19:02:47', 'SUCCESS', 'Registration successful'),
(19, 98, 'E55555', '2024-08-13 19:03:22', 'SUCCESS', 'Registration successful'),
(20, 99, 'E44445', '2024-08-13 19:06:21', 'SUCCESS', 'Registration successful'),
(21, 100, 'E44445', '2024-08-13 19:10:38', 'SUCCESS', 'Registration successful'),
(22, 101, 'E44445', '2024-08-13 19:11:05', 'SUCCESS', 'Registration successful'),
(23, 102, 'E44445', '2024-08-13 19:18:06', 'SUCCESS', 'Registration successful'),
(24, 103, 'E44445', '2024-08-13 19:20:51', 'SUCCESS', 'Registration successful'),
(25, 104, 'asdasd', '2024-08-13 19:26:01', 'SUCCESS', 'Registration successful'),
(26, 105, 'E4444411', '2024-08-13 19:33:05', 'SUCCESS', 'Registration successful'),
(27, 106, 'E4444411', '2024-08-13 19:33:33', 'SUCCESS', 'Registration successful'),
(28, 107, '1212', '2024-08-14 02:09:04', 'SUCCESS', 'Registration successful'),
(29, 108, '1212', '2024-08-14 02:09:38', 'SUCCESS', 'Registration successful'),
(30, 109, 'E44445', '2024-08-14 03:54:51', 'SUCCESS', 'Registration successful'),
(31, 110, 'E55555', '2024-08-14 03:56:56', 'SUCCESS', 'Registration successful'),
(32, 111, 'E55555', '2024-08-14 03:57:23', 'SUCCESS', 'Registration successful'),
(33, 112, 'qq', '2024-08-14 04:22:35', 'SUCCESS', 'Registration successful'),
(34, 113, 'E55555', '2024-08-14 04:23:40', 'SUCCESS', 'Registration successful'),
(35, 114, 'E4444411', '2024-08-14 04:31:12', 'SUCCESS', 'Registration successful'),
(36, 115, 'E4444411', '2024-08-14 04:36:24', 'SUCCESS', 'Registration successful'),
(37, 116, 'E4444411', '2024-08-14 04:36:57', 'SUCCESS', 'Registration successful'),
(38, 117, 'E4444411', '2024-08-14 04:37:22', 'SUCCESS', 'Registration successful'),
(39, 118, 'E4444411', '2024-08-14 04:38:28', 'SUCCESS', 'Registration successful'),
(40, 119, 'iuhiuh', '2024-08-14 04:58:45', 'SUCCESS', 'Registration successful'),
(41, 120, 'dada', '2024-08-14 05:14:16', 'SUCCESS', 'Registration successful'),
(42, 121, '13123', '2024-08-14 05:26:39', 'SUCCESS', 'Registration successful'),
(43, 122, 'E55555', '2024-08-14 05:33:54', 'SUCCESS', 'Registration successful'),
(44, 123, 'E55555', '2024-08-14 05:45:23', 'SUCCESS', 'Registration successful'),
(45, 124, 'E55555', '2024-08-14 06:10:26', 'SUCCESS', 'Registration successful'),
(46, 1, 'E55555', '2024-08-14 06:27:44', 'SUCCESS', 'Registration successful'),
(47, 108, 'E44444', '2024-08-14 07:04:30', 'SUCCESS', 'Registration successful'),
(48, 127, 'E5555533', '2024-08-14 07:06:57', 'SUCCESS', 'Registration successful'),
(49, 128, 'asda', '2024-08-14 08:18:52', 'SUCCESS', 'Registration successful'),
(50, 129, 'asda', '2024-08-14 08:23:40', 'SUCCESS', 'Register and login successful'),
(51, 129, 'asda', '2024-08-14 08:24:24', 'SUCCESS', 'Register and login successful'),
(52, 129, 'adad2', '2024-08-14 08:25:03', 'SUCCESS', 'Registration successful'),
(53, 130, 'adad2', '2024-08-14 08:25:20', 'SUCCESS', 'Register and login successful'),
(54, 130, 'dfg', '2024-08-14 08:36:39', 'SUCCESS', 'Registration successful'),
(55, 131, 'dfg', '2024-08-14 08:36:55', 'SUCCESS', 'Register and login successful'),
(56, 131, 'dfg', '2024-08-14 08:37:51', 'SUCCESS', 'Register and login successful'),
(57, 131, 'E32230095', '2024-08-14 08:42:21', 'SUCCESS', 'Registration successful'),
(58, 132, 'E32230095', '2024-08-14 08:42:37', 'SUCCESS', 'Register and login successful'),
(59, 132, 'E32230095', '2024-08-14 08:55:33', 'SUCCESS', 'Register and login successful'),
(60, 132, 'E32230095', '2024-08-14 12:44:57', 'SUCCESS', 'Register and login successful'),
(61, 132, 'E41220493', '2024-08-14 15:12:54', 'SUCCESS', 'Registration successful'),
(62, 133, 'E41220493', '2024-08-14 15:13:14', 'SUCCESS', 'Register and login successful'),
(63, 133, 'E32230095', '2024-08-14 15:34:23', 'SUCCESS', 'Registration successful'),
(64, 134, 'E32230095', '2024-08-14 15:34:51', 'SUCCESS', 'Register and login successful'),
(65, 134, 'E32230095', '2024-08-14 15:36:25', 'SUCCESS', 'Register and login successful'),
(66, 134, 'E42222247', '2024-08-15 01:27:46', 'SUCCESS', 'Registration successful'),
(67, 135, 'E42222247', '2024-08-15 01:28:02', 'SUCCESS', 'Registration successful'),
(68, 136, 'E42222247', '2024-08-15 01:30:26', 'SUCCESS', 'Registration successful'),
(69, 137, 'E42222247', '2024-08-15 01:30:46', 'SUCCESS', 'Register and login successful'),
(70, 137, 'E31230333', '2024-08-15 01:32:06', 'SUCCESS', 'Registration successful'),
(71, 138, 'E31230333', '2024-08-15 01:32:26', 'SUCCESS', 'Register and login successful'),
(72, 138, 'E55555', '2024-08-15 01:37:35', 'SUCCESS', 'Registration successful'),
(73, 139, 'E55555', '2024-08-15 01:37:55', 'SUCCESS', 'Register and login successful'),
(74, 139, 'e20230', '2024-08-15 01:48:33', 'SUCCESS', 'Registration successful'),
(75, 140, 'e20230', '2024-08-15 01:49:05', 'SUCCESS', 'Register and login successful'),
(76, 140, 'E55555', '2024-08-15 01:50:30', 'SUCCESS', 'Registration successful'),
(77, 141, 'E55555', '2024-08-15 01:50:51', 'SUCCESS', 'Register and login successful'),
(78, 141, 'E55555', '2024-08-15 02:05:37', 'SUCCESS', 'Register and login successful'),
(79, 141, 'E55555', '2024-08-15 02:59:31', 'SUCCESS', 'Register and login successful'),
(80, 141, 'e42243234', '2024-08-15 03:03:38', 'SUCCESS', 'Registration successful'),
(81, 142, 'e42243234', '2024-08-15 03:03:59', 'SUCCESS', 'Registration successful'),
(82, 143, 'e42243234', '2024-08-15 03:04:37', 'SUCCESS', 'Register and login successful');

-- --------------------------------------------------------

--
-- Table structure for table `register_login`
--

CREATE TABLE `register_login` (
  `no` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `check_in` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_login`
--

INSERT INTO `register_login` (`no`, `student_id`, `check_in`) VALUES
(9, 'E41220493', '2024-08-14 22:13:14'),
(10, 'E32230095', '2024-08-14 22:34:51'),
(11, 'E32230095', '2024-08-14 22:36:25'),
(12, 'E42222247', '2024-08-15 08:30:46'),
(13, 'E31230333', '2024-08-15 08:32:26'),
(14, 'E55555', '2024-08-15 08:37:55'),
(15, 'e20230', '2024-08-15 08:49:05'),
(16, 'E55555', '2024-08-15 08:50:51'),
(17, 'E55555', '2024-08-15 09:05:37'),
(18, 'E55555', '2024-08-15 09:59:31'),
(19, 'e42243234', '2024-08-15 10:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `name`, `phone_number`, `department`) VALUES
(154, 'E41220493', 'Kimi Dandy Yudanarko', '085210035577', 'Information Technology'),
(155, 'E32230095', 'Karunia Dwi ', '081252883022', 'Computer Engineering'),
(156, 'E42222247', 'Eza Anom', '081231243131', 'Information Management'),
(157, 'E31230333', 'Umrotul Farika', '0812334452', 'Information Management'),
(158, 'dasd', 'asdasd', 'dsada', 'Computer Engineering'),
(159, 'E55555', 'Semin Kim', '234', 'Information Management'),
(160, 'e20230', 'Park hyerim', '01073878577', 'Information Technology'),
(161, 'E55555', 'HoyongLee', '085210035577', 'Computer Engineering'),
(162, 'e42243234', 'eza anom muflichin', '0983243141', 'Digital Business');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fingerprints`
--
ALTER TABLE `fingerprints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register_login`
--
ALTER TABLE `register_login`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fingerprints`
--
ALTER TABLE `fingerprints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `register_login`
--
ALTER TABLE `register_login`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
