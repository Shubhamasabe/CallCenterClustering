-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 03, 2021 at 08:38 AM
-- Server version: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freedbtech_callcenterclustering`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`freedbtech_shubhamads`@`%` PROCEDURE `explode_table` (`bound` VARCHAR(255))  BEGIN

DECLARE id INT DEFAULT 0;
DECLARE value TEXT;
DECLARE occurance INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
DECLARE splitted_value INT;
DECLARE done INT DEFAULT 0;
DECLARE cur1 CURSOR FOR SELECT table1.id, table1.value
                                     FROM table1
                                     WHERE table1.value != '';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

DROP TEMPORARY TABLE IF EXISTS table2;
CREATE TEMPORARY TABLE table2(
`id` INT NOT NULL,
`value` VARCHAR(255) NOT NULL
) ENGINE=Memory;

OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO id, value;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET occurance = (SELECT LENGTH(value)
                             - LENGTH(REPLACE(value, bound, ''))
                             +1);
    SET i=1;
    WHILE i <= occurance DO
      SET splitted_value =
      (SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(value, bound, i),
      LENGTH(SUBSTRING_INDEX(value, bound, i - 1)) + 1), '$', ''));

      INSERT INTO table2 VALUES (id, splitted_value);
      SET i = i + 1;

    END WHILE;
  END LOOP;

  SELECT * FROM table2;
 CLOSE cur1;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'rohan', 'rohan'),
(3, 'sanket', 'sanket123'),
(4, 'Vipul', 'vipul@123'),
(5, 'shubham', 'shubham123');

-- --------------------------------------------------------

--
-- Table structure for table `all_request`
--

CREATE TABLE `all_request` (
  `r_id` int(11) NOT NULL,
  `dept_name` varchar(300) DEFAULT NULL,
  `msg_request` text,
  `user_id` varchar(30) DEFAULT NULL,
  `c_date_time` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_request`
--

