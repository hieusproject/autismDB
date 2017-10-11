-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2017 at 05:08 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autismdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `career_type`
--

CREATE TABLE `career_type` (
  `career_id` int(11) NOT NULL,
  `career_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `career_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `fullName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date_of_birth` datetime DEFAULT NULL,
  `father_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `mother_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `extra_info_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_child`
--

CREATE TABLE `child_child` (
  `c_id1` int(11) DEFAULT NULL,
  `similarity` float DEFAULT NULL,
  `c_id2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_solution`
--

CREATE TABLE `child_solution` (
  `c_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_solution_recommend`
--

CREATE TABLE `child_solution_recommend` (
  `c_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `ex_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `test_rule_id` int(11) DEFAULT NULL,
  `exam_result` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extra_info`
--

CREATE TABLE `extra_info` (
  `c_id` int(11) DEFAULT NULL,
  `fater_career_id` int(11) DEFAULT NULL,
  `divorce_status` tinyint(1) DEFAULT NULL,
  `mother_career_id` int(11) DEFAULT NULL,
  `monthly_income` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income_type`
--

CREATE TABLE `income_type` (
  `income_id` int(11) NOT NULL,
  `range` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `s_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `s_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `s_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `s_picture` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `solution_like`
--

CREATE TABLE `solution_like` (
  `s_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `ex_id` int(11) DEFAULT NULL,
  `result_test` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_rule`
--

CREATE TABLE `test_rule` (
  `test_rule_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_rule_detail`
--

CREATE TABLE `test_rule_detail` (
  `detail_id` int(11) NOT NULL,
  `test_rule_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_type`
--

CREATE TABLE `test_type` (
  `type_id` int(11) NOT NULL,
  `type_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question_src` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `tk_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `token` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`tk_id`, `u_id`, `token`) VALUES
(1, 2, 'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35'),
(2, 2, '62f67d43ced797b39b090dcd8ff61541cefeb3a5b841116a87ee7a6cd5326eaf'),
(3, 2, '566dfba2886807e0767882cdde813e312b0ddb525f76084d11db94e94f48c5e2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `userName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `phone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `age` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `userName`, `password`, `fullName`, `address`, `phone`, `email`, `age`, `date_created`, `role`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Nguy?n Admin', 'QN', '0976679753', 'adcm.edu@gmail', '1994-01-05 00:00:00', '2017-10-08 00:00:00', 0),
(2, 'user01', 'aad415a73c4cef1ef94a5c00b2642b571a3e5494536328ad960db61889bd9368', 'Nguyễn Khắc Ẩn', NULL, NULL, NULL, NULL, NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career_type`
--
ALTER TABLE `career_type`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `child_fk0` (`u_id`);

--
-- Indexes for table `child_child`
--
ALTER TABLE `child_child`
  ADD KEY `child_child_fk0` (`c_id1`),
  ADD KEY `child_child_fk1` (`c_id2`);

--
-- Indexes for table `child_solution`
--
ALTER TABLE `child_solution`
  ADD KEY `child_solution_fk0` (`c_id`),
  ADD KEY `child_solution_fk1` (`s_id`);

--
-- Indexes for table `child_solution_recommend`
--
ALTER TABLE `child_solution_recommend`
  ADD KEY `c_id` (`c_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `examination_fk0` (`c_id`),
  ADD KEY `examination_fk1` (`test_rule_id`);

--
-- Indexes for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD KEY `extra_info_fk0` (`c_id`),
  ADD KEY `extra_info_fk1` (`fater_career_id`),
  ADD KEY `extra_info_fk2` (`mother_career_id`),
  ADD KEY `extra_info_fk3` (`monthly_income`);

--
-- Indexes for table `income_type`
--
ALTER TABLE `income_type`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `solution`
--
ALTER TABLE `solution`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `solution_fk0` (`u_id`);

--
-- Indexes for table `solution_like`
--
ALTER TABLE `solution_like`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `test_fk0` (`type_id`);

--
-- Indexes for table `test_rule`
--
ALTER TABLE `test_rule`
  ADD PRIMARY KEY (`test_rule_id`);

--
-- Indexes for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `test_rule_detail_fk0` (`test_rule_id`),
  ADD KEY `test_rule_detail_fk1` (`type_id`);

--
-- Indexes for table `test_type`
--
ALTER TABLE `test_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`tk_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career_type`
--
ALTER TABLE `career_type`
  MODIFY `career_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `examination`
--
ALTER TABLE `examination`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_type`
--
ALTER TABLE `income_type`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solution`
--
ALTER TABLE `solution`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_rule`
--
ALTER TABLE `test_rule`
  MODIFY `test_rule_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_type`
--
ALTER TABLE `test_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `tk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_fk0` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `child_child`
--
ALTER TABLE `child_child`
  ADD CONSTRAINT `child_child_fk0` FOREIGN KEY (`c_id1`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `child_child_fk1` FOREIGN KEY (`c_id2`) REFERENCES `child` (`c_id`);

--
-- Constraints for table `child_solution`
--
ALTER TABLE `child_solution`
  ADD CONSTRAINT `child_solution_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `child_solution_fk1` FOREIGN KEY (`s_id`) REFERENCES `solution` (`s_id`);

--
-- Constraints for table `child_solution_recommend`
--
ALTER TABLE `child_solution_recommend`
  ADD CONSTRAINT `child_solution_recommend_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `child_solution_recommend_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `solution` (`s_id`);

--
-- Constraints for table `examination`
--
ALTER TABLE `examination`
  ADD CONSTRAINT `examination_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `examination_fk1` FOREIGN KEY (`test_rule_id`) REFERENCES `test_rule` (`test_rule_id`);

--
-- Constraints for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD CONSTRAINT `extra_info_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `extra_info_fk1` FOREIGN KEY (`fater_career_id`) REFERENCES `career_type` (`career_id`),
  ADD CONSTRAINT `extra_info_fk2` FOREIGN KEY (`mother_career_id`) REFERENCES `career_type` (`career_id`),
  ADD CONSTRAINT `extra_info_fk3` FOREIGN KEY (`monthly_income`) REFERENCES `income_type` (`income_id`);

--
-- Constraints for table `solution`
--
ALTER TABLE `solution`
  ADD CONSTRAINT `solution_fk0` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `solution_like`
--
ALTER TABLE `solution_like`
  ADD CONSTRAINT `solution_like_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `solution` (`s_id`),
  ADD CONSTRAINT `solution_like_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_fk0` FOREIGN KEY (`type_id`) REFERENCES `test_type` (`type_id`);

--
-- Constraints for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  ADD CONSTRAINT `test_rule_detail_fk0` FOREIGN KEY (`test_rule_id`) REFERENCES `test_rule` (`test_rule_id`),
  ADD CONSTRAINT `test_rule_detail_fk1` FOREIGN KEY (`type_id`) REFERENCES `test_type` (`type_id`);

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
