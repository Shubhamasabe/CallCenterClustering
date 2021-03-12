-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2021 at 02:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `callcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `stopwords`
--

CREATE TABLE `stopwords` (
  `id` int(11) NOT NULL,
  `words` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stopwords`
--

INSERT INTO `stopwords` (`id`, `words`) VALUES
(1, 'a'),
(2, 'about'),
(3, 'above'),
(4, 'after'),
(5, 'again'),
(6, 'against'),
(7, 'all'),
(8, 'am'),
(9, 'an'),
(10, 'and'),
(11, 'any'),
(12, 'are'),
(13, 'aren\'t'),
(14, 'as'),
(15, 'at'),
(16, 'be'),
(17, 'because'),
(18, 'been'),
(19, 'before'),
(20, 'being'),
(21, 'below'),
(22, 'between'),
(23, 'both'),
(24, 'but'),
(25, 'by'),
(26, 'can\'t'),
(27, 'cannot'),
(28, 'could'),
(29, 'couldn\'t'),
(30, 'did'),
(31, 'didn\'t'),
(32, 'do'),
(33, 'does'),
(34, 'doesn\'t'),
(35, 'doing'),
(36, 'don\'t'),
(37, 'down'),
(38, 'during'),
(39, 'each'),
(40, 'few'),
(41, 'for'),
(42, 'from'),
(43, 'further'),
(44, 'had'),
(45, 'hadn\'t'),
(46, 'has'),
(47, 'hasn\'t'),
(48, 'have'),
(49, 'haven\'t'),
(50, 'having'),
(51, 'he'),
(52, 'he\'d'),
(53, 'he\'ll'),
(54, 'he\'s'),
(55, 'her'),
(56, 'here'),
(57, 'here\'s'),
(58, 'hers'),
(59, 'herself'),
(60, 'him'),
(61, 'himself'),
(62, 'his'),
(63, 'how'),
(64, 'how\'s'),
(65, 'i'),
(66, 'i\'d'),
(67, 'i\'ll'),
(68, 'i\'m'),
(69, 'i\'ve'),
(70, 'if'),
(71, 'in'),
(72, 'into'),
(73, 'is'),
(74, 'isn\'t'),
(75, 'it'),
(76, 'it\'s'),
(77, 'its'),
(78, 'itself'),
(79, 'let\'s'),
(80, 'me'),
(81, 'more'),
(82, 'most'),
(83, 'mustn\'t'),
(84, 'my'),
(85, 'myself'),
(86, 'no'),
(87, 'nor'),
(88, 'not'),
(89, 'of'),
(90, 'off'),
(91, 'on'),
(92, 'once'),
(93, 'only'),
(94, 'or'),
(95, 'other'),
(96, 'ought'),
(97, 'our'),
(98, 'ours'),
(99, 'out'),
(100, 'over'),
(101, 'own'),
(102, 'same'),
(103, 'shan\'t'),
(104, 'she'),
(105, 'she\'d'),
(106, 'she\'ll'),
(107, 'she\'s'),
(108, 'should'),
(109, 'shouldn\'t'),
(110, 'so'),
(111, 'some'),
(112, 'such'),
(113, 'than'),
(114, 'that'),
(115, 'that\'s'),
(116, 'the'),
(117, 'their'),
(118, 'theirs'),
(119, 'them'),
(120, 'themselves'),
(121, 'then'),
(122, 'there'),
(123, 'there\'s'),
(124, 'these'),
(125, 'they'),
(126, 'they\'d'),
(127, 'they\'ll'),
(128, 'they\'re'),
(129, 'they\'ve'),
(130, 'this'),
(131, 'those'),
(132, 'through'),
(133, 'to'),
(134, 'too'),
(135, 'under'),
(136, 'until'),
(137, 'up'),
(138, 'very'),
(139, 'was'),
(140, 'wasn\'t'),
(141, 'we'),
(142, 'we\'d'),
(143, 'we\'ll'),
(144, 'we\'re'),
(145, 'we\'ve'),
(146, 'were'),
(147, 'weren\'t'),
(148, 'what'),
(149, 'what\'s'),
(150, 'when'),
(151, 'when\'s'),
(152, 'where'),
(153, 'where\'s'),
(154, 'which'),
(155, 'while'),
(156, 'who'),
(157, 'who\'s'),
(158, 'whom'),
(159, 'why'),
(160, 'why\'s'),
(161, 'with'),
(162, 'won\'t'),
(163, 'would'),
(164, 'wouldn\'t'),
(165, 'you'),
(166, 'you\'d'),
(167, 'you\'ll'),
(168, 'you\'re'),
(169, 'you\'ve'),
(170, 'your'),
(171, 'yours'),
(172, 'yourself'),
(173, 'yourselves'),
(174, 'today');

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `e_id` int(11) NOT NULL,
  `e_fname` varchar(100) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`e_id`, `e_fname`, `mobile`) VALUES
(1, 'Ritesh SURANGE', '8087808760'),
(2, 'Monika meshram', '9870987078'),
(4, 'Sujit', '8087808790'),
(5, 'Dipali Rathod', '8900089000'),
(6, 'Ritesh SURANGE', '8275329929'),
(7, 'Ritesh SURANGE', '8087808760'),
(8, 'Ritesh', '8900089000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stopwords`
--
ALTER TABLE `stopwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`e_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stopwords`
--
ALTER TABLE `stopwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