INSERT INTO `all_request` (`r_id`, `dept_name`, `msg_request`, `user_id`, `c_date_time`) VALUES
(1, 'Breakdown', 'i want repair the car', '8275329929', '07/06/2021 08:26:44'),
(9, 'Breakdown', 'i want repair the car', '8275329929', '07/06/2021 08:56:44'),
(10, 'Breakdown', 'i want repair the car', '8275329929', '07/06/2021 08:57:56'),
(11, 'Breakdown', 'i want repair the car', '8275329929', '07/06/2021 08:58:44'),
(13, 'Test drive requests', 'i want to test drive a car', '8087373288', '07/06/2021 10:22:30'),
(14, 'Breakdown', 'i want repair my car', '8087373288', '07/06/2021 10:24:00'),
(15, 'Breakdown', '', '8308939752', '12/06/2021 00:01:47'),
(16, 'Breakdown', 'hello i want to buy a car', '8308939752', '12/06/2021 00:02:07'),
(18, 'Breakdown', 'hello i want to buy a car', '8308939752', '12/06/2021 00:06:38'),
(19, 'Breakdown', 'hello', '8308939752', '12/06/2021 00:23:09'),
(20, 'Breakdown', 'hello but car', '8308939752', '12/06/2021 00:43:09'),
(21, 'Not_Found', 'hi', '8308939752', '12/06/2021 00:46:26'),
(23, 'Not_Found', 'hi', '8308939752', '12/06/2021 01:02:19'),
(24, 'Not_Found', 'hi', '8308939752', '12/06/2021 01:03:29'),
(25, 'No Department Found_0', 'hi', '8308939752', '12/06/2021 01:05:26'),
(27, 'No Department Found_0', 'hi', '8308939752', '12/06/2021 01:10:02'),
(29, 'New Vehicle Purchase Enquiries', 'hi i wanted to buy a car', '8087373288', '12/06/2021 12:59:24'),
(30, 'New Vehicle Purchase Enquiries', 'hi i want to buy a car', '8308939752', '12/06/2021 14:34:22'),
(31, 'Breakdown', 'hi i want to repair my car', '8308939752', '12/06/2021 14:38:02'),
(32, 'Feedback', 'thank you', '8308939752', '12/06/2021 14:38:32'),
(33, 'New Vehicle Purchase Enquiries', 'hello i want to buy car', '8308939752', '26/06/2021 05:04:53'),
(34, 'New Vehicle Purchase Enquiries', 'hello i want to buy the car', '8308939752', '26/06/2021 07:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `data_bank`
--

CREATE TABLE `data_bank` (
  `id` int(11) NOT NULL,
  `d_name` varchar(100) DEFAULT NULL,
  `keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_bank`
--

INSERT INTO `data_bank` (`id`, `d_name`, `keywords`) VALUES
(1, 'New Vehicle Purchase Enquiries', 'price availability features enquiry closest showroom purchase  buy exchange  wanted  buy  buy  buy'),
(2, 'Test drive requests', 'Test drive test  try out check  trial	  car drive test want  analysis approval\r\nassessment attempt check evaluation\r\nexperiment inquiry inspection\r\ninvestigation search standard trial\r\n'),
(3, 'Breakdown', 'broke  break down  broke down Urgent Repairs urgent  repair  Nearest garage  servicing  service  issue problem repair breakdown computer malfunction defect error failure fault flaw\r\nproblem something wrong trouble  repair'),
(4, 'Feedback', 'Thanks Thank Thanks Lot Nice best  thank');

-- --------------------------------------------------------

--
-- Table structure for table `stopwords`
--

CREATE TABLE `stopwords` (
  `id` int(11) NOT NULL,
  `words` varchar(100) DEFAULT NULL
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
(153, 'hi'),
(154, 'which'),
(155, 'while'),
(156, 'who'),
(157, 'who\'s'),
(158, 'whom'),
(159, 'why'),
(160, 'hello'),
(161, 'with'),
(162, 'won\'t'),
(163, 'would'),
(164, 'wouldn\'t'),
(165, 'you'),
(166, 'you\'d'),
(167, 'you\'ll'),
(168, 'you\'re'),
(169, 'car'),
(170, 'your'),
(171, 'yours'),
(172, 'yourself'),
(173, 'yourselves'),
(174, 'today'),
(1, 'about'),
(2, 'above'),
(3, 'according'),
(4, 'accordingly'),
(5, 'across'),
(6, 'actually'),
(7, 'after'),
(8, 'afterwards'),
(9, 'again'),
(10, 'against'),
(11, 'ain’t'),
(12, 'all'),
(13, 'allow'),
(14, 'allows'),
(15, 'almost'),
(16, 'alone'),
(17, 'along'),
(18, 'already'),
(19, 'also'),
(20, 'although'),
(21, 'always'),
(22, 'am'),
(23, 'among'),
(24, 'amongst'),
(25, 'an'),
(26, 'and'),
(27, 'another'),
(28, 'any'),
(29, 'anybody'),
(30, 'anyhow'),
(31, 'anyone'),
(32, 'anything'),
(33, 'anyway'),
(34, 'anyways'),
(35, 'anywhere'),
(36, 'apart'),
(37, 'appear'),
(38, 'appreciate'),
(39, 'appropriate'),
(40, 'are'),
(41, 'aren’t'),
(42, 'around'),
(43, 'as'),
(44, 'aside'),
(45, 'ask'),
(46, 'asking'),
(47, 'associated'),
(48, 'at'),
(49, 'available'),
(50, 'away'),
(51, 'awfully'),
(52, 'be'),
(53, 'became'),
(54, 'because'),
(55, 'become'),
(56, 'becomes'),
(57, 'becoming'),
(58, 'been'),
(59, 'before'),
(60, 'beforehand'),
(61, 'behind'),
(62, 'being'),
(63, 'believe'),
(64, 'below'),
(65, 'beside'),
(66, 'besides'),
(67, 'best'),
(68, 'better'),
(69, 'between'),
(70, 'beyond'),
(71, 'both'),
(72, 'brief'),
(73, 'but'),
(74, 'by'),
(75, 'c’mon'),
(76, 'c’s'),
(77, 'came'),
(78, 'can'),
(79, 'can’t'),
(80, 'cannot'),
(81, 'cant'),
(82, 'cause'),
(83, 'causes'),
(84, 'certain'),
(85, 'certainly'),
(86, 'changes'),
(87, 'clearly'),
(88, 'co'),
(89, 'com'),
(90, 'come'),
(91, 'comes'),
(92, 'concerning'),
(93, 'consequently'),
(94, 'consider'),
(95, 'considering'),
(96, 'contain'),
(97, 'containing'),
(98, 'contains'),
(99, 'corresponding'),
(100, 'could'),
(101, 'couldn’t'),
(102, 'course'),
(103, 'currently'),
(104, 'definitely'),
(105, 'described'),
(106, 'despite'),
(107, 'did'),
(108, 'didn’t'),
(109, 'different'),
(110, 'do'),
(111, 'does'),
(112, 'doesn’t'),
(113, 'doing'),
(114, 'don’t'),
(115, 'done'),
(116, 'down'),
(117, 'downwards'),
(118, 'during'),
(119, 'each'),
(120, 'edu'),
(121, 'eg'),
(122, 'eight'),
(123, 'either'),
(124, 'else'),
(125, 'elsewhere'),
(126, 'enough'),
(127, 'entirely'),
(128, 'especially'),
(129, 'et'),
(130, 'etc'),
(131, 'even'),
(132, 'ever'),
(133, 'every'),
(134, 'everybody'),
(135, 'everyone'),
(136, 'everything'),
(137, 'everywhere'),
(138, 'ex'),
(139, 'exactly'),
(140, 'example'),
(141, 'except'),
(142, 'far'),
(143, 'few'),
(144, 'fifth'),
(145, 'first'),
(146, 'five'),
(147, 'followed'),
(148, 'following'),
(149, 'follows'),
(150, 'for'),
(151, 'former'),
(152, 'formerly'),
(153, 'forth'),
(154, 'four'),
(155, 'from'),
(156, 'further'),
(157, 'furthermore'),
(158, 'get'),
(159, 'gets'),
(160, 'getting'),
(161, 'given'),
(162, 'gives'),
(163, 'go'),
(164, 'goes'),
(165, 'going'),
(166, 'gone'),
(167, 'got'),
(168, 'gotten'),
(169, 'greetings'),
(170, 'had'),
(171, 'hadn’t'),
(172, 'happens'),
(173, 'hardly'),
(174, 'has'),
(175, 'hasn’t'),
(176, 'have'),
(177, 'haven’t'),
(178, 'having'),
(179, 'he'),
(180, 'he’s'),
(181, 'hello'),
(182, 'help'),
(183, 'hence'),
(184, 'her'),
(185, 'here'),
(186, 'here’s'),
(187, 'hereafter'),
(188, 'hereby'),
(189, 'herein'),
(190, 'hereupon'),
(191, 'hers'),
(192, 'herself'),
(193, 'hi'),
(194, 'him'),
(195, 'himself'),
(196, 'his'),
(197, 'hither'),
(198, 'hopefully'),
(199, 'how'),
(200, 'howbeit'),
(201, 'however'),
(202, 'i’d'),
(203, 'i’ll'),
(204, 'i’m'),
(205, 'i’ve'),
(206, 'ie'),
(207, 'if'),
(208, 'ignored'),
(209, 'immediate'),
(210, 'in'),
(211, 'inasmuch'),
(212, 'inc'),
(213, 'indeed'),
(214, 'indicate'),
(215, 'indicated'),
(216, 'indicates'),
(217, 'inner'),
(218, 'insofar'),
(219, 'instead'),
(220, 'into'),
(221, 'inward'),
(222, 'is'),
(223, 'isn’t'),
(224, 'it'),
(225, 'it’d'),
(226, 'it’ll'),
(227, 'it’s'),
(228, 'its'),
(229, 'itself'),
(230, 'just'),
(231, 'keep'),
(232, 'keeps'),
(233, 'kept'),
(234, 'know'),
(235, 'known'),
(236, 'knows'),
(237, 'last'),
(238, 'lately'),
(239, 'later'),
(240, 'latter'),
(241, 'latterly'),
(242, 'least'),
(243, 'less'),
(244, 'lest'),
(245, 'let'),
(246, 'let’s'),
(247, 'like'),
(248, 'liked'),
(249, 'likely'),
(250, 'little'),
(251, 'look'),
(252, 'looking'),
(253, 'looks'),
(254, 'ltd'),
(255, 'mainly'),
(256, 'many'),
(257, 'may'),
(258, 'maybe'),
(259, 'me'),
(260, 'mean'),
(261, 'meanwhile'),
(262, 'merely'),
(263, 'might'),
(264, 'more'),
(265, 'moreover'),
(266, 'most'),
(267, 'mostly'),
(268, 'much'),
(269, 'must'),
(270, 'my'),
(271, 'myself'),
(272, 'name'),
(273, 'namely'),
(274, 'nd'),
(275, 'near'),
(276, 'nearly'),
(277, 'necessary'),
(278, 'need'),
(279, 'needs'),
(280, 'neither'),
(281, 'never'),
(282, 'nevertheless'),
(283, 'new'),
(284, 'next'),
(285, 'nine'),
(286, 'no'),
(287, 'nobody'),
(288, 'non'),
(289, 'none'),
(290, 'noone'),
(291, 'nor'),
(292, 'normally'),
(293, 'not'),
(294, 'nothing'),
(295, 'novel'),
(296, 'now'),
(297, 'nowhere'),
(298, 'obviously'),
(299, 'of'),
(300, 'off'),
(301, 'often'),
(302, 'oh'),
(303, 'ok'),
(304, 'okay'),
(305, 'old'),
(306, 'on'),
(307, 'once'),
(308, 'one'),
(309, 'ones'),
(310, 'only'),
(311, 'onto'),
(312, 'or'),
(313, 'other'),
(314, 'others'),
(315, 'otherwise'),
(316, 'ought'),
(317, 'our'),
(318, 'ours'),
(319, 'ourselves'),
(320, 'out'),
(321, 'outside'),
(322, 'over'),
(323, 'overall'),
(324, 'own'),
(325, 'particular'),
(326, 'particularly'),
(327, 'per'),
(328, 'perhaps'),
(329, 'placed'),
(330, 'please'),
(331, 'plus'),
(332, 'possible'),
(333, 'presumably'),
(334, 'probably'),
(335, 'provides'),
(336, 'que'),
(337, 'quite'),
(338, 'qv'),
(339, 'rather'),
(340, 'rd'),
(341, 're'),
(342, 'really'),
(343, 'reasonably'),
(344, 'regarding'),
(345, 'regardless'),
(346, 'regards'),
(347, 'relatively'),
(348, 'respectively'),
(349, 'right'),
(350, 'said'),
(351, 'same'),
(352, 'saw'),
(353, 'say'),
(354, 'saying'),
(355, 'says'),
(356, 'second'),
(357, 'secondly'),
(358, 'see'),
(359, 'seeing'),
(360, 'seem'),
(361, 'seemed'),
(362, 'seeming'),
(363, 'seems'),
(364, 'seen'),
(365, 'self'),
(366, 'selves'),
(367, 'sensible'),
(368, 'sent'),
(369, 'serious'),
(370, 'seriously'),
(371, 'seven'),
(372, 'several'),
(373, 'shall'),
(374, 'she'),
(375, 'should'),
(376, 'shouldn’t'),
(377, 'since'),
(378, 'six'),
(379, 'so'),
(380, 'some'),
(381, 'somebody'),
(382, 'somehow'),
(383, 'someone'),
(384, 'something'),
(385, 'sometime'),
(386, 'sometimes'),
(387, 'somewhat'),
(388, 'somewhere'),
(389, 'soon'),
(390, 'sorry'),
(391, 'specified'),
(392, 'specify'),
(393, 'specifying'),
(394, 'still'),
(395, 'sub'),
(396, 'such'),
(397, 'sup'),
(398, 'sure'),
(399, 't’s'),
(400, 'take'),
(401, 'taken'),
(402, 'tell'),
(403, 'tends'),
(404, 'th'),
(405, 'than'),
(409, 'that'),
(410, 'that’s'),
(411, 'thats'),
(412, 'the'),
(413, 'their'),
(414, 'theirs'),
(415, 'them'),
(416, 'themselves'),
(417, 'then'),
(418, 'thence'),
(419, 'there'),
(420, 'there’s'),
(421, 'thereafter'),
(422, 'thereby'),
(423, 'therefore'),
(424, 'therein'),
(425, 'theres'),
(426, 'thereupon'),
(427, 'these'),
(428, 'they'),
(429, 'they’d'),
(430, 'they’ll'),
(431, 'they’re'),
(432, 'they’ve'),
(433, 'think'),
(434, 'third'),
(435, 'this'),
(436, 'thorough'),
(437, 'thoroughly'),
(438, 'those'),
(439, 'though'),
(440, 'three'),
(441, 'through'),
(442, 'throughout'),
(443, 'thru'),
(444, 'thus'),
(445, 'to'),
(446, 'together'),
(447, 'too'),
(448, 'took'),
(449, 'toward'),
(450, 'towards'),
(451, 'tried'),
(452, 'tries'),
(453, 'truly'),
(454, 'try'),
(455, 'trying'),
(456, 'twice'),
(457, 'two'),
(458, 'un'),
(459, 'under'),
(460, 'unfortunately'),
(461, 'unless'),
(462, 'unlikely'),
(463, 'until'),
(464, 'unto'),
(465, 'up'),
(466, 'upon'),
(467, 'us'),
(468, 'use'),
(469, 'used'),
(470, 'useful'),
(471, 'uses'),
(472, 'using'),
(473, 'usually'),
(474, 'value'),
(475, 'various'),
(476, 'very'),
(477, 'via'),
(478, 'viz'),
(479, 'vs'),
(480, 'want'),
(481, 'wants'),
(482, 'was'),
(483, 'wasn’t'),
(484, 'way'),
(485, 'we'),
(486, 'we’d'),
(487, 'we’ll'),
(488, 'we’re'),
(489, 'we’ve'),
(490, 'welcome'),
(491, 'well'),
(492, 'went'),
(493, 'were'),
(494, 'weren’t'),
(495, 'what'),
(496, 'what’s'),
(497, 'whatever'),
(498, 'when'),
(499, 'whence'),
(500, 'whenever'),
(501, 'where'),
(502, 'where’s'),
(503, 'whereafter'),
(504, 'whereas'),
(505, 'whereby'),
(506, 'wherein'),
(507, 'whereupon'),
(508, 'wherever'),
(509, 'whether'),
(510, 'which'),
(511, 'while'),
(512, 'whither'),
(513, 'who'),
(514, 'who’s'),
(515, 'whoever'),
(516, 'whole'),
(517, 'whom'),
(518, 'whose'),
(519, 'why'),
(520, 'will'),
(521, 'willing'),
(522, 'wish'),
(523, 'with'),
(524, 'within'),
(525, 'without'),
(526, 'won’t'),
(527, 'wonder'),
(528, 'would'),
(529, 'wouldn’t'),
(530, 'yes'),
(531, 'yet'),
(532, 'you'),
(533, 'you’d'),
(534, 'you’ll'),
(535, 'you’re'),
(536, 'you’ve'),
(537, 'your'),
(538, 'yours'),
(539, 'yourself'),
(540, 'yourselves'),
(541, 'zero');

-- --------------------------------------------------------

--
-- Table structure for table `table1`
--

CREATE TABLE `table1` (
  `id` int(11) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table1`
--

INSERT INTO `table1` (`id`, `value`) VALUES
(1, 'a’s$able$about$above$according$accordingly$across$actually$after$afterwards$again$against$ain’t$all$allow$allows$almost$alone$along$already$also$although$always$am$among$amongst$an$and$another$any$anybody$anyhow$anyone$anything$anyway$anyways$anywhere$apart$appear$appreciate$appropriate$are$aren’t$around$as$aside$ask$asking$associated$at$available$away$awfully$be$became$because$become$becomes$becoming$been$before$beforehand$behind$being$believe$below$beside$besides$best$better$between$beyond$both$brief$but$by$c’mon$c’s$came$can$can’t$cannot$cant$cause$causes$certain$certainly$changes$clearly$co$com$come$comes$concerning$consequently$consider$considering$contain$containing$contains$corresponding$could$couldn’t$course$currently$definitely$described$despite$did$didn’t$different$do$does$doesn’t$doing$don’t$done$down$downwards$during$each$edu$eg$eight$either$else$elsewhere$enough$entirely$especially$et$etc$even$ever$every$everybody$everyone$everything$everywhere$ex$exactly$example$except$far$few$fifth$first$five$followed$following$follows$for$former$formerly$forth$four$from$further$furthermore$get$gets$getting$given$gives$go$goes$going$gone$got$gotten$greetings$had$hadn’t$happens$hardly$has$hasn’t$have$haven’t$having$he$he’s$hello$help$hence$her$here$here’s$hereafter$hereby$herein$hereupon$hers$herself$hi$him$himself$his$hither$hopefully$how$howbeit$however$i’d$i’ll$i’m$i’ve$ie$if$ignored$immediate$in$inasmuch$inc$indeed$indicate$indicated$indicates$inner$insofar$instead$into$inward$is$isn’t$it$it’d$it’ll$it’s$its$itself$just$keep$keeps$kept$know$known$knows$last$lately$later$latter$latterly$least$less$lest$let$let’s$like$liked$likely$little$look$looking$looks$ltd$mainly$many$may$maybe$me$mean$meanwhile$merely$might$more$moreover$most$mostly$much$must$my$myself$name$namely$nd$near$nearly$necessary$need$needs$neither$never$nevertheless$new$next$nine$no$nobody$non$none$noone$nor$normally$not$nothing$novel$now$nowhere$obviously$of$off$often$oh$ok$okay$old$on$once$one$ones$only$onto$or$other$others$otherwise$ought$our$ours$ourselves$out$outside$over$overall$own$particular$particularly$per$perhaps$placed$please$plus$possible$presumably$probably$provides$que$quite$qv$rather$rd$re$really$reasonably$regarding$regardless$regards$relatively$respectively$right$said$same$saw$say$saying$says$second$secondly$see$seeing$seem$seemed$seeming$seems$seen$self$selves$sensible$sent$serious$seriously$seven$several$shall$she$should$shouldn’t$since$six$so$some$somebody$somehow$someone$something$sometime$sometimes$somewhat$somewhere$soon$sorry$specified$specify$specifying$still$sub$such$sup$sure$t’s$take$taken$tell$tends$th$than$thank$thanks$thanx$that$that’s$thats$the$their$theirs$them$themselves$then$thence$there$there’s$thereafter$thereby$therefore$therein$theres$thereupon$these$they$they’d$they’ll$they’re$they’ve$think$third$this$thorough$thoroughly$those$though$three$through$throughout$thru$thus$to$together$too$took$toward$towards$tried$tries$truly$try$trying$twice$two$un$under$unfortunately$unless$unlikely$until$unto$up$upon$us$use$used$useful$uses$using$usually$value$various$very$via$viz$vs$want$wants$was$wasn’t$way$we$we’d$we’ll$we’re$we’ve$welcome$well$went$were$weren’t$what$what’s$whatever$when$whence$whenever$where$where’s$whereafter$whereas$whereby$wherein$whereupon$wherever$whether$which$while$whither$who$who’s$whoever$whole$whom$whose$why$will$willing$wish$with$within$without$won’t$wonder$would$wouldn’t$yes$yet$you$you’d$you’ll$you’re$you’ve$your$yours$yourself$yourselves$zero'),
(2, 'a’s,able,about,above,according,accordingly,across,actually,after,afterwards,again,against,ain’t,all,allow,allows,almost,alone,along,already,also,although,always,am,among,amongst,an,and,another,any,anybody,anyhow,anyone,anything,anyway,anyways,anywhere,apart,appear,appreciate,appropriate,are,aren’t,around,as,aside,ask,asking,associated,at,available,away,awfully,be,became,because,become,becomes,becoming,been,before,beforehand,behind,being,believe,below,beside,besides,best,better,between,beyond,both,brief,but,by,c’mon,c’s,came,can,can’t,cannot,cant,cause,causes,certain,certainly,changes,clearly,co,com,come,comes,concerning,consequently,consider,considering,contain,containing,contains,corresponding,could,couldn’t,course,currently,definitely,described,despite,did,didn’t,different,do,does,doesn’t,doing,don’t,done,down,downwards,during,each,edu,eg,eight,either,else,elsewhere,enough,entirely,especially,et,etc,even,ever,every,everybody,everyone,everything,everywhere,ex,exactly,example,except,far,few,fifth,first,five,followed,following,follows,for,former,formerly,forth,four,from,further,furthermore,get,gets,getting,given,gives,go,goes,going,gone,got,gotten,greetings,had,hadn’t,happens,hardly,has,hasn’t,have,haven’t,having,he,he’s,hello,help,hence,her,here,here’s,hereafter,hereby,herein,hereupon,hers,herself,hi,him,himself,his,hither,hopefully,how,howbeit,however,i’d,i’ll,i’m,i’ve,ie,if,ignored,immediate,in,inasmuch,inc,indeed,indicate,indicated,indicates,inner,insofar,instead,into,inward,is,isn’t,it,it’d,it’ll,it’s,its,itself,just,keep,keeps,kept,know,known,knows,last,lately,later,latter,latterly,least,less,lest,let,let’s,like,liked,likely,little,look,looking,looks,ltd,mainly,many,may,maybe,me,mean,meanwhile,merely,might,more,moreover,most,mostly,much,must,my,myself,name,namely,nd,near,nearly,necessary,need,needs,neither,never,nevertheless,new,next,nine,no,nobody,non,none,noone,nor,normally,not,nothing,novel,now,nowhere,obviously,of,off,often,oh,ok,okay,old,on,once,one,ones,only,onto,or,other,others,otherwise,ought,our,ours,ourselves,out,outside,over,overall,own,particular,particularly,per,perhaps,placed,please,plus,possible,presumably,probably,provides,que,quite,qv,rather,rd,re,really,reasonably,regarding,regardless,regards,relatively,respectively,right,said,same,saw,say,saying,says,second,secondly,see,seeing,seem,seemed,seeming,seems,seen,self,selves,sensible,sent,serious,seriously,seven,several,shall,she,should,shouldn’t,since,six,so,some,somebody,somehow,someone,something,sometime,sometimes,somewhat,somewhere,soon,sorry,specified,specify,specifying,still,sub,such,sup,sure,t’s,take,taken,tell,tends,th,than,thank,thanks,thanx,that,that’s,thats,the,their,theirs,them,themselves,then,thence,there,there’s,thereafter,thereby,therefore,therein,theres,thereupon,these,they,they’d,they’ll,they’re,they’ve,think,third,this,thorough,thoroughly,those,though,three,through,throughout,thru,thus,to,together,too,took,toward,towards,tried,tries,truly,try,trying,twice,two,un,under,unfortunately,unless,unlikely,until,unto,up,upon,us,use,used,useful,uses,using,usually,value,various,very,via,viz,vs,want,wants,was,wasn’t,way,we,we’d,we’ll,we’re,we’ve,welcome,well,went,were,weren’t,what,what’s,whatever,when,whence,whenever,where,where’s,whereafter,whereas,whereby,wherein,whereupon,wherever,whether,which,while,whither,who,who’s,whoever,whole,whom,whose,why,will,willing,wish,with,within,without,won’t,wonder,would,wouldn’t,yes,yet,you,you’d,you’ll,you’re,you’ve,your,yours,yourself,yourselves,zero');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`id`, `value`) VALUES
(1, 'a’s$able$about$above$according$accordingly$across$actually$after$afterwards$again$against$ain’t$all$allow$allows$almost$alone$along$already$also$although$always$am$among$amongst$an$and$another$any$anybody$anyhow$anyone$anything$anyway$anyways$anywhere$apart$appear$appreciate$appropriate$are$aren’t$around$as$aside$ask$asking$associated$at$available$away$awfully$be$became$because$become$becomes$becoming$been$before$beforehand$behind$being$believe$below$beside$besides$best$better$between$beyond$both$brief$but$by$c’mon$c’s$came$can$can’t$cannot$cant$cause$causes$certain$certainly$changes$clearly$co$com$come$comes$concerning$consequently$consider$considering$contain$containing$contains$corresponding$could$couldn’t$course$currently$definitely$described$despite$did$didn’t$different$do$does$doesn’t$doing$don’t$done$down$downwards$during$each$edu$eg$eight$either$else$elsewhere$enough$entirely$especially$et$etc$even$ever$every$everybody$everyone$everything$everywhere$ex$exactly$example$except$far$few$fifth$first$five$followed$following$follows$for$former$formerly$forth$four$from$further$furthermore$get$gets$getting$given$gives$go$goes$going$gone$got$gotten$greetings$had$hadn’t$happens$hardly$has$hasn’t$have$haven’t$having$he$he’s$hello$help$hence$her$here$here’s$hereafter$hereby$herein$hereupon$hers$herself$hi$him$himself$his$hither$hopefully$how$howbeit$however$i’d$i’ll$i’m$i’ve$ie$if$ignored$immediate$in$inasmuch$inc$indeed$indicate$indicated$indicates$inner$insofar$instead$into$inward$is$isn’t$it$it’d$it’ll$it’s$its$itself$just$keep$keeps$kept$know$known$knows$last$lately$later$latter$latterly$least$less$lest$let$let’s$like$liked$likely$little$look$looking$looks$ltd$mainly$many$may$maybe$me$mean$meanwhile$merely$might$more$moreover$most$mostly$much$must$my$myself$name$namely$nd$near$nearly$necessary$need$needs$neither$never$nevertheless$new$next$nine$no$nobody$non$none$noone$nor$normally$not$nothing$novel$now$nowhere$obviously$of$off$often$oh$ok$okay$old$on$once$one$ones$only$onto$or$other$others$otherwise$ought$our$ours$ourselves$out$outside$over$overall$own$particular$particularly$per$perhaps$placed$please$plus$possible$presumably$probably$provides$que$quite$qv$rather$rd$re$really$reasonably$regarding$regardless$regards$relatively$respectively$right$said$same$saw$say$saying$says$second$secondly$see$seeing$seem$seemed$seeming$seems$seen$self$selves$sensible$sent$serious$seriously$seven$several$shall$she$should$shouldn’t$since$six$so$some$somebody$somehow$someone$something$sometime$sometimes$somewhat$somewhere$soon$sorry$specified$specify$specifying$still$sub$such$sup$sure$t’s$take$taken$tell$tends$th$than$thank$thanks$thanx$that$that’s$thats$the$their$theirs$them$themselves$then$thence$there$there’s$thereafter$thereby$therefore$therein$theres$thereupon$these$they$they’d$they’ll$they’re$they’ve$think$third$this$thorough$thoroughly$those$though$three$through$throughout$thru$thus$to$together$too$took$toward$towards$tried$tries$truly$try$trying$twice$two$un$under$unfortunately$unless$unlikely$until$unto$up$upon$us$use$used$useful$uses$using$usually$value$various$very$via$viz$vs$want$wants$was$wasn’t$way$we$we’d$we’ll$we’re$we’ve$welcome$well$went$were$weren’t$what$what’s$whatever$when$whence$whenever$where$where’s$whereafter$whereas$whereby$wherein$whereupon$wherever$whether$which$while$whither$who$who’s$whoever$whole$whom$whose$why$will$willing$wish$with$within$without$won’t$wonder$would$wouldn’t$yes$yet$you$you’d$you’ll$you’re$you’ve$your$yours$yourself$yourselves$zero');

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
(1, 'harsh', '8087808760'),
(2, 'Vipul', '9870987078'),
(4, 'Sujit', '8087808790'),
(5, 'Dipali', '8900089000'),
(6, 'Ritu', '8275329929'),
(7, 'Ganesh', '8087808760'),
(8, 'Rahul', '8900089000'),
(9, 'Sanket', '8087373288'),
(11, 'Shubham Asabe', '8308939752');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_request`
--
ALTER TABLE `all_request`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `data_bank`
--
ALTER TABLE `data_bank`
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
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `all_request`
--
ALTER TABLE `all_request`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `data_bank`
--
ALTER TABLE `data_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
